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
    public partial class SoDiaChi : Form
    {
        public SoDiaChi()
        {
            InitializeComponent();
            LoadCb();
            LoadTongTien();
        }
        void LoadTongTien()
        {
            txbTongTien.Text = tongTienGH.tongTien;
        }
        void LoadCb()
        {
            string query = "EXEC USP_SODIACHI @userName";
            DataTable temp;
            temp = DataProvider.Instance.ExecuteQuery(query, new object[] {bientoancuc.giatri});
            cbDiaChi.DataSource = temp;
            cbDiaChi.DisplayMember = "DaiChi";
            cbDiaChi.ValueMember = "DaiChi";
        }
       

        private void cbDiaChi_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string diaChi = txbDiaChi.Text;
            string query = "EXEC USP_THEMDIACHI @userName , @diaChi";
            int t = DataProvider.Instance.ExecuteNonQuery(query, new object[] { bientoancuc.giatri, diaChi });
            if (t > 0)
                MessageBox.Show("Thêm địa chỉ thành công");
            else
                MessageBox.Show("Thêm địa chỉ thất bại");
            LoadCb();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            string sdt = txbSDT.Text;
            string diaChi = cbDiaChi.SelectedValue.ToString();
            string PTTT = cbDiaChi.SelectedValue.ToString();
            float phiVanChuyen = 0;
            string query = "EXEC USP_DATHANG @userName , @diaCHi , @sdtNhan , @PTTT ";
            int t = DataProvider.Instance.ExecuteNonQuery(query, new object[] { bientoancuc.giatri,diaChi,sdt,PTTT});
            if (t > 0)
            {
                MessageBox.Show("Đặt hàng thành công!");
                string query1 = "EXEC USP_XOATATCAGIOHANG @userName";
                int ta = DataProvider.Instance.ExecuteNonQuery(query1, new object[] { bientoancuc.giatri});
                this.Hide();
            }
            else
                MessageBox.Show("Đặt hàng thất bại");
            

        }

     
    }
}
