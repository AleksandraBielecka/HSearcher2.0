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
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Patients_Click(object sender, RoutedEventArgs e)
        {
            Window1 Patients = new Window1();
            Patients.Show();
            this.Close();
        }


        private void Employees_Click(object sender, RoutedEventArgs e)
        {
            Window3 Employees = new Window3();
            Employees.Show();
            this.Close();
        }
    }
}
