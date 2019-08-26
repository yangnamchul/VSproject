package com.vs.my.Board.Service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.vs.my.Board.DAOVO.BoardDAO;
import com.vs.my.Board.DAOVO.BoardVO;
import com.vs.my.User.DAOVO.UserDAO;
@Service
public class BoardServiceImpl implements BoardService
{
    @Autowired
	BoardDAO bdao;
    
    @Autowired
   	UserDAO udao;
	
	@Override
	public List<BoardVO> BoardAllData() {
		// TODO Auto-generated method stub
		return bdao.BoardAllData();
	}

	@Override
	public void BoardInsertData(BoardVO vo) {

		bdao.BoardInsertData(vo);		

	}

	@Override
	public String BoardFileSave(String path, MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("profileUpload");
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);
		
		//String filepath = realFolder + "\\" + path + "\\" + str_filename;
		String filepath = "arn:aws:s3:::vsproject" + str_filename;
		System.out.println("파일경로 : " + filepath);
		
		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		
		
		return filepath;
	}

}
