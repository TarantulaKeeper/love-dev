<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="LoveDev.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content container padpushdown">
        <div class="row">
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
                            <div class="col-lg-4 col-md-4 col-sm-5 col-xs-6">
                                <div class="well">
                                    <asp:Image ID="imgTJ" ImageUrl="~/PHOTOS_OF_US/TJ.jpg" runat="server" Height="250px" />

                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-7 col-xs-6">
                                <div class="well">
                                    <h4>T.J. Petrowski</h4>
                                    <h3>The Real Spider Man! (P.S. That's an endangered species of Theraphosid on my face)</h3>
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
                                    <h4>Niko Pastulovic</h4>
                                    <h3>THAT YUNG BOI WIT DA FLOW</h3>
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
                                    <h4>Chris Jeffrey</h4>
                                    <h3>CSS is Awesome!</h3>
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
                                    <asp:Image ID="imgJoseph" ImageUrl="PHOTOS_OF_US/josephphoto.jpg" runat="server" />

                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-7 col-xs-6">
                                <div class="well">
                                    <h4>Joseph Magalang</h4>
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
    </div>

</asp:Content>
