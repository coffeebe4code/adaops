with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Strings;      use Ada.Strings;
with init; use init;

procedure Main is
-- init will create a project in the current directory with vim settings
-- copy will copy the spec file contents to the body definition
-- help will output help, if no args provided, show help
  type Args is (init, help, copy);
  procedure show_help is
  
  begin
    Put_Line ("help here");
  end show_help;
begin
  if Argument_Count >= 1 then
    case Args'Value (Argument (1)) is
      when init =>
        Put_Line ("init here");
        create_init;
      when help =>
        show_help;
      when copy =>
        Put_Line ("copy here");
    end case;
  else
   show_help;
  end if;
exception
    when Constraint_Error =>
      show_help;
      raise;
end Main;
