$PBExportHeader$w_bill_payement_return_other.srw
forward
global type w_bill_payement_return_other from w_parent_3dw
end type
type pb_1 from picturebutton within w_bill_payement_return_other
end type
type gb_1 from groupbox within w_bill_payement_return_other
end type
type gb_2 from groupbox within w_bill_payement_return_other
end type
end forward

global type w_bill_payement_return_other from w_parent_3dw
integer width = 5289
integer height = 3316
string title = "إرجاع فاتورة"
string menuname = "mn_recp_main"
boolean righttoleft = true
pb_1 pb_1
gb_1 gb_1
gb_2 gb_2
end type
global w_bill_payement_return_other w_bill_payement_return_other

type variables
long  il_bill_id
Date from_date,t_date 
string s_dw2select 
end variables

forward prototypes
public subroutine wfn_enable ()
end prototypes

public subroutine wfn_enable ();dw_1.Modify("Datawindow.Readonly = No")
cb_edit.Enabled 	= TRUE
cb_add.Enabled 	= TRUE
cb_add_item.Enabled 	= FALSE
cb_cancel_item.Enabled 	= FALSE
cb_ok.Enabled 	= FALSE
cb_cancel.Enabled = TRUE
end subroutine

on w_bill_payement_return_other.create
int iCurrent
call super::create
if this.MenuName = "mn_recp_main" then this.MenuID = create mn_recp_main
this.pb_1=create pb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.gb_1
this.Control[iCurrent+3]=this.gb_2
end on

on w_bill_payement_return_other.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.pb_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;dw_1.InsertRow(0)

//dw_2.SetTransObject(SqlCa)
 
//dw_4.Retrieve()
//
//dw_3.SetTransObject(Sqlca)
s_dw2select = dw_2.getSqlSelect()
 dw_2.SetRowFocusIndicator(Hand!)
 
 
 /*
 	dw_2.ClearValues('bill_issue_bill_status')
	dw_2.SetValue('bill_issue_bill_status',1,'إرجاع الفاتورة~tReturn')
	 
 */
 cb_cancel.TriggerEvent(Clicked!)
 uo_1.st_user.Text = gb_s_usrid
end event

type cb_exit from w_parent_3dw`cb_exit within w_bill_payement_return_other
integer x = 1321
end type

type cb_add_item from w_parent_3dw`cb_add_item within w_bill_payement_return_other
boolean visible = false
integer y = 1548
end type

type cb_cancel_item from w_parent_3dw`cb_cancel_item within w_bill_payement_return_other
boolean visible = false
end type

type cb_ok from w_parent_3dw`cb_ok within w_bill_payement_return_other
end type

event cb_ok::clicked;string ls_err
 long rownum
 longlong ll_product
 long ll_amt
dw_2.accepttext()

//bill_issue_detail_pass_by
if dw_2.update() <> 1 then
	ls_err=SQLCA.SQLErrText
	rollback;
	fn_message('UP-0005',ls_err)
ELSE
	for rownum=1 to dw_3.rowcount()
	dw_3.setItem(rownum,'bill_issue_detail_pass_by',gb_s_usrid)
	if dw_2.getitemstring(dw_2.getrow(),'bill_issue_bill_status') = 'Cancle' then
	ll_amt=dw_3.getitemnumber(rownum,'quantity')
	ll_product=dw_3.getitemnumber(rownum,'product_id')
	if not fn_order_revert(ll_product,ll_amt,gb_l_main_store) then
	
		ls_err=SQLCA.SQLErrText
		rollback;
		fn_message('UP-0005',ls_err)
		return 1
		cb_cancel.TriggerEvent(Clicked!)
	end if 	
         end if 
    Next
	IF dw_3.update() <> 1 then
		ls_err=SQLCA.SQLErrText
		rollback;
		fn_message('UP-0005',ls_err)
	else
		commit;
		fn_message('UP-0004','')
	end if
end if 
cb_cancel.TriggerEvent(Clicked!)
ins_option=''

end event

type cb_add from w_parent_3dw`cb_add within w_bill_payement_return_other
boolean visible = false
end type

type cb_cancel from w_parent_3dw`cb_cancel within w_bill_payement_return_other
end type

event cb_cancel::clicked;//dw_1.SetTransObject(sqlca)

dw_3.SetTransObject(sqlca)


dw_1.reset()
dw_2.reset()
dw_3.reset()

dw_1.insertrow(0)
//dw_2.insertrow(0)
 dw_3.insertrow(0)
dw_1.enabled=True

