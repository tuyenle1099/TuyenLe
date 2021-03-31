using DoAn2.DAO;
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
    public partial class gioHang : Form
    {
        
        public gioHang()
        {
            InitializeComponent();
           Load();
        }
       
        void Load()
        {
            
            string query = "EXEC dbo.USP_LoadGioHang @userName";

            dtgv_gioHang.DataSource = DataProvider.Instance.ExecuteQuery(query, new object[] {bientoancuc.giatri});

            object tong = TongTien(bientoancuc.giatri);
            
            txbTamTinh.Text = tong.ToString();
            
        }

        private void btn_datHang_Click(object sender, EventArgs e)
        {
            SoDiaChi f = new SoDiaChi();
            this.Hide();
            f.ShowDialog();
        }

        private void txb_tamTinh_TextChanged(object sender, EventArgs e)
        {

        }
        object TongTien(string userName)
        {
            object tong;
            string query = "EXEC dbo.USP_TongTienGioHang @userName";
            tong = DataProvider.Instance.ExecuteScalar(query, new object[] { userName });
            tongTienGH.tongTien = tong.ToString();
            return tong;
        }

        private void btn_xoa_Click(object sender, EventArgs e)
        {
            string maSP = txbMaSP.Text;
            string query = "EXEC dbo.USP_XoaGioHang @userName , @maSP";
            int temp;
            temp = DataProvider.Instance.ExecuteNonQuery(query, new object[] { bientoancuc.giatri,maSP });
            if (temp > 0)
                MessageBox.Show("Xoá sản phẩm thành công");
            else
                MessageBox.Show("Xóa sản phẩm không thành công");
            txbMaSP.Text = "";
            Load();
            
        }

        private void btn_sua_Click(object sender, EventArgs e)
        {
            string maSP = txbMaSP.Text;
            
             if (nbSL.Value == 0)
                MessageBox.Show("Số lượng = 0, hãy nhấn nút Xóa");
            else
            {
                string query = "EXEC dbo.USP_SuaGioHang @userName , @maSP , @soluong";
                int temp;
                temp = DataProvider.Instance.ExecuteNonQuery(query, new object[] { bientoancuc.giatri, maSP, nbSL.Value });
                if (temp > 0)
                    MessageBox.Show("Sửa số lượng sản phẩm thành công");
                else
                    MessageBox.Show("Sửa số lượng sản phẩm không thành công");
                txbMaSP.Text = "";
                Load();
            }
        }
    }
}
