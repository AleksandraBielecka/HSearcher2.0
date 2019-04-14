using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Data.SqlClient;
using System.Data;

namespace HSearcher2._0
{
    /// <summary>
    /// Logika interakcji dla klasy Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        private int? _currentEmployeeId;

        #region Konstruktory
        public Window1()
        {
            InitializeComponent();
            btn_SaveChanges.Visibility = Visibility.Hidden;
            btn_Delete.IsEnabled = false;
            ClearTextBoxes();
            LastNameList();
            DepartmentList();
            PhysiciansList();
            lbl_Status.Foreground = Brushes.Black;
            lbl_Status.Content = "Wyszukaj pacjenta lub dodaj nowego";
        }
        #endregion

        private void ClearTextBoxes()
        {
            tb_FirstName.Text = "";
            tb_LastName.Text = "";
            tb_Address.Text = "";
            tb_Telephone.Text = "";
            cb_Department.SelectedIndex = 0;
            tb_Email.Text = "";
            cb_PhysiciansList.SelectedIndex = 0;
            tb_Diagnosis.Text = "";
            cb_Search.SelectedIndex = 0;
            btn_SaveChanges.Visibility = Visibility.Hidden;
            lbl_Status.Foreground = Brushes.Black;
            lbl_Status.Content = "Wyszukaj pacjenta lub dodaj nowego";
        }

