using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAn2.DAO
{
    public class DataProvider
    {
        private static DataProvider instance;
        public static DataProvider Instance
        {
            get
            {
                if (instance == null)
                    instance = new DataProvider();
                return DataProvider.instance;
            }
            private set { instance = value; }
        }

        private DataProvider() { }
        private string connectionSTR = "Data Source=DESKTOP-IT1OBEK\\MSSQLSERVER1;Initial Catalog=TIKI;Integrated Security=True";
        public DataTable ExecuteQuery(string Query, object[] parameter = null)
        {
            DataTable data = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(Query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                if (parameter != null)
                {
                    string[] listpara = Query.Split(' ');
                    int i = 0;
                    foreach (string item in listpara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }


                adapter.Fill(data);
                connection.Close();
                //dtgvAccount.DataSource = data;
            }

            return data;
        }
        public int ExecuteNonQuery(string Query, object[] parameter = null)
        {
            int data = 0;
            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(Query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                if (parameter != null)
                {
                    string[] listpara = Query.Split(' ');
                    int i = 0;
                    foreach (string item in listpara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }


                data = command.ExecuteNonQuery();
                connection.Close();

            }
            return data;
        }
        public object ExecuteScalar(string Query, object[] parameter = null)
        {
            object data = 0;
            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(Query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                if (parameter != null)
                {
                    string[] listpara = Query.Split(' ');
                    int i = 0;
                    foreach (string item in listpara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }


                data = command.ExecuteScalar();
                connection.Close();

            }

            return data;
        }
    }
}
