<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArticleApprove.aspx.cs" Inherits="NewsWebsiteAdmin.ArticleApprove" %>
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
                            <h3 class="card-title">Article List</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        
                         <div class="card-body">


                              <div class="row">
                                  <div class="col-md-4">
                                  <label for="isactiveId"> Select Language</label>&nbsp;
                                <select id="select-Language" class="form-control custom-select" >
    
                                </select>
                                  </div>

                                   <div class="col-md-4" id="categorySec">
                                          <label for="isactiveId"> Select Category</label>&nbsp;
                                <select id="select-category" class="form-control custom-select" >
  
                                </select>
                                  </div>

                                   <div class="col-md-4" id="categorySubSec">
                                          <label for="isactiveId"> Select Sub-Category</label>&nbsp;
                                <select id="select-subcategory" class="form-control custom-select" >
                                     
                                </select>
                                  </div>

                              </div>
                             <br />

                                <div class="row">
                                  <div class="col-md-3">
                                  <label for="isactiveId"> From Date</label>&nbsp;
                                <input type="date" class="form-control" id="fromdate">
                                  </div>

                                   <div class="col-md-3">
                                          <label for="isactiveId"> To Date</label>&nbsp;
                                    <input type="date" class="form-control" id="todate">
                                  </div>

                                   <div class="col-md-3">
                                          <label for="isactiveId">Article Name</label>&nbsp;
                                 <input type="text" id="articlename" class="form-control input-default">
                                  </div>

                                    <div class="col-md-3"id="btnsec"> 
                                        <label for="btnLoad">&nbsp;</label>
                                <button id="btnLoad" type="button" class="form-control btn btn-success input-default">Search Articles</button> 

                                  </div>
                              </div>

                             <br />
                            </div>
                         </div>
                        </div>

                </div>



          <div class="card" id="tablediv">
              <div class="card-header">
                <h3 class="card-title">Article Table</h3>
              </div>
              <div class="card-body">
                <table class="table table-bordered" id="TbArticleShow">
                  <thead>                  
                    <tr>
                        <th>Author</th>
                        <th>Category</th>
                        <th>Sub Category</th>
                        <th>Article Title</th>
                        <th>Created Date</th>
                        <th>Publish Status</th>
                        <th>Edit</th>
                        <th>View</th>
                    </tr>
                  </thead>
                  <tbody id="MainArticleTbBody">
              
                  </tbody>
                </table>
              </div>
            </div>
         </div>


     <div class="modal fade" id="myModal" role="dialog" >
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color: #2980B9; color:white;">
          
          <h4 class="modal-title"> Active </h4>
        </div>
        <div class="modal-body">
          
                 <div class="form-group">
                   
                   <input type="hidden" class="form-control" id="articleId" >
                    <div class="form-group">
                     Author:-
                     <input type="text" class="form-control" id="Author" readonly>
                    </div>

                     <div class="form-group">
                     Title:-
                     <input type="text" class="form-control" id="Title" >
                    </div>

                      <div class="form-group">
                     Article Content:-
                      <textarea id="ArticleContent" class="form-control" rows="20" cols="50"></textarea>     
                    </div>




                     
                 </div>
                 
                
                
                 <button type="button" class="btn btn-success" id="updateArticle"><i class="fa fa-floppy-o" aria-hidden="true"></i> Update</button>
                 

                 <button type="button" class="btn btn-dark" data-dismiss="modal" id="btncloseModel"> Close</button>
               <br><hr>

              
        
        <div class="modal-footer">
          
        </div>
      </div>
      
    </div>
  </div>
        </div>   
     <script>
   
         $(document).ready(function () {
             //loadarticleTable();
             LoadLanguage();
             $('#categorySec').hide();
             $('#categorySubSec').hide();
             $('#tablediv').hide();
             //loadArticleToTabledefailt();

             tinymce.init({
                 selector: '#ArticleContent'
             });

             //$('#select-article').selectize({
                 //sortField: 'text'
            // });


             document.getElementById("fromdate").value = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
             document.getElementById("todate").value = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);

         });

         function loadArticleToTabledefailt() {



             $("#MainArticleTbBody").empty();

             $.ajax({
                 type: 'POST',
                 url: 'ArticleApprove.aspx/LoadArticledefailt',
                 dataType: 'json',

                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {


                     var myData = JSON.parse(response.d);

                     var button = "";
                     var edit = "";
                     var view = "";
                     $.each(myData, function () {
                         var createdDate1 = this.CreatedDate;

                         finDate = createdDate1.split('T')[0];
                         edit = '<button style="background-color:blue; color:white;" data-toggle="modal" data-target="#myModal" class = "edit" id = "edit' + this.id + '">Edit</button>'
                         view = '<button style="background-color:yellow; color:black;"  class = "view" id = "view' + this.id + '">View</button>'
                         if (this.isPublished == 0) {
                             button = '<button style="background-color:red; color:white;" class = "NoActive" id = "NoActive' + this.id + '">No</button>';

                         }
                         else {
                             button = '<button style="background-color:green; color:white;" class = "activeY" id = "activeY' + this.id + '">Yes</button>';

                         }
                         $("#TbArticleShow").append('<tr><td>' + this.Name + '</td><td>' + this.Category1 + '</td><td>' + this.SubCategory1 + '</td><td>' + this.Title + '</td><td>' + finDate + '</td><td>' + button + '</td><td>' + edit + '</td><td>' + view + '</td></tr>');

                         
                     });






                 },
                 error: function (error) {
                     console.log(error);
                 }


             });
         }

         $("#myModal").on('click', '#updateArticle', function () {
            
             var id = $('#articleId').val();
             var Title = $('#Title').val();
             var content = tinymce.activeEditor.getContent();



             if (Title == "" || content == "")
             {
                 swal("Title and Content fields are required!");
             }
             else
             {
                 var data = {};

                 data.id = id;
                 data.Title = Title;
                 data.content = content;
             

                 $.ajax({
                     type: 'POST',
                     url: 'ArticleApprove.aspx/UpdateArticle',
                     dataType: 'json',

                     data: JSON.stringify(data),


                     contentType: 'application/json; charset=utf-8',
                     success: function (response) {


                         var myData = JSON.parse(response.d);

                         swal("Success", "Data Has Been Saved Successfully!", "success");
                         loadArticleToTabledefailt();
                       
                     },
                     error: function (error) {
                         console.log(error);
                     }


                 });
             }

         })

         $("#btnsec").on('click', '#btnLoad', function () {

             $('#tablediv').show();

             var Language = $('#select-Language').val();
             var category = $('#select-category').val();
             var subcategory = $('#select-subcategory').val();
            
             if (Language == 0 || category == 0 )
             {

                 swal("Language and Category fields are required!");

             }
             else
             {
                 loadArticleToTable();
             }

         })

         function loadArticleToTable()
         {
             var Language = $('#select-Language').val();
             var category = $('#select-category').val();
             var subcategory = $('#select-subcategory').val();

             var fdate = $('#fromdate').val();
             var tdate = $('#todate').val();
             var article = $('#articlename').val();

             if (fdate > tdate) {
                 swal("Error", "Start Date has to be before End Date!", "error");
                 return;
             }


             var data = {};

             data.Language = Language;
             data.category = category;
             data.subcategory = subcategory;


             data.fdate = fdate;
             data.tdate = tdate;
             data.article = article;

         
             $("#MainArticleTbBody").empty();

             $.ajax({
                 type: 'POST',
                 url: 'ArticleApprove.aspx/LoadArticle',
                 dataType: 'json',

                 data: JSON.stringify(data),


                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {


                     var myData = JSON.parse(response.d);


                     if (myData == "") {
                         swal({
                             title: "No Data to Display",
                             icon: "warning",
                         });
                         return;
                     }




                     var button = "";
                     var edit = "";
                     var view = "";
                     $.each(myData, function () {
                         var createdDate1 = this.CreatedDate;

                         finDate = createdDate1.split('T')[0];
                         edit = '<button style="background-color:blue; color:white;" data-toggle="modal" data-target="#myModal" class = "edit" id = "edit' + this.id + '">Edit</button>'
                         view = '<button style="background-color:yellow; color:black;"  class = "view" id = "view' + this.id + '">View</button>'
                         if (this.isPublished == 0) {
                             button = '<button style="background-color:red; color:white;" class = "NoActive" id = "NoActive' + this.id + '">No</button>';

                         }
                         else {
                             button = '<button style="background-color:green; color:white;" class = "activeY" id = "activeY' + this.id + '">Yes</button>';

                         }

                         $("#TbArticleShow").append('<tr><td>' + this.Name + '</td><td>' + this.Category1 + '</td><td>' + this.SubCategory1 + '</td><td>' + this.Title + '</td><td>' + finDate + '</td><td>' + button + '</td><td>' + edit + '</td><td>' + view + '</td></tr>');

                         

                     });






                 },
                 error: function (error) {
                     console.log(error);
                 }


             });
         }

         $("#TbArticleShow").on('click', '.edit', function () {


             var id = $(this).attr('id');
             var idString = id.replace(/\D/g, ''); // a string of only digits, or the empty string
             var idInt = parseInt(idString, 10); // now it's a numeric value
       

             var data = {};

             data.id = idInt;
          
            

                 $.ajax({
                     type: 'POST',
                     url: 'ArticleApprove.aspx/GetArticleEdit',
                     dataType: 'json',

                     data: JSON.stringify(data),


                     contentType: 'application/json; charset=utf-8',
                     success: function (response) {


                         var myData = JSON.parse(response.d);

                         $.each(myData, function () {
                            
                             $('#articleId').val(this.id);
                             $('#Author').val(this.Name);
                             $('#Title').val(this.Title);
                             //sss$('#ArticleContent').val(this.Content);
                             tinymce.activeEditor.setContent(this.Content);
                             if (this.isPublished == 0)
                             {
                                 $('#updateArticle').prop("disabled", false);
                             }
                             else {
                                 $('#updateArticle').prop("disabled", true);
                             }

                         });
                        


                        



                     },
                     error: function (error) {
                         console.log(error);
                     }


                 });

         })

         

         function LoadLanguage() {

             $("#select-Language").empty();
             $("#select-Language").append("<option value='0'></option>");



             //$("#btnCancel").removeAttr('disabled');
             //$("#btnSave").removeAttr('disabled');
             //$("#btnUpdate").attr('disabled', 'disabled');



             $.ajax({
                 type: 'POST',
                 url: 'ArticleApprove.aspx/loadLanguage',
                 dataType: 'json',

                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {


                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }


                     //console.log(myData);
                     $.each(myData, function () {
                         $("#select-Language").append($("<option/>").val(this.id).text(this.Language));

                        

                     });
                   

                     //$("#select-Language").select2({
                        // tags: true,
                         //tokenSeparators: [',', ' ']
                     //})

                 },




                 error: function (error) {
                     console.log(error);
                 }



             });
         }

         $('#select-Language').on('change', function () {

             var LanguageId = $(this).val();
             var data = {};

             data.LanguageId = LanguageId;

             $('#select-category').empty();

             $("#select-category").append('<option value="0"></option>');

             $.ajax({
                 type: 'POST',
                 url: 'ArticleApprove.aspx/loadCategories',
                 dataType: 'json',
                 data: JSON.stringify(data),
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {


                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }



                     $.each(myData, function () {
                         $("#select-category").append($("<option/>").val(this.PrimaryKeyId).text(this.OtherLanguageText));



                     });

                     

                 },




                 error: function (error) {
                     console.log(error);
                 }



             });

             $('#categorySec').show(1000);

         });

         $('#select-category').on('change', function () {
             var categoryId = $(this).val();
             var LanguageId = $('#select-Language').val();
             showSubCategory(LanguageId, categoryId);
         })


         function showSubCategory(LanguageId, categoryId)
         {
             var data = {};

             data.LanguageId = LanguageId;
             data.categoryId = categoryId;
             $('#select-subcategory').empty();
             $("#select-subcategory").append('<option value="0"></option>');

             $.ajax({
                 type: 'POST',
                 url: 'ArticleApprove.aspx/loadSubCategories',
                 dataType: 'json',
                 data: JSON.stringify(data),
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {


                     var myData = JSON.parse(response.d);
                 
                     if (myData == "") {
                         return;
                     }

                     $.each(myData, function () {
                         $("#select-subcategory").append($("<option/>").val(this.PrimaryKeyId).text(this.OtherLanguageText));



                     });

                    

                 },




                 error: function (error) {
                     console.log(error);
                 }



             });

             $('#categorySubSec').show(1000);
         }

          
   

         $("#TbArticleShow").on('click', '.NoActive', function () {


             var id = $(this).attr('id');
             var idString = id.replace(/\D/g, ''); // a string of only digits, or the empty string
             var idInt = parseInt(idString, 10); // now it's a numeric value

          
             var data = {};

             data.id = idInt;
             var r = confirm("Are You Sure!");
             if (r == true) {

                 $.ajax({
                     type: 'POST',
                     url: 'ArticleApprove.aspx/UpdateActive',
                     dataType: 'json',

                     data: JSON.stringify(data),


                     contentType: 'application/json; charset=utf-8',
                     success: function (response) {


                         var myData = JSON.parse(response.d);





                         swal("Success", "Data Has Been Saved Successfully!", "success");
                         loadArticleToTable();



                     },
                     error: function (error) {
                         console.log(error);
                     }


                 });

             }

          



         })



         $("#TbArticleShow").on('click', '.activeY', function () {


             var id = $(this).attr('id');
             var idString = id.replace(/\D/g, ''); // a string of only digits, or the empty string
             var idInt = parseInt(idString, 10); // now it's a numeric value
        

             var data = {};

             data.id = idInt;
             var r = confirm("Are You Sure!");
             if (r == true) {

                 $.ajax({
                     type: 'POST',
                     url: 'ArticleApprove.aspx/UpdateActiveNo',
                     dataType: 'json',

                     data: JSON.stringify(data),


                     contentType: 'application/json; charset=utf-8',
                     success: function (response) {


                         var myData = JSON.parse(response.d);





                         swal("Success", "Data Has Been Saved Successfully!", "success");
                         loadArticleToTable();



                     },
                     error: function (error) {
                         console.log(error);
                     }


                 });

             }

         })


     
       
         $("#TbArticleShow").on('click', '.view', function () {


             var id = $(this).attr('id');
             var idString = id.replace(/\D/g, ''); // a string of only digits, or the empty string
             var idInt = parseInt(idString, 10); // now it's a numeric value

             //window.location.href = "Comments.aspx?id=" + idInt;
             window.location.href = "Comments.aspx?id/" + idInt;


             //window.location.href = "Comments.aspx&id=" + idInt;
             //window.location.href = 'Comments.aspx&id=' + idInt + '';
    

         })






       

        

     </script>

</asp:Content>
