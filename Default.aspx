<%@ Page Title="" Language="C#" MasterPageFile="~/E-Medicines Services.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function Validatin()
        {
            var Rslt = false;
            if (document.getElementById("txtMedcnName").value.length < 1)
            {
                document.getElementById("lblError").innerHTML = "Select Medicine.";
            }
            else if (document.getElementById("txtMedcnQntt").value.length < 1) {
                document.getElementById("lblError").innerHTML = "Medicine Quantities Must Not Be Empty.";
            }
            else if (parseInt(document.getElementById("txtMedcnStkUnt").value)< 1)
            {
                document.getElementById("lblError").innerHTML = "Medicine Is Out Of Stock.";
            }
            else if (parseInt(document.getElementById("txtMedcnQntt").value) > parseInt(document.getElementById("txtMedcnStkUnt").value))
            {
                document.getElementById("lblError").innerHTML = "Medicine Quantities Must Be Less Than Or Equal To Stock Units.";
            }
            else if (parseInt(document.getElementById("txtMedcnQntt").value) < 1)
            {
                document.getElementById("lblError").innerHTML = "Medicine Quantities Mus Be Greater Than Or Equal To 1.";
            }
            else
            {
                document.getElementById("lblError").innerHTML = "";
                Rslt = true;
            }
            return Rslt;
        }
    </script>
    <table border="0" class="Tbl-Outer">
        <tr width="100%">
            <td colspan="4" align="center">
                <asp:Label ID="lblError" ClientIDMode="Static" runat="server" CssClass="Lbl-Error" />
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                <p style="color: red"></p>
            </td>
            <td align="left" width="20%">
                <p class="Lbl-Msg">Medicine Name</p>
            </td>
            <td align="center" width="4%">
                <p style="font-weight: bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtMedcnName" runat="server" ClientIDMode="Static" ReadOnly="true" />
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                <p style="color: red"></p>
            </td>
            <td align="left" width="20%">
                <p class="Lbl-Msg">Medicine Stock Units</p>
            </td>
            <td align="center" width="4%">
                <p style="font-weight: bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtMedcnStkUnt" runat="server" ClientIDMode="Static" ReadOnly="true" />
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                <p style="color: red"></p>
            </td>
            <td align="left" width="20%">
                <p class="Lbl-Msg">Enter Quantities Units</p>
            </td>
            <td align="center" width="4%">
                <p style="font-weight: bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtMedcnQntt" runat="server" ClientIDMode="Static" />
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <asp:Button ID="btnAddtoCart" runat="server" Text="ADD TO CART" Width="10%" OnClientClick="return Validatin()" OnClick="btnAddtoCart_Click" CssClass="Btn" />
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                <p style="color: red"></p>
            </td>
            <td align="left" width="20%">
                <p class="Lbl-Msg">Search Medicines.</p>
            </td>
            <td align="center" width="4%">
                <p style="font-weight: bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtSrchMedcn" runat="server" ClientIDMode="Static" />
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <asp:Button ID="btnSrch" runat="server" Text="SEARCH MEDICINE" Width="10%" OnClick="btnSrch_Click" CssClass="Btn" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="dtGrdMedcns" runat="server" AutoGenerateColumns="False" CellPadding="4" Visible="False" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="dtGrdMedcns_SelectedIndexChanged" AutoGenerateSelectButton="true">
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
                        <asp:BoundField DataField="medcnDescrptn" HeaderText="Description">
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
                        <asp:BoundField DataField="medcnStockUnt" HeaderText="Stock Units">
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
