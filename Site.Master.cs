using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace NewsWebsiteAdmin
{
    public partial class SiteMaster : MasterPage
    {


        public enum UserRoles
        {
         
            NonUser = 0,
            Reader = 1,
            Author = 2,
            Admin = 3,
            Editor = 4,
          
            
        }

        static string ConString = ConfigurationManager.AppSettings["ConString"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Hashtable user = (Hashtable)Session["user"];
                loadMenu(user);

            }
            else
            {
                Response.Redirect("~/AdminLogin.aspx");
            }

        }


        private void loadMenu(Hashtable user)
            {
               UserRoles userRole = (UserRoles)user["Usertype"];

                MySqlConnection conn = new MySqlConnection(ConString);
                conn.Open();
                string sql = "SELECT " + userRole + " FROM user_login";
                using (MySqlDataAdapter a = new MySqlDataAdapter(sql, conn))
                {
                  
                    conn.Close();


                    if (userRole == UserRoles.Admin)
                    {

                    mAuthor.Visible = true;
                    mArticleCategories.Visible = true;
                    mArticle.Visible = true;
                    mNewArticle.Visible = true;
                    mArticleApprove.Visible = true;
                    mReaderComments.Visible = true;
                    mHomePage.Visible = true;
                    mHomeArticles.Visible = true;
                    mMainSliderImage.Visible = true;
                    mSubImage.Visible = true;
                    mEditorsBar.Visible = true;
                    mEditorPickups.Visible = true;
                    mAdvert.Visible = true;
                    mAddAdvertisement.Visible = true;
                    mCompany.Visible = true;
                    mCompanyProfile.Visible = true;
                    mBreakingNews.Visible = true;
                    mReaderManagement.Visible = true;
                    mUserManagement.Visible = true;
                    mDashBoard.Visible = true;
                    

                }
                  if (userRole == UserRoles.Author)
                  {

                    mAuthor.Visible = true;
                    mArticleCategories.Visible = true;
                    mArticle.Visible = true;
                    mNewArticle.Visible = true;
                    mArticleApprove.Visible = true;
                    mReaderComments.Visible = false;
                    mHomePage.Visible = false;
                    mHomeArticles.Visible = false;
                    mMainSliderImage.Visible = false;
                    mSubImage.Visible = false;
                    mEditorsBar.Visible = false;
                    mEditorPickups.Visible = false;
                    mAdvert.Visible = false;
                    mAddAdvertisement.Visible = false;
                    mCompany.Visible = false;
                    mCompanyProfile.Visible = false;
                    mBreakingNews.Visible = false;
                    mReaderManagement.Visible = false;
                    mUserManagement.Visible = false;
                    mDashBoard.Visible = true;



                }
                    if (userRole == UserRoles.Editor)
                    {

                    mAuthor.Visible = true;
                    mArticleCategories.Visible = true;
                    mArticle.Visible = true;
                    mNewArticle.Visible = true;
                    mArticleApprove.Visible = true;
                    mReaderComments.Visible = true;
                    mHomePage.Visible = true;
                    mHomeArticles.Visible = true;
                    mMainSliderImage.Visible = true;
                    mSubImage.Visible = true;
                    mEditorsBar.Visible = true;
                    mEditorPickups.Visible = true;
                    mAdvert.Visible = false;
                    mAddAdvertisement.Visible = false;
                    mCompany.Visible = false;
                    mCompanyProfile.Visible = false;
                    mBreakingNews.Visible = true;
                    mReaderManagement.Visible = false;
                    mUserManagement.Visible = false;
                    mDashBoard.Visible = true;

                }



            }

            }



        }
    }

  
  

    


    