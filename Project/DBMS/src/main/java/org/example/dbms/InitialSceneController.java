package org.example.dbms;

import javafx.fxml.FXML;

public class InitialSceneController {

    @FXML
    public void goToLogin() {
        SceneNavigator.loadScene(SceneNavigator.LOGIN_SCENE);
    }

    @FXML
    public void goToSignUp() {
        SceneNavigator.loadScene(SceneNavigator.SIGN_UP_SCENE);
    }
}
