﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Matchmaker.aspx.cs" Inherits="LoveDev.Matchmaker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divPage" runat="server" class="webpage_content container">
    </div>
    <script>
        $(document).ready(function () {
            $("button").click(function () {
                $(this).closest('div').hide();
                $(this).closest('div').next().show();
            });
            $('h4').click(function () {
                $(this).find('div').slideToggle();
            });
                //$('div').dblclick(function () {
                //    $(this).slideToggle();
                //})
        })
    </script>
</asp:Content>
