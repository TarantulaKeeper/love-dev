<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Matches.aspx.cs" Inherits="LoveDev.Matches" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content">
        <div class="container">
            <asp:HiddenField ID="hfUserLoggedIn" runat="server" />
            <asp:HiddenField ID="hfFirstName" runat="server" />
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <asp:DataList ID="dlMatches" runat="server" RepeatColumns="1" DataKeyField="UserID">
                        <ItemTemplate>
                            <div>
                                <asp:Image ID="imgUserPhoto" ImageUrl='<%# Eval("UserPhoto") %>' runat="server" />
                            </div>
                            <div>
                                <asp:Label ID="lblFirstName" Text='<%# Eval("FirstName") %>' runat="server" />
                            </div>
                            <div>
                                <%# Eval("GenderName") %>
                            </div>
                            </div>
            <input type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"
                id="btnMessage" value="Send Them a Message!" runat="server" data-id='<%# Eval("UserID") %>' onclick="show(this)" />
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div class="col-lg-9 col-md-8 col-sm-8">

                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Messaging</h4>
                                    <input id="txtboxToUser" name="txtboxToUser" readonly="true" type="text" />
                                    <input id="txtboxFromUser" name="txtboxFromUser" readonly="true" type="text" />
                                </div>
                                <div class="modal-body">
                                    <textarea id="msg" name="message" placeholder="Message" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 modal-height "></textarea>
                                </div>
                                <div class="modal-footer" style="padding-top:5px;">
                                   
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                        <button id="btnCustomClose" type="button" name="btnSubmit" data-toggle="modal" data-target="#myAlert"
                                            class="btn btn-primary padtop" onclick="check_empty()">
                                            Send <span class="glyphicon glyphicon-envelope"></span>
                                        </button>
                                   

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="myAlert" data-toggle="modal" data-target="#btnCustomClose" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myAlertLabelMsg"></h4>
                                </div>
                                <div class="modal-body">
                                    <h4>Message Sent</h4>
                                </div>
                                <div class="modal-footer text-center">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var globalDOMElement;
        function show(DOMElement) {
            globalDOMElement = $('#' + DOMElement.id).data('id');
            var toFirstName = $("#" + DOMElement.id).parent().find("span[id*='FirstName']").html();
            $('#txtboxToUser').val(toFirstName);
            var fromFirstName = $('#<%= hfFirstName.ClientID %>').val()
            $('#txtboxFromUser').val(fromFirstName);
        };

        function check_empty() {
            if ($('#msg').text == "") {
                <%--$('#<%= btnSubmit.ClientID %>')  --%>
            }

            else {
                $.ajax('SendMessage.ashx', {
                    data: {
                        toUserID: globalDOMElement, fromUserID: $('#<%= hfUserLoggedIn.ClientID %>').val(),
                        message: $('#msg').val()
                    },

                    success: function (response) {
                        $('#myModal').fadeOut(1000);
                        $('#myAlert').delay(1200).fadeOut(700);
                        $('.modal-backdrop').fadeOut(1200);
                        $('#msg').text('Message');                        
                    },
                    error: function (error) {
                        var error = error;
                    }

                });
            }
        };

    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(function () {

            });

        });
    </script>
</asp:Content>
