<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="gioi-thieu.aspx.cs" Inherits="gioi_thieu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Giới Thiệu</title>
    <meta name="description" content="Giới Thiệu" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="site" class="corner">
        <div class="container">
            <a href="~/" runat="server"><span class="fa fa-home"></span></a>/<span>Giới Thiệu</span>
        </div>
    </div>
    <div class="container">
        <div class="wrapper-text about-us">
            <h4 class="text-uppercase title mo-640">
                Về Chúng tôi</h4>
            <div class="about-img">
                <img class="img-responsive" src="assets/images/about-img.jpg" alt="" /></div>
            <h4 class="text-uppercase title tit-640">
                Về Chúng tôi</h4>
            <%--<p style="font-style: italic;">Nations transform the world. Medical advocate social entrepreneurship social challenges catalytic effect dedicated clean water. Nonprofit results combat poverty pathway to a better life design thinking. pathway to a better life design thinking.</p>
            <p>Resourceful significant international agriculture underprivileged; world problem solving, improving quality local solutions technology developing nations transform the world. Medical advocate social entrepreneurship social challenges catalytic effect dedicated clean water. Nonprofit results combat poverty pathway.</p>            <p>Better life design thinking assessment expert policy dialogue working families raise awareness Kickstarter replicable liberal grantees. Progressive medical supplies educate effectiveness; equal opportunity transformative crowdsourcing, volunteer economic security local gender equality momentum. Vaccine life-expectancy conflict resolution, sustainability accelerate progress. hunger .</p>
            <p>Resourceful significant international agriculture underprivileged; world problem solving, improving quality local solutions technology developing nations transform the world. Medical advocate social entrepreneurship social challenges catalytic effect dedicated clean water. Nonprofit results combat poverty pathway to a better life design thinking assessment expert policy dialogue working families raise awareness Kickstarter replicable liberal grantees. Progressive medical supplies educate effectiveness; equal opportunity transformative crowdsourcing, volunteer economic security local gender equality momentum. Vaccine life-expectancy conflict resolution, sustainability accelerate progress. Public service fluctuation; donate end hunger stakeholders economic development. y local gender equality momentum. Vaccine life-expectancy conflict resolution.</p>
            <p>Resourceful significant international agriculture underprivileged; world problem solving, improving quality local solutions technology developing nations transform the world. Medical advocate social entrepreneurship social challenges catalytic effect dedicated clean water. Nonprofit results combat poverty pathway to a better life design thinking assessment expert policy dialogue working families raise awareness Kickstarter replicable liberal grantees. Progressive medical supplies educate effectiveness; equal opportunity transformative crowdsourcing, volunteer economic security local gender equality momentum. Vaccine life-expectancy conflict resolution, sustainability accelerate progress. Public service fluctuation; donate end hunger stakeholders economic development. y local gender equality momentum. Vaccine life-expectancy conflict resolution. Resourceful significant international agriculture underprivileged; world problem solving, improving quality local solutions technology developing nations transform the world. Medical advocate social entrepreneurship social challenges catalytic effect dedicated clean water. Nonprofit results combat poverty pathway to a better life design thinking assessment expert policy dialogue working families raise awareness Kickstarter replicable liberal grantees. Progressive medical supplies educate effectiveness; equal opportunity transformative crowdsourcing, volunteer economic security local gender equality momentum. Vaccine life-expectancy conflict resolution, sustainability accelerate progress. Public service fluctuation; donate end hunger stakeholders. eloping nations transform the world. Medical advocate social entrepreneurship social challenges catalytic effect dedicated clean water. Nonprofit results combat poverty pathway to a better life design thinking assessment expert policy dialogue.</p>
            <p style="font-size: 18px; text-transform: uppercase; text-align: right; padding-right: 20px; padding-top: 10px;"><strong>John Doe</strong> - Ceo</p>
            <p style="font-style: italic; text-align: right;">Public service fluctuation donate</p>--%>
            <asp:ListView ID="lstAboutUs" runat="server" DataSourceID="odsAboutUs" EnableModelValidation="True">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsAboutUs" runat="server" SelectMethod="ArticleSelectAll"
                TypeName="TLLib.Article">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                    <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ArticleTitle" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter DefaultValue="1" Name="ArticleCategoryID" Type="String" />
                    <asp:Parameter Name="Tag" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                    <asp:Parameter Name="IsHot" Type="String" />
                    <asp:Parameter Name="IsNew" Type="String" />
                    <asp:Parameter Name="FromDate" Type="String" />
                    <asp:Parameter Name="ToDate" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
