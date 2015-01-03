class Synbad
  def self.set_alt_syntax()
    # capture default syntax
    filetype = VIM::evaluate("&filetype")
    unless VIM::evaluate('exists("g:default_synbad")') != 0
      VIM::command("let g:default_synbad = '#{filetype}'")
    end

    # add default to last syntax if swapping syntax for first time
    unless VIM::evaluate('exists("g:cur_synbad_index")') != 0
      VIM::command("let g:cur_synbad_index = -1")
    end

    # read lines from .syntax file
    syntax_lines = File.open(".syntax").map { |line| line }

    cur_index = VIM::evaluate('g:cur_synbad_index')
    if cur_index == syntax_lines.length - 1
      new_index = -1
      syntax = VIM::evaluate('g:default_synbad')
    else
      new_index = cur_index + 1
      syntax = syntax_lines[new_index].downcase
    end

    VIM::command "let g:cur_synbad_index = #{new_index}"
    VIM::command "set ft=#{syntax}"
    VIM::command "set syntax"
  end

end
