<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Matches.aspx.cs" Inherits="LoveDev.Matches" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hfUserLoggedIn" runat="server" />
    <asp:DataList ID="dlMatches" runat="server" RepeatColumns="1" DataKeyField="UserID">
        <ItemTemplate>
            <div>
                <asp:Image ID="imgUserPhoto" ImageUrl='<%# Eval("UserPhoto") %>' runat="server" /> 
            </div>
            <div>
                <%# Eval("FirstName") %>
            </div>
            <div>
                <%# Eval("GenderName") %>
            </div>
            </div>
            <asp:Button ID="btnMessage" Text="Send Them a Message!" runat="server" CommandArgument="UserID" OnClientClick="show(this)" />
        </ItemTemplate>
    </asp:DataList>
    
    <div id="divBody" style="visibility:hidden">
        <div id="divToHoldPopupWindow" style="overflow:hidden">
            <div id="divPopupWindow">
                <span id="close" onclick="div_hide()"></span>
                <input id="txtboxToUser" name="txtboxToUser" readonly="true" type="text" />
                <input id="txtboxFromUser" name="txtboxFromUser" readonly="true" type="text"/>
                <textarea id="msg" name="message" placeholder="Message"></textarea>
                <button id="submit" type="button" onclick="check_empty()">Send</button>
            </div>
        </div>
    </div>
    <script>
        function show(DOMElement) {
            var messageBox = $('#divBody');
            messageBox.dia
            $('#txtboxToUser').val(text);
            var userLoggedIn = $('#hfUserID').val();
            $('#txtboxFromUser').val(userLoggedIn);
        }
    </script>
</asp:Content>
