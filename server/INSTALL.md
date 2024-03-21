# INSTALL
- [gin](https://github.com/gin-gonic/gin)
- [gin-cors](https://github.com/gin-contrib/cors)
- [sqlx](https://github.com/jmoiron/sqlx)
- [cobra](https://cobra.dev/#getting-started)
- [cobra](https://github.com/spf13/cobra)
- [zap](https://github.com/uber-go/zap)
- [lancet](https://github.com/duke-git/lancet)
- [图标](https://patorjk.com/software/taag/#p=testall&f=Graffiti&t=go-gin-api)


## 创建项目
```shell
go mod init github.com/zz-open/sql-doc-web-ui
```
    
## 安装依赖
```shell
go get -u github.com/jmoiron/sqlx
go get -u github.com/gin-gonic/gin
go get -u github.com/spf13/cobra@latest
go get -u github.com/spf13/viper
go get -u github.com/gin-contrib/cors
go get -u github.com/gookit/color
go get -u github.com/duke-git/lancet/v2
```

## api
- [x] /config/info [获取项目配置信息]
- [x] /db/info?db_name=? [获取db信息]
- [x] /db/list?db_name=? [获取db_name所有的表名信息]
- [x] /table/list?db_name=? [获取db_name下所有表详细信息]
- [x] /table/info?db_name=&table_name= [获取表详细信息]

## 重点sql
- 列出数据库下有哪些表 SHOW TABLE STATUS from 数据库名
- 查看表字段 SHOW FULL FIELDS FROM 表名称
- 查看建表语句 SHOW CREATE TABLE 表名称

# 后端任务列表
- [x] cobra增加版本，usage增加颜色，去掉Available Commands 中的help completion
- [x] Makefile 新增打包步骤
- [x] mode前后端统一，通过api获取后端配置
- [x] 启动服务自动打开默认浏览器
- [x] 增加zap日志封装
- [x] 修改gin中间件log,recovery全部由zap接管log
- [x] help信息打印ascii art text
- [x] 使用embed嵌入文件到二进制程序中
- [x] 完善生成的create table sql语句逻辑
- [x] cobra 去掉Available Commands 中的help completion
- [x] 控制台打印url,自带颜色和超连接
- [ ] cobra flag顺序是否能改变？
- [ ] cobra 颜色好像有点问题，不是彩虹色
- [ ] gin 日志问题
- [x] 完善交叉编译参数

# cobra笔记
- PersistentFlags 全局选项,可被其他命令设置值
- Flags 本地选项 只能自身命令设置
- args 位置参数
- hide 隐藏flag