        private void Search_Click(object sender, RoutedEventArgs e)
        {
            if (this.cb_Search.SelectedValue != null)
            {
                bool IsLoaded = false;
                _currentEmployeeId = 0;
                string CS = @"data source=DESKTOP-E9EAAOK\SQLEXPRESS01;database=HospitalsPatients;integrated security=SSPI";
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Select top 1 ID, FirstName, LastName, Address, Telephone, Department, Email, Physician, Diagnosis from tblPatients  WHERE LastName = '" + cb_Search.SelectedValue.ToString() + "'", con);
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            var FirstName = rdr["FirstName"] as string;
                            var LastName = rdr["LastName"] as string;
                            var Address = rdr["Address"] as string;
                            var Telephone = rdr["Telephone"] as string;
                            var Department = rdr["Department"] as string;
                            var Email = rdr["Email"] as string;
                            var Physician = rdr["Physician"] as string;
                            var Diagnosis = rdr["Diagnosis"] as string;
                            tb_FirstName.Text = FirstName;
                            tb_LastName.Text = LastName;
                            tb_Address.Text = Address;
                            tb_Telephone.Text = Telephone;
                            cb_Department.Text = Department;
                            tb_Email.Text = Email;
                            cb_PhysiciansList.Text = Physician;
                            tb_Diagnosis.Text = Diagnosis;
                            _currentEmployeeId = Convert.ToInt32(rdr["ID"]);
                            IsLoaded = true;
                        }
                    }
                }

                if (IsLoaded)
                {
                    lbl_Status.Content = "Pobrano z bazy danych pacjenta";
                    lbl_Status.Foreground = Brushes.Green;
                    btn_SaveChanges.Content = "Zaktualizuj";
                    btn_SaveChanges.Visibility = Visibility.Visible;
                    btn_Delete.IsEnabled = true;
                    if(cb_PhysiciansList.Text == " ")
                    {
                        PhysiciansDepartmentNameList();
                    }
                }
            }
            else
            {
                lbl_Status.Content = "Nie znaleziono pacjenta";
                lbl_Status.Foreground = Brushes.Red;
                btn_SaveChanges.Visibility = Visibility.Hidden;
                btn_Delete.IsEnabled = false;
                ClearTextBoxes();

            }
        }

        private void SaveChanges_Click(object sender, RoutedEventArgs e)
        {
            string CS = @"data source=DESKTOP-E9EAAOK\SQLEXPRESS01;database=HospitalsPatients;integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("UPDATE tblPatients SET FirstName = '" + tb_FirstName.Text + "', LastName = '" + tb_LastName.Text + "', Address = '" + tb_Address.Text + "', Telephone = '" + tb_Telephone.Text + "', Department = '" + cb_Department.Text + "', Email = '" + tb_Email.Text + "', Physician = '" + cb_PhysiciansList.Text + "', Diagnosis = '" + tb_Diagnosis.Text + "' WHERE ID = " + _currentEmployeeId.ToString(), con);
                con.Open();
                int TotalRowsAffected = cmd.ExecuteNonQuery();

                if (TotalRowsAffected == 1)
                {
                    lbl_Status.Content = "Zaktualizowano dane pacjenta";
                    lbl_Status.Foreground = Brushes.Green;
                    LastNameList();
                }
                else
                {
                    lbl_Status.Content = "Nie zaktualizowano danych pacjenta";
                    lbl_Status.Foreground = Brushes.Red;
                }
            }
        }

        public void LastNameList()
        {
            List<string> Lista = new List<string>();
            string CS = @"data source=DESKTOP-E9EAAOK\SQLEXPRESS01;database=HospitalsPatients;integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("procPatientsList", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    Lista.Add("Wybierz");
                    while (rdr.Read())
                    {
                        string LastName = rdr["LastName"] as string;
                        Lista.Add(LastName);
                    }
                    this.cb_Search.ItemsSource = Lista;
                    this.cb_Search.SelectedIndex = 0;
                }
            }
        }

        public void PhysiciansList()
        {
            List<string> Lista = new List<string>();
            string CS = @"data source=DESKTOP-E9EAAOK\SQLEXPRESS01;database=HospitalsEmployees;integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("procEmployeeList", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    Lista.Add("Wybierz");
                    while (rdr.Read())
                    {
                        string LastName = rdr["LastName"] as string;
                        Lista.Add(LastName);
                    }
                    this.cb_PhysiciansList.ItemsSource = Lista;
                    this.cb_PhysiciansList.SelectedIndex = 0;
                    cb_PhysiciansList.SelectedItem.ToString();
                }

            }
        }

        public void PhysiciansDepartmentNameList()
        {
            List<string> Lista = new List<string>();
            string CS = @"data source=DESKTOP-E9EAAOK\SQLEXPRESS01;database=HospitalsEmployees;integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("procEmployeesDepartmentList", con);
                cmd.Parameters.AddWithValue("@Department", cb_Department.SelectedItem.ToString());
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    Lista.Add("Wybierz");
                    while (rdr.Read())
                    {
                        string LastName = rdr["LastName"] as string;
                        Lista.Add(LastName);
                    }
                    this.cb_PhysiciansList.ItemsSource = Lista;
                    this.cb_PhysiciansList.SelectedIndex = 0;
                    cb_PhysiciansList.SelectedItem.ToString();
                }

            }
        }

        public void DepartmentList()
        {
            List<string> Lista = new List<string>();
            string CS = @"data source=DESKTOP-E9EAAOK\SQLEXPRESS01;database=HospitalsEmployees;integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("procDepartmentList", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    Lista.Add("Wybierz");
                    while (rdr.Read())
                    {
                        string Name = rdr["Name"] as string;
                        Lista.Add(Name);
                    }
                    this.cb_Department.ItemsSource = Lista;
                    this.cb_Department.SelectedIndex = 0;
                    cb_Department.SelectedItem.ToString();
                }

            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            string CS = @"data source=DESKTOP-E9EAAOK\SQLEXPRESS01;database=HospitalsPatients;integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("procPatientsDelete", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ID", _currentEmployeeId);

                con.Open();
                cmd.ExecuteNonQuery();
                lbl_Status.Content = "Usunięto pacjenta";
                lbl_Status.Foreground = Brushes.Red;
                LastNameList();
            }
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            if (tb_FirstName.Text != null && tb_LastName.Text != null)
            {
                string CS = @"data source=DESKTOP-E9EAAOK\SQLEXPRESS01;database=HospitalsPatients;integrated security=SSPI";
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("procPatientsInsert", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@FirstName", tb_FirstName.Text);
                    cmd.Parameters.AddWithValue("@LastName", tb_LastName.Text);
                    cmd.Parameters.AddWithValue("@Address", tb_Address.Text);
                    cmd.Parameters.AddWithValue("@Telephone", tb_Telephone.Text);
                    cmd.Parameters.AddWithValue("@Department", cb_Department.Text);
                    cmd.Parameters.AddWithValue("@Email", tb_Email.Text);
                    cmd.Parameters.AddWithValue("@Physician", cb_PhysiciansList.Text);
                    cmd.Parameters.AddWithValue("@Diagnosis", tb_Diagnosis.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    lbl_Status.Content = "Dodano nowego pacjenta";
                    lbl_Status.Foreground = Brushes.Green;
                    LastNameList();
                }
            }
            else
            {
                lbl_Status.Content = "Proszę wpisać imię i nazwisko pacjenta";
                lbl_Status.Foreground = Brushes.Green;
            }
        }

        private void Department_LostFocus(object sender, RoutedEventArgs e)
        {
            if (cb_Department.SelectedIndex != 0)
            {
                PhysiciansDepartmentNameList();
            }
            else
            {
                PhysiciansList();
            }
        }

        private void BackToMainWindow_Click(object sender, RoutedEventArgs e)
        {
            MainWindow MainWindow = new MainWindow();
            MainWindow.Show();
            this.Close();
        }

        private void Clear_Click(object sender, RoutedEventArgs e)
        {
            ClearTextBoxes();
        }
    }
}
