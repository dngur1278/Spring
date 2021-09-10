package com.yedam.app.employees.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.employees.domain.JobsVO;
import com.yedam.app.employees.mapper.JobsMapper;

@Service
public class JobsServiceImpl implements JobsService {

	@Autowired JobsMapper jobsMapper;
	
	@Override
	public List<JobsVO> getJobList() {
		return jobsMapper.getJobList();
	}

}
