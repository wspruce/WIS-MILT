#############################################################################
# Generated by PAGE version 5.0.3
#  in conjunction with Tcl version 8.6
#  Mar 23, 2020 01:58:36 PM JST  platform: Windows NT
set vTcl(timestamp) ""


if {!$vTcl(borrow) && !$vTcl(template)} {

set vTcl(actual_gui_bg) #d9d9d9
set vTcl(actual_gui_fg) #000000
set vTcl(actual_gui_analog) #ececec
set vTcl(actual_gui_menu_analog) #ececec
set vTcl(actual_gui_menu_bg) #d9d9d9
set vTcl(actual_gui_menu_fg) #000000
set vTcl(complement_color) #d9d9d9
set vTcl(analog_color_p) #d9d9d9
set vTcl(analog_color_m) #ececec
set vTcl(active_fg) #000000
set vTcl(actual_gui_menu_active_bg)  #ececec
set vTcl(pr,menufgcolor) #000000
set vTcl(pr,menubgcolor) #d9d9d9
set vTcl(pr,menuanalogcolor) #ececec
set vTcl(pr,treehighlight) firebrick
set vTcl(pr,autoalias) 1
set vTcl(pr,relative_placement) 1
set vTcl(mode) Relative
}




proc vTclWindow.top43 {base} {
    global vTcl
    if {$base == ""} {
        set base .top43
    }
    if {[winfo exists $base]} {
        wm deiconify $base; return
    }
    set top $base
    ###################
    # CREATING WIDGETS
    ###################
    vTcl::widgets::core::toplevel::createCmd $top -class Toplevel \
        -background $vTcl(actual_gui_bg) \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black 
    wm focusmodel $top passive
    wm geometry $top 640x164+587+365
    update
    # set in toplevel.wgt.
    global vTcl
    global img_list
    set vTcl(save,dflt,origin) 0
    wm maxsize $top 3844 1061
    wm minsize $top 120 1
    wm overrideredirect $top 0
    wm resizable $top 0 0
    wm deiconify $top
    wm title $top "出水"
    vTcl:DefineAlias "$top" "Toplevel1" vTcl:Toplevel:WidgetProc "" 1
    set vTcl(real_top) {}
    vTcl:withBusyCursor {
    label $top.lab46 \
        -activebackground #f9f9f9 -activeforeground black \
        -background $vTcl(actual_gui_bg) -disabledforeground #a3a3a3 \
        -font TkDefaultFont -foreground $vTcl(actual_gui_fg) \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black \
        -text 観測項目 
    vTcl:DefineAlias "$top.lab46" "label_item" vTcl:WidgetProc "Toplevel1" 1
    label $top.lab47 \
        -activebackground #f9f9f9 -activeforeground black \
        -background $vTcl(actual_gui_bg) -disabledforeground #a3a3a3 \
        -font TkDefaultFont -foreground $vTcl(actual_gui_fg) \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black \
        -text 水系名 
    vTcl:DefineAlias "$top.lab47" "label_basin" vTcl:WidgetProc "Toplevel1" 1
    label $top.lab48 \
        -activebackground #f9f9f9 -activeforeground black \
        -background $vTcl(actual_gui_bg) -disabledforeground #a3a3a3 \
        -font TkDefaultFont -foreground $vTcl(actual_gui_fg) \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black \
        -text 都道府県 
    vTcl:DefineAlias "$top.lab48" "label_prefectures" vTcl:WidgetProc "Toplevel1" 1
    ttk::combobox $top.tCo49 \
        -values {水位流量 降雨} -font TkTextFont -textvariable combobox \
        -foreground {} -background {} -takefocus {} 
    vTcl:DefineAlias "$top.tCo49" "combobox_item" vTcl:WidgetProc "Toplevel1" 1
    ttk::combobox $top.tCo50 \
        -font TkTextFont -textvariable combobox -foreground {} -background {} \
        -takefocus {} 
    vTcl:DefineAlias "$top.tCo50" "combobox_basin" vTcl:WidgetProc "Toplevel1" 1
    ttk::combobox $top.tCo51 \
        -font TkTextFont -textvariable combobox -foreground {} -background {} \
        -takefocus {} 
    vTcl:DefineAlias "$top.tCo51" "combobox_prefectures" vTcl:WidgetProc "Toplevel1" 1
    ttk::separator $top.tSe52
    vTcl:DefineAlias "$top.tSe52" "TSeparator1" vTcl:WidgetProc "Toplevel1" 1
    vTcl::widgets::ttk::scrolledlistbox::CreateCmd $top.scr54 \
        -background $vTcl(actual_gui_bg) -height 75 \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black \
        -width 125 
    vTcl:DefineAlias "$top.scr54" "listbox_result" vTcl:WidgetProc "Toplevel1" 1

    $top.scr54.01 configure -background white \
        -cursor xterm \
        -disabledforeground #a3a3a3 \
        -font TkFixedFont \
        -foreground black \
        -height 3 \
        -highlightbackground #d9d9d9 \
        -highlightcolor #d9d9d9 \
        -selectbackground #c4c4c4 \
        -selectforeground black \
        -width 10
    vTcl:copy_lock $top.scr54
    ttk::style configure TButton -background $vTcl(actual_gui_bg)
    ttk::style configure TButton -foreground $vTcl(actual_gui_fg)
    ttk::style configure TButton -font "$vTcl(actual_gui_font_dft_desc)"
    ttk::button $top.tBu56 \
        -takefocus {} -text 検　索 
    vTcl:DefineAlias "$top.tBu56" "button_search" vTcl:WidgetProc "Toplevel1" 1
    ttk::style configure TRadiobutton -background $vTcl(actual_gui_bg)
    ttk::style configure TRadiobutton -foreground $vTcl(actual_gui_fg)
    ttk::style configure TRadiobutton -font "$vTcl(actual_gui_font_dft_desc)"
    ttk::radiobutton $top.tRa44 \
        -text 1時間間隔 
    vTcl:DefineAlias "$top.tRa44" "radiobutton_hour" vTcl:WidgetProc "Toplevel1" 1
    ttk::style configure TRadiobutton -background $vTcl(actual_gui_bg)
    ttk::style configure TRadiobutton -foreground $vTcl(actual_gui_fg)
    ttk::style configure TRadiobutton -font "$vTcl(actual_gui_font_dft_desc)"
    ttk::radiobutton $top.tRa45 \
        -text リアルタイム 
    vTcl:DefineAlias "$top.tRa45" "radiobutton_realtime" vTcl:WidgetProc "Toplevel1" 1
    label $top.lab49 \
        -activebackground #f9f9f9 -activeforeground black \
        -background $vTcl(actual_gui_bg) -disabledforeground #a3a3a3 \
        -font TkDefaultFont -foreground $vTcl(actual_gui_fg) \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black \
        -text 開始日付 
    vTcl:DefineAlias "$top.lab49" "label_start" vTcl:WidgetProc "Toplevel1" 1
    label $top.lab50 \
        -activebackground #f9f9f9 -activeforeground black \
        -background $vTcl(actual_gui_bg) -disabledforeground #a3a3a3 \
        -font TkDefaultFont -foreground $vTcl(actual_gui_fg) \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black \
        -text 終了日付 
    vTcl:DefineAlias "$top.lab50" "label_end" vTcl:WidgetProc "Toplevel1" 1
    spinbox $top.spi51 \
        -activebackground #f9f9f9 -background white -buttonbackground #d9d9d9 \
        -disabledforeground #a3a3a3 -font TkDefaultFont -foreground black \
        -from 1.0 -highlightbackground black -highlightcolor black \
        -increment 1.0 -insertbackground black -selectbackground #c4c4c4 \
        -selectforeground black -textvariable spinbox -to 100.0 
    vTcl:DefineAlias "$top.spi51" "spinbox_start_year" vTcl:WidgetProc "Toplevel1" 1
    label $top.lab52 \
        -activebackground #f9f9f9 -activeforeground black \
        -background $vTcl(actual_gui_bg) -disabledforeground #a3a3a3 \
        -font TkDefaultFont -foreground $vTcl(actual_gui_fg) \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black \
        -text 年 
    vTcl:DefineAlias "$top.lab52" "label_start_year" vTcl:WidgetProc "Toplevel1" 1
    label $top.lab53 \
        -activebackground #f9f9f9 -activeforeground black \
        -background $vTcl(actual_gui_bg) -disabledforeground #a3a3a3 \
        -font TkDefaultFont -foreground $vTcl(actual_gui_fg) \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black \
        -text 月 
    vTcl:DefineAlias "$top.lab53" "label_start_month" vTcl:WidgetProc "Toplevel1" 1
    label $top.lab54 \
        -activebackground #f9f9f9 -activeforeground black \
        -background $vTcl(actual_gui_bg) -disabledforeground #a3a3a3 \
        -font TkDefaultFont -foreground $vTcl(actual_gui_fg) \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black \
        -text 日 
    vTcl:DefineAlias "$top.lab54" "label_start_day" vTcl:WidgetProc "Toplevel1" 1
    spinbox $top.spi55 \
        -activebackground #f9f9f9 -background white -buttonbackground #d9d9d9 \
        -disabledforeground #a3a3a3 -font TkDefaultFont -foreground black \
        -from 1.0 -highlightbackground black -highlightcolor black \
        -increment 1.0 -insertbackground black -selectbackground #c4c4c4 \
        -selectforeground black -textvariable spinbox -to 100.0 
    vTcl:DefineAlias "$top.spi55" "spinbox_start_month" vTcl:WidgetProc "Toplevel1" 1
    spinbox $top.spi56 \
        -activebackground #f9f9f9 -background white -buttonbackground #d9d9d9 \
        -disabledforeground #a3a3a3 -font TkDefaultFont -foreground black \
        -from 1.0 -highlightbackground black -highlightcolor black \
        -increment 1.0 -insertbackground black -selectbackground #c4c4c4 \
        -selectforeground black -textvariable spinbox -to 100.0 
    vTcl:DefineAlias "$top.spi56" "spinbox_start_day" vTcl:WidgetProc "Toplevel1" 1
    label $top.lab57 \
        -activebackground #f9f9f9 -activeforeground black \
        -background $vTcl(actual_gui_bg) -disabledforeground #a3a3a3 \
        -font TkDefaultFont -foreground $vTcl(actual_gui_fg) \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black \
        -text 年 
    vTcl:DefineAlias "$top.lab57" "label_end_year" vTcl:WidgetProc "Toplevel1" 1
    label $top.lab58 \
        -activebackground #f9f9f9 -activeforeground black \
        -background $vTcl(actual_gui_bg) -disabledforeground #a3a3a3 \
        -font TkDefaultFont -foreground $vTcl(actual_gui_fg) \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black \
        -text 月 
    vTcl:DefineAlias "$top.lab58" "label_end_month" vTcl:WidgetProc "Toplevel1" 1
    label $top.lab59 \
        -activebackground #f9f9f9 -activeforeground black \
        -background $vTcl(actual_gui_bg) -disabledforeground #a3a3a3 \
        -font TkDefaultFont -foreground $vTcl(actual_gui_fg) \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black \
        -text 日 
    vTcl:DefineAlias "$top.lab59" "label_end_day" vTcl:WidgetProc "Toplevel1" 1
    spinbox $top.spi60 \
        -activebackground #f9f9f9 -background white -buttonbackground #d9d9d9 \
        -disabledforeground #a3a3a3 -font TkDefaultFont -foreground black \
        -from 1.0 -highlightbackground black -highlightcolor black \
        -increment 1.0 -insertbackground black -selectbackground #c4c4c4 \
        -selectforeground black -textvariable spinbox -to 100.0 
    vTcl:DefineAlias "$top.spi60" "spinbox_end_year" vTcl:WidgetProc "Toplevel1" 1
    spinbox $top.spi61 \
        -activebackground #f9f9f9 -background white -buttonbackground #d9d9d9 \
        -disabledforeground #a3a3a3 -font TkDefaultFont -foreground black \
        -from 1.0 -highlightbackground black -highlightcolor black \
        -increment 1.0 -insertbackground black -selectbackground #c4c4c4 \
        -selectforeground black -textvariable spinbox -to 100.0 
    vTcl:DefineAlias "$top.spi61" "spinbox_end_month" vTcl:WidgetProc "Toplevel1" 1
    spinbox $top.spi62 \
        -activebackground #f9f9f9 -background white -buttonbackground #d9d9d9 \
        -disabledforeground #a3a3a3 -font TkDefaultFont -foreground black \
        -from 1.0 -highlightbackground black -highlightcolor black \
        -increment 1.0 -insertbackground black -selectbackground #c4c4c4 \
        -selectforeground black -textvariable spinbox -to 100.0 
    vTcl:DefineAlias "$top.spi62" "spinbox_end_day" vTcl:WidgetProc "Toplevel1" 1
    ttk::style configure TButton -background $vTcl(actual_gui_bg)
    ttk::style configure TButton -foreground $vTcl(actual_gui_fg)
    ttk::style configure TButton -font "$vTcl(actual_gui_font_dft_desc)"
    ttk::button $top.tBu63 \
        -takefocus {} -text データ出力 
    vTcl:DefineAlias "$top.tBu63" "button_output" vTcl:WidgetProc "Toplevel1" 1
    ###################
    # SETTING GEOMETRY
    ###################
    place $top.lab46 \
        -in $top -x 0 -relx 0.017 -y 0 -rely 0.055 -width 0 -relwidth 0.091 \
        -height 0 -relheight 0.128 -anchor nw -bordermode ignore 
    place $top.lab47 \
        -in $top -x 0 -relx 0.017 -y 0 -rely 0.22 -width 0 -relwidth 0.07 \
        -height 0 -relheight 0.128 -anchor nw -bordermode ignore 
    place $top.lab48 \
        -in $top -x 0 -relx 0.017 -y 0 -rely 0.384 -width 0 -relwidth 0.091 \
        -height 0 -relheight 0.128 -anchor nw -bordermode ignore 
    place $top.tCo49 \
        -in $top -x 0 -relx 0.117 -y 0 -rely 0.055 -width 0 -relwidth 0.272 \
        -height 0 -relheight 0.128 -anchor nw -bordermode ignore 
    place $top.tCo50 \
        -in $top -x 0 -relx 0.117 -y 0 -rely 0.22 -width 0 -relwidth 0.272 \
        -height 0 -relheight 0.128 -anchor nw -bordermode ignore 
    place $top.tCo51 \
        -in $top -x 0 -relx 0.117 -y 0 -rely 0.384 -width 0 -relwidth 0.272 \
        -height 0 -relheight 0.128 -anchor nw -bordermode ignore 
    place $top.tSe52 \
        -in $top -x 0 -relx 0.017 -y 0 -rely 0.549 -width 0 -relwidth 0.967 \
        -height 0 -relheight 0.012 -anchor nw -bordermode inside 
    place $top.scr54 \
        -in $top -x 0 -relx 0.6 -y 0 -rely 0.055 -width 0 -relwidth 0.384 \
        -height 0 -relheight 0.445 -anchor nw -bordermode ignore 
    place $top.tBu56 \
        -in $top -x 0 -relx 0.422 -y 0 -rely 0.183 -width 97 -relwidth 0 \
        -height 27 -relheight 0 -anchor nw -bordermode ignore 
    place $top.tRa44 \
        -in $top -x 0 -relx 0.031 -y 0 -rely 0.61 -width 0 -relwidth 0.131 \
        -height 0 -relheight 0.14 -anchor nw -bordermode ignore 
    place $top.tRa45 \
        -in $top -x 0 -relx 0.031 -y 0 -rely 0.793 -width 0 -relwidth 0.163 \
        -height 0 -relheight 0.14 -anchor nw -bordermode ignore 
    place $top.lab49 \
        -in $top -x 0 -relx 0.313 -y 0 -rely 0.61 -width 0 -relwidth 0.084 \
        -height 0 -relheight 0.14 -anchor nw -bordermode ignore 
    place $top.lab50 \
        -in $top -x 0 -relx 0.313 -y 0 -rely 0.793 -width 0 -relwidth 0.084 \
        -height 0 -relheight 0.14 -anchor nw -bordermode ignore 
    place $top.spi51 \
        -in $top -x 0 -relx 0.406 -y 0 -rely 0.61 -width 0 -relwidth 0.102 \
        -height 0 -relheight 0.128 -anchor nw -bordermode ignore 
    place $top.lab52 \
        -in $top -x 0 -relx 0.516 -y 0 -rely 0.61 -width 0 -relwidth 0.028 \
        -height 0 -relheight 0.14 -anchor nw -bordermode ignore 
    place $top.lab53 \
        -in $top -x 0 -relx 0.609 -y 0 -rely 0.61 -width 0 -relwidth 0.028 \
        -height 0 -relheight 0.14 -anchor nw -bordermode ignore 
    place $top.lab54 \
        -in $top -x 0 -relx 0.703 -y 0 -rely 0.61 -width 0 -relwidth 0.027 \
        -height 0 -relheight 0.14 -anchor nw -bordermode ignore 
    place $top.spi55 \
        -in $top -x 0 -relx 0.547 -y 0 -rely 0.61 -width 0 -relwidth 0.055 \
        -height 0 -relheight 0.128 -anchor nw -bordermode ignore 
    place $top.spi56 \
        -in $top -x 0 -relx 0.641 -y 0 -rely 0.61 -width 0 -relwidth 0.055 \
        -height 0 -relheight 0.128 -anchor nw -bordermode ignore 
    place $top.lab57 \
        -in $top -x 0 -relx 0.516 -y 0 -rely 0.793 -width 0 -relwidth 0.028 \
        -height 0 -relheight 0.14 -anchor nw -bordermode ignore 
    place $top.lab58 \
        -in $top -x 0 -relx 0.609 -y 0 -rely 0.793 -width 0 -relwidth 0.028 \
        -height 0 -relheight 0.14 -anchor nw -bordermode ignore 
    place $top.lab59 \
        -in $top -x 0 -relx 0.703 -y 0 -rely 0.793 -width 0 -relwidth 0.027 \
        -height 0 -relheight 0.14 -anchor nw -bordermode ignore 
    place $top.spi60 \
        -in $top -x 0 -relx 0.406 -y 0 -rely 0.793 -width 0 -relwidth 0.102 \
        -height 0 -relheight 0.128 -anchor nw -bordermode ignore 
    place $top.spi61 \
        -in $top -x 0 -relx 0.547 -y 0 -rely 0.793 -width 0 -relwidth 0.055 \
        -height 0 -relheight 0.128 -anchor nw -bordermode ignore 
    place $top.spi62 \
        -in $top -x 0 -relx 0.641 -y 0 -rely 0.793 -width 0 -relwidth 0.055 \
        -height 0 -relheight 0.128 -anchor nw -bordermode ignore 
    place $top.tBu63 \
        -in $top -x 0 -relx 0.766 -y 0 -rely 0.61 -width 127 -relwidth 0 \
        -height 47 -relheight 0 -anchor nw -bordermode ignore 
    } ;# end vTcl:withBusyCursor 

    vTcl:FireEvent $base <<Ready>>
}

set btop ""
if {$vTcl(borrow)} {
    set btop .bor[expr int([expr rand() * 100])]
    while {[lsearch $btop $vTcl(tops)] != -1} {
        set btop .bor[expr int([expr rand() * 100])]
    }
}
set vTcl(btop) $btop
Window show .
Window show .top43 $btop
if {$vTcl(borrow)} {
    $btop configure -background plum
}
