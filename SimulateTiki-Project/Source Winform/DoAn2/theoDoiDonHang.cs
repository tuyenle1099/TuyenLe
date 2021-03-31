using DoAn2.DAO;
using DoAn2.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAn2
{
    public partial class theoDoiDonHang : Form
    {
        public theoDoiDonHang()
        {
            InitializeComponent();
            LoadDonHang();
         
        }
        
        object TongTien(string maDH)
        {
            object tong;
            string query = "EXEC dbo.USP_TongTien @maDH";
            tong = DataProvider.Instance.ExecuteScalar(query, new object[] { maDH });
            return tong;
        }
        
        void LoadChiTiet()
        {
            string maDH = txbMaDH.Text;
            string query = "EXEC dbo.USP_ChiTietDH @maDH";
            dtgvChiTietDH.DataSource = DataProvider.Instance.ExecuteQuery(query, new object[] { maDH });
            object tong = TongTien(maDH);
            txbTongTien.Text = tong.ToString();
        }
        void LoadDonHang()
        {
            string query = "EXEC dbo.USP_DonHangList @userName";
            dtgvDH.DataSource = DataProvider.Instance.ExecuteQuery(query, new object[] { bientoancuc.giatri });

        }

       

        private void btnXemChiTiet_Click(object sender, EventArgs e)
        {
            LoadChiTiet();
        }

        private void btn_huyDon_Click(object sender, EventArgs e)
        {
            string maDH = txbMaDH.Text;
            string query = "EXEC dbo.USP_HuyDon @maDH";
            int temp;
            temp = DataProvider.Instance.ExecuteNonQuery(query, new object[] { maDH });
            if (temp > 0)
                MessageBox.Show("Hủy đơn hàng thành công");
            else
                MessageBox.Show("Không được phép hủy đơn này!");
            txbMaDH.Text = "";
            LoadDonHang();
            LoadChiTiet();
        }
    }
}
