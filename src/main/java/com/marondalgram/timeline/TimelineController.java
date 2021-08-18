package com.marondalgram.timeline;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marondalgram.post.bo.PostBO;
import com.marondalgram.post.model.Post;

@RequestMapping("/timeline")
@Controller
public class TimelineController {
	
	@Autowired
	private PostBO postBO;
	
	@RequestMapping("/timeline_list_view")
	public String timeLineListView(Model model) {
		
		List<Post> postList = postBO.getPostList();
		model.addAttribute("postList", postList);
		model.addAttribute("viewName", "timeline/timeline_list");
		
		return "template/layout";
	}
}
