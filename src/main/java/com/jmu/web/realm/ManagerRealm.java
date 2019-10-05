package com.jmu.web.realm;

import com.jmu.domain.Manager;
import com.jmu.service.LoginService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class ManagerRealm extends AuthorizingRealm {
    @Autowired
    private LoginService loginService;

    /*授权
        doGetAuthorizationInfo调用时机：
        1.发现访问路径对应的方法上面有授权注解，调用该方法
    *   2.页面当中有授权标签也会调用该方法
    * */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        System.out.println("授权调用");
        /*获取用户信息*/
        Manager manager = (Manager)principalCollection.getPrimaryPrincipal();
        List<String> permissions = new ArrayList<>();

        /*查询当前角色拥有的权限*/
        if(manager.getRole().getRoleId()==1){
            permissions.add("*:*");
        }else{
            /*获取权限*/
            permissions = loginService.getPermissionsByRid(manager.getRole().getRoleId());
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        /*提供授权*/
        info.addStringPermissions(permissions);
        return info;
    }

    /*身份认证*/
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("-------------来到了认证---------------");
        /*获取用户输入的账号*/
        String managerId = (String)authenticationToken.getPrincipal();
        Manager manager = loginService.getManagerById(managerId);
        if(manager == null){
            return null;
        }

        /*认证*/
        /*参数：主体，正确的密码，盐，当前realm的名称*/
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(manager,manager.getPassword(),this.getName());
        return info;
    }
}
