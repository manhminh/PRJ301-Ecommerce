/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author Admin
 */
@ServerEndpoint(value = "/product-quantity")
public class ProductEndpoint {

    static Set<Session> users = Collections.synchronizedSet(new HashSet<>());

    @OnOpen
    public void handleOpen(Session session) {
        users.add(session);
    }

    @OnMessage
    public void handleMessage(String message, Session userSession) throws IOException {
        System.out.println("message: " + message);
        String username = (String) userSession.getUserProperties().get("username");
        if (username == null) {
            userSession.getUserProperties().put("username", message);
            userSession.getBasicRemote().sendText("System: you are connectd as " + message);
        } else {
            for (Session session : users) {
                session.getBasicRemote().sendText(username + ": " + message);
            }
        }
    }

    @OnClose
    public void handleClose(Session session) {
        users.remove(session);
    }

    @OnError
    public void handleError(Throwable t) {
    }
}
