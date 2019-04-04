package com.service;

import java.util.List;

import com.model.Likes;

public interface LikeService {
	/**
	 * 添加收藏
	 * @param likes
	 * @return
	 */
     int add(Likes likes);
     /**
      * 删除收藏
      * @param lid
      * @return
      */
     int delete(int lid);
     /**
      * 根据新闻id和用户id查询收藏
      * @param nid
      * @param uid
      * @return
      */
     Likes findByNid_Uid(int nid,int uid);
     /**
      * 根据新闻id查询收藏
      * @param nid
      * @return
      */
     List<Likes> findByNid(int nid);
	 Boolean isLike(int nid, int uid);
	 List<Likes> findByUid(int uid);
	 String removeLike(int lid);
}
