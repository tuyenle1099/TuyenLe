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
    public partial class Login : Form
    {
       

        public Login()
        {
            InitializeComponent();
          
        }
        private void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = txbUserName.Text;
            string passWord = txbPassWord.Text;
            bientoancuc.giatri = txbUserName.Text;

            if (login(userName, passWord))
            {
                
                Form1 f = new Form1();
         
                this.Hide();
                f.ShowDialog();
                this.Show();

            }
            else
            {
                MessageBox.Show("Sai tên tài khoản hoặc mật khẩu!");
            }
         
        }
     
           bool login(string userName, string passWord)
        {
            return AccountDAO.Instance.Login(userName, passWord);
        }
        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        
    }
}
