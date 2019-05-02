package com.peanut.web.controller.backend.game;

import com.peanut.common.http.ServletUrl;
import com.peanut.common.util.FileUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;

/**
 * description: /upload.
 *
 * @author huangs
 * @date 2019-04-30
 * @see com.peanut.web.controller
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.UPLOAD)
public class UploadController extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
    // 判断contentType是否multipart/form-data
    boolean isMultipart = ServletFileUpload.isMultipartContent(req);
    if (isMultipart) {
      // 创建FileItem的临时工厂对象
      DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
      // 解析httpRequest中的文件流的核心对象
      ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
      // 获取WEB-INF目录在文件系统中的绝对路径
      String basePath = getServletContext().getRealPath("WEB-INF/");
      String uploadPath = "upload/";
      try {
        // 解析结果为List<FileItem>
        @SuppressWarnings("unchecked")
        List<FileItem> fileItemList = servletFileUpload.parseRequest(req);
        for (FileItem fileItem : fileItemList) {
          // 判断是文件对象还是普通的name/value值对
          if (!fileItem.isFormField()) {
            // 获取文件名(拼接文件名, 防止文件重名时覆盖)
            String fileName = FileUtil.spliceFileName(fileItem.getName());
            // 将文件对象复制至file对象, 保存到服务器
            File file = new File(basePath + uploadPath + fileName);
            fileItem.write(file);
          }
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
  }
}
