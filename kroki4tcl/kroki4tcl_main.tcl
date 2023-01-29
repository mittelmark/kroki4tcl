#!/usr/bin/env tclsh

# Standalone executable for the package kroki4tcl

source [file join [file dirname [info script]] kroki4tcl.tcl] 

if {[info exists argv0] && $argv0 eq [info script]} {
    proc usage {} {
        puts "Usage: tclmain -m kroki4tcl main ?--gui? ?INFILE? ?OUTFILE?\n"
        puts "  Convert diagram code to URL's or SVG, PNG or PDF graphics using kroki.\n"
        puts "  Possible  INFILE  file extensions are:\n   '[join [dict keys $::kroki4tcl::maps] {', '}]'!"
        puts "  Possible  OUTFILE file extensions are svg (default), png, pdf!"
        puts "\nExamples:\n"
        puts "  tclmain -m kroki4tcl main infile.ditaa             -> print kroki URL to terminal"
        puts "  tclmain -m kroki4tcl main infile.ditaa outfile.svg -> convert diagram to svg file"
        puts "  tclmain -m kroki4tcl main  --gui infile.ditaa      -> open file in GUI"
        puts "  tclmain -m kroki4tcl main infile.md                -> open Markdown file in GUI"
    }
    if {[llength $argv] > 0} {
        if {"--help" in $argv || "-h" in $argv} {
            usage
            exit 0
        }
        if {"--gui" in $argv} {
            ::kroki4tcl::gui 
            if {[llength $argv] >= 2 && [file exists [lindex $argv 1]]} {
                ::kroki4tcl::fileOpen [lindex $argv 1]
                ::kroki4tcl::fileSave
            }
        } elseif {[llength $argv] == 1} {
            if {[file exists [lindex $argv 0]] && [file extension [lindex $argv 0]] in [list .md .Rmd .Tmd]} {
                ::kroki4tcl::gui 
                ::kroki4tcl::fileOpen [lindex $argv 0]
            } elseif {[file exists [lindex $argv 0]]} {
                puts [::kroki4tcl::file2kroki [lindex $argv 0]]
            } else {
                puts "Error: File [lindex $argv 0] does not exists!"
            }
        } elseif {[llength $argv] == 2} {
            if {[file exists [lindex $argv 0]]} {
                ::kroki4tcl::dia2file [lindex $argv 0] [lindex $argv 1]
            } else {
                puts "Error: File [lindex $argv 0] does not exists!"
            }
        } else {
            usage
        }
    } else {
        usage
    }
}
