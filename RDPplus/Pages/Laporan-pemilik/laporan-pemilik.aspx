<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="laporan-pemilik.aspx.cs" Inherits="RDPplus.Pages.Laporan_pemilik.laporan_pemilik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <link href="https://nightly.datatables.net/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
    <script src="https://nightly.datatables.net/js/jquery.dataTables.js"></script>

    <script type="text/javascript">
    $(document).ready(function () {
        $(".table").prepend($("<thead></thead>").append($(".table tr:first"))).DataTable();

    });
    </script>

    <style>
        .dataTables_wrapper .dataTable tbody tr.odd {
            background-color: #EDFFC3 !important; 
        }

        .dataTables_wrapper .dataTable tbody tr.even {
            background-color: #E5F4C1 !important; 
        }
        .dataTables_wrapper .dataTable thead th {
            background-color: black !important; 
            color: white !important;
        }
        .table {
            border-radius: 15px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header -->
    <div class="container mt-4">
        <div class="badge bg-light text-dark mb-2">
            <h1 class="page-title">Laporan Pemilik RDP</h1>
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

    <div class="table-container" 
         style="background-color: #f8f9fa; 
                padding: 20px; 
                border-radius: 15px; 
                margin-left: 10px;
                position: relative;
                z-index: 1;">
        <asp:GridView ID="GridView1" runat="server" 
              CssClass="table table-striped table-bordered text-decoration-none text-dark" 
              AutoGenerateColumns="False" 
              UseAccessibleHeader="True"
              OnRowDataBound="GridView1_RowDataBound">


            <Columns>
                <asp:TemplateField HeaderText="No">
                    <ItemTemplate>
                        <asp:Label ID="lblRowNumber" runat="server"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="alamat" HeaderText="Alamat" />
                <asp:BoundField DataField="no_rdp" HeaderText="No RDP" />
                <asp:BoundField DataField="tipe" HeaderText="Tipe RDP" />
                <asp:BoundField DataField="cluster" HeaderText="Cluster" />
                <asp:BoundField DataField="nopek" HeaderText="Nopek" />
                <asp:BoundField DataField="employee" HeaderText="Nama Pegawai" />
                <asp:BoundField DataField="keterangan" HeaderText="Keterangan" />
                <asp:TemplateField HeaderText="Bukti" SortExpression="Edit">
                    <ItemTemplate>
                        <a href="#" class="text-decoration-none edit-button">
                            <div class="badge bg-light d-flex align-items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-filetype-jpg" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5zm-4.34 8.132q.114.23.14.492h-.776a.8.8 0 0 0-.097-.249.7.7 0 0 0-.17-.19.7.7 0 0 0-.237-.126 1 1 0 0 0-.299-.044q-.428 0-.665.302-.234.301-.234.85v.498q0 .351.097.615a.9.9 0 0 0 .304.413.87.87 0 0 0 .519.146 1 1 0 0 0 .457-.096.67.67 0 0 0 .272-.264q.09-.164.091-.363v-.255H8.24v-.59h1.576v.798q0 .29-.097.55a1.3 1.3 0 0 1-.293.458 1.4 1.4 0 0 1-.495.313q-.296.111-.697.111a2 2 0 0 1-.753-.132 1.45 1.45 0 0 1-.533-.377 1.6 1.6 0 0 1-.32-.58 2.5 2.5 0 0 1-.105-.745v-.506q0-.543.2-.95.201-.406.582-.633.384-.228.926-.228.357 0 .636.1.28.1.48.275t.314.407ZM0 14.786q0 .246.082.465.083.22.243.39.165.17.407.267.246.093.569.093.63 0 .984-.345.357-.346.358-1.005v-2.725h-.791v2.745q0 .303-.138.466t-.422.164a.5.5 0 0 1-.454-.246.6.6 0 0 1-.073-.27H0Zm4.92-2.86H3.322v4h.791v-1.343h.803q.43 0 .732-.172.305-.177.463-.475.162-.302.161-.677 0-.374-.158-.677a1.2 1.2 0 0 0-.46-.477q-.3-.18-.732-.179Zm.546 1.333a.8.8 0 0 1-.085.381.57.57 0 0 1-.238.24.8.8 0 0 1-.375.082H4.11v-1.406h.66q.327 0 .512.182.185.181.185.521Z"/>
                                </svg>
                                <span class="ms-2 text-black">Bukti</span>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>


            </Columns>
       </asp:GridView>
        
    </div>
</asp:Content>
