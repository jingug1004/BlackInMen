package com.eagle.men_in_black.excel;

import java.util.UUID;

import com.fasterxml.uuid.EthernetAddress;
import com.fasterxml.uuid.Generators;
import com.fasterxml.uuid.NoArgGenerator;

public class UUID_TimeStamp {

	public static void main(String[] args) {
		NoArgGenerator timeBasedGenerator = Generators.timeBasedGenerator();

        //Generate time based UUID 137107504334920111
        UUID firstUUID = timeBasedGenerator.generate();
       // System.out.printf("1. First UUID is : %s ", firstUUID.toString());
       // System.out.print( firstUUID.timestamp());

        UUID secondUUID = timeBasedGenerator.generate();
       // System.out.printf("\n3. Second UUID is :%s ", secondUUID.toString());
       // System.out.printf("\n4. Timestamp of UUID is : %d ", secondUUID.timestamp());

        //Generate custom UUID from network interface
        timeBasedGenerator = Generators.timeBasedGenerator(EthernetAddress.fromInterface());
        UUID customUUID = timeBasedGenerator.generate();
        UUID anotherCustomUUID = timeBasedGenerator.generate();

       // System.out.printf("\n5. Custom UUID is :%s ", customUUID.toString());
       // System.out.printf("\n6. Another custom UUID : %s ", anotherCustomUUID.toString());
    } 

}
