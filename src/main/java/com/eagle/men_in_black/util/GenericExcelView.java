package com.eagle.men_in_black.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.eagle.men_in_black.model.CeoMypageDto;


@SuppressWarnings("deprecation")
public class GenericExcelView extends AbstractExcelView  {

	
	protected void buildExcelDocument(Map<String, Object> modelMap,
			HSSFWorkbook workbook, HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		int flag = 1;
		int startRow =5;
		int startCol =1;
		
		// TODO Auto-generated method stub
		String fileName = (String) modelMap.get("excelName");
		List<String> colName = (List<String>) modelMap.get("colName");
		List<CeoMypageDto> colValue = (List<CeoMypageDto>) modelMap.get("colValue");
		HashMap<String, String> prophomap = (HashMap<String, String>)modelMap.get("prophomap");
		
		res.setContentType("application/msexcel");
		res.setHeader("Content-Disposition", "attachment; filename="+ fileName+"_"+ExcelUtil.getPK() + ".xls");
		
		//HSSFSheet sheet = workbook.createSheet(fileName);
		//work sheet생성
				if(fileName.equals(""))fileName="sheet1";
				HSSFSheet workSheet = workbook.createSheet(fileName);
				
				//행생성
				HSSFRow row = workSheet.createRow(startRow);
				
				//cell생성
				HSSFCell  cell;
				
				//스타일 설정


				//스타일 객체 생성 
				HSSFCellStyle styleHd = workbook.createCellStyle();    //제목 스타일
				HSSFCellStyle styleBody = workbook.createCellStyle();   //내용 스타일


				//제목 폰트
				HSSFFont font = workbook.createFont();
				font.setFontHeightInPoints((short)12);
				font.setBoldweight((short)font.BOLDWEIGHT_BOLD);
				font.setFontName("맑은고딕");
				font.setColor(HSSFColor.WHITE.index);
				
				//제목 스타일에 폰트 적용, 정렬
				styleHd.setFont(font);
				styleHd.setAlignment(HSSFCellStyle.ALIGN_CENTER);
				styleHd.setVerticalAlignment (HSSFCellStyle.VERTICAL_CENTER);
		        styleHd.setFillBackgroundColor(HSSFColor.GREY_40_PERCENT.index);
		        styleHd.setFillForegroundColor(HSSFColor.GREY_40_PERCENT.index);
		        
		        
				styleHd.setFillPattern(CellStyle.SOLID_FOREGROUND);		
				
				// 상단 메뉴명 생성

				HSSFRow menuRow = workSheet.createRow(startRow);

				for (int i = 0; i < colName.size(); i++) {
					cell = menuRow.createCell(startCol+i);
					cell.setCellStyle(styleHd);
					cell.setCellValue(new HSSFRichTextString(colName.get(i)));
				}				
				
				// 내용 생성

				for (int i = 0; i < colValue.size(); i++) {
					CeoMypageDto vo = (CeoMypageDto)colValue.get(i);
					// 메뉴 ROW가 있기때문에 +1을 해준다.
					row = workSheet.createRow(i+(startRow+1));
			     	
					cell = row.createCell(startCol+0);
					cell.setCellValue(prophomap.get("PRO_NAME"+i));
					
					cell = row.createCell(startCol+1);
					cell.setCellValue(vo.getUSER_ID());
					
					cell = row.createCell(startCol+2);
					cell.setCellValue(prophomap.get("count"+i));
					
					cell = row.createCell(startCol+3);
					cell.setCellValue(vo.getCOUPON());
					

					cell = row.createCell(startCol+4);
					cell.setCellValue(vo.getPOINT());
					

					cell = row.createCell(startCol+5);
					cell.setCellValue(vo.getFINAL_PRICE());
					

					cell = row.createCell(startCol+6);
					cell.setCellValue(vo.getDEL_TIME());
				}				
				
				for (int i=1;i<4;i++) 
				{ 
					workSheet.autoSizeColumn(i);
					workSheet.setColumnWidth(i, (workSheet.getColumnWidth(i))+512 ); //이건 자동으로 조절 하면 너무 딱딱해 보여서 자동조정한 사이즈에 (short)512를 추가해 주니 한결 보기 나아졌다.
				}
				workSheet.setColumnWidth(0, 500);				
	}

}
