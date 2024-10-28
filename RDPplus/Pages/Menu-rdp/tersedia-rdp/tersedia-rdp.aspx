<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="tersedia-rdp.aspx.cs" Inherits="RDPplus.Pages.Menu_rdp.tersedia_rdp.tersedia_rdp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
         $(document).ready(function () {

             $(".card-header").click(function () {
                 $(this).find(".toggle-icon").toggleClass("fa-chevron-down fa-chevron-up");
                 $(this).next(".table-container").slideToggle();
             });
         });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!-- header -->
     <div class="container mt-4">
         <div class="badge bg-light text-dark mb-2">
             <h1 class="page-title">RDP Tersedia</h1>
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

    <!-- Gunung Simping -->
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" 
        SelectCommand="SELECT TOP (1000) 
            rdp.id_rdp,
            rdp.no_rdp,
            rdp.cluster,
            area.area AS area,
            residence.residence AS hunian,
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
        WHERE
            status.nama_status = 'Tersedia' and area.area = 'Gunung Simping'">
    </asp:SqlDataSource>

    <!-- Grouped Tables by Area -->
    <div class="card mt-3" style="margin-left: 3px">
        <div class="card-header d-flex justify-content-between align-items-center" style="cursor: pointer;">
            <span>Gunung Simping</span>
            <i class="fas fa-chevron-down toggle-icon"></i>
        </div>
        <div class="table-container" style="background-color: #f8f9fa; padding: 20px; border-radius: 10px; margin: 15px;">
           <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered text-decoration-none text-dark" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" UseAccessibleHeader="True">
                <Columns>
                    <asp:BoundField DataField="id_rdp" HeaderText="ID RDP" />
                    <asp:BoundField DataField="no_rdp" HeaderText="No RDP" />
                    <asp:BoundField DataField="cluster" HeaderText="Cluster" />
                    <asp:BoundField DataField="area" HeaderText="Area" />
                    <asp:BoundField DataField="hunian" HeaderText="Hunian" />
                    <asp:BoundField DataField="status" HeaderText="Status" />
                    <asp:BoundField DataField="rt" HeaderText="RT" />
                    <asp:BoundField DataField="rw" HeaderText="RW" />
                </Columns>
            </asp:GridView>

        </div>

    </div>



</asp:Content>
