package com.peanut.web.config.filter;

import javax.servlet.*;
import java.io.IOException;

/**
 * description: 统一设置编码filter.
 *
 * @author huangs
 * @date 2019-04-21
 * @see com.peanut.web.config.filter
 * @since 1.0
 */
public class CharsetConfigFilter implements Filter {

  @Override
  public void init(FilterConfig filterConfig) throws ServletException {
  }

  @Override
  public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
    servletRequest.setCharacterEncoding("UTF-8");
    servletResponse.setCharacterEncoding("UTF-8");
    filterChain.doFilter(servletRequest, servletResponse);
  }

  @Override
  public void destroy() {
  }
}
