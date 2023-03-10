package egovframework.appn.cop.cmt.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.appn.cop.cmt.service.Comment;
import egovframework.appn.cop.cmt.service.CommentVO;

@Repository("EgovArticleCommentDAO")
public class EgovArticleCommentDAO extends EgovComAbstractDAO{

	public List<?> selectArticleCommentList(CommentVO commentVO) {
		return list("ArticleComment.selectArticleCommentList", commentVO);
	}

	public int selectArticleCommentListCnt(CommentVO commentVO) {
		return (Integer)select("ArticleComment.selectArticleCommentListCnt", commentVO);
	}

	public void insertArticleComment(Comment comment) {
		insert("ArticleComment.insertArticleComment", comment);
	}

	public void deleteArticleComment(CommentVO commentVO) {
		update("ArticleComment.deleteArticleComment", commentVO);
	}

	public CommentVO selectArticleCommentDetail(CommentVO commentVO) {
		return (CommentVO) select("ArticleComment.selectArticleCommentDetail", commentVO);
	}

	public void updateArticleComment(Comment comment) {
		update("ArticleComment.updateArticleComment", comment);
	}

}
