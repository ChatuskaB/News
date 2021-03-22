<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserManagment.aspx.cs" Inherits="NewsWebsiteAdmin.UserManagment" %>

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

            img {
                height: 100px;
                width: 100px;
                border-radius: 50%;
                border-color: black;
                background-image: url("SiteContent/Defualt img/download.jpg");
                background-position: center;
                background-size: cover;
            }
        </style>
    </header>
    <div class="content-wrapper contentCustomer">
       
        <br />
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <button type="button" id="btnaddusers" class="btn btn-primary mb-2 active">Add User</button>

         <div id="mainModal" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
              <div class="modal-dialog modal-lg">
                     <div class="modal-content" style="width:100%">

                          <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

                          <br />
                         <br />
                           

                            <!-- Main content -->
              <div class="row">
                <div class="col-md-12">
            
                       <%-- Start of User Form --%>
                        
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">User Management</h3>
                  
                       
                             <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                         </div>
                        <div class="form-validation">
                              <div class="card-body">

                            <form id="mainform" class="form-valide" method="post" runat="server">
                              
                                 <div class="form-group">
                                    <label for="inputProjectLeader">Name</label>
                                    <span>* </span>
                                    <input type="text" id="name" class="form-control" placeholder="Name" contenteditable="false" required />
                                </div>


                                <div class="form-group">
                                    <label for="inputProjectLeader">E-Mail</label>
                                    <span>* </span>
                                    <input type="email" id="Email" class="form-control" placeholder="Email" contenteditable="false" required />
                                </div>


                                <%--Password-----------------------%>
                                <div class="form-group">
                                    <label for="inputClientCompany" id="passlbl">Password</label>
                                    <span id="span">* </span>
                                    <input type="password" id="Password" class="form-control" placeholder="Enter Your Password" contenteditable="false" required />
                                </div>

                                <div class="form-group">
                                    <label for="inputClientCompany" id="dropdown">User Role</label>
                                    <span id="span1">* </span>
                                    &nbsp;&nbsp;&nbsp;
            
                                    <select id="drprojecttype" name="drprojecttype" class="form-control" style="width:50%;">
                                                   <option value="0">--select--</option>
                                                 <option value="Admin">Admin</option>
                                                   <option value="Editor">Editor</option>
                                                   <option value="Author">Author</option>
                                                   <option value="Reader">Reader</option>
                                     </select>


                                </div>

                                <div class="col-sm-5">
                                    <input type="checkbox" id="statusInput" unchecked="unchecked" value="0">
                                    &nbsp; Status
                                </div>
                                <br />




<%--                                <div class="form-group row">
                                    <div class="col-lg-2 ml-auto">
                                        <button type="submit" id="saveTick" class="btn btn-primary ">Save</button>
                                        <button type="button" id="update" class="btn btn-primary ">Update</button>
                                        <button type="reset" id="btncancel" class="btn btn-dark ">Discard</button>
                                    </div>
                                </div>
                                 --%>


                           <div class="row float-right" style="padding-right: 8px;">
                                <input id="saveTick" type="submit" value="Submit" class="btn btn-success btn-lg">
                                &nbsp;&nbsp; &nbsp;&nbsp  &nbsp;&nbsp; &nbsp;&nbsp;
                                <button id="update" type="button" class="btn btn-primary btn-lg">Update</button>
                                &nbsp;&nbsp; &nbsp;&nbsp  &nbsp;&nbsp; &nbsp;&nbsp;
                                <button id="btncancel" type="reset" class="btn btn-warning btn-lg">Cancel</button>
                                &nbsp;&nbsp;                               
                            </div>

                       </form>
                                  
                         </div>
                             </div>
                         </div>
                     <%--</div>--%>
                  </div>
                           
                            <%-- </div>--%>
                        </div>
                        </div>
                        </div>
                    
                    </div>
                
                      


        <div class="row">

            

            <div class="col-lg-12">
                <div class="card">

                    <div class="card-body">


                        <div class="form-validation">


