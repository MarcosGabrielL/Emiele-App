package Bean;

import org.json.JSONException;
import org.json.JSONObject;

public class AuthRequestRegister {

    private String email;
    private String password;

    public AuthRequestRegister(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public AuthRequestRegister() {
        super();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String toJSON(){

        JSONObject jsonObject= new JSONObject();
        try {
            jsonObject.put("password", getPassword());
            jsonObject.put("email", getEmail());

            return jsonObject.toString();
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "";
        }

    }
}
