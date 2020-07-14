package project.basket.backend;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

//annotation도 api가 제공됨
@Configuration
@ComponentScan(basePackages={"project.basket.config"})
@ComponentScan(basePackages={"org.mybatis"})
@ComponentScan(basePackages={"com.util"})
public class RootConfig {

}
