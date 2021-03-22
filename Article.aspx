<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Article.aspx.cs" Inherits="NewsWebsiteAdmin.Article" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <header>
        <style>
            .contentCustomer {
                padding: 10px;
                padding-top: 20px;
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

            <div class="row">
                <div class="col-md-12">

                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Create Article</h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="col-full">
                                <div class="form-group">
                                    <label>Select Language</label>
                                    <select required class="form-control custom-select" id="languagearticle">
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="card card-primary">

                <div class="card-header">
                    <h3 class="card-title">Select a Template</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputName">Template 1 (1 Image)</label>
                            </div>
                            <a onclick="loadtemplate(1);">
                                <img src="SiteContent/images/aa.jpg" alt="Template1" style="width: 300px; height: 300px;">
                            </a>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputName">Template 2 (1-4 Images)</label>
                            </div>
                            <a onclick="loadtemplate(2);">
                                <img src="SiteContent/images/bb.jpg" alt="Template2" style="width: 300px; height: 300px;">
                            </a>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputName">Template 3 (Video)</label>
                            </div>
                            <a onclick="loadtemplate(3);">
                                <img src="SiteContent/images/cc.jpg" alt="Template3" style="width: 300px; height: 300px;">
                            </a>
                        </div>
                    </div>
                </div>

            </div>
        </form>
    </div>


    <script>

        $(function () {

            loadlanguage();

        })


        function loadtemplate(templateid) {

            var language = $("#languagearticle").val();

            if (language == null || language == 0 || language == "") {
                swal('Warning!','Please Select a Language!','error');
            } else {
                location.href = 'Create_Article.aspx?&ln=' + language + '&tmp=' + templateid + '';
            }

        }

        function loadlanguage() {

            $.ajax({
                type: 'POST',
                url: 'HomeArticleCategories.aspx/LoadLanguage',
                dataType: 'json',

                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d);

                    $("#languagearticle").html('');

                    $("#languagearticle").append('<option value="0" selected="true" disabled="true"><-- Select --></option>');
                    $.each(myData, function () {
                        $("#languagearticle").append('<option value=' + this.id + '>' + this.Language + '</option>');
                    });

                },
                error: function (error) {
                    console.log(error);
                }

            });

        }

    </script>


</asp:Content>
