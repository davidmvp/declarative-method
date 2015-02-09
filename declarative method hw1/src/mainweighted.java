import java.io.File;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


public class mainweighted {

	/**
	 * @param args
	 * @throws FileNotFoundException 
	 */
	
	public static void main(String[] args) throws FileNotFoundException {
		// TODO Auto-generated method stub
		Trie t = new Trie();
		List<String> l = new ArrayList<String>();
		String word = "";
		Scanner sc = new Scanner(new File(args[0]));
		Scanner sc1 = new Scanner(new File(args[1]));
		int row = sc.nextInt();
		int column = sc.nextInt();
		String [][] crossword = new String[row][column];
		//System.out.print(row);
		String words;
		sc.nextLine();
		ArrayList<String> letters = new ArrayList<String>();
		letters.add("a");
		letters.add("b");
		letters.add("c");
		letters.add("d");
		letters.add("e");
		letters.add("f");
		letters.add("g");
		letters.add("h");
		letters.add("i");
		letters.add("j");
		letters.add("k");
		letters.add("l");
		letters.add("m");
		letters.add("n");
		letters.add("o");
		letters.add("p");
		letters.add("q");
		letters.add("r");
		letters.add("s");
		letters.add("t");
		letters.add("u");
		//letters.add("v");
		letters.add("w");
		letters.add("x");
		letters.add("y");
		letters.add("z");
		for (int i = 0; i < row; i++) {
			words = sc.nextLine();
		
			for (int j = 0; j < column; j++) {
				
				crossword[i][j] = words.charAt(j) + "";
				
			}
			
		
		}
		
		for (int i = 0; i < row; i++) {
			
		
			for (int j = 0; j < column; j++) {
				
				//System.out.print(crossword[i][j]);
				
			}
			
		//System.out.println();
		}
	
		while (sc1.hasNext()) {
			
			t.addWord(sc1.nextLine());
			
		}
		//System.out.println(t.getWords(""));
		//String words = sc1.nextLine()
		int length = 0;
		
		for (int i = 0; i < row; i++) {
		List<String> l1 = new ArrayList<String>();
		
			for (int j = 0; j < column; j++) {
				//System.out.print(crossword[i][j]);
				 if (crossword[i][j].equals(".")) {
				     length++;
				     for (int u = 0; u < letters.size(); u++) {
							System.out.print( letters.get(u) +"," + (i+1) + "," + (j+1) + " v ");
						}
			     }
				 
				 else if (crossword[i][j].equals("#")) {
				     l = t.getWords("");
				     for (int z = 0; z < l.size() ; z++) {
				    	 if (l.get(z).length() == length) {
				    		 l1.add(l.get(z));
				    	 }
				     }
				    length =0;
				    for (int o = 0; o< l1.size();o++) {
				        
				    	System.out.print("~" + l1.get(o).charAt(0) + "," + (i+1) + "," + (j-1) + " v " + l1.get(o).charAt(1)  + "," + (i+1) + "," + (j)  );
				    	if (o != l1.size()-1)
				    	    System.out.print( " v ");
				        }
				    
				    if (l1.size()!=0)
				    System.out.print(" & ");
			        } 
				 }
				 //System.out.println(l1);
				 l = new ArrayList<String>();
				 l1 = new ArrayList<String>();
		}
		
		
		
	
	
		for (int j = 0; j < row; j++) {
			List<String> l1 = new ArrayList<String>();
			
				for (int i = 0; i < column; i++) {
					//System.out.print(crossword[i][j]);
					 if (crossword[i][j].equals(".")) {
					     length++;
					     
				     }
					 
					 else if (crossword[i][j].equals("#")) {
					     l = t.getWords("");
					     for (int z = 0; z < l.size() ; z++) {
					    	 if (l.get(z).length() == length) {
					    		 l1.add(l.get(z));
					    	 }
					     }
					    length =0;
					    
					    for (int o = 0; o< l1.size();o++) {
					        
					    	System.out.print("~" + l1.get(o).charAt(0) + "," + (i-1) + "," + (j+1) + " v " + l1.get(o).charAt(1)  + "," + (i) + "," + (j+1)  );
					    	if (o != l1.size()-1)
					    	    System.out.print( " v ");
					        }
					    
					    if (l1.size()!=0)
					   System.out.print(" & ");
				        
				     }
				
					// System.out.println(l1);
					 l = new ArrayList<String>();
					 l1 = new ArrayList<String>();
			}
			
			
			
		}
		
		
   }
}