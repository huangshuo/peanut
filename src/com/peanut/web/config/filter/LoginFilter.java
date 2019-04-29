package com.peanut.web.config.filter;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.peanut.common.Constant;
import com.peanut.common.http.ServletUrl;
import com.peanut.entity.pojo.BackendUser;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * description: 检测用户是否登录.
 *
 * @author huangs
 * @date 2019-04-24
 * @see com.peanut.web.config.filter
 * @since 1.0
 */
public class LoginFilter implements Filter {

  private String[] excludePageUrls;

  @Override
  public void init(FilterConfig filterConfig) {
    // 获取排除的url
    excludePageUrls = filterConfig.getInitParameter("excluded").split(",");
  }

  @Override
  public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
    boolean isExcluded = false;
    HttpServletRequest request = (HttpServletRequest) servletRequest;
    HttpServletResponse response = (HttpServletResponse) servletResponse;
    for (String url : excludePageUrls) {
      if (request.getServletPath().matches(url)) {
        isExcluded = true;
      }
    }
    if (isExcluded) {
      filterChain.doFilter(request, response);
    } else if (request.getSession().getAttribute(Constant.SESSION_USER_KEY) == null) {
      // session中无用户信息, 需要重新登录
      response.sendRedirect("login.jsp");
    } else {
      filterChain.doFilter(request, response);
    }
  }

  @Override
  public void destroy() {
  }
}
