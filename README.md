# update_openssh

---

## 使用说明

需要把`openssh-7.9p1.tar.gz`和`zlib-devel-1.2.3-29.el6.x86_64.rpm`放置在 **系统根目录**

### **根目录**

    cd /  
**必须确认**`此脚本`、`openssh-7.9p1.tar.gz`、`zlib-devel-1.2.3-29.el6.x86_64.rpm`放置在统一目录下

### 这个脚本会做什么

1. 关闭SElinux（永久关闭，重启生效）
2. 安装`依赖`，本脚本采用yum源安装，若无法连接至互联网需手动配置`本地离线yum源`
3. 备份文件在 **/back** 目录下
4. 设置ssh服务开机自启
5. 允许root用户登录

### SSH相关路径

    安装路径：/usr下的/ssh
    配置文件路径： /etc/ssh

#### SSH配置文件路径

    vim /etc/ssh/sshd_config
