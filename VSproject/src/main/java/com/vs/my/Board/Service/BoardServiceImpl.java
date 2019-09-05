package com.vs.my.Board.Service;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.util.JSONPObject;
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
	public List<BoardVO> BoardAllData(int page) {
		// TODO Auto-generated method stub
		return bdao.BoardAllData(page);
	}

	@Override
	public void BoardInsertData(BoardVO vo) {

		bdao.BoardInsertData(vo);		

	}

	@Override
	public void BoardFileSave(MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("profileUpload");
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);
		
		String filepath = realFolder +"\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		
		JSONObject jobj = new JSONObject();
		jobj.put("url", "images/" + str_filename);
		
		//out.println("profileUpload/"+str_filename);
		out.println(jobj.toJSONString());
		out.close();
	}

	@Override
	public BoardVO Content(BoardVO vo) {
		// TODO Auto-generated method stub
		return bdao.Content(vo);
	}
	
	@Override
	public int BoardListCount() {
		// TODO Auto-generated method stub
		return bdao.BoardListCount();
	}

	@Override
	public List<BoardVO> UserBoard(String u_id) {
		// TODO Auto-generated method stub
		return bdao.UserBoard(u_id);
	}

	@Override
	public List<BoardVO> VSSBoard(int vss_seq) {
		// TODO Auto-generated method stub
		return bdao.VSSBoard(vss_seq);
	}

}
