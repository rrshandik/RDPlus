<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="lelang-rdp.aspx.cs" Inherits="RDPplus.Pages.Menu_rdp.lelang_rdp.lelang_rdp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             // Find the first row and wrap it inside thead, if not already present
             if ($(".table thead").length === 0) {
                 $(".table").prepend($("<thead></thead>").append($(".table tr:first")));
             }

             // Initialize DataTable after table structure is correct
             $(".table").DataTable();

             // Hide the table container initially
             $(".table-container").hide();

             // Toggle table visibility on header click
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
     <!-- header -->
     <div class="container mt-4">
         <div class="badge bg-light text-dark mb-2">
             <h1 class="page-title">RDP Lelang</h1>
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
    <!-- Button Penyerahan Kunci -->
            <button class="btn btn-danger ms-auto " style ="border-radius: 15px; width: 300px; font-size: 18px">
                Penyerahan Kunci
            </button>
        </div>
    </div>


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
    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;" >
        <div class="card-header d-flex justify-content-between align-items-center" 
     
            <span style="color: white; font-weight: bold">Gunung Simping</span>
            <div class="d-flex align-items-center">
                <span>
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-right: 10px"/>
                </span>
            </div>
        </div>
        <div class="table-container" style=" padding: 0px; border-radius: 10px; margin: 15px;">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" SelectCommand="SELECT [name], [nopek], [id_employee] FROM [employee]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_employee" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered text-decoration-none text-dark">
                <Columns>
                    <asp:BoundField DataField="id_employee" HeaderText="id_employee" ReadOnly="True" InsertVisible="False" SortExpression="id_employee"></asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
                    <asp:BoundField DataField="nopek" HeaderText="nopek" SortExpression="nopek"></asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;" >
        <div class="card-header d-flex justify-content-between align-items-center" 
 
            <span style="color: white; font-weight: bold">Donan</span>
            <div class="d-flex align-items-center">
                <span>
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-right: 10px"/>
                </span>
            </div>
        </div>
        <div class="table-container" style=" padding: 0px; border-radius: 10px; margin: 15px;">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_employee" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered text-decoration-none text-dark">
                <Columns>
                    <asp:BoundField DataField="id_employee" HeaderText="id_employee" ReadOnly="True" InsertVisible="False" SortExpression="id_employee"></asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
                    <asp:BoundField DataField="nopek" HeaderText="nopek" SortExpression="nopek"></asp:BoundField>
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