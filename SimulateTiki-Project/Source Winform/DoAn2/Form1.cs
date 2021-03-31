using DoAn2.DAO;
using DoAn2.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAn2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void thôngTinTàiKhoảnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            thongTinTaiKhoan f = new thongTinTaiKhoan();
            this.Hide();
            f.ShowDialog();
            this.Show();
        }

        private void theoDõiĐơnHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            theoDoiDonHang f = new theoDoiDonHang();
            this.Hide();
            f.ShowDialog();
            this.Show();
        }

        private void đơnHàngCủaTôiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            theoDoiDonHang f = new theoDoiDonHang();
            this.Hide();
            f.ShowDialog();
            this.Show();
        }

        private void thôngBáoCủaTôiToolStripMenuItem_Click(object sender, EventArgs e)
        {

            gioHang f = new gioHang();
            this.Hide();
            f.ShowDialog();
            this.Show();
        }

      

        private void đăngNhậpToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void btn_timKiem_Click(object sender, EventArgs e)
        {
            string tenSP = txbtimKiem.Text;
            string query = "EXEC USP_TIMSP @tenSP";
            dtgvTimKiem.DataSource = DataProvider.Instance.ExecuteQuery(query, new object[] { tenSP });
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string maSP = txbMaSP.Text;
            string query = "EXEC USP_ThemGioHang @userName , @maSP , @sl";
            int temp;
            temp = DataProvider.Instance.ExecuteNonQuery(query, new object[] { bientoancuc.giatri, maSP, nbSL.Value });
            if (temp > 0)
                MessageBox.Show("Thêm vào giỏ hàng thành công");
            else
                MessageBox.Show("Sản phẩm đã có trong giỏ hàng");
        }
    }
}
