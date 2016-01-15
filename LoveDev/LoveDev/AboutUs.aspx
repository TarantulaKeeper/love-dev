<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="LoveDev.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content container row">
        <div id="myCarousel" class="carousel slide padtop" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="panel panel-info">
                        <div class="panel-body">
                            <div class="col-lg-3 col-md-4 col-sm-5 col-xs-6">
                                <div class="well">
                                    <asp:Image ID="imgTJ" ImageUrl="~/PHOTOS_OF_US/TJ.jpg" runat="server" Height="250px" />

                                </div>
                            </div>
                            <div class="col-lg-9 col-md-8 col-sm-7 col-xs-6">
                                <div class="well">
                                    <asp:Label ID="lblTJ" Text="T.J. Petrowski" runat="server" />
                                    <textarea id="txtTJ" runat="server"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="panel panel-info">
                        <div class="panel-body">
                            <div class="col-lg-4 col-md-4 col-sm-5 col-xs-6">
                                <div class="well">
                                    <asp:Image ID="imgNiko" ImageUrl="/PHOTOS_OF_US/DAD.jpg" runat="server" Height="250px" />

                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-7 col-xs-6">
                                <div class="well">
                                    <asp:Label ID="lblNiko" Text="Niko Pastulovic" runat="server" />
                                    <textarea id="txtNiko" runat="server"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="panel panel-success">
                        <div class="panel-body">
                            <div class="col-lg-4 col-md-4 col-sm-5 col-xs-6">
                                <div class="well">
                                    <asp:Image ID="imgChris" ImageUrl="/PHOTOS_OF_US/barney.jpg" runat="server" Height="250px" />

                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-7 col-xs-6">
                                <div class="well">
                                    <asp:Label ID="lblChris" Text="Chris Jeffrey" runat="server" Height="250px" />
                                    <textarea id="txtChris" runat="server"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="panel panel-warning">
                        <div class="panel-body">
                            <div class="col-lg-4 col-md-4 col-sm-5 col-xs-6">
                                <div class="well">
                                    <asp:Image ID="imgJoseph" ImageUrl="imageurl" runat="server" />

                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-7 col-xs-6">
                                <div class="well">
                                    <asp:Label ID="lblJoseph" Text="Joseph Magalang" runat="server" />
                                    <textarea id="txtJoseph" runat="server"></textarea>
                                </div>
                            </div>


                        </div>
                    </div>
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



    <div>
    </div>
    <div>
    </div>
    <div>
    </div>
    <div>
    </div>
</asp:Content>
