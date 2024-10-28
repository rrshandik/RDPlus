<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="employee-edit.aspx.cs" Inherits="RDPplus.Pages.Employee_Data.employee_edit.employee_edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Header -->
    <div class="container mt-4">
        <div class="badge bg-light text-dark mb-2">
            <h1 class="page-title">Edit Data Pegawai</h1>
        </div>
    </div>

    <div class="row mb-3" style="margin-left: 3px">
        <div class="col-md-6">
            <div class="badge bg-light text-dark mt-2">
                <span>
                    <img src="/images/date-icon.png" style="height: 12px; width: 12px; margin-bottom: 2px; margin-right: 10px"/>
                </span>
                <asp:Label ID="LabelCurrentDateTime" runat="server"></asp:Label>
            </div>
        </div>
    </div>

    <!-- Action -->


    <div class="table-container" style="background-color: #f8f9fa; padding: 20px; border-radius: 10px; margin: 15px;">

        <asp:Label ID="LabelMessage" runat="server" ForeColor="Red"></asp:Label>

        <asp:Label ID="LabelID" runat="server" Text="ID:" />
        <asp:Label ID="LabelIDValue" runat="server" />
        <br />

        <asp:Label ID="LabelEmail" runat="server" Text="Email:" />
        <asp:TextBox ID="TextBoxEmail" runat="server" />
        <br />

        <asp:Label ID="LabelName" runat="server" Text="Name:" />
        <asp:TextBox ID="TextBoxName" runat="server" />
        <br />

        <asp:Button ID="ButtonSave" runat="server" Text="Save" OnClick="ButtonSave_Click" />
    </div>


</asp:Content>
