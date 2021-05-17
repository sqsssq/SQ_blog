package entity;

public class messageBoard {
    private long id;
    private String messageTime;
    private long userID;
    private String information;

    public long getId() {   
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(String messageTime) {
        this.messageTime = messageTime;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }
}
