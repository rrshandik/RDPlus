    <%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RDPplus.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <%--<script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(".table tr:first"))).DataTable();
       });
   </script>--%>

        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container mt-4">
        <div class="badge bg-light text-dark mb-2">
            <h1 class="page-title">Dashboard</h1>
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

    <!--info rdp-->
    <div class="row text-center mb-4" style="margin-left: 3px">
        <div class="col-md-3">
            <a href="/#" class="text-decoration-none">
                <div class="card shadow" style="background-color: #3075BB; color: white; border-radius: 15px; position: relative;">
                    <div class="card-body" style="text-align: left; position: relative;">

                        <p style="font-size: 14px; margin: 0;">Total RDP</p>

                        <p class="custom-rdp-num">791</p>

                        <img src="/images/home-rdptotal.png" alt="Home Icon" style="position: absolute; top: 0px; right: 15px; width: 100px; height: 100px; opacity: 0.5;">

                   
                    </div>
                </div>
            </a>
        </div>



        
        <div class="col-md-3">
            <div class="card shadow" style="background-color: #F6C80C; color: white; border-radius: 15px;">
                <div class="card-body" style="text-align: left; position: relative;">

                    <p style="font-size: 14px; margin: 0;">RDP Dihuni</p>

                    <p class="custom-rdp-num">812</p>

                    <img src="/images/home-rdplayak.png" alt="Home Icon" style="position: absolute; top: 0; right: 15px; width: 90px; height: 100px; opacity: 0.5;">


                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card shadow" style="background-color: #E7242B; color: white; border-radius: 15px">
                <div class="card-body" style="text-align: left; position: relative;">

                    <p style="font-size: 14px; margin: 0;">RDP Tidak Layak</p>

                    <p class="custom-rdp-num">185</p>

                    <img src="/images/home-rdptidak.png" alt="Home Icon" style="position: absolute; top: 0; right: 15px; width: 100px; height: 100px; opacity: 0.5;">


                </div>
            </div>
        </div>
        <div class="col-md-3">
            <a href="/#" class="text-decoration-none">
                <div class="card shadow" style="background-color: #A2CE40 ; color: white; border-radius: 15px;">
                    <div class="card-body" style="text-align: left; position: relative;">

                        <p style="font-size: 14px; margin: 0;">RDP Tersedia</p>

                        <p class="custom-rdp-num">61</p>

                        <img src="/images/home-rdptersedia.png" alt="Home Icon" style="position: absolute; top: 0; right: 15px; width: 100px; height: 100px; opacity: 0.5;">


                    </div>
                </div>
            </a>
        </div>
    </div>
        
    

    

</asp:Content>


