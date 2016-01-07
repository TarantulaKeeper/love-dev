<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Matches.aspx.cs" Inherits="LoveDev.Matches" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hfUserLoggedIn" runat="server" />
    <asp:HiddenField ID="hfFirstName" runat="server" />
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
            <input type="button" id="btnMessage" value="Send Them a Message!" runat="server" data-CommandArgument='<%# Eval("UserID") %>' onclick="show(this)" />
        </ItemTemplate>
    </asp:DataList>  
    <div id="divBody" style="display:none">  
            <div id="divPopupWindow">
                <span id="close" onclick="div_hide()"></span>
                <input id="txtboxToUser" name="txtboxToUser" readonly="true" type="text" />
                <input id="txtboxFromUser" name="txtboxFromUser" readonly="true" type="text"/>
                <textarea id="msg" name="message" placeholder="Message"></textarea>
                <button id="submit" type="button" onclick="check_empty()">Send</button>
            </div>
    </div>
    <script>
        var globalDOMElement; 
        function show(DOMElement) {
            var messageBox = $('#divBody');
            messageBox.css('display', 'block');
            messageBox.dialog();
            globalDOMElement = $('#' + DOMElement.id).data("UserID");
            var tofirstName = $("#" + DOMElement.id).parent().find("span[id*='FirstName']").html();
            $('#txtboxToUser').val(tofirstName);
            var fromFirstName = $('#hfFirstName').val();
            $('#txtboxFromUser').val(fromFirstName);
        };

        function check_empty() {
            if ($('#msg').text == "") {
                alert("Message cannot be empty. Please fill in the message area.");
            }

            else {
                $.ajax('SendMessage.ashx', {
                    data: {
                        fromUserID: $('#hfUserLoggedIn').val(), toUserID: globalDOMElement, 
                        messageToSend: $('#msg').val()
                    },

                    success: function (response) {
                        alert("Message sent");
                    },
                    error: function (error) {
                        var error = error;
                    }

                });
            }
        };


    </script>
</asp:Content>
