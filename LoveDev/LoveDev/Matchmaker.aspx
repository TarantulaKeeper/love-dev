<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Matchmaker.aspx.cs" Inherits="LoveDev.Matchmaker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="datalistdiv" runat="server">
        <asp:DataList ID="dlQuiz" runat="server" RepeatDirection="Vertical" DataKeyField="QuestionCategoryID" >
            <HeaderTemplate>
                <h4><%# Eval("QuestionCategoryName") %></h4>
            </HeaderTemplate>
            <ItemTemplate>

            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
