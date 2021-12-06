package statemachine;

import beaver.Parser;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;

public class SMTest {

    public static void main(String[] args) {

        String inFile;

        if (args.length != 1) {
            inFile = "tests/StateMachineT.txt";
        } else inFile = args[0];

        try {
            StateScanner scanner = new StateScanner(new FileReader(inFile));

            SMParser parser = new SMParser();

            Machine m = (Machine) parser.parse(scanner);

            for (State s : m.getStatess()) {
                System.out.println(Arrays.toString(s.successors().toArray()));
            }
            System.out.println("Reachable:");
            for (State s : m.getStatess()) {
                s.printReachable();
            }

            System.out.println("Analisys: ");
            //System.out.println(m.analysis() ? "No Errors" : "Errors found");
            System.out.println(m.stringAnalysis());


        } catch (FileNotFoundException e) {
            System.err.printf("File %s not found%n", inFile);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Parser.Exception e) {
            System.err.println("Parsing error");
        }

    }

}
