function inv --wraps='nvim "$(fzf --preview="bat --color=always {}")"'
     nvim (fzf --preview 'bat --color=always {}'); 
end
