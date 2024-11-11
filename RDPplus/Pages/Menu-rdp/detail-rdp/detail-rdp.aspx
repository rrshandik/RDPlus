<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="detail-rdp.aspx.cs" Inherits="RDPplus.Pages.Menu_rdp.detail_rdp.detail_rdp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container mt-4">
         <div class="badge bg-light text-dark mb-2">
             <h1 class="page-title">Detail RDP</h1>
         </div>
     </div>
    <div class="badge bg-light text-dark mt-2 mb-2" style="margin-left: 22px">
        <span>
            <img src="/images/date-icon.png" style="height: 12px; width: 12px; margin-bottom: 2px; margin-right: 10px"/>
        </span>
        <asp:Label ID="LabelCurrentDateTime" runat="server"></asp:Label>
    </div>

    <!-- Main Section -->
    <div class="main-section">
        <!-- Left Section: Gambar utama dan galeri -->
        <div class="left-section">

            <!-- Gambar Utama -->
            <div class="main-image mb-2" style="margin-left: 22px">
                <img src="/images/house1.png" alt="Gambar Rumah" class="rdp-image" />
            </div>

            <div class="row justify-content-center" style="margin-left: 22px">
                <div class="col-md-3">
                    <img src="/images/house1.png" class="gallery-item" />
                </div>
                <div class="col-md-3">
                    <img src="/images/house1.png" class="gallery-item" />
                </div>
                <div class="col-md-3">
                    <img src="/images/house1.png" class="gallery-item" />
                </div>
                <div class="col-md-3">
                    <img src="/images/house1.png" class="gallery-item" />
                </div>
            </div>
        </div>        




        <!-- Right Section: Detail -->
        <div class="detail-section">
            <table>
                <tr>
                    <td><strong>Kondisi RDP</strong></td>
                    <td>: <span class="status-card">Layak</span></td>
                </tr>
                <tr>
                    <td><strong>Status RDP</strong></td>
                    <td>: Dihuni</td>
                </tr>
                <tr>
                    <td><strong>Keterangan 1</strong></td>
                    <td>: Pekerja RU IV</td>
                </tr>
                <tr>
                    <td><strong>Keterangan 2</strong></td>
                    <td>: Dihuni bersama Alvin Samudra (2241389)</td>
                </tr>
                <tr>
                    <td><strong>Nomor RDP</strong></td>
                    <td>: GS-04</td>
                </tr>
                <tr>
                    <td><strong>Nama Penghuni</strong></td>
                    <td>: Kerin Cecillia Belo</td>
                </tr>
                <tr>
                    <td><strong>Nopek</strong></td>
                    <td>: 2048</td>
                </tr>
                <tr>
                    <td><strong>Jenis Hunian</strong></td>
                    <td>: Cluster</td>
                </tr>
                <tr>
                    <td><strong>Terakhir Renovasi</strong></td>
                    <td>: 1 Januari 2024</td>
                </tr>
                <tr>
                    <td><strong>Kelurahan</strong></td>
                    <td>: Gunung Simping</td>
                </tr>
                <tr>
                    <td><strong>Nama Lurah</strong></td>
                    <td>: Sitam</td>
                </tr>
                <tr>
                    <td><strong>RT</strong></td>
                    <td>: 001</td>
                </tr>
                <tr>
                    <td><strong>Nama Ketua RT</strong></td>
                    <td>: Reza</td>
                </tr>
                <tr>
                    <td><strong>RW</strong></td>
                    <td>: 002</td>
                </tr>
                <tr>
                    <td><strong>Nama Ketua RW</strong></td>
                    <td>: Tegar</td>
                </tr>
                <tr>
                    <td><strong>Alamat</strong></td>
                    <td>: Komperta Gunung Simping, Cilacap Tengah, Kabupaten Cilacap, Jawa Tengah, 23224</td>
                </tr>
                <tr>
                    <td><strong>Fasilitas</strong></td>
                    <td>: Mesin Cuci, AC, Kasur</td>
                </tr>
            </table>
        </div> <!-- Right Section End -->
    </div> <!-- Main Section End -->

    <style>
        .rdp-detail-container {
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

            .header h1 {
                font-size: 24px;
            }

        .date-info {
            font-size: 14px;
            color: #888;
            display: flex;
            align-items: center;
        }

            .date-info i {
                margin-right: 5px;
            }

        /* Main Section */
        .main-section {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .left-section {
            width: 50%;
        }

        .main-image {
            position: relative;
            width: 100%;
            max-height: 450px;
            overflow: hidden;
        }

            .main-image img {
                width: 100%;
                height: auto;
                object-fit: cover;
            }

        /* Galeri Gambar */
        .image-gallery {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin-top: 20px;
        }

        .gallery-item {
            width: 100%;
            height: 120px;
            object-fit: cover;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Detail Section */
        .detail-section {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            width: 45%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

            .detail-section table {
                font-size: 14px;
                width: 100%;
            }

                .detail-section table td {
                    padding: 5px;
                }

        /* Auction Button */
        .action-button {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .btn-success {
            background-color: #4CAF50;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }

            .btn-success:hover {
                background-color: #45a049;
            }

        /* Modal Styles */
        .modal {
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 1000;
        }

        .modal-content {
            background-color: white;
            border-radius: 5px;
            padding: 20px;
            position: relative;
        }

        .modal-image {
            width: 100%;
            max-width: 600px;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 24px;
            cursor: pointer;
        }
        /* Status Card */
        .status-card {
            display: inline-block;
            background-color: #8BC34A; /* Warna hijau */
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: bold;
        }

    </style>
</asp:Content>
