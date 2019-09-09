package com.vs.my.Reply.DAOVO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
private static final String namespace="mapper.reply-mapper";
	
	@Autowired  //DI로 객체를 주입하여 ~~~ 생각나야함~
	private SqlSession sqlSession;
	@Override
	public List<ReplyVO> ReplyAllData(int b_seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".ReplyAllData",b_seq);
	}
	
	@Override
	public int ReplyInsertData(ReplyVO rv) {
		// TODO Auto-generated method stub
			
		int result=sqlSession.insert(namespace+".ReplyInsertData", rv);
		
		rv.getRe_seq();
		System.out.println(rv.getRe_seq());
		
		/*Map<String, Object> resultMap = new HashMap<String, Object>();	
		resultMap.put("re_seq", rv.getRe_seq());
		*/
		System.out.println("reply insertmapper실행"+result);
	
		return rv.getRe_seq();
	}

	@Override
	public ReplyVO ReplyOneData(int re_seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".ReplyOneData",re_seq);
	}

	@Override
	public List<ReplyVO> UserReply(String u_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".UserReply",u_id);
	}

	@Override
	public int ReplyCnt(int b_seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".ReplyCnt", b_seq);
	}

	@Override
	public void delReply(int re_seq) {
		// TODO Auto-generated method stub
		sqlSession.selectOne(namespace+".delReply",re_seq);
	}

	


}
