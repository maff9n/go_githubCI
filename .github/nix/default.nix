{ pkgs, }:
{
  test_go = pkgs.writeShellApplication {
    name = "test_go";
    runtimeInputs = [ pkgs.go ];
    text = ''go test'';
  };
  lint_go = pkgs.writeShellApplication {
    name = "lint_go";
    runtimeInputs = [ pkgs.golangci-lint ];
    text = ''golangci-lint run'';
  };
}
