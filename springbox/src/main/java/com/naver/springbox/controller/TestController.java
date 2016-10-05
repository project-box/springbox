package com.naver.springbox.controller;

import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import static org.junit.Assert.assertEquals;

import com.naver.springbox.service.PreferenceAction;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
     "file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class TestController {
	@Autowired
	private PreferenceAction preferenceAction;
	
	@Test
    public void test(){
		
		MockHttpServletRequest request = new MockHttpServletRequest("POST", "");
		request.setAttribute("page", 1);
		
		Map map = preferenceAction.suggestMusic("abraham", request);
		
		assertEquals(map, 1);
    }
}
