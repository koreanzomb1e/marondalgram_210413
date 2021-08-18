package com.marondalgram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondalgram.post.dao.PostDAO;
import com.marondalgram.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
}
