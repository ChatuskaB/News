<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AuthorForm.aspx.cs" Inherits="NewsWebsiteAdmin.AuthorForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <style>
            /*.contentCustomer {
                padding: 4px;
            }*/

            /*.contentCustomer {
                padding: 10px;
                padding-top: 50px;
            }*/

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

            img {
                border-radius: 50%;
                object-fit: cover;
            }
        </style>
    </header>

    <div class="content-wrapper contentCustomer">
        <br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button type="button" id="btnaddauthors" class="btn btn-primary mb-2 active">Add Author</button>


        <div id="mainModal" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="width: 100%">

                    <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

                    <br />
                    <br />
                    <form id="mainform" novalidate method="post" runat="server">

                        <!-- Main content -->

                        <div class="row">
                            <div class="col-md-12">




                                <%-- Start of Author Form --%>


                                <div class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">Author Information</h3>

                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                        </div>
                                    </div>

                                    <div class="card-body">

                                        <div class="form-group">
                                            <label for="inputDescription">Name</label>
                                            <span>* </span>
                                            <input type="text" id="Name" class="form-control" placeholder="Enter Your Name Here" contenteditable="false" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="inputProjectLeader">E-Mail</label>
                                            <span>* </span>
                                            <input type="email" id="Email" class="form-control" placeholder="Email" required />
                                        </div>

                                        <div class="form-group">
                                            <label for="inputClientCompany">Contact Number</label>
                                            <span>* </span>
                                            <input type="number" id="ContactNumber" class="form-control" contenteditable="false" required />
                                        </div>

                                        <%--Password-----------------------%>
                                        <div class="form-group">
                                            <label for="inputClientCompany" id="passlbl">Password</label>
                                            <span id="span">* </span>
                                            <input type="password" id="Password" class="form-control" placeholder="Enter Your Password" autocomplete="new-password" contenteditable="false" required />
                                            <label for="inputClientCompany"></label>
                                            <input type="password" id="RePassword" class="form-control" placeholder="Re-Enter Your Password" contenteditable="false" required />
                                        </div>

                                        <div class="form-group">
                                            <label for="inputClientCompany">About Yourself</label>
                                            <span>* </span>
                                            <textarea id="Yourself" rows="2" class="form-control" placeholder="Type Here" contenteditable="false" required></textarea>
                                        </div>

                                        <!--password change Button---------------------->

                                        <button id="passchange" type="button" class="btn btn-primary btn-md">Change Password</button>

                                        <br />
                                        <br />

                                        <div class="form-group">

                                            <asp:FileUpload ID="fupload" runat="server" onchange='previewImage()' />
                                            <br />
                                            <br />

                                            <img id="imgprv" height="200" width="200" />
                                            <%--<asp:Image ID="imgprv" runat="server" Height="120px" Width="200px" />--%>
                                        </div>

                                        <!--Buttons---------------------->
                                        <div class="row float-right" style="padding-right: 8px;">
                                            <input id="btnSave" type="submit" value="Submit" class="btn btn-success btn-lg">
                                            &nbsp;&nbsp; &nbsp;&nbsp  &nbsp;&nbsp; &nbsp;&nbsp;
                                <button id="btnUpdate" type="button" class="btn btn-primary btn-lg">Update</button>
                                            &nbsp;&nbsp; &nbsp;&nbsp  &nbsp;&nbsp; &nbsp;&nbsp;
                                <button id="btnCancel" type="reset" class="btn btn-warning btn-lg">Cancel</button>
                                            &nbsp;&nbsp;                               
                                        </div>
                                        <div class="col-sm-5">
                                            <input type="checkbox" id="statusInput" unchecked="unchecked" value="0">
                                            &nbsp; Status
                                        </div>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </form>

                </div>
            </div>
        </div>






        <section id="searchsec">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">

                        <div class="card-header">
                            <div class="col-md-12">
                                <h3 class="card-title">Authors Search</h3>
                            </div>

                        </div>

                        <div class="card-body">

                            <br />
                            <div class="form-group row">

                                <div class="col-sm-5">
                                    <input type="text" id="author_name" class="form-control input-default" placeholder="Enter Reader Name">
                                </div>

                                <div class="col-sm-1">
                                    <input type="radio" id="active" name="ckeckbox" value="0">
                                    Active
                                </div>
                                <div class="col-sm-1">
                                    <input type="radio" id="inactive" name="ckeckbox" value="0">
                                    Inactive
                                </div>
                                <div class="col-sm-1">
                                    <input type="radio" id="all" name="ckeckbox" value="0">
                                    All
                                </div>
                                &nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp; 
                                    <br />
                                <div class="col-sm-1">
                                    <button type="button" id="btnsearchauthors" class="btn btn-primary mb-2 active">Search</button>

                                </div>

                                <div class="col-sm-1">
                                    <button type="button" id="cancelgrid" class="btn btn-dark mb-2">Cancel</button>

                                </div>
                                <br />

                                <br />

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>

       <div class="card">
            <div class="card-header">
                <h3 class="card-title">Authors Details</h3>
            </div>

            <div class="card-body">

                <table id="author_infolist" class="table table-bordered table-hover" style="display: inline-table">
                    <thead>
                        <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Contact Number</th>
                                <th>Registered Date:</th>
                                <th>Status</th>
                                <th>Edit</th>
                                <th>Delete</th>
                        </tr>
                    </thead>

                    <tbody id="databody">
                    </tbody>

                    <tfoot>
                        <tr>
                             <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Contact Number</th>
                                <th>Registered Date:</th>
                                <th>Status</th>
                                <th>Edit</th>
                                <th>Delete</th>
                        </tr>
                    </tfoot>

                </table>
            </div>
        </div>



        <%--Start Of Customer n Plant Popup Grid --%>

        <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">


                <div class="modal-content" style="width: 100%">

                    <section class="content">

                        <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelcloseCusPlant" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

                        <br />
                        <br />

                        <div class="row">

                            <div class="col-12">

                                <div class="card card-primary">

                                    <div class="card-header">
                                        <h3 class="card-title">Details</h3>
                                    </div>


                                    <div class="card-body">

                                        <form id="frmSeasons" data-parsley-validate="" class="form-horizontal form-label-left">

                                            <input type="hidden" id="txtTransId" />

                                            <div class="form-group">
                                                <label for="inputProjectLeader">
                                                    ID<span class="required">:</span>
                                                </label>
                                                <label id="idpopup" class="form-control"></label>
                                            </div>


                                            <div class="form-group">
                                                <label for="inputName">
                                                    Name <span class="required">:</span>
                                                </label>
                                                <label id="namepopup" class="form-control"></label>
                                            </div>


                                            <div class="form-group">
                                                <label for="inputClientCompany">
                                                    E-mail <span class="required">:</span>
                                                </label>
                                                <label id="email1popup" class="form-control"></label>
                                            </div>


                                            <div class="form-group">
                                                <label for="inputProjectLeader">
                                                    Contact Number <span class="required">:</span>
                                                </label>
                                                <label id="conpopup" class="form-control"></label>
                                            </div>

                                            <div class="form-group">
                                                <label for="inputProjectLeader">
                                                    Author Info <span class="required">:</span>
                                                </label>
                                                <textarea id="Yourself1" rows="3" class="form-control"></textarea>
                                            </div>


                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="row float-right" style="padding-right: 8px;">
                            <button id="btndeleteyes" class="btn btn-info" type="button">Yes</button>
                            &nbsp;&nbsp;
                    <button id="btndeletecancel" type="reset" class="btn btn-danger modelcloseCusPlant">Cancel</button>
                        </div>


                    </section>
                </div>
            </div>
        </div>




        <%--Start Of Password Popup Grid --%>

        <div id="myModal1" class="modal">

            <div class="modal-content">

                <section class="content">

                    <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelcloseCusPlant" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

                    <br />
                    <br />

                    <div class="row">

                        <div class="col-12">

                            <div class="card card-primary">

                                <div class="card-header">
                                    <h3 class="card-title">Password Change</h3>
                                </div>


                                <div class="card-body">

                                    <form id="frmSeasons1" data-parsley-validate="" class="form-horizontal form-label-left">

                                        <input type="hidden" id="txtTransId1" />

                                        <div class="form-group">
                                            <label for="inputClientCompany">Current Password </label>
                                            <input type="password" id="current1" class="form-control" placeholder="Enter Your Current Password" contenteditable="false" required />
                                            <label for="inputClientCompany" id="passlbl1">Password</label>
                                            <span id="span1">* </span>
                                            <input type="password" id="Password1" class="form-control" placeholder="Enter Your Password" contenteditable="false" required />
                                            <label for="inputClientCompany"></label>
                                            <input type="password" id="RePassword1" class="form-control" placeholder="Re-Enter Your Password" contenteditable="false" required />
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row float-right" style="padding-right: 8px;">
                        <button id="btndeleteyes1" class="btn btn-info" type="button">Change Password</button>
                        &nbsp;&nbsp;
                    <button id="btndeletecancel1" type="reset" class="btn btn-danger modelcloseCusPlant1">Cancel</button>
                    </div>


                </section>
            </div>
        </div>

    </div>

    <%--End Of Password Popup Grid --%>


    <script>

        var ID = 0;
        var delID = 0;
        var delEqID = 0;
        var planteq = 0;
        var eqGrid = 0;

        var d = new Date();
        var month = d.getMonth() + 1;
        var day = d.getDate();

        var output = d.getFullYear() + '-' + month + '-' + day



        $(document).ready(function () {

            $("#passchange").hide();
            $("#btnUpdate").attr('disabled', 'disabled');
            $("#imgprv").attr('src', 'SiteContent/Defualt img/download.jpg');
            document.getElementById('all').checked = true;
            loadgrid();


            $("#author_infolist").DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": true,
            });

        });




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
        <%--------------------------------Data Load Function Author Information ------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        $("#btndeletecancel1").click(function () {
            $('#Password1').val("");
            $('#RePassword1').val("");
            $('#current1').val("");

        });



        function loadgrid() {
            $.ajax({
                type: 'POST',
                url: 'AuthorForm.aspx/gridchange',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {


                    $("#author_infolist tbody").empty();

                    var customerData = JSON.parse(response.d);
                    if (customerData == "") {

                        return;
                    }
                    var tr = [];
                    for (var i = 0; i < customerData.length; i++) {
                        var date = customerData[i].Registered_Date;
                        res = date.split('T')[0];

                        var Status = customerData[i].status

                        if (Status == 1) {
                            status1 = "Active"

                        }
                        else if (Status == 0) {
                            status1 = "Inactive"

                        }

                        var USERTYPE = customerData[i].usertype

                        if (USERTYPE == 2) {
                            document.getElementById("Email").disabled = true;
                            document.getElementById("statusInput").disabled = true;
                        }



                        tr.push('<tr>')
                        tr.push("<td> " + customerData[i].id + " </td>");
                        tr.push("<td> " + customerData[i].Name + "</td>");
                        tr.push("<td> " + customerData[i].Email + "</td>");
                        tr.push("<td> " + customerData[i].Contact_no + "</td>");
                        tr.push("<td> " + res + "</td>");
                        //tr.push("<td> " + customerData[i].Yourself + "</td>");
                        tr.push("<td> " + status1 + "</td>");
                        tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnClose\" type=\"button\" onclick=\"deletepopupfunc('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
                        tr.push('</tr>');


                    }



                    $("#author_infolist tbody").append($(tr.join('')));

                },
                error: function (error) {
                    console.log(error);
                }

            });
        }



        $("#cancelgrid").on('click', function () {

            document.getElementById('author_name').value = "";
            $('#author_name').val("");
            document.getElementById('active').checked = false;
            document.getElementById('inactive').checked = false;
            document.getElementById('all').checked = false;
            //$("#author_infolist").empty();
        });



        $("#btnCancel").click(function () {
            $("#passchange").hide();
            $("#RePassword").show(100);
            $("#Password").show(100);
            $("#passlbl").show(100);
            $("#span").show(100);
            $("#imgprv").attr('src', 'SiteContent/Defualt img/download.jpg');
            document.getElementById('statusInput').checked = false;
            $('#mainform')[0].reset();
            $("#mainModal").modal('toggle');
            $("#mainModal").modal('hide');
        });



        $("#btnaddauthors").click(function () {
            $("#mainModal").modal('show');
        });




        $(".modelcloseCusPlant").click(function () {
            $("#myModal").modal('toggle');
        });



        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%-------------------------------  Save Function Of Author Form  -------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>

        $("#mainform").on('reset', function (e) {

            $("#btnSave").removeAttr('disabled');
            $("#btnUpdate").attr('disabled', 'disabled');

        });



        function validateEmail(Email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(String(Email).toLowerCase());
        }



        $("#mainform").on('submit', function (e) {
            e.preventDefault();

            var statusinputSave = $("#statusInput").val();
            var Name = $("#Name").val();
            var Email = $("#Email").val();
            var ContactNumber = $("#ContactNumber").val();
            var Password = $("#Password").val();
            var RePassword = $("#RePassword").val();
            var Yourself = $("#Yourself").val();
            var ImgPath = $("#imgprv").attr("src");


            if (Name.trim() == "" || Name == null) {
                swal("Customer Name Required!");
                return;
            } else if (!validateEmail(Email) || Email.trim() == "" || Email == null) {
                swal(" Valid Email  Required!");
                return;
            } else if (ContactNumber.trim() == "" || ContactNumber == null) {
                swal("Contact Number required!");
                return;
            } else if (Password.trim() == "" || Password == null) {
                swal("Password  required!");
                return;
            } else if (RePassword.trim() == "" || RePassword == null) {
                swal("Retype Your Password");
                return;
            } else if (RePassword != Password) {
                swal("Your Password and Retyped Passwords are not same ");
                return;
            } else if (Yourself.trim() == "" || Yourself == null) {
                swal("Your Info  required!");
                return;
            } else {

                $.ajax({
                    type: 'POST',
                    url: 'AuthorForm.aspx/SaveCustomer',
                    dataType: 'json',
                    data: '{"Base64Img":"' + ImgPath + '","Name":"' + $("#Name").val() + '","Email":"' + $("#Email").val() + '","Contact_no":"' + $("#ContactNumber").val() + '","Password":"' + $("#Password").val() + '","Registered_Date":"' + output + '","Yourself":"' + $("#Yourself").val() + '","status":"' + statusinputSave + '"}',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {


                        var customerData = JSON.parse(response.d)


                        if (customerData == "Email is Already Registered") {


                            swal("Error", "Email is Already Registered", "warning")
                        }
                        else {
                            swal("Success", "Data Has Been Saved Successfully!", "success");
                            $("#imgprv").attr('src', 'SiteContent/Defualt img/download.jpg');
                            $('#mainform')[0].reset();
                            $("#mainModal").modal('hide');
                            document.getElementById('btnsearchauthors').click();
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }


                });
            }
        });



        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%-------- Update  (Edit) Function--------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        function editFunction(Id) {
            var ID = Id;

            $("#btnCancel").removeAttr('disabled');
            $("#btnSave").attr('disabled', 'disabled');
            $("#btnUpdate").removeAttr('disabled');
            $("#addPlantEquipButton").removeAttr('disabled');


            $.ajax({
                type: 'POST',
                url: 'AuthorForm.aspx/getcustomerdt',
                dataType: 'json',
                data: '{"Id":"' + ID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var customerData = JSON.parse(response.d)
                    $("#mainModal").modal('show');

                    $("#imgprv").attr("src", customerData[0]["ImgPath"]);
                    $('#Name').val(customerData[0]["Name"]);
                    $('#Email').val(customerData[0]["Email"]);
                    $('#ContactNumber').val(customerData[0]["Contact_no"]);

                    $('#Yourself').val(customerData[0]["Yourself"]);
                    $("#RePassword").hide(100);
                    $("#Password").hide(100);
                    $("#passlbl").hide(100);
                    $("#span").hide(100);
                    $("#passchange").show(100);
                    sessionStorage.setItem('updateid', ID);
                    sessionStorage.setItem('oldimg', customerData[0]["ImgName"])
                    sessionStorage.setItem('dbEmail', customerData[0]["Email"])




                    var tick = customerData[0]["status"];
                    console.log(tick);
                    if (tick == '1') {
                        document.getElementById('statusInput').checked = true;
                    } else {
                        document.getElementById('statusInput').checked = false;
                    }

                   

                }
            });


        }



        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%------------------------- Function for the Update --------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>

        $("#btnUpdate").click(function () {

            $("#btnSave").removeAttr('disabled');

            var ID = sessionStorage.getItem('updateid');
            var statusinputSave = $("#statusInput").val();
            var Name = $("#Name").val();
            var Email = $("#Email").val();
            var ContactNumber = $("#ContactNumber").val();
            var Yourself = $("#Yourself").val();
            var ImgPath = $("#imgprv").attr("src");


            if (Name.trim() == "" || Name == null) {
                swal("Customer Name Required!");
                return;
            } else if (!validateEmail(Email) || Email.trim() == "" || Email == null) {
                swal(" Valid Email  Required!");
                return;
            } else if (ContactNumber.trim() == "" || ContactNumber == null) {
                swal("Contact Number required!");
                return;
            } else if (Yourself.trim() == "" || Yourself == null) {
                swal("Your Info  required!");
                return;
            } else {

                $.ajax({
                    type: 'POST',
                    url: 'AuthorForm.aspx/UpdateCustomer',
                    dataType: 'json',
                    data: '{"Base64Img":"' + ImgPath + '","Name":"' + $("#Name").val() + '","Email":"' + $("#Email").val() + '","Contact_no":"' + $("#ContactNumber").val() + '","Registered_Date":"' + output + '","Yourself":"' + $("#Yourself").val() + '","Id":"' + ID + '","oldimg":"' + sessionStorage.getItem('oldimg') + '","DatabaseEmail":"' + sessionStorage.getItem('dbEmail') + '","status":"' + statusinputSave + '"}',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {


                        var customerData = JSON.parse(response.d)
                        


                        if (customerData == "Email is Already Registered") {

                            $("#btnSave").attr('disabled', 'disabled');
                            swal("Error", "Email is Already Registered", "warning")
                        }
                        else {

                            swal("Success", "Data Has Been Updated Successfully!", "success");



                            $('#Name').val("");
                            $('#Email').val("");
                            $('#ContactNumber').val("");
                            $('#Password').val("");
                            $('#RePassword').val("");
                            $('#Yourself').val("");
                            $("#passchange").hide();
                            $('#Password1').val("");
                            $('#RePassword1').val("");
                            $('#current1').val("");
                            $("#RePassword").show(100);
                            $("#Password").show(100);
                            $("#passlbl").show(100);
                            $("#span").show(100);
                            document.getElementById('statusInput').checked = false;

                            $("#btnUpdate").attr('disabled', 'disabled');
                            $("#btnSave").removeAttr('disabled');

                            $("#imgprv").attr('src', 'SiteContent/Defualt img/download.jpg');
                            $("#mainModal").modal('hide');
                            document.getElementById('btnsearchauthors').click();


                        }
                        document.getElementById("<%= fupload.ClientID %>").value = "";

                    },
                    error: function (error) {
                        console.log(error);
                    }
                });


            }

        });



        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%-------------------------------- Delete Yes Function Of Customer n Plant Form ----------------------------%
        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>

        $(function () {

            $("#btndeleteyes").click(function () {

                $.ajax({
                    type: 'POST',
                    url: 'AuthorForm.aspx/popupdelete',
                    dataType: 'json',
                    data: '{"Id":"' + delID + '","Email":"' + $("#email1popup").html() + '"}',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var customerData = JSON.parse(response.d)

                        
                        console.log(customerData);
                        swal("Success", "Data Has Been Deleted Successfully!", "success");

                        $("#passchange").hide();


                        $('#Name').val("");
                        $('#Email').val("");
                        $('#ContactNumber').val("");
                        $('#Password').val("");
                        $('#RePassword').val("");
                        $('#Yourself').val("");
                        $("#btnUpdate").attr('disabled', 'disabled');
                        $("#btnSave").removeAttr('disabled');
                        $("#myModal").modal('hide');
                        $("#imgprv").attr('src', 'SiteContent/Defualt img/download.jpg');
                        $("#RePassword").show(100);
                        $("#Password").show(100);
                        $("#passlbl").show(100);
                        document.getElementById('statusInput').checked = false;
                        document.getElementById('btnsearchauthors').click();

                        document.getElementById("<%= fupload.ClientID %>").value = "";

                    },
                    error: function (error) {
                        console.log(error);
                    }
                });

            });


        });



        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%------------------------ Function For The Delete Popup --------------------------%> 
        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>


        function deletepopupfunc(Id) {
            delID = Id;

            $.ajax({
                type: 'POST',
                url: 'AuthorForm.aspx/getcustomerdt',
                dataType: 'json',
                data: '{"Id":"' + delID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var customerData = JSON.parse(response.d)

                    $("#myModal").modal('show');

                    $('#idpopup').html(customerData[0]["id"]);
                    $('#namepopup').html(customerData[0]["Name"]);
                    $('#email1popup').html(customerData[0]["Email"]);
                    $('#conpopup').html(customerData[0]["Contact_no"]);
                    $('#Yourself1').html(customerData[0]["Yourself"]);

                },
                error: function (error) {
                    console.log(error);
                }

            });
        }


        function validateEmail(email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(String(email).toLowerCase());
        }

            <%------------------------ Show password Change model on click --------------------------%> 
        $("#passchange").click(function () {
            $("#myModal1").modal('show');
        });



        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%-------------------------------- On Change Password Submit -----------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>

        $("#btndeleteyes1").click(function () {
            var earlierpass = sessionStorage.getItem('currentpas');
            var cunPass = $("#current1").val();
            var Password = $("#Password1").val();
            var RePassword = $("#RePassword1").val();

            $.ajax({
                type: 'POST',
                url: 'AuthorForm.aspx/updatepassword',
                dataType: 'json',
                data: '{"Id":"' + sessionStorage.getItem('updateid') + '","Password":"' + $("#Password1").val() + '","RePassword":"' + $("#RePassword1").val() + '","current":"' + $("#current1").val() + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var customerData = JSON.parse(response.d)
                    console.log(customerData);
                    loadgrid();

                    if (customerData == "Enter the Current Password") {
                        swal("Error", "Enter the Current Password", "warning")
                    }
                    else if (customerData == "Password and Re-Entered Passwords are not same") {
                        swal("Error", "Password and Re-Entered Passwords are not same", "warning")
                    }
                    else if (customerData == "Enter the Password") {
                        swal("Error", "Enter the Password", "warning")
                    }
                    else if (customerData == "Re Enter the Password") {
                        swal("Error", "Re Enter the Password", "warning")
                    }
                    else if (customerData == "Wrong Current Password") {
                        swal("Error", "Wrong Current Password!", "warning")
                    }
                    else {
                        swal("Success", "Password Changed Successfully", "success");

                        $('#Password1').val("");
                        $('#RePassword1').val("");
                        $('#current1').val("");
                        $("#myModal1").modal('hide');


                    }
                    document.getElementById("<%= fupload.ClientID %>").value = "";
                        document.getElementById('statusInput').checked = false;
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
        });



        $(".modelcloseCusPlant1").click(function () {
            $("#myModal1").modal('toggle');
        });



        $('#statusInput').on('change', function () {
            this.value = this.checked ? '1' : '0';
        }).change();



        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%--------------------------------search button function ---------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------------------------------------%>

        $("#btnsearchauthors").on('click', function () {
            var author = $("#author_name").val();

            
            if (document.getElementById('inactive').checked) {
                var status = 0;
            }
            else if (document.getElementById('active').checked) {
                var status = 1;
            }
            else if (document.getElementById('all').checked) {
                var status = 2;
            }

            if (document.getElementById('active').checked == false && document.getElementById('inactive').checked == false && document.getElementById('all').checked == false) {
                swal("Error", "Please Select Author Status!", "error");
                return;
            }

            $.ajax({
                type: 'POST',
                url: 'AuthorForm.aspx/searchAuthor',
                dataType: 'json',
                data: '{"Author":"' + author + '","Status":"' + status + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    $("#databody").empty();

                    var Data = JSON.parse(response.d);
                    //console.log(Data);

                    if (Data == "") {
                         return;
                    }

                     var tr = [];
                     for (var i = 0; i < Data.length; i++) {
                         var date = Data[i].Registered_Date;
                         res = date.split('T')[0];


                         var Status = Data[i].status

                         if (Status == 1) {
                             status = "Active"

                         }
                         else if (Status == 0) {
                             status = "Inactive"

                         }

                         tr.push('<tr>')
                         tr.push("<td> " + Data[i].id + " </td>");
                         tr.push("<td> " + Data[i].Name + "</td>");
                         tr.push("<td> " + Data[i].Email + "</td>");
                         tr.push("<td> " + Data[i].Contact_no + "</td>");
                         tr.push("<td> " + res + "</td>");
                         //tr.push("<td> " + Data[i].Yourself + "</td>");
                         tr.push("<td> " + status + "</td>");
                         tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"editFunction('" + Data[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                         tr.push("<td><a id=\"btnClose\" type=\"button\" onclick=\"deletepopupfunc('" + Data[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
                         tr.push('</tr>');


                    }


                    $("#databody").append($(tr.join('')));

                },
                error: function (error) {
                    console.log(error);
                }

            });

        });





        ////$("#btnsearchcomments").on('click', function () {
        //$("#btnsearchauthors").on('click', function () {

        //    var keyword = $("#author_name").val();
        //    console.log(keyword);


        //    if (keyword.length > 0 && document.getElementById('active').checked) {
        //        searchbynameapprove();
        //    }
        //    else if (keyword.length > 0 && document.getElementById('inactive').checked) {
        //        searchbynamenotapprove();
        //    }
        //    else if (keyword.length > 0 && document.getElementById('all').checked) {
        //        searchbynameall();
        //    }
        //    else if (document.getElementById('active').checked) {
        //        approve();
        //    }
        //    else if (document.getElementById('inactive').checked) {
        //        notapprove();
        //    }
        //    else if (document.getElementById('all').checked) {
        //        all();
        //    }

        //});

         <%-------------------------------- function for approve -----------------------------------------------%>

         //function approve() {



         //    $.ajax({
         //        type: 'POST',
         //        url: 'AuthorForm.aspx/approved',
         //        dataType: 'json',
         //        contentType: 'application/json; charset=utf-8',
         //        success: function (response) {


         //            $("#author_infolist tbody").empty();



         //            var customerData = JSON.parse(response.d);

         //            if (customerData == "") {

         //                return;
         //            }
         //            var tr = [];
         //            for (var i = 0; i < customerData.length; i++) {
         //                var date = customerData[i].Registered_Date;
         //                res = date.split('T')[0];


         //                var Status = customerData[i].status

         //                if (Status == 1) {
         //                    status1 = "Active"

         //                }
         //                else if (Status == 0) {
         //                    status1 = "Inactive"

         //                }

         //                tr.push('<tr>')
         //                tr.push("<td> " + customerData[i].id + " </td>");
         //                tr.push("<td> " + customerData[i].Name + "</td>");
         //                tr.push("<td> " + customerData[i].Email + "</td>");
         //                tr.push("<td> " + customerData[i].Contact_no + "</td>");
         //                tr.push("<td> " + res + "</td>");
         //                //tr.push("<td> " + customerData[i].Yourself + "</td>");
         //                tr.push("<td> " + status1 + "</td>");
         //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
         //                tr.push("<td><a id=\"btnClose\" type=\"button\" onclick=\"deletepopupfunc('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
         //                tr.push('</tr>');

         //            }

         //            $("#author_infolist tbody").append($(tr.join('')));

         //        },
         //        error: function (error) {
         //            console.log(error);
         //        }

         //    });
         //}


          <%-------------------------------- function for notapprove -----------------------------------------------%>
        //function notapprove() {



        //    $.ajax({
        //        type: 'POST',
        //        url: 'AuthorForm.aspx/notapproved',
        //        dataType: 'json',
        //        contentType: 'application/json; charset=utf-8',
        //        success: function (response) {


        //            $("#author_infolist tbody").empty();



        //            var customerData = JSON.parse(response.d);

        //            if (customerData == "") {

        //                return;
        //            }
        //            var tr = [];
        //            for (var i = 0; i < customerData.length; i++) {
        //                var date = customerData[i].Registered_Date;
        //                res = date.split('T')[0];

        //                var Status = customerData[i].status

        //                if (Status == 1) {
        //                    status1 = "Active"

        //                }
        //                else if (Status == 0) {
        //                    status1 = "Inactive"

        //                }


        //                tr.push('<tr>')
        //                tr.push("<td> " + customerData[i].id + " </td>");
        //                tr.push("<td> " + customerData[i].Name + "</td>");
        //                tr.push("<td> " + customerData[i].Email + "</td>");
        //                tr.push("<td> " + customerData[i].Contact_no + "</td>");
        //                tr.push("<td> " + res + "</td>");
        //                //tr.push("<td> " + customerData[i].Yourself + "</td>");
        //                tr.push("<td> " + status1 + "</td>");
        //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
        //                tr.push("<td><a id=\"btnClose\" type=\"button\" onclick=\"deletepopupfunc('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
        //                tr.push('</tr>');

        //            }

        //            $("#author_infolist tbody").append($(tr.join('')));

        //        },
        //        error: function (error) {
        //            console.log(error);
        //        }

        //    });
        //}


         <%-------------------------------- function for all -----------------------------------------------%>
            //function all() {



            //    $.ajax({
            //        type: 'POST',
            //        url: 'AuthorForm.aspx/all',
            //        dataType: 'json',
            //        contentType: 'application/json; charset=utf-8',
            //        success: function (response) {


            //            $("#author_infolist tbody").empty();



            //            var customerData = JSON.parse(response.d);

            //            if (customerData == "") {

            //                return;
            //            }
            //            var tr = [];
            //            for (var i = 0; i < customerData.length; i++) {
            //                var date = customerData[i].Registered_Date;
            //                res = date.split('T')[0];

            //                var Status = customerData[i].status

            //                if (Status == 1) {
            //                    status1 = "Active"

            //                }
            //                else if (Status == 0) {
            //                    status1 = "Inactive"

            //                }


            //                tr.push('<tr>')
            //                tr.push("<td> " + customerData[i].id + " </td>");
            //                tr.push("<td> " + customerData[i].Name + "</td>");
            //                tr.push("<td> " + customerData[i].Email + "</td>");
            //                tr.push("<td> " + customerData[i].Contact_no + "</td>");
            //                tr.push("<td> " + res + "</td>");
            //                //tr.push("<td> " + customerData[i].Yourself + "</td>");
            //                tr.push("<td> " + status1 + "</td>");
            //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
            //                tr.push("<td><a id=\"btnClose\" type=\"button\" onclick=\"deletepopupfunc('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
            //                tr.push('</tr>');

            //            }

            //            $("#author_infolist tbody").append($(tr.join('')));

            //        },
            //        error: function (error) {
            //            console.log(error);
            //        }

            //    });
            //}


         <%-------------------------------- function for serchbynameapprove -----------------------------------------------%>
            //function searchbynameapprove() {


            //    var keyword = $("#author_name").val();
            //    $.ajax({
            //        type: 'POST',
            //        url: 'AuthorForm.aspx/searchbynameapprove',
            //        data: '{"keyword":"' + keyword + '"}',
            //        dataType: 'json',
            //        contentType: 'application/json; charset=utf-8',
            //        success: function (response) {


            //            $("#author_infolist tbody").empty();



            //            var customerData = JSON.parse(response.d);

            //            if (customerData == "") {

            //                return;
            //            }
            //            var tr = [];
            //            for (var i = 0; i < customerData.length; i++) {
            //                var date = customerData[i].Registered_Date;
            //                res = date.split('T')[0];

            //                var Status = customerData[i].status

            //                if (Status == 1) {
            //                    status1 = "Active"

            //                }
            //                else if (Status == 0) {
            //                    status1 = "Inactive"

            //                }



            //                tr.push('<tr>')
            //                tr.push("<td> " + customerData[i].id + " </td>");
            //                tr.push("<td> " + customerData[i].Name + "</td>");
            //                tr.push("<td> " + customerData[i].Email + "</td>");
            //                tr.push("<td> " + customerData[i].Contact_no + "</td>");
            //                tr.push("<td> " + res + "</td>");
            //                //tr.push("<td> " + customerData[i].Yourself + "</td>");
            //                tr.push("<td> " + status1 + "</td>");
            //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
            //                tr.push("<td><a id=\"btnClose\" type=\"button\" onclick=\"deletepopupfunc('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
            //                tr.push('</tr>');

            //            }

            //            $("#author_infolist tbody").append($(tr.join('')));

            //        },
            //        error: function (error) {
            //            console.log(error);
            //        }

            //    });
            //}



         <%-------------------------------- function for serchbynamenotapprove -----------------------------------------------%>
        //function searchbynamenotapprove() {
        //    var keyword = $("#author_name").val();



        //    $.ajax({
        //        type: 'POST',
        //        url: 'AuthorForm.aspx/searchbynamenotapprove',
        //        data: '{"keyword":"' + keyword + '"}',
        //        dataType: 'json',
        //        contentType: 'application/json; charset=utf-8',
        //        success: function (response) {


        //            $("#author_infolist tbody").empty();



        //            var customerData = JSON.parse(response.d);

        //            if (customerData == "") {

        //                return;
        //            }
        //            var tr = [];
        //            for (var i = 0; i < customerData.length; i++) {
        //                var date = customerData[i].Registered_Date;
        //                res = date.split('T')[0];


        //                var Status = customerData[i].status

        //                if (Status == 1) {
        //                    status1 = "Active"

        //                }
        //                else if (Status == 0) {
        //                    status1 = "Inactive"

        //                }


        //                tr.push('<tr>')
        //                tr.push("<td> " + customerData[i].id + " </td>");
        //                tr.push("<td> " + customerData[i].Name + "</td>");
        //                tr.push("<td> " + customerData[i].Email + "</td>");
        //                tr.push("<td> " + customerData[i].Contact_no + "</td>");
        //                tr.push("<td> " + res + "</td>");
        //                //tr.push("<td> " + customerData[i].Yourself + "</td>");
        //                tr.push("<td> " + status1 + "</td>");
        //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
        //                tr.push("<td><a id=\"btnClose\" type=\"button\" onclick=\"deletepopupfunc('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
        //                tr.push('</tr>');

        //            }

        //            $("#author_infolist tbody").append($(tr.join('')));

        //        },
        //        error: function (error) {
        //            console.log(error);
        //        }

        //    });
        //}

         <%-------------------------------- function for serchbynameall -----------------------------------------------%>
        //function searchbynameall() {
        //    var keyword = $("#author_name").val();



        //    $.ajax({
        //        type: 'POST',
        //        url: 'AuthorForm.aspx/searchbynameall',
        //        data: '{"keyword":"' + keyword + '"}',
        //        dataType: 'json',
        //        contentType: 'application/json; charset=utf-8',
        //        success: function (response) {


        //            $("#author_infolist tbody").empty();



        //            var customerData = JSON.parse(response.d);

        //            if (customerData == "") {

        //                return;
        //            }
        //            var tr = [];
        //            for (var i = 0; i < customerData.length; i++) {
        //                var date = customerData[i].Registered_Date;
        //                res = date.split('T')[0];

        //                var Status = customerData[i].status

        //                if (Status == 1) {
        //                    status1 = "Active"

        //                }
        //                else if (Status == 0) {
        //                    status1 = "Inactive"

        //                }


        //                tr.push('<tr>')
        //                tr.push("<td> " + customerData[i].id + " </td>");
        //                tr.push("<td> " + customerData[i].Name + "</td>");
        //                tr.push("<td> " + customerData[i].Email + "</td>");
        //                tr.push("<td> " + customerData[i].Contact_no + "</td>");
        //                tr.push("<td> " + res + "</td>");
        //                //tr.push("<td> " + customerData[i].Yourself + "</td>");
        //                tr.push("<td> " + status1 + "</td>");
        //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
        //                tr.push("<td><a id=\"btnClose\" type=\"button\" onclick=\"deletepopupfunc('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-window-close\"></i>  </a></td>");
        //                tr.push('</tr>');

        //            }

        //            $("#author_infolist tbody").append($(tr.join('')));

        //        },
        //        error: function (error) {
        //            console.log(error);
        //        }

        //    });
        //}



    </script>

</asp:Content>
