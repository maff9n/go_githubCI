{ pkgs, }:
{
  start_testing = pkgs.writeShellApplication {
    name = "start_testing";
    runtimeInputs = [ pkgs.go ];
    text = ''go test'';
  };
}
