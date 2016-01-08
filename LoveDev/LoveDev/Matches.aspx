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
                id="btnMessage" value="Send Them a Message!" runat="server" data-commandargument='<%# Eval("UserID") %>' onclick="show(this)" />
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div class="col-lg-9 col-md-8 col-sm-8 col-xs-12">

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
                                    <textarea id="msg" name="message" placeholder="Message" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 modal-height " ></textarea>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger padtop" data-dismiss="modal">Close</button>
                                    <button id="submit" type="button" class="btn btn-primary padtop" onclick="check_empty()">Send <span class="glyphicon glyphicon-envelope"></span></button>

                                </div>
                            </div>
                        </div>
                    </div>


                    <%-- <div class="backdrop"></div>
                    <div id="divPopupWindow" class="popupbox">
                        <span id="close" onclick="div_hide()" class="closebox text-danger">[x]</span>
                        <input id="txtboxToUser" name="txtboxToUser" readonly="true" type="text" />
                        <input id="txtboxFromUser" name="txtboxFromUser" readonly="true" type="text" />
                        <%--<button id="submit" type="button" class="btn btn-primary" onclick="check_empty()">Send <span class="glyphicon glyphicon-envelope"></span></button>--%>
                </div>
                --%>
            </div>
        </div>
    </div>
    </div>
    <script type="text/javascript">
        var globalDOMElement;
        function show(DOMElement) {
            var messageBox = $('#divPopupWindow');
            messageBox.dialog();
            var firstName = $("#" + DOMElement.id).parent().find("span[id*='FirstName']").html();
            $('#txtboxToUser').val(firstName);
            var fromFirstName = $('#hfFirstName').val();
            $('#txtboxFromUser').val(fromFirstName);
        };


    </script>
    <script type="text/javascript">
        $(document).ready(function () {

            $('.chatbox').click(function () {
                $('.backdrop, .popupbox').animate({ 'opacity': '.50' }, 300, 'linear');
                $('.popupbox').animate({ 'opacity': '1.00' }, 300, 'linear');
                $('.backdrop, .popupbox').css('display', 'block');
            });
            $('.closebox').click(function () {
                close_box();
            });
            $('.backdrop').click(function () {
                close_box();
            });
        });
        function close_box() {
            $('.backdrop, .popupbox').animate({ 'opacity': '0' }, 300, 'linear', function () {
                $('.backdrop, .popupbox').css('display', 'none');
            });
        }

    </script>
</asp:Content>
