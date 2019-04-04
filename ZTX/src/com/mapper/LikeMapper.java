package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.Comments;
import com.model.Likes;

public interface LikeMapper {
	/**
	 * 删除收藏
	 * @param id
	 * @return
	 */
   int delete(int lid);
   /**
    *增加收藏
    * @param likes
    * @return
    */
   int add(Likes likes);
   /**
    * 根据uid和nid查询收藏
    * @param nid 
    * @param uid
    * @return
    */
   Likes findByNid_Uid(@Param("nid")int nid,@Param("uid")int uid);
   /**
    * 
    * @param uid
    * @return
    */
   List<Likes> findByUid(@Param("uid")int uid);
}
