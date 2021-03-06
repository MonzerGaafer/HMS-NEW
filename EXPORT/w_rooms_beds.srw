$PBExportHeader$w_rooms_beds.srw
forward
global type w_rooms_beds from w_parent
end type
end forward

global type w_rooms_beds from w_parent
boolean righttoleft = true
end type
global w_rooms_beds w_rooms_beds

on w_rooms_beds.create
int iCurrent
call super::create
end on

on w_rooms_beds.destroy
call super::destroy
end on

type cb_exit from w_parent`cb_exit within w_rooms_beds
end type

type cb_cancel from w_parent`cb_cancel within w_rooms_beds
end type

type cb_ok from w_parent`cb_ok within w_rooms_beds
end type

event cb_ok::clicked;SetMicro('Updating Records....')
SetPointer(HourGlass!)
String ls_error , ls_room_sts
long ll_row , ll_room_id ,ll_bed_id,ll_beds,ll_beds_loop
decimal ld_price

uo_1.st_mode.Text = 'Update'
If dw_1.AcceptText() = -1 Then
	fn_message('IF-0026','')
	Return
End If

If ins_option = 'D' Then
	If fn_message('DL-0002','') = 1 Then
	//	dw_1.DeleteRow(dw_1.GetRow())
	dw_1.object.bed_inventory_bed_c_status[dw_1.GetRow()]='D'
	Else
		Return
	End If
End If

This.Enabled = False

//===========
if ins_option='A' then
	FOR ll_row=1 to dw_1.rowcount()
		if dw_1.object.bed_inventory_bed_c_id[ll_row]= -1 then
			select SEQ_BEDS.nextval into :ll_bed_id  from dual ;	
			dw_1.object.bed_inventory_bed_c_id[ll_row]=ll_bed_id
		end if 
next 
end if
 
dw_1.accepttext()

If dw_1.Update() = -1 Then
	ls_error = Sqlca.SqlErrText
	RollBack;
	fn_message('UP-0005',ls_error)
	cb_ok.Enabled = True
	Return
Else
	Commit;
	fn_message('UP-0004','')
End If

cb_cancel.TriggerEvent(Clicked!)

end event

type cb_print from w_parent`cb_print within w_rooms_beds
end type

type cb_next from w_parent`cb_next within w_rooms_beds
end type

type cb_del from w_parent`cb_del within w_rooms_beds
end type

type cb_edit from w_parent`cb_edit within w_rooms_beds
end type

event cb_edit::clicked;call super::clicked;dw_1.modify("bed_inventory_room_c_id.protect=1")
dw_1.modify("bed_inventory_bed_c_id.protect=1")
end event

type cb_add from w_parent`cb_add within w_rooms_beds
end type

event cb_add::clicked;call super::clicked;dw_1.modify("bed_inventory_room_c_id.protect=0")
dw_1.modify("bed_inventory_bed_c_id.protect=0")
end event

type dw_1 from w_parent`dw_1 within w_rooms_beds
integer x = 1083
integer y = 212
integer width = 1710
string dataobject = "dw_rooms_beds"
end type

event dw_1::itemchanged;call super::itemchanged;long ll_beds,ll_bed_count, ll_room_id, ll_bed_id

choose case dwo.name

	case 'bed_inventory_room_c_id'
		if ins_option ='A' then
			dw_1.modify('bed_inventory_room_c_id text color=red')
		//select SEQ_BEDS.nextval into :ll_bed_id  from dual ;	
			object.bed_inventory_bed_c_id[row]=-1
			
		end if 
		
	case 'bed_inventory_price'
		if ins_option = 'A' then
			ll_room_id=getitemnumber(row,'bed_inventory_room_c_id')
			
			SELECT BEDS into :ll_beds FROM ROOM_RECORDS
			WHERE SYSTEMID=:ll_room_id;
			if sqlca.sqlcode<> 0 or ll_beds =0 then
				fn_message('IF-0002','عدد السرائر للغرفة')
				cb_cancel.TriggerEvent(Clicked!)
			end if 
			SELECT COUNT(*) into :ll_bed_count  FROM BED_INVENTORY
			WHERE ROOM_C_ID=:ll_room_id
			AND BED_C_STATUS in ('A','F') ;
			
			if ll_bed_count >= ll_beds then
				fn_message('IF-0012','')
				cb_cancel.TriggerEvent(Clicked!)
			else
			cb_ok.enabled=true 
		end if 
		end if 
		
case 'bed_inventory_bed_c_status'

if ins_option = 'E' then
	if data='A' then
	ll_room_id=getitemnumber(row,'bed_inventory_room_c_id')
			
			SELECT BEDS into :ll_beds FROM ROOM_RECORDS
			WHERE SYSTEMID=:ll_room_id;
			if sqlca.sqlcode<> 0 or ll_beds =0 then
				fn_message('IF-0002','عدد السرائر للغرفة')
				cb_cancel.TriggerEvent(Clicked!)
			end if 
			SELECT COUNT(*)  into :ll_bed_count  FROM BED_INVENTORY
			WHERE ROOM_C_ID=:ll_room_id
			AND BED_C_STATUS IN ('A','F') ;
			
			if ll_bed_count + 1 >= ll_beds then
				fn_message('IF-0012','')
				cb_cancel.TriggerEvent(Clicked!)
			else
			end if 
		end if 
end if 
end choose
end event

type uo_1 from w_parent`uo_1 within w_rooms_beds
end type

type gb_1 from w_parent`gb_1 within w_rooms_beds
end type

type st_name from w_parent`st_name within w_rooms_beds
end type

