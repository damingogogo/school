
#数据库导入

进入根目录下的sql文件，然后将这个sql文件下的school.sql文件导入到数据库，这个你应该会。
#1.创建数据库 School_work
#2。导入表（这个school.sql文件）123456








#后端运行
#1.打开项目目录的ruoyi-admin>src->main->java->resources

#2.打开application-druid.yml配置
  url: jdbc:mysql://127.0.0.1:3306/School_work?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
  username: username 
  password: password 

#3.打开application.yml配置
# 文件路径 示例（ Windows配置D:/school-work/uploadPath，Linux配置 /home/school-work/uploadPath）
profile: D:/school-work/uploadPath

#4.开始运行redis

#5.打开 src/main/resources/logback.xml
日志存放路径
property name="log.path" value="你保存这个项目的根地址/log/lags_video" />

#例如 ： D:/school-work/log/lags_video





#VUE前端运行
# 进入项目目录
cd ruoyi-ui

# 安装依赖
npm install

# 建议不要直接使用 cnpm 安装依赖，会有各种诡异的 bug。可以通过如下操作解决 npm 下载速度慢的问题
npm install --registry=https://registry.npmmirror.com

# 启动服务
npm run dev
```

浏览器访问 http://localhost:1024

## 发布

```bash
# 构建测试环境
npm run build:stage

# 构建生产环境
npm run build:prod
```
