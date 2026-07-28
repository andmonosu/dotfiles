{ pkgs, ... }:
{
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
      editor = "nvim";
      aliases = {
        co = "pr checkout";
        pv = "pr view";
        prs = "pr list --author @me";
      };
    };
    extensions = with pkgs; [
      gh-markdown-preview
      gh-dash
    ];
  };
}
