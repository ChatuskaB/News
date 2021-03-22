<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddHomeArticle.aspx.cs" Inherits="NewsWebsiteAdmin.AddHomeArticle" %>
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
                            <h3 class="card-title">Add Home Article</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        
                         <div class="card-body">

                       
                              

                             <div class="form-group">
                             <label for="isactiveId"> Select Article</label>&nbsp;
                                <select  id="select-article" class="form-control custom-select" >
                             
                                      
                                </select>
                              </div>


  


                             
                             <div class="form-group">
                             <label for="isactiveId"> Is Active</label>&nbsp;
                             <input type="checkbox" id="isactiveId" >
                             </div>



                        



                        

                            
                          
                            </div>
                         </div>
                        </div>

                </div>



            <div class="card-footer" id="btnsec">
               <%-- <button id="btnSave" type="submit" onclick="postPm(txtTitle,txtContent,txtsummery)">Save</button>--%>
                 <button id="btnSave" type="button" class="btn btn-success">Save</button>
                
            </div>

       <br />

                               <div class="row" style="padding:5px;">
                                  <table class="table table-bordered" id="TbAdvertisement">
                                         <thead>
                                          <tr>
                                              <th>Article</th>
                                              <th>Created Date</th>
                                              <th>Active</th>
                                               
                                          </tr>
                                      </thead>
                                      <tbody id="MainImageBody">
                                          
                                      </tbody>
                                  </table>
                              </div>



         

         </div>
      
 
    
     <script>
  
       

      



        



         $(document).ready(function () {
             loadarticleTable();
             LoadArticle();

             //$('#select-article').selectize({
                 //sortField: 'text'
            // });


         });


         $("#btnsec").on('click', '#btnSave', function () {


             var article = $('#select-article').val();


             var active = "";




             if ($('#isactiveId').prop("checked") == true) {
                 active = 1;
             }
             else {
                 active = 0;
             }



             var data = {};

             data.id = article;
             data.active = active;

                 $.ajax({
                     type: 'POST',
                     url: 'AddHomeArticle.aspx/AddArticle',
                     dataType: 'json',

                     data: JSON.stringify(data),


                     contentType: 'application/json; charset=utf-8',
                     success: function (response) {


                         var myData = JSON.parse(response.d);





                         swal("Success", "Data Has Been Saved Successfully!", "success");
                         location.reload();



                     },
                     error: function (error) {
                         console.log(error);
                     }


                 });

       





         })

         

         function LoadArticle() {

             $("#select-article").empty();
             $("#select-article").append("<option value='0'></option>");



             //$("#btnCancel").removeAttr('disabled');
             //$("#btnSave").removeAttr('disabled');
             //$("#btnUpdate").attr('disabled', 'disabled');



             $.ajax({
                 type: 'POST',
                 url: 'AddHomeArticle.aspx/loadArticle',
                 dataType: 'json',

                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {


                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }


                     console.log(myData);
                     $.each(myData, function () {
                         $("#select-article").append($("<option/>").val(this.id).text(this.Title));

                        

                     });

                     $("#select-article").select2({
                         tags: true,
                         tokenSeparators: [',', ' ']
                     })

                 },




                 error: function (error) {
                     console.log(error);
                 }



             });
         }

          
         function loadarticleTable() {
            
             

             $('#MainImageBody').empty();

             $.ajax({
                 type: 'POST',
                 url: 'AddHomeArticle.aspx/loadarticleTable',
                 dataType: 'json',
                
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {


                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }
                     var button = "";
                     $.each(myData, function () {

                         if (this.status == 0)
                         {
                             button = '<button style="background-color:red; color:white;" class = "NoActive" id = "NoActive' + this.id + '">No</button>';
                         }
                         else
                         {
                             button = '<button style="background-color:green; color:white;" class = "activeY" id = "activeY' + this.id + '">Yes</button>';
                         }

                         $("#TbAdvertisement").append('<tr><td>' + this.Title + '</td><td>' + this.createdDate + '</td><td>' + button+'</td></tr>');

                    
                      
                    });

                 },


              

                 error: function (error) {
                     console.log(error);
                 }

              

             });
         }

         $("#TbAdvertisement").on('click', '.NoActive', function () {


             var id = $(this).attr('id');
             var idString = id.replace(/\D/g, ''); // a string of only digits, or the empty string
             var idInt = parseInt(idString, 10); // now it's a numeric value

          
             var data = {};

             data.id = idInt;
             var r = confirm("Are You Sure!");
             if (r == true) {

                 $.ajax({
                     type: 'POST',
                     url: 'AddHomeArticle.aspx/UpdateActive',
                     dataType: 'json',

                     data: JSON.stringify(data),


                     contentType: 'application/json; charset=utf-8',
                     success: function (response) {


                         var myData = JSON.parse(response.d);





                         swal("Success", "Data Has Been Saved Successfully!", "success");
                         location.reload();



                     },
                     error: function (error) {
                         console.log(error);
                     }


                 });

             }

          



         })



         $("#TbAdvertisement").on('click', '.activeY', function () {


             var id = $(this).attr('id');
             var idString = id.replace(/\D/g, ''); // a string of only digits, or the empty string
             var idInt = parseInt(idString, 10); // now it's a numeric value
        

             var data = {};

             data.id = idInt;
             var r = confirm("Are You Sure!");
             if (r == true) {

                 $.ajax({
                     type: 'POST',
                     url: 'AddHomeArticle.aspx/UpdateActiveNo',
                     dataType: 'json',

                     data: JSON.stringify(data),


                     contentType: 'application/json; charset=utf-8',
                     success: function (response) {


                         var myData = JSON.parse(response.d);





                         swal("Success", "Data Has Been Saved Successfully!", "success");
                         location.reload();



                     },
                     error: function (error) {
                         console.log(error);
                     }


                 });

             }





         })


     
       
         




       

        

     </script>
</asp:Content>
