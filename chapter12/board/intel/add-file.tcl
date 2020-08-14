package require ::quartus::project
package require fileutil

foreach file [fileutil::findByPattern "main" *.sv] {
  puts $file
  set_global_assignment -name SYSTEMVERILOG_FILE $file
}
