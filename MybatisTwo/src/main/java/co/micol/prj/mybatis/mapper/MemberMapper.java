package co.micol.prj.mybatis.mapper;

import java.util.List;

import co.micol.prj.memver.service.MemberVO;

public interface MemberMapper {
	List<MemberVO> memberSelectList();

	MemberVO memberSelect(MemberVO vo);

	int memberInsert(MemberVO vo);

	int memberUpdate(MemberVO vo);

	int memberDelete(MemberVO vo);
	
	boolean isIdCheck(String id);
}
