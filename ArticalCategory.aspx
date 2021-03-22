<%@ Page Title="Category and Subcategory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArticalCategory.aspx.cs" Inherits="NewsWebsiteAdmin.ArticalCategory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <header>
        <style>
            .contentCustomer {
                padding: 5px;
                padding-top: 5px;
                /*padding: 4px;*/
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
        <form id="mainform" novalidate method="post">

            <!-- Main content -->

            <div class="row">
                <div class="col-md-12">

                    <%-- Start of Article Category Form --%>
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Article Categories</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div class="card-body">

                            <%--                 <div class="form-group">
                     <label for="inputClientCompany">Select Language</label>
                     <span>* </span>
                     <select required class="form-control custom-select" id="txtcatlanguage">
                         <option value="0"></option>
                         <option value="1">English</option>
                         <option value="2">Sinhala</option>
                         <option value="3">Tamil</option>


                     </select>
                 </div>--%>

                            <div class="form-group">
                                <label for="inputClientCompany1">Category</label>
                                <span>*</span>
                                <input required type="text" id="txtcategory" class="form-control">
                            </div>





                            <div class="form-group">
                                <label for="inputClientCompany">Menu Order</label>
                                <span>* </span>
                                <select required class="form-control custom-select" id="txtmenuorder">

                                    <option value=""></option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>


                                </select>
                            </div>


                        </div>

                    </div>


                </div>



            </div>


            <div class="card-footer">
                <button id="btnSave" type="submit" class="btn btn-success">Save</button>
                &nbsp;&nbsp; &nbsp;&nbsp  &nbsp;&nbsp; &nbsp;&nbsp;
                <button id="btnUpdate" type="button" class="btn btn-dark">Update</button>
                &nbsp;&nbsp; &nbsp;&nbsp  &nbsp;&nbsp; &nbsp;&nbsp;
                <button id="btnCancel" type="reset" class="btn btn-danger float-right">Cancel</button>
                &nbsp;&nbsp;
            </div>

        </form>


        <%-- Start Of Artial Category Grid --%>

        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Categories</h3>
            </div>

            <div class="card-body">

                <table id="tblcatogerylist" class="table table-bordered table-hover" style="display: inline-table">
                    <thead>
                        <tr>
                            <th>Category</th>
                            <th>Menu Order</th>
                            <th>Translations</th>

                            <th>Edit</th>
                            <th>Delete</th>
                            <th>Add SubCategory</th>

                        </tr>
                    </thead>


                    <tbody></tbody>

                    <tfoot>
                        <tr>
                            <th>Category </th>
                            <th>Menu Order</th>

                            <th>Translations</th>
                            <th>Edit</th>
                            <th>Delete</th>
                            <th>Add SubCategory</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <%-- End Of Artical Category Grid --%>
    </div>

    <%--Start Of Delete Article  Popup Grid --%>

    <div id="myModal" class="modal">

        <div class="modal-content">

            <section class="content">

                <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelcloseCat" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

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
                                        <label for="inputName1">
                                            Category <span class="required">:</span>
                                        </label>
                                        <label id="categorypopup" class="form-control"></label>
                                    </div>


                                    <div class="form-group">
                                        <label for="inputProjectLeader">
                                            Menu Order <span class="required">:</span>
                                        </label>
                                        <label id="menupopup" class="form-control"></label>
                                    </div>


                                </form>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="row float-right" style="padding-right: 8px;">
                    <button id="btndyes" class="btn btn-info" type="button">Yes</button>
                    &nbsp;&nbsp; &nbsp;&nbsp  &nbsp;&nbsp; &nbsp;&nbsp;
                    <button id="btndcancel" type="reset" class="btn btn-danger  modelcloseCat">Cancel</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>





            </section>
        </div>
    </div>


    <%-- Start Of Add Subcategory Form --%>

    <div id="myModal1" class="modal">

        <div class="modal-content">


            <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

            <br />
            <br />

            <form id="subcatform">

                <input type="hidden" id="subcatId" />
                <input type="hidden" id="subcatId2" />
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">



                            <div class="card-header">
                                <h3 class="card-title">Sub Categories</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>


                            <div class="card-body">

                                <input type="hidden" id="maincatposition" />

                                <div class="form-group">
                                    <label for="inputClientCompany">
                                        The Category  <span class="required"></span>
                                    </label>
                                    <label id="categorypopup1" class="form-control"></label>
                                </div>

                                <div class="form-group">
                                    <label for="inputClientCompany1">SubCategory </label>

                                    <input required type="text" id="txtsubcategory" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label for="inputClientCompany">Menu Order</label>
                                    <span>* </span>
                                    <select required class="form-control custom-select" id="txtmenuordersub">

                                        <option value=""></option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>


                                    </select>
                                </div>




                            </div>


                            <div class="row float-right" style="padding-left: 30px;">
                                <input id="btnSave1" type="submit" value="Save" class="btn btn-success">
                                &nbsp;&nbsp;&nbsp;
                                 <button id="btnUpdate1" type="button" class="btn btn-dark">Update</button>
                                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                                 <button id="btnCancel1" type="reset" class="btn btn-danger">Cancel</button>

                            </div>

                            <%--Start Of Add SubCategory Grid --%>




                            <div class="card">


                                <div class="card-header">
                                </div>


                                <div class="card-body">


                                    <table id="tblsubcatlist" class="table table-bordered table-hover" style="display: inline-table">
                                        <thead>
                                            <tr>
                                                <th>SubCategory</th>
                                                <th>Sort Order</th>
                                                <th>Translations</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>

                                        <tfoot>
                                            <tr>
                                                <th>SubCategory</th>
                                                <th>Menu Order</th>
                                                <th>Translations</th>

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




    <%-- Start Of Sub Translations Form --%>

    <div id="myModalTsub" class="modal">

        <div class="modal-content">


            <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

            <br />
            <br />

            <form id="Transformsub">

                <input type="hidden" id="TranstIdsub" />
                <input type="hidden" id="primaryKeyID" />
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">



                            <div class="card-header">
                                <h3 class="card-title">Translation</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>


                            <div class="card-body">


                                <div class="form-group">
                                    <label for="inputClientCompany">
                                        The SubCategory  <span class="required"></span>
                                    </label>
                                    <label id="subcategorypopup2" class="form-control"></label>
                                </div>


                                <div class="form-group">
                                    <label for="inputClientCompany">Select Language</label>
                                    <span>* </span>
                                    <select required class="form-control custom-select" id="txtsbcattranslanguage">
                                    </select>
                                </div>


                                <div class="form-group">
                                    <label for="inputClientCompany1">Translate SubCategory </label>

                                    <input required type="text" id="txtTsubcategory" class="form-control">
                                </div>


                            </div>


                            <div class="row float-right" style="padding-left: 30px;">
                                <input id="btnSaveTsb" type="submit" value="Save" class="btn btn-success">
                                &nbsp;&nbsp;&nbsp;
                                 <button id="btnUpdateTsb" type="button" class="btn btn-dark">Update</button>
                                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                                 <button id="btnCancelTsb" type="reset" class="btn btn-danger">Cancel</button>

                            </div>

                            <%--Start Of Sub Translations Grid --%>




                            <div class="card">


                                <div class="card-header">
                                    <h3 class="card-title">Details</h3>
                                </div>


                                <div class="card-body">


                                    <table id="tblsubtranslist" class="table table-bordered table-hover" style="display: inline-table">
                                        <thead>
                                            <tr>
                                                <th>SubCategory</th>
                                                <th>Language</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>

                                        <tfoot>
                                            <tr>
                                                <th>SubCategory</th>
                                                <th>Language</th>
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







    <%-- Start Of Cat Translations Form --%>

    <div id="myModalT" class="modal">

        <div class="modal-content">


            <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

            <br />
            <br />

            <form id="Transform">

                <input type="hidden" id="TranstId" />
                <input type="hidden" id="primaryKK" />
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">



                            <div class="card-header">
                                <h3 class="card-title">Translation</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>


                            <div class="card-body">


                                <div class="form-group">
                                    <label for="inputClientCompany">
                                        The Category  <span class="required"></span>
                                    </label>
                                    <label id="categorypopup2" class="form-control"></label>
                                </div>



                                <div class="form-group">
                                    <label for="inputClientCompany">Select Language</label>
                                    <span class="required"></span>
                                    <select required class="form-control custom-select" id="txtcattranslanguage">
                                    </select>
                                </div>


                                <div class="form-group">
                                    <label for="inputClientCompany1">Translate Category </label>

                                    <input required type="text" id="txtTcategory" class="form-control">
                                </div>


                            </div>


                            <div class="row float-right" style="padding-left: 30px;">
                                <input id="btnSaveT" type="submit" value="Save" class="btn btn-success">
                                &nbsp;&nbsp;&nbsp;
                                 <button id="btnUpdateT" type="button" class="btn btn-dark">Update</button>
                                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                                 <button id="btnCancelT" type="reset" class="btn btn-danger">Cancel</button>

                            </div>

                            <%--Start Of Cat Translations Grid --%>




                            <div class="card">


                                <div class="card-header">
                                </div>


                                <div class="card-body">


                                    <table id="tbltranslist" class="table table-bordered table-hover" style="display: inline-table">
                                        <thead>
                                            <tr>
                                                <th>Category</th>
                                                <th>Language</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>

                                        <tfoot>
                                            <tr>
                                                <th>Category</th>
                                                <th>Language</th>
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





    <%-- Start Of Cat Translation Delete Popup Grid --%>


    <div id="myModalTrsD" class="modal">

        <div class="modal-content">

            <section class="content">

                <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelcloseTrans " style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>



                <br />
                <br />

                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">


                            <div class="card-header">
                                <h3 class="card-title">Details</h3>
                            </div>


                            <div class="card-body">

                                <form id="frmTrans" data-parsley-validate="" class="form-horizontal form-label-left">

                                    <input type="hidden" id="txtTranslsId" />


                                    <%--  <div class="form-group">
                                        <label for="inputProjectLeaderpp1">
                                            Category<span class="required">:</span>
                                        </label>
                                        <label id="catpopup" class="form-control"></label>
                                    </div>--%>


                                    <div class="form-group">
                                        <label for="inputProjectLeadersub">
                                            Translated Category <span class="required">:</span>
                                        </label>
                                        <label id="transcatpopup" class="form-control"></label>
                                    </div>


                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row float-right" style="padding-right: 8px;">
                    <button id="btndyes1" class="btn btn-info" type="button">Yes</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button id="btndcancel1" type="reset" class="btn btn-danger modelcloseTrans">Cancel</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>


            </section>
        </div>
    </div>





    <%-- Start Of SubCategory Trans Popup Grid --%>


    <div id="myModalTD" class="modal">

        <div class="modal-content">

            <section class="content">

                <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelcloseTrns " style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>



                <br />
                <br />

                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">


                            <div class="card-header">
                                <h3 class="card-title">Details</h3>
                            </div>


                            <div class="card-body">

                                <form id="frmTransD" data-parsley-validate="" class="form-horizontal form-label-left">

                                    <input type="hidden" id="txtTrnsDId" />


                                    <div class="form-group">
                                        <label for="inputProjectLeaderpp1">
                                            Category<span class="required">:</span>
                                        </label>
                                        <label id="cattranspopup" class="form-control"></label>
                                    </div>




                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row float-right" style="padding-right: 8px;">
                    <button id="btndTyes" class="btn btn-info" type="button">Yes</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button id="btndTcancel" type="reset" class="btn btn-danger  modelcloseTrns">Cancel</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>


            </section>
        </div>
    </div>





    <%-- Start Of SubCategory Popup Grid --%>


    <div id="myModal2" class="modal">

        <div class="modal-content">

            <section class="content">

                <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelcloseSub " style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>



                <br />
                <br />

                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">


                            <div class="card-header">
                                <h3 class="card-title">Details</h3>
                            </div>


                            <div class="card-body">

                                <form id="frmSeasons1" data-parsley-validate="" class="form-horizontal form-label-left">

                                    <input type="hidden" id="txtTransId1" />


                                    <div class="form-group">
                                        <label for="inputProjectLeaderpp1">
                                            SubCategory<span class="required">:</span>
                                        </label>
                                        <label id="subpopup" class="form-control"></label>
                                    </div>


                                    <div class="form-group">
                                        <label for="inputProjectLeadersub">
                                            Menu Order <span class="required">:</span>
                                        </label>
                                        <label id="menusubpopup" class="form-control"></label>
                                    </div>


                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row float-right" style="padding-right: 8px;">
                    <button id="btndsubyes1" class="btn btn-info " type="button">Yes</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button id="btndsubcancel1" type="reset" class="btn btn-danger  modelcloseSub">Cancel</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>


            </section>
        </div>
    </div>


    <script>

        var ID = 0;
        var delID = 0;
        var delsubID = 0;
        var subcat = 0;
        var subGrid = 0;
        var LanID = 0;
        var Trs = 0;
        var TrsGrid = 0;
        var sbTrs = 0;
        var delCatT = 0;
        var delSubT = 0;

        $(document).ready(function () {
            loadgrid();
            loadgrid1();
            loadLanguagecat();
            loadLanguagesub();
            loadgridT();
            loadgridsubT();
        });




        //$("#txtcatlanguage").change(function () {


        //    LanID = $("#txtcatlanguage option:selected").val();


        //    loadcategory();
        //});


        function loadLanguagecat() {

            $("#txtcattranslanguage").empty();
            $("#txtcattranslanguage").append("<option value='0'></option>");


            $.ajax({
                type: 'POST',
                url: 'ArticalCategory.aspx/loadLanguagecat',
                dataType: 'json',

                contentType: 'application/json; charset=utf-8',
                success: function (response) {



                    var myData = JSON.parse(response.d);
                    if (myData == "") {


                    }

                    //else {


                    $.each(myData, function () {
                        $("#txtcattranslanguage").append($("<option/>").val(this.id).text(this.Language));





                    });


                },




                error: function (error) {
                    console.log(error);
                }



            });
        }


        function loadLanguagesub() {

            $("#txtsbcattranslanguage").empty();
            $("#txtsbcattranslanguage").append("<option value='0'>--Select Language--</option>");


            $.ajax({
                type: 'POST',
                url: 'ArticalCategory.aspx/loadLanguagesub',
                dataType: 'json',

                contentType: 'application/json; charset=utf-8',
                success: function (response) {



                    var myData = JSON.parse(response.d);
                    if (myData == "") {
                        //   swal("info","Menu Order Already Inserted");

                    }

                    //else {


                    $.each(myData, function () {
                        $("#txtsbcattranslanguage").append($("<option/>").val(this.id).text(this.Language));





                    });


                },




                error: function (error) {
                    console.log(error);
                }



            });
        }





            <%--Data Load Function  Category --%>

        function loadgrid() {
            $("#btnCancel").removeAttr('disabled');
            $("#btnSave").removeAttr('disabled');
            $("#btnUpdate").attr('disabled', 'disabled');

            $.ajax({
                type: 'POST',
                url: 'ArticalCategory.aspx/gridchangecat',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {


                    $("#tblcatogerylist tbody").empty();


                    var myData = JSON.parse(response.d);
                    console.log(myData);
                    if (myData == "") {

                        return;
                    }
                    var tr = [];
                    for (var i = 0; i < myData.length; i++) {

                        tr.push('<tr>')
                        tr.push("<td> " + myData[i].Category1 + " </td>");
                        tr.push("<td> " + myData[i].MenuOrder + "</td>");


                        tr.push("<td><a id=\"addTransButton\" type=\"button\" onclick=\"translationFunction('" + myData[i]["id"] + "')\"> <i class= \"fas fa-1x fa-language\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnEdit\" type=\"button\"  onclick=\"updateFunction('" + myData[i]["id"] + "')\"> <i class= \"fas fa-1x fa-edit\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnClose\" type=\"button\" onclick=\"deletepopupfunc('" + myData[i]["id"] + "')\"> <i class= \"fas fa-1x fa-window-close\"></i>  </a></td>");
                        tr.push("<td><a id=\"addSubButton\" type=\"button\" onclick=\"addsubcatfunc('" + myData[i]["id"] + "')\"> <i class= \"fas fa-1x fa-tags\"></i>  </a></td>");
                        tr.push('</tr>');

                    }

                    $("#tblcatogerylist tbody").empty();
                    $('#tblcatogerylist').append($(tr.join('')));

                },
                error: function (error) {
                    console.log(error);
                }

            });
        }


        $(".modelcloseCat").click(function () {
            $("#myModal").modal('toggle');
        });


         <%-- Save Function  Category--%> 

          $("#mainform").on('submit', function (e) {
              e.preventDefault();

              $("#txtcategory").attr('contenteditable', false);
              $("#txtmenuorder").attr('contenteditable', false);
              var manuOrder = $('#txtmenuorder').val();



              $("#btnCancel").removeAttr('disabled');
              $("#btnSave").removeAttr('disabled');


              var txtcategory = $("#txtcategory").val();


              if (txtcategory.trim() == "" || txtcategory == null || manuOrder == "") {
                  swal(" Required field available, please check the form");
                  return;

              } else {

                  $.ajax({
                      type: 'POST',
                      url: 'ArticalCategory.aspx/SaveArticalCategory',
                      dataType: 'json',

                      data: '{"Category1":"' + $("#txtcategory").val() + '","MenuOrder":"' + $("#txtmenuorder").val() + '","OtherLanguageText":"' + $("#txtcategory").val() + '"}',




                      contentType: 'application/json; charset=utf-8',
                      success: function (response) {


                          var myData = JSON.parse(response.d)


                          if (myData == "0") {
                              swal("Error", "The Menu Order Is Already Inserted", "error");



                          }


                          else {
                              loadgrid();
                              swal("Success", "Category Has Been Inserted Successfully!", "success");
                              $('#mainform')[0].reset();
                          }
                      },
                      error: function (error) {
                          console.log(error);
                      }


                  });


              }






          });





            <%-- Function For The Category Translations   --%>



        function translationFunction(id) {
            Trs = id;

            $("#btnCancelT").removeAttr('disabled');
            $("#btnSaveT").removeAttr('disabled');
            $("#btnUpdateT").attr('disabled', 'disabled');

            $.ajax({
                type: 'POST',
                url: 'ArticalCategory.aspx/Getcategorydtl',
                dataType: 'json',
                data: '{"id":"' + Trs + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $("#myModalT").modal('show');
                    loadgridT(id);

                    $('#categorypopup2').html(myData[0]["Category1"]);


                    $('#TranstId').val(myData[0]["id"]);

                },
                error: function (error) {
                    console.log(error);
                }

            });
        }




         <%-- Function For The Category Translations Grid Data Load  --%>


        function loadgridT(id) {

            TrsGrid = id;

            $("#btnCancelT").removeAttr('disabled');
            $("#btnSaveT").removeAttr('disabled');
            $("#btnUpdateT").attr('disabled', 'disabled');


            $.ajax({
                type: 'POST',
                url: 'ArticalCategory.aspx/gridchangeT',
                data: '{"id":"' + TrsGrid + '"}',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {


                    $("#tbltranslist tbody").empty();



                    var myData = JSON.parse(response.d);
                    console.log(myData);
                    if (myData == "") {
                        return;
                    }
                    var tr = [];
                    for (var i = 0; i < myData.length; i++) {




                        tr.push('<tr>')

                        tr.push("<td> " + myData[i].OtherLanguageText + "</td>");
                        tr.push("<td> " + myData[i].Language + "</td>");
                        tr.push("<td><a id=\"btnEdit1\" type=\"button\"  onclick=\"updateTransFunction('" + myData[i]["id"] + "')\">  <i class= \"fas fa-1x fa-edit\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnClose1\" type=\"button\" onclick=\"deletepopupfuncT('" + myData[i]["id"] + "')\"> <i class= \"fas fa-1x fa-window-close\"></i>  </a></td>");

                        tr.push('</tr>');

                    }

                    $("#tbltranslist tbody").empty();
                    $('#tbltranslist').append($(tr.join('')));

                },
                error: function (error) {
                    console.log(error);
                }

            });

        }


        $(".modelcloseTrans").click(function () {
            $("#myModalTrsD").modal('toggle');
        });




           <%-- Save Category Trans Function  --%> 

          $("#Transform").on('submit', function (e) {
              e.preventDefault();

              $("#txtcattranslanguage").attr('contenteditable', false);
              $("#txtTcategory").attr('contenteditable', false);




              $("#btnCancelT").removeAttr('disabled');
              $("#btnSaveT").removeAttr('disabled');


              var txtTcategory = $("#txtTcategory").val();
              var txtcattranslanguage = $("#txtcattranslanguage").val();



              if (txtTcategory.trim() == "" || txtTcategory == null || txtcattranslanguage == 0) {
                  swal(" Required field available, please check the form");
                  return;

              }

              else {

                  $.ajax({
                      type: 'POST',
                      url: 'ArticalCategory.aspx/SaveTransCategory',
                      dataType: 'json',

                      data: '{"LanguageId":"' + $("#txtcattranslanguage").val() + '", "PrimaryKeyId": "' + $("#TranstId").val() + '", "OtherLanguageText":"' + $("#txtTcategory").val() + '"}',




                      contentType: 'application/json; charset=utf-8',
                      success: function (response) {


                          var myData = JSON.parse(response.d)



                          if (myData == "0") {
                              swal("Error", "The Category has Already been translatedted", "error");



                          }


                          else {


                              //console.log(myData);

                              //loadgridT();

                              swal("Success", "Category Has Been Translated Successfully!", "success");
                              loadgridT($("#TranstId").val());
                              $('#Transform')[0].reset();
                          }
                      },
                      error: function (error) {
                          console.log(error);
                      }


                  });


              }






          });





          <%-- Delete Yes Function Category --%>


          $(function () {

              $("#btndyes").click(function () {

                  $.ajax({
                      type: 'POST',
                      url: 'ArticalCategory.aspx/popupdelete',
                      dataType: 'json',
                      data: '{"id":"' + delID + '"}',
                      contentType: 'application/json; charset=utf-8',
                      success: function (response) {

                          var myData = JSON.parse(response.d)

                          if (myData == "0") {
                              swal("Error", "Check The SubCategories and then Delete", "error");

                          }
                          else {
                              loadgrid();
                              $("#myModal").modal('toggle');


                              swal("Success", "Category Has Been Deleted Successfully!", "success");

                          }




                      },
                      error: function (error) {
                          console.log(error);
                      }
                  });

              });


          });

        <%-- Function For The Category Delete Popup --%> 



        function deletepopupfunc(id) {
            delID = id;

            $.ajax({
                type: 'POST',
                url: 'ArticalCategory.aspx/getcategorydtl',
                dataType: 'json',
                data: '{"id":"' + delID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $("#myModal").modal('show');


                    $('#categorypopup').html(myData[0]["Category1"]);

                    $('#menupopup').html(myData[0]["MenuOrder"]);

                    //$('#createdDatepopup').html(myData[0]["CreatedDate"]);

                },
                error: function (error) {
                    console.log(error);
                }

            });
        }


          <%-- Function for the Update Category --%>



        $(function () {
            $("#btnUpdate").click(function () {

                $("#btnCancel").removeAttr('disabled');
                $("#btnUpdate").removeAttr('disabled');
                $("#btnSave").removeAttr('disabled');


                var txtcategory = $("#txtcategory").val();
                var manuOrder = $('#txtmenuorder').val();


                // var txtmenuorder = $("#txtmenuorder").val();



                if (txtcategory.trim() == "" || txtcategory == null || manuOrder == null) {
                    swal(" Required field available, please check the form");
                    return;

                } else {


                    $.ajax({
                        type: 'POST',
                        url: 'ArticalCategory.aspx/UpdateCategory',
                        dataType: 'json',

                        data: '{"Category1":"' + $("#txtcategory").val() + '","MenuOrder":"' + $("#txtmenuorder").val() + '","OtherLanguageText":"' + $("#txtcategory").val() + '","id":"' + ID + '"}',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {


                            var myData = JSON.parse(response.d)



                            if (myData == "0") {
                                swal("Error", "The Menu Order Is Already Inserted", "error");
                                $("#btnSave").attr('disabled', 'disabled');


                            }


                            else {
                                loadgrid();
                                swal("Success", "Category Has Been Updated Successfully!", "success");
                                $('#txtcategory').val("");

                                $('#txtmenuorder').val("");

                            }




                            // loadgrid();



                            //swal("Success", "Category Has Been Updated Successfully!", "success");
                            // //loadgrid();
                            //  $('#txtcategory').val("");

                            //  $('#txtmenuorder').val("");



                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });


                }

            });
        });


            <%-- Category Update  (Edit) Function  --%>

        function updateFunction(id) {

            $("html").scrollTop(0)

            ID = id;


            $("#btnSave").removeAttr('disabled');
            $("#btnCancel").removeAttr('disabled');
            $("#btnSave").attr('disabled', 'disabled');
            $("#btnUpdate").removeAttr('disabled');




            $.ajax({
                type: 'POST',
                url: 'ArticalCategory.aspx/getcategorydtl',
                dataType: 'json',
                data: '{"id":"' + ID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)



                    $('#txtcategory').val(myData[0]["Category1"]);

                    $('#txtmenuorder').val(myData[0]["MenuOrder"]);


                    $("#txtTransId").val(myData[0]["id"]);



                },
                error: function (error) {
                    console.log(error);
                }
            });


        }

            <%-- Function for the Update Category Translations--%>



        $(function () {
            $("#btnUpdateT").click(function () {

                $("#btnCancelT").removeAttr('disabled');
                $("#btnUpdateT").removeAttr('disabled', 'disabled');
                $("#btnSaveT").attr('disabled', 'disabled');
                //$("#btnSaveT").removeAttr('disabled');


                var txtTcategory = $("#txtTcategory").val();
                var Language = $("#txtcattranslanguage").val();
                var primartt = $("#primaryKK").val();






                if (txtTcategory.trim() == "" || txtTcategory == null || Language == 0) {
                    swal("Required field available, please check the form");
                    return;

                } else {


                    $.ajax({
                        type: 'POST',
                        url: 'ArticalCategory.aspx/UpdateTCategory',
                        dataType: 'json',

                        data: '{"OtherLanguageText":"' + $("#txtTcategory").val() + '","LanguageId":"' + $("#txtcattranslanguage").val() + '","id":"' + Trs + '","priID":"' + primartt + '"}',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {




                            var myData = JSON.parse(response.d);


                            if (myData == 0) {
                                swal("Error", " Already Translated", "error");
                            }
                            else {
                                //loadgridT();

                                swal("Success", "Translated Category Has Been Updated Successfully!", "success");
                                //loadgridT();
                                loadgridT($("#TranstId").val());

                                $('#txtTcategory').val("");
                                $('#txtcattranslanguage').val("");
                            }





                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });


                }

            });
        });


            <%-- Category Translations Update  (Edit) Function  --%>

        function updateTransFunction(id) {

            $("myModalT").scrollTop(0)

            Trs = id;


            $("#btnSaveT").removeAttr('disabled');
            $("#btnCancelT").removeAttr('disabled');
            $("#btnSaveT").attr('disabled', 'disabled');
            $("#btnUpdateT").removeAttr('disabled');




            $.ajax({
                type: 'POST',
                url: 'ArticalCategory.aspx/getTcategorydtl',
                dataType: 'json',
                data: '{"id":"' + Trs + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {



                    var myData = JSON.parse(response.d);

                    console.log(myData);

                    $('#txtTcategory').val(myData[0]["OtherLanguageText"]);

                    $('#txtcattranslanguage').append('<option hidden selected = "selected" value=' + myData[0]["lid"] + '>' + myData[0]["Language"] + '</option>');


                    $("#txtTranslsId").val(myData[0]["oid"]);
                    $("#primaryKK").val(myData[0]["prid"]);



                },
                error: function (error) {
                    console.log(error);
                }
            });


        }



           <%-- Delete Yes Function Category Translations --%>


        $(function () {

            $("#btndyes1").click(function () {

                $.ajax({
                    type: 'POST',
                    url: 'ArticalCategory.aspx/popupdeleteT',
                    dataType: 'json',
                    data: '{"id":"' + delCatT + '"}',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var myData = JSON.parse(response.d)
                        //loadgridT();
                        $("#myModalTrsD").modal('toggle');


                        swal("Success", "Translated Category Has Been Deleted Successfully!", "success");
                        loadgridT($("#TranstId").val());



                    },
                    error: function (error) {
                        console.log(error);
                    }
                });

            });


        });

        <%-- Function For The Category Translations Delete Popup --%> 



        function deletepopupfuncT(id) {
            delCatT = id;

            $.ajax({
                type: 'POST',
                url: 'ArticalCategory.aspx/getTcategorydtl',
                dataType: 'json',
                data: '{"id":"' + delCatT + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $("#myModalTrsD").modal('show');


                    $('#transcatpopup').html(myData[0]["OtherLanguageText"]);

                    //$('#menupopup').html(myData[0]["MenuOrder"]);

                    //$('#createdDatepopup').html(myData[0]["CreatedDate"]);




                },
                error: function (error) {
                    console.log(error);
                }

            });
        }





        $("#btnCancel").click(function () {

            $("#btnSave").removeAttr('disabled');
            $("#btnUpdate").attr('disabled', 'disabled');

        });


        $("#btnCancelT").click(function () {

            $("#btnSaveT").removeAttr('disabled');
            $("#btnUpdateT").removeAttr('disabled');
            $("#btnUpdateT").attr('disabled', 'disabled');
            loadLanguagecat();

        });


                                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                  //////////////////////////////////                                        /////////////////////////////////////
                                 ////////////////////////////////// <%-- SubCat Form /  SubCat Details --%>/////////////////////////////////////
        //////////////////////////////////                                        /////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

        function addsubcatfunc(id) {
            subcat = id;


            $('#txtsubcategory').val("");

            $('#txtsubmenuorder').val("");




            $("#btnCancel1").removeAttr('disabled');
            $("#btnSave1").removeAttr('disabled');
            $("#btnUpdate1").attr('disabled', 'disabled');





            $.ajax({
                type: 'POST',
                url: 'ArticalCategory.aspx/getcategorydtl',
                dataType: 'json',
                data: '{"id":"' + subcat + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    
                    var myData = JSON.parse(response.d)
                    console.log("HY");
                    console.log(myData);
                    $("#myModal1").modal('show');
                    loadgrid1(id);

                    $('#categorypopup1').html(myData[0]["Category1"]);
                    $('#maincatposition').val(myData[0]["MenuOrder"]);

                    $('#subcatId').val(myData[0]["id"]);

                },
                error: function (error) {
                    console.log(error);
                }

            });
        }







         <%-- Function For The Subcategory Grid Data Load  --%>


        function loadgrid1(id) {

            subGrid = id;


            $("#btnCancel1").removeAttr('disabled');
            $("#btnSave1").removeAttr('disabled');
            $("#btnUpdate1").attr('disabled', 'disabled');


            $.ajax({
                type: 'POST',
                url: 'ArticalCategory.aspx/gridchangesub',
                data: '{"id":"' + subGrid + '"}',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {


                    $("#tblsubcatlist tbody").empty();



                    var myData = JSON.parse(response.d);
                    if (myData == "") {
                        return;
                    }
                    var tr = [];
                    for (var i = 0; i < myData.length; i++) {




                        tr.push('<tr>')

                        tr.push("<td> " + myData[i].SubCategory1 + "</td>");
                        tr.push("<td> " + myData[i].subcatmenuorder + "</td>");

                        //tr.push("<td> " + myData[i].CreatedDate + "</td>");
                        tr.push("<td><a id=\"addsubTransButton\" type=\"button\" onclick=\"subtranslationFunction('" + myData[i]["id"] + "')\"> <i class= \"fas fa-1x fa-language\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnEdit2\" type=\"button\"  onclick=\"updateSubFunction('" + myData[i]["id"] + "')\">  <i class= \"fas fa-1x fa-edit\"></i>  </a></td>");
                        tr.push("<td><a id=\"btnClose2\" type=\"button\" onclick=\"deletepopupfunc1('" + myData[i]["id"] + "')\"> <i class= \"fas fa-1x fa-window-close\"></i>  </a></td>");

                        tr.push('</tr>');

                    }

                    $("#tblsubcatlist tbody").empty();
                    $('#tblsubcatlist').append($(tr.join('')));

                },
                error: function (error) {
                    console.log(error);
                }

            });

        }


        $(".modelcloseSub").click(function () {
            $("#myModal2").modal('toggle');

        });


           <%-- Function For The Save Subcat Form --%>

           $("#subcatform").on('submit', function (e) {
               e.preventDefault();
               
               $("#txtsubcategory").attr('contenteditable', false);

               $("#txtmenuordersub").attr('contenteditable', false);
               
               $("#btnSave1").attr('disabled', 'disabled');
               $("#btnCancel1").removeAttr('disabled');
               $("#btnSave1").removeAttr('disabled');
               
               var txtsubcategory = $("#txtsubcategory").val();
               var maincatposition = $("#maincatposition").val();

               if (txtsubcategory.trim() == "" || txtsubcategory == null) {
                   swal("Required field available, please check the form");
                   return;

               } else {


                   $.ajax({
                       type: 'POST',
                       url: 'ArticalCategory.aspx/SaveSub',
                       dataType: 'json',

                       data: '{"SubCategory1":"' + $("#txtsubcategory").val() + '","MenuOrder":"' + maincatposition + '","OtherLanguageText":"' + $("#txtsubcategory").val() + '", "subcatmenuorder":"' + $("#txtmenuordersub").val() + '", "ArticleCat_ID":"' + $("#subcatId").val() + '"}',




                       contentType: 'application/json; charset=utf-8',
                       success: function (response) {


                           var myData = JSON.parse(response.d)
                           if (myData == "0") {
                               swal("Error", "Menu Order Is Already Inserted", "error");


                           }
                           else {
                               loadgrid1($("#subcatId").val());
                               swal("Success", "SubCategory Has Been Inserted Successfully!", "success");
                               $('#subcatform')[0].reset();
                           }
                       },
                       error: function (error) {
                           console.log(error);
                       }


                   });

               }


           });




          <%-- Update Function Of SubCategory Form --%>


        function updateSubFunction(id) {

            $('#myModal1').scrollTop(0);

            subcat = id;

            $("#btnSave1").removeAttr('disabled');
            $("#btnSave1").attr('disabled', 'disabled');


            $("#btnCancel1").removeAttr('disabled');
            $("#btnUpdate1").removeAttr('disabled');





            $.ajax({
                type: 'POST',
                url: 'ArticalCategory.aspx/getsubdtl',
                dataType: 'json',
                data: '{"id":"' + subcat + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {



                    var myData = JSON.parse(response.d);

                    $('#txtsubcategory').val(myData[0]["SubCategory1"]);
                    $('#txtmenuordersub').val(myData[0]["subcatmenuorder"]);
                    //$('#txtsubcategory').val(myData[0]["OtherLanguageText"]);




                    //$("#subcatId").val(myData[0]["id"]);


                },
                error: function (error) {
                    console.log(error);
                }
            });




        }



         <%-- Update Click Function Of SubCategory Form --%>


        $(function () {


            $("#btnUpdate1").click(function () {




                $("#btnSave1").attr('disabled', 'disabled');


                var txtsubcategory = $("#txtsubcategory").val();
                var ManuOrder = $("#txtmenuordersub").val();



                if (txtsubcategory.trim() == "" || txtsubcategory == null || ManuOrder == "") {
                    swal("Required field available, please check the form");
                    return;



                } else {




                    $.ajax({
                        type: 'POST',
                        url: 'ArticalCategory.aspx/Updatesub',
                        dataType: 'json',

                        data: '{"SubCategory1":"' + $("#txtsubcategory").val() + '","MenuOrder":"' + $("#txtmenuordersub").val() + '","OtherLanguageText":"' + $("#txtsubcategory").val() + '","id":"' + $("#subcatId").val() + '","artiID":"' + subcat + '"  }',


                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {

                            var myData = JSON.parse(response.d)



                            if (myData == "0") {
                                swal("Error", "The Menu Order Is Already Inserted", "error");
                                $("#btnSave1").attr('disabled', 'disabled');



                            }
                            else {




                                loadgrid1($("#subcatId").val());

                                swal("Success", "SubCategory Has Been Updated Successfully!", "success");
                                /////loadgrid1($("#subcatId").val());

                                $('#txtsubcategory').val("");

                                $('#txtmenuordersub').val("");
                                // $('#txtcreateddatesub').val("");
                            }

                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });



                }



            });

        });




         <%-- Function For The Popup Delete Yes sub Form --%>



          $(function () {


              $("#btndsubyes1").click(function () {


                  //loadgrid1($("#equipmntPlantId").val());

                  $.ajax({
                      type: 'POST',
                      url: 'ArticalCategory.aspx/popupdelete1',
                      dataType: 'json',
                      data: '{"id":"' + delsubID + '"}',
                      contentType: 'application/json; charset=utf-8',
                      success: function (response) {

                          var myData = JSON.parse(response.d)

                          $("#myModal2").modal('toggle');


                          swal("Success", "SubCategory Has Been Deleted Successfully!", "success");
                          loadgrid1($("#subcatId").val());


                      },
                      error: function (error) {
                          console.log(error);
                      }
                  });

              });



          });


         <%-- Function For The Popup Delete  sub Form --%>


         function deletepopupfunc1(id) {
             delsubID = id;

             $.ajax({
                 type: 'POST',
                 url: 'ArticalCategory.aspx/getsubdtl',
                 dataType: 'json',
                 data: '{"id":"' + delsubID + '"}',
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {

                     var myData = JSON.parse(response.d)

                     $("#myModal2").modal('show');


                     $('#subpopup').html(myData[0]["SubCategory1"]);

                     $('#menusubpopup').html(myData[0]["MenuOrder"]);

                     //$('#createdDatesubpopup').html(customerData[0]["CreatedDate"]);




                 },
                 error: function (error) {
                     console.log(error);
                 }

             });
         }







          <%-- Function For The Sub Translations   --%>

         function subtranslationFunction(id) {
             sbTrs = id;




             $("#btnCancelTsb").removeAttr('disabled');
             $("#btnSaveTsb").removeAttr('disabled');
             $("#btnUpdateTsb").attr('disabled', 'disabled');





             $.ajax({
                 type: 'POST',
                 url: 'ArticalCategory.aspx/getsubdtl',
                 dataType: 'json',
                 data: '{"id":"' + sbTrs + '"}',
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {

                     var myData = JSON.parse(response.d)

                     $("#myModalTsub").modal('show');
                     loadgridsubT(id)

                     $('#subcategorypopup2').html(myData[0]["SubCategory1"]);

                     $('#TranstIdsub').val(myData[0]["id"]);

                 },
                 error: function (error) {
                     console.log(error);
                 }

             });
         }





         <%-- Function For The SubCategory Translations Grid Data Load  --%>


         function loadgridsubT(id) {

             TrsGrid = id;

             $("#btnCancelTsb").removeAttr('disabled');
             $("#btnSaveTsb").removeAttr('disabled');
             $("#btnUpdateTsb").attr('disabled', 'disabled');


             $.ajax({
                 type: 'POST',
                 url: 'ArticalCategory.aspx/gridchangesubT',
                 data: '{"id":"' + TrsGrid + '"}',
                 dataType: 'json',
                 contentType: 'application/json; charset=utf-8',
                 success: function (response) {


                     $("#tblsubtranslist tbody").empty();



                     var myData = JSON.parse(response.d);
                     if (myData == "") {
                         return;
                     }
                     var tr = [];
                     for (var i = 0; i < myData.length; i++) {




                         tr.push('<tr>')

                         tr.push("<td> " + myData[i].OtherLanguageText + "</td>");
                         //tr.push("<td> " + myData[i].MenuOrder + "</td>");

                         //tr.push("<td> " + myData[i].CreatedDate + "</td>");
                         tr.push("<td> " + myData[i].Language + "</td>");
                         tr.push("<td><a id=\"btnEdit3\" type=\"button\"  onclick=\"updatesbTransFunction('" + myData[i]["id"] + "')\">  <i class= \"fas fa-1x fa-edit\"></i>  </a></td>");
                         tr.push("<td><a id=\"btnClose3\" type=\"button\" onclick=\"deletesbpopupfuncT('" + myData[i]["id"] + "')\"> <i class= \"fas fa-1x fa-window-close\"></i>  </a></td>");

                         tr.push('</tr>');

                     }

                     $("#tblsubtranslist tbody").empty();
                     $('#tblsubtranslist').append($(tr.join('')));

                 },
                 error: function (error) {
                     console.log(error);
                 }

             });

         }


         $(".modelcloseTrns").click(function () {
             $("#myModalTD").modal('toggle');
         });





             <%-- Save Sub Trans Function  --%> 

           $("#Transformsub").on('submit', function (e) {
               e.preventDefault();

               $("#txtsbcattranslanguage").attr('contenteditable', false);
               $("#txtTsubcategory").attr('contenteditable', false);




               $("#btnCancelTsb").removeAttr('disabled');
               $("#btnSaveTsb").removeAttr('disabled');


               var txtTsubcategory = $("#txtTsubcategory").val();
               var language = $("#txtsbcattranslanguage").val();



               if (txtTsubcategory.trim() == "" || txtTsubcategory == null || language == 0) {
                   swal(" Required fields available, Please check the form");
                   return;

               } else {

                   $.ajax({
                       type: 'POST',
                       url: 'ArticalCategory.aspx/SaveTransSubCategory',
                       dataType: 'json',



                       data: '{"LanguageId":"' + $("#txtsbcattranslanguage").val() + '", "PrimaryKeyId": "' + $("#TranstIdsub").val() + '", "OtherLanguageText":"' + $("#txtTsubcategory").val() + '"}',


                       contentType: 'application/json; charset=utf-8',
                       success: function (response) {


                           var myData = JSON.parse(response.d);

                           if (myData == "0") {
                               swal("Error", "The SubCategory has Already been translatedted", "error");



                           }


                           else {




                               //loadgridsubT();

                               swal("Success", "Translated SubCategory Has Been Inserted Successfully!", "success");
                               loadgridsubT($("#TranstIdsub").val());
                               $('#Transformsub')[0].reset();
                           }

                       },
                       error: function (error) {
                           console.log(error);
                       }


                   });


               }






           });


            <%-- Function for the Update SubCategory Translations--%>



        $(function () {
            $("#btnUpdateTsb").click(function () {

                $("#btnCancelTsb").removeAttr('disabled');
                $("#btnUpdateTsb").removeAttr('disabled');
                $("#btnSaveTsb").removeAttr('disabled');
                $("#btnSaveTsb").attr('disabled', 'disabled');


                var txtTsubcategory = $("#txtTsubcategory").val();
                var langauge = $("#txtsbcattranslanguage").val();

                // var txtmenuorder = $("#txtmenuorder").val();



                if (txtTsubcategory.trim() == "" || txtTsubcategory == null || langauge == 0) {
                    swal("Required fields available, Please check the form");
                    return;

                } else {


                    $.ajax({
                        type: 'POST',
                        url: 'ArticalCategory.aspx/UpdateTsubCategory',
                        dataType: 'json',

                        data: '{"OtherLanguageText":"' + $("#txtTsubcategory").val() + '","id":"' + sbTrs + '","changeLanguage":"' + langauge + '","PrimaryKEyID": "' + $("#primaryKeyID").val() + '"}',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {


                            var myData = JSON.parse(response.d);

                            if (myData == 0) {
                                swal("Error", "The SubCategory has Already been translatedted", "error");

                            }
                            else {
                                // loadgridsubT();
                                loadgridsubT($("#TranstIdsub").val());

                                swal("Success", "Translated SubCategory Has Been Updated Successfully!", "success");
                                //loadgridsubT();
                                $('#txtTsubcategory').val("");
                                loadLanguagesub();

                            }









                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });


                }

            });
        });


            <%-- SubCategory Translations Update (Edit) Function  --%>

        function updatesbTransFunction(id) {

            $("myModalTsub").scrollTop(0)

            sbTrs = id;


            $("#btnSaveTsb").removeAttr('disabled');
            $("#btnCancelTsb").removeAttr('disabled');
            $("#btnSaveTsb").attr('disabled', 'disabled');
            $("#btnUpdateTsb").removeAttr('disabled');




            $.ajax({
                type: 'POST',
                url: 'ArticalCategory.aspx/getsubTdtl',
                dataType: 'json',
                data: '{"id":"' + sbTrs + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {



                    var myData = JSON.parse(response.d);

                    //console.log(myData);
                    $('#txtsbcattranslanguage').append('<option hidden value=' + myData[0]["lid"] + ' selected="selected">' + myData[0]["Language"] + '</option>');
                    //$('#txtsbcattranslanguage').val(myData[0]["Language"]);
                    $('#txtTsubcategory').val(myData[0]["OtherLanguageText"]);
                    $('#primaryKeyID').val(myData[0]["pid"]);

                    //$("#txtTransDId").val(myData[0]["id"]);



                },
                error: function (error) {
                    console.log(error);
                }
            });


        }



           <%-- Delete Yes Function SubCategory Translations --%>


        $(function () {

            $("#btndTyes").click(function () {

                $.ajax({
                    type: 'POST',
                    url: 'ArticalCategory.aspx/popupdeleteTsb',
                    dataType: 'json',
                    data: '{"id":"' + delSubT + '"}',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var myData = JSON.parse(response.d)
                        //  loadgridsubT();
                        $("#myModalTD").modal('toggle');
                        loadgridsubT($("#TranstIdsub").val());

                        swal("Success", "Translated SubCategory Has Been Deleted Successfully!", "success");



                    },
                    error: function (error) {
                        console.log(error);
                    }
                });

            });


        });

        <%-- Function For The SubCategory Translations Delete Popup --%> 



        function deletesbpopupfuncT(id) {
            delSubT = id;

            $.ajax({
                type: 'POST',
                url: 'ArticalCategory.aspx/getsubTdtl',
                dataType: 'json',
                data: '{"id":"' + delSubT + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $("#myModalTD").modal('show');


                    $('#cattranspopup').html(myData[0]["OtherLanguageText"]);

                    //$('#menupopup').html(myData[0]["MenuOrder"]);

                    //$('#createdDatepopup').html(myData[0]["CreatedDate"]);




                },
                error: function (error) {
                    console.log(error);
                }

            });
        }








        $("#btnCancelTsb").click(function () {

            $("#btnSaveTsb").attr('disabled', false);
            $("#btnUpdateTsb").attr('disabled', true);
            loadLanguagesub();


        });




        $("#btnCancel1").click(function () {

            $("#btnSave1").removeAttr('disabled');
            $("#btnUpdate1").removeAttr('disabled');
            $("#btnUpdate1").attr('disabled', 'disabled');

        });




        $(function () {
            $('#tblcatogerylist').DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false,
            });
        });
        $(function () {
            $('#tbltranslist').DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false,
            });
        });
        $(function () {
            $('#tblsubtranslist').DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false,
            });
        });


        $(function () {
            $('#tblsubcatlist').DataTable({
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
