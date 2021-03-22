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
using static NewsWebsiteAdmin.SiteMaster;

namespace NewsWebsiteAdmin
{

    public partial class AuthorForm : System.Web.UI.Page
    {
        static string ConString = ConfigurationManager.AppSettings["ConString"];
        protected void Page_Load(object sender, EventArgs e)
        {

            Hashtable user = (Hashtable)HttpContext.Current.Session["user"];
            if (user == null)
            {
                Response.Redirect("~/AdminLogin.aspx");
            }
            else
            {
                SiteMaster.UserRoles userRole = (UserRoles)user["Usertype"];
                if (userRole == UserRoles.Admin || userRole == UserRoles.Author || userRole == UserRoles.Editor)
                {

                }
                else
                {
                    Response.Redirect("~/AdminLogin.aspx");
                }
            }


        }

        [WebMethod()]

        public static string SaveCustomer(String Base64Img, string Name, string Email, string Contact_no, string Password, string Registered_Date, string Yourself,string status)
        {

            if (!getcustomerdtemail( Email))
            {

                string encriptedpass = PasswordNumberValueObtaining(Password);

                if (Name.Trim() == "" || Name == null)
                {
                    System.Web.Script.Serialization.JavaScriptSerializer js1 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js1.Serialize("failed");
                }
                else if (Email.Trim() == "" || Email == null)
                {
                    System.Web.Script.Serialization.JavaScriptSerializer js2 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js2.Serialize("failed");
                }
                else if (Contact_no.Trim() == "" || Contact_no == null)
                {
                    System.Web.Script.Serialization.JavaScriptSerializer js3 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js3.Serialize("failed");
                }
                else if (Password.Trim() == "" || Password == null)
                {
                    System.Web.Script.Serialization.JavaScriptSerializer js4 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js4.Serialize("failed");
                }
                else if (Registered_Date.Trim() == "" || Registered_Date.Trim() == null)
                {
                    System.Web.Script.Serialization.JavaScriptSerializer js4 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js4.Serialize("failed");
                }
                else if (Yourself.Trim() == "" || Yourself.Trim() == null)
                {
                    System.Web.Script.Serialization.JavaScriptSerializer js5 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js5.Serialize("failed");
                }
                else
                {
                    string base64 = Base64Img.Split(',')[1];
                    byte[] bytes = Convert.FromBase64String(base64);
                    using (System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(bytes)))
                    {
                        image.Save(CommanClass.adminpath + "SiteContent/AuthorPic/" + Email + ".jpg", ImageFormat.Jpeg);  // Or Png
                    }

                    string ImgPath = "SiteContent/AuthorPic/" + Email + ".jpg";
                    string ImgName = "" + Email + ".jpg";

                    MySqlConnection conn = new MySqlConnection(ConString);
                    conn.Open();
                   
                    int usertype = 2;
                    
                    MySqlCommand cmd1 = new MySqlCommand("Insert into  user_login(name, Pic_Path, email, password, usertype) values (@usernamelog, '"+ImgPath+"', @emailaddress, @upass, " + usertype + "); Select LAST_INSERT_ID()", conn);

                    MySqlParameter param12 = new MySqlParameter();
                    param12.ParameterName = "@emailaddress";
                    param12.Value = Email;
                    cmd1.Parameters.Add(param12);

                    MySqlParameter param13 = new MySqlParameter();
                    param13.ParameterName = "@upass";
                    param13.Value = encriptedpass;
                    cmd1.Parameters.Add(param13);

                    MySqlParameter param18 = new MySqlParameter();
                    param18.ParameterName = "@usertype";
                    param18.Value = usertype;
                    cmd1.Parameters.Add(param18);

                    MySqlParameter param19 = new MySqlParameter();
                    param19.ParameterName = "@usernamelog";
                    param19.Value = Name;
                    cmd1.Parameters.Add(param19);

                    Int64 User_ID = Convert.ToInt64(cmd1.ExecuteScalar());


                    MySqlCommand cmd = new MySqlCommand("Insert into author(Name,Email,Contact_no,Password,Registered_Date,Yourself,ImgName,ImgPath,User_ID,status) values (@pName,@pEmail,@pContact_no,@pPassword,@pRegistered_Date,@pYourself,@pImgName,@pPath," + User_ID + ",@pstatus);", conn);

                    MySqlParameter param2 = new MySqlParameter();
                    param2.ParameterName = "@pName";
                    param2.Value = Name;
                    cmd.Parameters.Add(param2);


                    MySqlParameter param3 = new MySqlParameter();
                    param3.ParameterName = "@pEmail";
                    param3.Value = Email;
                    cmd.Parameters.Add(param3);

                    MySqlParameter param4 = new MySqlParameter();
                    param4.ParameterName = "@pContact_no";
                    param4.Value = Contact_no;
                    cmd.Parameters.Add(param4);

                    MySqlParameter param5 = new MySqlParameter();
                    param5.ParameterName = "@pPassword";
                    param5.Value = encriptedpass;
                    cmd.Parameters.Add(param5);

                    MySqlParameter param6 = new MySqlParameter();
                    param6.ParameterName = "@pRegistered_Date";
                    param6.Value = Registered_Date;
                    cmd.Parameters.Add(param6);

                    MySqlParameter param7 = new MySqlParameter();
                    param7.ParameterName = "@pYourself";
                    param7.Value = Yourself;
                    cmd.Parameters.Add(param7);

                    MySqlParameter param10 = new MySqlParameter();
                    param10.ParameterName = "@pPath";
                    param10.Value = ImgPath;
                    cmd.Parameters.Add(param10);

                    MySqlParameter param11 = new MySqlParameter();
                    param11.ParameterName = "@pImgName";
                    param11.Value = ImgName;
                    cmd.Parameters.Add(param11);

                    MySqlParameter param21 = new MySqlParameter();
                    param21.ParameterName = "@pstatus";
                    param21.Value = status;
                    cmd.Parameters.Add(param21);

                    int rf = cmd.ExecuteNonQuery();
                    conn.Close();

                    var data = new { status = (rf > 0) };


                    string output;

                    if (data.status == true)
                    {
                        output = "Successfully Registered.!";
                    }
                    else
                    {
                        output = "Error! Cannot Save User!";
                    }

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js.Serialize(output);

                }

            }else{
                
                System.Web.Script.Serialization.JavaScriptSerializer js8 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js8.Serialize("Email is Already Registered");
                
            }



        }





