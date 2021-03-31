namespace DoAn2
{
    partial class SoDiaChi
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.txbDiaChi = new System.Windows.Forms.TextBox();
            this.cbDiaChi = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.txbSDT = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txbPhiVanChuyen = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.cbPTTT = new System.Windows.Forms.ComboBox();
            this.label7 = new System.Windows.Forms.Label();
            this.button3 = new System.Windows.Forms.Button();
            this.txbTongTien = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(9, 66);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(128, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Danh sách địa chỉ đã có:";
            // 
            // txbDiaChi
            // 
            this.txbDiaChi.Location = new System.Drawing.Point(12, 23);
            this.txbDiaChi.Name = "txbDiaChi";
            this.txbDiaChi.Size = new System.Drawing.Size(221, 20);
            this.txbDiaChi.TabIndex = 2;
            // 
            // cbDiaChi
            // 
            this.cbDiaChi.FormattingEnabled = true;
            this.cbDiaChi.Location = new System.Drawing.Point(12, 82);
            this.cbDiaChi.Name = "cbDiaChi";
            this.cbDiaChi.Size = new System.Drawing.Size(318, 21);
            this.cbDiaChi.TabIndex = 3;
            this.cbDiaChi.SelectedIndexChanged += new System.EventHandler(this.cbDiaChi_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(9, 7);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(72, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Thêm địa chỉ:";
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(250, 20);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(80, 25);
            this.button2.TabIndex = 6;
            this.button2.Text = "Thêm địa chỉ";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(115, 229);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(99, 35);
            this.button1.TabIndex = 7;
            this.button1.Text = "Đặt hàng";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(8, 112);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(129, 13);
            this.label4.TabIndex = 10;
            this.label4.Text = "Số điện thoại người nhận:";
            // 
            // txbSDT
            // 
            this.txbSDT.Location = new System.Drawing.Point(144, 109);
            this.txbSDT.Name = "txbSDT";
            this.txbSDT.Size = new System.Drawing.Size(186, 20);
            this.txbSDT.TabIndex = 11;
            this.txbSDT.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(8, 138);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(86, 13);
            this.label3.TabIndex = 14;
            this.label3.Text = "Phí vận chuyển:";
            // 
            // txbPhiVanChuyen
            // 
            this.txbPhiVanChuyen.Location = new System.Drawing.Point(101, 135);
            this.txbPhiVanChuyen.Name = "txbPhiVanChuyen";
            this.txbPhiVanChuyen.ReadOnly = true;
            this.txbPhiVanChuyen.Size = new System.Drawing.Size(229, 20);
            this.txbPhiVanChuyen.TabIndex = 15;
            this.txbPhiVanChuyen.Text = "0";
            this.txbPhiVanChuyen.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(8, 164);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(125, 13);
            this.label6.TabIndex = 16;
            this.label6.Text = "Phương thức thanh toán:";
            // 
            // cbPTTT
            // 
            this.cbPTTT.FormattingEnabled = true;
            this.cbPTTT.Items.AddRange(new object[] {
            "Thanh toán bằng tiền mặt",
            "ATM ",
            "VISA",
            "Ví điện tử"});
            this.cbPTTT.Location = new System.Drawing.Point(143, 161);
            this.cbPTTT.Name = "cbPTTT";
            this.cbPTTT.Size = new System.Drawing.Size(187, 21);
            this.cbPTTT.TabIndex = 17;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(9, 48);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(325, 13);
            this.label7.TabIndex = 18;
            this.label7.Text = "---------------------------------------------------------------------------------" +
    "-------------------------";
            // 
            // button3
            // 
            this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button3.ForeColor = System.Drawing.Color.Red;
            this.button3.Location = new System.Drawing.Point(8, 193);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(73, 37);
            this.button3.TabIndex = 19;
            this.button3.Text = "Tổng tiền:";
            this.button3.UseVisualStyleBackColor = true;
            // 
            // txbTongTien
            // 
            this.txbTongTien.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txbTongTien.Location = new System.Drawing.Point(101, 197);
            this.txbTongTien.Name = "txbTongTien";
            this.txbTongTien.ReadOnly = true;
            this.txbTongTien.Size = new System.Drawing.Size(229, 26);
            this.txbTongTien.TabIndex = 20;
            this.txbTongTien.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // SoDiaChi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(339, 279);
            this.Controls.Add(this.txbTongTien);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.cbPTTT);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txbPhiVanChuyen);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txbSDT);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.cbDiaChi);
            this.Controls.Add(this.txbDiaChi);
            this.Controls.Add(this.label1);
            this.Name = "SoDiaChi";
            this.Text = "SoDiaChi";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txbDiaChi;
        private System.Windows.Forms.ComboBox cbDiaChi;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txbSDT;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txbPhiVanChuyen;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ComboBox cbPTTT;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.TextBox txbTongTien;
    }
}