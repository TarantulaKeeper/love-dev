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
    
            <div id="divPopupWindow">
                <span id="close" onclick="div_hide()"></span>
                <input id="txtboxToUser" name="txtboxToUser" readonly="true" type="text" />
                <input id="txtboxFromUser" name="txtboxFromUser" readonly="true" type="text"/>
                <textarea id="msg" name="message" placeholder="Message"></textarea>
                <button id="submit" type="button" onclick="check_empty()">Send</button>
            </div>
    <script>
        function show(DOMElement) {
            var messageBox = $('#divBody');
            messageBox.css('display', 'block');
            messageBox.dialog();
            var firstName = $("#" + DOMElement.id).parent().find("span[id*='FirstName']").html();
            $('#txtboxToUser').val(firstName);
            var fromFirstName = $('#hfFirstName').val();
            $('#txtboxFromUser').val(fromFirstName);
        };




    </script>
</asp:Content>
