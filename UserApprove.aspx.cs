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
    public partial class UserApprove : System.Web.UI.Page
    {
        static string ConString = ConfigurationManager.AppSettings["ConString"];
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

        [WebMethod()]
        public static string loadReaders(String Name, int Status)
        {

            if (Name == "")
            {
                MySqlConnection conn = new MySqlConnection(ConString);
                conn.Open();

                using (MySqlDataAdapter a = new MySqlDataAdapter(


                    "SELECT id, Name, Email, Status From reader WHERE status = '" + Status + "'", conn))
                {
                    DataTable t = new DataTable();
                    a.Fill(t);
                    conn.Close();

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return JsonConvert.SerializeObject(t);

                }
            }

            else
            {
                MySqlConnection conn = new MySqlConnection(ConString);
                conn.Open();

                using (MySqlDataAdapter a = new MySqlDataAdapter(


                    "SELECT id, Name, Email, Status From reader WHERE  Name like '%" + Name + "%' AND Status = '" + Status + "'", conn))
                {
                    DataTable t = new DataTable();
                    a.Fill(t);
                    conn.Close();

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return JsonConvert.SerializeObject(t);

                }
            }
        }


        //[WebMethod()]
        //public static string gridchange()
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter
        //        ("SELECT id,Name,Email,Status FROM reader ", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}

        [WebMethod()]
        public static string getcustomerdt(string Id)

        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(

                "SELECT id,Name,Email,Status,Pic_Path From reader where id  = '" + Id + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }
        }




        [WebMethod()]
        public static string Updater(string status, int Id)
        {

            MySqlConnection conn = new MySqlConnection(ConString);

            conn.Open();

            MySqlCommand cmd = new MySqlCommand(
                "UPDATE  reader SET Status=@pstatus  WHERE id='" + Id + "' ", conn);

            MySqlParameter param7 = new MySqlParameter();
            param7.ParameterName = "@pstatus";
            param7.Value = status;
            cmd.Parameters.Add(param7);

            int rf = cmd.ExecuteNonQuery();

            MySqlCommand cmd1 = new MySqlCommand(
               "UPDATE user_login SET status=@status WHERE id='" + Id + "' AND usertype= 1 ", conn);

            MySqlParameter cmd1param = new MySqlParameter();
            cmd1param.ParameterName = "@status";
            cmd1param.Value = status;
            cmd1.Parameters.Add(cmd1param);

            int rff = cmd1.ExecuteNonQuery();

            conn.Close();

            var data = new { status = (rf > 0) };
            var datarff = new { status2 = (rff > 0) };

            string output;

            if (data.status == true && datarff.status2 == true)
            {
                output = "Successfully Updated!!";
            }
            else
            {
                output = "Error! Cannot Update Author!";
            }

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(output);

        }


        //[WebMethod()]
        //public static string active()
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(

        //        "SELECT id,Name,Email,Status From reader where status = 1 ", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}

        //[WebMethod()]
        //public static string inactive()
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(

        //        "SELECT id,Name,Email,Status From reader where status = 0 ", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}

        //[WebMethod()]
        //public static string activesearch(string keyword)
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(


        //        "SELECT id,Name,Email,Status From reader where Name like '"+keyword+"%' And Status = 1 ", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}

        //[WebMethod()]
        //public static string inactivesearch(string keyword)
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(


        //        "SELECT id,Name,Email,Status From reader where Name like  '" + keyword + "%' And Status = 0", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}

        //[WebMethod()]
        //public static string search(string keyword)
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(


        //        "SELECT id,Name,Email,Status From reader where Name like  '" + keyword + "%' ", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}
    }
}
