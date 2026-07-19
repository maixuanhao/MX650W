#!/bin/bash
# Đảm bảo xóa sạch cấu hình cũ trước khi ghi mới
rm -f .config

# Tiếp theo mới là các lệnh echo cấu hình...
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
# ... các dòng echo khác ...
