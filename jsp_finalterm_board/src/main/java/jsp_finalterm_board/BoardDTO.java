package jsp_finalterm_board;

import java.sql.Date;
import java.time.LocalDate;

public class BoardDTO {
	private int id;
	private String writer;
	private String title;
	private String content;
	private Date writtenDate;
	private int views;
	private int category;
	private int boardLevel;
	private int replyDepth;
	
	
	
	public BoardDTO() {
		super();
	}
	public BoardDTO(int id, String writer, String title, Date writtenDate, int views) {
		this.id = id;
		this.writer = writer;
		this.title = title;
		this.writtenDate = writtenDate;
		this.views = views;
	}
	public BoardDTO(int id, String writer, String title, String content, Date writtenDate, int views, int category,
			int boardLevel, int replyDepth) {
		super();
		this.id = id;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.writtenDate = writtenDate;
		this.views = views;
		this.category = category;
		this.boardLevel = boardLevel;
		this.replyDepth = replyDepth;
	}
	
	public BoardDTO(int id, String writer, String title, String content, int views) {
		this.id = id;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.views = views;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWrittenDate() {
		return writtenDate;
	}
	public void setWrittenDate(Date writtenDate) {
		this.writtenDate = writtenDate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getBoardLevel() {
		return boardLevel;
	}
	public void setBoardLevel(int boardLevel) {
		this.boardLevel = boardLevel;
	}
	public int getReplyDepth() {
		return replyDepth;
	}
	public void setReplyDepth(int replyDepth) {
		this.replyDepth = replyDepth;
	}
	
}
