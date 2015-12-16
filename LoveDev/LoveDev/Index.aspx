<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LoveDev.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="webpage_content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-4"></div>
                <div class="col-lg-6 col-md-6 col-sm-8 col-xs-12">
                    <asp:Label ID="lblError" runat="server" />
                    <h1>Registration</h1>
                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Reg" runat="server" />

                    <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name" />
                    <asp:RequiredFieldValidator ID="rfFirstName" ControlToValidate="txtFirstName" ValidationGroup="Reg" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator><br />

                    <asp:TextBox ID="txtLastName" runat="server" placeholder="LastName" />
                    <asp:RequiredFieldValidator ID="rfLastName" runat="server" ControlToValidate="txtLastName" ValidationGroup="Reg" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator><br />

                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" />
                    <asp:RequiredFieldValidator ID="rfEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="Reg" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator><br />
                    <asp:Image ID="imgEmail" runat="server" Style="height: 25px; width: 25px; display: none;" />
                    <asp:Label ID="lblEmail" runat="server" /><br />

                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" />
                    <asp:RequiredFieldValidator ID="rfPassword" runat="server" ControlToValidate="txtPassword" ValidationGroup="Reg" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator><br />

                    <asp:TextBox ID="txtAge" runat="server" TextMode="Number" placeholder="Age" />
                    <asp:RequiredFieldValidator ID="rfAge" runat="server" ControlToValidate="txtAge" ValidationGroup="Reg" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator><br />

                    <asp:TextBox ID="txtCity" runat="server" placeholder="City" />
                    <asp:RequiredFieldValidator ID="rfCity" runat="server" ControlToValidate="txtCity" ValidationGroup="Reg" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator><br />

                    <asp:TextBox ID="txtCountry" runat="server" placeholder="Country" />
                    <asp:RequiredFieldValidator ID="rfCountry" runat="server" ControlToValidate="txtCountry" ValidationGroup="Reg" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator><br />

                    Gender: <asp:DropDownList ID="ddlGender" runat="server" />
                    <asp:RequiredFieldValidator ID="rfGender" runat="server" ControlToValidate="ddlGender" ValidationGroup="Reg" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator><br />

                    Sexual Orientation: <asp:DropDownList ID="ddlOrientation" runat="server" />
                    <asp:RequiredFieldValidator ID="rfOrientation" runat="server" ControlToValidate="ddlOrientation" ValidationGroup="Reg" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator><br />

                    Profile Photo: <asp:FileUpload ID="fupPhoto" runat="server" />
                    <br />
                    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" ValidationGroup="Reg" />
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
