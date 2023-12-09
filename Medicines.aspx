<%@ Page Title="" Language="C#" MasterPageFile="~/E-Medicines Services.master" AutoEventWireup="true" CodeFile="Medicines.aspx.cs" Inherits="Medicines" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function Validatin() {
            var Rslt = false;
            if (document.getElementById("txtMedcnName").value.length < 1) {
                document.getElementById("lblError").innerHTML = "Medicine Name Must Not Be Empty.";
            }
            else if (document.getElementById("txtMedcnDescrptn").value.length < 1) {
                document.getElementById("lblError").innerHTML = "Medicine Description Must Not Be Empty.";
            }
            else if (document.getElementById("txtMedcnQnttPrUnt").value.length < 1) {
                document.getElementById("lblError").innerHTML = "Medicine Quantity Per Unit Must Not Be Empty.";
            }
            else if (!DigitValidation(document.getElementById("txtMedcnQnttPrUnt").value)) {
                document.getElementById("lblError").innerHTML = "Enter Valid Medicine Quantity Per Unit.";
            }
            else if (document.getElementById("txtMedcnRtPrUnt").value.length < 1) {
                document.getElementById("lblError").innerHTML = "Medicine Rate Per Unit Must Not Be Empty.";
            }
            else if (!DigitValidation(document.getElementById("txtMedcnRtPrUnt").value)) {
                document.getElementById("lblError").innerHTML = "Enter Valid Medicine Rate Per Unit.";
            }
            else if (document.getElementById("txtMedcnStkUnt").value.length < 1) {
                document.getElementById("lblError").innerHTML = "Medicine Stock Must Not Be Empty.";
            }
            else {
                document.getElementById("lblError").innerHTML = "";
                Rslt = true;
            }
            return Rslt;
        }
    </script>
    <table border="0" class="Tbl-Outer">
        <tr>
            <td colspan="4" align="center">
                <table>
                    <tr>
                        <td class="Lbl-Inst">Note : All Fields With
                        </td>
                        <td>
                            <p style="color: red">*</p>
                        </td>
                        <td class="Lbl-Inst">Are Required.
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr width="100%">
            <td colspan="4" align="center">
                <asp:Label ID="lblError" ClientIDMode="Static" runat="server" CssClass="Lbl-Error" />
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                <p style="color: red">*</p>
            </td>
            <td align="left" width="20%">
                <p class="Lbl-Msg">Enter Medicine Name</p>
            </td>
            <td align="center" width="4%">
                <p style="font-weight: bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtMedcnName" runat="server" ClientIDMode="Static" />
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                <p style="color: red">*</p>
            </td>
            <td align="left" width="20%">
                <p class="Lbl-Msg">Enter Medicine Description</p>
            </td>
            <td align="center" width="4%">
                <p style="font-weight: bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtMedcnDescrptn" runat="server" ClientIDMode="Static" />
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                <p style="color: red">*</p>
            </td>
            <td align="left" width="20%">
                <p class="Lbl-Msg">Select Medicine Type</p>
            </td>
            <td align="center" width="4%">
                <p style="font-weight: bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:DropDownList ID="ddlMedcnTyp" runat="server" ClientIDMode="Static" Width="80%" Style="resize: none">
                    <asp:ListItem Selected="True" Text="TAB" Value="TAB"></asp:ListItem>
                    <asp:ListItem Text="GEL" Value="GEL"></asp:ListItem>
                    <asp:ListItem Text="LQD" Value="LQD"></asp:ListItem>
                    <asp:ListItem Text="OTHR" Value="OTHR"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                <p style="color: red">*</p>
            </td>
            <td align="left" width="20%">
                <p class="Lbl-Msg">Select Medicine Unit</p>
            </td>
            <td align="center" width="4%">
                <p style="font-weight: bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:DropDownList ID="ddlMedcnUnt" runat="server" ClientIDMode="Static" Width="80%" Style="resize: none">
                    <asp:ListItem Selected="True" Text="PCS" Value="PCS"></asp:ListItem>
                    <asp:ListItem Text="GM" Value="GM"></asp:ListItem>
                    <asp:ListItem Text="ML" Value="ML"></asp:ListItem>
                    <asp:ListItem Text="OTHR" Value="OTHR"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                <p style="color: red">*</p>
            </td>
            <td align="left" width="20%">
                <p class="Lbl-Msg">Enter Medicine Quantity Per Unit.</p>
            </td>
            <td align="center" width="4%">
                <p style="font-weight: bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtMedcnQnttPrUnt" runat="server" ClientIDMode="Static" Text="0" />
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                <p style="color: red">*</p>
            </td>
            <td align="left" width="20%">
                <p class="Lbl-Msg">Enter Medicine Rate Per Unit</p>
            </td>
            <td align="center" width="4%">
                <p style="font-weight: bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtMedcnRtPrUnt" runat="server" ClientIDMode="Static" Text="0" />
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                <p style="color: red">*</p>
            </td>
            <td align="left" width="20%">
                <p class="Lbl-Msg">Enter Medicine Stock Units</p>
            </td>
            <td align="center" width="4%">
                <p style="font-weight: bold">:</p>
            </td>
            <td align="left" width="46%">
                <asp:TextBox ID="txtMedcnStkUnt" runat="server" ClientIDMode="Static" Text="0" />
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <asp:Button ID="btnAddMdcn" runat="server" Text="ADD MEDICINE" Width="10%" OnClientClick="return Validatin()" OnClick="btnAddMdcn_Click" CssClass="Btn" />
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
            <asp:GridView ID="dtGrdMedcns" runat="server" AutoGenerateColumns="False" CellPadding="4" Visible="False" ForeColor="#333333" GridLines="None" Width="100%" OnRowDeleting="dtGrdMedcns_RowDeleting" OnRowEditing="dtGrdMedcns_RowEditing">
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
                    <asp:CommandField ButtonType="Button" HeaderText="EDIT" ShowCancelButton="False" ShowEditButton="True">
                        <ControlStyle Width="23%" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="23%" />
                    </asp:CommandField>
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

    </table>
</asp:Content>

