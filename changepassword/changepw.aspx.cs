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
    public partial class changepw : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
        string str = null;

        SqlCommand cmd;
        byte up;
        protected void btnchangepass_Click(object sender, EventArgs e)
        {
          con.Open();
            str = "select * from Users";
            cmd = new SqlCommand(str, con);
            SqlDataReader reader = cmd.ExecuteReader();
             while(reader.Read())
            {
                if(txtcurrentpass.Text == reader["UPwd"].ToString())
                {
                    up = 1;
                }
            }
            reader.Close();
            con.Close();
            if( up == 1 )
            {
              con.Open();
                str = "update Users set UPwd=@upwd,ChangePassword=@changePassword where UserId='" + Session["UserId"].ToString() + "' ";
                cmd = new SqlCommand(str, con);
                cmd.Parameters.Add(new SqlParameter("@upwd", SqlDbType.VarChar, 50));
                cmd.Parameters["@upwd"].Value = txtnewpass.Text;
                cmd.Parameters.AddWithValue("@changePassword", 1);
                cmd.ExecuteNonQuery();
                con.Close();

                string message = "تم تغيير كلمة المرور بنجاح.";
                string url = "Index.aspx";
                string script = @"toastr.success('" + message + "');setTimeout(function() {window.location = '" + url + @"';}, 2000)";  
               ScriptManager.RegisterStartupScript(this, this.GetType(), "toastrAndRedirect", script, true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "toastrError", "toastr.error('لم يتم تغيير كلمة المرور');", true);

            }



        }
    }
}