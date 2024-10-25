<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RDPplus.Pages.Login.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-lg-4 offset-lg-4 pt-4 pb-4 border" style="background-color:white; margin-top: 50px">

            <div class="mb-3 text-center flex-column">
                <%--<img src="/images/pertamina.png" style="max-height:4rem; margin-bottom:1.5rem" />--%>
                <h3 style="margin-bottom:3rem;">Login</h3>
            </div>

            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email</label>
                <%--<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">--%>
                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Enter your Email" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Password</label>
                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Input Password" TextMode="Password"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Button class="btn btn-primary btn-block w-100" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
            </div>

        </div>
        
    </div>

</asp:Content>