<%--                            <div class="form-group row">
                                &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;
                                   

                                    <br />
                                <div class="form-group">
                                </div>


                            </div>--%>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <div id="sercanditable" class="table-responsive" style="display: inline-table">

                                        <table class="table table-striped table-bordered" id="tablesercandi">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Role</th>
                                                    <th>Status</th>
                                                    <th>Edit</th>

                                                </tr>
                                            </thead>
                                            <tbody id ="databody">
                                            </tbody>

                                            <tfoot>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Role</th>
                                                    <th>Status</th>
                                                    <th>Edit</th>

                                                </tr>
                                            </tfoot>

                                        </table>

                                    </div>
                                </div>

                            </div>


                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    <script>

        $(document).ready(function () {

            loadgrid();
            
            $("#update").attr('disabled', 'disabled');

            $("#tablesercandi").DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": true,
            });

        });

        $('#statusInput').on('change', function () {
            this.value = this.checked ? '1' : '0';
        }).change();


        //$("#btncancel").click(function () {
         
        //    $("#Password").show(100);
        //    $("#passlbl").show(100);
        //    $("#span").show(100);
          
        //    document.getElementById('statusInput').checked = false;
        //});

        function loadgrid() {

            $.ajax({
                type: 'POST',
                url: 'UserManagment.aspx/gridchange',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                 
                    $("#databody").empty();

                    var customerData = JSON.parse(response.d);
                    if (customerData == "") {

                        return;
                    }
                    var tr = [];
                    for (var i = 0; i < customerData.length; i++) {
                       

                        var Status = customerData[i].status
                       
                        if (Status == 1) {
                            status1 = "Active"

                        }
                        else if (Status == 0) {
                            status1 = "Inactive"

                        }

                        var Usertype = customerData[i].usertype
                        if (Usertype == 3) {
                            Usertype1 = "Admin"

                        }
                        else if (Usertype == 2) {
                            Usertype1 = "Author"

                        }
                        else if (Usertype == 4) {
                            Usertype1 = "Editor"

                        }
                        else if (Usertype == 1) {
                            Usertype1 = "Reader"
                        }


                        tr.push('<tr>')
                        tr.push("<td> " + customerData[i].name + "</td>");
                        tr.push("<td> " + customerData[i].email + "</td>");
                        tr.push("<td> " + Usertype1 + "</td>");
                        tr.push("<td> " + status1 + "</td>");
                        tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push('</tr>');


                    }


                    $("#databody").append($(tr.join('')));

                },
                error: function (error) {
                    console.log(error);
                }

            });
        }




        
           $("#btnaddusers").click(function () {
            $("#mainModal").modal('show');


           
            });




        $("#mainform").on('reset', function (e) {

            $("#saveTick").removeAttr('disabled');
            $("#update").attr('disabled', 'disabled');

        });

        function validateEmail(Email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(String(Email).toLowerCase());
        }

        function editFunction(Id) {

            $("html").scrollTop(0)
            var ID = Id;
            

            var ID = Id;
            $("#saveTick").attr('disabled', 'disabled');
            $("#update").removeAttr('disabled');

            $.ajax({
                type: 'POST',
                url: 'UserManagment.aspx/getcustomerdt',
                dataType: 'json',
                data: '{"Id":"' + ID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var customerData = JSON.parse(response.d)
                      $("#mainModal").modal('show');
               
                    $('#Email').val(customerData[0]["email"]);
                    $('#name').val(customerData[0]["name"]);
                    $('#statusInput').val(customerData[0]["status"]);

                     $("#btncancel").click(function () {


                        $("#mainModal").modal('toggle');

                    });


                    //$("#btncancel").click(function () {

                    //    $("#Password").show(100);
                    //    $("#passlbl").show(100);
                    //    $("#span").show(100);

                    //    document.getElementById('statusInput').checked = false;
                    //});
                                      
                    $("#Password").hide(100);
                    $("#passlbl").hide(100);
                    $("#span").hide(100);
                  
                    var tick = customerData[0]["status"];
                   
                    if (tick == '1') {
                        tick = true;
                    } else {
                        tick = false;
                    }

                    var dptick = customerData[0]["usertype"];
                    console.log(dptick);

                    if (dptick == "2")
                    {
                        $("#drprojecttype").val("Author");
                    }
                    else if (dptick == "4")
                    {
                        $("#drprojecttype").val("Editor");

                    }
                    else if (dptick == "3")
                    {
                        $("#drprojecttype").val("Admin");
                    }
                    else if (dptick == "1")
                    {
                        $("#drprojecttype").val("Reader");
                    }
                    sessionStorage.setItem('dbEmail', customerData[0]["email"])
                    sessionStorage.setItem('updateid', ID);
                    $("#statusInput").prop('checked', tick);

                }
            });


        }



        $("#mainform").on('submit', function (e) {
            e.preventDefault();

            var statusinputSave = $("#statusInput").val();
            var Name = $("#name").val();
            var Email = $("#Email").val();
            var Usertype = $("#drprojecttype").val();
            var Password = $("#Password").val();
            var PicPath = $("#Email").val() ;
           
            console.log(Usertype);


            if (Usertype == "Admin") {
                Usertype1 = 3

            }
            else if (Usertype == "Author") {
                Usertype1 = 2


            }
            else if (Usertype == "Editor") {
                Usertype1 = 4

            }
            else if (Usertype == "Reader") {
                Usertype1 = 1

            }
            if (Name.trim() == "" || Name == null) {
                swal("Name Required!");
                return;
            } else if (!validateEmail(Email) || Email.trim() == "" || Email == null) {
                swal(" Valid Email  Required!");
                return;
           
            } else if (Password.trim() == "" || Password == null) {
                swal("Password  required!");
                return;
            } else if (Usertype.trim() == "" || Usertype == null || Usertype == "0") {
                swal("Usertype  required!");
                return;
            
            } else {

                $.ajax({
                    type: 'POST',
                    url: 'UserManagment.aspx/SaveCustomer',
                    dataType: 'json',
                    data: '{"Name":"' + $("#name").val() + '","Email":"' + $("#Email").val() + '","Password":"' + $("#Password").val() + '","status":"' + statusinputSave + '","usertype":"' + Usertype1 + '","PicPath":"' + PicPath + '"}',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {


                        var customerData = JSON.parse(response.d)


                        if (customerData == "Email is Already Registered") {


                            swal("Error", "Email is Already Registered", "warning")
                        }
                        else {
                            swal("Success", "Data Has Been Saved Successfully!", "success");
                            
                            $('#mainform')[0].reset();
                            loadgrid();
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }


                });



            }



        });



        $("#update").click(function (e) {
            e.preventDefault();

            var statusinputSave = $("#statusInput").val();
            var Name = $("#name").val();
            var Email = $("#Email").val();
            var Usertype = $("#drprojecttype").val();
            var Password = $("#Password").val();
            var PicPath = $("#Email").val();

            console.log(ID);
            var ID = sessionStorage.getItem('updateid');

            if (Usertype == "Admin") {
                Usertype1 = 3

            }
            else if (Usertype == "Author") {
                Usertype1 = 2

            }
            else if (Usertype == "Editor") {
                Usertype1 = 4
            }
            else if (Usertype == "Reader") {
                Usertype1 = 1
            }

            if (Name.trim() == "" || Name == null) {
                swal("Name Required!");
                return;
            } else if (!validateEmail(Email) || Email.trim() == "" || Email == null) {
                swal(" Valid Email  Required!");
                return;


            } else if (Usertype.trim() == "" || Usertype == null || Usertype == "0") {
                swal("Usertype  required!");
                return;

            } else {

                $.ajax({
                    type: 'POST',
                    url: 'UserManagment.aspx/UpdateCustomer',
                    dataType: 'json',
                    data: '{"Name":"' + $("#name").val() + '","Email":"' + $("#Email").val() + '","status":"' + statusinputSave + '","usertype":"' + Usertype1 + '","id":"' + ID + '","DatabaseEmail":"' + sessionStorage.getItem('dbEmail') + '"}',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {


                        var customerData = JSON.parse(response.d)


                        if (customerData == "Email is Already Registered") {


                            swal("Error", "Email is Already Registered", "warning")
                        }
                        else {
                            swal("Success", "Data Has Been Updated Successfully!", "success");

                            $('#mainform')[0].reset();
                            loadgrid();
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }


                });



            }



        });





    </script>
</asp:Content>
