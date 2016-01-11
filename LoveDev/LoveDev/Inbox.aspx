﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Inbox.aspx.cs" Inherits="LoveDev.Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 ">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Chat</h3>
                        </div>
                        <div class="panel-body">
                            <div>
                                <asp:ListBox ID="lstboxUsers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lstboxUsers_SelectedIndexChanged" CssClass="list-group-item"></asp:ListBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Messages</h3>
                        </div>
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
        <div>
            <textarea id="txtboxReply" runat="server" placeholder="Write a Reply"></textarea>
            <asp:Button ID="btnSend" Text="Send" runat="server" OnClick="btnSend_Click" />
        </div>
    </div>
</asp:Content>
