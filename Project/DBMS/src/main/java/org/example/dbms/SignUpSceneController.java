package org.example.dbms;

import javafx.fxml.FXML;

public class SignUpSceneController {

    @FXML
    public void signUp() {
        // Implement sign-up logic
    }

    @FXML
    public void backToInitial() {
        SceneNavigator.loadScene(SceneNavigator.INITIAL_SCENE);
    }
}
