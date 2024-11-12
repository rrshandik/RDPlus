<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="am-data-rdp.aspx.cs" Inherits="RDPplus.Pages.AM.AM_menu_rdp.am_data_rdp.am_data_rdp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            //$(".table").prepend($("<thead></thead>").append($(".table tr:first"))).DataTable();

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

        .card-header {
            cursor: pointer; 
            background-color: #358DC7; 
            padding: 10px; 
            border-top-right-radius: 15px; 
            border-top-left-radius: 15px;
            position: relative; 
            z-index: 2;
        }
        .btn-lelang {
            background-color: #A6D051;
        }
        .table {
            background-color: #EDFFC3;
        }

        .table thead th {
            background-color: black;
            color: white;
            font-weight: bold;
            text-align: center;
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

    <!-- table gunung simping -->
    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;">
        <div class="card-header d-flex justify-content-between align-items-center" 
     
            <span style="color: white; font-weight: bold">Gunung Simping</span>
            <div class="d-flex align-items-center">
    
                <span>
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-right: 10px; margin-left: 10px"/>
                </span>
            </div>
        </div>
        <div class="table-container" 
             style="background-color: #f8f9fa; 
                    padding: 20px; 
                    border-radius: 15px; 
                    margin: 0;
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
                            <asp:Label ID="lblRowNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="alamat" HeaderText="Alamat" />
                    <asp:BoundField DataField="no_rdp" HeaderText="No RDP" />
                    <asp:BoundField DataField="tipe" HeaderText="Tipe" />
                    <asp:BoundField DataField="cluster" HeaderText="Cluster" />
                    <asp:BoundField DataField="nopek" HeaderText="Nopek" />
                    <asp:BoundField DataField="employee" HeaderText="Nama" />
                    <asp:BoundField DataField="kondisi" HeaderText="Kondisi" />
                    <asp:BoundField DataField="status" HeaderText="Status RDP" />
                    <asp:BoundField DataField="keterangan" HeaderText="Keterangan" />
                    <asp:TemplateField HeaderText="Action" SortExpression="Edit">
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-2">
                                <a href="edit-rdp?id=<%# Eval("id_rdp") %>" 
                                   class="btn btn-light btn-sm p-1" 
                                   data-id='<%# Eval("id_rdp") %>' 
                                   data-toggle="modal" 
                                   data-target="#editRDPModal">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                    </svg>
                                </a>
                                <a href="detail-rdp?id=<%# Eval("id_rdp") %>" 
                                   class="btn btn-light btn-sm p-1" 
                                   data-id='<%# Eval("id_rdp") %>' 
                                   data-toggle="modal" 
                                   data-target="#detailRDP">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                        <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                        <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                                    </svg>
                                </a>
                                <a href="#" class="btn btn-light btn-sm p-1">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-filetype-pdf" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5zM1.6 11.85H0v3.999h.791v-1.342h.803q.43 0 .732-.173.305-.175.463-.474a1.4 1.4 0 0 0 .161-.677q0-.375-.158-.677a1.2 1.2 0 0 0-.46-.477q-.3-.18-.732-.179m.545 1.333a.8.8 0 0 1-.085.38.57.57 0 0 1-.238.241.8.8 0 0 1-.375.082H.788V12.48h.66q.327 0 .512.181.185.183.185.522m1.217-1.333v3.999h1.46q.602 0 .998-.237a1.45 1.45 0 0 0 .595-.689q.196-.45.196-1.084 0-.63-.196-1.075a1.43 1.43 0 0 0-.589-.68q-.396-.234-1.005-.234zm.791.645h.563q.371 0 .609.152a.9.9 0 0 1 .354.454q.118.302.118.753a2.3 2.3 0 0 1-.068.592 1.1 1.1 0 0 1-.196.422.8.8 0 0 1-.334.252 1.3 1.3 0 0 1-.483.082h-.563zm3.743 1.763v1.591h-.79V11.85h2.548v.653H7.896v1.117h1.606v.638z"/>
                                    </svg>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tinjau">
                        <ItemTemplate>
                            <div class="text-center">
                                <input type="checkbox" class="form-check-input" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="col-md-6 d-flex justify-content-end ms-auto">
                <button type="button" class="btn-lelang" onclick="showTersediaConfirmation(this)" 
                    style="border-radius: 15px; margin: 10px; width: 400px; height: 40px; color: white; border: none">
                    Nyatakan RDP Tersedia
                </button>
            </div>
        </div>
    </div>

    <!-- tabel donan -->
    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;">
        <div class="card-header d-flex justify-content-between align-items-center" 
 
            <span style="color: white; font-weight: bold">Donan</span>
            <div class="d-flex align-items-center">

                <span>
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-right: 10px; margin-left: 10px"/>
                </span>
            </div>
        </div>
        <div class="table-container" 
             style="background-color: #f8f9fa; 
                    padding: 20px; 
                    border-radius: 15px; 
                    margin: 0;
                    position: relative;
                    z-index: 1;">
            <asp:GridView ID="GridView2" runat="server" 
                CssClass="table table-striped table-bordered text-decoration-none text-dark" 
                AutoGenerateColumns="False" 
                UseAccessibleHeader="True">
                <Columns>
                    <asp:TemplateField HeaderText="No">
                        <ItemTemplate>
                            <asp:Label ID="lblRowNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="alamat" HeaderText="Alamat" />
                    <asp:BoundField DataField="no_rdp" HeaderText="No RDP" />
                    <asp:BoundField DataField="tipe" HeaderText="Tipe" />
                    <asp:BoundField DataField="cluster" HeaderText="Cluster" />
                    <asp:BoundField DataField="nopek" HeaderText="Nopek" />
                    <asp:BoundField DataField="employee" HeaderText="Nama" />
                    <asp:BoundField DataField="kondisi" HeaderText="Kondisi" />
                    <asp:BoundField DataField="status" HeaderText="Status RDP" />
                    <asp:BoundField DataField="keterangan" HeaderText="Keterangan" />
                    <asp:TemplateField HeaderText="Action" SortExpression="Edit">
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-2">
                                <a href="edit-rdp?id=<%# Eval("id_rdp") %>" 
                                   class="btn btn-light btn-sm p-1" 
                                   data-id='<%# Eval("id_rdp") %>' 
                                   data-toggle="modal" 
                                   data-target="#editRDPModal">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                    </svg>
                                </a>
                                <a href="detail-rdp?id=<%# Eval("id_rdp") %>" 
                                   class="btn btn-light btn-sm p-1" 
                                   data-id='<%# Eval("id_rdp") %>' 
                                   data-toggle="modal" 
                                   data-target="#detailRDP">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                        <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                        <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                                    </svg>
                                </a>
                                <a href="#" class="btn btn-light btn-sm p-1">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-filetype-pdf" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5zM1.6 11.85H0v3.999h.791v-1.342h.803q.43 0 .732-.173.305-.175.463-.474a1.4 1.4 0 0 0 .161-.677q0-.375-.158-.677a1.2 1.2 0 0 0-.46-.477q-.3-.18-.732-.179m.545 1.333a.8.8 0 0 1-.085.38.57.57 0 0 1-.238.241.8.8 0 0 1-.375.082H.788V12.48h.66q.327 0 .512.181.185.183.185.522m1.217-1.333v3.999h1.46q.602 0 .998-.237a1.45 1.45 0 0 0 .595-.689q.196-.45.196-1.084 0-.63-.196-1.075a1.43 1.43 0 0 0-.589-.68q-.396-.234-1.005-.234zm.791.645h.563q.371 0 .609.152a.9.9 0 0 1 .354.454q.118.302.118.753a2.3 2.3 0 0 1-.068.592 1.1 1.1 0 0 1-.196.422.8.8 0 0 1-.334.252 1.3 1.3 0 0 1-.483.082h-.563zm3.743 1.763v1.591h-.79V11.85h2.548v.653H7.896v1.117h1.606v.638z"/>
                                    </svg>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tinjau">
                        <ItemTemplate>
                            <div class="text-center">
                                <input type="checkbox" class="form-check-input" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="col-md-6 d-flex justify-content-end ms-auto">
                <button type="button" class="btn-lelang" onclick="showTersediaConfirmation(this)" 
                    style="border-radius: 15px; margin: 10px; width: 400px; height: 40px; color: white; border: none">
                    Nyatakan RDP Tersedia
                </button>
            </div>
        </div>
    </div>

    <!-- tabel sidareja -->
    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;">
        <div class="card-header d-flex justify-content-between align-items-center" 
 
            <span style="color: white; font-weight: bold">Sidareja</span>
            <div class="d-flex align-items-center">

                <span>
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-right: 10px; margin-left: 10px"/>
                </span>
            </div>
        </div>
        <div class="table-container" 
             style="background-color: #f8f9fa; 
                    padding: 20px; 
                    border-radius: 15px; 
                    margin: 0;
                    position: relative;
                    z-index: 1;">
            <asp:GridView ID="GridView3" runat="server" 
                CssClass="table table-striped table-bordered text-decoration-none text-dark" 
                AutoGenerateColumns="False" 
                UseAccessibleHeader="True">
                <Columns>
                    <asp:TemplateField HeaderText="No">
                        <ItemTemplate>
                            <asp:Label ID="lblRowNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="alamat" HeaderText="Alamat" />
                    <asp:BoundField DataField="no_rdp" HeaderText="No RDP" />
                    <asp:BoundField DataField="tipe" HeaderText="Tipe" />
                    <asp:BoundField DataField="cluster" HeaderText="Cluster" />
                    <asp:BoundField DataField="nopek" HeaderText="Nopek" />
                    <asp:BoundField DataField="employee" HeaderText="Nama" />
                    <asp:BoundField DataField="kondisi" HeaderText="Kondisi" />
                    <asp:BoundField DataField="status" HeaderText="Status RDP" />
                    <asp:BoundField DataField="keterangan" HeaderText="Keterangan" />
                    <asp:TemplateField HeaderText="Action" SortExpression="Edit">
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-2">
                                <a href="edit-rdp?id=<%# Eval("id_rdp") %>" 
                                   class="btn btn-light btn-sm p-1" 
                                   data-id='<%# Eval("id_rdp") %>' 
                                   data-toggle="modal" 
                                   data-target="#editRDPModal">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                    </svg>
                                </a>
                                <a href="detail-rdp?id=<%# Eval("id_rdp") %>" 
                                   class="btn btn-light btn-sm p-1" 
                                   data-id='<%# Eval("id_rdp") %>' 
                                   data-toggle="modal" 
                                   data-target="#detailRDP">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                        <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                        <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                                    </svg>
                                </a>
                                <a href="#" class="btn btn-light btn-sm p-1">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-filetype-pdf" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5zM1.6 11.85H0v3.999h.791v-1.342h.803q.43 0 .732-.173.305-.175.463-.474a1.4 1.4 0 0 0 .161-.677q0-.375-.158-.677a1.2 1.2 0 0 0-.46-.477q-.3-.18-.732-.179m.545 1.333a.8.8 0 0 1-.085.38.57.57 0 0 1-.238.241.8.8 0 0 1-.375.082H.788V12.48h.66q.327 0 .512.181.185.183.185.522m1.217-1.333v3.999h1.46q.602 0 .998-.237a1.45 1.45 0 0 0 .595-.689q.196-.45.196-1.084 0-.63-.196-1.075a1.43 1.43 0 0 0-.589-.68q-.396-.234-1.005-.234zm.791.645h.563q.371 0 .609.152a.9.9 0 0 1 .354.454q.118.302.118.753a2.3 2.3 0 0 1-.068.592 1.1 1.1 0 0 1-.196.422.8.8 0 0 1-.334.252 1.3 1.3 0 0 1-.483.082h-.563zm3.743 1.763v1.591h-.79V11.85h2.548v.653H7.896v1.117h1.606v.638z"/>
                                    </svg>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tinjau">
                        <ItemTemplate>
                            <div class="text-center">
                                <input type="checkbox" class="form-check-input" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="col-md-6 d-flex justify-content-end ms-auto">
                <button type="button" class="btn-lelang" onclick="showTersediaConfirmation(this)" 
                    style="border-radius: 15px; margin: 10px; width: 400px; height: 40px; color: white; border: none">
                    Nyatakan RDP Tersedia
                </button>
            </div>
        </div>
    </div>

    <!-- tabel apartemen -->
    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;">
        <div class="card-header d-flex justify-content-between align-items-center" 
 
            <span style="color: white; font-weight: bold">Apartemen</span>
            <div class="d-flex align-items-center">

                <span>
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-right: 10px; margin-left: 10px"/>
                </span>
            </div>
        </div>
        <div class="table-container" 
             style="background-color: #f8f9fa; 
                    padding: 20px; 
                    border-radius: 15px; 
                    margin: 0;
                    position: relative;
                    z-index: 1;">
            <asp:GridView ID="GridView4" runat="server" 
                CssClass="table table-striped table-bordered text-decoration-none text-dark" 
                AutoGenerateColumns="False" 
                UseAccessibleHeader="True">
                <Columns>
                    <asp:TemplateField HeaderText="No">
                        <ItemTemplate>
                            <asp:Label ID="lblRowNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="alamat" HeaderText="Alamat" />
                    <asp:BoundField DataField="no_rdp" HeaderText="No RDP" />
                    <asp:BoundField DataField="tipe" HeaderText="Tipe" />
                    <asp:BoundField DataField="cluster" HeaderText="Cluster" />
                    <asp:BoundField DataField="nopek" HeaderText="Nopek" />
                    <asp:BoundField DataField="employee" HeaderText="Nama" />
                    <asp:BoundField DataField="kondisi" HeaderText="Kondisi" />
                    <asp:BoundField DataField="status" HeaderText="Status RDP" />
                    <asp:BoundField DataField="keterangan" HeaderText="Keterangan" />
                    <asp:TemplateField HeaderText="Action" SortExpression="Edit">
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-2">
                                <a href="edit-rdp?id=<%# Eval("id_rdp") %>" 
                                   class="btn btn-light btn-sm p-1" 
                                   data-id='<%# Eval("id_rdp") %>' 
                                   data-toggle="modal" 
                                   data-target="#editRDPModal">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                    </svg>
                                </a>
                                <a href="detail-rdp?id=<%# Eval("id_rdp") %>" 
                                   class="btn btn-light btn-sm p-1" 
                                   data-id='<%# Eval("id_rdp") %>' 
                                   data-toggle="modal" 
                                   data-target="#detailRDP">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                        <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                        <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                                    </svg>
                                </a>
                                <a href="#" class="btn btn-light btn-sm p-1">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-filetype-pdf" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5zM1.6 11.85H0v3.999h.791v-1.342h.803q.43 0 .732-.173.305-.175.463-.474a1.4 1.4 0 0 0 .161-.677q0-.375-.158-.677a1.2 1.2 0 0 0-.46-.477q-.3-.18-.732-.179m.545 1.333a.8.8 0 0 1-.085.38.57.57 0 0 1-.238.241.8.8 0 0 1-.375.082H.788V12.48h.66q.327 0 .512.181.185.183.185.522m1.217-1.333v3.999h1.46q.602 0 .998-.237a1.45 1.45 0 0 0 .595-.689q.196-.45.196-1.084 0-.63-.196-1.075a1.43 1.43 0 0 0-.589-.68q-.396-.234-1.005-.234zm.791.645h.563q.371 0 .609.152a.9.9 0 0 1 .354.454q.118.302.118.753a2.3 2.3 0 0 1-.068.592 1.1 1.1 0 0 1-.196.422.8.8 0 0 1-.334.252 1.3 1.3 0 0 1-.483.082h-.563zm3.743 1.763v1.591h-.79V11.85h2.548v.653H7.896v1.117h1.606v.638z"/>
                                    </svg>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tinjau">
                        <ItemTemplate>
                            <div class="text-center">
                                <input type="checkbox" class="form-check-input" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="col-md-6 d-flex justify-content-end ms-auto">
                <button type="button" class="btn-lelang" onclick="showTersediaConfirmation(this)" 
                    style="border-radius: 15px; margin: 10px; width: 400px; height: 40px; color: white; border: none">
                    Nyatakan RDP Tersedia
                </button>
            </div>
        </div>
    </div>
    <!-- script js confirmation -->
    <script type="text/javascript">
        function showTersediaConfirmation() {
            Swal.fire({
                title: 'Selesaikan Tinjauan?',
                text: "Apakah anda yakin ingin menyatakan RDP ini layak ini?",
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ya!',
                cancelButtonText: 'Batal'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: 'Berhasil!',
                        text: 'Data telah diperbarui',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            //window.location.href = '/Pages/Home/Home.aspx';
                        }
                    });
                }
            });
        }
    </script>
   
</asp:Content>
