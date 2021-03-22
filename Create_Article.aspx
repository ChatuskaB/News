<%@ Page Title="Create Article" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create_Article.aspx.cs" Inherits="NewsWebsiteAdmin.Create_Article" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .contentCustomer {
            padding: 10px;
        }
    </style>

    <div class="content-wrapper contentCustomer">
        <form id="createarticleform" novalidate method="post" runat="server">

            <!-- Main content -->
            <%-- Start of Article Category Form --%>
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
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputStatus">Select The Category</label>
                                        <select onchange="loadSubCategories();" required class="form-control custom-select" id="selectcategory">
                                            <option disabled selected value="0"> <-- Select --> </option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputStatus">Select The SubCategory</label>
                                        <select required class="form-control custom-select" id="selectsubcategory">
                                            <option disabled selected value="0"> <-- Select --> </option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                             <br />
                              
                            <div id="image12div" class="row">

                                <div class="col_full col-md-6">
                                    <label for="inputtitle">Upload Image</label><br />
                                    <asp:FileUpload ID="fupload" runat="server" onchange='previewImage()' />
                                    <br />
                                    <img id="imgprv" width="200" height="200" style="border-radius: 100px;" />
                                </div>

                                <div id="image2div" class="col_full col-md-6">
                                    <label for="inputtitle">Upload Image 2</label><br />
                                    <asp:FileUpload ID="fupload2" runat="server" onchange='previewImage2()' />
                                    <br />
                                    <img id="imgprv2" width="200" height="200" style="border-radius: 100px;" />
                                </div>

                            </div>

                            <div id="image23div" class="row">
                                <div class="col_full col-md-6">
                                    <label  for="inputtitle">Upload Image 3</label><br />
                                    <asp:FileUpload ID="fupload3" runat="server" onchange='previewImage3()' />
                                    <br />
                                    <img id="imgprv3" width="200" height="200" style="border-radius: 100px;" />
                                </div>
                                <div class="col_full col-md-6">
                                    <label for="inputtitle">Upload Image 4</label><br />
                                    <asp:FileUpload ID="fupload4" runat="server" onchange='previewImage4()' />
                                    <br />
                                    <img id="imgprv4" width="200" height="200" style="border-radius: 100px;" />
                                </div>
                            </div>

                            <div id="videodiv" class="row">
                                <div class="col_full col-md-6">
                                    <label for="inputtitle">Upload Video Thumbnail</label><br />
                                    <asp:FileUpload ID="fthumbnailupload" runat="server" onchange='previewImage5()' />
                                    <br />
                                    <img id="vidthumbnailpriew" alt="Profile Picture4" width="200" height="200" style="border-radius: 100px;" />
                                </div>
                                <div class="form-group col_full col-md-6">
                                    <label>Video URL</label>
                                    <span>* </span>
                                    <input id="txtvideourl" class="form-control col_full col-md-6" placeholder="Video URL" required />
                                </div>
                            </div>

                            <div class="form-group col-6">
                                <label for="inputtitle1">Title</label>
                                <span>* </span>
                                <input type="text" id="txtTitle" class="form-control" placeholder="Title" required />
                            </div>

                            <div class="form-group">
                                <label for="inputcontent1">Content</label>
                                <span>* </span>
                                <textarea id="txtContent" class="form-control" rows="10" placeholder="Content" required></textarea>
                            </div>

                            <div class="form-group">
                                <label for="inputsummery1">Artical Summery</label>
                                <span>* </span>
                                <textarea id="txtsummery" class="form-control" rows="3" placeholder="Artical Summery" required></textarea>
                            </div>

                             <div class="form-group">
                                <label for="inputsummery1">Location</label>
                                <span>* </span>
                                <input id="txttlocation" class="form-control" required />
                            </div>

                            <div class="form-group">
                                <label for="inputsummery1">Artical Title</label>
                                <span>* </span>
