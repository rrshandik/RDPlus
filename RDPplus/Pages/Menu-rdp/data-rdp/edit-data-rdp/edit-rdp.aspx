<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="edit-rdp.aspx.cs" Inherits="RDPplus.Pages.Menu_rdp.data_rdp.edit_data_rdp.edit_rdp" %>
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

    <!-- form -->
    <div class="table-container" style="background-color: #f8f9fa; padding: 20px; border-radius: 10px; margin: 15px;">
        <asp:Label ID="LabelMessage" runat="server" ForeColor="Red"></asp:Label>

        <asp:Label ID="LabelID" runat="server" Text="ID:" />
        <asp:Label ID="LabelIDValue" runat="server" />
        <br />

        <asp:Label ID="LabelRT" runat="server" Text="RT:" />
        <asp:TextBox ID="TextBoxRT" runat="server" />
        <br />

        <asp:Label ID="LabelRW" runat="server" Text="RW:" />
        <asp:TextBox ID="TextBoxRW" runat="server" />
        <br />

        <asp:Button ID="ButtonSave" runat="server" Text="Save" OnClick="ButtonSave_Click" />
    </div>
</asp:Content>
