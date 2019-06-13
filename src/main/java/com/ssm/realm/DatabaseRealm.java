package com.ssm.realm;

import com.ssm.model.Role;
import com.ssm.model.Student;
import com.ssm.service.RoleService;
import com.ssm.service.StudentService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

public class DatabaseRealm extends AuthorizingRealm {

    @Autowired
    RoleService roleService;
    @Autowired
    StudentService studentService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("权限校验--执行了doGetAuthorizationInfo...");
        Student student = (Student) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        //注意这里的setRoles和setStringPermissions需要的都是一个Set<String>类型参数
        Set<String> role = new HashSet<String>();
        List<Role> roles = roleService.list(student.getName());
        for (Role r : roles){
            role.add(r.getName());
        }
        authorizationInfo.setRoles(role);
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        // 获取账号密码
        UsernamePasswordToken t = (UsernamePasswordToken) token;
        String userName = token.getPrincipal().toString();
        // 获取数据库中的密码
        Student student = studentService.login(userName);
        if(student==null){
            throw new UnknownAccountException();
        }
        String passwordInDB = student.getPassword();
        // 这样通过applicationContext-shiro.xml里配置的 HashedCredentialsMatcher 进行自动校验, ByteSource.Util.bytes(salt)
        SimpleAuthenticationInfo a = new SimpleAuthenticationInfo(student, passwordInDB,ByteSource.Util.bytes(student.getSalt()),getName());
        return a;
    }

}
