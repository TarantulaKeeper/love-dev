<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Administration.aspx.cs" Inherits="LoveDev.Administration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content">
        Invalid Logins:
        <br />
        <asp:GridView ID="gvReportForInvalidLogins" OnPageIndexChanging="gvReportForInvalidLogins_PageIndexChanging" runat="server" 
            AllowPaging="true" PageSize="6">
        </asp:GridView>
        <br />
        Users and how much they've been matched:
        <br />
        <asp:GridView ID="gvReportForUserMatchesCount" OnPageIndexChanging="gvReportForInvalidLogins_PageIndexChanging" runat="server"
             AllowPaging="true" PageSize="6"></asp:GridView>
        <br />
        Non active users: 
        <br />
        <asp:GridView ID="gvReportForNonActiveUsers" OnPageIndexChanging="gvReportForInvalidLogins_PageIndexChanging" runat="server"
            AllowPaging="true" PageSize="6">   </asp:GridView>
    </div>
</asp:Content>
