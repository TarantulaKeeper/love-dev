<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Inbox.aspx.cs" Inherits="LoveDev.Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3" style="border: 1px; border-color: white;">
                    <asp:ListBox ID="lstboxUsers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lstboxUsers_SelectedIndexChanged"></asp:ListBox>
                    <div class="col-lg-3 col-md-3 ">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Panel title</h3>
                            </div>
                            <div class="panel-body">
                                Panel content
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Panel title</h3>
                            </div>
                            <div class="col-lg-9 col-md-9" style="border: 1px; border-color: white;">
                                <div class="panel-body">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel ID="updpnlMessages" runat="server" UpdateMode="Conditional">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="lstboxUsers" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <div id="divContainer" runat="server">
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
