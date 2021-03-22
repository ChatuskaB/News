using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static NewsWebsiteAdmin.SiteMaster;

namespace NewsWebsiteAdmin
{
    public partial class UserManagment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Hashtable user = (Hashtable)Session["user"];
            if (user == null)
            {
                Response.Redirect("~/AdminLogin.aspx");
            }
            else
            {
                SiteMaster.UserRoles userRole = (UserRoles)user["Usertype"];
                if (userRole == UserRoles.Admin)
                {

                }
                else
                {
                    Response.Redirect("~/AdminLogin.aspx");
                }
            }


        }


        static string ConString = ConfigurationManager.AppSettings["ConString"];

        [WebMethod()]
        public static string gridchange()
        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT id,email,usertype,status,name FROM user_login", conn))
            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string getcustomerdt(string Id)

        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT id,email,usertype,status,name FROM user_login where id = '" + Id + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }
        }

        //Check if the email have been used to register before
        public static bool getcustomerdtemail(string Email)
        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(
                "SELECT Email From user_login where  email = '" + Email + "'", conn))
            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();
                if (t.Rows.Count > 0)
                {
                    return true;
                }
                else
                {
                   
                    return false;
                }
            }

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

        [WebMethod()]

        public static string SaveCustomer(string Name, string Email, string Password,string usertype, string status)
        {

            if (!getcustomerdtemail(Email))
            {

                string encriptedpass = PasswordNumberValueObtaining(Password);

                
                   

                    MySqlConnection conn = new MySqlConnection(ConString);
                    conn.Open();

                   

                    MySqlCommand cmd1 = new MySqlCommand("Insert into  user_login(name,email, password, usertype,status) values (@pname,@emailaddress,@upass,@pusertype,@pstatus)", conn);

                    MySqlParameter param1 = new MySqlParameter();
                    param1.ParameterName = "@pname";
                    param1.Value = Name;
                    cmd1.Parameters.Add(param1);

                    MySqlParameter param12 = new MySqlParameter();
                    param12.ParameterName = "@emailaddress";
                    param12.Value = Email;
                    cmd1.Parameters.Add(param12);

                    MySqlParameter param13 = new MySqlParameter();
                    param13.ParameterName = "@upass";
                    param13.Value = encriptedpass;
                    cmd1.Parameters.Add(param13);

                    MySqlParameter param18 = new MySqlParameter();
                    param18.ParameterName = "@pusertype";
                    param18.Value = usertype;
                    cmd1.Parameters.Add(param18);

                    MySqlParameter param19 = new MySqlParameter();
                    param19.ParameterName = "@pstatus";
                    param19.Value = status;
                    cmd1.Parameters.Add(param19);

                    

                int rf = cmd1.ExecuteNonQuery();
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js8 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js8.Serialize("Saved Succesfully");


            }
            else
            {

                System.Web.Script.Serialization.JavaScriptSerializer js8 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js8.Serialize("Email is Already Registered");

            }



        }

        [WebMethod()]

        public static string UpdateCustomer(string Name, string Email, string usertype, string status,string id,string DatabaseEmail)
        {

            if (DatabaseEmail != Email)
            {
                
                if (!getcustomerdtemail(Email))
                {
                    
                    MySqlConnection conn = new MySqlConnection(ConString);
                    conn.Open();



                    MySqlCommand cmd1 = new MySqlCommand("Update user_login set name=@pname,email=@emailaddress,usertype=@pusertype,status=@pstatus where id='" + id + "'", conn);

                    MySqlParameter param1 = new MySqlParameter();
                    param1.ParameterName = "@pname";
                    param1.Value = Name;
                    cmd1.Parameters.Add(param1);

                    MySqlParameter param12 = new MySqlParameter();
                    param12.ParameterName = "@emailaddress";
                    param12.Value = Email;
                    cmd1.Parameters.Add(param12);



                    MySqlParameter param18 = new MySqlParameter();
                    param18.ParameterName = "@pusertype";
                    param18.Value = usertype;
                    cmd1.Parameters.Add(param18);

                    MySqlParameter param19 = new MySqlParameter();
                    param19.ParameterName = "@pstatus";
                    param19.Value = status;
                    cmd1.Parameters.Add(param19);



                    int rf = cmd1.ExecuteNonQuery();
                    conn.Close();

                    System.Web.Script.Serialization.JavaScriptSerializer js8 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js8.Serialize("Saved Succesfully");


                }
                else
                {

                    System.Web.Script.Serialization.JavaScriptSerializer js8 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js8.Serialize("Email is Already Registered");

                }
            }
            else
            {


                MySqlConnection conn = new MySqlConnection(ConString);
                conn.Open();



                MySqlCommand cmd1 = new MySqlCommand("Update user_login set name=@pname,email=@emailaddress,usertype=@pusertype,status=@pstatus where id='" + id + "'", conn);

                MySqlParameter param1 = new MySqlParameter();
                param1.ParameterName = "@pname";
                param1.Value = Name;
                cmd1.Parameters.Add(param1);

                MySqlParameter param12 = new MySqlParameter();
                param12.ParameterName = "@emailaddress";
                param12.Value = Email;
                cmd1.Parameters.Add(param12);



                MySqlParameter param18 = new MySqlParameter();
                param18.ParameterName = "@pusertype";
                param18.Value = usertype;
                cmd1.Parameters.Add(param18);

                MySqlParameter param19 = new MySqlParameter();
                param19.ParameterName = "@pstatus";
                param19.Value = status;
                cmd1.Parameters.Add(param19);



                int rf = cmd1.ExecuteNonQuery();
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js8 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js8.Serialize("Saved Succesfully");

            }


        }
    }
}