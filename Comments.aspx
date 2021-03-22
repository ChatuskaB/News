<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="NewsWebsiteAdmin.Comments" %>

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
                border-radius: 50%;
                object-fit: cover;
            }
        </style>
    </header>

    <div class="content-wrapper contentCustomer">

    <!-- Manage Comments Model -->
        <div id="modalAdd" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="width:100%">
                    <section class="content">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Manage Comments</h4>
                                    <br />

                                    <br />
                                    <div class="form-validation">

                                        <form id="frmdisplaycomment" class="form-valide" method="post">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label col-form-label">Name</label>
                                                <div class="col-sm-8">
                                                    <label id="name" class=" col-form-label col-form-label"></label>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label col-form-label">Email</label>
                                                <div class="col-sm-8">
                                                    <label id="email" class=" col-form-label col-form-label"></label>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label col-form-label">User Type</label>
                                                <div class="col-sm-8">
                                                    <label id="usertype" class=" col-form-label col-form-label"></label>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label col-form-label">Comment </label>
                                                <div class="col-sm-8">
                                                    <label id="comment" class=" col-form-label col-form-label"></label>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label col-form-label">Article Category </label>
                                                <div class="col-sm-8">
                                                    <label id="Category" class=" col-form-label col-form-label"></label>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label col-form-label">Article Title </label>
                                                <div class="col-sm-8">
                                                    <label id="Title" class=" col-form-label col-form-label"></label>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label col-form-label">Article Content </label>
                                                <div class="col-sm-8">
                                                    <label id="Content" class=" col-form-label col-form-label" style="font-weight:normal"></label>
                                                </div>
                                            </div>

                                            <div class="form-group row">

                                                <div style="padding-right:40px; padding-left:10px">
                                                    <input type="radio" id="approved1" name="ckeckbox" value="0">
                                                    &nbsp; <b>Approve</b>
                                                </div>

                                                <div>
                                                    <input type="radio" id="rejected1" name="ckeckbox" value="0">
                                                    &nbsp; <b>Reject</b>
                                                </div>

                                            </div>
                                            <br />
                                            <div class="form-group row">
                                                <div class="col-lg-8 ml-auto">
                                                    <button type="submit" id="saveTick" class="btn btn-primary">Save</button>
                                                    <button type="reset" id="btncancel" class="btn btn-dark">Discard</button>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!-- Manage Comments Model End -->



      <section id="searchsec">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="col-md-12">
                                <h3 class="card-title">Comments Search</h3>
                            </div>

                        </div>
                        <div class="card-body">

                            <br />

                            <div class="form-validation">

                                <form id="formComments" class="form-valide" method="post">
                                    <div class="form-group row" style="padding: 15px;">
                                        <%-- <div class="col-sm-4">
                                        <input type="text" id="voter_name" class="form-control input-default" placeholder="Enter Article Name">
                                        </div>--%>
                                        <div class="col-sm-2">
                                            <input type="date" class="form-control" id="datetimeinput">
                                        </div>
                                        <div>
                                            -
                                        </div>
                                        <div class="col-sm-2">
                                            <input type="date" class="form-control" id="datetimeinput1">
                                        </div>
                                        
                                        <div style="padding-right:40px; padding-left:20px;">
                                            <input type="radio" id="pending" name="ckeckbox" checked value="0">
                                                &nbsp; Pending 
                                        </div>
                                        
                                        <div style="padding-right:40px">
                                            <input type="radio" id="approved" name="ckeckbox" value="0">
                                            &nbsp; Approved 
                                        </div>

                                        <div style="padding-right:80px">
                                            <input type="radio" id="rejected" name="ckeckbox" value="0">
                                            &nbsp; Rejected
                                        </div>
                                        
                                         <div>
                                            <button type="button" id="btnsearchcomments" class="btn btn-primary mb-2">Search</button>
                                        </div>

                                     </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>




        <section id="tablesec">
            <div class="card-body" id="mylist" style="background-color: #fff; display:none"">
                <%--<div class="card">--%>
                    <div class="card">
                        <div class="card-body">

                            <table class="table table-bordered table-hover table-responsive truedatatabel" id="tablesercandi">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>User Type</th>
                                        <th>Comment</th>
                                        <th>Comment Date & Time</th>
                                        <th>Article Category</th>
                                        <th>Article Title</th>
                                        <th>Status</th>
                                        <th>Edit</th>

                                    </tr>
                                </thead>

                                <tbody id="databody">
                                </tbody>

                                <tfoot>
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>User Type </th>
                                        <th>Comment</th>
                                        <th>Comment Date & Time</th>
                                        <th>Article Category</th>
                                        <th>Article Title</th>
                                        <th>Status</th>
                                        <th>Edit</th>

                                    </tr>
                                </tfoot>
                            </table>

                        </div>

                    </div>
                <%--</div>--%>
            </div>
        </section>

    </div>

    <script>
        $(document).ready(function () {

            var full_url = document.URL;
            var url_array = full_url.split('/')
            var last_segment = url_array[url_array.length - 1];  

            if (isNaN(last_segment)) {
                loadcurrentpending();
            } else {
                document.getElementById("searchsec").style.display = "none";
                document.getElementById("mylist").style.display = "block";
        

                ViewComments();
                
            }

            //loadcurrentpending();

            $(".truedatatabel").DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": true,
            });

        })

         //============================================================================================================================//
        //--------------------------------------- Display Today's Pending on Page Load -----------------------------------------------//
       //============================================================================================================================//

        function loadcurrentpending() {

            $("#mylist").attr('style', 'display:block');

            document.getElementById("datetimeinput").value = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
            document.getElementById("datetimeinput1").value = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);

            var date = $("#datetimeinput").val();
            var date1 = $("#datetimeinput1").val();

            document.getElementById('pending').checked = true;
            document.getElementById('approved').checked = false;
            document.getElementById('rejected').checked = false;
            
            if (document.getElementById('pending').checked == true) {
                var status = 0;
            }

            else if (document.getElementById('approved').checked == true) {
                var status = 1;
            }

            else {
                var status = 2;
            }
            
            $.ajax({
                type: 'POST',
                url: 'Comments.aspx/loadCurrentDayPending',
                data: '{"Date":"' + date + '","Date1":"' + date1 + '", "Status":"' + status + '"}',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    
                    $("#databody").html("");
                    
                    var customerData = JSON.parse(response.d);

                    if (customerData == "") {
                        swal({
                            title: "No Pending Comments Today",
                            icon: "warning",
                        });
                        return;
                    }

                    var tr = [];
                    for (var i = 0; i < customerData.length; i++) {
                        var date = customerData[i].date;
                        res = date.split('T')[0];

                        var status1 = customerData[i].status;

                        if (status1 == 0) {
                            status1 = "Pending"
                        }
                        else if (status1 == 1) {
                            status1 = "Approved"
                        }
                        else if (status1 == 2) {
                            status1 = "Rejected"
                        }

                        var usertype;
                        if (customerData[i]["usertype"] == 1) {
                            usertype = "Reader";
                        } else if (customerData[i]["usertype"] == 2) {
                            usertype = "Author";
                        } else {
                            usertype = "Non - Registered";
                        }

                        tr.push('<tr>')
                        tr.push("<td> " + (i + 1) + "</td>");
                        tr.push("<td> " + customerData[i].name + "</td>");
                        tr.push("<td> " + customerData[i].email + "</td>");
                        tr.push("<td> " + usertype + "</td>");
                        tr.push("<td> " + customerData[i].comment + "</td>");
                        tr.push("<td> " + res + "</td>");
                        tr.push("<td> " + customerData[i].Category1 + "</td>");
                        tr.push("<td> " + customerData[i].Title + "</td>");
                        tr.push("<td> " + status1 + "</td>");
                        tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"$('#modalAdd').modal('show');\ editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push('</tr>');


                    }


                    $("#databody").append($(tr.join('')));
                    
                    $('#name').html("");
                    $('#Category').html("");
                    $('#Title').html("");
                    $('#usertype').html("");
                    $('#email').html("");
                    document.getElementById('approved1').checked = false;
                    document.getElementById('rejected1').checked = false;
                    $('#comment').html("");

                },
                error: function (error) {
                    console.log(error);
                }

            });
        }

        //===========================================================================================================================//
        //--------------------------------------- data load for grid on click -------------------------------------------------------//
        //===========================================================================================================================//

                                                                        //$("#btnsearchcomments").on('click', function () {
                                                                        //    searchbydate();

                                                                        //    document.getElementById('approved').checked = false;
                                                                        //    document.getElementById('rejected').checked = false;
                                                                        //    document.getElementById('pending').checked = false;
                                                                        //    $.ajax({
                                                                        //        type: 'POST',
                                                                        //        url: 'Comments.aspx/gridchange',
                                                                        //        dataType: 'json',
                                                                        //        contentType: 'application/json; charset=utf-8',
                                                                        //        success: function (response) {


                                                                        //            $("#databody").empty();



                                                                        //            var customerData = JSON.parse(response.d);
                                                                        //            console.log(customerData);
                                                                        //            if (customerData == "") {

                                                                        //                return;
                                                                        //            }
                                                                        //            var tr = [];
                                                                        //            for (var i = 0; i < customerData.length; i++) {
                                                                        //                var date = customerData[i].date;
                                                                        //                res = date.split('T')[0];

                                                                        //                var status = customerData[i].status

                                                                        //                if (status == 1) {
                                                                        //                    status = "Approved"

                                                                        //                }
                                                                        //                else if (status == 0) {
                                                                        //                    status = "Pending"

                                                                        //                }
                                                                        //                else if (status == 2) {
                                                                        //                    status = "Not Approved"
                                                                        //                }

                                                                        //                var usertype;
                                                                        //                if (customerData[i]["usertype"] == 1) {
                                                                        //                    usertype = "Reader";
                                                                        //                } else if (customerData[i]["usertype"] == 2) {
                                                                        //                    usertype = "Author";
                                                                        //                } else {
                                                                        //                    usertype = "Non - Registered";
                                                                        //                }

                                                                        //                tr.push('<tr>')
                                                                        //                tr.push("<td> " + (i+1) + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].name + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].email + "</td>");
                                                                        //                tr.push("<td> " + usertype + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].comment + "</td>");
                                                                        //                tr.push("<td> " + res + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].Category1 + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].Title + "</td>");
                                                                        //                tr.push("<td> " + status + "</td>");
                                                                        //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"$('#modalAdd').modal('show');\ editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                                                                        //                tr.push('</tr>');


                                                                        //            }


                                                                        //            $("#databody").append($(tr.join('')));
                                                                        //            $('#datetimeinput').val("");
                                                                        //            $('#datetimeinput1').val("");
                                                                        //        },
                                                                        //        error: function (error) {
                                                                        //            console.log(error);
                                                                        //        }

                                                                        //    });
                                                                        //});


                                                                      
         //============================================================================================================================//
        //--------------------------------------- Search Button Function -------------------------------------------------------------//
       //============================================================================================================================//

            $("#btnsearchcomments").on('click', function () {
                $("#mylist").attr('style', 'display:block');

                var date = $("#datetimeinput").val();
                var date1 = $("#datetimeinput1").val();

                if (date > date1)
                {
                    swal("Error", "Start Date has to be before End Date!", "error");
                    return;
                }

                if (document.getElementById('pending').checked == true) {
                    var status = 0;
                }

                else if (document.getElementById('approved').checked == true) {
                    var status = 1;
                }

                else {
                    var status = 2;
                }
                                                 
            $.ajax({
                type: 'POST',
                url: 'Comments.aspx/loadComments',
                data: '{"Date":"' + date + '","Date1":"' + date1 + '", "Status":"' + status + '"}',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                                                        
                    $("#databody").html("");
                                                        
                    var customerData = JSON.parse(response.d);

                    //console.log(customerData); 

                    if (customerData == "") {
                        swal({
                            title: "No Data to Display",
                            icon: "warning",
                         });
                        return;
                    }

                    if (customerData == "0") {
                        swal("Error", "Please Enter Start and End Date!", "error");
                    }

                    var tr = [];
                    for (var i = 0; i < customerData.length; i++) {
                        var date = customerData[i].date;
                        res = date.split('T')[0];

                        var status1 = customerData[i].status;

                        if (status1 == 0) {
                            status1 = "Pending"
                        }
                        else if (status1 == 1) {
                            status1 = "Approved"
                        }
                        else if (status1 == 2) {
                            status1 = "Rejected"
                        }

                        var usertype;
                        if (customerData[i]["usertype"] == 1) {
                            usertype = "Reader";
                        } else if (customerData[i]["usertype"] == 2) {
                            usertype = "Author";
                        } else {
                            usertype = "Non - Registered";
                        }

                        tr.push('<tr>')
                        tr.push("<td> " + (i+1) + "</td>");
                        tr.push("<td> " + customerData[i].name + "</td>");
                        tr.push("<td> " + customerData[i].email + "</td>");
                        tr.push("<td> " + usertype + "</td>");
                        tr.push("<td> " + customerData[i].comment + "</td>");
                        tr.push("<td> " + res + "</td>");
                        tr.push("<td> " + customerData[i].Category1 + "</td>");
                        tr.push("<td> " + customerData[i].Title + "</td>");
                        tr.push("<td> " + status1 + "</td>");
                        tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"$('#modalAdd').modal('show');\ editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push('</tr>');


                    }


                    $("#databody").append($(tr.join('')));
                                                        
                },
                error: function (error) {
                    console.log(error);
                }

            });
        });

        
        //==================================================================================================================================//
        //--------------------------------------- edit btn function for display value ------------------------------------------------------//
        //==================================================================================================================================//

        function editFunction(Id) {
            var ID = Id;
            
            $.ajax({
                type: 'POST',
                url: 'Comments.aspx/getcustomerdt',
                dataType: 'json',
                data: '{"Id":"' + ID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var customerData = JSON.parse(response.d)

                    var usertype;

                    if (customerData[0]["usertype"] == 1) {
                        usertype = "Reader";
                    } else if (customerData[0]["usertype"] == 2) {
                        usertype = "Author";
                    } else {
                        usertype = "Non - Registered";
                    }
                    $('#usertype').html(usertype);
                    $('#name').html(customerData[0]["name"]);
                    $('#email').html(customerData[0]["email"]);
                    $('#comment').html(customerData[0]["comment"]);
                    $('#Category').html(customerData[0]["Category1"]);
                    $('#Title').html(customerData[0]["Title"]);
                    $('#Content').html(customerData[0]["Content"]);


                    var tick = customerData[0]["status"];
                    if (tick == '1') {
                        document.getElementById('approved1').checked = true;
                    }
                    else if (tick == '2')
                    {
                        document.getElementById('rejected1').checked = true;
                    }
                    else
                    {
                        document.getElementById('approved1').checked = false;
                        document.getElementById('rejected1').checked = false;
                    }


                    sessionStorage.setItem('updateid', ID);


                }
            });
        }

        //=================================================================================================================================\\
        //--------------------------------------- end of edit btn function for display value -----------------------------------------------\\
        //===================================================================================================================================\\

        function check() {

            if (document.getElementById('rejected').checked) {
                $("#rejected").change()
            }
            else if (document.getElementById('approved').checked) {
                $("#approved").change();
            }
            else if (document.getElementById('pending').checked) {
                $("#pending").change();
            }
        }


        ////===============================================================================================================================\\
        ////---------------------------------------  end of data load for grid on click -----------------------------------------------------\\
        ////===================================================================================================================================\\

                                                                //$('#statusInput').on('change', function () {
                                                                //    this.value = this.checked ? '1' : '2';
                                                                //}).change();


        //===============================================================================================================================\\
        //--------------------------------------- update function ------------------------------------------------------------------------\\
        //=================================================================================================================================\\

        function update() {
            var ID = sessionStorage.getItem('updateid');

            if (document.getElementById('approved1').checked == true)
            {
                var statusinputSave = 1;
            }
            if (document.getElementById('rejected1').checked == true)
            {
                var statusinputSave = 2;
            }

            $.ajax({
                url: 'Comments.aspx/Updater',
                type: "POST",
                dataType: "json",
                data: '{"status":"' + statusinputSave + '","Id":"' + ID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {


                    var customerData = JSON.parse(response.d)
                    
                    swal({
                        title: "Success",
                        text: "Successfully Updated!",
                        type: "success",
                        icon: "success"
                    }).then(function () {
                        $("#btnsearchcomments").click();
                    });

                    $('#name').html("");
                    $('#email').html("");
                    $('#comment').html("");
                    $('#Category').html("");
                    $('#Title').html("");
                    $('#Content').html("");
                    check();
                    document.getElementById('approved1').checked = false;
                    document.getElementById('rejected1').checked = false;

                },
                error: function (error) {
                    console.log(error);
                }


            });
        }

        $("#saveTick").on('click', function (e) {
            e.preventDefault();
            update();
            $("#modalAdd").modal('hide');
        });


        $("#btncancel").on('click', function (e) {
            e.preventDefault();
            $('#name').html("");
            $('#email').html("");
            $('#usertype').html("");
            $('#comment').html("");
            $('#Category').html("");
            $('#Title').html("");
            $('#Content').html("");
            document.getElementById('approved1').checked = false;
            document.getElementById('rejected1').checked = false;
            $("#frmdisplaycomment").trigger("reset");
            $("#modalAdd").modal('hide');
        });


        //============================================================================================================================//
        //--------------------------------------- View Comments-------------------------------------------------------------//
        //============================================================================================================================//

        function ViewComments() {
            $("#mylist").attr('style', 'display:block');

            var full_url = document.URL;
            var url_array = full_url.split('/')
            var last_segment = url_array[url_array.length - 1];  

            $.ajax({
                type: 'POST',
                url: 'Comments.aspx/ViewloadComments',
                //data: { id: last_segment},
                data: '{"id":"' + last_segment + '"}',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    $("#databody").html("");

                    var customerData = JSON.parse(response.d);

                    console.log(customerData); 

                    if (customerData == "") {
                        swal({
                            title: "No Data to Display",
                            icon: "warning",
                        });
                        return;
                    }
                    

                    var tr = [];
                    for (var i = 0; i < customerData.length; i++) {
                        var date = customerData[i].date;
                        res = date.split('T')[0];

                        var status1 = customerData[i].status;

                        if (status1 == 0) {
                            status1 = "Pending"
                        }
                        else if (status1 == 1) {
                            status1 = "Approved"
                        }
                        else if (status1 == 2) {
                            status1 = "Rejected"
                        }

                        var usertype;
                        if (customerData[i]["usertype"] == 1) {
                            usertype = "Reader";
                        } else if (customerData[i]["usertype"] == 2) {
                            usertype = "Author";
                        } else {
                            usertype = "Non - Registered";
                        }

                        tr.push('<tr>')
                        tr.push("<td> " + (i + 1) + "</td>");
                        tr.push("<td> " + customerData[i].name + "</td>");
                        tr.push("<td> " + customerData[i].email + "</td>");
                        tr.push("<td> " + usertype + "</td>");
                        tr.push("<td> " + customerData[i].comment + "</td>");
                        tr.push("<td> " + res + "</td>");
                        tr.push("<td> " + customerData[i].Category1 + "</td>");
                        tr.push("<td> " + customerData[i].Title + "</td>");
                        tr.push("<td> " + status1 + "</td>");
                        tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"$('#modalAdd').modal('show');\ editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                        tr.push('</tr>');


                    }


                    $("#databody").append($(tr.join('')));

                },
                error: function (error) {
                    console.log(error);
                }

            });
        }




                                                                        //$('#approved').on('change', function () {

                                                                        //    $("#mylist").attr('style' , 'display:block');

                                                                        //    $.ajax({
                                                                        //        type: 'POST',
                                                                        //        url: 'Comments.aspx/approved',
                                                                        //        dataType: 'json',
                                                                        //        contentType: 'application/json; charset=utf-8',
                                                                        //        success: function (response) {


                                                                        //            $("#databody").empty();



                                                                        //            var customerData = JSON.parse(response.d);

                                                                        //            if (customerData == "") {

                                                                        //                return;
                                                                        //            }
                                                                        //            var tr = [];
                                                                        //            for (var i = 0; i < customerData.length; i++) {
                                                                        //                var date = customerData[i].date;
                                                                        //                res = date.split('T')[0];

                                                                        //                var status = customerData[i].status;

                                                                        //                if (status == 1) {
                                                                        //                    status = "Approved"
                                                                        //                }
                                                                        //                else {
                                                                        //                    status = "Not Approved"
                                                                        //                }

                                                                        //                var usertype;
                                                                        //                if (customerData[i]["usertype"] == 1) {
                                                                        //                    usertype = "Reader";
                                                                        //                } else if (customerData[i]["usertype"] == 2) {
                                                                        //                    usertype = "Author";
                                                                        //                } else {
                                                                        //                    usertype = "Non - Registered";
                                                                        //                }


                                                                        //                tr.push('<tr>')
                                                                        //                tr.push("<td> " + (i + 1) + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].name + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].email + "</td>");
                                                                        //                tr.push("<td> " + usertype + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].comment + "</td>");
                                                                        //                tr.push("<td> " + res + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].Category1 + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].Title + "</td>");
                                                                        //                tr.push("<td> " + status + "</td>");
                                                                        //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"$('#modalAdd').modal('show');\ editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                                                                        //                tr.push('</tr>');


                                                                        //            }

                                                                        //            $("#databody").append($(tr.join('')));
                                                                        //            $('#usertype').html("");
                                                                        //            $('#name').html("");
                                                                        //            $('#email').html("");
                                                                        //            $('#comment').html("");
                                                                        //            $('#Category').html("");
                                                                        //            $('#Title').html("");
                                                                        //            $('#datetimeinput').val("");
                                                                        //            $('#datetimeinput1').val("");
                                                                        //            document.getElementById('statusInput').checked = false;
                                                                        //        },
                                                                        //        error: function (error) {
                                                                        //            console.log(error);
                                                                        //        }

                                                                        //    });
                                                                        //});

                                                                        //$('#pending').on('change', function () {

                                                                        //    $("#mylist").attr('style', 'display:block');

                                                                        //    $.ajax({
                                                                        //        type: 'POST',
                                                                        //        url: 'Comments.aspx/pending',
                                                                        //        dataType: 'json',
                                                                        //        contentType: 'application/json; charset=utf-8',
                                                                        //        success: function (response) {


                                                                        //            $("#databody").empty();



                                                                        //            var customerData = JSON.parse(response.d);

                                                                        //            if (customerData == "") {

                                                                        //                return;
                                                                        //            }
                                                                        //            var tr = [];
                                                                        //            for (var i = 0; i < customerData.length; i++) {
                                                                        //                var date = customerData[i].date;
                                                                        //                res = date.split('T')[0];
                                                                        //                var status = customerData[i].status;

                                                                        //                if (status == 0) {
                                                                        //                    status = "Pending"
                                                                        //                }
                                                                        //                else {
                                                                        //                    status = "Not Approved"
                                                                        //                }

                                                                        //                var usertype;
                                                                        //                if (customerData[i]["usertype"] == 1) {
                                                                        //                    usertype = "Reader";
                                                                        //                } else if (customerData[i]["usertype"] == 2) {
                                                                        //                    usertype = "Author";
                                                                        //                } else {
                                                                        //                    usertype = "Non - Registered";
                                                                        //                }

                                                                        //                tr.push('<tr>')
                                                                        //                tr.push("<td> " + (i + 1) + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].name + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].email + "</td>");
                                                                        //                tr.push("<td> " + usertype + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].comment + "</td>");
                                                                        //                tr.push("<td> " + res + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].Category1 + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].Title + "</td>");
                                                                        //                tr.push("<td> " + status + "</td>");
                                                                        //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"$('#modalAdd').modal('show');\ editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                                                                        //                tr.push('</tr>');

                                                                        //            }


                                                                        //            $("#databody").append($(tr.join('')));
                                                                        //            $('#usertype').html("");
                                                                        //            $('#name').html("");
                                                                        //            $('#email').html("");
                                                                        //            $('#comment').html("");
                                                                        //            $('#datetimeinput').val("");
                                                                        //            document.getElementById('statusInput').checked = false;
                                                                        //            $('#Category').html("");
                                                                        //            $('#Title').html("");
                                                                        //            $('#datetimeinput1').val("");
                                                                        //        },
                                                                        //        error: function (error) {
                                                                        //            console.log(error);
                                                                        //        }

                                                                        //    });
                                                                        //});


                                                                        //$('#rejected').on('change', function () {

                                                                        //    $("#mylist").attr('style', 'display:block');

                                                                        //    $.ajax({
                                                                        //        type: 'POST',
                                                                        //        url: 'Comments.aspx/notapproved',
                                                                        //        dataType: 'json',
                                                                        //        contentType: 'application/json; charset=utf-8',
                                                                        //        success: function (response) {


                                                                        //            $("#databody").empty();



                                                                        //            var customerData = JSON.parse(response.d);

                                                                        //            if (customerData == "") {

                                                                        //                return;
                                                                        //            }
                                                                        //            var tr = [];
                                                                        //            for (var i = 0; i < customerData.length; i++) {
                                                                        //                var date = customerData[i].date;
                                                                        //                res = date.split('T')[0];

                                                                        //                var status = customerData[i].status;

                                                                        //                if (status == 2) {
                                                                        //                    status = " Not Approved"
                                                                        //                } else {
                                                                        //                    status = "Not Approved"
                                                                        //                }

                                                                        //                var usertype;
                                                                        //                if (customerData[i]["usertype"] == 1) {
                                                                        //                    usertype = "Reader";
                                                                        //                } else if (customerData[i]["usertype"] == 2) {
                                                                        //                    usertype = "Author";
                                                                        //                } else {
                                                                        //                    usertype = "Non - Registered";
                                                                        //                }

                                                                        //                tr.push('<tr>')
                                                                        //                tr.push("<td> " + (i + 1) + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].name + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].email + "</td>");
                                                                        //                tr.push("<td> " + usertype + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].comment + "</td>");
                                                                        //                tr.push("<td> " + res + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].Category1 + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].Title + "</td>");
                                                                        //                tr.push("<td> " + status + "</td>");
                                                                        //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"$('#modalAdd').modal('show');\ editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                                                                        //                tr.push('</tr>');


                                                                        //            }


                                                                        //            $("#databody").append($(tr.join('')));
                                                                        //            $('#name').html("");
                                                                        //            $('#usertype').html("");
                                                                        //            $('#email').html("");
                                                                        //            $('#comment').html("");
                                                                        //            $('#Title').html("");
                                                                        //            $('#Category').html("");
                                                                        //            document.getElementById('statusInput').checked = false;
                                                                        //            $('#datetimeinput').val("");
                                                                        //            $('#datetimeinput1').val("");


                                                                        //        },
                                                                        //        error: function (error) {
                                                                        //            console.log(error);
                                                                        //        }

                                                                        //    });
                                                                        //});


                                                                        //function searchbydate() {

                                                                        //    $("#mylist").attr('style', 'display:block');

                                                                        //    var date = $("#datetimeinput").val();
                                                                        //    var date1 = $("#datetimeinput1").val();

                                                                        //    $.ajax({
                                                                        //        type: 'POST',
                                                                        //        url: 'Comments.aspx/datebased',
                                                                        //        data: '{"Date":"' + date + '","Date1":"' + date1 + '"}',
                                                                        //        dataType: 'json',
                                                                        //        contentType: 'application/json; charset=utf-8',
                                                                        //        success: function (response) {
                    
                                                                        //            $("#databody").html("");

                                                                        //            var customerData = JSON.parse(response.d);

                                                                        //            if (customerData == "") {
                                                                        //                return;
                                                                        //            }

                                                                        //            var tr = [];
                                                                        //            for (var i = 0; i < customerData.length; i++) {
                                                                        //                var date = customerData[i].date;
                                                                        //                res = date.split('T')[0];

                                                                        //                var status = customerData[i].status

                                                                        //                if (status == 1) {
                                                                        //                    status = "Approved"
                                                                        //                }
                                                                        //                else if (status == 0) {
                                                                        //                    status = "Pending"
                                                                        //                }
                                                                        //                else if (status == 2) {
                                                                        //                    status = "Not Approved"
                                                                        //                }

                                                                        //                var usertype;
                                                                        //                if (customerData[i]["usertype"] == 1) {
                                                                        //                    usertype = "Reader";
                                                                        //                } else if (customerData[i]["usertype"] == 2) {
                                                                        //                    usertype = "Author";
                                                                        //                } else {
                                                                        //                    usertype = "Non - Registered";
                                                                        //                }

                                                                        //                tr.push('<tr>')
                                                                        //                tr.push("<td> " + (i + 1) + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].name + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].email + "</td>");
                                                                        //                tr.push("<td> " + usertype + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].comment + "</td>");
                                                                        //                tr.push("<td> " + res + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].Category1 + "</td>");
                                                                        //                tr.push("<td> " + customerData[i].Title + "</td>");
                                                                        //                tr.push("<td> " + status + "</td>");
                                                                        //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"$('#modalAdd').modal('show');\ editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                                                                        //                tr.push('</tr>');


                                                                        //            }


                                                                        //            $("#databody").append($(tr.join('')));
                                                                        //            document.getElementById('approved').checked = false;
                                                                        //            document.getElementById('rejected').checked = false;
                                                                        //            document.getElementById('pending').checked = false;
                                                                        //            $('#name').html("");
                                                                        //            $('#Category').html("");
                                                                        //            $('#Title').html("");
                                                                        //            $('#usertype').html("");
                                                                        //            $('#email').html("");
                                                                        //            document.getElementById('statusInput').checked = false;
                                                                        //            $('#comment').html("");

                                                                        //        },
                                                                        //        error: function (error) {
                                                                        //            console.log(error);
                                                                        //        }

                                                                        //    });
                                                                        //}

    </script>

</asp:Content>
