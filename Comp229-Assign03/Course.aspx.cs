using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign03
{
    public partial class Course : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetStudentsForCourse();
            }
        }

        private void GetStudentsForCourse()
        {
            string CourseID = Request.QueryString["CourseID"];

            string cmd = string.Format("Select * from Students s " +
                "INNER JOIN Enrollments e ON e.StudentID = s.StudentID " +
                "INNER JOIN Courses c ON c.CourseID = e.CourseID " +
                "where c.CourseID = " + CourseID);
            SqlConnection connection = new SqlConnection("Server = MONICA\\MONICASQLEXPRESS;Database = Comp229Assign03;Integrated Security=True");
            SqlCommand comm = new SqlCommand(cmd, connection);

            try
            {
                connection.Open();
                SqlDataReader reader = comm.ExecuteReader();

                GridView1.DataSource = reader;
                GridView1.DataBind();

                connection.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void lnkRemove_Click(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            string StudentID = lnkRemove.CommandArgument;
            string CourseID = Request.QueryString["CourseID"];

            SqlConnection connection = new SqlConnection("Server = MONICA\\MONICASQLEXPRESS;Database = Comp229Assign03;Integrated Security=True");
            SqlCommand comm = new SqlCommand("DELETE FROM Enrollments WHERE StudentID='" + StudentID + "' and CourseID='" + CourseID + "'", connection);

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
            finally
            {
                GetStudentsForCourse();
            }
        }

        protected void EnrollStudent_Click(object sender, EventArgs e)
        {
            string CourseID = Request.QueryString["CourseID"];

            Page.Validate();
            if (Page.IsValid)
            {
                SqlConnection connection = new SqlConnection("Server = MONICA\\MONICASQLEXPRESS;Database = Comp229Assign03;Integrated Security=True");
                SqlCommand comm = new SqlCommand("INSERT INTO Enrollments(CourseID, StudentID, Grade) VALUES('" + CourseID + "', '" + StudentID.Text + "', '0'); ", connection);

                try
                {
                    connection.Open();
                    SqlDataReader reader = comm.ExecuteReader();

                    connection.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    StudentID.Text = "";
                    GetStudentsForCourse();
                }
            }
        }
    }
}