<br />
<label style="colur:red;"> eg: Covid19_in_Sri_Lanka </label>
                                <textarea id="txtultitle" class="form-control" rows="1" placeholder="Artical URL Title" required></textarea>
                            </div>

                        </div>

                        <div class="card-footer">
                            <button id="btnSave" type="submit" class="btn btn-success">Save</button>
                            <button id="btnCancel" type="reset" class="btn btn-default float-right">Cancel</button>
                        </div>

                    </div>
                </div>
            </div>

        </form>

    </div>


    <script>

        window.onload = function () {
            onpageload();
            addTextEditor();
            loadCategories();
        }
        
        var getUrlParameter = function getUrlParameter(sParam) {
            var sPageURL = window.location.search.substring(1),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                }
            }
        };


        function previewImage() {
            var fileUpload = document.getElementById("<%= fupload.ClientID %>");
            var filesize_1 = (fileUpload.files[0].size);

            if (filesize_1 > 4000000) {
                swal('error!!', 'Image Size Should be below 3MB! Please Insert a new Image.', 'error');
                $("#imgprv").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
                return;
            }

             var img = document.getElementById("imgprv");
             if (fileUpload.files && fileUpload.files[0]) {
                 var reader = new FileReader();
                 reader.onload = function (e) {
                     img.src = e.target.result;
                 }
                 reader.readAsDataURL(fileUpload.files[0]);
             }
        }

        function previewImage2() {
            var fileUpload = document.getElementById("<%= fupload2.ClientID %>");
            var filesize_2 = (fileUpload.files[0].size);

            if (filesize_2 > 4000000) {
                swal('error!!', 'Image Size Should be below 3MB! Please Insert a new Image.', 'error');
                $("#imgprv2").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
                return;
            }
            var img = document.getElementById("imgprv2");
            if (fileUpload.files && fileUpload.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    img.src = e.target.result;
                }
                reader.readAsDataURL(fileUpload.files[0]);
            }
        }


        function previewImage3() {
            var fileUpload = document.getElementById("<%= fupload3.ClientID %>");
            var filesize_3 = (fileUpload.files[0].size);

            if (filesize_3 > 4000000) {
                swal('error!!', 'Image Size Should be below 3MB! Please Insert a new Image.', 'error');
                $("#imgprv3").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
                return;
            }
            var img = document.getElementById("imgprv3");
            if (fileUpload.files && fileUpload.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    img.src = e.target.result;
                }
                reader.readAsDataURL(fileUpload.files[0]);
            }
        }


        function previewImage4() {
            var fileUpload = document.getElementById("<%= fupload4.ClientID %>");
            var filesize_4 = (fileUpload.files[0].size);

            if (filesize_4 > 4000000) {
                swal('error!!', 'Image Size Should be below 3MB! Please Insert a new Image.', 'error');
                $("#imgprv4").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
                return;
            }
             var img = document.getElementById("imgprv4");
             if (fileUpload.files && fileUpload.files[0]) {
                 var reader = new FileReader();
                 reader.onload = function (e) {
                     img.src = e.target.result;
                 }
                 reader.readAsDataURL(fileUpload.files[0]);
             }
        }


        function previewImage5() {
            var fileUpload = document.getElementById("<%= fthumbnailupload.ClientID %>");
            var filesize_5 = (fileUpload.files[0].size);

            if (filesize_5 > 4000000) {
                swal('error!!', 'Image Size Should be below 3MB! Please Insert a new Image.', 'error');
                $("#imgprv5").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
                return;
            }
            var img = document.getElementById("vidthumbnailpriew");
            if (fileUpload.files && fileUpload.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    img.src = e.target.result;
                }
                reader.readAsDataURL(fileUpload.files[0]);
            }
        }


        function addTextEditor() {
            tinymce.init({
                selector: '#txtContent'
            }); 
        }


        function onpageload() {

            var language = getUrlParameter('ln');
            var template = getUrlParameter('tmp');
           
            if (template == 1) {
                $("#image2div").attr('style', 'display:none');
                $("#videodiv").attr('style', 'display:none');
                $("#image23div").attr('style', 'display:none');
                $("#imgprv").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
            } else if (template == 2){
                $("#videodiv").attr('style', 'display:none');
                $("#imgprv").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
                $("#imgprv2").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
                $("#imgprv3").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
                $("#imgprv4").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
            } else if (template == 3){
                $("#image12div").attr('style', 'display:none');
                $("#image23div").attr('style', 'display:none');
                $("#vidthumbnailpriew").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
            }else{
                swal('error!!' , 'Error in Template!' , 'error');
            }

        }


        $("#createarticleform").on('submit', function(event){

            event.preventDefault();

            $("#btnSave").attr('disabled' , true);

            window.swal({
                title: "Processing.!!",
                text: "Please wait",
                allowOutsideClick: false,
                button: false
            });

            var template = getUrlParameter('tmp');
            var language = getUrlParameter('ln');

            var title = $("#txtTitle").val();
            var txtsummery = $("#txtsummery").val();
            var txtultitle = $("#txtultitle").val();
            var location = $("#txttlocation").val();

            var selectcategory = $("#selectcategory").val();
            var selectsubcategory = $("#selectsubcategory").val();

            var Image_path = $("#imgprv").attr("src");
            var Image_path_2 = $("#imgprv2").attr("src");
            var Image_path_3 = $("#imgprv3").attr("src");
            var Image_path_4 = $("#imgprv4").attr("src");

            if (template == 3) {
                createVideoArticle();
                return;
            } 

            if (title == "") {
                swal('Warning!!', 'Please Fill all the fields or add at lease one image!', 'error');
                return;
            } else if (txtsummery == "") {
                swal('Warning!!', 'Please Fill all the fields or add at lease one image!', 'error');
                return;
            } else if (txtultitle == "") {
                swal('Warning!!', 'Please Fill all the fields or add at lease one image!', 'error');
                return;
            } else if (selectcategory == null) {
                swal('Warning!!', 'Please Fill all the fields or add at lease one image!', 'error');
                return;
            } else if (selectsubcategory == null) {
                swal('Warning!!', 'Please Fill all the fields or add at lease one image!', 'error');
                return;
            } else if (Image_path.length  < 500){
                swal('Warning!!', 'Please Fill all the fields or add at lease one image!', 'error');
                return;
            }

            if (template == 1) {

                var title = $("#txtTitle").val();
                var txtsummery = $("#txtsummery").val();
                var txtultitle = $("#txtultitle").val();

                var selectcategory = $("#selectcategory").val();
                var selectsubcategory = $("#selectsubcategory").val();

                var template_id = 'storytemp1.aspx';

                var Image_path = $("#imgprv").attr("src");

                var Image_path_2 = null;
                var Image_path_3 = null;
                var Image_path_4 = null;
               
            } else if (template == 2) {

                var title = $("#txtTitle").val();
                var txtsummery = $("#txtsummery").val();
                var txtultitle = $("#txtultitle").val();

                var selectcategory = $("#selectcategory").val();
                var selectsubcategory = $("#selectsubcategory").val();

                var template_id = 'Storytemp3.aspx';

                var Image_path = $("#imgprv").attr("src");

                if (Image_path_2.length < 500) {
                    var Image_path_2 = null;
                } 
                if (Image_path_3.length < 500) {
                    var Image_path_3 = null;
                } 
                if (Image_path_4.length < 500) {
                    var Image_path_4 = null;
                } 

            } else {
                swal('error!!', 'Error in Template!', 'error');
            }

            console.log(title);
            console.log(location);
            console.log("language : " + language);
            console.log(Nowdatetime);
            console.log("template_id : " + template_id);
            console.log(txtsummery);
            console.log(txtultitle);
            console.log("selectcategory : " + selectcategory);
            console.log("selectsubcategory : " + selectsubcategory);
            console.log(Image_path);
            console.log(Image_path_2);
            console.log(Image_path_3);
            console.log(Image_path_4);

            tinymce.activeEditor.on('GetContent', function (e) {

                var txtcontent = e.content;
               
                
                $.ajax({
                    type: 'POST',
                    url: 'Create_Article.aspx/SaveArticle',
                    dataType: 'json',
                    data: JSON.stringify({ Title: title, Location: location, languageid: language, CreatedDate: Nowdatetime, Template_ID: template_id, Article_Summery: txtsummery, Content: txtcontent, Article_Url_Title: txtultitle, Category1: selectcategory, SubCategory1: selectsubcategory, Image_path: Image_path, Image_path_2: Image_path_2, Image_path_3: Image_path_3, Image_path_4: Image_path_4 }),
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var data = JSON.parse(response.d);
                        console.log(data);
                        if (data.status = true) {
                            swal('Success!!', 'Successfully Saved, waiting for review!', 'success');
                            $('#createarticleform').trigger("reset");
                            $("#imgprv").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
                            $("#imgprv2").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
                            $("#imgprv3").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
                            $("#imgprv4").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');

                            setTimeout(function () { window.location.href = 'Create_Article.aspx?&ln=' + language + '&tmp=' + template + ''; }, 3000);
                           
                        } else {
                            swal('Error!!', 'Error Saving Article Please Contact Support!', 'error');
                        }

                    },
                    error: function (error) {
                        console.log(error.responseJSON.Message);
                        swal('Error!!', 'Error Saving Article Please Contact Support!', 'error');
                    }
                })

            });
            

        })


        function createVideoArticle() {

            var template = getUrlParameter('tmp');
            var language = getUrlParameter('ln');

            var location = $("#txttlocation").val();

            var title = $("#txtTitle").val();
            var txtsummery = $("#txtsummery").val();
            var txtultitle = $("#txtultitle").val();

            var selectcategory = $("#selectcategory").val();
            var selectsubcategory = $("#selectsubcategory").val();

            var template_id = 'StoryVideoTemp.aspx';

            var Image_Template_path = $("#vidthumbnailpriew").attr("src");
            var videourl = $("#txtvideourl").val();

            if (title == "") {
                swal('Warning!!', 'Please Fill all the fields or add at lease one image!', 'error');
                return;
            } else if (txtsummery == "") {
                swal('Warning!!', 'Please Fill all the fields or add at lease one image!', 'error');
                return;
            } else if (txtultitle == "") {
                swal('Warning!!', 'Please Fill all the fields or add at lease one image!', 'error');
                return;
            } else if (selectcategory == null) {
                swal('Warning!!', 'Please Fill all the fields or add at lease one image!', 'error');
                return;
            } else if (selectsubcategory == null) {
                swal('Warning!!', 'Please Fill all the fields or add at lease one image!', 'error');
                return;
            } else if (Image_Template_path.length < 500) {
                swal('Warning!!', 'Please Fill all the fields or add at lease one image!', 'error');
                return;
            } else if (videourl == "") {
                swal('Warning!!', 'Please Fill all the fields or add at lease one image!', 'error');
                return;
            }

            tinymce.activeEditor.on('GetContent', function (e) {

                var txtcontent = e.content;


                $.ajax({
                    type: 'POST',
                    url: 'Create_Article.aspx/SaveVideoArticle',
                    dataType: 'json',
                    data: JSON.stringify({ Title: title, Location: location, languageid: language, CreatedDate: Nowdatetime, Template_ID: template_id, Article_Summery: txtsummery, Content: txtcontent, Article_Url_Title: txtultitle, Category1: selectcategory, SubCategory1: selectsubcategory, Vedio_path: videourl, videothumb: Image_Template_path }),
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var data = JSON.parse(response.d);

                        if (data.status = true) {
                            swal('Success!!', 'Successfully Saved, waiting for review!', 'success');
                            $('#createarticleform').trigger("reset");
                            $("#vidthumbnailpriew").attr('src', '' + localimgpathadmin + 'SiteContent/Defualt img/download.jpg');
                        } else {
                            swal('Error!!', 'Error Saving Article Please Contact Support!', 'error');
                        }

                    },
                    error: function (error) {
                        console.log(error.responseJSON.Message);
                        swal('Error!!', 'Error Saving Article Please Contact Support!', 'error');
                    }
                })
                
            });

        }

        function loadCategories() {

            var languageid = getUrlParameter('ln');

            $.ajax({
                type: 'POST',
                url: 'HomeArticleCategories.aspx/loadCategories',
                data: '{ "id": "'+languageid+'" }',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var data = JSON.parse(response.d);
                    
                    $("#selectcategory").html('');

                    $("#selectcategory").append('<option value="0" selected="true" disabled="true"><-- Select --></option>');
                    $.each(data, function () {
                        $("#selectcategory").append('<option value=' + this.PrimaryKeyId + '>' + this.OtherLanguageText + '</option>');
                    });

                },
                error: function (error) {
                    console.log(error);
                    swal('Error!!', 'Error Loading Category Contact Support!', 'error');
                }
            })

        }


        function loadSubCategories() {

            var languageid = getUrlParameter('ln');
            var catid = $("#selectcategory").val();

            $.ajax({
                type: 'POST',
                url: 'Create_Article.aspx/LoadSubCategories',
                data: '{ "id": "' + languageid + '" , "catid": "' + catid + '" }',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var data = JSON.parse(response.d);
                    
                    $("#selectsubcategory").html('');

                    $("#selectsubcategory").append('<option value="0" selected="true" disabled="true"><-- Select --></option>');
                    $.each(data, function () {
                        $("#selectsubcategory").append('<option value=' + this.subcatid + '>' + this.OtherLanguageText + '</option>');
                    });

                },
                error: function (error) {
                    console.log(error);
                    swal('Error!!', 'Error Loading Sub Category Contact Support!', 'error');
                }
            })

        }


    </script>


</asp:Content>