dw_2.enabled=True
dw_1.enabled=True
dw_3.reset()
dw_3.enabled=false
uo_1.st_mode.Text = 'Cancel'
 ins_option 			= ''
 setnull(ins_option)
wfn_enable()
 dw_2.SetTransObject(sqlca)
 dw_2.ClearValues('bill_issue_bill_status')
	dw_2.SetValue('bill_issue_bill_status',1,'إرجاع الفاتورة~tReturn')
// dw_2.retrieve(ins_option,string(today(),'dd/mm/yyyy'),ins_option)
 
 
uo_1.st_mode.Text = 'Ready'
dw_1.Modify("Datawindow.Readonly =NO")
cb_add.SetFocus()
SetMicroHelp('Ready')
end event

type cb_edit from w_parent_3dw`cb_edit within w_bill_payement_return_other
boolean visible = false
end type

type uo_1 from w_parent_3dw`uo_1 within w_bill_payement_return_other
end type

type dw_3 from w_parent_3dw`dw_3 within w_bill_payement_return_other
integer x = 384
integer y = 1564
integer width = 3771
integer height = 848
string dataobject = "dw_bill_issue_detail"
boolean hscrollbar = false
end type

type dw_2 from w_parent_3dw`dw_2 within w_bill_payement_return_other
integer x = 142
integer y = 756
integer width = 4873
integer height = 632
string dataobject = "dw_bill_header"
boolean vscrollbar = true
end type

event dw_2::buttonclicked;call super::buttonclicked; 
 dw_3.retrieve(this.object.bill_issue_systemid[row])
end event

event dw_2::clicked;call super::clicked;//messagebox('','u r here ')
 dw_3.retrieve(this.object.bill_issue_systemid[row])
 cb_ok.Enabled=True
end event

type dw_1 from w_parent_3dw`dw_1 within w_bill_payement_return_other
integer x = 1221
integer y = 280
integer width = 2007
integer height = 252
string dataobject = "dw_search_bill"
end type

event dw_1::itemchanged;call super::itemchanged;
choose case GetColumnName()
// from_date,to_date, il_bill_id
case 'bill_no'
	il_bill_id=long(Data)
case 'fr_date'	
	from_date=date(string(data,'dd/mm/yyyy'))
	
case 'to_date'
	t_date = date(string(data,'dd/mm/yyyy'))
	
END Choose 
end event

type ln_1 from w_parent_3dw`ln_1 within w_bill_payement_return_other
end type

type ln_2 from w_parent_3dw`ln_2 within w_bill_payement_return_other
integer beginx = 59
integer beginy = 1432
integer endx = 5033
integer endy = 1432
end type

type dw_4 from w_parent_3dw`dw_4 within w_bill_payement_return_other
integer y = 0
integer height = 188
end type

type pb_1 from picturebutton within w_bill_payement_return_other
integer x = 2775
integer y = 560
integer width = 443
integer height = 148
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = arabiccharset!
fontpitch fontpitch = variable!
string facename = "PT Bold Heading"
string text = "بحث"
string picturename = "Images\BUTTON.jpg"
string disabledname = "Images\BUTTON3.jpg"
vtextalign vtextalign = vcenter!
end type

event clicked;dw_1.ACCEPTText()
 
 il_bill_id =  long(dw_1.object.bill_no[1])
from_date   = date(string(dw_1.object.fr_date[1] ,'dd/mm/yyyy'))
t_date   =   date(string(dw_1.object.to_date[1])) 
if dw_2.retrieve(il_bill_id,from_date,t_date,'Paid','Other') < 1 then 
	fn_message('IF-0002','')
	return 1
end if
dw_2.ClearValues('bill_issue_bill_status')
	dw_2.SetValue('bill_issue_bill_status',1,'إرجاع الفاتورة~tReturn')
 dw_2.SetRowFocusIndicator(Hand!)
 
end event

type gb_1 from groupbox within w_bill_payement_return_other
integer x = 937
integer y = 224
integer width = 2363
integer height = 508
integer taborder = 20
integer textsize = -14
integer weight = 700
fontcharset fontcharset = arabiccharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "PT Bold Heading"
long textcolor = 33554432
long backcolor = 15780518
string text = "بحث"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_bill_payement_return_other
integer x = 293
integer y = 1460
integer width = 3950
integer height = 1000
integer taborder = 40
integer textsize = -14
integer weight = 700
fontcharset fontcharset = arabiccharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "PT Bold Heading"
long textcolor = 33554432
long backcolor = 15780518
string text = "تفاصيل الفاتورة"
end type

