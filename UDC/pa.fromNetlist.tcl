
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name UDC -dir "D:/belgeler/EE362_workspace/UDC/planAhead_run_2" -part xc3s100ecp132-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/belgeler/EE362_workspace/UDC/UDC.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/belgeler/EE362_workspace/UDC} }
set_property target_constrs_file "UDC.ucf" [current_fileset -constrset]
add_files [list {UDC.ucf}] -fileset [get_property constrset [current_run]]
link_design
