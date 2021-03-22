<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArticlesLoad.aspx.cs" Inherits="NewsWebsiteAdmin.ArticlesLoad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    
      <header>
        <style>
            .contentCustomer {
                padding: 10px;
                padding-top: 100px;
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
          <form id="mainform" novalidate method="post" runat="server">

              <div class="row">
                  <div class="col-md-12">


                      <div class="card card-primary">
                          <div class="card-header">
                              <h3 class="card-title">Articles Loading..........</h3>

                              <div class="card-tools">
                                  <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                      <i class="fas fa-minus"></i>
                                  </button>
                              </div>
                          </div>




                          <div class="card- body">

                              <div class="row">
                                  <div class="col-md-4">

                                      <div class="form-group">
                                          <label for="inputStatus">The Categories in English </label>


                                          <select required class="form-control custom-select" id="txtcategory1">
                                          </select>
                                      </div>
                                  </div>

                                   
                                   <br />
                                  <br />
                                  <br />

                                  <div class="col-md-4">

                                      <div class="form-group">
                                          <label for="inputStatus">The SubCategories in English </label>


                                          <select required class="form-control custom-select" id="txtsubcategory1">
                                          </select>
                                      </div>

                                  </div>


                              </div>


                          </div>





                          
                          <div class="card- body">

                              <div class="row">
                                  <div class="col-md-4">

                                      <div class="form-group">
                                          <label for="inputStatus">The Categories in Sinhala </label>


                                          <select required class="form-control custom-select" id="txtcategory2">
                                          </select>
                                      </div>
                                  </div>

                                   
                                   <br />
                                  <br />
                                  <br />

                                  <div class="col-md-4">

                                      <div class="form-group">
                                          <label for="inputStatus">The SubCategories in Sinhala </label>


                                          <select required class="form-control custom-select" id="txtsubcategory2">
                                          </select>
                                      </div>

                                  </div>


                              </div>


                          </div>





                          
                          <div class="card- body">

                              <div class="row">
                                  <div class="col-md-4">

                                      <div class="form-group">
                                          <label for="inputStatus">The Categories in Tamil </label>


                                          <select required class="form-control custom-select" id="txtcategory3">
                                          </select>
                                      </div>
                                  </div>

                                   
                                   <br />
                                  <br />
                                  <br />

                                  <div class="col-md-4">

                                      <div class="form-group">
                                          <label for="inputStatus">The SubCategories in Tamil </label>


                                          <select required class="form-control custom-select" id="txtsubcategory3">
                                          </select>
                                      </div>

                                  </div>


                              </div>


                          </div>






                      </div>


                      
              
               <%--      Articles Loading Grid--%>



                     <div class="card">
                         <div class="card-header">
                             <h3 class="card-title">Articles</h3>
                         </div>

                         <div class="card-body">

                             <table id="articleloadlist" class="table table-bordered table-hover" style="display: inline-table">
                                 <thead>
                                     <tr>
                                         <th>Author Name</th>
                                         <th>Article Language1</th>
                                         <th>Article Language2</th>
                                         <th>Article Language3</th>
                                         <th>Created Date</th>
                                         <th>Add KeyWord</th>

                                        

                                     </tr>
                                 </thead>
                                 <tbody></tbody>
                                 <tfoot>
                                     <tr>
                                         <th>Author Name</th>
                                         <th>Article Language1</th>
                                         <th>Article Language2</th>
                                         <th>Article Language3</th>
                                         <th>Created Date</th>
                                         <th>Add KeyWord</th>

                                        
                                     </tr>
                                 </tfoot>
                             </table>
                         </div>
                     </div>


                  </div>
              </div>


          </form>






           <%-- Start Of addtag Popup Form --%>


    <div id="myModal1" class="modal">

        <div class="modal-content" >


            <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelkeyword" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

            <br />
            <br />

            <form id="tagform">

                <input type="hidden" id="addtagId" />

                

                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">



                            <div class="card-header">
                                <h3 class="card-title">Add Key Words</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>


                            <div class="card-body">


                              

                                  <div class="form-group">
                                    <label for="inputClientCompany">
                                     The  Author  <span class="required"></span>
                                    </label>
                                    <label id="authorpopup1" class="form-control"></label>
                                </div>


                                  <div class="form-group">
                                    <label for="inputClientCompany">
                                     The Article Language1 <span class="required"></span>
                                    </label>
                                    <label id="articlepopup1" class="form-control"></label>
                                </div>

                                 <div class="form-group">
                                    <label for="inputClientCompany">
                                     The Article Language2 <span class="required"></span>
                                    </label>
                                    <label id="articlepopup2" class="form-control"></label>
                                </div>

                                 <div class="form-group">
                                    <label for="inputClientCompany">
                                     The Article Language3 <span class="required"></span>
                                    </label>
                                    <label id="articlepopup3" class="form-control"></label>
                                </div>

                        
                                <div class="form-group">
                                    <label for="inputClientCompany">Key Word Language1</label>
                                    <span>* </span>
                                    <input required type="text" id="keytag1" placeholder="Keyword in English" class="form-control">
                                </div>

                                    <div class="form-group">
                                    <label for="inputClientCompany">Key Word Language2</label>
                                    <span>* </span>
                                    <input required type="text" id="keytag2" placeholder="Keyword in Sinhala" class="form-control">
                                </div>

                                    <div class="form-group">
                                    <label for="inputClientCompany">Key Word Language3</label>
                                    <span>* </span>
                                    <input required type="text" id="keytag3" placeholder="Keyword in Tamil" class="form-control">
                                </div>



                            


                            <div class="row float-right" style="padding-right: 8px;">
                                 <input id="Save2" type="submit" value="Add" class="btn btn-success">
                                   &nbsp;&nbsp;&nbsp;
                                 <button id="btnUpdate2" type="button" class="btn btn-warning">Update</button>
                                  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;
                                 <button id="btnCancel2" type="reset" class="btn btn-success">Cancel</button>
                                
                            </div>





               <%--Start Of addtag Grid --%>



                            <div class="card">


                                <div class="card-header">
                                    <h3 class="card-title">Details</h3>
                                </div>


                                <div class="card-body">


                                    <table id="tbladdtaglist" class="table table-bordered table-hover" style="display: inline-table">
                                        <thead>
                                            <tr>


                                                <th>Key Word Language1</th>
                                                <th>Key Word Language2</th>
                                                <th>Key Word Language3</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>

                                        <tfoot>
                                            <tr>
                                               
                                               
                                                <th>Key Word Language1</th>
                                                <th>Key Word Language2</th>
                                                <th>Key Word Language3</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </tfoot>
                                    </table>



                                </div>
                            </div>
                        </div>


                    </div>

                </div>

              </form>

            </div>

            

        </div>
    </div>




     <%--     addtag Delete popup grid--%>


    

         <div id="myModal3" class="modal">

        <div class="modal-content">

            <section class="content">

                <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelclosetags" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

                <br />
                <br />

                <div class="row">

                    <div class="col-12">

                        <div class="card card-primary">

                            <div class="card-header">
                                <h3 class="card-title">Details</h3>
                            </div>


                            <div class="card-body">

                                <form id="frmtags" data-parsley-validate="" class="form-horizontal form-label-left">

                                    <input type="hidden" id="txtTransId3" />

                                    <div class="form-group">
                                        <label for="inputName">
                                            Key Word Language1 <span class="required">:</span>
                                        </label>
                                        <label id="keytagpopup1" class="form-control"></label>
                                    </div>

                                      <div class="form-group">
                                        <label for="inputName">
                                            Key Word  Language1 <span class="required">:</span>
                                        </label>
                                        <label id="keytagpopup2" class="form-control"></label>
                                    </div>

                                      <div class="form-group">
                                        <label for="inputName">
                                            Key Word  Language1<span class="required">:</span>
                                        </label>
                                        <label id="keytagpopup3" class="form-control"></label>
                                    </div>


                                  

                                </form>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="row float-right" style="padding-right: 8px;">
                    <button id="btndeleteyes3" class="btn btn-info" type="button">Yes</button>
                     &nbsp;&nbsp;
                    <button id="btndeletecancel3" type="reset" class="btn btn-danger modelclosearticles">Cancel</button>
                </div>


            </section>
        </div>
    </div>




    

     



  



    <script>
         
        var CatID = 0;
      
        var SubCatID = 0;
      
        var DelID = 0;
        var addtag = 0;
        var tagGrid = 0;
        
        

          $(document).ready(function () {
             loadCategory1();
              loadCategory2();
               loadCategory3();
              loadArticles();
          });

        

        
           $("#txtcategory1").change(function () {

             
               CatID = $("#txtcategory1 option:selected").val();


               loadsubcategory1();
           });

        
           $("#txtcategory2").change(function () {

             
               CatID = $("#txtcategory2 option:selected").val();


               loadsubcategory2();
           });

        
           $("#txtcategory3").change(function () {

             
               CatID = $("#txtcategory3 option:selected").val();


               loadsubcategory3();
           });





      
 
        
         function loadCategory1() {
            
             $("#txtcategory1").empty();
             $("#txtcategory1").append("<option value='0'>--Select Category--</option>");


             $.ajax({
                 type: 'POST',
                 url: 'ArticlesLoad.aspx/loadCategory1',
                 dataType: 'json',
                
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {



                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }

                    

                   $.each(myData, function (){
                       $("#txtcategory1").append($("<option/>").val(this.id).text(this.Category1));




                      
                   });


                 },

               
                    

                 error: function (error) {
                     console.log(error);
                 }

            

             });
         }


        
         function loadCategory2() {
            
             $("#txtcategory2").empty();
             $("#txtcategory2").append("<option value='0'>--Select Category--</option>");


             $.ajax({
                 type: 'POST',
                 url: 'ArticlesLoad.aspx/loadCategory2',
                 dataType: 'json',
                
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {



                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }

                    

                   $.each(myData, function (){
                       $("#txtcategory2").append($("<option/>").val(this.id).text(this.Category2));




                      
                   });


                 },

               
                    

                 error: function (error) {
                     console.log(error);
                 }

            

             });
         }


        
         function loadCategory3() {
            
             $("#txtcategory3").empty();
             $("#txtcategory3").append("<option value='0'>--Select Category--</option>");


             $.ajax({
                 type: 'POST',
                 url: 'ArticlesLoad.aspx/loadCategory3',
                 dataType: 'json',
                
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {



                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }

                    

                   $.each(myData, function (){
                       $("#txtcategory3").append($("<option/>").val(this.id).text(this.Category3));




                      
                   });


                 },

               
                    

                 error: function (error) {
                     console.log(error);
                 }

            

             });
         }










        

     
         function loadsubcategory1() {

             $("#txtsubcategory1").empty();
             $("#txtsubcategory1").append("<option value='0'>--Select SubCategory--</option>");


            

             $.ajax({
                 type: 'POST',
                 url: 'ArticlesLoad.aspx/loadsubcategory1',
                 dataType: 'json',
                 data: '{"id":"' + CatID + '"}',
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {



                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }
                     $.each(myData, function () {
                         $("#txtsubcategory1").append($("<option/>").val(this.id).text(this.SubCategory1));
                     });

                      

                 },
                 error: function (error) {
                     console.log(error);
                 }

             });

         }

         function loadsubcategory2() {

             $("#txtsubcategory2").empty();
             $("#txtsubcategory2").append("<option value='0'>--Select SubCategory--</option>");


            

             $.ajax({
                 type: 'POST',
                 url: 'ArticlesLoad.aspx/loadsubcategory2',
                 dataType: 'json',
                 data: '{"id":"' + CatID2 + '"}',
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {



                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }
                     $.each(myData, function () {
                         $("#txtsubcategory2").append($("<option/>").val(this.id).text(this.SubCategory2));
                     });

                      

                 },
                 error: function (error) {
                     console.log(error);
                 }

             });

         }


         function loadsubcategory3() {

             $("#txtsubcategory3").empty();
             $("#txtsubcategory3").append("<option value='0'>--Select SubCategory--</option>");


            

             $.ajax({
                 type: 'POST',
                 url: 'ArticlesLoad.aspx/loadsubcategory3',
                 dataType: 'json',
                 data: '{"id":"' + CatID3 + '"}',
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {



                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }
                     $.each(myData, function () {
                         $("#txtsubcategory3").append($("<option/>").val(this.id).text(this.SubCategory3));
                     });

                      

                 },
                 error: function (error) {
                     console.log(error);
                 }

             });

         }


     



        $("#txtsubcategory1").change(function () {


            SubCatID = $("#txtsubcategory1 option:selected").val();


            loadArticles(SubCatID);
        });


        $("#txtsubcategory2").change(function () {


            SubCatID = $("#txtsubcategory2 option:selected").val();


            loadArticles(SubCatID);

        });

        $("#txtsubcategory3").change(function () {


            SubCatID = $("#txtsubcategory3 option:selected").val();


            loadArticles(SubCatID);
        });



       
       

        var ID = 0;


        function loadArticles(SubCatID) {

            


            $.ajax({
                type: 'POST',
                url: 'ArticlesLoad.aspx/loadgrid',
                dataType: 'json',
                data: '{"id":"' + SubCatID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {


                    $("#articleloadlist tbody").empty();


                  

                    //var myData = JSON.parse(response.d);
                    //if (myData == "") {
                    //    return;
                    //}
                    //var tr = [];
                    //for (var i = 0; i < myData.length; i++) {






                        
                    var myData = JSON.parse(response.d);
                    if (myData == "") {



                        return;
                    }
                    var tr = [];
                    for (var i = 0; i < myData.length; i++) {
                        var date = myData[i].CreatedDate;
                        res = date.split('T')[0];



                        tr.push('<tr>')
                        tr.push("<td> " + myData[i].Name + " </td>");
                        tr.push("<td> " + myData[i].Title + "</td>");
                        tr.push("<td> " + myData[i].Title_1 + "</td>");
                        tr.push("<td> " + myData[i].Title_2 + "</td>");
                       // tr.push("<td> " + myData[i].CreatedDate + "</td>");
                        tr.push("<td> " + res + "</td>");
                        tr.push("<td><a id=\"addkeytagbtn\" type=\"button\"  onclick=\"addkeytagfunc('" + myData[i]["Au_id"] + "')\"> <i class= \"fas fa-2x fa-tags\"></i>  </a></td>");
                        
                        tr.push('</tr>');



                    }

                        
                    //$("#articleloadlist").empty();
                    //$("#articleloadlist").append("<option value='0'>  Relevant Articles For the selected Category....</option>");

                        



                      //$("#articleloadlist tbody").empty();
                      $('#articleloadlist tbody').append($(tr.join('')));


                     //$("#articleloadlist tbody").empty();
                     //$('#articleloadlist').append($(tr.join('')));

                    
                 
                  
                },
                error: function (error) {
                    console.log(error);
                }

            });
        }


       

       


       /////////////////////////////// <%--Function Of addtag Form / Load addtag Details --%>//////////////////////////////////////////////////////

          function addkeytagfunc(id) {
             addtag = id;


            
              $('#keytag1').val("");
              $('#keytag2').val("");
              $('#keytag3').val("");



            $("#btnCancel2").removeAttr('disabled');
            $("#btnSave1").removeAttr('disabled');
            $("#btnUpdate2").attr('disabled', 'disabled');

             



            $.ajax({
                type: 'POST',
                url: 'ArticlesLoad.aspx/getaddtagdtl',
                dataType: 'json',
                data: '{"id":"' + addtag + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $("#myModal1").modal('show');
                    //loadgrid1(id)
                    loadArticles(id)
                   
                   
                    $('#authorpopup1').html(myData[0]["Name"]);
                    $('#articlepopup1').html(myData[0]["Title"]);
                    $('#articlepopup2').html(myData[0]["Title_1"]);
                    $('#articlepopup3').html(myData[0]["Title_2"]);
                    $('#addtagId').val(myData[0]["Aid"]);

                },
                error: function (error) {
                    console.log(error);
                }

            });
          }


 
         function loadKeywordgrid(tagGrid) {

            
            $("#btnCancel2").removeAttr('disabled');
            $("#btnSave1").removeAttr('disabled');
            $("#btnUpdate2").attr('disabled', 'disabled');

            $.ajax({
                type: 'POST',
                url: 'ArticlesLoad.aspx/loadgrid2',
                dataType: 'json',
                data: '{"id":"' + tagGrid + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {


                   // $("#articleloadlist tbody").empty();
                   
                     $("#tbladdtaglist tbody").empty();
                  

                    var myData = JSON.parse(response.d);
                    if (myData == "") {
                        return;
                    }
                    var tr = [];
                    for (var i = 0; i < myData.length; i++) {




                        tr.push('<tr>')
                        tr.push("<td> " + myData[i].Keyword + " </td>");
                        tr.push("<td> " + myData[i].Keyword_1 + "</td>");
                        tr.push("<td> " + myData[i].Keyword_2 + "</td>");
                        tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"updatekeyFunction('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnClose\" type=\"button\" onclick=\"deletekeypopupfunc('" + myData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
                        
                        
                        tr.push('</tr>');



                    }

                        
                    //$("#articleloadlist").empty();
                    //$("#articleloadlist").append("<option value='0'>  Relevant Articles For the selected Category....</option>");

                        



                      $("#tbladdtaglist tbody").empty();



                     // $('#articleloadlist tbody').append($(tr.join('')));
                     $('#tbladdtaglist tbody').append($(tr.join('')));


                     //$("#articleloadlist tbody").empty();
                     //$('#articleloadlist').append($(tr.join('')));

                    
                 
                  
                },
                error: function (error) {
                    console.log(error);
                }

            });
        }




            
        $(".modelkeyword").click(function () {
            $("#myModal1").modal('toggle');
        });



           <%-- Function For The Save addtag Form --%>


      


          $("#tagform").on('submit', function (e){
            e.preventDefault();

        
              
             

              $("#keytag1").attr('contenteditable', false);
              $("#keytag2").attr('contenteditable', false);
              $("#keytag3").attr('contenteditable', false);


        
            $("#btnSave1").attr('disabled', 'disabled');
       
            $("#btnUpdate2").attr('disabled','disabled');
            $("#btnCancel2").removeAttr('disabled');


              var keytag1 = $("#keytag1").val();
            

              if (keytag1.trim() !== "" || keytag1 !== null) {






                  $.ajax({
                      type: 'POST',
                      url: 'ArticlesLoad.aspx/SaveAddtag',
                      dataType: 'json',

                      data: '{"Keyword":"' + $("#keytag1").val() + '","Keyword_1":"' + $("#keytag2").val() + '","Keyword_2":"' + $("#keytag3").val() + '","Article_ID":"' + $("#addtagId").val() + '"}',


                      contentType: 'application/json; charset=utf-8',
                      success: function (response) {


                          var myData = JSON.parse(response.d)
                          console.log(myData);

                          swal("Success", "Data Has Been Saved Successfully!", "success");
                          //loadgrid2($("#addtagId").val());
                          loadKeywordgrid($("#addtagId").val());

                      },
                      error: function (error) {
                          console.log(error);
                      }


                  });

              } else {
                  swal("Oops...", "Somthing went wrong!", "error");

              }

            $('#tagform')[0].reset();
          });



      
          function updatekeyFunction(id) {

            $("myModal1").scrollTop(0)

            addtag = id;

            $("#Save2").attr('disabled', 'disabled');
            $("#btnUpdate1").removeAttr('disabled');

            //$("#btnSave").removeAttr('disabled');
            $("#btnCancel1").removeAttr('disabled');
        


            $.ajax({
                type: 'POST',
                url: 'ArticlesLoad.aspx/getkeywords',
                dataType: 'json',
                data: '{"id":"' + addtag + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {



                    var myData = JSON.parse(response.d)


                      $("#myModal").modal('show');

                    $('#keytag1').val(myData[0]["Keyword"]);
                    $('#keytag2').val(myData[0]["Keyword_1"]);
                    $('#keytag3').val(myData[0]["Keyword_2"]);

                   // $('#addtagId').html(myData[0]["Aid1"]);

                   // $('#txtTransId3').html(myData[0]["Aid1"]);
                    $('#txtTransId3').val(myData[0]["id"]);
                    //$("#txtTransId").val(myData[0]["id"]);
                    


                },
                error: function (error) {
                    console.log(error);
                }
            });
            $('#tagform')[0].reset();

          } 



      
        $(function () {
            $("#btnUpdate2").click(function () {

                //$("#btnCancel").removeAttr('disabled');
                //$("#btnUpdate").removeAttr('disabled');
                //$("#btnSave").removeAttr('disabled');
              
                 $("#btnSave1").attr('disabled', 'disabled');
                 $("#btnUpdate2").removeAttr('disabled');
                 $("#btnCancel2").removeAttr('disabled');
        

                    $.ajax({
                        type: 'POST',
                        url: 'ArticlesLoad.aspx/UpdateKeytags',
                        dataType: 'json',
                        data: '{"Keyword":"' + $("#keytag1").val() + '","Keyword_1":"' + $("#keytag2").val() + '","Keyword_2":"' + $("#keytag3").val() + '","id":"' + ID + '"  }',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {
                             

                            var myData = JSON.parse(response.d)
                            loadKeywordgrid();


                            swal("Success", "Data Has Been Updated Successfully!", "success");


                            //$('#authrnamepopup2').val("");
                            //$('#titlepopup2').val("");
                          




                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });


                

            });
        });


      

        
     

        
      

          <%-- Function For The Delete Popup Of addtag Form --%> 

       
          function deletekeypopupfunc(id) {
            delID = id;

            $.ajax({
                type: 'POST',
                url: 'ArticlesLoad.aspx/getaddtagdtl',
                dataType: 'json',
                data: '{"id":"' + delID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $("#myModal3").modal('show');


                    $('#keytagpopup1').html(myData[0]["Keyword"]);
                    $('#keytagpopup2').html(myData[0]["Keyword_1"]);
                    $('#keytagpopup3').html(myData[0]["Keyword_2"]);
                    
                   



                },
                error: function (error) {
                    console.log(error);
                }

            });
          }







         $(function () {

            $("#btndeleteyes3").click(function () {

                $ .ajax({
                    type: 'POST',
                    url: 'ArticlesLoad.aspx/popupdeletetag',
                    dataType: 'json',
                    data: '{"id":"' + DelID + '"}',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var myData = JSON.parse(response.d)
                        loadKeywordgrid();
                        $("#myModal3").modal('toggle');


                        swal("Success", "Data Has Been Deleted Successfully!", "success");

                           



                    },
                    error: function (error) {
                        console.log(error);
                    }
                });

            });


         });




           $("#btnCancel2").click(function () {

            $("#btnSave2").removeAttr('disabled');
            $("#btnUpdate2").removeAttr('disabled');

        });



        
        $(function () {
            $('#articleloadlist').DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false,
            });
        });


        $(function () {
            $('#tbladdtaglist').DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false,
            });
        });

        

    </script>


</asp:Content>
