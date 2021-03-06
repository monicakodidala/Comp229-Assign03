﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Comp229_Assign03
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Server = MONICA\\MONICASQLEXPRESS;Database = Comp229Assign03;Integrated Security=True");
            SqlCommand comm = new SqlCommand("SELECT * FROM Students", connection);

            try
            {
                connection.Open();
                SqlDataReader reader = comm.ExecuteReader();

                myRepeater.DataSource = reader;
                myRepeater.DataBind();

                connection.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void AddStd_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                SqlConnection connection = new SqlConnection("Server = MONICA\\MONICASQLEXPRESS;Database = Comp229Assign03;Integrated Security=True");
                SqlCommand comm = new SqlCommand("INSERT INTO Students (LastName, FirstMidName,EnrollmentDate) VALUES('" + LstName.Text + "', '" + FrstName.Text + "', '" + EnrlDate.Text + "'); ", connection);
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
                    LstName.Text = "";
                    FrstName.Text = "";
                    EnrlDate.Text = "";
                    Response.Redirect("Default.aspx");
                }
            }
        }
    }
} 
    