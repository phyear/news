package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.LikeMapper;
import com.model.Likes;
import com.service.LikeService;
@Service
@Transactional
public class LikeServiceImpl implements LikeService {
	@Autowired
     LikeMapper likeMapper;
	@Override
	public int add(Likes likes) {
		// TODO Auto-generated method stub
		return likeMapper.add(likes);
	}

	@Override
	public int delete(int lid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Boolean isLike(int nid, int uid) {
		System.out.println(nid+"...."+uid);
		Likes likes=likeMapper.findByNid_Uid(nid, uid);
		System.out.println(likes);
		Boolean flag=false;
		if(likes!=null) {
			flag=true;
		  }
		return flag;
	}
    
	@Override
	public List<Likes> findByUid(int uid) {
		// TODO Auto-generated method stub
		return likeMapper.findByUid(uid);
	}

	@Override
	public String removeLike(int lid) {
		String me="";
		int a=likeMapper.delete(lid);
		if(a>0) {
			me="删除成功";
		  }
		else {
			me="删除失败";
		}
		return me;
	}

	@Override
	public Likes findByNid_Uid(int nid, int uid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Likes> findByNid(int nid) {
		// TODO Auto-generated method stub
		return null;
	}

}
