using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class lien_he : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void sendEmail()
    {
        string msg = "<h3>THIEN PHAT VINA: CONTACT</h3><br/>";
        msg += "<b>Full name: </b>" + txtFullName.Text.Trim().ToString() + "<br />";
        msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br />";
        msg += "<b>Content: </b>" + txtNoiDung.Text.Trim().ToString();
        Common.SendMail("118.69.193.238", 25, "webmaster@thietkewebhcm.com", "web123master", "info@thienphatvina.com.vn", "", "Contact THIEN PHAT VINA", msg, false);
    }
    protected void btGui_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (RadCaptcha1.IsValid)
            {

                //send email         
                sendEmail();
                lblMessage.Text = "Cám ơn bạn đã liên lạc với chúng tôi. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!";
                lblMessage.Visible = true;
                lblMessage.Text = "";
                //
                //Clear text
                //
                txtFullName.Text = "";
                txtEmail.Text = "";
                txtNoiDung.Text = "";
            }
            else
            {
                lblMessage.Text = "Chuỗi xác nhận chưa đúng !";
            }
        }
    }
}