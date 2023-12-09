<%@ Page Title="" Language="C#" MasterPageFile="~/E-Medicines Services.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" class="Tbl-Outer">
        <tr>
            <td align="right" width="30%">
                <p style="color: red"></p>
            </td>
            <td align="left" width="20%">
                <p class="Lbl-Msg">Search Order By OrderId,Customer Name.</p>
            </td>
            <td align="center" width="4%">
                <p style="font-weight: bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtSrchOrdr" runat="server" ClientIDMode="Static" />
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <asp:Button ID="btnSrch" runat="server" Text="SEARCH" Width="10%" OnClick="btnSrch_Click" CssClass="Btn" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="dtGrdOrdrs" runat="server" AutoGenerateColumns="False" CellPadding="4" Visible="False" ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="usrFrstNm" HeaderText="First Name" ReadOnly="True">
                            <ControlStyle Width="2%" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="2%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="usrLstNm" HeaderText="Last Name">
                            <ControlStyle Width="5%" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="usrAddrs" HeaderText="Address">
                            <ControlStyle Width="5%" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="usrMoNo" HeaderText="Mobile No.">
                            <ControlStyle Width="20%" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Order Date">
                            <ControlStyle Width="5%" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                        </asp:BoundField>
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
    </table>
</asp:Content>

