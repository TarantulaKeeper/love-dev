<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LoveDev.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="webpage_content">
        <asp:Label ID="lblQS" runat="server" Visible="false" />
        <asp:Panel ID="pnlWelcome" runat="server">
            <div class="container-fluid">
                <div class="jumbotron">
                    <div class="row text-center">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div>
                                <img src="Images/LoveDevLogogo.png" />
                                <h2 class="text-center">Let us help you develop your love.</h2>
                                <div class=" col-lg-offset-5 col-lg-6">
                                    <div class="text-left">
                                        <h4><span>if (You == alone)</span></h4>
                                        <h4>{</h4>
                                        <div>
                                            <h4> You + LoveDev = <span class="glyphicon glyphicon-heart"></span>;</h4>
                                        </div>
                                        <h4>}</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="displayinlineblock">

                                <div class="dropdown">
                                    <span style="padding-right: 10px;">I am </span>
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="btn btn-default dropdown-toggle" />

                                    <asp:RequiredFieldValidator ID="rfGender" runat="server" ControlToValidate="ddlGender" ValidationGroup="ddl" Text="*" ErrorMessage="Gender Required" CssClass="text-danger" InitialValue="-1"></asp:RequiredFieldValidator>
                                    <span style="padding-right: 10px;">looking for </span>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Select Preferences <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <asp:CheckBoxList runat="server" ID="cblOrientation"></asp:CheckBoxList>
                                            </li>
                                        </ul>
                                    </div>
                                    <%--<asp:DropDownList ID="ddlOrientation" runat="server" CssClass="btn btn-default dropdown-toggle" />--%>
                                    <%--<asp:RequiredFieldValidator ID="rfOrientation" runat="server" ControlToValidate="ddlOrientation" ValidationGroup="ddl" Text="*" ErrorMessage="Sexual Orientation Required" CssClass="text-danger" InitialValue="-1"></asp:RequiredFieldValidator>--%>
                                    <asp:Button ID="btnContinue_register" Text="Continue" runat="server" ValidationGroup="ddl" OnClick="btnContinue_register_Click" CssClass="btn btn-warning navbar-btn" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlRegistration_cont" Visible="false">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-5 col-sm-2"></div>
                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-4" id="divval">
                        <div style="margin-top:100px;">
                        <asp:ValidationSummary ID="vsReg" ValidationGroup="Reg" runat="server" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-4 col-sm-8 col-xs-12">
                        <asp:Label ID="lblError" runat="server" CssClass="text-danger" />
                        <h1>Registration</h1>

                        <div class="input-group input-group-sm">
                            <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name" CssClass="form-control" />
                            <span class="input-group-addon">
                                <asp:RequiredFieldValidator ID="rfFirstName" ControlToValidate="txtFirstName" ValidationGroup="Reg"
                                    Text="*" runat="server" ErrorMessage="First Name Required" CssClass="text-danger"></asp:RequiredFieldValidator><br />
                            </span>
                        </div>
                        <div class="input-group input-group-sm">
                            <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name" CssClass="form-control" />
                            <span class="input-group-addon">
                                <asp:RequiredFieldValidator ID="rfLastName" runat="server" ControlToValidate="txtLastName"
                                    ValidationGroup="Reg" Text="*" ErrorMessage="Last Name Required" CssClass="text-danger"></asp:RequiredFieldValidator><br />
                            </span>
                        </div>
                        <div class="input-group input-group-sm">
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control" />
                            <span class="input-group-addon">
                                <asp:RequiredFieldValidator ID="rfEmail" runat="server" ControlToValidate="txtEmail"
                                    ValidationGroup="Reg" Text="*" ErrorMessage="Email Required" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:Image ID="imgEmail" runat="server" Style="height: 15px; width: 13px; display: none;" />
                                <asp:Label ID="lblEmail" runat="server" /><br />
                            </span>
                        </div>
                        <div class="input-group input-group-sm">
                            <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="form-control" />

                            <span class="input-group-addon">
                                <asp:RequiredFieldValidator ID="rfPassword" runat="server" ControlToValidate="txtPassword"
                                    ValidationGroup="Reg" Text="*" ErrorMessage="Password Required" CssClass="text-danger"></asp:RequiredFieldValidator><br />
                            </span>
                        </div>
                        <div class="input-group input-group-sm">
                            <asp:TextBox ID="txtAge" runat="server" TextMode="Number" MaxLength="2" placeholder="Age" CssClass="form-control" />
                            <span class="input-group-addon">
                                <asp:RequiredFieldValidator ID="rfAge" runat="server" ControlToValidate="txtAge"
                                    ValidationGroup="Reg" Text="*" ErrorMessage="Age Required" CssClass="text-danger"></asp:RequiredFieldValidator><br />
                            </span>
                        </div>
                        <div class="input-group input-group-sm">
                            <asp:TextBox ID="txtCity" runat="server" placeholder="City" CssClass="form-control" />
                            <span class="input-group-addon">
                                <asp:RequiredFieldValidator ID="rfCity" runat="server" ControlToValidate="txtCity"
                                    ValidationGroup="Reg" Text="*" ErrorMessage="City Required" CssClass="text-danger"></asp:RequiredFieldValidator><br />
                            </span>
                        </div>
                        <div class="input-group input-group-sm">
                            <asp:TextBox ID="txtCountry" runat="server" placeholder="Country" CssClass="form-control" />
                            <span class="input-group-addon">
                                <asp:RequiredFieldValidator ID="rfCountry" runat="server" ControlToValidate="txtCountry"
                                    ValidationGroup="Reg" Text="*" ErrorMessage="Country Required" CssClass="text-danger"></asp:RequiredFieldValidator><br />
                            </span>
                        </div>
                        <br />
                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" ValidationGroup="Reg" CssClass="btn btn-info" />
                    </div>
                </div>
            </div>
        </asp:Panel>
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
                            $('#<%= lblEmail.ClientID %>').html("Not Available").css('color', 'red');
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
