<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="data-rdp.aspx.cs" Inherits="RDPplus.Pages.Menu_rdp.data_rdp.data_rdp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(".table tr:first"))).DataTable();

            //sembunyikan tabel
            $(".table-container").hide();

            // aksi klik
            $(".card-header").click(function () {
                $(this).find("img").toggleClass("rotated");
                $(this).next(".table-container").slideToggle();
            });
        });
    </script>

    <style>
        

        .card-header img {
            transition: transform 0.3s ease;
        }

        .card-header img.rotated {
            transform: rotate(180deg);
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header -->
    <div class="container mt-4">
        <div class="badge bg-light text-dark mb-2">
            <h1 class="page-title">Data RDP</h1>
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

    <%--<div class="row">
        <div class="col-md-6">
            <!--  kiri -->
        </div>

        <div class="col-md-6 d-flex justify-content-end">
            <p class="badge bg-light text-dark">Tambah Data RDP</p>
        </div>
    </div>--%>

    <!-- query gunung simping RDP -->
    <asp:SqlDataSource
        ID="SqlDataSource1"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>"
        SelectCommand="
            SELECT
                rdp.id_rdp,
                area.area AS area,
                rdp.no_rdp,
                rdp.cluster,
                employee.name AS employee,
                employee.nopek AS nopek,
                residence.residence AS hunian,
                status.nama_status AS status,
                rdp.keterangan2 as keterangan
            FROM 
                [RDPlus].[dbo].[rdp] rdp
            JOIN 
                [RDPlus].[dbo].[area] area ON rdp.id_area = area.id_area
            JOIN 
                [RDPlus].[dbo].[residence] residence ON rdp.id_residence = residence.id_residence
            JOIN 
                [RDPlus].[dbo].[status] status ON rdp.id_status = status.id_status
            LEFT JOIN
                [RDPlus].[dbo].[employee] employee ON rdp.id_employee = employee.id_employee 
            WHERE area.area = 'Gunung Simping'"
        OnSelecting="SqlDataSource1_Selecting">
    </asp:SqlDataSource>

    <!-- tabel data rdp gunung simping -->
    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;">
        <div class="card-header d-flex justify-content-between align-items-center" 
     
            <span style="color: white; font-weight: bold">Gunung Simping</span>
            <div class="d-flex align-items-center">
                <span>
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-right: 10px"/>
                </span>
            </div>
        </div>
        <div class="table-container" style=" padding: 0px; border-radius: 10px; margin: 15px;">

            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered text-decoration-none text-dark" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                     <asp:TemplateField HeaderText="action" SortExpression="Edit">
                         <ItemTemplate>
                             <a href="edit-rdp?id=<%# Eval("id_rdp") %>" class="text-decoration-none edit-button" 
                                data-id='<%# Eval("id_rdp") %>' 
                                data-toggle="modal" 
                                data-target="#editRDPModal">
                                <div class="badge bg-light">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                    </svg>
                                </div>
                             
                             </a>
                             <a href="detail-rdp?id=<%# Eval("id_rdp") %>" class="text-decoration-none edit-button" 
                               data-id='<%# Eval("id_rdp") %>' 
                               data-toggle="modal" 
                               data-target="#detailRDP">
                                <div class="badge bg-light">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-eye" viewBox="0 0 16 16">
                                      <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                      <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                                    </svg>
                                </div>

                             </a>
                         </ItemTemplate>
                     </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <!-- query apartemen RDP -->
    <asp:SqlDataSource
        ID="SqlDataSource2"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>"
        SelectCommand="
            SELECT
                rdp.id_rdp,
                area.area AS area,
                rdp.no_rdp,
                rdp.cluster,
                employee.name AS employee,
                employee.nopek AS nopek,
                residence.residence AS hunian,
                status.nama_status AS status,
                rdp.keterangan2 as keterangan
            FROM 
                [RDPlus].[dbo].[rdp] rdp
            JOIN 
                [RDPlus].[dbo].[area] area ON rdp.id_area = area.id_area
            JOIN 
                [RDPlus].[dbo].[residence] residence ON rdp.id_residence = residence.id_residence
            JOIN 
                [RDPlus].[dbo].[status] status ON rdp.id_status = status.id_status
            LEFT JOIN
                [RDPlus].[dbo].[employee] employee ON rdp.id_employee = employee.id_employee 
            WHERE area.area = 'Apartemen'"
        OnSelecting="SqlDataSource1_Selecting">
    </asp:SqlDataSource>

    <!-- tabel data rdp apartemen -->
    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;">
        <div class="card-header d-flex justify-content-between align-items-center" 
 
            <span style="color: white; font-weight: bold">Apartemen</span>
            <div class="d-flex align-items-center">
                <span>
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-right: 10px"/>
                </span>
            </div>
        </div>
        <div class="table-container" style=" padding: 0px; border-radius: 10px; margin: 15px;">

            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" CssClass="table table-striped table-bordered text-decoration-none text-dark" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" UseAccessibleHeader="False">
                <Columns>
                     <asp:TemplateField HeaderText="action" SortExpression="Edit">
                         <ItemTemplate>
                             <a href="edit-rdp?id=<%# Eval("id_rdp") %>" class="text-decoration-none edit-button" 
                                data-id='<%# Eval("id_rdp") %>' 
                                data-toggle="modal" 
                                data-target="#editRDPModal">
                                <div class="badge bg-light">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                    </svg>
                                </div>
                         
                             </a>
                             <a href="detail-rdp?id=<%# Eval("id_rdp") %>" class="text-decoration-none edit-button" 
                               data-id='<%# Eval("id_rdp") %>' 
                               data-toggle="modal" 
                               data-target="#detailRDP">
                                <div class="badge bg-light">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-eye" viewBox="0 0 16 16">
                                      <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                      <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                                    </svg>
                                </div>

                             </a>
                         </ItemTemplate>
                     </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <!-- styling-->
    <style>
        .card-header {
            cursor: pointer; 
            background-color: #358DC7; 
            padding: 10px; 
            border-top-right-radius: 15px; 
            border-top-left-radius: 15px;
            position: relative; /* Ensures the header stays on top */
            z-index: 2;
        }
    </style>
</asp:Content>
