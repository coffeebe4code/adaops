with Ada.Text_IO; use Ada.Text_IO;
with Ada.Directories; use Ada.Directories;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;


package body Init_Option is

  type files_itr is range 1 .. 3;
  type dir_itr is range 1 .. 3;
  type array_files is array (files_itr) of Unbounded_String;
  type array_dirs is array (dir_itr) of Unbounded_String;

  function ubs (S : String) return Unbounded_String renames To_Unbounded_String;  
  
  main : String := "src/main.adb";
  main_content : String := 
"with Ada.Text_IO; use Ada.Text_IO;" & ASCII.LF & ASCII.LF &
"procedure Main is" & ASCII.LF &
"   begin" & ASCII.LF &
"Put_Line (""adaops is the best"");" & ASCII.LF &
"end Main;";
  
  build : String := "build.gpr";
  build_content : String :=
"project Build is" & ASCII.LF & ASCII.LF &
"  type Mode_Type is (""debug"", ""release"");" & ASCII.LF & ASCII.LF &
"  for Source_Dirs use (""src"");" & ASCII.LF &
"  for Object_Dir use ""obj"";" & ASCII.LF &
"  for Exec_Dir use ""target"";" & ASCII.LF &
"  for Main use (""main.adb"");" & ASCII.LF &
"  package Builder is" & ASCII.LF &
"  end Builder;" & ASCII.LF & ASCII.LF &
"   package Compiler is" & ASCII.LF &
"     for Default_Switches (""Ada"") use (""-O2"");" & ASCII.LF &
"   end Compiler;" & ASCII.LF &
"" & ASCII.LF &
"   package Binder is" & ASCII.LF &
"   end Binder; " & ASCII.LF & ASCII.LF &
"   package Linker is" & ASCII.LF & 
"   end Linker;" * ASCII.LF &
"end Build;";
  
  tests : String := "build-tests.gpr";
  tests_content : String :=
"with ""build.gpr"";" & ASCII.LF &
"project Build.Tests is" & ASCII.LF &
"  for Source_Dirs use (""tests"");" & ASCII.LF &
"  for Exec_Dir use ""target"";" & ASCII.LF &
"  for Object_Dir use ""obj"";" & ASCII.LF &
"  for Main use (""test.adb"");" & ASCII.LF &
"  package Builder is" & ASCII.LF &
"   end Builder;" & ASCII.LF &
"" & ASCII.LF &
"   package Compiler is" & ASCII.LF &
"    for Default_Switches (""Ada"") use (""-O2"");" & ASCII.LF &
"   end Compiler;" & ASCII.LF &
"" & ASCII.LF &
"   package Binder is " & ASCII.LF &
"   end Binder;" & ASCII.LF &
"" & ASCII.LF &
"   package Linker is" & ASCII.LF &
"   end Linker;" & ASCII.LF &
"" & ASCII.LF &
"end Build.Tests;";

  dirs : array_dirs := (ubs ("obj"), ubs ("src"));

  procedure create_init is
  begin
    for i in dir_itr loop
      Create_Directory (New_Directory => To_String (dirs (i)));
    end loop;
  end create_init;
end init;
