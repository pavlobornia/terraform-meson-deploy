#/bin/bash

cd /opt
sudo wget 'https://staticassets.meson.network/public/meson_cdn/v3.1.18/meson_cdn-linux-amd64.tar.gz' && \\
    tar -zxf meson_cdn-linux-amd64.tar.gz && rm -f meson_cdn-linux-amd64.tar.gz && \\
    cd ./meson_cdn-linux-amd64 && sudo ./service install meson_cdn
sudo ./meson_cdn config set --token=${meson_token} --https_port=443 --cache.size=${meson_size}
sudo ./service start meson_cdn

exit 0
