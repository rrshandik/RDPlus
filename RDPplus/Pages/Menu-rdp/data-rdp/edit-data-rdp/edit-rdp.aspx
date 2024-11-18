<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="edit-rdp.aspx.cs" Inherits="RDPplus.Pages.Menu_rdp.data_rdp.edit_data_rdp.edit_rdp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-group {
            margin-bottom: 1.5rem;
        }
        .radio-group {
            display: flex;
            gap: 15px;
        }
        .input-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.5rem;
            display: block;
        }
        .form-control {
            border-radius: 5px;
            width: 100%;
            padding: 0.5rem 0.75rem;
            border: 1px solid #ced4da;
            transition: border-color 0.15s ease-in-out;
        }
        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            outline: 0;
        }
        .table-container {
            background-color: #f8f9fa;
            padding: 2rem;
            border-radius: 10px;
            margin: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .page-header {
            background-color: #f8f9fa;
            padding: 1rem;
            display: inline-flex;
            border-radius: 8px;
            margin-bottom: 1rem;
            border-left: 4px solid #358DC7;
            margin-left: 1rem;
        }

        .date-badge {
            display: inline-flex;
            align-items: center;
            background-color: #e9ecef;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            margin-left: 1rem;
        }
        .btn-save {
            background-color: #3075BB;
            color: white;
            padding: 0.5rem 2rem;
            border: none;
            border-radius: 5px;
            position: center;
            cursor: pointer;
            transition: background-color 0.15s ease-in-out;
        }
        .btn-cancel {
            background-color: #dc3545;
            color: white;
            padding: 0.5rem 2rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.15s ease-in-out;
        }

        .text-center {
            display: flex;
            justify-content: center;
            gap: 1rem;
        }

        .select2-container--default .select2-selection--single {
            height: 38px;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }
        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 36px;
            padding-left: 12px;
            color: #495057;
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
        .error-message {
            color: #dc3545;
            padding: 0.5rem;
            margin-bottom: 1rem;
            border-radius: 5px;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
        }
    </style>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header -->
    <div class="container-fluid">
        <div class="page-header">
            <h1 class="page-title h3 mb-0">Edit Data RDP</h1>
        </div>
        <div></div>
        <div class="date-badge mb-4">
            <img src="/images/date-icon.png" alt="Date" class="me-2" style="height: 16px; width: 16px;"/>
            <asp:Label ID="LabelCurrentDateTime" runat="server" CssClass="mb-0"></asp:Label>
        </div>

        <!-- Form -->
        <div class="table-container">
            <asp:Label ID="LabelMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>
            
            <div class="row">
                <!-- Left Column -->
                <div class="col-md-6">
                    <!-- ID Display -->
                    <div class="form-group">
                        <asp:Label ID="LabelID" runat="server" Text="ID RDP:" CssClass="input-label" />
                        <asp:Label ID="LabelIDValue" runat="server" CssClass="form-control-plaintext" />
                    </div>

                    <!-- Status Radio Buttons -->
                    <div class="form-group">
                        <asp:Label runat="server" Text="Status:" CssClass="input-label" />
                        <div class="radio-group">
                            <asp:RadioButtonList ID="RadioButtonListStatus" runat="server" RepeatDirection="Horizontal" CssClass="radio-item-spacing">
                            </asp:RadioButtonList>
                        </div>
                    </div>

                    <!-- NOPEK Lookup -->
                    <div class="form-group">
                        <asp:Label runat="server" Text="Nopek:" CssClass="input-label" />
                        <asp:DropDownList ID="DropDownListNopek" runat="server" CssClass="form-control chosen-select" AutoPostBack="true" OnSelectedIndexChanged="DropDownListNopek_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>

                    <!-- Employee Name -->
                    <div class="form-group">
                        <asp:Label runat="server" Text="Employee Name:" CssClass="input-label" />
                        <asp:Label ID="LabelEmployeeName" runat="server" CssClass="form-control-plaintext" Text="Select NOPEK to view name"></asp:Label>
                    </div>

                    <!-- Kondisi -->
                    <div class="form-group">
                        <asp:Label runat="server" Text="Keterangan 1:" CssClass="input-label" />
                        <asp:DropDownList ID="DropDownListKondisi" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- Right Column -->
                <div class="col-md-6">
                    <!-- Keterangan2 -->
                    <div class="form-group">
                        <asp:Label runat="server" Text="Keterangan 2:" CssClass="input-label" />
                        <asp:TextBox ID="TextBoxKeterangan2" runat="server" CssClass="form-control" placeholder="Tambahkan Keterangan 2"/>
                    </div>

                    <!-- Cluster -->
                    <div class="form-group">
                        <asp:Label runat="server" Text="Cluster:" CssClass="input-label" />
                        <asp:TextBox ID="TextBoxCluster" runat="server" CssClass="form-control" placeholder="Masukkan info cluster RDP"/>
                    </div>

                    <!-- Residence -->
                    <div class="form-group">
                        <asp:Label runat="server" Text="Jenis Hunian:" CssClass="input-label" />
                        <asp:DropDownList ID="DropDownListResidence" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>

                    <!-- RT RW Fields in one row -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="LabelRT" runat="server" Text="RT:" CssClass="input-label" />
                                <asp:TextBox ID="TextBoxRT" runat="server" CssClass="form-control" placeholder="Masukkan RT"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="LabelRW" runat="server" Text="RW:" CssClass="input-label" />
                                <asp:TextBox ID="TextBoxRW" runat="server" CssClass="form-control" placeholder="Masukkan RW"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Buttons -->
            <div class="row mt-4">
                <div class="col-12 text-center">
                    <asp:Button ID="ButtonSave" runat="server" Text="Save Changes" OnClick="ButtonSave_Click" CssClass="btn btn-action btn-save me-2" />
                    <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" OnClick="ButtonCancel_Click" CssClass="btn btn-cancel me-2" />
                </div>
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