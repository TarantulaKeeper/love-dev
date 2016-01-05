<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LoveDev.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content">
        <div>
            <span>
                <asp:Button ID="btnMailMessage" runat="server" CssClass="glyphicon glyphicon-envelope" OnClick="btnMailMessage_Click" /></span>
        </div>
    </div>
</asp:Content>
