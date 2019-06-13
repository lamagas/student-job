package com.ssm.service.impl;

import com.ssm.model.Student;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Component;

@Component
public class Password {

    //实例化RandomNumberGenerator对象，用于生成一个随机数
    private RandomNumberGenerator ran = new SecureRandomNumberGenerator();
    //散列算法名称
    private String algorithName = "MD5";
    //散列迭代次数
    private int hashInterations = 2;

    //加密算法
    public void enPassword(Student student){
        if (student.getPassword() != null){
            //对user对象设置盐：salt；这个盐值是randomNumberGenerator生成的随机数，所以盐值并不需要我们指定
            student.setSalt(ran.nextBytes().toHex());

            //调用SimpleHash指定散列算法参数：1、算法名称；2、用户输入的密码；3、盐值（随机生成的）；4、迭代次数
            String newPassword = new SimpleHash(
                    algorithName,
                    student.getPassword(),
                    ByteSource.Util.bytes(student.getSalt()),
                    hashInterations).toHex();

            student.setPassword(newPassword);
        }
    }
}
