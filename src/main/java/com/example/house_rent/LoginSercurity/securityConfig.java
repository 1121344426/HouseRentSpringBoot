package com.example.house_rent.LoginSercurity;

import com.example.house_rent.Bean.Client;
import com.example.house_rent.ServiceImpl.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userDetailsService")
public class securityConfig implements UserDetailsService {
    @Autowired
    ClientService clientService;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        System.err.println("我是："+s);
        Client clientByUsername = clientService.findClientByUsername(s);
        if(clientByUsername == null){
             throw new RuntimeException("用户不存在");
        }
        List<GrantedAuthority> role = AuthorityUtils.commaSeparatedStringToAuthorityList("role");
        return new User(clientByUsername.getUsername(),new BCryptPasswordEncoder().encode(clientByUsername.getPassword()),role);
    }


}
