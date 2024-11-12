<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="penyerahan-kunci.aspx.cs" Inherits="RDPplus.Pages.Menu_rdp.penyerahan_kunci_rdp.penyerahan_kunci" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- js -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
     <script type="text/javascript">
         // Declare selectedEmployees object to track winners for each card
         let selectedEmployees = {};

         $(document).ready(function () {
             $(".table").each(function () {
                 if ($(this).find("thead").length === 0) {
                     $(this).prepend($("<thead></thead>").append($(this).find("tr:first")));
                 }
             });

             // Hide the table containers initially
             $(".table-container").hide();

             // Toggle table visibility on header click
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

         function showLelangConfirmation(button) {
             // Find the card that contains the clicked button
             const card = $(button).closest('.card');
             const cardId = card.find('.card-header span:first').text().trim();
             const selectedEmployee = selectedEmployees[cardId];

             if (!selectedEmployee) {
                 Swal.fire({
                     icon: 'error',
                     title: 'Oops...',
                     text: `Please select a winner for ${cardId} first!`
                 });
                 return;
             }

             Swal.fire({
                 title: 'Confirm Winner',
                 text: `Are you sure you want to declare ${selectedEmployee} as the winner?`,
                 icon: 'question',
                 showCancelButton: true,
                 confirmButtonColor: '#A6D051',
                 cancelButtonColor: '#d33',
                 confirmButtonText: 'Yes, declare winner!',
                 cancelButtonText: 'Cancel'
             }).then((result) => {
                 if (result.isConfirmed) {
                     // Update the status text for this specific card
                     const statusSpan = card.find('.lelang-status, .lelang-status2');
                     statusSpan.text(`Melalui Pelelangan: ${selectedEmployee}`);

                     // Show success message
                     Swal.fire(
                         'Success!',
                         `${selectedEmployee} has been declared as the winner!`,
                         'success'
                     );
                 }
             });
         }
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
             <h1 class="page-title">Penyerahan Kunci RDP</h1>
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
    </div>

    <!-- tabel 1 -->
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" 
        SelectCommand="SELECT TOP (5) 
            lelang.id_lelang,
            lelang.id_employee,
            employee.name,
            employee.nopek,
            employee.points,
            lelang.created_at,
            lelang.choice
            FROM RDPlus.dbo.lelang AS lelang
            JOIN RDPlus.dbo.employee AS employee
            ON lelang.id_employee = employee.id_employee
            order by employee.points desc">
    </asp:SqlDataSource>
    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;">
        <div class="card-header d-flex justify-content-between align-items-center" 
         
            <span style="color: white; font-weight: bold">Gunung Simping GS. 403</span>
            <div class="d-flex align-items-center">
            <span class="lelang-status" style="color: #FFF16E; font-weight: lighter; margin-right: 10px; font-style: italic">Melalui Pelelangan: (not set)</span>

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
                          UseAccessibleHeader="True"
                          OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Rank">
                        <ItemTemplate>
                            <asp:Label ID="lblRowNumber" runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_employee" HeaderText="id_employee" />
                    <asp:BoundField DataField="name" HeaderText="Name" />
                    <asp:BoundField DataField="nopek" HeaderText="Nopek" />
                    <asp:BoundField DataField="points" HeaderText="Poin" />
                    <asp:BoundField DataField="choice" HeaderText="Pilihan Ke-" />
                    <asp:BoundField DataField="created_at" HeaderText="Tanggal Pesan" />
                    <asp:TemplateField HeaderText="Aksi">
                        <ItemTemplate>
                            <div class="text-center">
                                <input type="checkbox" class="form-check-input" id='chk_<%# Eval("id_employee") %>' />
                            </div>
                        </ItemTemplate>
                    
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="col-md-6 d-flex justify-content-end ms-auto">
                <button type="button" class="btn-lelang" onclick="showLelangConfirmation(this)" 
                    style="border-radius: 15px; margin: 10px; width: 400px; height: 40px; color: white; border: none">
                    Nyatakan Pemenang
                </button>
            </div>
        </div>
    </div>

    <!-- tabel 2 -->
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" 
        SelectCommand="SELECT TOP (5) 
            lelang.id_lelang,
            lelang.id_employee,
            employee.name,
            employee.nopek,
            employee.points,
            lelang.created_at,
            lelang.choice
            FROM RDPlus.dbo.lelang AS lelang
            JOIN RDPlus.dbo.employee AS employee
            ON lelang.id_employee = employee.id_employee
            order by employee.points desc">
    </asp:SqlDataSource>
    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;">
        <div class="card-header d-flex justify-content-between align-items-center" 
     
            <span style="color: white; font-weight: bold">Apartemen A211</span>
            <div class="d-flex align-items-center">
            <span class="lelang-status2" style="color: #FFF16E; font-weight: lighter; margin-right: 10px; font-style: italic">Melalui Pelelangan: (not set)</span>

                <asp:Label ID="Label1" runat="server" Font-Italic="true"></asp:Label>

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
                          DataSourceID="SqlDataSource2" 
                          AutoGenerateColumns="False" 
                          UseAccessibleHeader="True"
                          OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Rank">
                        <ItemTemplate>
                            <asp:Label ID="lblRowNumber" runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_employee" HeaderText="id_employee" />
                    <asp:BoundField DataField="name" HeaderText="Name" />
                    <asp:BoundField DataField="nopek" HeaderText="Nopek" />
                    <asp:BoundField DataField="points" HeaderText="Poin" />
                    <asp:BoundField DataField="choice" HeaderText="Pilihan Ke-" />
                    <asp:BoundField DataField="created_at" HeaderText="Tanggal Pesan" />
                    <asp:TemplateField HeaderText="Aksi">
                        <ItemTemplate>
                            <div class="text-center">
                                <input type="checkbox" class="form-check-input" id='chk_<%# Eval("id_employee") %>' />
                            </div>
                        </ItemTemplate>
                
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="col-md-6 d-flex justify-content-end ms-auto">
                <button type="button" class="btn-lelang" onclick="showLelangConfirmation(this)" 
                    style="border-radius: 15px; margin: 10px; width: 400px; height: 40px; color: white; border: none">
                    Nyatakan Pemenang
                </button>
            </div>
        </div>
    </div>
    

     <style>
         .btn-lelang {
             background-color: #A6D051;
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
