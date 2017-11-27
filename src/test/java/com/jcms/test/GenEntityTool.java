package com.jcms.test;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Date;

/**
 * @Description: 实体生成工具类 @author： WLG
 * @date 2017年5月8日 下午1:19:01
 */
public class GenEntityTool {
	private String packageOutPath = "test";// 指定实体生成工具类（GenEntityTool）所在包的路径
	private String authorName = "WLG";// 作者名字
	private String tablename = "sys_permission";// 表名

	private String[] colnames; // 列名数组
	private String[] colTypes; // 列名类型数组
	private int[] colSizes; // 列名大小数组
	private String[] comment;
	private boolean f_util = false; // 是否需要导入包java.util.*
	private boolean f_sql = false; // 是否需要导入包java.sql.*
	private String outpath = "F:/Entity.java";// 生成java文件的路径
	// 数据库连接
	private static final String URL = "jdbc:mysql://localhost:3306/jcms_db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private static final String NAME = "root";
	private static final String PASS = "admin";
	private static final String DRIVER = "com.mysql.jdbc.Driver";

	/*
	 * 构造函数
	 */
	public GenEntityTool() {
		// 创建连接
		Connection con;
		// 查要生成实体类的表
		String sql = "SELECT * FROM " + tablename;
		// 生成字段注释SQLSERVER
		/*String cString = "SELECT C.value AS column_description " + "FROM sys.tables A "
				+ "INNER JOIN sys.columns B ON B.object_id = A.object_id "
				+ "LEFT JOIN sys.extended_properties C ON C.major_id = B.object_id AND C.minor_id = B.column_id "
				+ "WHERE A.name = N" + "'" + tablename + "'";*/
		//MYSQL
		String cString = "select column_comment as column_description from INFORMATION_SCHEMA.Columns where table_name='"+tablename+"' and table_schema='jcms_db'";

		PreparedStatement pStemt = null;
		try {
			try {
				Class.forName(DRIVER);
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			con = DriverManager.getConnection(URL, NAME, PASS);
			pStemt = con.prepareStatement(sql);
			ResultSetMetaData rsmd = pStemt.getMetaData();
			ResultSet rs = con.prepareStatement(cString).executeQuery();

			int size = rsmd.getColumnCount(); // 统计列
			colnames = new String[size];
			colTypes = new String[size];
			colSizes = new int[size];
			comment = new String[size];
			int m = 0;
			while (rs.next()) {
				comment[m] = rs.getString(1);
				// System.out.println(comment[m]);
				m++;
			}

			for (int i = 0; i < size; i++) {
				colnames[i] = captureName(rsmd.getColumnName(i + 1).toLowerCase());
				colTypes[i] = rsmd.getColumnTypeName(i + 1);

				if (colTypes[i].equalsIgnoreCase("datetime")) {
					f_util = true;
				}
				if (colTypes[i].equalsIgnoreCase("image") || colTypes[i].equalsIgnoreCase("text")) {
					f_sql = true;
				}
				colSizes[i] = rsmd.getColumnDisplaySize(i + 1);
			}

			String content = parse(colnames, colTypes, colSizes);

			try {
				// File directory = new File("");
				// System.out.println("绝对路径："+directory.getAbsolutePath());
				// System.out.println("相对路径："+directory.getCanonicalPath());
				// String path=this.getClass().getResource("").getPath();

				// System.out.println(path);
				// System.out.println("src/?/"+path.substring(path.lastIndexOf("/com/",
				// path.length())) );
				// String outputPath = directory.getAbsolutePath()+
				// "/src/"+path.substring(path.lastIndexOf("/com/",
				// path.length()), path.length()) + initcap(tablename) +
				// ".java";
				FileWriter fw = new FileWriter(outpath);
				PrintWriter pw = new PrintWriter(fw);
				pw.println(content);
				pw.flush();
				pw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// try {
			// con.close();
			// } catch (SQLException e) {
			// // TODO Auto-generated catch block
			// e.printStackTrace();
			// }
		}
	}

	/**
	 * 功能：生成实体类主体代码
	 * 
	 * @param colnames
	 * @param colTypes
	 * @param colSizes
	 * @return
	 */
	private String parse(String[] colnames, String[] colTypes, int[] colSizes) {
		StringBuffer sb = new StringBuffer();
		sb.append("package " + this.packageOutPath + ";\r\n");
		// 判断是否导入工具包
		if (f_util) {
			sb.append("import java.util.Date;\r\n");
		}
		if (f_sql) {
			sb.append("import java.sql.*;\r\n");
		}
		sb.append("\r\n");
		// 注释部分
		sb.append("   /**\r\n");
		sb.append("    * " + tablename + " 实体类\r\n");
		sb.append("    * " + new Date() + " " + this.authorName + "\r\n");
		sb.append("    */ \r\n");
		// 实体部分
		sb.append("\r\n\r\npublic class " + initcap(tablename) + "{\r\n");
		processAllAttrs(sb);// 属性
		processAllMethod(sb);// get set方法
		sb.append("}\r\n");

		// System.out.println(sb.toString());
		return sb.toString();
	}

	/**
	 * 功能：生成所有属性
	 * 
	 * @param sb
	 */
	private void processAllAttrs(StringBuffer sb) {

		for (int i = 0; i < colnames.length; i++) {

			sb.append("\t /** " + comment[i] + " */ \r\n");
			sb.append("\tprivate " + sqlType2JavaType(colTypes[i]) + " " + colnames[i] + ";\r\n");
		}

	}

	/**
	 * 首字母大写
	 * 
	 * @param name
	 * @return
	 */
	public static String captureName(String name) {
		String[] names = name.split("_");
		String a = "";
		for (int i = 0; i < names.length; i++) {
			if (i > 0) {
				names[i] = names[i].substring(0, 1).toUpperCase() + names[i].substring(1);
			}

			a += names[i];
		}

		return a;

	}

	/**
	 * 功能：生成所有方法
	 * 
	 * @param sb
	 */
	private void processAllMethod(StringBuffer sb) {

		for (int i = 0; i < colnames.length; i++) {
			sb.append("\tpublic void set" + initcap(colnames[i]) + "(" + sqlType2JavaType(colTypes[i]) + " "
					+ colnames[i] + "){\r\n");
			sb.append("\tthis." + colnames[i] + "=" + colnames[i] + ";\r\n");
			sb.append("\t}\r\n");
			sb.append("\tpublic " + sqlType2JavaType(colTypes[i]) + " get" + initcap(colnames[i]) + "(){\r\n");
			sb.append("\t\treturn " + colnames[i] + ";\r\n");
			sb.append("\t}\r\n");
		}

	}

	/**
	 * 功能：将输入字符串的首字母改成大写
	 * 
	 * @param str
	 * @return
	 */
	private String initcap(String str) {

		char[] ch = str.toCharArray();
		if (ch[0] >= 'a' && ch[0] <= 'z') {
			ch[0] = (char) (ch[0] - 32);
		}

		return new String(ch);
	}

	/**
	 * 功能：获得列的数据类型
	 * 
	 * @param sqlType
	 * @return
	 */
	private String sqlType2JavaType(String sqlType) {
		// System.out.println(sqlType);
		if (sqlType.equalsIgnoreCase("bit")) {
			return "Boolean";
		} else if (sqlType.equalsIgnoreCase("tinyint")) {
			return "byte";
		} else if (sqlType.equalsIgnoreCase("smallint")) {
			return "short";
		} else if (sqlType.equalsIgnoreCase("int")) {
			return "Integer";
		} else if (sqlType.toLowerCase().contains("bigint")) {

			return "Long";
		} else if (sqlType.equalsIgnoreCase("Float")) {
			return "float";
		} else if (sqlType.equalsIgnoreCase("decimal") || sqlType.equalsIgnoreCase("numeric")
				|| sqlType.equalsIgnoreCase("real") || sqlType.equalsIgnoreCase("money")
				|| sqlType.equalsIgnoreCase("smallmoney")) {
			return "Double";
		} else if (sqlType.equalsIgnoreCase("varchar") || sqlType.equalsIgnoreCase("char")
				|| sqlType.equalsIgnoreCase("nvarchar") || sqlType.equalsIgnoreCase("nchar")
				|| sqlType.equalsIgnoreCase("text")) {
			return "String";
		} else if (sqlType.equalsIgnoreCase("datetime")) {
			return "Date";
		} else if (sqlType.equalsIgnoreCase("image")) {
			return "Blod";
		}

		return null;
	}

	/**
	 * 出口 TODO
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			new GenEntityTool();
			System.out.println("==============>生产实体成功");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("===============>生产实体失败");
		}
	}

}
