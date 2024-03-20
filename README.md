# sql-doc-web-ui
网页版sql文档查看工具

## 使用
### 帮助
```shell
sdwu --help
```
### 命令行+参数 方式运行
```shell
sdwu --port 服务端口 --host
```

### 命令行+yaml配置文件 方式运行
```shell
sdwu -f 配置文件路径
```
mysqldoc会自动读取可执行程序所在路径的mysqldoc.yaml文件
```yaml
Port: 
AutoOpenDefaultBrowser: true
CreateSqlFile: true
Mysql:
  Host: 127.0.0.1
  Port: 3306
  Username: root
  Password: 
  DbName: test
```