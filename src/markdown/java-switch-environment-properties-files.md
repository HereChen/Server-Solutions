# 不同环境(开发,上线)配置切换

在编译时使用 maven 命令参数打包不同环境下的配置文件, 比如 `src/main/resources/prod` 和 `src/main/resources/dev` 文件夹下分别是线上环境和开发环境的配置文件. maven `pom.xml` 配置文件部分配置如下.

```
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
