/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dal.ReviewDAO;
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
import models.Review;
import socket.WSRequest;

/**
 *
 * @author Admin
 */
@ServerEndpoint("/notification")
public class NotificationEndpoint {

    static Set<Session> users = Collections.synchronizedSet(new HashSet<>());

    @OnOpen
    public void handleOpen(Session session) {
        users.add(session);
    }

    @OnMessage
    public void handleMessage(String message, Session session) throws IOException {
        Gson gson = new Gson();
        WSRequest wsr = gson.fromJson(message, WSRequest.class);
        ReviewDAO rDAO = new ReviewDAO();
        System.out.println("message: " + message);
        System.out.println(wsr);
        if (wsr.getAction().equals("review-toast")) {
            String commentToast = gson.toJson(rDAO.getReviewByUserId(wsr.getUserId()));
            for (Session s : users) {
                s.getBasicRemote().sendText(commentToast);
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