        [WebMethod()]
        public static string gridchange()
        {


            Hashtable user = (Hashtable)HttpContext.Current.Session["user"];
            UserRoles userRole = (UserRoles)user["Usertype"];
            int ID = (int)user["Id"];


            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            if (userRole == UserRoles.Author)
            {
                using (MySqlDataAdapter a = new MySqlDataAdapter(

                //"SELECT User_ID as id,Name,Email,Contact_no,Password,Registered_Date,Yourself,status FROM author WHERE User_ID = '" + ID + "' ", conn))
                    "SELECT author.User_ID as id,author.Name,author.Email,author.Contact_no,author.Password,author.Registered_Date,author.Yourself,author.status,user_login.usertype  FROM author inner join user_login on author.User_ID = user_login.id WHERE User_ID = '" + ID + "' ", conn))

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
                using (MySqlDataAdapter a = new MySqlDataAdapter(


                   "SELECT User_ID as id,Name,Email,Contact_no,Password,Registered_Date,Yourself,status FROM author ", conn))
                {
                    DataTable t = new DataTable();
                    a.Fill(t);
                    conn.Close();

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return JsonConvert.SerializeObject(t);

                }
            }



        }
        

        
        [WebMethod()]
        public static string getcustomerdt(string Id)

        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT User_ID as id,Name,Email,Contact_no,Registered_Date,Yourself,ImgPath,ImgName,Password,status From author where User_ID  = '" + Id + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }
        }

        [WebMethod()]
        public static string UpdateCustomer(String Base64Img, string Name, string Email, string Contact_no, string Registered_Date, string Yourself, int Id, string oldimg,string DatabaseEmail,string status)
        {
            if (DatabaseEmail != Email)
            {
                if (!getcustomerdtemail(Email))
                {
                    if (Base64Img.Length < 1000)
                    {
                        MySqlConnection conn = new MySqlConnection(ConString);

                        conn.Open();

                        MySqlCommand cmd = new MySqlCommand(
                            "UPDATE author SET Name=@pName,Email=@pEmail,Contact_no=@pContact_no,Registered_Date=@pRegistered_Date,Yourself=@pYourself,status=@pstatus  WHERE User_ID='" + Id + "' ", conn);

                        MySqlParameter param2 = new MySqlParameter();
                        param2.ParameterName = "@pName";
                        param2.Value = Name;
                        cmd.Parameters.Add(param2);


                        MySqlParameter param3 = new MySqlParameter();
                        param3.ParameterName = "@pEmail";
                        param3.Value = Email;
                        cmd.Parameters.Add(param3);


                        MySqlParameter param4 = new MySqlParameter();
                        param4.ParameterName = "@pContact_no";
                        param4.Value = Contact_no;
                        cmd.Parameters.Add(param4);


                        MySqlParameter param6 = new MySqlParameter();
                        param6.ParameterName = "@pRegistered_Date";
                        param6.Value = Registered_Date;
                        cmd.Parameters.Add(param6);


                        MySqlParameter param7 = new MySqlParameter();
                        param7.ParameterName = "@pYourSelf";
                        param7.Value = Yourself;
                        cmd.Parameters.Add(param7);

                        MySqlParameter param8 = new MySqlParameter();
                        param8.ParameterName = "@pstatus";
                        param8.Value = status;
                        cmd.Parameters.Add(param8);

                        int rf = cmd.ExecuteNonQuery();
                        
                        MySqlCommand cmd1 = new MySqlCommand(
                           "UPDATE user_login SET name=@pName, email=@pEmail WHERE id='" + Id + "' ", conn);

                        MySqlParameter cmd1param = new MySqlParameter();
                        cmd1param.ParameterName = "@pName";
                        cmd1param.Value = Name;
                        cmd1.Parameters.Add(cmd1param);


                        MySqlParameter cmd1param1 = new MySqlParameter();
                        cmd1param1.ParameterName = "@pEmail";
                        cmd1param1.Value = Email;
                        cmd1.Parameters.Add(cmd1param1);

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
                    else
                    {

                        File.Delete(CommanClass.adminpath + "SiteContent/AuthorPic/AuthorPic/" + oldimg + "");

                        string base64 = Base64Img.Split(',')[1];
                        byte[] bytes = Convert.FromBase64String(base64);
                        using (System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(bytes)))
                        {
                            image.Save(CommanClass.adminpath + "SiteContent/AuthorPic/" + Email + ".jpg", ImageFormat.Jpeg);  // Or Png
                        }

                        string ImgPath = "SiteContent/AuthorPic/" + Email + ".jpg";
                        string ImgName = "" + Email + ".jpg";

                        MySqlConnection conn = new MySqlConnection(ConString);

                        conn.Open();

                        MySqlCommand cmd = new MySqlCommand(
                            "UPDATE author SET Name=@pName,Email=@pEmail,Contact_no=@pContact_no,Registered_Date=@pRegistered_Date,Yourself=@pYourself,ImgPath=@pPath,ImgName=@pImgName,status=@pstatus  WHERE User_ID='" + Id + "' ", conn);

                        MySqlParameter param2 = new MySqlParameter();
                        param2.ParameterName = "@pName";
                        param2.Value = Name;
                        cmd.Parameters.Add(param2);


                        MySqlParameter param3 = new MySqlParameter();
                        param3.ParameterName = "@pEmail";
                        param3.Value = Email;
                        cmd.Parameters.Add(param3);


                        MySqlParameter param4 = new MySqlParameter();
                        param4.ParameterName = "@pContact_no";
                        param4.Value = Contact_no;
                        cmd.Parameters.Add(param4);

                        MySqlParameter param6 = new MySqlParameter();
                        param6.ParameterName = "@pRegistered_Date";
                        param6.Value = Registered_Date;
                        cmd.Parameters.Add(param6);

                        MySqlParameter param7 = new MySqlParameter();
                        param7.ParameterName = "@pYourSelf";
                        param7.Value = Yourself;
                        cmd.Parameters.Add(param7);

                        MySqlParameter param10 = new MySqlParameter();
                        param10.ParameterName = "@pPath";
                        param10.Value = ImgPath;
                        cmd.Parameters.Add(param10);

                        MySqlParameter param11 = new MySqlParameter();
                        param11.ParameterName = "@pImgName";
                        param11.Value = ImgName;
                        cmd.Parameters.Add(param11);

                        MySqlParameter param12 = new MySqlParameter();
                        param12.ParameterName = "@pstatus";
                        param12.Value = status;
                        cmd.Parameters.Add(param12);

                        int rf = cmd.ExecuteNonQuery();



                        MySqlCommand cmd1 = new MySqlCommand(
                                                  "UPDATE user_login SET name=@pName, email=@pEmail WHERE id='" + Id + "' ", conn);

                        MySqlParameter cmd1param = new MySqlParameter();
                        cmd1param.ParameterName = "@pName";
                        cmd1param.Value = Name;
                        cmd1.Parameters.Add(cmd1param);


                        MySqlParameter cmd1param1 = new MySqlParameter();
                        cmd1param1.ParameterName = "@pEmail";
                        cmd1param1.Value = Email;
                        cmd1.Parameters.Add(cmd1param1);

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
                }
                else
                {


                    System.Web.Script.Serialization.JavaScriptSerializer js8 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js8.Serialize("Email is Already Registered");


                }
            }
            else
            {

                if (Base64Img.Length < 1000)
                {


                    MySqlConnection conn = new MySqlConnection(ConString);

                    conn.Open();

                    MySqlCommand cmd = new MySqlCommand(
                        "UPDATE author SET Name=@pName,Contact_no=@pContact_no,Registered_Date=@pRegistered_Date,Yourself=@pYourself,status=@pstatus  WHERE User_ID='" + Id + "' ", conn);

                    MySqlParameter param2 = new MySqlParameter();
                    param2.ParameterName = "@pName";
                    param2.Value = Name;
                    cmd.Parameters.Add(param2);

                    MySqlParameter param4 = new MySqlParameter();
                    param4.ParameterName = "@pContact_no";
                    param4.Value = Contact_no;
                    cmd.Parameters.Add(param4);


                    MySqlParameter param6 = new MySqlParameter();
                    param6.ParameterName = "@pRegistered_Date";
                    param6.Value = Registered_Date;
                    cmd.Parameters.Add(param6);


                    MySqlParameter param7 = new MySqlParameter();
                    param7.ParameterName = "@pYourSelf";
                    param7.Value = Yourself;
                    cmd.Parameters.Add(param7);

                    MySqlParameter param12 = new MySqlParameter();
                    param12.ParameterName = "@pstatus";
                    param12.Value = status;
                    cmd.Parameters.Add(param12);

                    int rf = cmd.ExecuteNonQuery();


                    MySqlCommand cmd1 = new MySqlCommand(
                                                  "UPDATE user_login SET name=@pName WHERE id='" + Id + "' ", conn);

                    MySqlParameter cmd1param = new MySqlParameter();
                    cmd1param.ParameterName = "@pName";
                    cmd1param.Value = Name;
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
                else
                {

                    File.Delete(CommanClass.adminpath + "SiteContent/AuthorPic/" + oldimg + "");

                    string base64 = Base64Img.Split(',')[1];
                    byte[] bytes = Convert.FromBase64String(base64);
                    using (System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(bytes)))
                    {
                        image.Save(CommanClass.adminpath + "SiteContent/AuthorPic/" + Email + ".jpg", ImageFormat.Jpeg);  // Or Png
                    }

                    string ImgPath = "SiteContent/AuthorPic/" + Email + ".jpg";
                    string ImgName = "" + Email + ".jpg";

                    MySqlConnection conn = new MySqlConnection(ConString);

                    conn.Open();

                    MySqlCommand cmd = new MySqlCommand(
                        "UPDATE author SET Name=@pName,Contact_no=@pContact_no,Registered_Date=@pRegistered_Date,Yourself=@pYourself,ImgPath=@pPath,ImgName=@pImgName,status=@pstatus WHERE User_ID='" + Id + "' ", conn);

                    MySqlParameter param2 = new MySqlParameter();
                    param2.ParameterName = "@pName";
                    param2.Value = Name;
                    cmd.Parameters.Add(param2);

                    MySqlParameter param4 = new MySqlParameter();
                    param4.ParameterName = "@pContact_no";
                    param4.Value = Contact_no;
                    cmd.Parameters.Add(param4);

                    MySqlParameter param6 = new MySqlParameter();
                    param6.ParameterName = "@pRegistered_Date";
                    param6.Value = Registered_Date;
                    cmd.Parameters.Add(param6);

                    MySqlParameter param7 = new MySqlParameter();
                    param7.ParameterName = "@pYourSelf";
                    param7.Value = Yourself;
                    cmd.Parameters.Add(param7);

                    MySqlParameter param10 = new MySqlParameter();
                    param10.ParameterName = "@pPath";
                    param10.Value = ImgPath;
                    cmd.Parameters.Add(param10);

                    MySqlParameter param11 = new MySqlParameter();
                    param11.ParameterName = "@pImgName";
                    param11.Value = ImgName;
                    cmd.Parameters.Add(param11);

                    MySqlParameter param12 = new MySqlParameter();
                    param12.ParameterName = "@pstatus";
                    param12.Value = status;
                    cmd.Parameters.Add(param12);

                    int rf = cmd.ExecuteNonQuery();

                    
                    MySqlCommand cmd1 = new MySqlCommand(
                                                 "UPDATE user_login SET name=@pName WHERE id='" + Id + "' ", conn);

                    MySqlParameter cmd1param = new MySqlParameter();
                    cmd1param.ParameterName = "@pName";
                    cmd1param.Value = Name;
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
            }
        }




        [WebMethod()]
        public static string popupdelete(string Id, string Email)

        {

            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            MySqlCommand cmd = new MySqlCommand("Delete from  author WHERE  User_ID='" + Id + "' ", conn);
            MySqlCommand cmd1 = new MySqlCommand("Delete from  user_login WHERE id='" + Id + "' ", conn);

            int rf = cmd.ExecuteNonQuery();
            int rff = cmd1.ExecuteNonQuery();

            conn.Close();


            var data = new { status = (rf > 0) };
            var datarff = new { status2 = (rff > 0) };

            string output;

            if (data.status == true && datarff.status2 == true)
            {
                output = "Successfully Deleted!!";
            }
            else
            {
                output = "Error! Cannot Delete Author!";
            }

            File.Delete(CommanClass.adminpath + "SiteContent/AuthorPic/" + Email + ".jpg");
            
            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(output);

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
        public static string updatepassword(int Id, string Password, string RePassword, string current)
        {
            if (current == "" || current == null)
            {
                System.Web.Script.Serialization.JavaScriptSerializer js4 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js4.Serialize("Enter the Current Password");

            }
            else if (Password == "" || Password == null)
            {
                System.Web.Script.Serialization.JavaScriptSerializer js4 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js4.Serialize("Enter the Password");
            }
            else
            {

                String currentpass = PasswordNumberValueObtaining(current);
                String encriptedpass = PasswordNumberValueObtaining(Password);


                 if (RePassword.Trim() == "" || RePassword == null)
                {
                    System.Web.Script.Serialization.JavaScriptSerializer js6 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js6.Serialize("Re Enter the Password");
                }
                else if (RePassword != Password)
                {
                    System.Web.Script.Serialization.JavaScriptSerializer js7 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js7.Serialize("Password and Re-Entered Passwords are not same");
                }
                else if (!getcustomerdtpassword(Id, currentpass))
                {
                    
                    System.Web.Script.Serialization.JavaScriptSerializer js8 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js8.Serialize("Wrong Current Password");
                    
                }
                MySqlConnection conn = new MySqlConnection(ConString);

                conn.Open();

                MySqlCommand cmd = new MySqlCommand(
                    "UPDATE  author SET Password=@pPassword  WHERE User_ID='" + Id + "' ", conn);

                MySqlParameter param7 = new MySqlParameter();
                param7.ParameterName = "@pPassword";
                param7.Value = encriptedpass;
                cmd.Parameters.Add(param7);

                int rf = cmd.ExecuteNonQuery();


                MySqlCommand cmd1 = new MySqlCommand("UPDATE user_login SET password=@pPassword WHERE id='" + Id + "' ", conn);

                MySqlParameter cmd1param = new MySqlParameter();
                cmd1param.ParameterName = "@pPassword";
                cmd1param.Value = encriptedpass;
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

        }
       
        public static bool getcustomerdtpassword(int Id,string current)

        {  
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(
             "SELECT Password From author where User_ID  = '" + Id + "' and Password = '"+ current + "'", conn))
            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();
                if(t.Rows.Count>0)
                {
                    return true;
                }             
            }
            return false;
        }


        //Check if the email have been used to register before
        public static bool getcustomerdtemail(string Email)
        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(
                "SELECT Email From author where  Email = '" + Email + "'", conn))
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
                    MySqlConnection conn1 = new MySqlConnection(ConString);
                    conn1.Open();
                    using (MySqlDataAdapter ab = new MySqlDataAdapter(
                        "SELECT Email From reader where  Email = '" + Email + "'", conn1))
                    {
                        DataTable te = new DataTable();
                        ab.Fill(te);
                        conn1.Close();
                        if (te.Rows.Count > 0)
                        {
                            return true;
                        }
                    }
                    return false;
                }
            }

        }

        [WebMethod()]
        public static string searchAuthor(string Author, int Status)
        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

           

             if (Author == "")
                {
                    if (Status == 2)
                    {
                        using (MySqlDataAdapter a = new MySqlDataAdapter(
                           "SELECT User_ID as id, Name, Email, Contact_no, Password, Registered_Date, Yourself, status FROM author", conn))
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
                        using (MySqlDataAdapter a = new MySqlDataAdapter(
                            "SELECT User_ID as id, Name, Email, Contact_no, Password, Registered_Date, Yourself, status FROM author where  Status = '" + Status + "' ", conn))
                            {
                                DataTable t = new DataTable();
                                a.Fill(t);
                                conn.Close();

                                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                                return JsonConvert.SerializeObject(t);

                            }
                    }
                }

                else {
                    if (Status == 2)
                    {
                        using (MySqlDataAdapter a = new MySqlDataAdapter(
                              "SELECT User_ID as id, Name, Email, Contact_no, Password, Registered_Date, Yourself, status FROM author where  Name like  '%" + Author + "%' ", conn))
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
                        using (MySqlDataAdapter a = new MySqlDataAdapter(
                           "SELECT User_ID as id, Name, Email, Contact_no, Password, Registered_Date, Yourself, status FROM author where  Name like  '%" + Author + "%' And Status = '" + Status + "' ", conn))
                            {
                                DataTable t = new DataTable();
                                a.Fill(t);
                                conn.Close();

                                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                                return JsonConvert.SerializeObject(t);

                            }
                    }
                }
        }


        //[WebMethod()]
        //public static string approved()
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(


        //       "SELECT User_ID as id,Name,Email,Contact_no,Password,Registered_Date,Yourself,status FROM author where status = 1 ", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}

        //[WebMethod()]
        //public static string notapproved()
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(


        //       "SELECT User_ID as id,Name,Email,Contact_no,Password,Registered_Date,Yourself,status FROM author where status = 0", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}

        //[WebMethod()]
        //public static string all()
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(


        //       "SELECT User_ID as id,Name,Email,Contact_no,Password,Registered_Date,Yourself,status FROM author ", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}

        //[WebMethod()]
        //public static string searchbynameapprove(string keyword)
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(


        //       "SELECT User_ID as id,Name,Email,Contact_no,Password,Registered_Date,Yourself,status FROM author where  Name like  '" + keyword + "%' And Status = 1", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}

        //[WebMethod()]
        //public static string searchbynamenotapprove(string keyword)
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(


        //       "SELECT User_ID as id,Name,Email,Contact_no,Password,Registered_Date,Yourself,status FROM author where  Name like  '" + keyword + "%' And Status = 0", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}

        //[WebMethod()]
        //public static string searchbynameall(string keyword)
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(


        //       "SELECT User_ID as id,Name,Email,Contact_no,Password,Registered_Date,Yourself,status FROM author where  Name like  '" + keyword + "%' ", conn))
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
