using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace JSB
{
    public partial class Form1 : Form
    {
        // Ces deux variables récoltent les infos transmit par l'utilisateur

        public Form1()
        {
            InitializeComponent();     
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // C'est le code de la page en elle même
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //Quand on clique sur ce bouton ça va se connecter a la base mysql 
            string connectionString = "datasource=127.0.0.1;port=3306;username=root;password=;database=inscription;";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            //Ici il y aura tout le code permettant d'intérragir avec la base de données//
            databaseConnection.Open();
            MySqlCommand query = new MySqlCommand();
            query.Connection = databaseConnection;
            query.CommandText = "select id_mail from identifiant where id_mail=\"" + UsernameTextBox + "\";";
            var usernameSelect = query.ExecuteReader();
            databaseConnection.Close();
            databaseConnection.Open();
            query.CommandText = "select * from identifiant where id_mdp=\"" + PasswordTextBox + "\";";
            var passwordSelect = query.ExecuteReader();
            databaseConnection.Close();
            if (usernameSelect.Equals("maxime.giera@gmail.com") && passwordSelect.Equals("1973"))
            {
                Page_Client pageClient1 = new Page_Client();
                pageClient1.Show();
            
            }
            else
            {
                MessageBox.Show("L'adrese e-mail ou le mot de passe est invalide !");
            }

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
