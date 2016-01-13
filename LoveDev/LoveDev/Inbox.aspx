<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Inbox.aspx.cs" Inherits="LoveDev.Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content">
        <div class="container well">
            <div class="row">
                <div class="col-lg-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Chat</h3>
                        </div>
                        <div class="list-group">
                            <asp:ListBox ID="lstboxUsers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lstboxUsers_SelectedIndexChanged" CssClass="list-group-item h6" style="width:100%; height:520px;"></asp:ListBox>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Messages</h3>
                                </div>
                                <div class="panel-body msgboxheight">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel ID="updpnlMessages" runat="server" UpdateMode="Conditional">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="lstboxUsers" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <div id="divContainer" runat="server" class="h6 pull-left ">
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Reply</h3>
                                </div>
                                <div class="panel-body minheight">
                                    <textarea id="txtboxReply" runat="server" placeholder="Write a Reply" class="input-width minheight"></textarea>
                                    <asp:Button ID="btnSend" runat="server" OnClick="btnSend_Click" CssClass="btn btn-primary btn pull-right" Text="Send" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
