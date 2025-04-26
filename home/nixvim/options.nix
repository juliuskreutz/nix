{
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = true;

      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = true;

      breakindent = true;

      hlsearch = false;
      ignorecase = true;
      smartcase = true;
      inccommand = "split";

      scrolloff = 8;

      signcolumn = "yes";

      splitright = true;
      splitbelow = true;

      conceallevel = 2;

      showbreak = "↳ ";
    };
  };
}
