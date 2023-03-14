default:
	tclsh kroki4tcl/kroki4tcl_main.tcl tests/sample.md tests/sample.png pumlcode
	tclsh kroki4tcl/kroki4tcl_main.tcl tests/test.dot 

docu:
	 pantcl kroki4tcl/kroki4tcl.tcl kroki4tcl/kroki4tcl.html -s --css mini.css
	 cd kroki4tcl && htmlark kroki4tcl.html -o kroki4tcl-out.html
	 cd kroki4tcl && mv kroki4tcl-out.html kroki4tcl.html
