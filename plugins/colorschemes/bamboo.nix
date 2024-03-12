{
  lib,
  helpers,
  config,
  pkgs,
  nixvimOptions,
  ...
}:
with lib;
  helpers.neovim-plugin.mkNeovimPlugin config {
    name = "bamboo";
    originalName = "bamboo.nvim";
    namespace = "colorschemes";
    defaultPackage = pkgs.vimPlugins.bamboo-nvim;

    maintainers = [helpers.maintainers.fergus-molloy];

    settingsOptions = {
      style = helpers.defaultNullOpts.mkEnumFirstDefault ["vulgaris" "multiplex" "light"] ''
        Which style to use. Can be "vulgaris" (regular), "multiplex" (greener), or "light"
      '';

      toggleStyleKey = helpers.mkNullOrStr "Keybind to toggle";

      toggleStyleList = helpers.defaultNullOpts.mkListOf types.str ''["vulgaris" "multiplex" "light"]'' ''
        List of styles to toggle between
      '';

      transparent = helpers.defaultNullOpts.mkBool false "Show/hide background";
      dimInactive = helpers.defaultNullOpts.mkBool false "Dim inactive windows/buffers";
      termColors = helpers.defaultNullOpts.mkBool true ''
        Change terminal colors as per the selected theme styles
      '';
      endingTildes = helpers.defaultNullOpts.mkBool false ''
        Show the end-of-buffer tildes. By default they are hidden
      '';

      cmpItemkindReverse = helpers.defaultNullOpts.mkBool false ''
        Reverse the item kind highlights in cmp menu
      '';

      codeStyle = {
        comments = helpers.defaultNullOpts.mkHighlight ''{italic = true;}'' "" "";
        conditionals = helpers.defaultNullOpts.mkHighlight ''{italic = true;}'' "" "";
        keywords = helpers.defaultNullOpts.mkHighlight ''null'' "" "";
        functions = helpers.defaultNullOpts.mkHighlight ''null'' "" "";
        namespaces = helpers.defaultNullOpts.mkHighlight ''{italic = true;}'' "" "";
        parameters = helpers.defaultNullOpts.mkHighlight ''{italic = true;}'' "" "";
        strings = helpers.defaultNullOpts.mkHighlight ''null'' "" "";
        variables = helpers.defaultNullOpts.mkHighlight ''null'' "" "";
      };

      lualine = {
        transparent = helpers.defaultNullOpts.mkBool false "Lualine center bar transparency";
      };

      colors = helpers.defaultNullOpts.mkAttrsOf types.str ''null'' ''
        Override default colors or set new ones
      '';
      highlights = helpers.defaultNullOpts.mkAttrsOf (with types; attrsOf str) ''null'' ''
        Override default colors or set new ones
      '';

      diagnostics = {
        darker = helpers.defaultNullOpts.mkBool false ''
          Use darker colors for diagnostics
        '';
        undercurl = helpers.defaultNullOpts.mkBool true ''
          Use undercurl instead of underline for diagnostics
        '';
        background = helpers.defaultNullOpts.mkBool true ''
          Use background color for virtual text
        '';
      };
    };

    settingsExample = {
      style = "vulgaris";

      toggleStyleKey = "<leader>th";
      toggleStyleList = ["vulgaris" "multiplex" "light"];

      transparent = false;
      dimInactive = false;
      termColors = true;
      endingTildes = false;
      cmpItemkindReverse = false;
    };

    extraConfig = cfg: {
      colorscheme = "bamboo";
    };
  }
