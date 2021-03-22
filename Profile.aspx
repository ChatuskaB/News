<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="NewsWebsiteAdmin.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <style>
            .contentCustomer {
                padding: 4px;
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
                    <%-- Start of Profile Form --%>
                    <br />

                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Company Profile</h3>


                        </div>

                        <div class="card-body">




                            <div class="form-group">
                                <label for="inputDescription">Company Name</label>
                                <span>* </span>
                                <input type="text" id="CompanyName" class="form-control" placeholder="Enter Your Company Name" contenteditable="false" required>
                            </div>

                            <div class="form-group">
                                <label for="inputProjectLeader">Address</label>
                                <span>* </span>
                                <textarea id="CompanyAddress" class="form-control" rows="2" placeholder="Enter Company Address" contenteditable="false" required></textarea>
                            </div>


                            <div class="form-group">
                                <label for="inputClientCompany">E-Mail</label>
                                <span>* </span>
                                <input type="text" id="Email" class="form-control" placeholder="Enter Company Email" contenteditable="false" required />
                            </div>


                            <div class="form-group">
                                <label for="inputClientCompany">Phone Number</label>
                                <span>* </span>
                                <input type="text" id="CompanyNumber" class="form-control" placeholder="Enter Company Phone Number" contenteditable="false" required />
                            </div>

                            <div class="form-group">
                                <label for="inputClientCompany">Fax</label>
                                <span>* </span>
                                <input type="text" id="CompanyFax" class="form-control" placeholder="Enter Company Fax  Number" contenteditable="false" required />
                            </div>

                            <div class="form-group">
                                <label for="inputClientCompany">Vision</label>
                                <span>* </span>
                                <textarea id="Vision" class="form-control" rows="5" placeholder="Enter Company Vision" contenteditable="false" required></textarea>
                            </div>


                            <div class="form-group">
                                <label for="inputClientCompany">Mission</label>
                                <span>* </span>
                                <textarea id="Mission" class="form-control" rows="5" placeholder="Enter Company Mission" contenteditable="false" required></textarea>
                            </div>

                            <div class="form-group">
                                <label for="inputClientCompany">Description/Notes</label>
                                <span>* </span>
                                <textarea id="Notes" class="form-control" rows="5" placeholder="Enter Note/Description" contenteditable="false" required></textarea>
                            </div>

                            <div class="form-group">

                                <asp:FileUpload ID="fupload" runat="server" onchange='previewImage()' />
                                <br />
                                <br />
                                &nbsp;<%--<asp:Image ID="imgprv" runat="server" Height="120px" Width="200px" />--%><img id="imgprv" height="120" />
                            </div>
                            <div class="row float-right" style="padding-right: 8px;">
                                <!--Buttons------>
                                <button id="btnUpdate" type="button" class="btn btn-primary btn-lg">Update</button>
                                &nbsp;&nbsp; &nbsp;&nbsp  &nbsp;&nbsp; &nbsp;&nbsp;
                       
                            <button id="btnCancel" type="reset" class="btn btn-warning btn-lg">Cancel</button>
                                &nbsp;&nbsp;
                            </div>
                        </div>
                </div>

            </div>
                </div>

        </form>
    </div>


    <script> 
       
        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%-------------------------------- Function for the Picture Upload -----------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>


        function previewImage() {
            var fileUpload = document.getElementById("<%= fupload.ClientID %>");
            //var img = document.getElementById("= imgprv.ClientID ");
            var img = document.getElementById("imgprv");

            if (fileUpload.files && fileUpload.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    img.src = e.target.result;
                }

                reader.readAsDataURL(fileUpload.files[0]);
            }
        }
        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%------------------ Update  (Edit) Function Of Profile  Form / Load Profile Details -----------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>


        $("#btnUpdate").click(function () {


            ID = 1;

            var CompanyName = $("#CompanyName").val();
            var CompanyAddress = $("#CompanyAddress").val();
            var Email = $("#Email").val();
            var CompanyNumber = $("#CompanyNumber").val();
            var CompanyFax = $("#CompanyFax").val();
            var Vision = $("#Vision").val();
            var Mission = $("#Mission").val();
            var Notes = $("#Notes").val();
            var ImgPath = $("#imgprv").attr("src");
            console.log(ImgPath);





            if (CompanyName.trim() == "" || CompanyName == null) {
                swal("Company Name Required!");
                return;

            } else if (CompanyAddress.trim() == "" || CompanyAddress == null) {
                swal("Company Address Required!");
                return;


            } else if (!validateEmail(Email) || Email.trim() == "" || Email == null) {
                swal(" Valid Email  Required!");
                return;

            } else if (CompanyNumber.trim() == "" || CompanyNumber == null) {
                swal("Company Number  Required!");
                return;
            } else if (CompanyFax.trim() == "" || CompanyFax == null) {
                swal("Fax  Required!");
                return;

            } else if (Vision.trim() == "" || Vision == null) {
                swal("Vision Required");
                return;
            } else if (Mission.trim() == "" || Mission == null) {
                swal("Vision Required");
                return;
            } else if (Notes.trim() == "" || Notes == null) {
                swal("Notes or Discription Required");
                return;
            } else {

                $.ajax({
                    type: 'POST',
                    url: 'Profile.aspx/UpdateProfile',
                    dataType: 'json',
                    data: '{"Base64Img":"' + ImgPath + '","Company_Name":"' + $("#CompanyName").val() + '","Address":"' + $("#CompanyAddress").val() + '","E_Mail":"' + $("#Email").val() + '","Phone_Number":"' + $("#CompanyNumber").val() + '","Id":"' + ID + '","Fax":"' + $("#CompanyFax").val() + '","Vision":"' + $("#Vision").val() + '","Mission":"' + $("#Mission").val() + '","Description":"' + $("#Notes").val() + '"}',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        loaddata();
                        var customerData = JSON.parse(response.d)

                        console.log(customerData);

                        swal("Success", "Data Has Been Updated Successfully!", "success");


                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
               
            }

        });


        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%-------------------------------------------- Load Profile Details ----------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>

        function loaddata() {



            $("html").scrollTop(0)

            ID = 1;

            $.ajax({
                type: 'POST',
                url: 'Profile.aspx/getcustomerdts',
                dataType: 'json',
                data: '{"Id":' + ID + '}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    console.log("hi" + ID);

                    var customerData = JSON.parse(response.d)
                    console.log(customerData);

                    $("#imgprv").attr("src", customerData[0]["ImgPath"]);
                    $('#CompanyName').val(customerData[0]["Company_Name"]);
                    $('#CompanyAddress').val(customerData[0]["Address"]);
                    $('#Email').val(customerData[0]["E_Mail"]);
                    $('#CompanyNumber').val(customerData[0]["Phone_Number"]);
                    $('#CompanyFax').val(customerData[0]["Fax"]);
                    $('#Vision').val(customerData[0]["Vision"]);
                    $('#Mission').val(customerData[0]["Mission"]);
                    $('#Notes').val(customerData[0]["Description_Notes"]);

                },
                error: function (error) {
                    console.log(error);
                }
            });

        }


        function validateEmail(Email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(String(Email).toLowerCase());
        }

        $(function () {
            loaddata();
        });


    </script>




</asp:Content>
