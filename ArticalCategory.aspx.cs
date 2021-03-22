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
using System.Collections;
using static NewsWebsiteAdmin.SiteMaster;

namespace NewsWebsiteAdmin
{
    public partial class ArticalCategory : System.Web.UI.Page
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
                if (userRole == UserRoles.Admin || userRole == UserRoles.Editor || userRole == UserRoles.Author)
                {

                }
                else
                {
                    Response.Redirect("~/AdminLogin.aspx");
                }
            }


        }




        [WebMethod()]
        public static string loadLanguagecat()
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT * FROM  tblanguage WHERE  Default1 <> 1", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }



        [WebMethod()]
        public static string loadLanguagesub()
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT * FROM  tblanguage WHERE  Default1 <> 1", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }





        [WebMethod()]


        public static string SaveArticalCategory(string Category1, string MenuOrder, string OtherLanguageText)

        {



            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(



             "SELECT id from article_category WHERE MenuOrder = " + MenuOrder + " ", conn))



            {



                DataTable t = new DataTable();
                a.Fill(t);

                if (t.Rows.Count > 0)
                {

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js.Serialize("0");
                }
                else
                {
                    MySqlCommand cmd = new MySqlCommand("Insert into article_category(Category1,MenuOrder) values (@pcat,@pmenu); Select LAST_INSERT_ID()", conn);



                    MySqlParameter param1 = new MySqlParameter();
                    param1.ParameterName = "@pcat";
                    param1.Value = Category1;
                    cmd.Parameters.Add(param1);


                    MySqlParameter param3 = new MySqlParameter();
                    param3.ParameterName = "@pmenu";
                    param3.Value = MenuOrder;
                    cmd.Parameters.Add(param3);

                    Int64 rf = Convert.ToInt64(cmd.ExecuteScalar());

                    MySqlCommand cmd1 = new MySqlCommand("Insert into   tbotherlanguage(TableId,LanguageId,PrimaryKeyId,OtherLanguageText) values (1,1," + rf + ",@ptext); Select LAST_INSERT_ID()", conn);


                    MySqlParameter param16 = new MySqlParameter();
                    param16.ParameterName = "@ptext";
                    param16.Value = OtherLanguageText;
                    cmd1.Parameters.Add(param16);


                    int rff = cmd1.ExecuteNonQuery();



                    var data = new { status = (rf > 0) };

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js.Serialize(data);
                }



            }



        }



        [WebMethod()]


        public static string SaveTransCategory(string OtherLanguageText, string LanguageId, string PrimaryKeyId)

        {




            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();




            using (MySqlDataAdapter a = new MySqlDataAdapter(




                "SELECT id from tbotherlanguage WHERE LanguageId = " + LanguageId + " AND PrimaryKeyId ='" + PrimaryKeyId + " '", conn))


            {



                DataTable t = new DataTable();
                a.Fill(t);

                if (t.Rows.Count > 0)
                {

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js.Serialize("0");
                }
                else
                {


                    MySqlCommand cmd = new MySqlCommand("Insert into tbotherlanguage(TableId,LanguageId,PrimaryKeyId,OtherLanguageText) values (1, @plang ,@pprimary, @text);Select LAST_INSERT_ID()", conn);

                    MySqlParameter param5 = new MySqlParameter();
                    param5.ParameterName = "@plang";
                    param5.Value = LanguageId;
                    cmd.Parameters.Add(param5);

                    MySqlParameter param6 = new MySqlParameter();
                    param6.ParameterName = "@pprimary";
                    param6.Value = PrimaryKeyId;
                    cmd.Parameters.Add(param6);

                    MySqlParameter param3 = new MySqlParameter();
                    param3.ParameterName = "@text";
                    param3.Value = OtherLanguageText;
                    cmd.Parameters.Add(param3);



                    int rf = cmd.ExecuteNonQuery();
                    conn.Close();


                    var data = new { status = (rf > 0) };

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js.Serialize(data);
                }

            }
        }



        [WebMethod()]
        public static string gridchangecat()
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(
                   "SELECT * FROM  article_category WHERE MenuOrder  NOT IN (1,2)  ORDER BY MenuOrder", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }






        [WebMethod()]
        public static string gridchangeT(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(



                "select a.id, a.OtherLanguageText, b.Language from tbotherlanguage a , tblanguage b  where a.LanguageId not in (1) AND a.LanguageId = b.id AND TableId = 1 AND PrimaryKeyId = '" + id + "'", conn))
                 
            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }






        [WebMethod()]
        public static string Getcategorydtl(string id)

        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(

                "Select id,Category1,MenuOrder from article_category WHERE  id='" + id + "' ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();


                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }

        }





        [WebMethod()]
        public static string getTcategorydtl(string id)

        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(

             //"Select id,OtherLanguageText from tbotherlanguage WHERE id='" + id + "' ", conn))



             "SELECT tblanguage.id as lid, Language,OtherLanguageText, tbotherlanguage.id  as oid,tbotherlanguage.PrimaryKeyId as prid " +
             "FROM tblanguage " +
             "INNER JOIN  tbotherlanguage ON tblanguage.id = tbotherlanguage.LanguageId WHERE tbotherlanguage.id  = '" + id + "'", conn))



            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();


                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }

        }




        [WebMethod()]

        public static string UpdateCategory(string Category1, string MenuOrder, string OtherLanguageText, int id)
        {


            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(



             "SELECT id from article_category WHERE MenuOrder = " + MenuOrder + " AND id != '" + id + "'", conn))



            {



                DataTable t = new DataTable();
                a.Fill(t);
                if (t.Rows.Count > 0)
                {

                    System.Web.Script.Serialization.JavaScriptSerializer js1 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js1.Serialize("0");
                }


            }

                
               


                    MySqlCommand cmd = new MySqlCommand(
                      "UPDATE article_category SET Category1 = @pcat, MenuOrder = @pmenu WHERE id='" + id + "' ", conn);




                    MySqlParameter param1 = new MySqlParameter();
                    param1.ParameterName = "@pcat";
                    param1.Value = Category1;
                    cmd.Parameters.Add(param1);


                    MySqlParameter param3 = new MySqlParameter();
                    param3.ParameterName = "@pmenu";
                    param3.Value = MenuOrder;
                    cmd.Parameters.Add(param3);

                    MySqlParameter param6 = new MySqlParameter();
                    param6.ParameterName = "@pid";
                    param6.Value = id;
                    cmd.Parameters.Add(param6);

                    int rf = cmd.ExecuteNonQuery();

                    MySqlCommand cmd1 = new MySqlCommand(
                    "UPDATE  tbotherlanguage SET OtherLanguageText = @ptext WHERE PrimaryKeyId='" + id + "' ", conn);




                    MySqlParameter param11 = new MySqlParameter();
                    param11.ParameterName = "@ptext";
                    param11.Value = OtherLanguageText;
                    cmd1.Parameters.Add(param11);

                    int rff = cmd1.ExecuteNonQuery();
                    conn.Close();


                    var data = new { status = (rf > 0) };

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js.Serialize(data);
                


            
        }

        [WebMethod()]

        public static string UpdateTCategory(string OtherLanguageText, string LanguageId, int id,int priID)
        {


            MySqlConnection conn = new MySqlConnection(conString);

            conn.Open();


            using (MySqlDataAdapter a = new MySqlDataAdapter(



          //"SELECT id from article_subcategory WHERE MenuOrder = " + MenuOrder + " AND id != '" + id + "'", conn))
          "SELECT id from tbotherlanguage WHERE TableId = '1' AND PrimaryKeyId = '" + priID + "' AND LanguageId = '" + LanguageId + "' AND id!='"+id+"'", conn))


            {



                DataTable t = new DataTable();
                a.Fill(t);

                if (t.Rows.Count > 0)
                {

                    System.Web.Script.Serialization.JavaScriptSerializer js1 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js1.Serialize("0");
                }


            }


            MySqlCommand cmd = new MySqlCommand(
              "UPDATE tbotherlanguage SET OtherLanguageText = @ptext , LanguageId = @plan  WHERE id='" + id + "' ", conn);


            MySqlParameter param11 = new MySqlParameter();
            param11.ParameterName = "@plan";
            param11.Value = LanguageId;
            cmd.Parameters.Add(param11);



            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@ptext";
            param1.Value = OtherLanguageText;
            cmd.Parameters.Add(param1);



            MySqlParameter param2 = new MySqlParameter();
            param2.ParameterName = "@pid";
            param2.Value = id;
            cmd.Parameters.Add(param2);

            int rf = cmd.ExecuteNonQuery();
            conn.Close();



            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);
        }




        [WebMethod()]
        public static string popupdelete(string id)

        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(

            "SELECT id FROM article_subcategory  WHERE  ArticleCat_ID='" + id + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                if (t.Rows.Count > 0)
                {
                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js.Serialize("0");
                }
                else
                {



                    MySqlCommand cmd = new MySqlCommand("Delete from article_category WHERE  id='" + id + "' ", conn);

                            int rf = cmd.ExecuteNonQuery();


                            MySqlCommand cmd1 = new MySqlCommand("Delete from tbotherlanguage WHERE  PrimaryKeyId='" + id + "' ", conn);

                            int rff = cmd1.ExecuteNonQuery();
                            conn.Close();


                            var data = new { status = (rf > 0) };

                            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                            return js.Serialize(data);

                      
                    
                }
            }
        }
    

        [WebMethod()]
        public static string popupdeleteT(string id)

        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            MySqlCommand cmd = new MySqlCommand("Delete from tbotherlanguage WHERE  id='" + id + "' ", conn);

            int rf = cmd.ExecuteNonQuery();

            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

        }


        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////                            //////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////// Article Subcategory Form   //////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////                            //////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        [WebMethod()]

        public static string SaveSub(string SubCategory1, string MenuOrder, string ArticleCat_ID, string OtherLanguageText, string subcatmenuorder)
        {


            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(



            "SELECT id from article_subcategory WHERE subcatmenuorder = " + subcatmenuorder + " AND ArticleCat_ID ='"+ ArticleCat_ID + "'", conn))
           



            {



                DataTable t = new DataTable();
                a.Fill(t);

                if (t.Rows.Count > 0)
                {

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js.Serialize("0");
                }
                else
                {



                    MySqlCommand cmd = new MySqlCommand("Insert into article_subcategory(SubCategory1,MenuOrder,ArticleCat_ID,subcatmenuorder) values (@psub,@pmenu,@paid,@psubcatmenuorder); Select LAST_INSERT_ID()", conn);

                    MySqlParameter param1 = new MySqlParameter();
                    param1.ParameterName = "@psub";
                    param1.Value = SubCategory1;
                    cmd.Parameters.Add(param1);


                    MySqlParameter param15 = new MySqlParameter();
                    param15.ParameterName = "@pmenu";
                    param15.Value = MenuOrder;
                    cmd.Parameters.Add(param15);
                    
                    MySqlParameter param17 = new MySqlParameter();
                    param17.ParameterName = "@paid";
                    param17.Value = ArticleCat_ID;
                    cmd.Parameters.Add(param17);

                    MySqlParameter param18 = new MySqlParameter();
                    param18.ParameterName = "@psubcatmenuorder";
                    param18.Value = subcatmenuorder;
                    cmd.Parameters.Add(param18);

                    Int64 rf = Convert.ToInt64(cmd.ExecuteScalar());

                    MySqlCommand cmd1 = new MySqlCommand("Insert into tbotherlanguage(TableId,LanguageId,PrimaryKeyId,OtherLanguageText) values (2,1," + rf + ",@ptext); Select LAST_INSERT_ID()", conn);


                    MySqlParameter param16 = new MySqlParameter();
                    param16.ParameterName = "@ptext";
                    param16.Value = OtherLanguageText;
                    cmd1.Parameters.Add(param16);




                    int rff = cmd1.ExecuteNonQuery();
                    conn.Close();

                    var data = new { status = (rf > 0) };

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js.Serialize(data);


                }
            }
        }

        [WebMethod()]
        public static string gridchangesub(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(

                "select id,SubCategory1,MenuOrder,subcatmenuorder from  article_subcategory where ArticleCat_ID='" + id + "' ORDER BY MenuOrder", conn))
            

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }



        [WebMethod()]
        public static string getsubdtl(string id)

        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(
                "Select id,SubCategory1,MenuOrder,subcatmenuorder from article_subcategory WHERE  id='" + id + "' ", conn))


        


            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();


                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }

        }

        [WebMethod()]
        public static string Updatesub(string SubCategory1, string MenuOrder, string OtherLanguageText, string id,string artiID)
        {


            MySqlConnection conn = new MySqlConnection(conString);

            conn.Open();



            using (MySqlDataAdapter a = new MySqlDataAdapter(



            //"SELECT id from article_subcategory WHERE MenuOrder = " + MenuOrder + " AND id != '" + id + "'", conn))
            "SELECT id from article_subcategory WHERE subcatmenuorder = " + MenuOrder + " AND ArticleCat_ID = '" + id + "' AND id!='"+ artiID + "'", conn))


            {



                DataTable t = new DataTable();
                a.Fill(t);

                if (t.Rows.Count > 0)
                {

                    System.Web.Script.Serialization.JavaScriptSerializer js1 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js1.Serialize("0");
                }


            }
                



                    MySqlCommand cmd = new MySqlCommand(
                    "UPDATE  article_subcategory SET SubCategory1 = @psub,subcatmenuorder = @pmenu   WHERE id='" + artiID + "' ", conn);

                    MySqlParameter param1 = new MySqlParameter();
                    param1.ParameterName = "@psub";
                    param1.Value = SubCategory1;
                    cmd.Parameters.Add(param1);


                    MySqlParameter param3 = new MySqlParameter();
                    param3.ParameterName = "@pmenu";
                    param3.Value = MenuOrder;
                    cmd.Parameters.Add(param3);

                    int rf = cmd.ExecuteNonQuery();


                    MySqlCommand cmd1 = new MySqlCommand(
                    "UPDATE  tbotherlanguage SET OtherLanguageText = @ptext  WHERE PrimaryKeyId='" + artiID + "' AND TableId = '2' AND LanguageId = '1' ", conn);

                    MySqlParameter param11 = new MySqlParameter();
                    param11.ParameterName = "@ptext";
                    param11.Value = OtherLanguageText;
                    cmd1.Parameters.Add(param11);


                    int rff = cmd1.ExecuteNonQuery();
                    conn.Close();


                    var data = new { status = (rf > 0) };

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js.Serialize(data);
                
            
        }

        [WebMethod()]
        public static string gridchangesubT(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                //"select id,OtherLanguageText from  tbotherlanguage where TableId=1 and LanguageId=2 and PrimaryKeyId='" + id + "'", conn))
                "select a.id, a.OtherLanguageText,b.Language from tbotherlanguage a, tblanguage b where LanguageId not in (1) AND a.LanguageId = b.id AND TableId = 2 and PrimaryKeyId = '" + id + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]


        public static string SaveTransSubCategory(string OtherLanguageText, string LanguageId, string PrimaryKeyId)

        {


            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();




            using (MySqlDataAdapter a = new MySqlDataAdapter(




             "SELECT id from tbotherlanguage WHERE LanguageId = " + LanguageId + " AND PrimaryKeyId ='" + PrimaryKeyId + " '", conn))


            {



                DataTable t = new DataTable();
                a.Fill(t);

                if (t.Rows.Count > 0)
                {

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js.Serialize("0");
                }
                else
                {



                    MySqlCommand cmd = new MySqlCommand("Insert into tbotherlanguage(TableId,LanguageId,PrimaryKeyId,OtherLanguageText) values (2, @plang ,@pprimary, @text);Select LAST_INSERT_ID()", conn);

                    MySqlParameter param5 = new MySqlParameter();
                    param5.ParameterName = "@plang";
                    param5.Value = LanguageId;
                    cmd.Parameters.Add(param5);

                    MySqlParameter param6 = new MySqlParameter();
                    param6.ParameterName = "@pprimary";
                    param6.Value = PrimaryKeyId;
                    cmd.Parameters.Add(param6);

                    MySqlParameter param3 = new MySqlParameter();
                    param3.ParameterName = "@text";
                    param3.Value = OtherLanguageText;
                    cmd.Parameters.Add(param3);



                    int rf = cmd.ExecuteNonQuery();
                    conn.Close();


                    var data = new { status = (rf > 0) };

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js.Serialize(data);
                }

            }
        }




        [WebMethod()]
        public static string popupdelete1(string id)

        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            MySqlCommand cmd = new MySqlCommand("Delete from  article_subcategory WHERE  id='" + id + "' ", conn);

            int rf = cmd.ExecuteNonQuery();

            MySqlCommand cmd1 = new MySqlCommand("Delete from  tbotherlanguage WHERE  PrimaryKeyId='" + id + "' ", conn);

            int rff = cmd1.ExecuteNonQuery();

            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

        }





        [WebMethod()]
        public static string getsubTdtl(string id)

        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(

              // "Select id,OtherLanguageText from tbotherlanguage WHERE id='" + id + "' ", conn))
              "SELECT tblanguage.id as lid, Language,OtherLanguageText, tbotherlanguage.id  as oid,tbotherlanguage.PrimaryKeyId as pid " +
             "FROM tblanguage " +
             "INNER JOIN  tbotherlanguage ON tblanguage.id = tbotherlanguage.LanguageId WHERE tbotherlanguage.id  = '" + id + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();


                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }

        }





        [WebMethod()]

        public static string UpdateTsubCategory(string OtherLanguageText, int id,int changeLanguage,int PrimaryKEyID)
        {


            MySqlConnection conn = new MySqlConnection(conString);

            conn.Open();



            using (MySqlDataAdapter a = new MySqlDataAdapter(



           //"SELECT id from article_subcategory WHERE MenuOrder = " + MenuOrder + " AND id != '" + id + "'", conn))
           "SELECT id from tbotherlanguage WHERE TableId = '2' AND PrimaryKeyId = '" + PrimaryKEyID + "' AND LanguageId = '"+ changeLanguage + "' AND id!='"+id+"'", conn))


            {



                DataTable t = new DataTable();
                a.Fill(t);

                if (t.Rows.Count > 0)
                {

                    System.Web.Script.Serialization.JavaScriptSerializer js1 = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js1.Serialize("0");
                }


            }


            MySqlCommand cmd = new MySqlCommand(
              "UPDATE tbotherlanguage SET OtherLanguageText = @ptext , LanguageId = @LanguageId WHERE id='" + id + "' ", conn);




            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@ptext";
            param1.Value = OtherLanguageText;
            cmd.Parameters.Add(param1);



            MySqlParameter param2 = new MySqlParameter();
            param2.ParameterName = "@LanguageId";
            param2.Value = changeLanguage;
            cmd.Parameters.Add(param2);

            int rf = cmd.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);
        }





        [WebMethod()]
        public static string popupdeleteTsb(string id)

        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            MySqlCommand cmd = new MySqlCommand("Delete from tbotherlanguage WHERE  id='" + id + "' ", conn);

            int rf = cmd.ExecuteNonQuery();



            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

        }










    }

}
   