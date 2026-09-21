public class User {
    private String userId;
    private UserRole role;
    
    public enum UserRole {
        LIBRARIAN,
        PATRON
    }
    
    public User(String userId, UserRole role) {
        this.userId = userId;
        this.role = role;
    }
    
    public String getUserId() { return userId; }
    public UserRole getRole() { return role; }
    public boolean isLibrarian() { return role == UserRole.LIBRARIAN; }
    public boolean isPatron() { return role == UserRole.PATRON; }
}
