- name: Load custom configuration
      run: |
        # Xóa file .config cũ nếu có
        rm -f openwrt/.config
        chmod +x $DIY_P2_SH
        cd openwrt
        bash ../$DIY_P2_SH
