<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserApprove.aspx.cs" Inherits="NewsWebsiteAdmin.UserApprove" %>

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

        <!-- Manage Readers Model -->
        <div id="modalAdd" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="width:100%">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Manage Readers</h4>
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
                                            <br />

                                            <img id="imgprv" height="200" width="200" />
                                            <br />
                                            <br />

                                            <div class="col-sm-5">
                                                <input type="checkbox" id="statusInput" unchecked="unchecked" value="0">
                                                &nbsp; <b>Active</b>
                                            </div>
                                            <br />

                                            <div class="form-group row">
                                                <div class="col-lg-8 ml-auto">
                                                    <button type="submit" id="saveTick" class="btn btn-primary ">Save</button>
                                                    <button type="reset" id="btncancel" class="btn btn-dark ">Discard</button>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
             </div>
          </div>
        <!-- Manage Readers Model End -->

        <div class="row">
            <div class="col-lg-12">
                <div class="card">

                    <div class="card-body">
                        <h4 class="card-title">Reader Search</h4>

                        <br />
                         <br />

                        <div class="form-validation">

                            <form id="formComments" class="form-valide" method="post" runat="server">
                                <div class="form-group row">
                                    <div class="col-sm-5">
                                        <input type="text" id="reader_name" class="form-control input-default" placeholder="Enter Reader Name">
                                    </div>
                                    &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;
                                    <div class="col-sm-2">
                                        <input type="radio" id="active" name="ckeckbox" value="0">
                                        &nbsp; Active
                                    </div>

                                    <div class="col-sm-2">
                                        <input type="radio" id="inactive" name="ckeckbox" value="0">
                                        &nbsp; Inactive
                                    </div>

                                    <br />
                                    <div class="form-group">
                                    </div>

                                    <div class="form-group row">
                                        <button type="button" id="btnsearchusers" class="btn btn-primary mb-2">Search</button>
                                        &nbsp;
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <div id="sercanditable" class="table-responsive" style="display: inline-table">

                                            <table class="table table-striped table-bordered" id="tablesercandi">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Name</th>
                                                        <th>Email</th>
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
                                                        <th>Status</th>
                                                        <th>Edit</th>

                                                    </tr>
                                                </tfoot>

                                            </table>

                                        </div>
                                    </div>

                                </div>
                            </form>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>


            $("#btnsearchusers").on('click', function () {

                if (document.getElementById('active').checked)
                {
                    var active = 1;
                }
                else if (document.getElementById('inactive').checked)
                {
                    var active = 0;
                }

                if (document.getElementById('active').checked == false && document.getElementById('inactive').checked == false) {
                    swal("Error", "Please Select Active or Inactive!", "error");
                    return;
                }

                var name = $("#reader_name").val();

                    $.ajax({
                        type: 'POST',
                        url: 'UserApprove.aspx/loadReaders',
                        dataType: 'json',
                        data: '{"Name":"' + name + '","Status":"' + active + '"}',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {

                            $("#databody").empty();

                            var customerData = JSON.parse(response.d);
                            //console.log(customerData);

                            if (customerData == "") {
                                swal({
                                    title: "No Data to Display",
                                    icon: "warning",
                                });
                                return;
                            }

                            var tr = [];
                            for (var i = 0; i < customerData.length; i++) {

                                var status = customerData[i].Status;

                                if (status == 1) {
                                    status = "Active";

                                }
                                else if (status == 0) {
                                    status = "Inactive";
                                }

                                tr.push('<tr>')
                                tr.push("<td> " + (i + 1) + "</td>");
                                tr.push("<td> " + customerData[i].Name + "</td>");
                                tr.push("<td> " + customerData[i].Email + "</td>");
                                tr.push("<td> " + status + "</td>");
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


                                                                //$("#btnsearchusers").on('click', function () {

                                                                //    if (document.getElementById('active').checked)
                                                                //    {
                
                                                                //        activesearch(); 
                                                                //    }
                                                                //    else if (document.getElementById('inactive').checked)
                                                                //    {
                                                                //        inactivesearch();
                                                                //    }
                                                                //    else if (document.getElementById('reader_name').val="")
                                                                //    {
                                                                //        document.getElementById('inactive').checked = false;
                                                                //        document.getElementById('active').checked = false;

                                                                //        $.ajax({
                                                                //            type: 'POST',
                                                                //            url: 'UserApprove.aspx/gridchange',
                                                                //            dataType: 'json',
                                                                //            contentType: 'application/json; charset=utf-8',
                                                                //            success: function (response) {


                                                                //                $("#databody").empty();



                                                                //                var customerData = JSON.parse(response.d);
                                                                //                console.log(customerData);
                                                                //                if (customerData == "") {

                                                                //                    return;
                                                                //                }
                                                                //                var tr = [];
                                                                //                for (var i = 0; i < customerData.length; i++) {

                                                                //                    var status = customerData[i].Status

                                                                //                    if (status == 1) {
                                                                //                        status = "Active"

                                                                //                    }
                                                                //                    else if (status == 0) {
                                                                //                        status = "Inactive"

                                                                //                    }

                                                                //                    tr.push('<tr>')
                                                                //                    tr.push("<td> " + (i + 1) + "</td>");
                                                                //                    tr.push("<td> " + customerData[i].Name + "</td>");
                                                                //                    tr.push("<td> " + customerData[i].Email + "</td>");
                                                                //                    tr.push("<td> " + status + "</td>");
                                                                //                    tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"$('#modalAdd').modal('show');\ editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                                                                //                    tr.push('</tr>');


                                                                //                }


                                                                //                $("#databody").append($(tr.join('')));

                                                                //            },
                                                                //            error: function (error) {
                                                                //                console.log(error);
                                                                //            }

                                                                //        });
                                                                //    }
                                                                //    else 
                                                                //    {

                                                                //        search();
                                                                //     }




                                                                //});



        $('#statusInput').on('change', function () {
            this.value = this.checked ? '1' : '0';
        }).change();


        //==================================================================================================================================//
        //----------------------------------------------- edit btn function for display value ----------------------------------------------//
        //==================================================================================================================================//


        function editFunction(Id) {
            var ID = Id;

            $.ajax({
                type: 'POST',
                url: 'UserApprove.aspx/getcustomerdt',
                dataType: 'json',
                data: '{"Id":"' + ID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var customerData = JSON.parse(response.d)
                    
                    $('#name').html(customerData[0]["Name"]);
                    $('#email').html(customerData[0]["Email"]);
                    $("#imgprv").attr("src", customerData[0]["Pic_Path"]);

                    var tick = customerData[0]["Status"];
                    if (tick == '1') {
                        tick = true;
                    } else {
                        tick = false;
                    }


                    $("#statusInput").prop('checked', tick);

                    sessionStorage.setItem('updateid', ID);


                }
            });
        }


         //====================================================================//
        //------------------------------ Update ------------------------------//
       //=====================================================================//

        function update() {
            var ID = sessionStorage.getItem('updateid');


            var statusinputSave = $("#statusInput").val();

            $.ajax({
                url: 'UserApprove.aspx/Updater',
                type: "POST",
                dataType: "json",
                data: '{"status":"' + statusinputSave + '","Id":"' + ID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {


                    var customerData = JSON.parse(response.d)

                    swal("Success", "Successfully Updated!", "success");

                    $('#name').html("");
                    $('#email').html("");
                    $("#statusInput").val("");
                    $("#imgprv").attr('src', 'SiteContent/Defualt img/download.jpg');
                    

                    $("#btnsearchusers").click();
                 
                    document.getElementById('statusInput').checked = false;

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
            $("#imgprv").attr('src', 'SiteContent/Defualt img/download.jpg');
            document.getElementById('statusInput').checked = false;
            $("#modalAdd").modal('hide');
        });
        

                                                                    //$('#active').on('change', function () {
            
                                                                    //    $.ajax({
                                                                    //        type: 'POST',
                                                                    //        url: 'UserApprove.aspx/active',
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
                    
                                                                    //                var status = customerData[i].Status;

                       

                                                                    //                if (status == 1) {
                                                                    //                    status = "Active"

                                                                    //                }
                                                                    //                else if (status == 0) {
                                                                    //                    status = "Inactive"

                                                                    //                }

                                                                    //                tr.push('<tr>')
                                                                    //                tr.push("<td> " + (i + 1) + "</td>");
                                                                    //                tr.push("<td> " + customerData[i].Name + "</td>");
                                                                    //                tr.push("<td> " + customerData[i].Email + "</td>");
                                                                    //                tr.push("<td> " + status + "</td>");
                                                                    //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"$('#modalAdd').modal('show');\ editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                                                                    //                tr.push('</tr>');

                                                                    //            }


                                                                    //            $("#databody").append($(tr.join('')));
                                                                    //            $('#name').html("");
                                                                    //            $('#email').html("");
                                                                    //            $("#imgprv").attr('src', 'SiteContent/Defualt img/download.jpg');
                                                                    //            $("#reader_name").val("");
                  
                                                                    //            document.getElementById('statusInput').checked = false;
                                                                    //        },
                                                                    //        error: function (error) {
                                                                    //            console.log(error);
                                                                    //        }

                                                                    //    });
                                                                    //});


                                                                    //$('#inactive').on('change', function () {



                                                                    //    $.ajax({
                                                                    //        type: 'POST',
                                                                    //        url: 'UserApprove.aspx/inactive',
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

                                                                    //                var status = customerData[i].Status;



                                                                    //                if (status == 1) {
                                                                    //                    status = "Active"

                                                                    //                }
                                                                    //                else if (status == 0) {
                                                                    //                    status = "Inactive"

                                                                    //                }

                                                                    //                tr.push('<tr>')
                                                                    //                tr.push("<td> " + (i + 1) + "</td>");
                                                                    //                tr.push("<td> " + customerData[i].Name + "</td>");
                                                                    //                tr.push("<td> " + customerData[i].Email + "</td>");
                                                                    //                tr.push("<td> " + status + "</td>");
                                                                    //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"$('#modalAdd').modal('show');\ editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                                                                    //                tr.push('</tr>');

                                                                    //            }


                                                                    //            $("#databody").append($(tr.join('')));
                                                                    //            $('#name').html("");
                                                                    //            $('#email').html("");
                                                                    //            $("#imgprv").attr('src', 'SiteContent/Defualt img/download.jpg');
                                                                    //            $('#reader_name').val("");

                                                                    //            document.getElementById('statusInput').checked = false;
                                                                    //        },
                                                                    //        error: function (error) {
                                                                    //            console.log(error);
                                                                    //        }

                                                                    //    });
                                                                    //});





                                                                    //function activesearch() {


                                                                    //    var keyword = $("#reader_name").val();

                                                                    //    console.log(keyword);
                                                                    //    $.ajax({
                                                                    //        type: 'POST',
                                                                    //        url: 'UserApprove.aspx/activesearch',
                                                                    //        data: '{"keyword":"' + keyword + '"}',
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

                                                                    //                var status = customerData[i].Status;



                                                                    //                if (status == 1) {
                                                                    //                    status = "Active"

                                                                    //                }
                                                                    //                else if (status == 0) {
                                                                    //                    status = "Inactive"

                                                                    //                }

                                                                    //                tr.push('<tr>')
                                                                    //                tr.push("<td> " + (i + 1) + "</td>");
                                                                    //                tr.push("<td> " + customerData[i].Name + "</td>");
                                                                    //                tr.push("<td> " + customerData[i].Email + "</td>");
                                                                    //                tr.push("<td> " + status + "</td>");
                                                                    //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"$('#modalAdd').modal('show');\ editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                                                                    //                tr.push('</tr>');

                                                                    //            }


                                                                    //            $("#databody").append($(tr.join('')));
                                                                    //            $('#name').html("");
                                                                    //            $('#email').html("");
                                                                    //            $("#imgprv").attr('src', 'SiteContent/Defualt img/download.jpg');

                                                                    //            document.getElementById('statusInput').checked = false;
                                                                    //        },
                                                                    //        error: function (error) {
                                                                    //            console.log(error);
                                                                    //        }

                                                                    //    });


                                                                    //}





                                                                    //function inactivesearch() {
                                                                    //    var keyword = $("#reader_name").val();
                                                                    //    $.ajax({
                                                                    //        type: 'POST',
                                                                    //        data: '{"keyword":"' + keyword + '"}',
                                                                    //        url: 'UserApprove.aspx/inactivesearch',
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

                                                                    //                var status = customerData[i].Status;



                                                                    //                if (status == 1) {
                                                                    //                    status = "Active"

                                                                    //                }
                                                                    //                else if (status == 0) {
                                                                    //                    status = "Inactive"

                                                                    //                }

                                                                    //                tr.push('<tr>')
                                                                    //                tr.push("<td> " + (i + 1) + "</td>");
                                                                    //                tr.push("<td> " + customerData[i].Name + "</td>");
                                                                    //                tr.push("<td> " + customerData[i].Email + "</td>");
                                                                    //                tr.push("<td> " + status + "</td>");
                                                                    //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"$('#modalAdd').modal('show');\ editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                                                                    //                tr.push('</tr>');

                                                                    //            }


                                                                    //            $("#databody").append($(tr.join('')));
                                                                    //            $('#name').html("");
                                                                    //            $('#email').html("");
                                                                    //            $("#imgprv").attr('src', 'SiteContent/Defualt img/download.jpg');

                                                                    //            document.getElementById('statusInput').checked = false;
                                                                    //        },
                                                                    //        error: function (error) {
                                                                    //            console.log(error);
                                                                    //        }

                                                                    //    });


                                                                    //}


                                                                    //function search() {

                                                                    //    var keyword = $("#reader_name").val();

                                                                    //    $.ajax({
                                                                    //        type: 'POST',
                                                                    //        url: 'UserApprove.aspx/search',
                                                                    //        data: '{"keyword":"' + keyword + '"}',
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

                                                                    //                var status = customerData[i].Status;



                                                                    //                if (status == 1) {
                                                                    //                    status = "Active"

                                                                    //                }
                                                                    //                else if (status == 0) {
                                                                    //                    status = "Inactive"

                                                                    //                }

                                                                    //                tr.push('<tr>')
                                                                    //                tr.push("<td> " + (i + 1) + "</td>");
                                                                    //                tr.push("<td> " + customerData[i].Name + "</td>");
                                                                    //                tr.push("<td> " + customerData[i].Email + "</td>");
                                                                    //                tr.push("<td> " + status + "</td>");
                                                                    //                tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"$('#modalAdd').modal('show');\ editFunction('" + customerData[i]["id"] + "')\"> <i class= \"fas fa-2x fa-edit\"></i>  </a></td>");
                                                                    //                tr.push('</tr>');

                                                                    //            }


                                                                    //            $("#databody").append($(tr.join('')));
                                                                    //            $('#name').html("");
                                                                    //            $('#email').html("");
                                                                    //            $("#imgprv").attr('src', 'SiteContent/Defualt img/download.jpg');

                                                                    //            document.getElementById('statusInput').checked = false;
                                                                    //        },
                                                                    //        error: function (error) {
                                                                    //            console.log(error);
                                                                    //        }

                                                                    //    });


                                                                    //}






    </script>
</asp:Content>
