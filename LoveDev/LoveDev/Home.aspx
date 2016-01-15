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

                <div class="panel-body">
                    <div class="minheighthome">
                        Content
                    </div>
                </div>
            </div>
        </div>
    </div>




    </div>
</asp:Content>
