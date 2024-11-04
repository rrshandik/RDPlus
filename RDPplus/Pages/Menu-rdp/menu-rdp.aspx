<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="menu-rdp.aspx.cs" Inherits="RDPplus.Pages.RDP_menu.menu_rdp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- header -->


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

    <!-- menus -->
    <div class="row" style="margin-left: 3px">


        <!-- Card 2: Data RDP -->
        <div class="col-md-6 mb-4">
            <a href="data-rdp" class="text-decoration-none">
                <div class="card h-100 shadow-sm" style="min-height: 200px;">
                    <div class="card-body d-flex align-items-center justify-content-center">
                        <h5 class="card-title text-center text-dark" style="font-weight: bold;">Data RDP</h5>
                    </div>
                </div>
            </a>
        </div>

        <!-- Card 3: Lelang RDP -->
        <div class="col-md-6 mb-4">
            <a href="/lelang-rdp" class="text-decoration-none">
                <div class="card h-100 shadow-sm" style="min-height: 200px;">
                    <div class="card-body d-flex align-items-center justify-content-center">
                        <h5 class="card-title text-center text-dark" style="font-weight: bold;">Lelang RDP</h5>
                    </div>
                </div>
            </a>
        </div>

        <!-- Card 4: Kunci RDP -->
        <div class="col-md-6 mb-4">
            <a href="/kuncirdp" class="text-decoration-none">
                <div class="card h-100 shadow-sm" style="min-height: 200px;">
                    <div class="card-body d-flex align-items-center justify-content-center">
                        <h5 class="card-title text-center text-dark" style="font-weight: bold;">Kunci RDP</h5>
                    </div>
                </div>
            </a>
        </div>

        <!-- Card 5: Laporan Pemilik RDP -->
       <%-- <div class="col-md-6 mb-4">
            <a href="admin/LaporanPemilik" class="text-decoration-none">
                <div class="card h-100 shadow-sm" style="min-height: 200px;">
                    <div class="card-body d-flex align-items-center justify-content-center">
                        <h5 class="card-title text-center text-dark" style="font-weight: bold;">Laporan Pemilik RDP</h5>
                    </div>
                </div>
            </a>
        </div>--%>

        <!-- Card 5: RDP Tersedia -->
        <div class="col-md-6 mb-4">
            <a href="Pages/Menu-rdp/tersedia-rdp/tersedia-rdp.aspx" class="text-decoration-none">
                <div class="card h-100 shadow-sm" style="min-height: 200px;">
                    <div class="card-body d-flex align-items-center justify-content-center">
                        <h5 class="card-title text-center text-dark" style="font-weight: bold;">RDP Tersedia</h5>
                    </div>
                </div>
            </a>
        </div>

    </div>
</asp:Content>
