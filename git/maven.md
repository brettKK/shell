### Maven 基础使用

-------

1. 开发环境的准备

+ maven基本配置
	+ Idea
	+ JDK
	+ Maven (http://maven.apache.org/download.cgi)

2. maven概述

+ 构建

+ 好的构建工具

+ not only 构建工具

3. maven使用

+ 手动创建maven项目
	+ 创建项目目录
	+ 创建pom文件
	+ 编写测试代码
	+ 使用maven命令测试

+ 使用archetype创建maven项目
	+ mvn archtype:generate
	+ choice versions
	+ write groupId and artifactId and version, so on

+ common maven command
	+ mvn compile
	+ mvn test-compile
	+ mvn test
	+ mvn package
	+ mvn install
	+ mvn deploy
	+ mvn clean
	+ mvn help:effective-pom
	+ mvn dependency:tree
	+ mvn clean package -Pdev -Dmaven.test.skip=true (过滤掉test)

+ maven 生命周期
	+ clean lifeCycle
		+ pre-clean
		+ clean
		+ post-clean

	+ default( or build) lifeCycle
		+ pre-resources
		+ compile
		+ test-compile
		+ test
		+ package
		+ install
		+ deploy

	+ site lifeCycle
		+ pre-site
		+ site
		+ post-site
		+ site-deploy
		+ Maven 生成站点和部署。http://blog.csdn.net/cruise_h/article/details/17188399


+ use idea to create a maven project

+ pom file
	+ groupID
	+ atifactId
	+ version

	+ modelVersion
	+ name

	+ 配置
		+ finalname
		+ profile

+ maven仓库

gourpId/artifactId/version/artifactId-version.packaging

stable : release
unstable : snapshot

change local repository

+ 依赖
	+ type: 依赖类型，默认为jar
	+ scope:依赖范围
		+ compile 默认值
		+ test 测试依赖范围
		+ provided 已提供依赖范围
		+ runtime 运行时依赖范围

		+ system 。。
		+ import 。。
	+ optional: 依赖是否可选
	+ exclusions: 排除依赖传递

	传递依赖

+ 依赖冲突
	+ 路径优先
	+ 声明优先
	+ dependencyManagement, exclusion
	+ 依赖归类

+ 聚合与继承
	+
	+

+ 私服
	+ 网络限制
	+ 减少远程仓库的访问
	+ 发布自己的jar包

+ 测试
	+ ctrl + shift + t
	+ JUnit4
---

4. maven规范

---

maven 进阶

+ super pom
+ 占位符
+ profile
+ scope
+ jar使用和维护
+ 依赖冲突

---

+ 生命周期
+ 插件机制
+ 插件工具
+ 内置绑定


+ gradle


----

# maven tutorial

+ youtube vedio from Java Brains

---
+ build tool
+ project management tool

+ common problems and activivties
	+ multiple jars
	+ dependencies and versions
	+ project structure
	+ building, publishing, deploying

+ operation
	+ mvn archetype:generate
		+ input gourpId
		+ input artifactId
	+ mvn compile
	+ mvn package
	+ java -cp target/demo-1.0-SNAPSHOT.jar com.b.a.App
+ understanding Archetypes and pom.xml
	+ create project template -> folder structure
	+ build -> pom.xml
+ archetype:generate
	+ archetype
		+ the type of the project
	+ group id
	+ artifact id
		+ output name of jar
	+ version
	+ package

+ maven build
	+ build lifeCycle
	+
