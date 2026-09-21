import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.SwingUtilities;

public class A9GUInew extends JFrame {
    private JTextArea displayArea;
    private Connection conn;
    private static final String DB_URL = ""; // redacted for security
    private static final String DB_USER = ""; // your cs username
    private static final String DB_PASSWORD = ""; // your cs password
    private User currentUser;

    public A9GUInew(){
        super("Oracle Library Management");
        
        try {
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Database connection failed: " + ex.getMessage());
            System.exit(1);
        }
        
        LoginDialog loginDialog = new LoginDialog(this);
        loginDialog.setVisible(true);
        currentUser = loginDialog.getAuthenticatedUser();
        
        if (currentUser == null) {
            closeConnection();
            System.exit(0);
        }
        
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(1000, 600);
        setLayout(new BorderLayout());
        JPanel menuPanel = new JPanel();
        menuPanel.setLayout(new GridLayout(0, 1, 5, 5));
        displayArea = new JTextArea();
        displayArea.setEditable(false);
        displayArea.setMargin(new java.awt.Insets(10, 10, 10, 10));
        JScrollPane scrollPane = new JScrollPane(displayArea);
        add(menuPanel, BorderLayout.WEST);
        add(scrollPane, BorderLayout.CENTER);
        displayArea.setFont(new java.awt.Font("Courier New", java.awt.Font.PLAIN, 12));
        displayArea.append("Welcome, " + currentUser.getUserId() + "!\n");
        displayArea.append("Role: " + currentUser.getRole() + "\n\n");
        buildMenu(menuPanel);
        setVisible(true);

        if (currentUser.isPatron()) {
            displayArea.setVisible(false);
            runSQLFile("drop_tables.sql");
            runSQLFile("create_tables.sql");
            runSQLFile("populate_tables.sql");
            displayArea.setText("");
            displayArea.append("Welcome, " + currentUser.getUserId() + "!\n");
            displayArea.append("Role: " + currentUser.getRole() + "\n\n");
            displayArea.setVisible(true);
        }
    }
    
    private void buildMenu(JPanel menuPanel) {
        JButton testConnBtn = new JButton("Test Connection");
        testConnBtn.addActionListener(e -> testConnection());
        menuPanel.add(testConnBtn);

        // Librarian Only Buttons
        if (currentUser.isLibrarian()) {
            JButton createTablesBtn = new JButton("Create Tables");
            createTablesBtn.addActionListener(e -> runSQLFile("create_tables.sql"));
            menuPanel.add(createTablesBtn);

            JButton populateTablesBtn = new JButton("Populate Tables");
            populateTablesBtn.addActionListener(e -> runSQLFile("populate_tables.sql"));
            menuPanel.add(populateTablesBtn);

            JButton dropTablesBtn = new JButton("Drop Tables");
            dropTablesBtn.addActionListener(e -> runSQLFile("drop_tables.sql"));
            menuPanel.add(dropTablesBtn);

            JButton showTablesBtn = new JButton("Show Tables");
            showTablesBtn.addActionListener(e -> runSQLFile("show_tables.sql"));
            menuPanel.add(showTablesBtn);

            JButton simpleQueriesBtn = new JButton("Run Simple Queries");
            simpleQueriesBtn.addActionListener(e -> runSQLFile("run_simple_queries.sql"));
            menuPanel.add(simpleQueriesBtn);

            JButton advancedQueriesBtn = new JButton("Run Advanced Queries");
            advancedQueriesBtn.addActionListener(e -> runSQLFile("run_advanced_queries.sql"));
            menuPanel.add(advancedQueriesBtn);
        }

        // Library Member Only Buttons
        if (currentUser.isPatron()) {
            JButton myFinesBtn = new JButton("View My Fines");
            myFinesBtn.addActionListener(e -> viewMyFines());
            menuPanel.add(myFinesBtn);
            
            JButton myLoansBtn = new JButton("View My Loans");
            myLoansBtn.addActionListener(e -> viewMyLoans());
            menuPanel.add(myLoansBtn);
        }

        // Exit Buttons for All Users
        JButton exitOracleBtn = new JButton("Exit Oracle");
        exitOracleBtn.addActionListener(e -> closeConnection());
        menuPanel.add(exitOracleBtn);

        JButton exitBtn = new JButton("Exit");
        exitBtn.addActionListener(e -> System.exit(0));
        menuPanel.add(exitBtn);
    }
    
