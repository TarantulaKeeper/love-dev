<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="LoveDev.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content">
        <div class="container">
            <div class="row padtop">
                <div class="col-lg-3 col-md-4 col-sm-5 col-xs-6">
                    <div class="panel panel-success">
                        <div class="panel-body">
                            <asp:Image ID="imgProfilePhoto" runat="server" class="img-thumbnail" Height="220px" />
                            <div class="panel panel-collapse">
                                <div class="panel panel-success">
                                    <div class="panel-body">
                                        <span class="h6">Select Profile Photo:
                                    <asp:ImageButton ImageUrl="/Images/EditIcon.png" ID="imgbtnEditProfilePhoto" runat="server" CssClass="btn btn-warning right" OnClick="imgbtnEditProfilePhoto_Click" /></span>
                                    </div>
                                </div>
                                <asp:Panel ID="pnlProfilePhotoEdit" Visible="false" runat="server" CssClass="panel panel-success text-center">
                                    <asp:FileUpload ID="fuProfilePhoto" runat="server" CssClass="h6" />
                                    <asp:Button Text="Save" ID="btnSaveProfilePhoto" runat="server" CssClass="btn btn-danger" OnClick="btnSaveProfilePhoto_Click" />
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8 col-sm-7 col-xs-6">
                    <div class="panel panel-success">
                        <asp:Panel ID="pnlBasicInformation" runat="server" CssClass="panel-body">
                            <div class="">
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon minwidth h6">First Name:</span>
                                    <asp:Label ID="lblFirstName" runat="server" CssClass="form-control" />
                                </div>
                                <div class="input-group  input-group-lg">
                                    <span class="input-group-addon minwidth h6">Last Name:</span>
                                    <asp:Label ID="lblLastName" runat="server" CssClass="form-control" />
                                </div>
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon minwidth h6">Age:</span>
                                    <asp:Label ID="lblAge" runat="server" CssClass="form-control" />
                                </div>
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon minwidth h6">City:</span>
                                    <asp:Label ID="lblCity" runat="server" CssClass="form-control" />
                                </div>
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon minwidth h6">Country:</span>
                                    <asp:Label ID="lblCountry" runat="server" CssClass="form-control" />
                                </div>
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon minwidth h6">Gender:</span>
                                    <asp:Label ID="lblGender" runat="server" CssClass="form-control" />
                                </div>
                                <div class="input-group input-group-lg">
                                    <span class="input-group-addon minwidth h6">About me:</span>
                                    <textarea id="txtareaUserBio" runat="server" disabled="disabled" class="form-control"></textarea>
                                    <%--<asp:Label ID="lblSexualOrientation" runat="server" CssClass="form-control" />--%>
                                </div>
                                <div class="col-lg-offset-11 col-md-offset-11 col-sm-offset-11 col-xs-offset-11 col-lg-1 col-md-1 col-sm-1 col-xs-1 padtop">
                                    <a class="btn btn-warning">
                                        <asp:ImageButton ImageUrl="/Images/EditIcon.png" ID="imgbtnEditBasicInfo" OnClick="imgbtnEditBasicInfo_Click" runat="server" Height="30px" /></a>
                                </div>

                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlBasicInformationEdit" Visible="false" runat="server" CssClass="panel-body">
                            <div class="input-group  input-group-lg">
                                <span class="input-group-addon minwidth">First Name:</span>
                                <asp:TextBox ID="tbFirstName" runat="server" CssClass="form-control" />
                            </div>
                            <div class="input-group  input-group-lg">
                                <span class="input-group-addon minwidth">Last Name:</span>
                                <asp:TextBox ID="tbLastName" runat="server" CssClass="form-control" />
                            </div>
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon minwidth">Age:</span>
                                <asp:TextBox ID="tbAge" runat="server" CssClass="form-control" />
                            </div>
                            <div class="input-group  input-group-lg">
                                <span class="input-group-addon minwidth">City:</span>
                                <asp:TextBox ID="tbCity" runat="server" CssClass="form-control" />
                            </div>
                            <div class="input-group  input-group-lg">
                                <span class="input-group-addon minwidth">Country:</span>
                                <asp:TextBox ID="tbCountry" runat="server" CssClass="form-control" />
                            </div>
                            <div class="input-group  input-group-lg">
                                <span class="input-group-addon minwidth">About me:</span>
                                <textarea id="txtareaEditBio" runat="server" class="form-control"></textarea>
                            </div>
                            <div class="col-lg-offset-11 col-md-offset-11 col-sm-offset-11 col-xs-offset-11 col-lg-1 col-md-1 col-sm-1 col-xs-1 padtop">
                            <asp:Button Text="Save" CssClass="btn btn-danger" ID="btnSaveBasicInformation" runat="server" OnClick="btnSaveBasicInformation_Click" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
