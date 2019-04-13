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

        private void btn_Pacjenci_Click(object sender, RoutedEventArgs e)
        {
            Window1 Pacjenci = new Window1();
            Pacjenci.Show();
            this.Close();
        }


        private void btn_Pracownicy_Click(object sender, RoutedEventArgs e)
        {
            Window3 Pracownicy = new Window3();
            Pracownicy.Show();
            this.Close();
        }
    }
}
