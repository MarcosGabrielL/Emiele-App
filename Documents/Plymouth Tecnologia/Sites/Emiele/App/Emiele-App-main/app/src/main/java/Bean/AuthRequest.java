package Bean;

import org.json.JSONException;
import org.json.JSONObject;

public class AuthRequest {

    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String tipo;

    public AuthRequest(String email, String password, String firstName, String lastName, String tipo) {
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.tipo = tipo;
    }

    public AuthRequest() {
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

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String toJSON(){

        JSONObject jsonObject= new JSONObject();
        try {
            jsonObject.put("password", getPassword());
            jsonObject.put("email", getEmail());
            jsonObject.put("lastName", getLastName());
            jsonObject.put("firstName", getFirstName());
            jsonObject.put("tipo", getTipo());
            return jsonObject.toString();
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "";
        }

    }
}
