using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.IO;
using System.Drawing.Imaging;
using System.Collections;
using System.Net;





namespace NewsWebsiteAdmin
{
    public partial class Adminlogin : System.Web.UI.Page
    {

        static string ConString = ConfigurationManager.AppSettings["ConString"];
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Password NumberValue Obtaining
        public static string PasswordNumberValueObtaining(string password)
        {
            int kk;
            string qq;
            //float dd;
            double dd;
            dd = 0;
            qq = "";
            for (kk = 0; kk < password.Length; kk++)
            {
                dd += (int)password[kk] * 5;
                qq = qq + dd;
            }
            //dd = float.Parse(qq);
            dd = double.Parse(qq);
            return qq;
        }

    

        protected void btnlogin_Click(object sender, EventArgs e)
        {
           try
           {

                if (txtusrnme.Text != "")
                {
                  if (txtpasswrd.Text != "")
                  {
                    String encriptedpass = PasswordNumberValueObtaining(txtpasswrd.Text);
                    MySqlConnection conn = new MySqlConnection(ConString);
                    conn.Open();

                        using (MySqlDataAdapter a = new MySqlDataAdapter(" SELECT id,email,password,usertype,name FROM user_login where   email = '" + txtusrnme.Text + "' AND password =  '" + encriptedpass + "' AND ((usertype = '3') OR (usertype = '5') OR (usertype = '2') OR (usertype = '4')) ", conn))
                        {
                            DataTable t = new DataTable();
                            a.Fill(t);
                            
                            if (t.Rows.Count > 0)
                            {
                                Hashtable User = new Hashtable();
                                User.Add("Id", int.Parse(t.Rows[0]["id"].ToString()));
                                User.Add("Name", t.Rows[0]["name"].ToString());
                                User.Add("Usertype", int.Parse(t.Rows[0]["usertype"].ToString()));

                                Session["user"] = User;
                  
                                Response.Redirect("~/DashBoard.aspx");
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(Page, GetType(), "Login", "<script>swal('Invalid Login!', 'Operation Canceled', 'error')</script>", false);
                            }
                            conn.Close();
                        }
                  }
                  else
                  {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "Login", "<script>swal('Please enter the password!', 'Operation Canceled', 'error')</script>", false);
                  }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "Login", "<script>swal('Please enter the username!', 'Operation Canceled', 'error')</script>", false);
                }
        
           }
            catch (Exception ex)
           {
                ScriptManager.RegisterStartupScript(Page, GetType(), "Login", "<script>swal('Invalid Login!', 'Operation Canceled', 'error')</script>", false);
           }

        }


        //public static string Temp
        //{
        //    get
        //    {
        //        if (IsHttpRuntime() && System.Web.HttpContext.Current.Session["user"] != null)
        //        {
        //            return (string)System.Web.HttpContext.Current.Session["user"];
        //        }
        //        throw new ArgumentNullException(@"Session[""user""] is null");
        //    }
        //    set
        //    {
        //        if (IsHttpRuntime())
        //        {
        //            System.Web.HttpContext.Current.Session["user"] = value;
        //        }
        //    }
        //}

        //private static bool IsHttpRuntime()
        //{
        //    if (HttpRuntime.AppDomainAppId == null)
        //    {
        //        throw new ArgumentNullException(@"HttpRuntime.AppDomainAppId is null.  SessionManager can only be used in a web application");
        //    }
        //    return true;
        //}

        //[WebMethod()]
        //public static void Autolog(Hashtable user)
        //{
        //    ////object User = user;

        //    int i = (int)user["Id"];
        //    string n = user["Name"].ToString();
        //    int ty = (int)user["Usertype"];

        //    //Hashtable User = new Hashtable();
        //    //User.Add("Id", i);
        //    //User.Add("Name", n);
        //    //User.Add("Usertype", t);

        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(" SELECT id, email, password, usertype, name FROM user_login WHERE id = '" + i + "' AND name = '" + n + "' AND usertype = '" + ty + "' ", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);

        //        if (t.Rows.Count > 0)
        //        {
        //            Hashtable User = new Hashtable();
        //            User.Add("Id", int.Parse(t.Rows[0]["id"].ToString()));
        //            User.Add("Name", t.Rows[0]["name"].ToString());
        //            User.Add("Usertype", int.Parse(t.Rows[0]["usertype"].ToString()));

        //            HttpContext.Current.Session["user"] = User;

        //            //Response.Redirect("~/AuthorForm.aspx");
        //            //HttpContext.Current.Response.Redirect("~/AuthorForm.aspx");
        //        }
        //        else
        //        {
        //            //ScriptManager.RegisterStartupScript(Page, GetType(), "Login", "<script>swal('Invalid Login!', 'Operation Canceled', 'error')</script>", false);
        //        }
        //        conn.Close();

        //        //Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('~/AuthorForm.aspx','_newtab');", true);
        //        //Response.Redirect("~/AuthorForm.aspx");

        //    }
        //}




    }
}