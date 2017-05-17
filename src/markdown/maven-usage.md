# maven 使用相关

## 不同环境(开发,上线)配置切换

在编译时使用 maven 命令参数打包不同环境下的配置文件, 比如 `src/main/resources/prod` 和 `src/main/resources/dev` 文件夹下分别是线上环境和开发环境的配置文件. maven `pom.xml` 配置文件部分配置如下.

```xml
<build>
    <resources>
        <resource>
            <directory>src/main/resources</directory>
            <!-- 资源根目录排除各环境的配置，使用单独的资源目录来指定 -->
            <excludes>
                <exclude>prod/*</exclude>
                <exclude>dev/*</exclude>
            </excludes>
        </resource>
        <resource>
            <directory>src/main/resources/${profiles.active}</directory>
        </resource>
    </resources>
</build>
<profiles>
    <profile>
        <!-- 开发环境 -->
        <id>dev</id>
        <properties>
            <profiles.active>dev</profiles.active>
        </properties>
        <activation>
            <activeByDefault>true</activeByDefault>
        </activation>
    </profile>
    <profile>
        <!-- 生产环境 -->
        <id>prod</id>
        <properties>
            <profiles.active>prod</profiles.active>
        </properties>
    </profile>
</profiles>
```

打包时通过 `mvn clean package -P prod` 实现线上环境配置打包, `mvn clean package -P dev` 实现开发环境配置打包.

## 本地 JAR 文件引入

**本地 JAR 文件加入到本地 maven 库**

```xml
<!--build>plugins 下添加-->
<!--安装本地 jar 包-->
<!-- https://mvnrepository.com/artifact/org.apache.maven.plugins/maven-install-plugin -->
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-install-plugin</artifactId>
    <version>2.5.2</version>
    <configuration>
        <groupId>com.mycompany</groupId>
        <artifactId>myproject</artifactId>
        <version>1.0</version>
        <packaging>jar</packaging>
        <generatePom>true</generatePom>
        <file>${basedir}/src/main/webapp/WEB-INF/lib/myjar.jar</file>
    </configuration>
    <executions>
        <execution>
            <id>install-jar-lib</id>
            <goals>
                <goal>install-file</goal>
            </goals>
            <phase>validate</phase>
        </execution>
    </executions>
</plugin>
```

**依赖添加**

```xml
<!--dependencies 下添加-->
<dependency>
    <groupId>com.mycompany</groupId>
    <artifactId>myproject</artifactId>
    <version>1.0</version>
</dependency>
```

**打包前先执行** `mvn install:install-file` 或者 `mvn validate`. 或者一行命令执行 `mvn validate & mvn clean package -P dev`.

- [Maven安装jar文件到本地仓库](https://www.cnblogs.com/xguo/archive/2013/06/04/3117894.html)
- [Install local jar dependency as part of the lifecycle, before Maven attempts to resolve it](https://stackoverflow.com/questions/26618192/install-local-jar-dependency-as-part-of-the-lifecycle-before-maven-attempts-to)
