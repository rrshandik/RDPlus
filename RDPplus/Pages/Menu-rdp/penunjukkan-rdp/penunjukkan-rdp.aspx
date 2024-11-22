<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="penunjukkan-rdp.aspx.cs" Inherits="RDPplus.Pages.Menu_rdp.penunjukkan_rdp.penunjukkan_rdp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(".table tr:first"))).DataTable();
            $("#<%= DropDownListNopek.ClientID %>").select2();
            

            $(".table-container").hide();

            // aksi klik
            $(".card-header").click(function () {
                $(this).find("img").toggleClass("rotated");
                $(this).next(".table-container").slideToggle();
            });
            // Only one choice checkbox per card
            $('.form-check-input').on('change', function () {
                // Find the closest card element
                const card = $(this).closest('.card');
                const cardId = card.find('.card-header span:first').text().trim();

                if (this.checked) {
                    // Uncheck all other checkboxes within the same card
                    card.find('.form-check-input').not(this).prop('checked', false);

                    // Get the current row and employee name
                    const row = $(this).closest('tr');
                    const employeeName = row.find('td:eq(2)').text();

                    // Store the selected employee for this card
                    selectedEmployees[cardId] = employeeName;
                } else {
                    // Remove the selected employee for this card
                    delete selectedEmployees[cardId];
                }
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- header -->
    <div class="container-fluid px-4"> 
        <!-- header -->
        <div class="page-header">
            <h1 class="page-title">Penunjukkan RDP</h1>
        </div>
        
        <!-- Date badge -->
        <div class="row mb-3">
            <div class="col-md-6">
                <div class="date-badge">
                    <span>
                        <img src="/images/date-icon.png" style="height: 12px; width: 12px; margin-bottom: 2px; margin-right: 10px"/>
                    </span>
                    <asp:Label ID="LabelCurrentDateTime" runat="server"></asp:Label>
                </div>
            </div>
        </div>

        <!-- NOPEK Lookup -->
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label runat="server" CssClass="input-label" />
                    <asp:DropDownList ID="DropDownListNopek" runat="server" CssClass="form-control chosen-select" AutoPostBack="true" OnSelectedIndexChanged="DropDownListNopek_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <!-- Action Panel (Initially Hidden) -->
        <asp:Panel ID="ActionPanel" runat="server" CssClass="row mt-4" Visible="false">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Employee Information</h5>
                        <asp:Label ID="SelectedEmployeeInfo" runat="server" CssClass="mb-3 d-block"></asp:Label>

                        
                    </div>
                </div>
            </div>

            <!-- Gunung Simping -->
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" 
                SelectCommand="SELECT 
                    rdp.id_rdp,
                    rdp.no_rdp,
                    rdp.cluster,
                    area.area AS area,
                    residence.residence AS hunian,
                    keterangan1.keterangan1 as kondisi,
                    status.nama_status AS status,
                    rdp.rt,
                    rdp.rw
                FROM 
                    [RDPlus].[dbo].[rdp] rdp
                JOIN 
                    [RDPlus].[dbo].[area] area ON rdp.id_area = area.id_area
                JOIN 
                    [RDPlus].[dbo].[residence] residence ON rdp.id_residence = residence.id_residence
                JOIN 
                    [RDPlus].[dbo].[status] status ON rdp.id_status = status.id_status
                JOIN
                    [RDPlus].[dbo].[keterangan1] keterangan1 ON rdp.id_keterangan1 = keterangan1.id_ket1
                WHERE
                    status.nama_status = 'Tersedia' and area.area = 'Gunung Simping'">
            </asp:SqlDataSource>

            <!-- Tabel Gunung simping-->
            <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;">
                <div class="card-header d-flex justify-content-between align-items-center" 
         
                    <span style="color: white; font-weight: bold">Gunung Simping</span>
                    <div class="d-flex align-items-center">

                        <asp:Label ID="lblPeriodeLelang" runat="server" Font-Italic="true"></asp:Label>

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
                                  DataSourceID="SqlDataSource1" 
                                  AutoGenerateColumns="False" 
                                  UseAccessibleHeader="True">
                        <Columns>
                            <asp:BoundField DataField="id_rdp" HeaderText="ID RDP" />
                            <asp:BoundField DataField="no_rdp" HeaderText="No RDP" />
                            <asp:BoundField DataField="cluster" HeaderText="Cluster" />
                            <asp:BoundField DataField="area" HeaderText="Area" />
                            <asp:BoundField DataField="hunian" HeaderText="Hunian" />
                            <asp:BoundField DataField="status" HeaderText="Status" />
                            <asp:BoundField DataField="kondisi" HeaderText="Kondisi" />
                            <asp:TemplateField HeaderText="Aksi" SortExpression="Edit">
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-md-3">

                                            <a href="detail-rdp?id=<%# Eval("id_rdp") %>" class="text-decoration-none edit-button" 
                                              data-id='<%# Eval("id_rdp") %>' 
                                              data-toggle="modal" 
                                              data-target="#detailRDP">
                                               <div class="">
                                                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-filetype-pdf" viewBox="0 0 16 16">
                                                      <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5zM1.6 11.85H0v3.999h.791v-1.342h.803q.43 0 .732-.173.305-.175.463-.474a1.4 1.4 0 0 0 .161-.677q0-.375-.158-.677a1.2 1.2 0 0 0-.46-.477q-.3-.18-.732-.179m.545 1.333a.8.8 0 0 1-.085.38.57.57 0 0 1-.238.241.8.8 0 0 1-.375.082H.788V12.48h.66q.327 0 .512.181.185.183.185.522m1.217-1.333v3.999h1.46q.602 0 .998-.237a1.45 1.45 0 0 0 .595-.689q.196-.45.196-1.084 0-.63-.196-1.075a1.43 1.43 0 0 0-.589-.68q-.396-.234-1.005-.234zm.791.645h.563q.371 0 .609.152a.9.9 0 0 1 .354.454q.118.302.118.753a2.3 2.3 0 0 1-.068.592 1.1 1.1 0 0 1-.196.422.8.8 0 0 1-.334.252 1.3 1.3 0 0 1-.483.082h-.563zm3.743 1.763v1.591h-.79V11.85h2.548v.653H7.896v1.117h1.606v.638z"/>
                                                    </svg>
                                               </div>
                                            </a>
                                        </div>
                                        <div class="col-md-3">

                                            <a href="https://localhost:44356/detail-rdp" class="text-decoration-none edit-button" 
                                               <div class="">
                                                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-eye" viewBox="0 0 16 16">
                                                     <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                                     <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                                                   </svg>
                                               </div>
                                            </a>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tawarkan">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <input type="checkbox" class="form-check-input" id='chk_<%# Eval("id_rdp") %>' />
                                    </div>
                                </ItemTemplate>
                    
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <div class="mt-3 d-flex justify-content-end">
                        <asp:Button ID="ProcessButton" runat="server" Text="Process RDP" 
                            CssClass="btn btn-primary" OnClick="ProcessButton_Click" />
                    </div>
                </div>
                <!-- button penyerahan RDP -->
            </div>
        </asp:Panel>
    </div>
  

    
</asp:Content>
