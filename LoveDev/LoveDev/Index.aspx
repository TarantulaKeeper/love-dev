<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LoveDev.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="webpage_content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-4"></div>
                <div class="col-lg-6 col-md-6 col-sm-8 col-xs-12">
                    <asp:Label ID="lblError" runat="server" />
                    <h1>Registration</h1>

                    <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name" required /><br />
                    <asp:TextBox ID="txtLastName" runat="server" placeholder="LastName" required /><br />

                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" required />
                    <asp:Image ID="imgEmail" runat="server" Style="height: 25px; width: 25px; display: none;" />
                    <asp:Label ID="lblEmail" runat="server" /><br />

                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" required /><br />
                    <asp:TextBox ID="txtAge" runat="server" TextMode="Number" placeholder="Age" required /><br />
                    <asp:TextBox ID="txtCity" runat="server" placeholder="City" required /><br />
                    <asp:TextBox ID="txtCountry" runat="server" placeholder="Country" required /><br />
                    Gender:
            <asp:DropDownList ID="ddlGender" runat="server" required /><br />
                    Sexual Orientation:
            <asp:DropDownList ID="ddlOrientation" runat="server" required /><br />
                    Profile Photo:
            <asp:FileUpload ID="fupPhoto" runat="server" />
                    <br />
                    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
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
