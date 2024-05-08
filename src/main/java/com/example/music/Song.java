package com.example.music;

import java.io.InputStream;

public class Song {
	private String songName;
	private String singer;
	private String album;
	private String lyrics;
	private String filePath;
	
	public Song(String songName, String singer, String album, String lyrics, String filePath) {
		this.songName = songName;
		this.singer = singer;
		this.album = album;
		this.lyrics = lyrics;
		this.filePath = filePath;
	}

	public String getSongName() {
		return songName;
	}

	public void setSongName(String songName) {
		this.songName = songName;
	}

	public String getSinger() {
		return singer;
	}

	public void setSinger(String singer) {
		this.singer = singer;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public String getLyrics() {
		return lyrics;
	}

	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
}
