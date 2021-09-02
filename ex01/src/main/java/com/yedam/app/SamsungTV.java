package com.yedam.app;

import org.springframework.stereotype.Component;

//@Component
public class SamsungTV implements TV{

	@Override
	public void turnon() {
		System.out.println("SamsungTV Turn On");
	}

	@Override
	public void turnoff() {
		System.out.println("SamsungTV Turn Off");
	}

	@Override
	public void volumeUp() {
		
	}

	@Override
	public void volumeDown() {
		
	}
}
