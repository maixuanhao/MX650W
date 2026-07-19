- name: Load custom configuration
      run: |
        # Xóa file .config cũ nếu có
        rm -f openwrt/.config
        chmod +x $DIY_P2_SH
        cd openwrt
        # Chạy script để điền các cấu hình của bạn
        bash ../$DIY_P2_SH
        # BẮT BUỘC: Tạo file cấu hình chuẩn dựa trên các tùy chọn trên
        make defconfig
