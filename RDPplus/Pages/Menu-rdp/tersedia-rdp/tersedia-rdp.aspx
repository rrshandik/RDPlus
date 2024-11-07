<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="tersedia-rdp.aspx.cs" Inherits="RDPplus.Pages.Menu_rdp.tersedia_rdp.tersedia_rdp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(".table tr:first"))).DataTable();


             $(".table-container").hide();

             // aksi klik
             $(".card-header").click(function () {
                 $(this).find("img").toggleClass("rotated");
                 $(this).next(".table-container").slideToggle();
             });

             // Initialize datepickers
             $('.datepicker').datepicker({
                 format: 'dd/mm/yyyy',
                 autoclose: true,
                 todayHighlight: true,
                 startDate: new Date()
             });

             // Event handler untuk tombol Set Durasi Lelang
             $("button.btn-light").click(function () {
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
            
            <button class="btn btn-light ms-auto">
                <span>
                    <img src="/images/date-icon.png" style="height: 12px; width: 12px; margin-bottom: 2px; margin-right: 10px"/>
                </span>
                Set Durasi Lelang

            </button>
        </div>
    </div>

   <%-- <div class="container" >
        <div class="badge bg-light text-dark" style="margin-left: 0px">

            <span style="color: black; margin-right: 10px; font-style: italic">Periode Lelang:<asp:Label ID="lblPeriodeLelang" runat="server"></asp:Label></span>
        </div>
    </div>--%>


    <!-- Modal -->
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
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-right: 10px"/>
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
                    <asp:BoundField DataField="rt" HeaderText="RT" />
                    <asp:BoundField DataField="rw" HeaderText="RW" />
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
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-right: 10px"/>
                </span>
            </div>
        </div>

        <div class="table-container" style="padding: 20px; border-radius: 10px; margin: 15px;">
           <asp:GridView ID="GridView2" runat="server" CssClass="table table-striped table-bordered text-decoration-none text-dark" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" UseAccessibleHeader="False">
                <Columns>
                    <asp:BoundField DataField="id_rdp" HeaderText="ID RDP" />
                    <asp:BoundField DataField="no_rdp" HeaderText="No RDP" />
                    <asp:BoundField DataField="cluster" HeaderText="Cluster" />
                    <asp:BoundField DataField="area" HeaderText="Area" />
                    <asp:BoundField DataField="hunian" HeaderText="Hunian" />
                    <asp:BoundField DataField="status" HeaderText="Status" />
                    <asp:BoundField DataField="kondisi" HeaderText="Kondisi" />
                    <asp:BoundField DataField="rt" HeaderText="RT" />
                    <asp:BoundField DataField="rw" HeaderText="RW" />
                </Columns>
            </asp:GridView>

        </div>

    </div>

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