    private void viewMyFines() {
        displayArea.setText("");
        displayArea.append("Your Current Fines\n");
        displayArea.append("==================\n\n");
        
        String sql = "SELECT " +
                    "    lm.MemberID, " +
                    "    lm.FirstName, " +
                    "    lm.LastName, " +
                    "    SUM(b.FineAmount) AS TotalFine " +
                    "FROM library_member lm " +
                    "JOIN borrows b ON lm.MemberID = b.MemberID " +
                    "WHERE b.FineAmount > 0 " +
                    "    AND lm.MemberID = '" + currentUser.getUserId() + "' " +
                    "GROUP BY lm.MemberID, lm.FirstName, lm.LastName";
        
        executeSQL(sql);
    }
    
    private void viewMyLoans() {
        displayArea.setText("");
        displayArea.append("Your Current Loans\n");
        displayArea.append("==================\n\n");
        
        String sql = "SELECT " +
                    "    br.Name AS Branch, " +
                    "    bd.Title AS Book, " +
                    "    bw.MemberID, " +
                    "    m.FirstName AS Member_FName, " +
                    "    m.LastName AS Member_LName, " +
                    "    bw.BorrowDate " +
                    "FROM borrows bw " +
                    "JOIN book_copy bc ON bw.BookID = bc.BookID " +
                    "JOIN book_details bd ON bc.ISBN = bd.ISBN " +
                    "JOIN library_member m ON bw.MemberID = m.MemberID " +
                    "JOIN branch br ON bc.BranchID = br.BranchID " +
                    "WHERE bw.ReturnDate IS NULL " +
                    "    AND bw.MemberID = '" + currentUser.getUserId() + "'";
        
        executeSQL(sql);
    }

    private void testConnection() {
        displayArea.setText("");
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            
            String query = "SELECT sysdate FROM dual";
            
            try (Statement stmt = conn.createStatement()) {
                ResultSet rs = stmt.executeQuery(query);
                
                while (rs.next()) {
                    String date = rs.getString(1);
                    displayArea.append(date + "\n");
                }
            } catch (SQLException e) {
                displayArea.append(e.getErrorCode() + "\n");
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    displayArea.append("Connection is active.\n");
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    private void runSQLFile(String filename) {
        if (conn == null) {
            displayArea.append("No connection!\n");
            return;
        }

        displayArea.setText("");

        try (Scanner scanner = new Scanner(new File(filename))) {
            StringBuilder currentBlock = new StringBuilder();

            while (scanner.hasNextLine()) { 
               String line = scanner.nextLine().trim();
               
               if (line.startsWith("--")){
                displayArea.append(line.substring(2).trim() + "\n");
                continue;
               }

               if (line.isEmpty()) continue;

               currentBlock.append(line).append(" ");

               if (line.endsWith(";")) { 
                String sql = currentBlock.toString().trim();
                executeSQL(sql);
                currentBlock.setLength(0);
               }
            }
            if (currentBlock.length() > 0) executeSQL(currentBlock.toString().trim());

        } catch (FileNotFoundException e) {
            displayArea.append("File not found: " + filename + "\n");
        }
    }

    private void executeSQL(String sql) {
        if (sql == null) return;
        String toExec = sql.replaceAll(";+\\s*$", "");
        if (toExec.isEmpty()) return;
        try (Statement stmt = conn.createStatement()) {
            boolean hasResultSet = stmt.execute(toExec);
            if (hasResultSet) {
                ResultSet rs = stmt.getResultSet();
                ResultSetMetaData meta = rs.getMetaData();
                        int cols = meta.getColumnCount();
                        for (int i = 1; i <= cols; i++) {
                            displayArea.append(String.format("%-25s", meta.getTableName(i)));
                        }
                        displayArea.append("\n");
                        for (int i = 1; i <= cols; i++) {
                            displayArea.append(String.format("%-25s", meta.getColumnName(i)));
                        }
                        displayArea.append("\n");
                        while (rs.next()) {
                            for (int i = 1; i <= cols; i++) {
                                displayArea.append(String.format("%-25s", rs.getString(i)));
                            }
                            displayArea.append("\n");
                        }
                        displayArea.append("\n");
                    }
                } catch (SQLException ex) {
                    displayArea.append("Error executing command: " + ex.getMessage() + "\n");
                }
            }

    private void closeConnection() {
        displayArea.setText(""); 
        if (conn != null) {
            try {
                conn.close();
                displayArea.append("Connection closed.\n");
            } catch (SQLException ex) {
                displayArea.append("Error closing connection: " + ex.getMessage() + "\n");
            }
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(A9GUInew::new);
    }
}
