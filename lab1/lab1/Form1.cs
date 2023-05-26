using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace lab1
{
    public partial class Form1 : Form
    {
        //string connectionString= @"Server=DESKTOP-I7KQEPF\SQLEXPRESS01;
        //Database=Lab1v2;
        //Integrated Security=true;TrustServerCertificate=true;";
        SqlConnection connection = new SqlConnection(@"Server=DESKTOP-I7KQEPF\SQLEXPRESS01;Database=Lab1v2;Integrated Security=true;TrustServerCertificate=true;");

        DataSet ds = new DataSet();
        SqlDataAdapter parentAdapter = new SqlDataAdapter();
        SqlDataAdapter childAdapter = new SqlDataAdapter();
        BindingSource parentBS=new BindingSource();
        BindingSource childBS = new BindingSource();

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            try
            {
                //using (SqlConnection connection = new SqlConnection(connectionString))
                //{
                    connection.Open();
                    MessageBox.Show(connection.State.ToString());
                    parentAdapter.SelectCommand = new SqlCommand("SELECT * FROM Categorie", connection);
                    parentAdapter.Fill(ds, "Categorie");
                    childAdapter.SelectCommand = new SqlCommand("SELECT * from Luptatori", connection);
                    childAdapter.Fill(ds, "Luptatori");
                    parentBS.DataSource = ds.Tables["Categorie"];
                    dataGridViewParent.DataSource = parentBS;
                    parentComboBox.DisplayMember = "cod_cat";
                    parentComboBox.DataSource = ds.Tables["Categorie"];
                    DataColumn parentColumn = ds.Tables["Categorie"].Columns["cod_cat"];
                    DataColumn childColumn = ds.Tables["Luptatori"].Columns["cod_cat"];
                    DataRelation relation = new DataRelation("FK_Categorie_Luptatori",
                        parentColumn, childColumn);
                    ds.Relations.Add(relation);
                    childBS.DataSource = parentBS;
                    childBS.DataMember = "FK_Categorie_Luptatori";
                    dataGridViewChild.DataSource = childBS;
                    
                    numeLBox.DataBindings.Add("Text", childBS, "nume_l");
                    descLBox.DataBindings.Add("Text", childBS, "descriere_l");
                    codCatText.DataBindings.Add("Text", childBS, "cod_cat");
                    codLupBox.DataBindings.Add("Text", childBS, "cod_style");
                    codSalBox.DataBindings.Add("Text", childBS, "cod_sala");
                    codManBox.DataBindings.Add("Text", childBS, "cod_man");
                    connection.Close();
               // }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void dataGridViewParent_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                parentAdapter.SelectCommand = new SqlCommand("SELECT * FROM Categorie where cod_cat=@cod_cat", connection);
                object firstCellValue = dataGridViewParent.Rows[e.RowIndex].Cells[0].Value;
                int.TryParse(firstCellValue.ToString(), out int id_parinte);
                parentAdapter.SelectCommand.Parameters.AddWithValue("@cod_cat", SqlDbType.Int).Value = id_parinte;
                ds.Tables["Luptatori"].Clear();
                parentAdapter.Fill(ds.Tables["Luptatori"]);
                dataGridViewChild.DataSource = ds.Tables["Luptatori"];
            }
        }


        private void onUpdateButtonClick(object sender, EventArgs e) {

                var results = dataGridViewChild.SelectedCells[0].RowIndex;
                int cod_l = Convert.ToInt32(dataGridViewChild.Rows[results].Cells[0].Value.ToString());
                string nume_l = Convert.ToString(numeLBox.Text);
                string descriere_l = Convert.ToString(descLBox.Text);
                int cod_cat = Convert.ToInt32(codCatText.Text);
                int cod_style=Convert.ToInt32(codLupBox.Text);
                int cod_sala = Convert.ToInt32(codSalBox.Text);
                int cod_man=Convert.ToInt32(codManBox.Text);
                try
                {
                    //using(SqlConnection connection=new SqlConnection(connectionString))
                    //{
                        connection.Open();
                        childAdapter.UpdateCommand = new SqlCommand("Update Luptatori set nume_l=@nume_l,descriere_l=@descriere_l,cod_cat=@cod_cat,cod_style=@cod_style,cod_sala=@cod_sala,cod_man=@cod_man where cod_l=@cod_l",connection);
                        childAdapter.UpdateCommand.Parameters.AddWithValue("@cod_l", cod_l);
                        childAdapter.UpdateCommand.Parameters.AddWithValue("@nume_l", nume_l);
                        childAdapter.UpdateCommand.Parameters.AddWithValue("@descriere_l", descriere_l);
                        childAdapter.UpdateCommand.Parameters.AddWithValue("@cod_cat", cod_cat);
                        childAdapter.UpdateCommand.Parameters.AddWithValue("@cod_style", cod_style);
                        childAdapter.UpdateCommand.Parameters.AddWithValue("@cod_sala", cod_sala);
                        childAdapter.UpdateCommand.Parameters.AddWithValue("@cod_man", cod_man);
                        childAdapter.UpdateCommand.ExecuteNonQuery();
                        connection.Close();
                        ds.Tables["Luptatori"].Clear();
                        childAdapter.Fill(ds.Tables["Luptatori"]);
                        dataGridViewChild.DataSource = ds.Tables["Luptatori"];

                    //}
                }catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
               
        }

        private void onDeleteButtonClick(object sender, EventArgs e)
        {
            
            var results = dataGridViewChild.SelectedCells[0].RowIndex;
            int cod_l = Convert.ToInt32(dataGridViewChild.Rows[results].Cells[0].Value.ToString());
            try
                {
                    //using(SqlConnection connection = new SqlConnection(connectionString))
                    //{
                        childAdapter.DeleteCommand = new SqlCommand("DELETE from Luptatori where cod_l=@cod_l",connection);
                        childAdapter.DeleteCommand.Parameters.AddWithValue("@cod_l", cod_l);

                connection.Open();
                childAdapter.DeleteCommand.ExecuteNonQuery ();
                        connection.Close();
                        ds.Tables["Luptatori"].Clear();
                        childAdapter.Fill(ds.Tables["Luptatori"]);
                        dataGridViewChild.DataSource = ds.Tables["Luptatori"];
                    //}
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            
        }

        private void onAddButtonClick(object sender, EventArgs e)
        {
            string nume_l = Convert.ToString(numeLBox.Text);
            string descriere_l = Convert.ToString(descLBox.Text);
            int cod_cat = Convert.ToInt32(codCatText.Text);
            int cod_style = Convert.ToInt32(codLupBox.Text);
            int cod_sala = Convert.ToInt32(codSalBox.Text);
            int cod_man = Convert.ToInt32(codManBox.Text);
            try
                {
                   // using (SqlConnection connection = new SqlConnection(connectionString))
                    //{
                        connection.Open ();
                        childAdapter.InsertCommand = new SqlCommand("INSERT INTO Luptatori(nume_l,descriere_l,cod_cat,cod_style,cod_sala,cod_man) values (@nume_l,@descriere_l,@cod_cat,@cod_style,@cod_sala,@cod_man)", connection);
                        childAdapter.InsertCommand.Parameters.AddWithValue("@nume_l", nume_l);
                        childAdapter.InsertCommand.Parameters.AddWithValue("@descriere_l", descriere_l);
                        childAdapter.InsertCommand.Parameters.AddWithValue("@cod_cat", cod_cat);
                        childAdapter.InsertCommand.Parameters.AddWithValue("@cod_style", cod_style);
                        childAdapter.InsertCommand.Parameters.AddWithValue("@cod_sala", cod_sala);
                        childAdapter.InsertCommand.Parameters.AddWithValue("@cod_man", cod_man);
                        childAdapter.InsertCommand.ExecuteNonQuery();
                        connection.Close();
                        ds.Tables["Luptatori"].Clear();
                        childAdapter.Fill(ds.Tables["Luptatori"]);
                        dataGridViewChild.DataSource = ds.Tables["Luptatori"];

                    //}
                }catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
        }

        private void dataGridViewParent_CellContentClick(object sender, MouseEventArgs e)
        {
            
        }
    }
}
