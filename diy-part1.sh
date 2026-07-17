#!/bin/bash

# Vô hiệu hóa triệt để cấu hình gọi đến hai kho feeds lỗi
if [ -f feeds.conf.default ]; then
    sed -i '/extra/d' feeds.conf.default
    sed -i '/sirpdboy/d' feeds.conf.default
fi

# Tạo thư mục giả lập để đánh lừa lệnh 'find' của OpenWrt không bị báo lỗi thiếu thư mục
mkdir -p feeds/extra
mkdir -p feeds/sirpdboy
touch feeds/extra/.placeholder
touch feeds/sirpdboy/.placeholder

# Ép hệ thống tạo sẵn file index trống để không bị crash ở bước tiếp theo
touch feeds/extra.index
touch feeds/sirpdboy.index
