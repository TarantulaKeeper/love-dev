﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LoveDev.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="webpage_content">
        <div class="container-fluid">
            <div class="row">
                <div class=""></div>
                <div class="col-lg-3 col-md-4 col-sm-8 col-xs-12 col-lg-offset-9 col-md-offset-8 col-md-offset-6 col-sm-offset-4">
                    <asp:Label ID="lblError" runat="server" />
                    <h1>Registration</h1>
                    <asp:ValidationSummary ID="vsReg" ValidationGroup="Reg" runat="server" CssClass="text-danger" />

                    <div class="input-group input-group-sm">
                        <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfFirstName" ControlToValidate="txtFirstName" ValidationGroup="Reg" Text="*" runat="server" ErrorMessage="First Name Required" CssClass="text-danger form-control"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="input-group input-group-sm">
                        <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfLastName" runat="server" ControlToValidate="txtLastName" ValidationGroup="Reg" Text="*" ErrorMessage="Last Name Required" CssClass="text-danger form-control"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="input-group input-group-sm">
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="Reg" Text="*" ErrorMessage="Email Required" CssClass="text-danger form-control"></asp:RequiredFieldValidator>
                    <asp:Image ID="imgEmail" runat="server" Style="height: 25px; width: 25px; display: none;" />
                    <asp:Label ID="lblEmail" runat="server" /><br />
                    </div>
                    <div class="input-group input-group-sm">
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfPassword" runat="server" ControlToValidate="txtPassword" ValidationGroup="Reg" Text="*" ErrorMessage="Password Required" CssClass="text-danger form-control"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="input-group input-group-sm">
                    <asp:TextBox ID="txtAge" runat="server" TextMode="Number" placeholder="Age" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfAge" runat="server" ControlToValidate="txtAge" ValidationGroup="Reg" Text="*" ErrorMessage="Age Required" CssClass="text-danger form-control"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="input-group input-group-sm">
                    <asp:TextBox ID="txtCity" runat="server" placeholder="City" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfCity" runat="server" ControlToValidate="txtCity" ValidationGroup="Reg" Text="*" ErrorMessage="City Required" CssClass="text-danger form-control"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="input-group input-group-sm">
                    <asp:TextBox ID="txtCountry" runat="server" placeholder="Country" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfCountry" runat="server" ControlToValidate="txtCountry" ValidationGroup="Reg" Text="*" ErrorMessage="Country Required" CssClass="text-danger form-control"></asp:RequiredFieldValidator><br />
                    </div>
                    Gender:
                    <asp:DropDownList ID="ddlGender" runat="server" />
                    <asp:RequiredFieldValidator ID="rfGender" runat="server" ControlToValidate="ddlGender" ValidationGroup="Reg" Text="*" ErrorMessage="Gender Required" CssClass="text-danger" InitialValue="-1"></asp:RequiredFieldValidator><br />

                    Sexual Orientation:
                    <asp:DropDownList ID="ddlOrientation" runat="server" />
                    <asp:RequiredFieldValidator ID="rfOrientation" runat="server" ControlToValidate="ddlOrientation" ValidationGroup="Reg" Text="*" ErrorMessage="Sexual Orientation Required" CssClass="text-danger" InitialValue="-1"></asp:RequiredFieldValidator><br />

                    Profile Photo:
                    <asp:FileUpload ID="fupPhoto" runat="server" />
                    <br />
                    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" ValidationGroup="Reg" CssClass="btn btn-info" />
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {

            $('#<%= txtEmail.ClientID %>').blur(function () {
                var email = $(this);

                $.ajax('EmailHandler.ashx', {
                    data: { Email: email.val() },
                    success: function (response) {
                        $('#<%= imgEmail.ClientID %>').attr("src", response).show();
                        if (response == "Images\\RedX.png") {
                            $('#<%= lblEmail.ClientID %>').html("USERNAME NOT AVAILABLE").css('color', 'red');
                            $('#<%= btnRegister.ClientID%>').attr('disabled', 'disabled');
                        }
                        else {
                            $('#<%= lblEmail.ClientID %>').html("Available").css('color', 'black');
                            $('#<%= btnRegister.ClientID%>').removeAttr('disabled');
                        }
                    },
                    error: function (error) {
                        alert(error)
                    }
                })
            })
        })
    </script>

</asp:Content>
