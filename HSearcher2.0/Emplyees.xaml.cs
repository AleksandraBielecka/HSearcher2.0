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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.SqlClient;
using System.Data;

namespace HSearcher2._0
{
    /// <summary>
    /// Logika interakcji dla klasy MainWindow.xaml
    /// </summary>
    public partial class Window3 : Window
    {
        private int? _currentEmployeeId;

        #region Konstruktory
        public Window3()
        {
            InitializeComponent();
            lbl_FirstName.Content = "Imię";
            lbl_LastName.Content = "Nazwisko";
            lbl_Address.Content = "Adres";
            lbl_Telephone.Content = "Telefon";
            lbl_Email.Content = "Email";
            lbl_Salary.Content = "Pensja";
            lbl_Department.Content = "Departament";
            lbl_Status.Foreground = Brushes.Black;
            lbl_Status.Content = "Wyszukaj pracownika lub dodaj nowego";
            btn_Delete.Content = "Usuń";
            btn_SaveChanges.Content = "Zapisz";
            btn_Search.Content = "Szukaj";
            btn_Add.Content = "Dodaj";
            btn_SaveChanges.Visibility = Visibility.Hidden;
            btn_Delete.IsEnabled = false;
            ClearTextBoxes();
            LastNameList();
        }
        #endregion

        private void ClearTextBoxes()
        {
            tb_FirstName.Text = "";
            tb_LastName.Text = "";
            tb_Address.Text = "";
            tb_Telephone.Text = "";
            tb_Email.Text = "";
            tb_Salary.Text = "";
            tb_Department.Text = "";
            cb_Search.SelectedIndex = 0;
            btn_SaveChanges.Visibility = Visibility.Hidden;
            lbl_Status.Foreground = Brushes.Black;
            lbl_Status.Content = "Wyszukaj pracowika lub dodaj nowego";
        }

        private void Search_Click(object sender, RoutedEventArgs e)
        {
            if (this.cb_Search.SelectedValue != null)
            {
                bool IsLoaded = false;
                _currentEmployeeId = 0;
                string CS = @"data source=DESKTOP-E9EAAOK\SQLEXPRESS01;database=HospitalsEmployees;integrated security=SSPI";
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Select top 1 ID, FirstName, LastName, Address, Telephone, Email, Salary, DepartmentID from tblEmployee WHERE LastName = '" + cb_Search.SelectedValue.ToString() + "'", con);
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            var FirstName = rdr["FirstName"] as string;
                            var LastName = rdr["LastName"] as string;
                            var Address = rdr["Address"] as string;
                            var Telephone = rdr["Telephone"] as string;
                            var Email = rdr["Email"] as string;
                            var Salary = Convert.ToInt32(rdr["Salary"]);
                            var Department = Convert.ToInt32(rdr["DepartmentID"]);
                            tb_FirstName.Text = FirstName;
                            tb_LastName.Text = LastName;
                            tb_Address.Text = Address;
                            tb_Telephone.Text = Telephone;
                            tb_Email.Text = Email;
                            tb_Salary.Text = Salary.ToString();
                            tb_Department.Text = Department.ToString();
                            _currentEmployeeId = Convert.ToInt32(rdr["ID"]);
                            IsLoaded = true;
                        }
                    }
                }

                if (IsLoaded)
                {
                    lbl_Status.Content = "Pobrano z bazy danych pracownika";
                    lbl_Status.Foreground = Brushes.Green;
                    btn_SaveChanges.Content = "Zaktualizuj";
                    btn_SaveChanges.Visibility = Visibility.Visible;
                    btn_Delete.IsEnabled = true;
                }
            }
            else
            {
                lbl_Status.Content = "Nie znaleziono pracownika";
                lbl_Status.Foreground = Brushes.Red;
                btn_SaveChanges.Visibility = Visibility.Hidden;
                btn_Delete.IsEnabled = false;
                ClearTextBoxes();

            }
        }

        private void SaveChanges_Click(object sender, RoutedEventArgs e)
        {
            string CS = @"data source=DESKTOP-E9EAAOK\SQLEXPRESS01;database=HospitalsEmployees;integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("UPDATE tblEmployee SET FirstName = '" + tb_FirstName.Text + "', LastName = '" + tb_LastName.Text + "', Address = '" + tb_Address.Text + "', Telephone = '" + tb_Telephone.Text + "', Email = '" + tb_Email.Text + "', Salary = " + tb_Salary.Text + ", DepartmentID = " + tb_Department.Text + " WHERE ID = " + _currentEmployeeId.ToString(), con);
                con.Open();
                int TotalRowsAffected = cmd.ExecuteNonQuery();

                if (TotalRowsAffected == 1)
                {
                    lbl_Status.Content = "Zaktualizowano dane pracownika";
                    lbl_Status.Foreground = Brushes.Green;
                    LastNameList();
                }
                else
                {
                    lbl_Status.Content = "Nie zaktualizowano danych pracownika";
                    lbl_Status.Foreground = Brushes.Red;
                }
            }
        }

        public void LastNameList()
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
                    this.cb_Search.ItemsSource = Lista;
                    this.cb_Search.SelectedIndex = 0;
                }

            }
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            if (tb_FirstName.Text != null && tb_LastName.Text != null)
            {
                string CS = @"data source=DESKTOP-E9EAAOK\SQLEXPRESS01;database=HospitalsEmployees;integrated security=SSPI";
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("procEmployeeInsert", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@FirstName", tb_FirstName.Text);
                    cmd.Parameters.AddWithValue("@LastName", tb_LastName.Text);
                    cmd.Parameters.AddWithValue("@Address", tb_Address.Text);
                    cmd.Parameters.AddWithValue("@Telephone", tb_Telephone.Text);
                    cmd.Parameters.AddWithValue("@Email", tb_Email.Text);
                    cmd.Parameters.AddWithValue("@Salary", tb_Salary.Text);
                    cmd.Parameters.AddWithValue("@DepartmentID", tb_Department.Text);


                    con.Open();
                    cmd.ExecuteNonQuery();
                    lbl_Status.Content = "Dodano nowego pracownika";
                    lbl_Status.Foreground = Brushes.Green;
                    LastNameList();
                }
            }
            else
            {
                lbl_Status.Content = "Proszę wpisać imię i nazwisko pracownika";
                lbl_Status.Foreground = Brushes.Green;
            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            string CS = @"data source=DESKTOP-E9EAAOK\SQLEXPRESS01;database=HospitalsEmployees;integrated security=SSPI";
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("procEmployeeDelete", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ID", _currentEmployeeId);

                con.Open();
                cmd.ExecuteNonQuery();
                lbl_Status.Content = "Usunięto pracownika";
                lbl_Status.Foreground = Brushes.Red;
                LastNameList();
            }
        }

        private void Department_LostFocus(object sender, RoutedEventArgs e)
        {
            if (tb_Department.Text != "1" || tb_Department.Text != "2" || tb_Department.Text != "3")
            {
                lbl_Status.Content = "Proszę wybrać poprawny numer departamentu." + "\n" + "1-Ortopedia , 2-Neurologia, 3-Kardiologia";
                lbl_Status.Foreground = Brushes.Red;
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
