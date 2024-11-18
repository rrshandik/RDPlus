    <%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RDPplus.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>

    <style>
        .date-badge {
            display: inline-flex;
            align-items: center;
            background-color: #e9ecef;
            padding: 0.5rem 1rem;
            border-radius: 5px;
        }
        .page-header {
            background-color: #f8f9fa;
            padding: 0.5rem;
            display: inline-flex;
            border-radius: 8px;
            margin-bottom: 1rem;
            margin-left: 1rem;
        }
    </style>
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- header -->
    <div class="page-header">
        <h1 class="page-title">Dashboard</h1>
    </div>


    <div class="row mb-3" style="margin-left: 3px">
        <div class="col-md-6">
            <div class="date-badge">
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
            <a id="data_rdp" runat="server" class="text-decoration-none">
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
            <a href="../Menu-rdp/tersedia-rdp/tersedia-rdp.aspx" class="text-decoration-none">
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

   <!-- Demografi RDP -->
    <div class="table-container" style="background-color: #f8f9fa; padding: 20px; border-radius: 10px; margin-left: 15px; margin-right: 5px">
        <!-- Chart Row -->
        <div class="row">
            <!-- Bar Chart -->
            <div class="col-md-8 mb-4">
                <div class="card shadow h-100">
                    <div class="card-header bg-white py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Demografi RDP RU IV</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="stackedBarChart" style="height: 300px;"></canvas>
                    </div>
                </div>
            </div>
        
            <!-- Pie Chart  -->
            <div class="col-md-4 mb-4">
                <div class="card shadow h-100">
                    <div class="card-header bg-white py-3">
                        <h6 class="m-0 font-weight-bold text-primary">RDP Status Distribution</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="pieChart" style="height: 300px;"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Common Chart Options
        const commonOptions = {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: {
                        padding: 10, 
                        usePointStyle: true,
                        boxWidth: 8,
                        font: {
                            size: 11 
                        }
                    }
                }
            }
        };

        // Pie Chart - Modified for smaller size
        const pieChart = new Chart(document.getElementById('pieChart'), {
            type: 'doughnut',
            data: {
                labels: ['Dihuni', 'Tidak Layak', 'Tersedia'],
                datasets: [{
                    data: [812, 185, 61],
                    backgroundColor: ['#F6C80C', '#E7242B', '#A2CE40'],
                    borderWidth: 0
                }]
            },
            options: {
                ...commonOptions,
                cutout: '65%',
                plugins: {
                    ...commonOptions.plugins,
                    legend: {
                        ...commonOptions.plugins.legend,
                        position: 'bottom'
                    }
                }
            }
        });

        //  Bar Chart 
        const stackedBarChart = new Chart(document.getElementById('stackedBarChart'), {
            type: 'bar',
            data: {
                labels: ['Apartemen', 'Donan', 'Gunung Simping', 'Sidanegara', 'Tegal Kamulyan'],
                datasets: [
                    {
                        label: 'Tersedia',
                        data: [17, 8, 15, 1, 20],
                        backgroundColor: '#A2CE40'
                    },
                    {
                        label: 'Dihuni',
                        data: [195, 90, 224, 181, 101],
                        backgroundColor: '#3075BB'
                    },
                    {
                        label: 'Kosong',
                        data: [45, 20, 50, 25, 45],
                        backgroundColor: '#E7242B'
                    },
                    {
                        label: 'Peminjaman',
                        data: [11, 20, 26, 10, 30],
                        backgroundColor: '#C0C0C0'
                    },
                    {
                        label: 'Alih Fungsi',
                        data: [5, 3, 8, 1, 0],
                        backgroundColor: '#FFD700'
                    },
                    {
                        label: 'Guest House',
                        data: [1, 0, 0, 0, 0],
                        backgroundColor: '#DEB887'
                    }
                ]
            },
            options: {
                ...commonOptions,
                scales: {
                    x: {
                        stacked: true,
                        grid: {
                            display: false
                        },
                        ticks: {
                            font: {
                                size: 11 
                            }
                        }
                    },
                    y: {
                        stacked: true,
                        beginAtZero: true,
                        grid: {
                            drawBorder: false
                        },
                        ticks: {
                            font: {
                                size: 11 
                            }
                        }
                    }
                },
                interaction: {
                    intersect: false,
                    mode: 'index'
                }
            }
        });
    </script>
        
    

    

</asp:Content>


