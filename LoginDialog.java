import javax.swing.*;
import java.awt.*;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class LoginDialog extends JDialog {
    private JTextField userIdField;
    private JComboBox<String> roleComboBox;
    private User authenticatedUser = null;

    private static final Set<String> VALID_LIBRARIAN_IDS = new HashSet<>(Arrays.asList("1000", "1001", "1002", "1003", "1004", "1005", "1006", "1007"));

        private static final Set<String> VALID_PATRON_IDS = new HashSet<>(Arrays.asList("1900", "1901", "1902", "1903", "1904", "1905", "1906", "1907"));
    
    public LoginDialog(JFrame parent) {
        super(parent, "Library Login", true);
        setSize(350, 180);
        setLocationRelativeTo(parent);
        setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
        
        JPanel panel = new JPanel(new GridLayout(3, 2, 10, 10));
        panel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
        
        panel.add(new JLabel("User ID:"));
        userIdField = new JTextField();
        panel.add(userIdField);
        
        panel.add(new JLabel("Role:"));
        roleComboBox = new JComboBox<>(new String[]{"Librarian", "Patron"});
        panel.add(roleComboBox);
        
        JButton loginBtn = new JButton("Login");
        loginBtn.addActionListener(e -> attemptLogin());
        panel.add(loginBtn);
        
        JButton cancelBtn = new JButton("Cancel");
        cancelBtn.addActionListener(e -> { dispose(); System.exit(1); });
        panel.add(cancelBtn);
        
        add(panel);
        
        userIdField.addActionListener(e -> attemptLogin());
    }
    
    private void attemptLogin() {
        String userId = userIdField.getText().trim();
        String selectedRole = (String) roleComboBox.getSelectedItem();
        
        if (userId.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please enter a User ID");
            return;
        }
        
        User.UserRole role = selectedRole.equals("Librarian") 
            ? User.UserRole.LIBRARIAN 
            : User.UserRole.PATRON;

        if (role == User.UserRole.LIBRARIAN ) {
            if (!VALID_LIBRARIAN_IDS.contains(userId)) {
                JOptionPane.showMessageDialog(this, "Unauthorized! Invalid Librarian ID.","Login Failed", JOptionPane.ERROR_MESSAGE);
                return;
            }
            else {
                authenticatedUser = new User(userId, role);
                dispose();
            }
        }
        else {
            if (!VALID_PATRON_IDS.contains(userId)) {
                JOptionPane.showMessageDialog(this, "Unauthorized! Invalid Patron ID.", "Login Failed", JOptionPane.ERROR_MESSAGE);
                return;
            }
            else {
                authenticatedUser = new User(userId, role);
                dispose();
            }
        }
    }
    
    public User getAuthenticatedUser() {
        return authenticatedUser;
    }
}
