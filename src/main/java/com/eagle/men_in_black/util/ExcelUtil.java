package com.eagle.men_in_black.util;

import java.util.UUID;

import com.fasterxml.uuid.Generators;
import com.fasterxml.uuid.NoArgGenerator;

public  class ExcelUtil {
	
	public static long getPK()
	{
		NoArgGenerator timeBasedGenerator = Generators.timeBasedGenerator();
        //Generate time based UUID
        UUID firstUUID = timeBasedGenerator.generate();        
		return firstUUID.timestamp();
	}
}
