using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace changepassword
{
    public partial class Index : System.Web.UI.Page
    {
     SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            con.Open();

            Session["UserId"] = txtUserID.Text;
            SqlCommand query = new SqlCommand("select * from Users where UserId =@userid and UPwd =@upwd", con);
            query.Parameters.AddWithValue("@userid", txtUserID.Text);
            query.Parameters.AddWithValue("@upwd", txtPWD.Text);

            SqlDataAdapter da = new SqlDataAdapter(query);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int changePw = Convert.ToInt32(dt.Rows[0]["ChangePassword"]);
            if (dt.Rows.Count > 0)
            {
                if (changePw == 0)
                {
                    Response.Redirect("changepw.aspx");
                }else
                {
                    Response.Redirect("UserHome.aspx");

                }
            }
            else
            {
               
            }








        }




    }
}