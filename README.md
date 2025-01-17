服务器信息
服务器控制面板
--------------------------
外网面板地址: http://107.151.200.239:8888/ce6b1428
内网面板地址: http://107.151.200.239:8888/ce6b1428
username: bygntte2
password: fedc9e2d
--------------------------
数据库信息
数据库名：pitedex
数据库用户名：pitedex
密码：asd5228085
--------------------------
服务器信息
ip：107.151.200.239
端口：22
用户名：root
密码：asd5228085
--------------------------


Piteswap 部署教程计划任务.txt

服务器系统CentOS 7.6  

nginx php7.2 mysql5.7 安装php扩展  fileinfo opcache redis imagemagick imap  intl  xsl Swoole4并且禁用所有函数

上传文件 导入数据库文件

修改根目录.evn 数据库连接  IP地址
修改bootstrap/cache/config.php   数据库地址  IP地址  网站目录地址

设置网站运行目录public   伪静态 laravel5


--------------------------
nginx站点配置反向代理


location /socket.io/ {
    proxy_pass https://127.0.0.1:2000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    
    # SSL 配置
    proxy_ssl_certificate /www/server/panel/vhost/cert/pitedex.com/fullchain.pem;
    proxy_ssl_certificate_key /www/server/panel/vhost/cert/pitedex.com/privkey.pem;
    proxy_ssl_verify off;
    
    # 超时设置
    proxy_read_timeout 60s;
    proxy_connect_timeout 60s;
    proxy_send_timeout 60s;
}
---------------------

放行所有端口


----------------------es--------------------------
1.安装elasticsearch 网站根目录运行终端命令执行下列命令

yum install java -y


2.elasticsearch

rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

vi /etc/yum.repos.d/elasticsearch.repo

3.插入下面代码

[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md


shift+：  输入wq回车保存 

5.
yum install elasticsearch

6.启动

service elasticsearch start
------------------------------------------------------

安装python3和扩展 
yum install python3 -y 

pip3 install websocket-client redis


php artisan config:cache
------------------------------------------------------
计划任务添加脚本 然后执行

k线依赖

webmsgsender

cd /www/wwwroot/pite/public/vendor/webmsgsender
php start.php restart -d


python3

killall python3
cd /www/wwwroot/pite/python 
python3 main.py

websocket

cd /www/wwwroot/pite
php artisan websocket:client restart


主要添加执行上面三个，下面看交易所功能在执行适合脚本

schedule
cd /www/wwwroot/pite
php artisan schedule:run

queue
cd /www/wwwroot/pite
php artisan queue:work


auto_change
cd /www/wwwroot/pite
php artisan auto_change start

平台币依赖

get_kline_data_weekly
cd /www/wwwroot/pite
php artisan get_kline_data_weekly


get_kline_data_daily
cd /www/wwwroot/pite
php artisan get_kline_data_daily

get_kline_data_hourly
cd /www/wwwroot/pite
php artisan get_kline_data_hourly


get_kline_data_monthly
cd /www/wwwroot/pite
php artisan get_kline_data_monthly


get_kline_data_thirtymin
cd /www/wwwroot/pite
php artisan get_kline_data_thirtymin

get_kline_data_fifteenmin
cd /www/wwwroot/pite
php artisan get_kline_data_fifteenmin


get_kline_data_fivemin
cd /www/wwwroot/pite
php artisan get_kline_data_fivemin

平台币更新
robot
cd /www/wwwroot/pite
php artisan updater 8
机器人
robot
cd /www/wwwroot/pite
php artisan robot 2



php artisan list 打印信息

delete from users_wallet where currency not in (select id from currency)
