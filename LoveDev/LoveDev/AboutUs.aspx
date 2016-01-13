<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="LoveDev.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Image ID="imgTJ" ImageUrl="~/PHOTOS_OF_US/TJ.jpg" runat="server" />
        <asp:Label ID="lblTJ" Text="T.J. Petrowski" runat="server" />
        <textarea id="txtTJ" runat="server"></textarea>
    </div>
    <div>
        <asp:Image ID="imgNiko" ImageUrl="imageurl" runat="server" />
        <asp:Label ID="lblNiko" Text="Niko Pastulovic" runat="server" />
        <textarea id="txtNiko" runat="server"></textarea>
    </div>
    <div>
        <asp:Image ID="imgChris" ImageUrl="imageurl" runat="server" />
        <asp:Label ID="lblChris" Text="Chris Jeffrey" runat="server" />
        <textarea id="txtChris" runat="server"></textarea>
    </div>
    <div>
        <asp:Image ID="imgJoseph" ImageUrl="imageurl" runat="server" />
        <asp:Label ID="lblJoseph" Text="Joseph Magalang" runat="server" />
        <textarea id="txtJoseph" runat="server"></textarea>
    </div>
</asp:Content>
