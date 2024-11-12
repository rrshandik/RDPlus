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
        .form-control {
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
        /* Select2 Custom Styles */
        .select2-container--default .select2-selection--single {
            height: 38px;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }
        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 36px;
            padding-left: 12px;
        }
        .select2-container--default .select2-selection--single .select2-selection__arrow {
            height: 36px;
        }
        .select2-dropdown {
            border: 1px solid #ced4da;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .select2-search__field {
            border: 1px solid #ced4da !important;
            border-radius: 4px !important;
            padding: 6px 12px !important;
        }
        .select2-results__option {
            padding: 8px 12px;
        }
        .select2-results__option--highlighted {
            background-color: #007bff !important;
        }
        .radio-item-spacing {
            margin-right: 50px; 
        }
    </style>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

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
                <asp:RadioButtonList ID="RadioButtonListStatus" runat="server" RepeatDirection="Horizontal" CssClass="radio-item-spacing">

                </asp:RadioButtonList>
            </div>
        </div>

        
        
        <!-- NOPEK Lookup with Searchable Dropdown -->
        <div class="form-group">
            <asp:Label runat="server" Text="Noopek:" CssClass="input-label" />
            <asp:DropDownList ID="DropDownListNopek" runat="server" CssClass="form-control chosen-select" AutoPostBack="true" OnSelectedIndexChanged="DropDownListNopek_SelectedIndexChanged">
            </asp:DropDownList>
        </div>

        <!-- Employee Name Display -->
        <div class="form-group">
            <asp:Label runat="server" Text="Employee Name:" CssClass="input-label" />
            <asp:Label ID="LabelEmployeeName" runat="server" CssClass="form-control" Text="Select NOPEK to view name"></asp:Label>
        </div>

        <!-- Kondisi Dropdown (Keterangan1) -->
        <div class="form-group">
            <asp:Label runat="server" Text="Keterangan 1:" CssClass="input-label" />
            <asp:DropDownList ID="DropDownListKondisi" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>

        <!-- Keterangan2 Textbox -->
        <div class="form-group">
            <asp:Label runat="server" Text="Keterangan 2:" CssClass="input-label" />
            <asp:TextBox ID="TextBoxKeterangan2" runat="server" CssClass="form-control" placeholder="Tambahkan Keterangan 2"/>
        </div>

        <!-- Cluster Textbox -->
        <div class="form-group">
            <asp:Label runat="server" Text="Cluster:" CssClass="input-label" />
            <asp:TextBox ID="TextBoxCluster" runat="server" CssClass="form-control" placeholder="Masukkan info cluster RDP"/>
        </div>

        <!-- Residence Dropdown -->
        <div class="form-group">
            <asp:Label runat="server" Text="Jenis Hunian:" CssClass="input-label" />
            <asp:DropDownList ID="DropDownListResidence" runat="server" CssClass="form-control" >
            </asp:DropDownList>
        </div>

        <!-- RT RW Fields -->
        <div class="form-group">
            <asp:Label ID="LabelRT" runat="server" Text="RT:" CssClass="input-label" />
            <asp:TextBox ID="TextBoxRT" runat="server" CssClass="form-control" placeholder="Masukkan RT RDP"/>
        </div>

        <div class="form-group">
            <asp:Label ID="LabelRW" runat="server" Text="RW:" CssClass="input-label" />
            <asp:TextBox ID="TextBoxRW" runat="server" CssClass="form-control" placeholder="Masukkan RW RDP"/>
        </div>

        <!-- Button -->
        <div class="row d-flex justify-content-center">
            <div class="col-auto form-group text-center">
                <asp:Button ID="ButtonSave" runat="server" Text="Save" OnClick="ButtonSave_Click" CssClass="btn btn-primary"  />
            </div>

            <div class="col-auto form-group text-center">
                <button class="btn btn-secondary">Cancel</button>
            </div>

        </div>

    </div>

    <script>
        $(document).ready(function () {
            $("#<%= DropDownListNopek.ClientID %>").select2({
                theme: 'default',
                placeholder: '-- Select NOPEK --',
                allowClear: true,
                width: '100%',
                dropdownParent: $('.table-container'),
                language: {
                    noResults: function () {
                        return "No matches found";
                    }
                }
            });

            // Handle the postback
            $("#<%= DropDownListNopek.ClientID %>").on('change', function() {
                __doPostBack('<%= DropDownListNopek.UniqueID %>', '');
            });
        });
     </script>

</asp:Content>
