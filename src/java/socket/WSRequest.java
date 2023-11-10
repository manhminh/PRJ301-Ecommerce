/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package socket;

/**
 *
 * @author Admin
 */
public class WSRequest {
    private String action;
    private int userId;

    public WSRequest() {
    }

    public WSRequest(String action, int userId) {
        this.action = action;
        this.userId = userId;
    }

   
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    @Override
    public String toString() {
        return "WSRequest{" + "userId=" + userId + ", action=" + action + '}';
    }
    
}
