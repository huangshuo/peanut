package com.peanut.web.config.filter;

import javax.servlet.*;
import java.io.IOException;

/**
 * description: 设置请求编码和响应contentType.
 *
 * @author huangs
 * @date 2019-04-21
 * @see com.peanut.web.config.filter
 * @since 1.0
 */
public class CharsetConfigFilter implements Filter {

  @Override
  public void init(FilterConfig filterConfig) {
  }

  @Override
  public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
    servletRequest.setCharacterEncoding("UTF-8");
    servletResponse.setContentType("application/json;charset=utf-8");
    filterChain.doFilter(servletRequest, servletResponse);
  }

  @Override
  public void destroy() {
  }
}
