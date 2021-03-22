<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="NewsWebsiteAdmin.DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">





    <div class="content-wrapper contentCustomer">

        <br />

        <section id="searchsec">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">

                            <br />

                            <div class="form-validation">



                                <div class="row" runat="server" id="admin" >
                                    <div class="col-lg-3 col-6">
                                        <div class="small-box bg-info">
                                            <div class="inner">
                                                <h3>New Article</h3>

                                                <p>Add New Articles</p>
                                            </div>
                                            <div class="icon">
                                                <i class="ion ion-bag"></i>
                                            </div>
                                            <a href="Article.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-6">
                                        <div class="small-box bg-success">
                                            <div class="inner">
                                                <h3>Comments</h3>

                                                <p>Manage User Comments</p>
                                            </div>
                                            <div class="icon">
                                                <i class="ion ion-stats-bars"></i>
                                            </div>
                                            <a href="Comments.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-6">
                                        <div class="small-box bg-secondary">
                                            <div class="inner">
                                                <h3>Breaking News</h3>

                                                <p>Manage Breaking News </p>
                                            </div>
                                            <div class="icon">
                                                <i class="ion ion-person-add"></i>
                                            </div>
                                            <a href="BreakingNews.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-6">
                                        <div class="small-box bg-danger">
                                            <div class="inner">
                                                <h3>User Managment</h3>

                                                <p>Manage User Level</p>
                                            </div>
                                            <div class="icon">
                                                <i class="ion ion-pie-graph"></i>
                                            </div>
                                            <a href="UserManagment.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                </div>






                         <div class="row" runat="server" id="author">
                                    <div class="col-lg-6 col-6">
                                        <div class="small-box bg-info">
                                            <div class="inner">
                                                <h3>New Article</h3>

                                                <p>Add New Articles</p>
                                            </div>
                                            <div class="icon">
                                                <i class="ion ion-bag"></i>
                                            </div>
                                            <a href="Article.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-6">
                                        <div class="small-box bg-success">
                                            <div class="inner">
                                                <h3>Author</h3>

                                                <p>Authors Details</p>
                                            </div>
                                            <div class="icon">
                                                <i class="ion ion-stats-bars"></i>
                                            </div>
                                            <a href="AuthorForm.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                </div>




                  <div class="row" runat="server" id="edditer">
                                    <div class="col-lg-4 col-6">
                                        <div class="small-box bg-info">
                                            <div class="inner">
                                                <h3>New Article</h3>

                                                <p>Add New Articles</p>
                                            </div>
                                            <div class="icon">
                                                <i class="ion ion-bag"></i>
                                            </div>
                                            <a href="Article.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-6">
                                        <div class="small-box bg-success">
                                            <div class="inner">
                                                <h3>Comments</h3>

                                                <p>Manage User Comments</p>
                                            </div>
                                            <div class="icon">
                                                <i class="ion ion-stats-bars"></i>
                                            </div>
                                            <a href="Comments.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>


                                    <div class="col-lg-4 col-6">
                                        <div class="small-box bg-danger">
                                            <div class="inner">
                                               <h3>Breaking News</h3>

                                                <p>Manage Breaking News </p>
                                            </div>
                                            <div class="icon">
                                                <i class="ion ion-pie-graph"></i>
                                            </div>
                                            <a href="BreakingNews.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                </div>







































                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>









    </div>


    
    <script>
        $(document).ready(function () {

 
            //$("#admin").hide();
            //$("#author").show();
            

        })

        </script>



</asp:Content>
