<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Administration.aspx.cs" Inherits="LoveDev.Administration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content container">
        <div id="myCarousel" class="carousel slide padtop minheightgrid" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h6>Invalid Logins:</h6>
                        </div>
                        <div class="panel-body">
                            <asp:GridView ID="gvReportForInvalidLogins" OnPageIndexChanging="gvReportForInvalidLogins_PageIndexChanging" runat="server"
                                AllowPaging="true" PageSize="6" CssClass="table ">
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4>Users and how much they've been matched:</h4>
                        </div>
                        <div class="panel-body">
                            <div class="minheightgrid">
                                <asp:GridView ID="gvReportForUserMatchesCount" OnPageIndexChanging="gvReportForInvalidLogins_PageIndexChanging" runat="server"
                                AllowPaging="true" PageSize="6" CssClass="table">
                            </asp:GridView>
                            </div>  
                        </div>
                    </div>
                </div>

                <div class="item">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4>Non active users:</h4>
                        </div>
                        <div class="panel-body">
                            <asp:GridView ID="gvReportForNonActiveUsers" OnPageIndexChanging="gvReportForInvalidLogins_PageIndexChanging" runat="server"
                                AllowPaging="true" PageSize="6" CssClass="table minheightgrid">
                            </asp:GridView>
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
</asp:Content>
