<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddhomeAd.aspx.cs" Inherits="NewsWebsiteAdmin.AddhomeAd" %>
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
          <form id="mainform" novalidate method="post" runat="server">
     
    
            <!-- Main content -->
         
            <div class="row">
                <div class="col-md-12">

                    <%-- Start of Article Category Form --%>
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Add Advertisement</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        
                         <div class="card-body">

                             <label>Choose Advertisement photo</label>

                             <div class="col_full">
                                
                                     <asp:FileUpload ID="fupload" runat="server" onchange='previewImage()' />

                                
                                
                                 <br />
                                 <img id="imgprv" src="http://localhost:59870/SiteContent\Defualt img\download.jpg" alt="AD Picture" width="200" height="200" style="border-radius: 100px;" />

                                  
                             </div>

                              <div class="form-group" >
                                 <label for="inputStatus">Advertisement Area </label>


                                 <select required class="form-control custom-select" id="cmbsection">

                                     <option></option>

                                    
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



            <div class="card-footer">
               <%-- <button id="btnSave" type="submit" onclick="postPm(txtTitle,txtContent,txtsummery)">Save</button>--%>
                 <button id="btnSave" type="submit" class="btn btn-success">Save</button>
                
            </div>

        </form><br />

                               <div class="row" style="padding:5px;">
                                  <table class="table table-bordered" id="TbAdvertisement">
                                         <thead>
                                          <tr>
                                              <th>Advertisement</th>
                                               <th>Form</th>
                                               <th>Section</th>
                                               <th>Size</th>
                                               <th>Created Date</th>
                                               <th>Active</th>
                                               <th>Delete</th>
                                          </tr>
                                      </thead>
                                      <tbody id="MainImageBody">
                                          
                                      </tbody>
                                  </table>
                              </div>



         

         </div>
      
 
    
     <script>
  
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
             loadAd();
             loadSection();


         });


         function loadSection() {
             $('#cmbsection').empty();
             $("#cmbsection").append('<option value="0"></option>');

             $.ajax({
                 type: 'POST',
                 url: 'AddhomeAd.aspx/loadSection',
                 dataType: 'json',

                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {


                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }
                     var button = "";
                     $.each(myData, function () {

                       
                         $("#cmbsection").append('<option value=' + this.id + '>' + this.Ad_Area_Name+'</option>');



                     });

                 },
                 error: function (error) {
                     console.log(error);
                 }
             });
         }
          
         function loadAd() {
             $('#MainImageBody').empty();

             $.ajax({
                 type: 'POST',
                 url: 'AddhomeAd.aspx/loadad',
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

                         var buttonDelete = '<button style="background-color:black; color:white;" class = "delete" id="delete' + this.id + '">Delete</button>';
                         var Tdate = this.createdDate;
                         var date = Tdate.slice(0, 10);

                         $("#TbAdvertisement").append('<tr><td><img src=' + this.imagePath + '  height="100" width="100"></td><td>' + this.form + '</td><td>' + this.Ad_Area_Name + '</td><td>' + this.size + '</td><td>' + date + '</td><td>' + button + '</td><td>' + buttonDelete +'</td></tr>');
                      
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
             swal({
                 title: "Are you sure?",
                 text: "Ad will be Active!",
                 icon: "warning",
                 closeOnClickOutside: false,
                 buttons: {
                     confirm: {
                         text: "Yes",
                         value: true,
                         visible: true,
                         className: "",
                         closeModal: false
                     },
                     cancel: {
                         text: "No",
                         value: false,
                         visible: true,
                         className: "",
                         closeModal: true
                     }
                 },
                 dangerMode: true,
             }).then((willSave) => {
                 if (willSave) {
                    $(".swal-button--cancel").attr('disabled', 'disabled');
                    $.ajax({
                        type: 'POST',
                        url: 'AddhomeAd.aspx/UpdateActive',
                        dataType: 'json',

                        data: JSON.stringify(data),


                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {


                            var myData = JSON.parse(response.d);

                            if (myData == 0)
                            {
                                swal("Success", "Data Has Been Active Successfully!", "success");
                                loadAd();
                            }
                            else
                            {
                                swal("Cannot Active this addvertisement for this section, Existing active Advertisement avalible  for this section !!");
                            }
                            

                        },
                        error: function (error) {
                            console.log(error);
                        }


                    });
                     }
                 });
             
         })



         $("#TbAdvertisement").on('click', '.activeY', function () {


             var id = $(this).attr('id');
             var idString = id.replace(/\D/g, ''); // a string of only digits, or the empty string
             var idInt = parseInt(idString, 10); // now it's a numeric value


             var data = {};

             data.id = idInt;
                swal({
                    title: "Are you sure?",
                    text: "Ad will be Inactive!",
                    icon: "warning",
                    closeOnClickOutside: false,
                    buttons: {
                        confirm: {
                            text: "Yes",
                            value: true,
                            visible: true,
                            className: "",
                            closeModal: false
                        },
                        cancel: {
                            text: "No",
                            value: false,
                            visible: true,
                            className: "",
                            closeModal: true
                        }
                    },
                    dangerMode: true,
                }).then((willSave) => {
                    if (willSave) {
                         $(".swal-button--cancel").attr('disabled', 'disabled');
                         $.ajax({
                             type: 'POST',
                             url: 'AddhomeAd.aspx/UpdateActiveNo',
                             dataType: 'json',

                             data: JSON.stringify(data),


                             contentType: 'application/json; charset=utf-8',
                             success: function (response) {


                                 var myData = JSON.parse(response.d);


                                 swal("Success", "Data Has Been Saved Successfully!", "success");
                                 loadAd();



                             },
                             error: function (error) {
                                 console.log(error);
                             }


                         });

                         }
                     });
         })


     
         $("#TbAdvertisement").on('click', '.delete', function () {
             var id = $(this).attr('id');
             var idString = id.replace(/\D/g, ''); // a string of only digits, or the empty string
             var idInt = parseInt(idString, 10); // now it's a numeric value

             var data = {};

             data.id = idInt;
             swal({
                 title: "Are you sure?",
                 text: "Once deleted, you will not be able to recover!",
                 icon: "warning",
                 closeOnClickOutside: false,
                 buttons: {
                     confirm: {
                         text: "Yes",
                         value: true,
                         visible: true,
                         className: "",
                         closeModal: false
                     },
                     cancel: {
                         text: "No",
                         value: false,
                         visible: true,
                         className: "",
                         closeModal: true
                     }
                 },
                 dangerMode: true,
             }).then((willDelete) => {
                 if (willDelete) {
                     $(".swal-button--cancel").attr('disabled', 'disabled');
                     $.ajax({
                         type: 'POST',
                         url: 'AddhomeAd.aspx/DeleteAd',
                         dataType: 'json',
                         data: JSON.stringify(data),
                         contentType: 'application/json; charset=utf-8',
                         success: function (response) {
                             var myData = JSON.parse(response.d);

                             if (myData == "0") {
                                 swal("Success", "Successfully Deleted!", "success");
                                 loadAd();
                             }
                             else {
                                 swal("Error", "Can Not Delete AD when it is Active!", "error");
                             }
                         },
                         error: function (error) {
                             console.log(error);
                         }


                     });

                     }
                 });
         })
         


        $("#mainform").on('submit', function (e) {
            e.preventDefault();

            var active = "";

            if ($('#isactiveId').prop("checked") == true) {
                active = 1;
            }
            else {
                active = 0;
            }

           

            var Image_path = $("#imgprv").attr("src");
            var fileUpload = document.getElementById("<%= fupload.ClientID %>");

            var img = document.getElementById("imgprv");
            var section = $('#cmbsection').val();
          
            var data = {};

            data.Image_path = Image_path;
            data.active = active;
            data.section = section;
            if (imageAdd == "" || section == 0) {
                swal("Image and Section fields are required !!");
                return false;

            }
            else {

                $.ajax({
                    type: 'POST',
                    url: 'AddhomeAd.aspx/SaveAdImage',
                    dataType: 'json',

                    data: JSON.stringify(data),


                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {


                        var myData = JSON.parse(response.d);

                     
                        if (myData == 0)
                        {
                            swal("Success", "Data Has Been Saved Successfully!", "success");
                            loadAd();
                            $('#mainform').trigger("reset");
                            location.reload();
                        }
                        else
                        {
                            swal("Cannot add this addvertisement for this section, Existing Advertisement active for this section !!");
                        }


                        



                    },
                    error: function (error) {
                        console.log(error);
                    }


                });
            }


            $('#mainform')[0].reset();



        });

        

     </script>
</asp:Content>
