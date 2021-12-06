# TypeChecker for MiniJava
### Setup
+ Building: Run [build.xml](build.xml) with ant.
+ Testing: Run the [AllTests.java](junit/tests/AllTests.java) suite with junit.
+ (optional) JastAdd Syntax Highlighting in Eclipse: [JastAdd Eclipse Plugin](http://jastadd.org/web/tool-support/syntax-highlighting.php). <br>
Then in *Preferences* under *File->Editors->FileAssociations* associate "\*.beaver" with "JastAdd Parser Editor"

### Compilation order
1. [Scan the input](/docs/Scanning.md) via JFlex
2. [Parse the token stream](/docs/Parsing.md) via Beaver
3. Annotate the [Abstract Syntax Tree (AST)](/statemachine/statemachine.ast) via JastAdd
    + [Name resolution](/docs/NameResolution.md)
    + [Type analysis](/docs/TypeAnalysis.md)
    + [Error checking](/docs/ErrorChecking.md)


### Usage examples
####  Check for Syntax/Semantic errors:
```java
MJFile file = new MJFile("tests/Factorial.java");
minijava.Program program = file.parse();
for (SemanticError e : program.errors()) {
    System.err.println(e.getMessage());
}
```

