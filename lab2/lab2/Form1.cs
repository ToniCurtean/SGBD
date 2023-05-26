using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using Microsoft.Data.SqlClient;
using System.Runtime.InteropServices;

namespace lab2
{
    public partial class Form1 : Form
    {
        DataSet ds=new DataSet();
        SqlDataAdapter parentAdapter=new SqlDataAdapter();
        SqlDataAdapter childAdapter=new SqlDataAdapter();
        BindingSource parentBS=new BindingSource();
        BindingSource childBS=new BindingSource();
        string parentTableName = ConfigurationManager.AppSettings["parentTableName"];
        string childTableName = ConfigurationManager.AppSettings["childTableName"];
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString.ToString());
        List<string> columnNames=new List<string>(ConfigurationManager.AppSettings["childLabelNames"].Split(','));
        List<string> paramNames=new List<string>(ConfigurationManager.AppSettings["columnNamesInsertParameters"].Split(','));
        List<string> columnInitiate = new List<string>(ConfigurationManager.AppSettings["childTextBoxContent"].Split(','));
        int nr = Convert.ToInt32(ConfigurationManager.AppSettings["childNumberOfColumns"]);
        TextBox[] textBoxes;
        Label[] labels;

        public Form1()
        {
            InitializeComponent();
            ds.Clear();
            populatePanel();
            loadParent();
            dataGridView1.SelectionChanged += new EventHandler(loadChildren);
        }

        private void loadParent()
        {
            string selectParent = ConfigurationManager.AppSettings["selectParent"];
            try
            {
                connection.Open();
                parentAdapter.SelectCommand = new SqlCommand(selectParent, connection);
                parentAdapter.Fill(ds, parentTableName);
                parentBS.DataSource = ds.Tables[parentTableName];
                dataGridView1.DataSource = parentBS;
                connection.Close();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void loadChildren(object sender, EventArgs e)
        {
            int parentId = Convert.ToInt32(dataGridView1.CurrentRow.Cells[0].Value);
            string selectChild = ConfigurationManager.AppSettings["selectChild"];
            try
            {
                connection.Open();
                if(ds.Tables.Contains(childTableName))
                    ds.Tables[childTableName].Clear();
                childAdapter.SelectCommand = new SqlCommand(selectChild, connection);
                childAdapter.SelectCommand.Parameters.AddWithValue("@id", parentId);
                childAdapter.Fill(ds, childTableName);
                childBS.DataSource = ds.Tables[childTableName];
                dataGridView2.DataSource = childBS;
                connection.Close();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void populatePanel()
        {
            textBoxes = new TextBox[nr];
            labels=new Label[nr];

            for (int i=0;i<nr; i++){
                textBoxes[i]=new TextBox();
                //textBoxes[i].Text = columnInitiate[i];
                textBoxes[i].DataBindings.Add("Text", childBS, columnInitiate[i]);
                labels[i]=new Label();
                labels[i].Text = columnNames[i];
            }

            for (int i = 0; i < nr; i++) {
                flowLayoutPanel1.Controls.Add(textBoxes[i]);
                flowLayoutPanel1.Controls.Add(labels[i]);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                connection.Open();
                string command = "insert into " + childTableName + " (";
                for(int i=1;i<nr;i++)
                {
                    if (i == nr - 1)
                        command += columnInitiate[i] + ")";
                    else
                        command += columnInitiate[i] + ",";
                    
                }
                command += " values (";

                for(int i=1;i<nr;i++)
                {
                    if (i == nr - 1)
                        command += paramNames[i] + (")");
                    else
                        command += paramNames[i] + ",";
                }
                childAdapter.InsertCommand = new SqlCommand(command, connection);
                for(int i=1;i<nr;i++)
                {
                    childAdapter.InsertCommand.Parameters.AddWithValue(paramNames[i], textBoxes[i].Text);
                }
                childAdapter.InsertCommand.ExecuteNonQuery();
                connection.Close();
                
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
                connection.Close();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                connection.Open();
                string command = ConfigurationManager.AppSettings["deleteChild"];
                childAdapter.DeleteCommand = new SqlCommand(command,connection);
                int id = Convert.ToInt32(dataGridView2.CurrentRow.Cells[0].Value);
                childAdapter.DeleteCommand.Parameters.AddWithValue("@id", id);
                childAdapter.DeleteCommand.ExecuteNonQuery();
                connection.Close();

            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                connection.Open();
                string command = ConfigurationManager.AppSettings["updateChild"];
                childAdapter.UpdateCommand = new SqlCommand(command, connection);
                for (int i = 1; i < nr; i++)
                    childAdapter.UpdateCommand.Parameters.AddWithValue(paramNames[i], textBoxes[i].Text);
                int id = Convert.ToInt32(dataGridView2.CurrentRow.Cells[0].Value);
                childAdapter.UpdateCommand.Parameters.AddWithValue("@id", id);
                childAdapter.UpdateCommand.ExecuteNonQuery();
                connection.Close();
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
