<%@ Page Title="" Language="C#" MasterPageFile="~/site-product.master" AutoEventWireup="true"
    CodeFile="san-pham-chi-tiet.aspx.cs" Inherits="san_pham_chi_tiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>MC</title>
    <meta name="description" content="MC" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphSite" runat="Server">
    <a href="san-pham.aspx">Sản phẩm</a>/<span><asp:Label ID="lblTitle" runat="server"
        Text=""></asp:Label></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnSanPhamDetails" runat="server" />
    <a class="a-link-spct" href="<%= hdnSanPhamDetails.Value %>"></a>
    <asp:ListView ID="lstProductDetails" runat="server" DataSourceID="odsProductDetails"
        EnableModelValidation="True">
        <ItemTemplate>
            <div class="wrapper-details">
                <div id="sliderDetails" class="detail-images">
                    <div class="wrap-images">
                        <asp:ListView ID="lstProductAlbum" runat="server" DataSourceID="odsProductAlbum"
                            EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="slide">
                                    <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/album/" + Eval("ImageName") : "~/assets/images/details-img-1.jpg" %>'
                                        runat="server" />
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div class="detailimg-desktop">
                                    <div class="zoom-box">
                                        <a id="zoom1" href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/album/" + Eval("ImageName") : "~/assets/images/details-img-1.jpg" %>'
                                            class="cloud-zoom" rel="showTitle: false, zoomWidth: '350', adjustY:0, adjustX:5">
                                            <img class="img-responsive" src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/album/" + Eval("ImageName") : "~/assets/images/details-img-1.jpg" %>'
                                                alt="" />
                                        </a>
                                    </div>
                                </div>
                                <div class="detailimg-mobile">
                                    <div class="slider-for">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>
                    <div class="wrapper-in">
                        <div class="wrapper-7">
                            <asp:ListView ID="lstProductAlbumBig" runat="server" DataSourceID="odsProductAlbum"
                                EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="slide">
                                        <a href='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/details-big-1.jpg" %>'
                                            data-img='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/details-img-1.jpg" %>'
                                            class='cloud-zoom-gallery small-img' title='Thumbnail 1' rel="useZoom: 'zoom1', smallImage: '<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/details-img-1.jpg" %>'">
                                            <span>
                                                <img alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/album/" + Eval("ImageName") : "~/assets/images/details-small-1.jpg" %>'
                                                    runat="server" /></span> </a>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div class="slider-nav">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                </LayoutTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                </div>
                <asp:ObjectDataSource ID="odsProductAlbum" runat="server" SelectMethod="ProductImageSelectAll"
                    TypeName="TLLib.ProductImage">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="pi" Name="ProductID" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <div class="details-content">
                    <h4 class="product-name">
                        <%# Eval("ProductName") %></h4>
                    <div class="product-code">
                        <%# Eval("Tag") %></div>
                    <%--<div class="product-start">
                        <img src="assets/images/icon-start.png" alt="" />
                    </div>--%>
                    <div class="desription">
                        <ul class="list-info">
                            <li><strong>Mã sản phẩm (ID):</strong>
                                <%# Eval("Tag") %></li>
                            <li><strong>Giá bán:</strong> <del>
                                <%# (string.Format("{0:##,###.##}", Eval("SavePrice")).Replace('.', '*').Replace(',', '.').Replace('*', ',')) %><%# string.IsNullOrEmpty(Eval("SavePrice").ToString()) ? "" : "đ"%>
                            </del><strong>
                                <%# string.IsNullOrEmpty(Eval("OtherPrice").ToString()) ?(string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',')) :  Eval("OtherPrice") %><%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "" : "đ"%></strong></li>
                        </ul>
                        <%--<p style="font-size: 17px;">
                            <strong>Liên hệ trực tiếp để có giá tốt nhất</strong><br />
                            <strong style="color: #f00;">Hotline:</strong> <span style="color: #f00; font-size: 24px;
                                font-style: italic;">094 456 9394</span></p>
                        <p>
                            Hoặc Email: <a style="color: #000; font-style: italic;" href="mailto:hung.furniture@gmail.com">
                                <strong>hung.furniture@gmail.com</strong></a></p>--%>
                    </div>
                </div>
                <div class="clr">
                </div>
            </div>
            <div class="wrapper-text">
                <h4 class="title text-uppercase">
                    Mô tả sản phẩm</h4>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsProductDetails" runat="server" SelectMethod="ProductSelectOne"
        TypeName="TLLib.Product">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <div class="head head-lineb">
        <h4 class="title text-uppercase">
            sản phẩm tương tự</h4>
        <div class="control-pager">
            <a href="#" id="slidePrevo" class="fa fa-angle-left"></a><a href="#" id="slideNexto"
                class="fa fa-angle-right"></a>
        </div>
    </div>
    <div class="wrapper-in">
        <div class="wrapper-15">
            <asp:ListView ID="lstProductSame" runat="server" DataSourceID="odsProductSame" EnableModelValidation="True">
                <ItemTemplate>
                    <div class="slide ">
                        <div class="product-box text-center">
                            <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'
                                class="product-img fullbox-img contain-img">
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
                    <div class="slider-tree">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsProductSame" runat="server" SelectMethod="ProductSameSelectAll"
                TypeName="TLLib.Product">
                <SelectParameters>
                    <asp:Parameter DefaultValue="10" Name="RerultCount" Type="String" />
                    <asp:QueryStringParameter DefaultValue="" Name="ProductID" QueryStringField="pi"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphPopup" runat="Server">
</asp:Content>
