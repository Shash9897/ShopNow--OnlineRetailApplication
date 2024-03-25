package org.example.dbms;

import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class SceneNavigator {

    public static final String INITIAL_SCENE = "initialScene.fxml";
    public static final String LOGIN_SCENE = "loginScene.fxml";
    public static final String SIGN_UP_SCENE = "signUpScene.fxml";

    private static final Map<String, String> sceneMap = new HashMap<>();
    private static Stage stage;

    public static void setStage(Stage primaryStage) {
        stage = primaryStage;
    }

    public static void loadScene(String sceneName) {
        try {
            if (!sceneMap.containsKey(sceneName)) {
                sceneMap.put(sceneName, sceneName);
            }

            Parent root = FXMLLoader.load(SceneNavigator.class.getResource(sceneName));
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
