package org.example.dbms;

import javafx.fxml.FXML;
import javafx.scene.control.Button;

public class SignUpSceneController {

    @FXML
    private Button sign_UP_button;

    @FXML
    public void signUp() {
        // Implement sign-up logic
    }

    @FXML
    public void backToInitial() {
        SceneNavigator.loadScene(SceneNavigator.INITIAL_SCENE);
    }
}
