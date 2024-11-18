<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="data-kunci.aspx.cs" Inherits="RDPplus.Pages.Menu_rdp.pengembalian_kunci_rdp.pengembalian_kunci_rdp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <link href="https://nightly.datatables.net/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
    <script src="https://nightly.datatables.net/js/jquery.dataTables.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            $(".table").prepend($("<thead></thead>").append($(".table tr:first"))).DataTable({

            });

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
        .card-header {
            cursor: pointer; 
            background-color: #358DC7; 
            padding: 10px; 
            border-top-right-radius: 15px; 
            border-top-left-radius: 15px;
            position: relative; 
            z-index: 2;
        }

        .card-header img {
            transition: transform 0.3s ease;
        }

        .card-header img.rotated {
            transform: rotate(180deg);
        }
        
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

        .form-check-input {
            width: 20px !important;
            height: 20px !important;
            margin-top: 0 !important;
            cursor: pointer;
        }

        .d-flex.align-items-center.gap-2 {
            gap: 0.75rem !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Header -->
     <div class="container mt-4">
         <div class="badge bg-light text-dark mb-2">
             <h1 class="page-title">Data Kunci RDP</h1>
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
    
    <!-- data source gs -->
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" 
        SelectCommand="SELECT [No]
              ,[Alamat]
              ,[No_RDP]
              ,[Tipe]
              ,[Kondisi]
              ,[Nopek]
              ,[Nama]
              ,[Status]
              ,CONVERT(varchar, [Tanggal_Peminjaman], 103) AS Tanggal_Peminjaman
              ,CONVERT(varchar, [Tanggal_Pengembalian], 103) AS Tanggal_Pengembalian
          FROM [RDPlus].[dbo].[data_kunci]
         where Alamat = 'Gunung Simping'">
    </asp:SqlDataSource>

    <!-- content -->
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
            DataSourceID="SqlDataSource1" 
            CssClass="table table-striped table-bordered text-decoration-none text-dark"
            OnRowDataBound="GridView1_RowDataBound">
                <Columns>

                    <asp:TemplateField HeaderText="Action" SortExpression="Edit">
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-2">
                                <!-- upload Button -->
                                <a href="#" class="btn btn-light btn-sm p-1">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16">
                                      <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5"/>
                                      <path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708z"/>
                                    </svg>
                                </a>
                                <!-- checkbox-->
                                <div class="text-center">
                                    <input type="checkbox" class="form-check-input" runat="server" id="StatusCheckBox" />
                                </div>
                                

                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
           
        </div>
    </div>

        
    <!-- data source donan -->
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" 
        SelectCommand="SELECT [No]
              ,[Alamat]
              ,[No_RDP]
              ,[Tipe]
              ,[Kondisi]
              ,[Nopek]
              ,[Nama]
              ,[Status]
              ,CONVERT(varchar, [Tanggal_Peminjaman], 103) AS Tanggal_Peminjaman
              ,CONVERT(varchar, [Tanggal_Pengembalian], 103) AS Tanggal_Pengembalian
          FROM [RDPlus].[dbo].[data_kunci]
         where Alamat = 'Donan'">
    </asp:SqlDataSource>

        <!-- content -->
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
            DataSourceID="SqlDataSource2" 
            CssClass="table table-striped table-bordered text-decoration-none text-dark"
            OnRowDataBound="GridView1_RowDataBound">
                <Columns>

                    <asp:TemplateField HeaderText="Action" SortExpression="Edit">
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-2">
                                <!-- upload Button -->
                                <a href="#" class="btn btn-light btn-sm p-1">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16">
                                      <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5"/>
                                      <path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708z"/>
                                    </svg>
                                </a>
                                <!-- checkbox-->
                                <div class="text-center">
                                    <input type="checkbox" class="form-check-input" runat="server" id="StatusCheckBox" />
                                </div>
                               

                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
           
        </div>
    </div>

     <!-- data source donan -->
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" 
         SelectCommand="SELECT [No]
               ,[Alamat]
               ,[No_RDP]
               ,[Tipe]
               ,[Kondisi]
               ,[Nopek]
               ,[Nama]
               ,[Status]
               ,CONVERT(varchar, [Tanggal_Peminjaman], 103) AS Tanggal_Peminjaman
               ,CONVERT(varchar, [Tanggal_Pengembalian], 103) AS Tanggal_Pengembalian
           FROM [RDPlus].[dbo].[data_kunci]
          where Alamat = 'Apartemen'">
     </asp:SqlDataSource>

     <!-- content -->
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
             <asp:GridView ID="GridView3" runat="server" 
             DataSourceID="SqlDataSource3" 
             CssClass="table table-striped table-bordered text-decoration-none text-dark"
             OnRowDataBound="GridView1_RowDataBound">
                 <Columns>

                     <asp:TemplateField HeaderText="Action" SortExpression="Edit">
                         <ItemTemplate>
                             <div class="d-flex align-items-center gap-2">
                                 <!-- upload Button -->
                                 <a href="#" class="btn btn-light btn-sm p-1">
                                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16">
                                       <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5"/>
                                       <path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708z"/>
                                     </svg>
                                 </a>
                                 <!-- checkbox-->
                                 <div class="text-center">
                                     <input type="checkbox" class="form-check-input" runat="server" id="StatusCheckBox" />
                                 </div>
                                 

                             </div>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             </asp:GridView>
        
         </div>
     </div>

        <!-- data source donan -->
      <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" 
         SelectCommand="SELECT [No]
               ,[Alamat]
               ,[No_RDP]
               ,[Tipe]
               ,[Kondisi]
               ,[Nopek]
               ,[Nama]
               ,[Status]
               ,CONVERT(varchar, [Tanggal_Peminjaman], 103) AS Tanggal_Peminjaman
               ,CONVERT(varchar, [Tanggal_Pengembalian], 103) AS Tanggal_Pengembalian
           FROM [RDPlus].[dbo].[data_kunci]
          where Alamat = 'Sidanegara'">
     </asp:SqlDataSource>

     <!-- content -->
     <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;">
         <div class="card-header d-flex justify-content-between align-items-center" 
  
             <span style="color: white; font-weight: bold">Sidanegara</span>
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
             DataSourceID="SqlDataSource4" 
             CssClass="table table-striped table-bordered text-decoration-none text-dark"
             OnRowDataBound="GridView1_RowDataBound">
                 <Columns>

                     <asp:TemplateField HeaderText="Action" SortExpression="Edit">
                         <ItemTemplate>
                             <div class="d-flex align-items-center gap-2">
                                 <!-- upload Button -->
                                 <a href="#" class="btn btn-light btn-sm p-1">
                                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16">
                                       <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5"/>
                                       <path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708z"/>
                                     </svg>
                                 </a>
                                 <!-- checkbox-->
                                 <div class="text-center">
                                     <input type="checkbox" class="form-check-input" runat="server" id="StatusCheckBox" />
                                 </div>
                                 

                             </div>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             </asp:GridView>
        
         </div>
     </div>

            <!-- data source donan -->
      <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" 
         SelectCommand="SELECT [No]
               ,[Alamat]
               ,[No_RDP]
               ,[Tipe]
               ,[Kondisi]
               ,[Nopek]
               ,[Nama]
               ,[Status]
               ,CONVERT(varchar, [Tanggal_Peminjaman], 103) AS Tanggal_Peminjaman
               ,CONVERT(varchar, [Tanggal_Pengembalian], 103) AS Tanggal_Pengembalian
           FROM [RDPlus].[dbo].[data_kunci]
          where Alamat = 'Tegal Kamulyan'">
     </asp:SqlDataSource>

     <!-- content -->
     <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;">
         <div class="card-header d-flex justify-content-between align-items-center" 
  
             <span style="color: white; font-weight: bold">Tegal Kamulyan</span>
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
             <asp:GridView ID="GridView5" runat="server" 
             DataSourceID="SqlDataSource5" 
             CssClass="table table-striped table-bordered text-decoration-none text-dark"
             OnRowDataBound="GridView1_RowDataBound">
                 <Columns>

                     <asp:TemplateField HeaderText="Action" SortExpression="Edit">
                         <ItemTemplate>
                             <div class="d-flex align-items-center gap-2">
                                 <!-- upload Button -->
                                 <a href="#" class="btn btn-light btn-sm p-1">
                                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16">
                                       <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5"/>
                                       <path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708z"/>
                                     </svg>
                                 </a>
                                 <!-- checkbox-->
                                 <div class="text-center">
                                     <input type="checkbox" class="form-check-input" runat="server" id="StatusCheckBox" />
                                 </div>
                                

                             </div>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             </asp:GridView>
        
         </div>
     </div>
</asp:Content>
