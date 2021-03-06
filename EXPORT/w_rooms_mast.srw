$PBExportHeader$w_rooms_mast.srw
forward
global type w_rooms_mast from w_parent
end type
end forward

global type w_rooms_mast from w_parent
boolean righttoleft = true
end type
global w_rooms_mast w_rooms_mast

on w_rooms_mast.create
int iCurrent
call super::create
end on

on w_rooms_mast.destroy
call super::destroy
end on

type cb_exit from w_parent`cb_exit within w_rooms_mast
end type

type cb_cancel from w_parent`cb_cancel within w_rooms_mast
end type

type cb_ok from w_parent`cb_ok within w_rooms_mast
end type

event cb_ok::clicked;SetMicro('Updating Records....')
SetPointer(HourGlass!)
String ls_error , ls_room_sts
long ll_row , ll_room_id ,ll_bed_id,ll_beds,ll_beds_loop
decimal ld_price


This.Enabled = False
uo_1.st_mode.Text = 'Update'
If dw_1.AcceptText() = -1 Then
	fn_message('IF-0026','')
	Return
End If

If ins_option = 'D' Then

	If fn_message('DL-0002','') = 1 Then
		
		dw_1.SelectRow(dw_1.GetRow(),TRUE)
		ll_room_id=dw_1.getitemnumber(dw_1.GetRow(),'systemid')
		update BED_INVENTORY
		set BED_C_STATUS='D'
		where ROOM_C_ID=:ll_room_id;
		//dw_1.DeleteRow(dw_1.GetRow())
		dw_1.object.room_c_status[dw_1.GetRow()]='D'
	Else
		Return
	End If
End If



//===========
if ins_option='A' then
	for ll_row=1 to dw_1.rowcount() 
	if 	dw_1.getitemstring(ll_row,'room_c_status') = 'N' then
		ld_price=dw_1.getitemdecimal(ll_row,'systemid')
		
		select seq_systemid.nextval into :ll_room_id from dual ;
		dw_1.object.systemid[ll_row]=ll_room_id
				If dw_1.AcceptText() = -1 Then
					fn_message('IF-0026','')
					Return
				End If
		ll_beds=dw_1.object.beds[ll_row]	
		
		for ll_beds_loop = 1 to ll_beds 
			select SEQ_BEDS.nextval into :ll_bed_id  from dual ;		
			insert into bed_inventory values 
			(:ll_room_id,:ll_room_id,:ll_bed_id,'A',:ld_price,:gb_d_order_date,:gb_s_usrid );
					if sqlca.sqlcode <> 0 then 
						ls_error = Sqlca.SqlErrText
						rollback;
						fn_message('UP-0005',ls_error)
					end if 
		next	
		
		dw_1.object.room_c_status[ll_row]='A'
		
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

type cb_print from w_parent`cb_print within w_rooms_mast
end type

type cb_next from w_parent`cb_next within w_rooms_mast
end type

type cb_del from w_parent`cb_del within w_rooms_mast
end type

type cb_edit from w_parent`cb_edit within w_rooms_mast
end type

event cb_edit::clicked;call super::clicked;dw_1.Modify("beds.Protect = 0")
dw_1.Modify("systemid.Protect =1")
dw_1.Modify("room_c_type.Protect = 1")
end event

type cb_add from w_parent`cb_add within w_rooms_mast
end type

event cb_add::clicked;call super::clicked;dw_1.object.t_1.text="السعر "
dw_1.Modify("beds.Protect = 0")
dw_1.Modify("systemid.Protect =0")
dw_1.Modify("room_c_type.Protect = 0")
end event

type dw_1 from w_parent`dw_1 within w_rooms_mast
integer x = 174
integer width = 3365
string dataobject = "dw_rooms_mast"
end type

event dw_1::itemchanged;call super::itemchanged;long ll_sysid,ll_bed_count

choose case dwo.name
	case 'room_c_type'
	if ins_option = 'A' then 
		object.entered_by[row]=gb_s_usrid
		object.entery_date[row]=gb_d_order_date
		if data = 'V' or data='N' then
			object.beds[row]=1
			Modify("beds.Protect = 1")
		end if 
		if data = 'D' then 
			object.beds[row]=2
			Modify("beds.Protect = 1")
		end if 
			if data = 'L' then 
			Modify("beds.Protect = 0")
		end if
		//=========================
		object.room_c_status[row]='N'
	
	end if 
	
case 'beds'

	 if ins_option = 'E' and getitemstring(row,'room_c_type')='L' then
             		ll_sysid= getitemdecimal(row,'systemid')
						 
				select count(*) into :ll_bed_count  
				from bed_inventory 
				where systemid =:ll_sysid
				and room_c_id=:ll_sysid
				AND BED_C_STATUS in ('A','F');
				
				if sqlca.sqlcode <> 0 then 
					return 1
					fn_message('IF-0002','No Rooms Founded')
				end if 
				
					if long(data) <= ll_bed_count then 
						fn_message('IF-0013','الرجاء  حذف عدد السرائر المناسب أولا')
						return 1
					else 
					cb_ok.enabled=true 
				end if 
				
 	end if 
case 'systemid'
	cb_ok.enabled=true 
	cb_next.enabled=true 
end choose
end event

type uo_1 from w_parent`uo_1 within w_rooms_mast
end type

type gb_1 from w_parent`gb_1 within w_rooms_mast
end type

type st_name from w_parent`st_name within w_rooms_mast
end type

