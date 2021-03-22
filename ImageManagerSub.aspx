<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ImageManagerSub.aspx.cs" Inherits="NewsWebsiteAdmin.ImageManagerSub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <header>
        <style>
            .contentCustomer {
                padding: 10px;
                padding-top: 5px;
            }

            .customerMainActive {
                background-color: #007bff;
                color: #fff;
            }

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1059; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                padding-left: 5em;
            }

            /* Modal Content/Box */
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto; /* 15% from the top and centered */
                padding: 20px;
                border: 1px solid #888;
                width: 80%; /* Could be more or less, depending on screen size */
            }

            /* The Close Button */
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

                .close:hover,
                .close:focus {
                    color: black;
                    text-decoration: none;
                    cursor: pointer;
                }
        </style>
    </header>

    
      <div class="content-wrapper contentCustomer">
        
     
    
            <!-- Main content -->
         
            <div class="row">
                <div class="col-md-12">

                    <%-- Start of Article Category Form --%>
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Home Sub Image Management</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        
                         <div class="card-body">

                             
                             <div class="form-group">
                                 <label for="inputStatus">Select The Language </label>


                                 <select required class="form-control custom-select" id="cmbLanguage">
                                     

                                    
                                 </select>
                             </div>
                             
                             <div class="form-group" id="articlesection">
                                 <label for="inputStatus">Select The Article </label>


                                 <select required class="form-control custom-select" id="cmbArticle">

                                     <option></option>

                                    
                                 </select>
                             </div>
                            
                             <div class="form-group">
                             <label for="vehicle1"> Is Active</label>&nbsp;
                             <input type="checkbox" id="isactiveId" >
                             </div>
                             <div class="form-group">
                                 <input type="radio" id="UpNew" name="UpType" >
                                 <label for="male">Upload New Image</label><br>
                                 <input type="radio" id="UpEx" name="UpType" >
                                 <label for="female">Upload Existing Image</label><br>
                             </div>

                              <hr />

                            <div class =" row" id="allimagePriview" style="background-color:#2C3E50; padding:15px;">
                               
                            </div><br/>

                            <div class =" row" id="allVedioPriview" style="background-color:#2C3E50; padding:15px;">
                               
                            </div><br/>




                             <div class="col_full" id="newImageUpload" style="background-color:#2C3E50; padding:15px; color:white;">
                                  <form id="mainform" novalidate method="post" runat="server">
                                     <asp:FileUpload ID="fupload" runat="server" onchange='previewImage()' />
                                 
                                
                                
                                 <br />
                                 <img id="imgprv" src="http://localhost:59870/SiteContent\Defualt img\download.jpg" alt="Profile Picture" width="200" height="200" style="border-radius: 100px;" />

                                 <br />

                                 <button class="btn btn-success">Add</button>
                                  </form>
                                  
                             </div>



                              <div class="row">
                                  <table class="table table-bordered" id="TbMainImage">
                                      <thead>
                                          <tr>
                                              <th>Image</th>
                                              <th>Article</th>
                                               <th>Language</th>
                                              <th>Active</th>
                                               <th>Action</th>
                                          </tr>
                                      </thead>
                                      <tbody id="MainImageBody">
                                          
                                      </tbody>
                                  </table>
                              </div>

                        

                       

                       
                           

                        



                        

                             <br />
                             <br />
                             <br />
                             <br />

                            </div>
                         </div>
                        </div>

                </div>



            <div class="card-footer">
              
            </div>





         

         </div>




    <div class="modal fade" id="myModal" role="dialog" >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color: #2980B9; color:white;">
          
          <h4 class="modal-title"> Active</h4>
        </div>
        <div class="modal-body">
          
                 <div class="form-group">
                   
                   <input type="hidden" class="form-control" id="imgId" >
                     <input type="hidden" class="form-control" id="HomeLId">
                     <input type="hidden" class="form-control" id="LangModel">
                 </div>
                 
                 <div class="form-group">
                  
                   <div class="row">
                     <div class="col-sm-12">
                        <select class="form-control" id="LangModel1" >
                           <option value="0"></option>
                             <option value="1">English</option>
                             <option value="2">Sinhala</option>
                             <option value="3">Tamil</option>
                         </select>
                     </div>
               </div>
                 
                      <div class="form-group">
                    
                         <div class="row">
                     <div class="col-sm-12">
                        <select class="form-control" id="articleModel" >
                           
                         </select>
                     </div>
                     </div>
                     
                   </div>

                   


                 
                  
                 </div><br>
                 <div class="checkbox">
                   <label><input type="checkbox" id="activeModel">Is Active</label>
                 </div><br>
                 <button type="button" class="btn btn-success" id="UpdateImg"><i class="fa fa-floppy-o" aria-hidden="true"></i> Update</button>
                 

                 <button type="button" class="btn btn-dark" data-dismiss="modal" id="btncloseModel"> Close</button>
               <br><hr>

              
        
        <div class="modal-footer">
          
        </div>
      </div>
      
    </div>
  </div>
        </div>
      
 
    
     <script>
  
         var CatID = 0;
         var SubCatID = 0;
         var imageAdd = "";




         function previewImage() {
             var fileUpload = document.getElementById("<%= fupload.ClientID %>");

             var img = document.getElementById("imgprv");

             if (fileUpload.files && fileUpload.files[0]) {
                 var reader = new FileReader();

                 reader.onload = function (e) {
                     img.src = e.target.result;
                 }

                 imageAdd = "dd";

                 reader.readAsDataURL(fileUpload.files[0]);
             }

         }



         $(document).ready(function () {
           
             LoadArticleModel(); 
             $("#allimagePriview").hide();
             $("#allVedioPriview").hide();
             $("#newImageUpload").hide();
             $("#articlesection").hide();
             $("#articleModel").hide();
             $("#LangModel1").hide();
             LoadLanguage();

         });

         function LoadLanguage() {
             $("#cmbLanguage").empty();

             $.ajax({
                 type: 'POST',
                 url: 'ImageManagerSub.aspx/LoadLanguage',
                 dataType: 'json',

                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {



                     var myData = JSON.parse(response.d);



                     $("#cmbLanguage").append('<option value="0"></option>');
                     $.each(myData, function () {


                         $("#cmbLanguage").append('<option value=' + this.id + '>' + this.Language + '</option>');
                     });







                 },
                 error: function (error) {
                     console.log(error);
                 }

             });
         }

         $('#cmbLanguage').on('change', function () {

             var id = this.value;
             if (id == 0) {
                 $("#articlesection").hide(1000);
                 //$("#TbMainImage").empty(1000);
             }
             else {
                 LoadArticle(id);
                 loadMainImage(id);
             }

         });

         $("#UpNew, #UpEx").change(function () {

             var lan = $('#cmbLanguage').val();
             var Article = $('#cmbArticle').val();
             if (Article == "0" || lan == "0")
             {
                 swal("Language and Article fields are required!");
                 $('#UpNew').prop('checked', false);
                 $('#UpEx').prop('checked', false);
                 return;
             }
             else {
                 if ($("#UpNew").is(":checked")) {
                     $("#allimagePriview").hide(1000);
                     $("#allVedioPriview").hide();
                     $("#newImageUpload").show(1000);
                 }
                 if ($("#UpEx").is(":checked")) {
                     $("#allimagePriview").show(1000);
                     $("#allVedioPriview").show();
                     $("#newImageUpload").hide(1000);
                 }

             }
            
         }); 

         $("#cmbArticle").change(function () {

             var articleId = $(this).val();
             GetAllImages(articleId);  
             GetAllVideo();
             
           });

         function GetAllVideo() {

             $("#allVedioPriview").empty();
             var articleId = $('#cmbArticle').val();
             $.ajax({
                 type: 'POST',
                 url: 'ImageManagerSub.aspx/GetAllVideo',
                 dataType: 'json',
                 data: '{"id":"' + articleId + '"}',
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {



                     var myData = JSON.parse(response.d);
             
                     if (myData == "") {
                         return;
                     }
                     else {

                         var imgParth = "";
                        
                         $.each(myData, function () {
                             if (this.videothumb != null) {
                                 imgParth = '<img  src=' + this.videothumb + '  height="150" width="150"><div class="row" style="padding:5px;"><button class="videoPath" id="imgpathv' + this.videothumb + '">Add</button></div>';
                             }
                             
                             $("#allVedioPriview").append(' <div class="col-sm-3">' + imgParth + '</div>');
                         });

                     }

                    



                 },
                 error: function (error) {
                     console.log(error);
                 }

             });

         }

          
         function LoadArticle(id) {
            
             $("#cmbArticle").empty();
             $("#cmbArticle").append("<option value='0'></option>");

            

             //$("#btnCancel").removeAttr('disabled');
             //$("#btnSave").removeAttr('disabled');
             //$("#btnUpdate").attr('disabled', 'disabled');



             $.ajax({
                 type: 'POST',
                 url: 'ImageManagerSub.aspx/loadArticle',
                 dataType: 'json',
                 data: '{"id":"' + id + '"}',
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {


                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }

                     

                   $.each(myData, function (){
                       $("#cmbArticle").append($("<option/>").val(this.id).text(this.Title));

                    
                      
                     });

                   $("#articlesection").show(1000);

                 },


              

                 error: function (error) {
                     console.log(error);
                 }

              

             });
         }


         function LoadArticleModel() {

             $("#articleModel").empty();
             $("#articleModel").append("<option value='0'></option>");



             //$("#btnCancel").removeAttr('disabled');
             //$("#btnSave").removeAttr('disabled');
             //$("#btnUpdate").attr('disabled', 'disabled');



             $.ajax({
                 type: 'POST',
                 url: 'ImageManagerSub.aspx/loadArticle',
                 dataType: 'json',

                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {


                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }



                     $.each(myData, function () {
                         $("#articleModel").append($("<option/>").val(this.id).text(this.Title));



                     });

                 },




                 error: function (error) {
                     console.log(error);
                 }



             });
         }




     
         function GetAllImages(articleId) {

             $("#allimagePriview").empty();

             $.ajax({
                 type: 'POST',
                 url: 'ImageManagerSub.aspx/GetAllImage',
                 dataType: 'json',
                 data: '{"id":"' + articleId + '"}',
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {



                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }
                   
                     var imgParth = "";
                     var imgpath2 = "";
                     var imgpath3 = "";
                     var imgpath4 = "";
                     $.each(myData, function () {
                         if (this.Image_path != null)
                         {
                             imgParth = '<img  src=' + this.Image_path + '  height="150" width="150"><div class="row" style="padding:5px;"><button class="imgparth" id="imgpath0' + this.Image_path + '">Add</button></div>';
                         }
                         if (this.Image_path_2 != null)
                         {
                             imgpath2 = '<img src=' + this.Image_path_2 + ' height="150" width="150"><div class="row" style="padding:5px;"><button class="imgparth2" id ="imgpath2' + this.Image_path_2 + '">Add</button></div>';
                         }
                         if (this.Image_path_3 != null)
                         {
                             imgpath3 = '<img src=' + this.Image_path_3 + '  height="150" width="150"><div class="row" style="padding:5px;"><button class="imgparth3" id="imgpath3' + this.Image_path_3 + '">Add</button></div>';
                         }
                         if (this.Image_path_4 != null) {
                             imgpath4 = '<img src=' + this.Image_path_4 + ' height="150" width="150"><div class="row" style="padding:5px;"><button class="imgparth4" id="imgpath4' + this.Image_path_4 +'">Add</button></div>';
                         }
                         $("#allimagePriview").append(' <div class="col-sm-3">' + imgParth + '</div> <div class="col-sm-3">' + imgpath2 + '</div> <div class="col-sm-3">' + imgpath3 + '</div><div class="col-sm-3">' + imgpath4 + '</div>');
                     });

                     

                 },
                 error: function (error) {
                     console.log(error);
                 }

             });

         }

         $("#allimagePriview").on('click', '.imgparth', function () {


             var imagepath = $(this).attr('id');
             addImage(imagepath);
             


         })

         $("#allVedioPriview").on('click', '.videoPath', function () {


             var videopath = $(this).attr('id');
        
             addImage(videopath);



         })

         $("#allimagePriview").on('click', '.imgparth2', function () {


             var imgparth2 = $(this).attr('id');
             addImage(imgparth2);



         })

         $("#allimagePriview").on('click', '.imgparth3', function () {


             var imgparth3 = $(this).attr('id');
             addImage(imgparth3);



         })

         $("#allimagePriview").on('click', '.imgparth4', function () {


             var imgparth4 = $(this).attr('id');
             addImage(imgparth4);



         })



         $("#myModal").on('click', '#UpdateImg', function () {


             var modelLanguage = $("#LangModel").val();
             var articleModel = $("#articleModel").val();
             var id = $("#articleModel").val();

             if (modelLanguage == "0" || articleModel == "0")
             {
                 swal("Language and Article fields are required!");
             }
             else
             {
                 updateImage();
             }



         })

         function updateImage()
         {
             var modelLanguage = $("#LangModel").val();
             var articleModel = $("#articleModel").val();
             var imgId = $("#imgId").val();
             var hoLNumber = $("#HomeLId").val();
             var active = "";

             


             if ($('#activeModel').prop("checked") == true) {
                 active = 1;
             }
             else {
                 active = 0;
             }


             var data = {};

             data.id = imgId;
             data.homelId = hoLNumber;
             data.Language = modelLanguage;
             data.article = articleModel;
             data.active = active;


             $.ajax({
                 type: 'POST',
                 url: 'ImageManagerSub.aspx/updateImageSec',
                 dataType: 'json',
                 data: JSON.stringify(data),
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {


                     var myData = JSON.parse(response.d);

                    

                     if (myData ==0)
                     {
                         swal("Success", "Data Has Been Update Successfully!", "success");

                         location.reload();
                     }
                     else
                     {
                         swal("Three images Active, Cannot Update this image as a active image!!");
                     }

                    




                 },
                 error: function (error) {
                     console.log(error);
                 }


             });





         }


        

         $("#TbMainImage").on('click', '.imgedit', function () {


             var thisId = $(this).attr('id');
             var data = {};
             data.id = thisId;
             $.ajax({
                 type: 'POST',
                 url: 'ImageManagerSub.aspx/EditImageMain',
                 dataType: 'json',
                 data: JSON.stringify(data),
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {


                     var myData = JSON.parse(response.d)
                  
                     $.each(myData, function () {

                         $('#imgId').val(this.id);
                         $('#HomeLId').val(this.Language);
                         $("#articleModel").append('<option hidden selected="selected" value=' + this.articleId + '>'+this.Title+'</option>');
                         if (this.active == 1)
                         {
                             $('#activeModel').prop('checked', true); 
                         }
                         else
                         {
                             $('#activeModel').prop('checked', false);
                         }

                        

                       
                         $("#LangModel").val(this.language_Id);



                     })

                   




                 },
                 error: function (error) {
                     console.log(error);
                 }


             });
            


         })


         function addImage(imgparth)
         {
             var Language = $('#cmbLanguage').val();
             var article = $('#cmbArticle').val();
             var active = "";
          
             //var image = escapeHtml(imgparth);
             
            
             //data.article = article;
            
             //alert(img);
             
            

             if ($('#isactiveId').prop("checked") == true) {
                 active = 1;
             }
             else {
                 active = 0;
             }


             var data = {};

             data.imgparth = imgparth;
             data.Language = Language;
             data.article = article;
             data.active = active;

             if (Language == "" || article == "")
             {
                 swal("Language and Article fields are required!");
             }
             else
             {
                 $.ajax({
                     type: 'POST',
                     url: 'ImageManagerSub.aspx/AddExsitingImageMain',
                     dataType: 'json',
                     data: JSON.stringify(data),
                     contentType: 'application/json; charset=utf-8',
                     success: function (response) {


                         var myData = JSON.parse(response.d)

                         if (myData == 404)
                         {
                             swal("Three images Active, Cannot insert this image as a active image!!");
                         }
                         else
                         {
                             swal("Success", "Data Has Been Saved Successfully!", "success");
                             $('#cmbLanguage').val("");
                             $('#cmbArticle').val("");
                             $("#allimagePriview").empty();
                             $("#allimagePriview").hide(1000);

                             $('#isactiveId').prop('checked', false);
                             $('#UpNew').prop('checked', false);
                             $('#UpEx').prop('checked', false);
                             location.reload();
                         }
                         


                         
                        

                        


                     },
                     error: function (error) {
                         console.log(error);
                     }


                 });

             }





         }

         function loadMainImage(id)
         {
             var data = {};

             data.Language = id;
            

             $.ajax({
                 type: 'POST',
                 url: 'ImageManagerSub.aspx/GetAllMainImg',
                 dataType: 'json',
                 data: JSON.stringify(data),
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {

                     $("#TbMainImage").empty();
                     $('#TbMainImage').append('<table class="table table-bordered" id="TbMainImage"><thead><tr><th>Image</th><th>Article</th><th>Language</th><th>Active</th><th>Action</th></tr></thead><tbody id = "bodytable"></tbody></table>');
                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }
                     var activeCheck = "";
                    
                    
                     var lan = "";
                     $.each(myData, function () {
                         if (this.Active == 0)
                         {
                             activeCheck = "No";
                         }
                         else
                         {
                             activeCheck = "Yes";
                         }
                        
                         $("#bodytable").append(' <tr><td><img src=' + this.imagePath + ' height="90" width="90"></td><td>' + this.Title + '</td><td>' + this.Language+'</td><td>' + activeCheck + '</td><td><button style="background-color:#28B463;color:white;" data-toggle="modal" data-target="#myModal" class="imgedit" id=' + this.id + ' >Edit</button><button style="background-color:Red;color:white;"  class="imgdel" id="DelRe' + this.id +'" >Delete</button></td></tr>');
                     });



                 },
                 error: function (error) {
                     console.log(error);
                 }

             });
         }

         $("#TbMainImage").on('click', '.imgdel', function () {


             var HomeLId = $(this).attr('id');
             var idString = HomeLId.replace(/\D/g, ''); // a string of only digits, or the empty string
             var idInt = parseInt(idString, 10); // now it's a numeric value
            
             var data = {};

             data.homeLid = idInt;

             var r = confirm("Press a button!");
             if (r == true) {
                 $.ajax({
                     type: 'POST',
                     url: 'ImageManagerSub.aspx/DeleteMainImage',
                     dataType: 'json',

                     data: JSON.stringify(data),


                     contentType: 'application/json; charset=utf-8',
                     success: function (response) {


                         var myData = JSON.parse(response.d)

                         swal("Success", "Data Has Been Deleted!", "success");
                         location.reload();


                     },
                     error: function (error) {
                         console.log(error);
                     }


                 });
             } else {
                 
             }

       
             
           
             

               
             


         })

         $("#mainform").on('submit', function (e) {

             e.preventDefault();
             var Image_path = $("#imgprv").attr("src");
             //var fileUpload = document.getElementById("<%= fupload.ClientID %>");

             //var img = document.getElementById("imgprv");

             var Language = $('#cmbLanguage').val();
             var article = $('#cmbArticle').val();
             var active = "";

             //var image = escapeHtml(imgparth);


             //data.article = article;

             //alert(img);



             if ($('#isactiveId').prop("checked") == true) {
                 active = 1;
             }
             else {
                 active = 0;
             }


             var data = {};

             data.Image_path = Image_path;
             data.Language = Language;
             data.article = article;
             data.active = active;

             if (imageAdd == "") {
                 swal("Please Select the Image");
                 return false;

             }
             else {

                 $.ajax({
                     type: 'POST',
                     url: 'ImageManagerSub.aspx/saveNewImage',
                     dataType: 'json',

                     data: JSON.stringify(data),


                     contentType: 'application/json; charset=utf-8',
                     success: function (response) {


                         var myData = JSON.parse(response.d)

                         //console.log(myData);
                         if (myData == 404) {
                             swal("Three images Active, Cannot insert this image as a active image!!");
                         }
                         else {
                             swal("Success", "Data Has Been Saved Successfully!", "success");
                             location.reload();

                         }
                        


                       

                     },
                     error: function (error) {
                         console.log(error);
                     }


                 });
             }

             //console.log(Image_path);


         })


   

        

     </script>
</asp:Content>
