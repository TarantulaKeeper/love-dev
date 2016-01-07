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
                <%# Eval("Gender") %>
            </div>
            <div>
                <%# Eval("Bio") %>
            </div>
            <asp:Button ID="btnMessage" Text="Send Them a Message!" runat="server" CommandArgument="UserID" OnClientClick="show(this)" />
        </ItemTemplate>
    </asp:DataList>
    <div id="divDialog" style="overflow:hidden">
        <div id="divToHoldPopupWindow">
            <div id="divPopupWindow">
                <span id="close" onclick="div_hide()"></span>
                <input id="txtboxToUser" name="txtboxToUser" readonly="true" type="text" />
                <input id="txtboxFromUser" name="txtboxFromUser" readonly="true" type="text"/>
                <textarea id="msg" name="message" placeholder="Message"></textarea>
                <button id="submit" type="button" onclick="check_empty()">Send</button>
            </div>
        </div>
    </div>
    <script src="Scripts/jquery-2.1.4.js"></script>
    <script src="Scripts/jquery-ui-1.11.4.js"></script>
    <script>
        function show(DOMElement) {
            $('#divDialog');

        }
    </script>
</asp:Content>
