package com.ssm.service;

import com.ssm.model.Role;

import java.util.List;

public interface RoleService {
	List<Role> list(String name);
	void add(Role role);
	void delete(int id);
	Role get(int id);
	void update(Role role);

}