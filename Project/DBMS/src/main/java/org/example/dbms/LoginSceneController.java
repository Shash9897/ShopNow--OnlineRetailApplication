package org.example.dbms;

import javafx.fxml.FXML;

public class LoginSceneController {


    @FXML
    public void login() {
        // Implement login logic
    }

    @FXML
    public void backToInitial() {
        SceneNavigator.loadScene(SceneNavigator.INITIAL_SCENE);
    }
}
