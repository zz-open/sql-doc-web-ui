# mysqldoc
查看数据库表结构WEB版

## 使用
### 帮助
```shell
mysqldoc --help
```
### 命令行+参数 方式运行
```shell
mysqldoc --port 服务端口 --host
```

### 命令行+yaml配置文件 方式运行
```shell
mysqldoc -f 配置文件路径
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