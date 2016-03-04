using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using TLLib;

public partial class site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Page.Header.DataBind();
            string page = Request.Url.PathAndQuery.ToLower();

            string startScript = "<script type='text/javascript'>";
            string endScript = "')</script>";
            string activePage = "";

            if (page.Contains("-pci-"))
                activePage = "san-pham.aspx";
            else if (page.Contains("chi-tiet-tin-tuc.aspx?id="))
                activePage = "tin-tuc.aspx";
            else if (!page.EndsWith("default.aspx"))
                activePage = Path.GetFileName(page);

            if (!string.IsNullOrEmpty(activePage))
                runScript.InnerHtml = startScript + "changeActiveMenu('" + activePage + endScript;

            runScript.InnerHtml += startScript + "changeSubActiveMenu('" + Path.GetFileName(page) + endScript;
        }
        
        string allvisitors = Application["TatCa"].ToString();
        string html = "";
        for (int i = 0; i < allvisitors.Length; i++)
        {
            html += "<span class='num'>" + allvisitors.Substring(i, 1) + "</span>";
        }
        visit.InnerHtml = html;

        string onlinevisitors = Application["visitors_online"].ToString();
        string htmlOnline = "";
        for (int i = 0; i < onlinevisitors.Length; i++)
        {
            htmlOnline += "<span class='num'>" + onlinevisitors.Substring(i, 1) + "</span>";
        }
        online.InnerHtml = htmlOnline;
    }
}
