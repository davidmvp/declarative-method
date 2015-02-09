import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;


public class problem2 {

    /**
     * @param args
     * @throws FileNotFoundException
     */
    public static void main(String[] args) throws FileNotFoundException {
	// TODO Auto-generated method stub
	ArrayList<Integer> duration = new ArrayList<Integer>();
	ArrayList<String> task = new ArrayList<String>();
	int [][] cumulative = new int[1000][1000];
	int counter = 0;
	int [] section4 = {2, 1, 1, 2, 1, 2, 1, 2, 5, 2, 1, 4, 3};
	Scanner sc = new Scanner(new File("rcps.data"));
	System.out.println(":- lib(ic).");
	System.out.println(":- lib(branch_and_bound).");
	System.out.println(":- lib(ic_edge_finder).");
	System.out.println();
	System.out.println("solve(EndTime) :-");

	System.out.println("TaskFinishTimes = [");
	sc.nextLine();
	sc.nextLine();
	while (sc.hasNext()) {

	    String line = sc.nextLine();
	    if (line.equals("")) {
		break;
	    }
	    String[] splited = line.split(" ");
	    for (int i = 6 ; i < 19; i++) {
		cumulative[counter][i-6] = Integer.parseInt(splited[i]);
		//System.out.println(splited[i]);
	    }
	    counter++;
	    task.add(splited[0].substring(6,14));
	    //System.out.println(splited[1]);
	    String[] min = splited[1].split(":");
	    int minute = Integer.parseInt(min[0]) * 60 + Integer.parseInt(min[1]);
	    duration.add(minute);
	    //System.out.println(minute);

	}
	sc.nextLine();
	for (int i = 0; i < task.size(); i++) {
	    System.out.println("      F_" + task.get(i) + ",");



	}
	System.out.println("F_emptyvar],");
	System.out.println("TaskStartTimes = [");

	for (int i = 0; i < task.size(); i++) {
	    System.out.println("      S_" + task.get(i) + ",");



	}
	System.out.println("S_emptyvar],");
	System.out.println("TaskFinishTimes :: 0..60000,");
	System.out.println("TaskStartTimes :: 0..60000,");
	System.out.println();
	System.out.println("%declare durations");
	for (int i = 0; i < task.size(); i++) {
	    System.out.println("      F_" + task.get(i) + " - S_" + task.get(i)
			       + " #= " + duration.get(i) + ",");



	}

	while (sc.hasNext()) {
	    String line = sc.nextLine();
	    if (line.equals("")) {
		break;
	    }
	    String[] splited = line.split(" ");
	    System.out.println("S_" + splited[1].substring(6,14) + " #>= F_"
			       + splited[0].substring(6,14) + ",");

	    //System.out.println(s1[0]);



	}

	for (int i = 0 ; i < 13; i++) {
	    System.out.print("cumulative([");
	    boolean first = false;

	    for (int j=0; j< task.size(); j++) {
		if (cumulative[j][i] != 0) {
		    if (first == true) {
			System.out.print(", ");
			}
		    System.out.print("S_" + task.get(j));
		    first = true;
		}
	    }
	    first = false;
	    System.out.print("],[");
	    for (int j=0; j< task.size(); j++) {
		if (cumulative[j][i] != 0) {
		    if (first == true) {
			System.out.print(", ");
		    }
		    System.out.print(duration.get(j));
		    first = true;
		}
	    }
	    first = false;
	    System.out.print("],[");
	    for (int j=0; j< task.size(); j++) {
		if (cumulative[j][i] != 0) {
		    if (first == true) {
			System.out.print(", ");
		    }
		    System.out.print(cumulative[j][i]);
		    first = true;
		}
	    }
	    System.out.println("], " + section4[i] + "),");
	    System.out.println();
	}

	System.out.println("%declare solution commands");
	System.out.println("EndTime #= max(TaskFinishTimes),");
	System.out.println("flatten([TaskStartTimes, TaskFinishTimes, EndTime], AllVars),");
	System.out.println("minimize(search(AllVars, 0, input_order, indomain_middle, lds(1), []), EndTime),");
	System.out.println();
	for (int i = 0; i < task.size(); i++) {
	    System.out.println("printf(\"asm_1." + task.get(i) +": %d - %d %n\", [S_" + task.get(i)
			       + ", F_" + task.get(i) + "]),");
	}
	System.out.println("printf(\"Done\", []).");
    }

}
