<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Nội Thất Mai Chung</title>
    <meta name="description" content="Nội Thất Mai Chung" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="banner">
        <div class="slider-banner">
            <asp:ListView ID="lstBanner" runat="server" DataSourceID="odsBanner" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="slide">
                        <img alt='<%# Eval("FileName") %>' src='<%# !string.IsNullOrEmpty(Eval("FileName").ToString()) ? "~/res/advertisement/" + Eval("FileName") : "~/assets/banner-img-1.jpg" %>'
                            runat="server" />
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsBanner" runat="server" SelectMethod="AdsBannerSelectAll"
                TypeName="TLLib.AdsBanner">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter DefaultValue="5" Name="AdsCategoryID" Type="String" />
                    <asp:Parameter Name="ProductCategoyID" Type="String" />
                    <asp:Parameter Name="CompanyName" Type="String" />
                    <asp:Parameter Name="Website" Type="String" />
                    <asp:Parameter Name="FromDate" Type="String" />
                    <asp:Parameter Name="ToDate" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    <div class="container">
        <h4 class="text-uppercase text-center title linec">
            <span>Sản phẩm bán chạy nhất</span></h4>
        <div class="wrapper-out mb35">
            <a href="#" id="slidePrev" class="btn-slide">prev</a> <a href="#" id="slideNext"
                class="btn-slide">next</a>
            <div class="wrapper-in">
                <div class="wrapper-15">
                    <asp:ListView ID="lstProductBestSeller" runat="server" DataSourceID="odsProductBestSeller"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="slide ">
                                <div class="product-box text-center">
                                    <div class='<%# Eval("IsHot").ToString() == "True" ? "icon-hot" : "hidden" %>'>
                                        <img class="img-responsive" src="assets/images/icon-hot.png" alt="" /></div>
                                    <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>' class="product-img fullbox-img contain-img">
                                        <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/product-img-1.jpg" %>'
                                        runat="server" />
                                        <span class="icona-plus"><span></span></span></a>
                                    <h4 class="product-name">
                                        <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'><%# Eval("ProductName") %></a></h4>
                                    <div class="product-code">
                                        <%# Eval("Tag") %></div>
                                    <div class="product-price">
                                        <del>
                                            <%# (string.Format("{0:##,###.##}", Eval("SavePrice")).Replace('.', '*').Replace(',', '.').Replace('*', ',')) %><%# string.IsNullOrEmpty(Eval("SavePrice").ToString()) ? "" : "đ"%>
                                        </del><strong>
                                            <%# string.IsNullOrEmpty(Eval("OtherPrice").ToString()) ?(string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',')) :  Eval("OtherPrice") %><%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "" : "đ"%></strong>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div class="slider-four">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsProductBestSeller" runat="server" SelectMethod="ProductSelectAll"
                    TypeName="TLLib.Product">
                    <SelectParameters>
                        <asp:Parameter Name="StartRowIndex" Type="String" />
                        <asp:Parameter Name="EndRowIndex" Type="String" />
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="PriceFrom" Type="String" />
                        <asp:Parameter Name="PriceTo" Type="String" />
                        <asp:Parameter Name="CategoryID" Type="String" />
                        <asp:Parameter Name="ManufacturerID" Type="String" />
                        <asp:Parameter Name="OriginID" Type="String" />
                        <asp:Parameter Name="Tag" Type="String" />
                        <asp:Parameter Name="InStock" Type="String" />
                        <asp:Parameter Name="IsHot" Type="String" />
                        <asp:Parameter Name="IsNew" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsBestSeller" Type="String" />
                        <asp:Parameter Name="IsSaleOff" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsShowOnHomePage" Type="String" />
                        <asp:Parameter Name="FromDate" Type="String" />
                        <asp:Parameter Name="ToDate" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                </div>
            </div>
        </div>
        <asp:ListView ID="lstProductCategory" runat="server" DataSourceID="odsProductCategory"
            EnableModelValidation="True">
            <ItemTemplate>
                <h4 class="text-uppercase text-center title linec">
                    <span>
                        <%# Eval("ProductCategoryName") %></span></h4>
                <asp:HiddenField ID="hdnProductCategoryID" runat="server" Value='<%# Eval("ProductCategoryID") %>' />
                <asp:ListView ID="lstProduct" runat="server" DataSourceID="odsProduct" EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="col-md-3 col-xs-4 element-item">
                            <div class="product-box text-center">
                                <div class='<%# Eval("IsHot").ToString() == "True" ? "icon-hot" : "hidden" %>'>
                                    <img class="img-responsive" src="assets/images/icon-hot.png" alt="" />
                                </div>
                                <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>' class="product-img fullbox-img contain-img">
                                    <img class="hideo" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/product-img-1.jpg" %>'
                                        runat="server" />
                                    <span class="icona-plus"><span></span></span></a>
                                <h4 class="product-name">
                                    <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                        <%# Eval("ProductName") %></a></h4>
                                <div class="product-code">
                                    <%# Eval("Tag") %></div>
                                <div class="product-price">
                                    <del>
                                        <%# (string.Format("{0:##,###.##}", Eval("SavePrice")).Replace('.', '*').Replace(',', '.').Replace('*', ',')) %><%# string.IsNullOrEmpty(Eval("SavePrice").ToString()) ? "" : "đ"%>
                                    </del><strong>
                                        <%# string.IsNullOrEmpty(Eval("OtherPrice").ToString()) ?(string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',')) :  Eval("OtherPrice") %><%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "" : "đ"%></strong>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div class="product-tb row mb20">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProduct" runat="server" SelectMethod="ProductSelectAll"
                    TypeName="TLLib.Product">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                        <asp:Parameter DefaultValue="8" Name="EndRowIndex" Type="String" />
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="PriceFrom" Type="String" />
                        <asp:Parameter Name="PriceTo" Type="String" />
                        <asp:ControlParameter ControlID="hdnProductCategoryID" Name="CategoryID" PropertyName="Value"
                            Type="String" />
                        <asp:Parameter Name="ManufacturerID" Type="String" />
                        <asp:Parameter Name="OriginID" Type="String" />
                        <asp:Parameter Name="Tag" Type="String" />
                        <asp:Parameter Name="InStock" Type="String" />
                        <asp:Parameter Name="IsHot" Type="String" />
                        <asp:Parameter Name="IsNew" Type="String" />
                        <asp:Parameter Name="IsBestSeller" Type="String" />
                        <asp:Parameter Name="IsSaleOff" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsShowOnHomePage" Type="String" />
                        <asp:Parameter Name="FromDate" Type="String" />
                        <asp:Parameter Name="ToDate" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <div class="banner-sub">
                    <div class="slider-bannersub">
                        <asp:ListView ID="lstBannerSub" runat="server" DataSourceID="odsBannerSub" EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="slide">
                                    <img id="Img1" alt='<%# Eval("FileName") %>' src='<%# !string.IsNullOrEmpty(Eval("FileName").ToString()) ? "~/res/advertisement/" + Eval("FileName") : "~/assets/banner-sub-1.jpg" %>'
                                        runat="server" />
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsBannerSub" runat="server" SelectMethod="AdsBannerSelectAll"
                            TypeName="TLLib.AdsBanner">
                            <SelectParameters>
                                <asp:Parameter Name="StartRowIndex" Type="String" />
                                <asp:Parameter Name="EndRowIndex" Type="String" />
                                <asp:Parameter DefaultValue="6" Name="AdsCategoryID" Type="String" />
                                <asp:ControlParameter ControlID="hdnProductCategoryID" Name="ProductCategoyID" PropertyName="Value"
                                    Type="String" />
                                <asp:Parameter Name="CompanyName" Type="String" />
                                <asp:Parameter Name="Website" Type="String" />
                                <asp:Parameter Name="FromDate" Type="String" />
                                <asp:Parameter Name="ToDate" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                <asp:Parameter Name="Priority" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsProductCategory" runat="server" SelectMethod="ProductCategorySelectAll"
            TypeName="TLLib.ProductCategory">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="parentID" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                <asp:Parameter Name="IsShowOnMenu" Type="String" />
                <asp:Parameter DefaultValue="True" Name="IsShowOnHomePage" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMenuMobile" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
