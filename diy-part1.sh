#!/bin/bash
# OpenWrt DIY script part 1 (Before Update feeds)

# Thêm kho gói chứa các app còn thiếu (bao gồm Turboacc, ddnsto, dnsfilter...)
echo 'src-git extra https://github.com/shiyu888/to-packages.git;main' >> feeds.conf.default
echo 'src-git sirpdboy https://github.com/sirpdboy/sirpdboy-package.git;main' >> feeds.conf.default
