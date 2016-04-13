package model;

/**
 * Created by admin on 12/04/2016.
 */
public class Card {
    double card;
    int cvv, pid;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    String user_type, email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCvv() {
        return cvv;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }

    public double getCard() {
        return card;
    }

    public void setCard(double card) {
        this.card = card;
    }
}
