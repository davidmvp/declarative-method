import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


public class Decode {

	public static void main(String[] args) throws FileNotFoundException
	{
		Scanner sc = new Scanner(new File(args[0]));
		Scanner sc1 = new Scanner(new File(args[1]));

		int row = sc.nextInt();
		int column = sc.nextInt();
		String [][] crossword = new String[row][column];
		String words = sc.nextLine();
		for (int i = 0; i < row; i++)
		{
			words = sc.nextLine();	
			//System.out.println(words);
			for (int j = 0; j < column; j++)
			{				
				crossword[i][j] = words.charAt(j) + "";	
			}
		}

		while (sc1.hasNext())
		{
			String clause = sc1.nextLine();
			//System.out.println("c " + clause);
			if (!clause.substring(0,1).equals("-"))
			{
				//System.out.println("aa");
				String ltr = clause.substring(0,1);
				//System.out.println(clause.substring(2,3));
				int row1 = Integer.parseInt(clause.substring(2,3));
				int col1 = Integer.parseInt(clause.substring(4,5));
				crossword[row1][col1] = ltr;
			}
		}
		
		for (int i = 0; i < row; i++)
		{
			for (int j = 0; j < column; j++)
			{				
				System.out.print(crossword[i][j]);
			}
			System.out.println();
		}
	}
}
