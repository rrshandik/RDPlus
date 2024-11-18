<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="employee-edit.aspx.cs" Inherits="RDPplus.Pages.Employee_Data.employee_edit.employee_edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            background-color: #f8f9fa;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.5rem;
            display: block;
        }

        .form-control {
            width: 100%;
            padding: 0.5rem 0.75rem;
            border: 1px solid #ced4da;
            border-radius: 5px;
            transition: border-color 0.15s ease-in-out;
        }

        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            outline: 0;
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

        .error-message {
            color: #dc3545;
            margin-bottom: 1rem;
            padding: 0.5rem;
            border-radius: 5px;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            display: none;
        }

        .error-message.show {
            display: block;
        }

        .page-header {
            background-color: #f8f9fa;
            padding: 1rem;
            display: inline-flex;
            border-radius: 8px;
            margin-bottom: 1rem;
            border-left: 4px solid #358DC7;
        }

        .date-badge {
            display: inline-flex;
            align-items: center;
            background-color: #e9ecef;
            padding: 0.5rem 1rem;
            border-radius: 5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header -->
    <div class="container mt-4">
        <div class="page-header">
            <h1 class="page-title h3 mb-0">Edit Data Pegawai</h1>
        </div>
        <div></div>
        <div class="date-badge mb-4">
            <img src="/images/date-icon.png" alt="Date" class="me-2" style="height: 16px; width: 16px;"/>
            <asp:Label ID="LabelCurrentDateTime" runat="server" CssClass="mb-0"></asp:Label>
        </div>

        <!-- Form Container -->
        <div class="form-container">
            <asp:Label ID="LabelMessage" runat="server" CssClass="error-message" EnableViewState="false"></asp:Label>
            
            <div class="row">
                <div class="col-md-6">
                    <!-- Employee ID -->
                    <div class="form-group">
                        <asp:Label ID="LabelID" runat="server" CssClass="form-label" Text="Employee ID"></asp:Label>
                        <asp:Label ID="LabelIDValue" runat="server" CssClass="form-control-plaintext"></asp:Label>
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                        <asp:Label ID="LabelEmail" runat="server" CssClass="form-label" Text="Email Address"></asp:Label>
                        <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control" placeholder="Enter email address"></asp:TextBox>
                    </div>

                    <!-- Name -->
                    <div class="form-group">
                        <asp:Label ID="LabelName" runat="server" CssClass="form-label" Text="Full Name"></asp:Label>
                        <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control" placeholder="Enter full name"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-6">
                    <!-- Family Status -->
                    <div class="form-group">
                        <asp:Label ID="labelFamily" runat="server" CssClass="form-label" Text="Status Keluarga"></asp:Label>
                        <asp:TextBox ID="TextBoxFamily" runat="server" CssClass="form-control" placeholder="Enter family status"></asp:TextBox>
                    </div>

                    <!-- SMK Contribution -->
                    <div class="form-group">
                        <asp:Label ID="labelKontribusi" runat="server" CssClass="form-label" Text="SMK (Kontribusi)"></asp:Label>
                        <asp:TextBox ID="TextBoxKontribusi" runat="server" CssClass="form-control" placeholder="Input SMK contribution"></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- Submit Button -->
            <div class="text-center mt-4">
                <asp:Button ID="ButtonSave" runat="server" Text="Save Changes" CssClass="btn-save" OnClick="ButtonSave_Click" />
                <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" CssClass="btn-cancel me-3" OnClick="ButtonCancel_Click" />
            </div>

        </div>
    </div>



    <script type="text/javascript">

        $(document).ready(function() {
            if ($('.error-message').text().trim() !== '') {
                $('.error-message').addClass('show');
            }
        });
    </script>
</asp:Content>