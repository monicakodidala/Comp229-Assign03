using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Comp229_Assign03
{
    public partial class Student : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string StudentID = Request.QueryString["ID"];
            UpdateLink.NavigateUrl = String.Format("~/UpdateStudent.aspx?ID={0}", StudentID);

            SqlConnection connection = new SqlConnection("Server = MONICA\\MONICASQLEXPRESS;Database = Comp229Assign03;Integrated Security=True");
            SqlCommand comm = new SqlCommand("SELECT * FROM Students where StudentID="+ StudentID , connection);

            try
            {
                connection.Open();
                using (SqlDataReader reader = comm.ExecuteReader())
                {
                    while(reader.Read())
                    {
                        StudID.Text = reader["StudentID"].ToString();
                        FrstNme.Text = reader["FirstMidName"].ToString();
                        LstNme.Text = reader["LastName"].ToString();
                        EnrlDte1.Text = reader["EnrollmentDate"].ToString();
                    }
                    connection.Close();

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}