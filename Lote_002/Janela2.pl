use Tk;
proc push_button {} {
	.ent insert 0 "Hello "
}
frame .frm -relief groove
label .lab -text "Enter name:"
entry .ent
button .but -text "Push Me" -command "push_button"
pack .lab -in .frm
pack .ent -in .frm
pack .frm
pack .but

MainLoop();