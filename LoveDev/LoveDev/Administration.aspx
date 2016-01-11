<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Administration.aspx.cs" Inherits="LoveDev.Administration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content">
        <asp:GridView ID="gvReportForInvalidLogins" OnPageIndexChanging="gvReportForInvalidLogins_PageIndexChanging" runat="server" 
            AllowPaging="true" PageSize="6">
        </asp:GridView>
        <asp:GridView ID="gvReportForUserMatchesCount" runat="server"></asp:GridView>
        <asp:GridView ID="gvReportForNonActiveUsers" runat="server">   </asp:GridView>
    </div>
</asp:Content>
