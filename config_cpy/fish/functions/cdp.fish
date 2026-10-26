# check default program
function cdp
    if test -z "$argv[1]"
        echo "Usage: cdp <filename>"
        return 1
    end
    xdg-mime query default (xdg-mime query filetype $argv[1])
end
