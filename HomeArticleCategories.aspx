<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomeArticleCategories.aspx.cs" Inherits="NewsWebsiteAdmin.HomeArticleCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
      <header>
        <style>
            .contentCustomer {
                padding: 5px;
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
                            <h3 class="card-title">Article Categeries </h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        

                        <div class="card-body">

                             <input type="hidden" id="hiddenid" class="form-control"  />

                            <div class="form-group">
                                <label for="inputClientCompany">Language</label>
                                <span>* </span>
                                 <select required class="form-control custom-select" id="cmbLanguage">
                                    

                                    
                                 </select>
                             </div>
                            <div class="form-group">
                                <label for="inputClientCompany">Select Category</label>
                                <span>* </span>
                                 <select required class="form-control custom-select" id="cmbcategories">
                                   

                                    
                                 </select>
                            </div>

                             

                             <div class="form-group">
                                <label for="inputClientCompany">Order</label>
                                <span>* </span>
                                 <select required class="form-control custom-select" id="cmbOrder">
                                     
                                     <option value="0"></option>
                                     <option value="1">1</option>
                                      <option value="2">2</option>
                                      <option value="3">3</option>
                                       <option value="4">4</option>
                                      <option value="5">5</option>
                                    
                                 </select>
                            </div>

                            <div class="form-group">
                               
                                <input type="hidden" id="txtdisplay" class="form-control" placeholder="Display Text" contenteditable="false" required />
                            </div>

                             <div class="form-group">
                             <label for="isactiveId"> Is Active</label>&nbsp;
                             <input type="checkbox" id="isactiveId" >
                             </div>

                           <%--  <div class="form-group">
                                <label for="inputProjectLeader">Created Date</label>
                                <span>* </span>
                                <input type="date" id="txtcreateddate" class="form-control" placeholder="Created Date" contenteditable="false" required />
                            </div>--%>

                           

                        </div>

                    </div>
                    <%-- End of Article Category Form --%>

                </div>


              
             
            </div>


            <div class="card-footer" id="cateTaskSec">
                <button id="btnSave" type="button" class="btn btn-success">Save</button>
                 <button id="btnupdate" type="button" class="btn btn-primary">Update</button>
                <button id="btnclear" type="button" class="btn btn-warning">Clear</button>
             
               
            </div>

     
         
          
         <%-- Start Of Artial Category Grid --%>

              <div class="card">
            <div class="card-header">
                <h3 class="card-title">Categories</h3>
            </div>

            <div class="card-body">

                <table id="tblcatogerylist" class="table table-bordered table-hover" style="display: inline-table">
                    <thead>
                        <tr>
                            <th>Category </th>
                           
                            <th>Language </th>
                             <th>Order </th>
                            <th>Is Active</th>
                            <th>Action</th>
                            
                           
                        </tr>
                    </thead>
              

                    <tbody id="catebody">


                    </tbody>

                  
                </table>
            </div>
        </div>
       <%-- End Of Artical Category Grid --%>
    
           </div>
      
    <%--Start Of Article  Popup Grid --%>

    <div id="myModal" class="modal fade" role="dialog">
  <div class=" modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
       
        <h4 class="modal-title">Add Article</h4>
      </div>
      <div class="modal-body">
            <input type="hidden" id="hiddencatidModel" class="form-control"  /><br />
               <input type="hidden" id="hiddenOrderID" class="form-control"  /><br />
           <input type="hidden" id="hiddencatidModelArticle" class="form-control"  /><br />
            <div class="form-group">
                                <label for="inputClientCompany">Select Article</label>
                                <span>* </span>
                                 <select required class="form-control custom-select" id="cmbArticle">
                                     
                                    
                                 </select>
           </div>

          <div class="form-group">
                                <label for="inputClientCompany">Select Language</label>
                                <span>* </span>
                                 <select required class="form-control custom-select" id="cmbMlanguage">
                                   
                                     

                                    
                                 </select>
           </div>

           <div class="form-group">
                             <label for="ismactiveId"> Is Active</label>&nbsp;
                             <input type="checkbox" id="ismactiveId" >
                             </div>
          <div class="row">
                <button id="btnmSave" type="button" class="btn btn-success">Save</button>&nbsp;
                 <button id="btnmupdate" type="button" class="btn btn-primary">Save</button>&nbsp;
                <button id="btnmclear" type="button" class="btn btn-warning">Clear</button>
          </div><br />
           <div class="row" >
                   <table id="tblArticlelist" class="table table-bordered table-hover" style="display: inline-table">
                    <thead>
                        <tr>
                            <th>Article </th>
                            <th>Language </th>
                            <th>Is Active</th>
                            <th>Action</th>
                            
                           
                        </tr>
                    </thead>
              

                    <tbody id="articlelistbody">


                    </tbody>

                  
                </table>
           </div>
              
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>







    <script>

        $(document).ready(function () {

            
            loadHomecategories();
         
            $('#btnupdate').hide(); 
            //LoadArticle();
            $('#btnmupdate').hide();
            LoadLanguage();


            function LoadLanguage() {
                $("#cmbLanguage").empty();

                $.ajax({
                    type: 'POST',
                    url: 'HomeArticleCategories.aspx/LoadLanguage',
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
                    //$("#articlesection").hide(1000);
                    //$("#TbMainImage").empty(1000);
                }
                else {
                    //LoadArticle(id);
                    loadHomecategories(id);
                    LoadCategories(id);
                  
                }

            });

            $("#cateTaskSec").on('click', '#btnSave', function () {

                var Categories = $("#cmbcategories").val();
                var displayText = $("#txtdisplay").val();
                var language = $("#cmbLanguage").val();
                var Order = $("#cmbOrder").val();

                if (Categories == "0" || displayText == "" || language == "0" || Order == "0")
                {
                    swal("Categories , displayText , Language and Order fields are required!");
                }
                else
                {
                    saveCate();
                }
               

            })

            $("#cateTaskSec").on('click', '#btnclear', function () {

                location.reload();


            })


            $("#myModal").on('click', '#btnmclear', function () {

                clear();
               

            })

            function clear()
            {
                //LoadArticle();

                $("#hiddencatidModelArticle").val("");
                $('#ismactiveId').prop('checked', false);
                $('#btnmSave').show();
                $('#btnmupdate').hide();
                LoadArticle(hiddencatidModel);
            }




            function LoadCategories(id) {

                $("#cmbcategories").empty();
                $("#cmbcategories").append("<option value='0'></option>");



                //$("#btnCancel").removeAttr('disabled');
                //$("#btnSave").removeAttr('disabled');
                //$("#btnUpdate").attr('disabled', 'disabled');
                var data = {};

                data.id = id;
               


                $.ajax({
                    type: 'POST',
                    url: 'HomeArticleCategories.aspx/loadCategories',
                    dataType: 'json',
                    data: JSON.stringify(data),
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {


                        var myData = JSON.parse(response.d);
                        if (myData == "") {
                            return;
                        }



                        $.each(myData, function () {
                            $("#cmbcategories").append($("<option/>").val(this.PrimaryKeyId).text(this.OtherLanguageText));



                        });

                    },




                    error: function (error) {
                        console.log(error);
                    }



                });
            }

            $("#cmbcategories").change(function () {
                var n = $("#cmbcategories :selected").text();
                $("#txtdisplay").val(n);
                
            });


            $("#btnupdate").click(function (e) {
                e.preventDefault();


                var Categories = $("#cmbcategories").val();
                var displayText = $("#txtdisplay").val();
                var language = $("#cmbLanguage").val();
                var Order = $("#cmbOrder").val();
                var active = "";
                var id = language;
           
                if (Categories == "0" || displayText == "" || language == "0" || Order == "0") {
                    swal(" fields are required!");
                }

                else {
                    if ($('#isactiveId').prop("checked") == true) {
                        active = 1;
                    }
                    else {
                        active = 0;
                    }

                    var id2 = $("#hiddenid").val();

                    var data = {};

                    data.id = id2;
                    data.Categories = Categories;
                    data.displayText = displayText;
                    data.language = language;
                    data.Order = Order;
                    data.active = active;

                    $.ajax({
                        type: 'POST',
                        url: 'HomeArticleCategories.aspx/UpdateCategories',
                        dataType: 'json',
                        data: JSON.stringify(data),

                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {

                            var myData = JSON.parse(response.d);
                            if (myData == "") {
                                return;
                            }

                            swal("Success", "Data Has Been Updated!", "success");
                            loadHomecategories(id);

                            $("#cmbcategories").val("0");
                            $("#cmbOrder").val("0");
                            $('#isactiveId').prop('checked', false);

                        },
                        error: function (error) {
                            console.log(error);
                        }

                    });
                }

            });


            function saveCate() {


              
                var Categories = $("#cmbcategories").val();
                var displayText = $("#txtdisplay").val();

               
                var language = $("#cmbLanguage").val();
                var Order = $("#cmbOrder").val();

                var active = "";




                if ($('#isactiveId').prop("checked") == true) {
                    active = 1;
                }
                else {
                    active = 0;
                }


                var data = {};

                data.Categories = Categories;
                data.displayText = displayText;
                data.active = active;
                data.language = language;
                data.Order = Order;




                $.ajax({
                    type: 'POST',
                    url: 'HomeArticleCategories.aspx/saveCate',
                    dataType: 'json',
                    data: JSON.stringify(data),
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var myData = JSON.parse(response.d)

                       
                        if (myData == '1') {

                            swal({
                                text: "Category or Order number, already  Defined!",
                                icon: "warning",
                                dangerMode: true,
                            })
                               
                        }

                        else {
                            swal("Success", "Data Has Been Saved Successfully!", "success");

                        }





                    },
                    error: function (error) {
                        console.log(error);
                    }


                });


            }


            function loadHomecategories(id) {

                var data = {};


                data.Language = id;
                

                $.ajax({
                    type: 'POST',
                    url: 'HomeArticleCategories.aspx/GetAllcategories',
                    dataType: 'json',
                    data: JSON.stringify(data),
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {



                        var myData = JSON.parse(response.d);
                      
                        
                        var activeCheck = "";
                        //console.log(myData);
                        $(" #catebody").empty();
                        var lan = "";
                        $.each(myData, function () {
                            if (this.isActive == 0) {
                                activeCheck = "No";
                            }
                            else {
                                activeCheck = "Yes";
                            }
                            
                            $("#tblcatogerylist").append('<tr><td class = ' + this.id + '>' + this.OtherLanguageText + '</td><td>' + this.Language+'</td><td id="order'+this.id+'">' + this.orderCheck + '</td><td>' + activeCheck + '</td><td><button style="background-color:#28B463;color:white;"  class="cateedit" id=' + this.id + ' >Edit</button><button style="background-color:Red;color:white;"  class="catedel" id="Delcate' + this.id + '" >Delete</button><button style="background-color:blue;color:white;" data-toggle="modal" data-target="#myModal" class="Addarticle" id="AddAr' + this.id + '" >Add Article</button></td></tr>');
                        });



                    },
                    error: function (error) {
                        console.log(error);
                    }

                });
            }
            $("#tblcatogerylist").on('click', '.Addarticle', function () {
                var cateID = $(this).attr('id');
                var idString = cateID.replace(/\D/g, ''); // a string of only digits, or the empty string
                var idInt = parseInt(idString, 10); // now it's a numeric value
                $('#ismactiveId').prop('checked', false);
                showArticleGrid(idInt);
                LoadLanforArticlePop(idInt);
                var orid = $('#order' + idInt).text();
                $('#hiddenOrderID').val(orid);

                LoadArticle(idInt);
              

                clear();



            })

            function LoadLanforArticlePop(intid) {

                $('#cmbMlanguage').empty();
                var data = {};



                data.intid = intid;

               


                $.ajax({
                    type: 'POST',
                    url: 'HomeArticleCategories.aspx/getlangforpop',
                    dataType: 'json',

                    data: JSON.stringify(data),


                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {


                        var myData = JSON.parse(response.d);
                    
                        
                        $.each(myData, function () {

                           
                            $("#cmbMlanguage").append('<option hidden selected="selected" value=' + this.id + '>' + this.Language + '</option>');
                        });

                        $('#cmbMlanguage').attr("disabled", true);






                    },
                    error: function (error) {
                        console.log(error);
                    }


                });
            }

            function showArticleGrid(idInt)
            {

                $('#articlelistbody').empty();
                var data = {};



                data.id = idInt;

                $('#hiddencatidModel').val(idInt);
              

                $.ajax({
                    type: 'POST',
                    url: 'HomeArticleCategories.aspx/GetArticle',
                    dataType: 'json',

                    data: JSON.stringify(data),


                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {


                        var myData = JSON.parse(response.d);
                        var activeCheck = "";
                        var lan = "";
                        $.each(myData, function () {
                            
                            if (this.isActive == 0) {
                                activeCheck = "No";
                            }
                            else {
                                activeCheck = "Yes";
                            }
                          
                            $("#tblArticlelist").append('<tr><td>' + this.Title + '</td><td>' +this.Language+'</td><td>' + activeCheck + '</td><td><button style="background-color:#28B463;color:white;"  class="Articleedit" id=' + this.id + ' >Edit</button><button style="background-color:Red;color:white;"  class="articleDel" id="articleDel' + this.id + '" >Delete</button></td></tr>');
                        });






                    },
                    error: function (error) {
                        console.log(error);
                    }


                });
            }


            $("#myModal").on('click', '#btnmupdate', function () {

                var cate = $('#hiddencatidModel').val();
                var Article = $('#cmbArticle').val();
                var id = $('#hiddencatidModelArticle').val();
                var Language = $('#cmbMlanguage').val(); 
                var active = "";
                if ($('#ismactiveId').prop("checked") == true) {
                    active = 1;
                }
                else {
                    active = 0;
                }

                if (Article != 0 && Language != 0)
                {
                    var data = {};

                    data.Article = Article;
                    data.id = id;
                    data.active = active;
                    data.Language = Language;

                    $.ajax({
                        type: 'POST',
                        url: 'HomeArticleCategories.aspx/UpdateArticle',
                        dataType: 'json',
                        data: JSON.stringify(data),

                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {


                            var myData = JSON.parse(response.d);
                            if (myData == "") {
                                return;
                            }
                            $('#btnmupdate').hide();
                            $('#btnmSave').show();
                            clear();
                            showArticleGrid(cate);

                            swal("Success", "Data Has Been Updated!", "success");


                        },




                        error: function (error) {
                            console.log(error);
                        }



                    });
                }
                else
                {
                    swal("Article and Language fields are required!");
                }
              



               
            })


            $("#tblArticlelist").on('click', '.Articleedit', function () {
                var id = $(this).attr('id');
                editArticles(id);

            })


            function editArticles(id) {




                //$("#btnCancel").removeAttr('disabled');
                //$("#btnSave").removeAttr('disabled');
                //$("#btnUpdate").attr('disabled', 'disabled');
                var data = {};

                data.id = id;
              

                $.ajax({
                    type: 'POST',
                    url: 'HomeArticleCategories.aspx/editArticle',
                    dataType: 'json',
                    data: JSON.stringify(data),

                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {


                        var myData = JSON.parse(response.d);
                        if (myData == "") {
                            return;
                        }
                        $('#btnmupdate').show();
                        $('#btnmSave').hide();
               

                        $.each(myData, function () {
                            $("#cmbArticle").append('<option hidden selected="selected" value=' + this.ArticleID + '>' + this.Title + '</option>');
                         
                            $("#hiddencatidModelArticle").val(this.id);
                            if (this.isActive == 1) {
                                $('#ismactiveId').prop('checked', true);
                            }
                            else {
                                $('#ismactiveId').prop('checked', false);
                            }

                           
                            if (this.language == 1) {
                                $("#cmbMlanguage").append('<option hidden selected="selected" value="1">English</option>');
                            }
                            if (this.language == 2) {
                                $("#cmbMlanguage").append('<option hidden selected="selected" value="2">Sinhala</option>');
                            }
                            if (this.language == 3) {
                                $("#cmbMlanguage").append('<option hidden selected="selected" value="3">Tamil</option>');
                            }

                        });

                    },




                    error: function (error) {
                        console.log(error);
                    }



                });
            }

            $("#tblArticlelist").on('click', '.articleDel', function () {
                var id = $(this).attr('id');
                var idString = id.replace(/\D/g, ''); // a string of only digits, or the empty string
                var idInt = parseInt(idString, 10); // now it's a numeric value
                var hid = $('#hiddencatidModel').val();
                var data = {};
           
                data.id = idInt;

                var r = confirm("Are You Sure, You want to delete this!");
                if (r == true) {
                    $.ajax({
                        type: 'POST',
                        url: 'HomeArticleCategories.aspx/DeleteArticle',
                        dataType: 'json',

                        data: JSON.stringify(data),


                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {


                            var myData = JSON.parse(response.d);

                            
                                swal("Success", "Data Has Been Deleted!", "success");

                                showArticleGrid(hid);
                                LoadArticle();




                        },
                        error: function (error) {
                            console.log(error);
                        }


                    });
                } else {

                }




            })

            $("#tblcatogerylist").on('click', '.catedel', function () {

                var cateID = $(this).attr('id');
                var idString = cateID.replace(/\D/g, ''); // a string of only digits, or the empty string
                var idInt = parseInt(idString, 10); // now it's a numeric value

                var data = {};

                data.id = idInt;

                var r = confirm("Are You Sure, You want to delete this!");
                if (r == true) {
                    $.ajax({
                        type: 'POST',
                        url: 'HomeArticleCategories.aspx/DeleteCate',
                        dataType: 'json',

                        data: JSON.stringify(data),


                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {


                            var myData = JSON.parse(response.d);

                            if (myData == 1)
                            {
                                swal("Cannot Delete Existing Articles Avalible for this category");
                            }
                            else
                            {
                                swal("Success", "Data Has Been Deleted!", "success");
                                location.reload();
                            }
                     

                           


                        },
                        error: function (error) {
                            console.log(error);
                        }


                    });
                } else {

                }







            })


            $("#myModal").on('click', '#btnmSave', function () {

                var Article = $('#cmbArticle').val();
                
         
                var Categories = $('#hiddencatidModel').val();
                var Language = $('#cmbMlanguage').val(); 
             
                var OrderID = $('#hiddenOrderID').val();
                var active = "";
                if ($('#ismactiveId').prop("checked") == true) {
                    active = 1;
                }
                else {
                    active = 0;
                }

                if (Article == 0 || Language == 0)
                {
                   
                    swal("Article and Language fields are required!");
                }
                else
                {
                   

                    var data = {};

                    data.Article = Article;
                    data.Categories = Categories;
                    data.active = active;
                    data.OrderID = OrderID;
                    data.Language = Language;

                    $.ajax({
                        type: 'POST',
                        url: 'HomeArticleCategories.aspx/Savearticel',
                        dataType: 'json',

                        data: JSON.stringify(data),


                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {


                            var myData = JSON.parse(response.d);


                            swal("Success", "Data Has Been Saved!", "success");

                            LoadArticle(Categories);
                            showArticleGrid(Categories);




                        },
                        error: function (error) {
                            console.log(error);
                        }


                    });
                }
          
             
               






            })

            $("#tblcatogerylist").on('click', '.cateedit', function () {
                var cateID = $(this).attr('id');
                editCategories(cateID);

            })


            function editCategories(cateID) {

                


                //$("#btnCancel").removeAttr('disabled');
                //$("#btnSave").removeAttr('disabled');
                //$("#btnUpdate").attr('disabled', 'disabled');
                var data = {};

                data.id = cateID;


                $.ajax({
                    type: 'POST',
                    url: 'HomeArticleCategories.aspx/editCategories',
                    dataType: 'json',
                    data: JSON.stringify(data),

                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {


                        var myData = JSON.parse(response.d);

                      
                        
                        $('#btnupdate').show();
                        $('#btnSave').hide();

                        $.each(myData, function () {
                            $("#cmbcategories").append('<option hidden selected="selected" value=' + this.categoryId + '>' + this.Category1 + '</option>');
                            $("#txtdisplay").val(this.displayText);
                            $("#hiddenid").val(this.id);
                            if (this.isActive == 1) {
                                $('#isactiveId').prop('checked', true);
                            }
                            else {
                                $('#isactiveId').prop('checked', false);
                            }
                            $("#cmbLanguage").append('<option hidden selected="selected" value=' + this.language + '>' + this.Language1 + '</option>');
                            
                            $("#cmbOrder").append('<option hidden selected="selected" value=' + this.orderCheck + '>' + this.orderCheck +'</option>');
                            
                        });

                    },




                    error: function (error) {
                        console.log(error);
                    }



                });
            }

            //original

            //$("#cateTaskSec").on('click', '#btnupdate', function () {

            //    var Categories = $("#cmbcategories").val();
            //    var displayText = $("#txtdisplay").val();
            //    var language = $("#cmbLanguage").val();
            //    var Order = $("#cmbOrder").val();

            //    if (Categories == "0" || displayText == ""|| language == "0" || Order == "0") {
            //        swal(" fields are required!");
            //    }
            //    else {
            //        updateCate();
            //    }



            //})

            //function updateCate()
            //{
            //    var Categories = $("#cmbcategories").val();
            //    var displayText = $("#txtdisplay").val();
            //    var language = $("#cmbLanguage").val();
            //    var Order = $("#cmbOrder").val();
            //    var active = "";

              
       


            //    if ($('#isactiveId').prop("checked") == true) {
            //        active = 1;
            //    }
            //    else {
            //        active = 0;
            //    }

            //    var id = $("#hiddenid").val();

            //    var data = {};

            //    data.id = id;
            //    data.Categories = Categories;
            //    data.displayText = displayText;
            //    data.language = language;
            //    data.Order = Order;
            //    data.active = active;


            //    $.ajax({
            //        type: 'POST',
            //        url: 'HomeArticleCategories.aspx/UpdateCategories',
            //        dataType: 'json',
            //        data: JSON.stringify(data),

            //        contentType: 'application/json; charset=utf-8',
            //        success: function (response) {


            //            var myData = JSON.parse(response.d);
            //            if (myData == "") {
            //                return;
            //            }
                       
            //            swal("Success", "Data Has Been Updated!", "success");
            //            loadHomecategories();
                       

            //        },

            //        error: function (error) {
            //            console.log(error);
            //        }



            //    });

            //}








            function LoadArticle(idInt) {

                var lan = $('#cmbLanguage').val();
                var data = {};

                data.intid = idInt;
                data.lan = lan;

                $("#cmbArticle").empty();
                $("#cmbArticle").append("<option value='0'></option>");



                //$("#btnCancel").removeAttr('disabled');
                //$("#btnSave").removeAttr('disabled');
                //$("#btnUpdate").attr('disabled', 'disabled');



                $.ajax({
                    type: 'POST',
                    url: 'HomeArticleCategories.aspx/loadArticle',
                    dataType: 'json',
                    data: JSON.stringify(data),
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {


                        var myData = JSON.parse(response.d);
                       
                        if (myData == "") {
                            return;
                        }



                        $.each(myData, function () {
                            $("#cmbArticle").append($("<option/>").val(this.id).text(this.Title));
                         



                        });

                    },




                    error: function (error) {
                        console.log(error);
                    }



                });
            }

         
        });





        //$("#btnupdate").click(function (e) {
        //    e.preventDefault();


        //    var Categories = $("#cmbcategories").val();
        //    var displayText = $("#txtdisplay").val();
        //    var id = $("#cmbLanguage").val();
        //    var Order = $("#cmbOrder").val();
        //    var active = "";
            
        //    if (Categories == "0" || displayText == "" || id == "0" || Order == "0") {
        //        swal(" fields are required!");
        //    }

        //    else {
        //        if ($('#isactiveId').prop("checked") == true) {
        //            active = 1;
        //        }
        //        else {
        //            active = 0;
        //        }

        //        var idd = $("#hiddenid").val();

        //        var data = {};

        //        data.idd = idd;
        //        data.Categories = Categories;
        //        data.displayText = displayText;
        //        data.id = id;
        //        data.Order = Order;
        //        data.active = active;

        //        $.ajax({
        //            type: 'POST',
        //            url: 'HomeArticleCategories.aspx/UpdateCategories',
        //            dataType: 'json',
        //            data: JSON.stringify(data),

        //            contentType: 'application/json; charset=utf-8',
        //            success: function (response) {

        //                var myData = JSON.parse(response.d);
        //                if (myData == "") {
        //                    return;
        //                }     
        //                swal("Success", "Data Has Been Updated!", "success");
        //                loadHomecategories(id);
        //            },
        //            error: function (error) {
        //                console.log(error);
        //            }
        //        });

        //    }

        //});







        


    </script>
</asp:Content>
