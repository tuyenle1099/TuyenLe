namespace DoAn2
{
    partial class theoDoiDonHang
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
            this.label2 = new System.Windows.Forms.Label();
            this.btn_huyDon = new System.Windows.Forms.Button();
            this.dtgvDH = new System.Windows.Forms.DataGridView();
            this.btnXemChiTiet = new System.Windows.Forms.Button();
            this.dtgvChiTietDH = new System.Windows.Forms.DataGridView();
            this.txbMaDH = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.txbTongTien = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvDH)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvChiTietDH)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.label1.Size = new System.Drawing.Size(107, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "Đơn hàng của tôi";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(374, 18);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(106, 16);
            this.label2.TabIndex = 2;
            this.label2.Text = "Chi tiết đơn hàng";
            // 
            // btn_huyDon
            // 
            this.btn_huyDon.Location = new System.Drawing.Point(628, 368);
            this.btn_huyDon.Name = "btn_huyDon";
            this.btn_huyDon.Size = new System.Drawing.Size(84, 34);
            this.btn_huyDon.TabIndex = 4;
            this.btn_huyDon.Text = "Hủy đơn";
            this.btn_huyDon.UseVisualStyleBackColor = true;
            this.btn_huyDon.Click += new System.EventHandler(this.btn_huyDon_Click);
            // 
            // dtgvDH
            // 
            this.dtgvDH.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvDH.Location = new System.Drawing.Point(10, 32);
            this.dtgvDH.Name = "dtgvDH";
            this.dtgvDH.Size = new System.Drawing.Size(351, 330);
            this.dtgvDH.TabIndex = 5;
            // 
            // btnXemChiTiet
            // 
            this.btnXemChiTiet.Location = new System.Drawing.Point(651, 10);
            this.btnXemChiTiet.Name = "btnXemChiTiet";
            this.btnXemChiTiet.Size = new System.Drawing.Size(61, 34);
            this.btnXemChiTiet.TabIndex = 6;
            this.btnXemChiTiet.Text = "Xem Chi Tiết";
            this.btnXemChiTiet.UseVisualStyleBackColor = true;
            this.btnXemChiTiet.Click += new System.EventHandler(this.btnXemChiTiet_Click);
            // 
            // dtgvChiTietDH
            // 
            this.dtgvChiTietDH.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvChiTietDH.Location = new System.Drawing.Point(377, 50);
            this.dtgvChiTietDH.Name = "dtgvChiTietDH";
            this.dtgvChiTietDH.Size = new System.Drawing.Size(335, 272);
            this.dtgvChiTietDH.TabIndex = 7;
            // 
            // txbMaDH
            // 
            this.txbMaDH.Location = new System.Drawing.Point(486, 18);
            this.txbMaDH.Name = "txbMaDH";
            this.txbMaDH.Size = new System.Drawing.Size(159, 20);
            this.txbMaDH.TabIndex = 8;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.ForeColor = System.Drawing.Color.Red;
            this.button1.Location = new System.Drawing.Point(377, 333);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(130, 29);
            this.button1.TabIndex = 9;
            this.button1.Text = "Tổng tiền";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // txbTongTien
            // 
            this.txbTongTien.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txbTongTien.Location = new System.Drawing.Point(524, 333);
            this.txbTongTien.Name = "txbTongTien";
            this.txbTongTien.ReadOnly = true;
            this.txbTongTien.Size = new System.Drawing.Size(188, 29);
            this.txbTongTien.TabIndex = 10;
            this.txbTongTien.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // theoDoiDonHang
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(739, 415);
            this.Controls.Add(this.txbTongTien);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.txbMaDH);
            this.Controls.Add(this.dtgvChiTietDH);
            this.Controls.Add(this.btnXemChiTiet);
            this.Controls.Add(this.dtgvDH);
            this.Controls.Add(this.btn_huyDon);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "theoDoiDonHang";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Theo dõi đơn hàng";
            ((System.ComponentModel.ISupportInitialize)(this.dtgvDH)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvChiTietDH)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btn_huyDon;
        private System.Windows.Forms.DataGridView dtgvDH;
        private System.Windows.Forms.Button btnXemChiTiet;
        private System.Windows.Forms.DataGridView dtgvChiTietDH;
        private System.Windows.Forms.TextBox txbMaDH;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox txbTongTien;
    }
}