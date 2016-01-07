<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="LoveDev.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content">
        <div>
            <asp:Image ID="imgProfilePhoto" runat="server" />
            <asp:ImageButton ImageUrl="/Images/EditIcon.png" ID="imgbtnEditProfilePhoto" runat="server" OnClick="imgbtnEditProfilePhoto_Click" />

            <asp:Panel ID="pnlProfilePhotoEdit" Visible="false" runat="server">
                <asp:FileUpload id="fuProfilePhoto" runat="server" />
                <asp:Button Text="Save" ID="btnSaveProfilePhoto" runat="server" OnClick="btnSaveProfilePhoto_Click" />
            </asp:Panel>
            <div>
                <asp:Panel ID="pnlBasicInformation" runat="server">
                    Name:
                    <asp:Label ID="lblFirstName" runat="server" />
                    <asp:Label ID="lblLastName" runat="server" />
                    <br />
                    <asp:Label ID="lblAge" runat="server" />
                    <br />
                    <asp:Label ID="lblCity" runat="server" />
                    <br />
                    <asp:Label ID="lblCountry" runat="server" />
                    <br />
                    <asp:Label ID="lblGender" runat="server" />
                    <br />
                    <asp:Label ID="lblSexualOrientation" runat="server" />
                    <br />
                    <textarea id="txtareaUserBio" disabled="disabled" runat="server"></textarea>
                    <asp:ImageButton ImageUrl="/Images/EditIcon.png" ID="imgbtnEditBasicInfo" runat="server" OnClick="imgbtnEditBasicInfo_Click" />
                </asp:Panel>
                <asp:Panel ID="pnlBasicInformationEdit" Visible="false" runat="server">  
                   First Name: <asp:TextBox ID="tbFirstName" runat="server" /> 
                    <br />
                   Last Name: <asp:TextBox ID="tbLastName" runat="server" />   
                    <br />
                   Age: <asp:TextBox ID="tbAge" runat="server" />  
                    <br />
                   City: <asp:TextBox ID="tbCity" runat="server" />
                    <br />
                   Country <asp:TextBox ID="tbCountry" runat="server" />  
                    <br />
                    Bio <textarea id="txtareaEditBio" runat="server"></textarea>
                    <asp:Button Text="Save" ID="btnSaveBasicInformation" runat="server" OnClick="btnSaveBasicInformation_Click" />
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
