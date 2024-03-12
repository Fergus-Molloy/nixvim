{
  empty = {
    colorschemes.bamboo.enable = true;
  };

  default = {
    colorschemes.bamboo = {
      enable = true;
      settings = {
        style = "vulgaris";
        toggleStyleKey = null;
        toggleStyleList = ["vulgaris" "multiplex" "light"];

        transparent = false;
        dimInactive = false;
        termColors = true;
        endingTildes = false;

        cmpItemkindReverse = false;

        lualine.transparent = false;

        codeStyle = {
          comment = {italic = true;};
          conditionals = {italic = true;};
          keywords = null;
          functions = null;
          namespaces = {italic = true;};
          parameters = {italic = true;};
          strings = null;
          variables = null;
        };

        diagnostics = {
          darker = false;
          undercurl = false;
          background = false;
        };
      };
    };
  };
}
