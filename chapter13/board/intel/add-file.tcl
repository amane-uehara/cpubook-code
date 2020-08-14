package require ::quartus::project
package require fileutil

foreach file [fileutil::findByPattern "main" *.sv] {
  puts $file
  set_global_assignment -name SYSTEMVERILOG_FILE $file
}

set_global_assignment -name SEARCH_PATH "main/package"

foreach file [fileutil::findByPattern "main" *.svh] {
  puts $file
  set_global_assignment -name SYSTEMVERILOG_FILE $file
}

set_global_assignment -name SEARCH_PATH "program"

foreach file [fileutil::findByPattern "program" *] {
  puts $file
  set_global_assignment -name MIF_FILE $file
}
