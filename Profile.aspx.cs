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

namespace NewsWebsiteAdmin
{
    public partial class Profile : System.Web.UI.Page
    {



        
        protected void Page_Load(object sender, EventArgs e)
        {



        }

        static string ConString = ConfigurationManager.AppSettings["ConString"];
        [WebMethod()]
        public static string getcustomerdts(int Id)

        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT * From tbprofile where id = " + Id + "", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }
        }

        [WebMethod()]
        public static string UpdateProfile(String Base64Img,string Company_Name,string Address,string E_Mail, string Phone_Number, string Fax, string Vision,string Mission,string Description, int Id)
        {


            if (Base64Img.Length < 500)
            {
               

                MySqlConnection conn = new MySqlConnection(ConString);

                conn.Open();

                MySqlCommand cmd = new MySqlCommand(
                    "UPDATE  tbprofile SET Company_Name=@pCompany_Name,Address=@pAddress,E_Mail=@pE_Mail,Phone_Number=@pPhone_Number,Fax=@pFax,Vision=@pVision,Mission=@pMission,Description_Notes=@pDescription WHERE id='" + Id + "'", conn);

                MySqlParameter param2 = new MySqlParameter();
                param2.ParameterName = "@pCompany_Name";
                param2.Value = Company_Name;
                cmd.Parameters.Add(param2);


                MySqlParameter param3 = new MySqlParameter();
                param3.ParameterName = "@pAddress";
                param3.Value = Address;
                cmd.Parameters.Add(param3);


                MySqlParameter param4 = new MySqlParameter();
                param4.ParameterName = "@pE_Mail";
                param4.Value = E_Mail;
                cmd.Parameters.Add(param4);


                MySqlParameter param5 = new MySqlParameter();
                param5.ParameterName = "@pPhone_Number";
                param5.Value = Phone_Number;
                cmd.Parameters.Add(param5);


                MySqlParameter param6 = new MySqlParameter();
                param6.ParameterName = "@pFax";
                param6.Value = Fax;
                cmd.Parameters.Add(param6);


                MySqlParameter param7 = new MySqlParameter();
                param7.ParameterName = "@pVision";
                param7.Value = Vision;
                cmd.Parameters.Add(param7);


                MySqlParameter param8 = new MySqlParameter();
                param8.ParameterName = "@pMission";
                param8.Value = Mission;
                cmd.Parameters.Add(param8);


                MySqlParameter param9 = new MySqlParameter();
                param9.ParameterName = "@pDescription";
                param9.Value = Description;
                cmd.Parameters.Add(param9);




                int rf = cmd.ExecuteNonQuery();
                conn.Close();


                var data = new { status = (rf > 0) };

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js.Serialize(data);
            }
            else
            {
                 string base64 = Base64Img.Split(',')[1];
                byte[] bytes = Convert.FromBase64String(base64);
                using (System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(bytes)))
                {
                    image.Save("C:/Users/IMAKA/Documents/Visual Studio 2017/Projects/NewsWebSite/NewsWebsiteAdmin/SiteContent/companylogo/companylogo.jpg", ImageFormat.Jpeg);  // Or Png
                }

                string ImgPath = "SiteContent/companylogo/companylogo.jpg";
                string ImgName = "companylogo.jpg";



                MySqlConnection conn = new MySqlConnection(ConString);

                conn.Open();

                MySqlCommand cmd = new MySqlCommand(
                    "UPDATE  tbprofile SET Company_Name=@pCompany_Name,Address=@pAddress,E_Mail=@pE_Mail,Phone_Number=@pPhone_Number,Fax=@pFax,Vision=@pVision,Mission=@pMission,Description_Notes=@pDescription,ImgPath=@pPath,ImgName=@pImgName WHERE id='" + Id + "'", conn);

                MySqlParameter param2 = new MySqlParameter();
                param2.ParameterName = "@pCompany_Name";
                param2.Value = Company_Name;
                cmd.Parameters.Add(param2);


                MySqlParameter param3 = new MySqlParameter();
                param3.ParameterName = "@pAddress";
                param3.Value = Address;
                cmd.Parameters.Add(param3);


                MySqlParameter param4 = new MySqlParameter();
                param4.ParameterName = "@pE_Mail";
                param4.Value = E_Mail;
                cmd.Parameters.Add(param4);


                MySqlParameter param5 = new MySqlParameter();
                param5.ParameterName = "@pPhone_Number";
                param5.Value = Phone_Number;
                cmd.Parameters.Add(param5);


                MySqlParameter param6 = new MySqlParameter();
                param6.ParameterName = "@pFax";
                param6.Value = Fax;
                cmd.Parameters.Add(param6);


                MySqlParameter param7 = new MySqlParameter();
                param7.ParameterName = "@pVision";
                param7.Value = Vision;
                cmd.Parameters.Add(param7);


                MySqlParameter param8 = new MySqlParameter();
                param8.ParameterName = "@pMission";
                param8.Value = Mission;
                cmd.Parameters.Add(param8);


                MySqlParameter param9 = new MySqlParameter();
                param9.ParameterName = "@pDescription";
                param9.Value = Description;
                cmd.Parameters.Add(param9);

                MySqlParameter param10 = new MySqlParameter();
                param10.ParameterName = "@pPath";
                param10.Value = ImgPath;
                cmd.Parameters.Add(param10);

                MySqlParameter param11 = new MySqlParameter();
                param11.ParameterName = "@pImgName";
                param11.Value = ImgName;
                cmd.Parameters.Add(param11);




                int rf = cmd.ExecuteNonQuery();
                conn.Close();


                var data = new { status = (rf > 0) };

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js.Serialize(data);
            }
        }

        

        protected void Savebtn_Click(object sender, EventArgs e)
        {

        }
    }
   
}