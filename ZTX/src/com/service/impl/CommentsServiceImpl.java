package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.CommentsMapper;
import com.model.Comments;
import com.service.CommentsService;
@Service
@Transactional
public class CommentsServiceImpl implements CommentsService {
	  @Autowired
      CommentsMapper cdao;
	@Override
	public int addComment(Comments comments) {		    
		return cdao.add(comments);
	}

	@Override
	public List<Comments> findBynid(int nid) {
		// TODO Auto-generated method stub
		return cdao.findAllByNid(nid);
	}

	@Override
	public int delete(int cid) {
		// TODO Auto-generated method stub
		return 0;
	}

}
