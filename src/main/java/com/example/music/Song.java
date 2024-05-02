package com.example.music;

import java.io.InputStream;

public class Song {
	private InputStream songInputStream;
	private String songName;
	private String artist; 
	private String album;
	private String lyrics;
	
	public Song(InputStream songInputStream, String songName, String artist, String album, String lyrics) {
		this.songInputStream = songInputStream;
		this.songName = songName;
		this.artist = artist;
		this.album = album;
		this.lyrics = lyrics;
	}
	
	public InputStream getSongInputStream() {
		return songInputStream;
	}

	public void setSongInputStream(InputStream songInputStream) {
		this.songInputStream = songInputStream;
	}

	public String getSongName() {
		return songName;
	}

	public void setSongName(String songName) {
		this.songName = songName;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
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
	

}
