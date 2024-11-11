<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="edit-rdp.aspx.cs" Inherits="RDPplus.Pages.Menu_rdp.data_rdp.edit_data_rdp.edit_rdp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-group {
            margin-bottom: 20px;
        }
        .radio-group {
            display: flex;
            gap: 15px;
        }
        .input-label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }
        .form-control, .chosen-select {
            border-radius: 5px;
            width: 100%;
        }
        .table-container {
            background-color: #f8f9fa;
            padding: 30px;
            border-radius: 10px;
            margin: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Header -->
    <div class="container mt-4">
        <div class="badge bg-light text-dark mb-2">
            <h1 class="page-title">Edit Data RDP</h1>
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

     <!-- Form -->
    <div class="table-container">
        <asp:Label ID="LabelMessage" runat="server" ForeColor="Red"></asp:Label>
        
        <!-- ID Display -->
        <div class="form-group">
            <asp:Label ID="LabelID" runat="server" Text="ID RDP:" CssClass="input-label" />
            <asp:Label ID="LabelIDValue" runat="server" />
        </div>

        <!-- Status Radio Buttons -->
        <div class="form-group">
            <asp:Label runat="server" Text="Status:" CssClass="input-label" />
            <div class="radio-group">
                <asp:RadioButtonList ID="RadioButtonListStatus" runat="server" RepeatDirection="Horizontal">
                </asp:RadioButtonList>
            </div>
        </div>

        <!-- Kondisi Dropdown (Keterangan1) -->
        <div class="form-group">
            <asp:Label runat="server" Text="Keterangan:" CssClass="input-label" />
            <asp:DropDownList ID="DropDownListKondisi" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>
        
        <!-- NOPEK Lookup with Searchable Dropdown -->
        <div class="form-group">
            <asp:Label runat="server" Text="NOPEK:" CssClass="input-label" />
            <asp:DropDownList ID="DropDownListNopek" runat="server" CssClass="form-control chosen-select" AutoPostBack="true" OnSelectedIndexChanged="DropDownListNopek_SelectedIndexChanged">
            </asp:DropDownList>
        </div>

        <!-- Employee Name Display -->
        <div class="form-group">
            <asp:Label runat="server" Text="Employee Name:" CssClass="input-label" />
            <asp:Label ID="LabelEmployeeName" runat="server" CssClass="form-control" Text="Select NOPEK to view name"></asp:Label>
        </div>

        <!-- Keterangan2 Textbox -->
        <div class="form-group">
            <asp:Label runat="server" Text="Keterangan Tambahan:" CssClass="input-label" />
            <asp:TextBox ID="TextBoxKeterangan2" runat="server" CssClass="form-control" />
        </div>

        <!-- Cluster Textbox -->
        <div class="form-group">
            <asp:Label runat="server" Text="Cluster:" CssClass="input-label" />
            <asp:TextBox ID="TextBoxCluster" runat="server" CssClass="form-control" />
        </div>

        <!-- Residence Dropdown -->
        <div class="form-group">
            <asp:Label runat="server" Text="Residence:" CssClass="input-label" />
            <asp:DropDownList ID="DropDownListResidence" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>

        <!-- Additional Fields -->
        <div class="form-group">
            <asp:Label ID="LabelRT" runat="server" Text="RT:" CssClass="input-label" />
            <asp:TextBox ID="TextBoxRT" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="LabelRW" runat="server" Text="RW:" CssClass="input-label" />
            <asp:TextBox ID="TextBoxRW" runat="server" CssClass="form-control" />
        </div>

        <!-- Save Button -->
        <div class="form-group text-center">
            <asp:Button ID="ButtonSave" runat="server" Text="Save" OnClick="ButtonSave_Click" CssClass="btn btn-primary" />
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $(".chosen-select").chosen({ width: "100%" });
        });
    </script>

</asp:Content>
