package gt.edu.url;

import gt.edu.url.compiler.CoolLexer;
import gt.edu.url.compiler.TokenConstants;
import gt.edu.url.compiler.Utilities;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.Parameters;

import java.io.FileReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.Callable;
import java_cup.runtime.Symbol;

/** The lexer driver class */
@Command(name = "lexer", mixinStandardHelpOptions = true, version = "lexer 1.0",
        description = "Runs the lexer on specified input files.")
public class App implements Callable<Integer> {

    @Parameters(index = "0..*", description = "The input files to be processed by the lexer.")
    private List<String> inputFiles;

    @Option(names = {"-l", "--line-numbers"}, description = "Include line numbers in the output.")
    private boolean includeLineNumbers;

    /** Main method to start the lexer with Picocli */
    public static void main(String[] args) {
        int exitCode = new CommandLine(new App()).execute(args);
        System.exit(exitCode);
    }

    /** Runs the lexer on the specified files */
    @Override
    public Integer call() {
        for (String inputFile : inputFiles) {
            try (FileReader file = new FileReader(inputFile)) {
                System.out.println("#name \"" + inputFile + "\"");
                CoolLexer lexer = new CoolLexer(file);
                lexer.set_filename(inputFile);
                Symbol s;

                while ((s = lexer.next_token()).sym != TokenConstants.EOF) {
                    if (includeLineNumbers) {
                        // Print token with line numbers
                        Utilities.dumpToken(System.out, lexer.get_curr_lineno(), s);
                    } else {
                        // Print token without line numbers
                        System.out.println(Utilities.tokenToString(s));
                    }
                }
            } catch (FileNotFoundException ex) {
                System.err.println("Could not open input file " + inputFile);
                return 1; // Exit code for error
            } catch (IOException ex) {
                System.err.println("Unexpected exception in lexer for file " + inputFile);
                return 1; // Exit code for error
            }
        }
        return 0; // Exit code for success
    }
}
