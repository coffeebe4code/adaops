with Ada.Text_IO; use Ada.Text_IO;
with Ada.Directories; use Ada.Directories;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;


package body init is

  type files_itr is range 1 .. 3;
  type dir_itr is range 1 .. 3;
  type array_files is array (files_itr) of Unbounded_String;
  type array_dirs is array (dir_itr) of Unbounded_String;

  function ubs (S : String) return Unbounded_String renames To_Unbounded_String;  
  
  files : array_files := (ubs ("main.adb"), ubs ("settings.json"), ubs ("build.gpr"));
  dirs : array_dirs := (ubs ("obj"), ubs ("src"), ubs (".vim"));

  procedure create_init is
  begin
    for i in dir_itr loop
      Create_Directory (New_Directory => To_String (dirs (i)));
    end loop;
  end create_init;
end init;
