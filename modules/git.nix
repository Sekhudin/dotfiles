{ config, pkgs, ... }:

{
   programs.git = {
     enable = true;
     userName = "sekhudin";
     userEmail = "sekhudinuap@gmail.com";
     extraConfig = {
       core = {
         editor = "nvim";
       };

       init = {
         defaultBranch = "main";
       };
     };
   };
}
