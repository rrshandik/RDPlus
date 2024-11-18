<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="employee-data.aspx.cs" Inherits="RDPplus.Pages.Employee_Data.employee_data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <!-- js styling datatables -->
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <link href="https://nightly.datatables.net/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
    <script src="https://nightly.datatables.net/js/jquery.dataTables.js"></script>

    <!-- Initialize DataTables -->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(".table tr:first"))).DataTable({
                "createdRow": function (row, data, dataIndex) {
                    var assessmentStatus = $(row).find('td:last').text().trim();
                    if (assessmentStatus === "not set") {
                        $(row).addClass('not-set-status');
                    }
                },
                "stripeClasses": [], 
                "rowCallback": function (row, data, index) {
                    if (!$(row).hasClass('not-set-status')) {
                        $(row).addClass(index % 2 === 0 ? 'even' : 'odd');
                    }
                }
            });
        });
    </script>

    <style>
        .dataTables_wrapper .dataTable tbody tr.odd {
            background-color: #EDFFC3 !important; 
        }

        .dataTables_wrapper .dataTable tbody tr.even {
            background-color: #E5F4C1 !important; 
        }

        .dataTables_wrapper .dataTable tbody tr.not-set-status {
            background-color: #FFE3E4 !important;
        }

        .dataTables_wrapper .dataTable thead th {
            background-color: black !important; 
            color: white !important;
        }
        .date-badge {
            display: inline-flex;
            align-items: center;
            background-color: #e9ecef;
            padding: 0.5rem 1rem;
            border-radius: 5px;
        }
        .page-header {
            background-color: #f8f9fa;
            padding: 0.5rem;
            display: inline-flex;
            border-radius: 8px;
            margin-bottom: 1rem;
            margin-left: 1rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header -->

    <div class="page-header">
        <h1 class="page-title">Data Pegawai</h1>
    </div>


    <div class="row mb-3" style="margin-left: 3px">
        <div class="col-md-6">
            <div class="date-badge">
                <span>
                    <img src="/images/date-icon.png" style="height: 12px; width: 12px; margin-bottom: 2px; margin-right: 10px"/>
                </span>
                <asp:Label ID="LabelCurrentDateTime" runat="server"></asp:Label>
            </div>
        </div>
        <div class="col-md-6 d-flex justify-content-end">
            <p class="badge bg-light text-dark">Sync From SAP</p>
        </div>
    </div>
    <!-- DataSource -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" SelectCommand="SELECT * FROM [employee]"></asp:SqlDataSource>

    <!-- GridView -->
    <div class="table-container" style="background-color: #f8f9fa; padding: 20px; border-radius: 10px; margin: 15px;">
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" AutoGenerateColumns="False" DataKeyNames="id_employee" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered text-decoration-none text-dark" Style="font-size: 14px;">
            <Columns>

                <asp:TemplateField HeaderText="Action" SortExpression="Edit">
                    <ItemTemplate>
                        <a href="employee-edit?id=<%# Eval("id_employee") %>" class="text-decoration-none edit-button" 
                           data-id='<%# Eval("id_employee") %>' 
                           data-email='<%# Eval("email_employee") %>' 
                           data-name='<%# Eval("name") %>' 
                           data-toggle="modal" 
                           data-target="#editEmployeeModal">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                            </svg>
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:BoundField DataField="id_employee" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="id_employee" />
                <asp:BoundField DataField="email_employee" HeaderText="Email" SortExpression="email_employee" />
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="nopek" HeaderText="Nopek" SortExpression="nopek" />
                <asp:BoundField DataField="PRL" HeaderText="PRL" SortExpression="PRL" />
                <asp:BoundField DataField="position" HeaderText="Position" SortExpression="position" />
                <asp:BoundField DataField="points" HeaderText="Points" SortExpression="points" />
                <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                <asp:BoundField DataField="section" HeaderText="Section" SortExpression="section" />
                <asp:BoundField DataField="family_status" HeaderText="Family Status" SortExpression="family_status" />
                <asp:BoundField DataField="assessment_status" HeaderText="Assessment Status" SortExpression="assessment_status" />


            </Columns>
        </asp:GridView>
    </div>

   
</asp:Content>
