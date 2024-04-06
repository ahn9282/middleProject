package jk.fns;

public class Print {
	private static StringBuilder print = new StringBuilder();
	public static <T> void append(T t) {
		Print.print.append(t);
	}
	public static String getString() {
		String str = Print.print.toString();
		Print.print.setLength(0);
		return str;
	}
}
