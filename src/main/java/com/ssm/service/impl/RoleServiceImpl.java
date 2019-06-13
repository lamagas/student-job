package com.ssm.service.impl;

import com.ssm.mapper.RoleMapper;
import com.ssm.model.Role;
import com.ssm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	RoleMapper roleMapper;

	@Override
	public List<Role> list(String userName){
		return roleMapper.findRoles(userName);
	}
	@Override
	public void add(Role u) {
		roleMapper.insert(u);
	}

	@Override
	public void delete(int id) {
		roleMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void update(Role u) {
		roleMapper.updateByPrimaryKeySelective(u);
	}

	@Override
	public Role get(int id) {
		return roleMapper.selectByPrimaryKey(id);
	}


}