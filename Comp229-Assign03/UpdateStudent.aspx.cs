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
    public partial class UpdateStudent : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                string StudentID = Request.QueryString["ID"];


                SqlConnection connection = new SqlConnection("Server = MONICA\\MONICASQLEXPRESS;Database = Comp229Assign03;Integrated Security=True");
                SqlCommand comm = new SqlCommand("SELECT * FROM Students where StudentID=" + StudentID, connection);

                try
                {
                    connection.Open();
                    using (SqlDataReader reader = comm.ExecuteReader())
                    {
                        while (reader.Read())
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


        protected void BtnSave_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                SqlConnection connection = new SqlConnection("Server = MONICA\\MONICASQLEXPRESS;Database = Comp229Assign03;Integrated Security=True");
                SqlCommand comm = new SqlCommand("UPDATE Students SET LastName='" + LstNme.Text + "', FirstMidName='" + FrstNme.Text + "', EnrollmentDate='" + EnrlDte1.Text + "' Where StudentID='" + StudID.Text + "'",connection);
                try
                {
                    connection.Open();
                    comm.ExecuteNonQuery();

                    connection.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {

        }
    }
}