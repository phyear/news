package com.service;

import java.util.List;


import com.model.Comments;
public interface CommentsService {
   int addComment(Comments comments);
   List<Comments> findBynid(int nid);
   int delete(int cid);
}
