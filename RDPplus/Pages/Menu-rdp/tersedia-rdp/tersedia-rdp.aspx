<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="tersedia-rdp.aspx.cs" Inherits="RDPplus.Pages.Menu_rdp.tersedia_rdp.tersedia_rdp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

     <script type="text/javascript">
         $(document).ready(function () {
             //$(".table").prepend($("<thead></thead>").append($(".table tr:first"))).DataTable();


             $(".table-container").hide();

             // aksi klik
             $(".card-header").click(function () {
                 $(this).find("img").toggleClass("rotated");
                 $(this).next(".table-container").slideToggle();
             });

             // datepickers
             $('.datepicker').datepicker({
                 format: 'dd/mm/yyyy',
                 autoclose: true,
                 todayHighlight: true,
                 startDate: new Date()
             });

             // Event handler untuk tombol Set Durasi Lelang
             $("button.btn-durasi").click(function () {
                 $("#durasiLelangModal").modal('show');
             });

             // Handle start date change
             $("#startDate").change(function () {
                 var startDate = $(this).datepicker('getDate');
                 $("#endDate").datepicker('setStartDate', startDate);
                 validateDates();
             });

             // Handle end date change
             $("#endDate").change(function () {
                 validateDates();
             });

             // Save button handler
             $("#saveDurasiBtn").click(function () {
                 if (validateDates()) {
                     var startDate = $("#startDate").val();
                     var endDate = $("#endDate").val();

                     // Make AJAX call to save dates
                     $.ajax({
                         type: "POST",
                         url: "tersedia-rdp.aspx/SaveAuctionPeriod",
                         data: JSON.stringify({
                             startDate: startDate,
                             endDate: endDate
                         }),
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (response) {
                             if (response.d === "success") {
                                 alert("Periode lelang berhasil disimpan!");
                                 $("#durasiLelangModal").modal('hide');
                                 // Optionally reload the page or update the UI
                                 location.reload();
                             } else {
                                 alert("Gagal menyimpan periode lelang: " + response.d);
                             }
                         },
                         error: function (xhr, status, error) {
                             alert("Terjadi kesalahan: " + error);
                         }
                     });
                 }
             });

             // Validate dates function
             function validateDates() {
                 var startDate = $("#startDate").datepicker('getDate');
                 var endDate = $("#endDate").datepicker('getDate');
                 var isValid = true;

                 if (!startDate) {
                     $("#startDateFeedback").show();
                     isValid = false;
                 } else {
                     $("#startDateFeedback").hide();
                 }

                 if (!endDate) {
                     $("#endDateFeedback").text('Harap pilih tanggal selesai');
                     $("#endDateFeedback").show();
                     isValid = false;
                 } else if (startDate && endDate <= startDate) {
                     $("#endDateFeedback").text('Tanggal selesai harus setelah tanggal mulai');
                     $("#endDateFeedback").show();
                     isValid = false;
                 } else {
                     $("#endDateFeedback").hide();
                 }

                 return isValid;
             }
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

     <!-- header -->
     <div class="container mt-4">
         <div class="badge bg-light text-dark mb-2">
             <h1 class="page-title">RDP Tersedia</h1>
         </div>
     </div>

     <div class="row" style="margin-left: 3px">
        <div class="col-md-6">
            <div class="badge bg-light text-dark mt-2" style="margin-left: 8px">
                <span>
                    <img src="/images/date-icon.png" style="height: 12px; width: 12px; margin-bottom: 2px; margin-right: 10px"/>
                </span>
                <asp:Label ID="LabelCurrentDateTime" runat="server"></asp:Label>
            </div>
        </div>
        <div class="col-md-6 d-flex justify-content-end">
            <button class="btn btn-durasi" style="background-color: #358DC7; color: white; border: none;">
                Set Durasi Lelang
            </button>
            <a class="btn ms-2" style="background-color: #358DC7; color: white; border: none;" href="/penunjukkan-rdp">
                Penunjukkan RDP
            </a>
        </div>

    </div>


    <div class="modal fade" id="durasiLelangModal" tabindex="-1" aria-labelledby="durasiLelangModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="durasiLelangModalLabel">Atur Periode Lelang</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="durasiLelangForm">
                        <div class="mb-3">
                            <label for="startDate" class="form-label">Tanggal Mulai</label>
                            <input type="text" class="form-control datepicker" id="startDate" required autocomplete="off">
                            <div class="invalid-feedback" id="startDateFeedback">
                                Harap pilih tanggal mulai
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="endDate" class="form-label">Tanggal Selesai</label>
                            <input type="text" class="form-control datepicker" id="endDate" required autocomplete="off">
                            <div class="invalid-feedback" id="endDateFeedback">
                                Harap pilih tanggal selesai
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                    <button type="button" class="btn btn-primary" id="saveDurasiBtn">Simpan</button>
                </div>
            </div>
        </div>
    </div>

    <!-- tanggal periode lelang -->
    <asp:SqlDataSource ID="SqlDataSourcePeriodeLelang" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" 
        SelectCommand="SELECT TOP 1 start_date, end_date FROM periode_lelang order by created_at desc">
    </asp:SqlDataSource>


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
                <span style="color: #FFF16E; font-weight: lighter; margin-right: 10px; font-style: italic">Periode Lelang:</span>

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
        </div>
    </div>

    <!-- Apart -->
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" 
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
            status.nama_status = 'Tersedia' and area.area = 'Apartemen'">
    </asp:SqlDataSource>

    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;">
        <div class="card-header d-flex justify-content-between align-items-center" 
     
            <span style="color: white; font-weight: bold">Apartemen</span>
            <div class="d-flex align-items-center">
                <span style="color: #FFF16E; font-weight: lighter; margin-right: 10px; font-style: italic">Periode Lelang:</span>
                <asp:Label ID="lblPeriodeLelang2" runat="server" Font-Italic="true"></asp:Label>

                <span>
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-right: 10px;  margin-left: 10px"/>
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
                           DataSourceID="SqlDataSource2" 
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
         </div>

    </div>

    <!-- Sidareja -->
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" 
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
            status.nama_status = 'Tersedia' and area.area = 'Sidareja'">
    </asp:SqlDataSource>

    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;">
        <div class="card-header d-flex justify-content-between align-items-center" 
         
            <span style="color: white; font-weight: bold">Sidareja</span>
            <div class="d-flex align-items-center">
                <span style="color: #FFF16E; font-weight: lighter; margin-right: 10px; font-style: italic">Periode Lelang:</span>

                <asp:Label ID="lblPeriodeLelang3" runat="server" Font-Italic="true"></asp:Label>

                <span>
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-right: 10px;  margin-left: 10px"/>
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
                          DataSourceID="SqlDataSource3" 
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
        </div>
    </div>

    <!-- Donan -->
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" 
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
            status.nama_status = 'Tersedia' and area.area = 'Donan'">
    </asp:SqlDataSource>

    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;">
        <div class="card-header d-flex justify-content-between align-items-center" 
     
            <span style="color: white; font-weight: bold">Donan</span>
            <div class="d-flex align-items-center">
                <span style="color: #FFF16E; font-weight: lighter; margin-right: 10px; font-style: italic">Periode Lelang:</span>

                <asp:Label ID="lblPeriodeLelang4" runat="server" Font-Italic="true"></asp:Label>

                <span>
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-right: 10px;  margin-left: 10px"/>
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
                          DataSourceID="SqlDataSource4" 
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
        </div>
    </div>

    <!-- button-->
    <div class="col-md-6 d-flex justify-content-end ms-auto">
        <button type="button" class="btn-lelang" onclick="showLelangConfirmation()" 
            style="border-radius: 15px; margin: 10px; width: 400px; height: 40px; color: white; border: none">
            Buka Lelang
        </button>
    </div>
    <script type="text/javascript">
            function showLelangConfirmation() {
                Swal.fire({
                    title: 'Buka Lelang?',
                    text: "Apakah anda yakin ingin membuka lelang ini?",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Ya, Buka!',
                    cancelButtonText: 'Batal'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire({
                            title: 'Berhasil!',
                            text: 'Lelang telah dibuka',
                            icon: 'success',
                            confirmButtonText: 'OK'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = '/Pages/Home/Home.aspx'; 
                            }
                        });
                    }
                });
            }
    </script>
    <style>
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

    </style>


</asp:Content>
