flash-plugin:
  pkg:
    - installed

freshplayerplugin:
  pkg:
    - removed

libpepflashplayer:
  file.absent:
    - name: /opt/google/chrome/PepperFlash/libpepflashplayer.so
