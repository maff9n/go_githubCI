{ pkgs, }:
{
  test_go =
    let
      scriptName = "test_go";
    in
    pkgs.writeShellApplication {
      name = scriptName;
      runtimeInputs = [ pkgs.go ];
      text = ''
        #!${pkgs.bash}/bin/bash

        # Define options string
        options=":o:h"

        # Loop through arguments using getopts
        while getopts "$options" opt; do
          case $opt in
            h)  # Help option
              echo "There is only one supported option!"
              printf "\n"
              echo "To store the test results in a specific location"
              echo "use: ${scriptName} -o PATH/FILENAME"
              exit 0
              ;;
            o)  # Argument with flag
              echo "PATH/FILENAME pattern $OPTARG was provided"
              echo "Generating test results..."
              go test -json > "$OPTARG"
              echo "File $OPTARG was created"
              exit 0
              ;;
            ?)  # Invalid option
              echo "Invalid option: -$OPTARG OR missing argument"
              echo "To display supported options"
              echo "use: ${scriptName} -h"
              exit 1
              ;;
          esac
        done

        # No options or flag used
        echo "No argument or option used"
        echo "Generating test results..."
        beginning="$(date +"%Y_%m_%d_%H_%M_%S")"
        go test -json > ./"$beginning"
        end="$(date +"%Y_%m_%d_%H_%M_%S_test_results")"
        mv ./"$beginning" ./"$end"
        echo "File $end was created"
      '';
    };
  lint_go = pkgs.writeShellApplication {
    name = "lint_go";
    runtimeInputs = [ pkgs.golangci-lint ];
    text = ''golangci-lint run'';
  };
}
