<%@ Page Title="" Language="C#" MasterPageFile="~/E-Medicines Services.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" class="Tbl-Outer">
        <tr>
            <td colspan="4">
                <asp:GridView ID="dtGrdCart" runat="server" AutoGenerateColumns="False" CellPadding="4" Visible="False" ForeColor="#333333" GridLines="None" Width="100%" OnRowDeleting="dtGrdCart_RowDeleting">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="medcnId" HeaderText="Medicine Id" ReadOnly="True">
                            <ControlStyle Width="2%" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="2%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="medcnNm" HeaderText="Medicine Name">
                            <ControlStyle Width="5%" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="medcnType" HeaderText="Medicine Type">
                            <ControlStyle Width="20%" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="medcnUnt" HeaderText="Unit">
                            <ControlStyle Width="5%" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="medcnQnttPerUnt" HeaderText="Quantity Per Unit">
                            <ControlStyle Width="10%" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="medcnRtPerUnt" HeaderText="Rate Per Unit">
                            <ControlStyle Width="5%" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="medcnQnttUnt" HeaderText="Order Quantities Units">
                            <ControlStyle Width="5%" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Amount">
                            <ControlStyle Width="5%" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" HeaderText="REMOVE" ShowDeleteButton="True" ShowCancelButton="False">
                            <ControlStyle Width="23%" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="23%" />
                        </asp:CommandField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#CC3300" Font-Bold="True" ForeColor="#FFFF99" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                <p style="color: red"></p>
            </td>
            <td align="left" width="20%">
                <p id="msgTtlAmnt" runat="server" class="Lbl-Msg">Total Amount : </p>
            </td>
            <td align="center" width="4%">
                <p style="font-weight: bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:Label ID="lblTotlAmnt" runat="server" ClientIDMode="Static" />
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <asp:Button ID="btnPlcOrdr" runat="server" Text="PLACE ORDER" Width="10%" OnClick="btnPlcOrdr_Click" CssClass="Btn" />
            </td>
        </tr>
    </table>
</asp:Content>

