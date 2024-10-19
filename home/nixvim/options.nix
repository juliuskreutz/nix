{
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = true;

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
    filetype.extension = {
      btm = "bottom";
    };
  };
}
