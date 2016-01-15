<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LoveDev.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content">
        <asp:Label ID="lblQS" runat="server" />
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Panel title</h3>
                </div>
                <div class="panel-body">
                    <a href="Inbox.aspx" class="btn btn-info">Messages <span class="glyphicon glyphicon-envelope"></span></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
