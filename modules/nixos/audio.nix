{ ... }:
{
  # Allows realtime priority (important for audio).
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    # jack.enable = true;
  };

  hardware.alsa.enablePersistence = true;
}
