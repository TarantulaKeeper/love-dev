<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LoveDev.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content">
        <button class="btn btn-primary" type="button" onclick="btnMailMessage_Click">
            Messages <span class="glyphicon glyphicon-envelope"></span>
        </button>
        <div class="well btn-info">
            <asp:Button ID="btnMailMessage" runat="server" CssClass="btn btn-info" OnClick="btnMailMessage_Click" Text="Messages" />
            <span class="glyphicon glyphicon-envelope"></span>
        </div>

    </div>
</asp:Content>
