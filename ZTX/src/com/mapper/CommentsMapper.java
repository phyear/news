package com.mapper;

import java.util.List;

import com.model.Comments;

public interface CommentsMapper {
	/**
	 * 删除评论
	 * @param id
	 * @return
	 */
   int delete(int id);
   /**
    *增加评论
    * @param comments
    * @return
    */
   int add(Comments comments);
   /**
    * 根据新闻id查询评论
    * @param nid
    * @return
    */
   List<Comments> findAllByNid(int nid);
}
