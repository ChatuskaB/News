using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static NewsWebsiteAdmin.SiteMaster;

namespace NewsWebsiteAdmin
{
    public partial class AddhomeAd : System.Web.UI.Page
    {
        static string conString = ConfigurationManager.AppSettings["ConString"];

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
                if (userRole == UserRoles.Admin || userRole == UserRoles.Editor)
                {

                }
                else
                {
                    Response.Redirect("~/AdminLogin.aspx");
                }
            }


        }









        [WebMethod()]
        public static string SaveAdImage( string Image_path,int active , int section)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            var count = 0;
            int error = 0;
            if (active == 1)
            {
                conn.Open();
                using (var cmd = new MySqlCommand("SELECT COUNT(*) FROM HomeAdvertisement  WHERE  section ='" + section + "' AND status = '1' ", conn))
                {
                    count = Convert.ToInt32(cmd.ExecuteScalar());

                }
                conn.Close();
            }

            if(count>0)
            {
                error = 404;
            }
            else
            {
                string dateTimeKey = DateTime.Now.ToString("yyyyMMddHHmmss");
                string dateNow = DateTime.Now.ToString("yyyy/MM/dd");
                string base64 = Image_path.Split(',')[1];
                byte[] bytes = Convert.FromBase64String(base64);
                string path = System.Web.HttpContext.Current.Server.MapPath("SiteContent/HomeAdvertisementImages/");
                using (System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(bytes)))
                {

                    image.Save(path + dateTimeKey + ".jpg", ImageFormat.Jpeg);


                }
                string ImgPath = "SiteContent/HomeAdvertisementImages/" + dateTimeKey + ".jpg";
                //string ImgName = "" + dateTimeKey + ".jpg";


                conn.Open();






                MySqlCommand cmd2 = new MySqlCommand("Insert into  HomeAdvertisement(createdDate,status,imagePath,section) values (@createdDate,@status,@imagePath,@section)", conn);


                MySqlParameter param5 = new MySqlParameter();
                param5.ParameterName = "@createdDate";
                param5.Value = dateNow;
                cmd2.Parameters.Add(param5);


                MySqlParameter param7 = new MySqlParameter();
                param7.ParameterName = "@status";
                param7.Value = active;
                cmd2.Parameters.Add(param7);


                MySqlParameter param6 = new MySqlParameter();
                param6.ParameterName = "@imagePath";
                param6.Value = ImgPath;
                cmd2.Parameters.Add(param6);

                MySqlParameter param64 = new MySqlParameter();
                param64.ParameterName = "@section";
                param64.Value = section;
                cmd2.Parameters.Add(param64);





                Int64 rf = Convert.ToInt64(cmd2.ExecuteScalar());
                error = 0;
            }

         



        

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(error);
        }


        [WebMethod()]
        public static string loadad()
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT a.id, a.createdDate, a.status, a.imagePath , a.section, d.form, d.Ad_Area_Name, d.size FROM homeadvertisement a , ad_section d WHERE a.section = d.id ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string loadSection()
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT * FROM Ad_Section", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string UpdateActive(int id)
        {


            MySqlConnection conn = new MySqlConnection(conString);

            var queryStr = "SELECT section from homeadvertisement where id=" + id + ";";
            MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            conn.Open();
            var dr = cmd.ExecuteReader();
            var sec = "";
            int error = 0;
            int secCount = 0;
            if (dr.HasRows)
            {
                dr.Read();
                sec = dr.GetString(0);
               
            }
            dr.Close();// Close reader.
            conn.Close();

            conn.Open();
            using (var cmd22 = new MySqlCommand("SELECT COUNT(*) FROM HomeAdvertisement  WHERE  section ='" + sec + "' AND status = '1' ", conn))
            {
                secCount = Convert.ToInt32(cmd22.ExecuteScalar());

            }
            conn.Close();


            if(secCount>0)
            {
                error = 404;
            }
            else
            {
                conn.Open();
                MySqlCommand cmd3 = new MySqlCommand("UPDATE homeadvertisement set status = @status WHERE id = '" + id + "'", conn);


                MySqlParameter param4 = new MySqlParameter();
                param4.ParameterName = "@status";
                param4.Value = 1;
                cmd3.Parameters.Add(param4);





                MySqlDataReader log = cmd3.ExecuteReader();
                conn.Close();

                error = 0;

            }





         
            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(error);



        }


        [WebMethod()]
        public static string UpdateActiveNo(int id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            MySqlCommand cmd3 = new MySqlCommand("UPDATE homeadvertisement set status = @status WHERE id = '" + id + "'", conn);


            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@status";
            param4.Value = 0;
            cmd3.Parameters.Add(param4);





            MySqlDataReader log = cmd3.ExecuteReader();
            conn.Close();



            var rff = "ds";
            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(rff);



        }



        [WebMethod()]
        public static string DeleteAd(int id)
        {
            MySqlConnection conn1 = new MySqlConnection(conString);
            conn1.Open();

            int check;

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT status FROM homeadvertisement WHERE id='" + id + "'", conn1))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn1.Close();
                check = (int)t.Rows[0]["status"];
            }


            if (check == 0)
            {
                MySqlConnection conn = new MySqlConnection(conString);
                conn.Open();

                MySqlCommand cmd = new MySqlCommand("DELETE FROM homeadvertisement WHERE id='" + id + "'", conn);
                int rf = cmd.ExecuteNonQuery();

                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js8 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js8.Serialize("0");
            }
            else
            {
                System.Web.Script.Serialization.JavaScriptSerializer js8 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js8.Serialize("1");
            }

        }


    }
}