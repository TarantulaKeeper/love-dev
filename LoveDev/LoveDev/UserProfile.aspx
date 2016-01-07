<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="LoveDev.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content">
        <div class="container">
            <div class="padtop">
                <div class="col-lg-3 col-md-4 col-sm-5 col-xs-6">
                    <asp:Image ID="imgProfilePhoto" runat="server" Style="height: 200px;" />
                    <asp:ImageButton ImageUrl="imageurl" ID="imgbtnEditProfilePhoto" runat="server" />

                    <div>
                        <asp:Panel ID="pnlProfilePhotoEdit" runat="server">
                            <asp:FileUpload ID="fuProfilePhoto" runat="server" />
                            <asp:Button Text="Save" ID="btnSaveProfilePhoto" runat="server" />
                        </asp:Panel>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8 col-sm-7 col-xs-6">
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
                        <asp:ImageButton ImageUrl="imageurl" ID="imgbtnEditBasicInfo" runat="server" />
                    </asp:Panel>
                    <asp:Panel ID="pnlBasicInformationEdit" Visible="false" runat="server">
                        <div class="input-group">
                            <span class="input-group-addon">First Name:</span>
                            <asp:TextBox ID="tbFirstName" runat="server" CssClass="form-control" />
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Last Name:</span>
                            <asp:TextBox ID="tbLastName" runat="server" />
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Age:</span>
                            <asp:TextBox ID="tbAge" runat="server" />
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">City:</span>
                            <asp:TextBox ID="tbCity" runat="server" />
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Country:</span>
                            <asp:TextBox ID="tbCountry" runat="server" />
                        </div>

                        <asp:Button Text="Save" CssClass="btn btn-danger" ID="btnSaveBasicInformation" runat="server" OnClick="btnSaveBasicInformation_Click" />
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
