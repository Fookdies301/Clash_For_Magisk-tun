# 当SKIPUNZIP=1时,安装过程为自定义
SKIPUNZIP=1

# 创建环境
ui_print "- 开始创建环境"
data_dir=/sdcard/Documents/clash
mkdir -p $data_dir
mkdir -p ${data_dir}/run
mkdir -p $MODPATH/scripts
mkdir -p $MODPATH/system/bin

# 开始安装
ui_print "- 开始安装"
unzip -j -o "${ZIPFILE}" "clash/bin/clash" -d $MODPATH/system/bin >& 2
unzip -j -o "${ZIPFILE}" "clash/bin/clash_control" -d $MODPATH/system/bin >& 2
unzip -j -o "${ZIPFILE}" "clash/scripts/*" -d $MODPATH/scripts >&2
unzip -j -o "${ZIPFILE}" 'service.sh' -d $MODPATH >&2
unzip -j -o "${ZIPFILE}" 'uninstall.sh' -d $MODPATH >&2
rm ${MODPATH}/module.prop
unzip -j -o "${ZIPFILE}" 'module.prop' -d $MODPATH >&2

# 设置权限
sdcard_rw_id="1015"
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm  $MODPATH/service.sh    0  0  0755
set_perm  $MODPATH/uninstall.sh    0  0  0755
set_perm  $MODPATH/scripts/clash.service   0  0  0755
set_perm  $MODPATH/scripts/clash.tproxy   0  0  0755
set_perm  $MODPATH/system/bin/clash  0  ${sdcard_rw_id}  6755
set_perm  $MODPATH/system/bin/clash_control  0  0  0755
set_perm  $data_dir                0  0  0755