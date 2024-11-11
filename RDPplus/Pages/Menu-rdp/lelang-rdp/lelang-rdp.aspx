<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="lelang-rdp.aspx.cs" Inherits="RDPplus.Pages.Menu_rdp.lelang_rdp.lelang_rdp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").each(function () {
                 if ($(this).find("thead").length === 0) {
                     $(this).prepend($("<thead></thead>").append($(this).find("tr:first")));
                 }
             });

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
        <div class="col-md-6 d-flex justify-content-end ms-auto">
            <button type="button" class="btn-penyerahan-kunci" onclick="window.location.href='/penyerahan-rdp';"
                style="border-radius: 15px; margin: 10px; width: 300px; height: 40px; color: white; border: none">
                Penyerahan Kunci
            </button>
        </div>
    </div>
    
    <!-- gunung simping gs 403 -->
    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;" >
        <div class="card-header d-flex justify-content-between align-items-center" 
     
                <asp:SqlDataSource ID="SqlDataSourcePeriodeLelang" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" 
                    SelectCommand="SELECT TOP 1 start_date, end_date FROM periode_lelang order by created_at desc">
                </asp:SqlDataSource>
            <span style="color: white; font-weight: bold">Gunung Simping GS. 403</span>
            <div class="d-flex align-items-center">
                <span style="color: #FFF16E; font-weight: lighter; margin-right: 10px; font-style: italic">Periode Lelang:</span>
                <asp:Label ID="lblPeriodeLelang" runat="server" Font-Italic="true"></asp:Label>
                <span>
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-left: 10px; margin-right: 10px"/>
                </span>
            </div>
        </div>
        <div class="table-container" style=" padding: 0px; border-radius: 10px; margin: 15px;">
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" SelectCommand="SELECT top 10 [name], [nopek], [id_employee], [points] FROM [employee] order by points desc"></asp:SqlDataSource>
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="id_employee" DataSourceID="SqlDataSource1" 
                CssClass="table table-striped table-bordered text-decoration-none text-dark"
                OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Rank">
                        <ItemTemplate>
                            <asp:Label ID="lblRowNumber" runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_employee" HeaderText="id_employee" ReadOnly="True" InsertVisible="False" SortExpression="id_employee"></asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
                    <asp:BoundField DataField="nopek" HeaderText="nopek" SortExpression="nopek"></asp:BoundField>
                    <asp:BoundField DataField="points" HeaderText="points" SortExpression="points"></asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="card mt-3" style="margin-left: 15px; padding: 0px; border: none; border-radius: 15px; overflow: hidden;" >
        <div class="card-header d-flex justify-content-between align-items-center" 
 
            <span style="color: white; font-weight: bold">Apartemen A211</span>
            <div class="d-flex align-items-center">
                <span style="color: #FFF16E; font-weight: lighter; margin-right: 10px; font-style: italic">Periode Lelang:</span>
                <asp:Label ID="lblPeriodeLelang2" runat="server" Font-Italic="true"></asp:Label>
                <span>
                    <img src="/images/arrow-bot.png" style="height: 12px; width: 20px; margin-bottom: 2px; margin-left: 10px; margin-right: 10px"/>
                </span>
            </div>
        </div>

        <div class="table-container" style=" padding: 0px; border-radius: 10px; margin: 15px;">
           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RDPlusConnectionString %>" SelectCommand="SELECT top 10 [name], [nopek], [id_employee], [points] FROM [employee] order by points desc"></asp:SqlDataSource>
           <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="id_employee" DataSourceID="SqlDataSource2" 
                CssClass="table table-striped table-bordered text-decoration-none text-dark" OnRowDataBound="GridView2_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Rank">
                        <ItemTemplate>
                            <asp:Label ID="lblRowNumber" runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_employee" HeaderText="id_employee" ReadOnly="True" InsertVisible="False" SortExpression="id_employee"></asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
                    <asp:BoundField DataField="nopek" HeaderText="nopek" SortExpression="nopek"></asp:BoundField>
                    <asp:BoundField DataField="points" HeaderText="points" SortExpression="points"></asp:BoundField>
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
            position: relative; 
            z-index: 2;
        }
        .table {
            background-color: #EDFFC3;
        }

        .btn-penyerahan-kunci {
            background-color: #E7242B;
        }
    </style>
</asp:Content>