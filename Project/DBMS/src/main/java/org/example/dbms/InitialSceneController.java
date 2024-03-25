package org.example.dbms;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;

import java.net.URL;
import java.util.ResourceBundle;

public class InitialSceneController {
    @FXML
    private Button Initial_Login;

    @FXML
    private Button Initial_SignUp;

    public InitialSceneController() {
    }

    @FXML
    public void goToLogin() {
        SceneNavigator.loadScene(SceneNavigator.LOGIN_SCENE);
    }

    @FXML
    public void goToSignUp() {
        SceneNavigator.loadScene(SceneNavigator.SIGN_UP_SCENE);
    }

}
