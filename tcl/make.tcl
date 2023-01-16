create_project -force project_3 ./build/project_3 -part xc7a100tcsg324-1
add_files -norecurse [glob ./hdl/*.sv]
add_files -fileset constrs_1 -norecurse ./constraint/Nexys_A7.xdc
set_property top_file {./hdl/tlc_top.sv} [current_fileset]
set_property top tlc_top [current_fileset]
set_property top_file {./hdl/tlc_tb.sv} [get_filesets sim_1]
set_property top tlc_tb [get_filesets sim_1]
close_project
