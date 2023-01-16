open_project ./build/project_3/project_3.xpr
add_files -norecurse [glob ./hdl/*.sv]
add_files -fileset constrs_1 -norecurse ./constraint/Nexys_A7.xdc
set_property top_file {./hdl/tlc_top.sv} [current_fileset]
set_property top tlc_top [current_fileset]
close_project
