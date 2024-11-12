<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="am-menu-rdp.aspx.cs" Inherits="RDPplus.Pages.AM.AM_menu_rdp.am_menu_rdp" %>
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
            <a href="am-data-rdp" class="text-decoration-none">
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
                        <h5 class="card-title text-center text-dark" style="font-weight: bold;">Data Fasilitas RDP</h5>
                    </div>
                </div>
            </a>
        </div>

        <!-- Card 4: Kunci RDP -->
        <div class="col-md-6 mb-4">
            <a href="penyerahan-rdp" class="text-decoration-none">
                <div class="card h-100 shadow-sm" style="min-height: 200px;">
                    <div class="card-body d-flex align-items-center justify-content-center">
                        <h5 class="card-title text-center text-dark" style="font-weight: bold;">Kunci RDP</h5>
                    </div>
                </div>
            </a>
        </div>

        <!-- Card 5: Laporan Pemilik RDP -->
       <div class="col-md-6 mb-4">
            <a href="laporan-rdp" class="text-decoration-none">
                <div class="card h-100 shadow-sm" style="min-height: 200px;">
                    <div class="card-body d-flex align-items-center justify-content-center">
                        <h5 class="card-title text-center text-dark" style="font-weight: bold;">Laporan Pemilik RDP</h5>
                    </div>
                </div>
            </a>
        </div>

        
    </div>
</asp:Content>
