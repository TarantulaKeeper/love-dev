<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LoveDev.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content container-fluid">
        <asp:Label ID="lblQS" runat="server" Visible="false" />
        <div class="padtop col-lg-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">LoveDev</h3>
                </div>
                <div class="panel-body">
                    <div class="minheighthome">
                        <ul class="list-group list-unstyled">
                            <li class="padtop">
                                <a href="Inbox.aspx" class="btn btn-info btn-lg input-width">Messages   <span class="glyphicon glyphicon-envelope"></span></a>
                            </li>
                            <li class="padtop">
                                <a href="Matchmaker.aspx" class="btn btn-danger btn-lg input-width">Find your match <span class="glyphicon glyphicon-search"></span></a>
                            </li>
                            <li class="padtop">
                                <a href="Matches.aspx" class="btn btn-warning btn-lg input-width">View your match <span class="glyphicon glyphicon-eye-open"></span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="padtop col-lg-9">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Welcome to LoveDev!</h3>
                </div>

                <div class="panel-body text-center">
                    <div class="minheighthome">
                        <div id="myCarousel" class="carousel" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                                <li data-target="#myCarousel" data-slide-to="3"></li>
                                <li data-target="#myCarousel" data-slide-to="5"></li>
                                <li data-target="#myCarousel" data-slide-to="6"></li>
                                <li data-target="#myCarousel" data-slide-to="7"></li>
                                <li data-target="#myCarousel" data-slide-to="8"></li>
                                <li data-target="#myCarousel" data-slide-to="9"></li>
                            </ol>
                            
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <img src="PHOTOS_OF_US/sd21-1.jpg" alt="SD21" style="height:480px;"/>
                                </div>

                                <div class="item">
                                    <img src="PHOTOS_OF_US/sd21-2.jpg" alt="SD21" style="height:480px;"/>
                                </div>

                                <div class="item">
                                    <img src="PHOTOS_OF_US/sd21-3.jpg" alt="SD21" style="height:480px;"/>
                                </div>

                                <div class="item">
                                    <img src="PHOTOS_OF_US/sd21-4.jpg" alt="SD21" style="height:480px;"/>
                                </div>
                                <div class="item">
                                    <img src="PHOTOS_OF_US/sd21-5.jpg" alt="SD21" style="height:480px;"/>
                                </div>
                                <div class="item">
                                    <img src="PHOTOS_OF_US/sd21-6.jpg" alt="SD21" style="height:480px;"/>
                                </div>
                                <div class="item">
                                    <img src="PHOTOS_OF_US/sd21-7.jpg" alt="SD21" style="height:480px;"/>
                                </div>
                                <div class="item">
                                    <img src="PHOTOS_OF_US/sd21-8.jpg" alt="SD21" style="height:480px;"/>
                                </div>
                                <div class="item">
                                    <img src="PHOTOS_OF_US/sd21-9.jpg" alt="SD21" style="height:480px;"/>
                                </div>
                            </div>

                            <!-- Left and right controls -->
                            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




    </div>
</asp:Content>
