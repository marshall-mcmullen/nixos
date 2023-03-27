{ pkgs, ... }:
{
  # Customize the command line args used to start chrome for proper hardware acceleration. 
  nixpkgs.config.packageOverrides = pkgs: {
    google-chrome = pkgs.google-chrome.override {
	commandLineArgs = [ 
		"--disable-reading-from-canvas"
    		"--disable-sync-preference"
    		"--enable-drdc"
    		"--enable-features=WebUIDarkMode,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization"
    		"--enable-gpu-rasterization"
    		"--enable-oop-rasterization"
    		"--enable-raw-draw"
    		"--enable-zero-copy"
    		"--force-dark-mode"
    		"--ignore-gpu-blocklist"
    		"--use-gl=egl"
    		"--use-vulkan"
	];
    };
  };
}
