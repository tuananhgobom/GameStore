package com.example.demo.entities;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
     
    @Column
     private BigDecimal price;
     
    @Column
     private String img;
     
    @Column
     private Long madonhang;
    
    @Column
    private Integer soLuong;
    
    public Integer getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(Integer soLuong) {
		this.soLuong = soLuong;
	}

	@Column
     private String gameId;
     
    @Column
     private String gameName;
     
    @Column
     private GameType type;
    
    @Column
    private Publisher publisher;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Long getMadonhang() {
		return madonhang;
	}

	public void setMadonhang(Long madonhang) {
		this.madonhang = madonhang;
	}

	public String getGameId() {
		return gameId;
	}

	public void setGameId(String gameId) {
		this.gameId = gameId;
	}

	public String getGameName() {
		return gameName;
	}

	public void setGameName(String gameName) {
		this.gameName = gameName;
	}

	public GameType getType() {
		return type;
	}

	public void setType(GameType type) {
		this.type = type;
	}

	public Publisher getPublisher() {
		return publisher;
	}

	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}
    
    
}
