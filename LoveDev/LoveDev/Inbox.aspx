<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Inbox.aspx.cs" Inherits="LoveDev.Inbox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content">
        <div class="row">
            <div class="col-lg-3 col-md-3" style=" border:1px; border-color:white;">
                <asp:ListBox ID="lstboxUsers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lstboxUsers_SelectedIndexChanged"></asp:ListBox>
            </div>
            <div class="col-lg-9 col-md-9" style=" border:1px; border-color:white;">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="updpnlMessages" runat="server" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="lstboxUsers" />
                    </Triggers>
                    <ContentTemplate>
                        <div id="divContainer" runat="server">
                            <%--<div></div>
                            <div></div>
                            <div></div>--%>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            </div>
        </div>
    </div>
</asp:Content>
