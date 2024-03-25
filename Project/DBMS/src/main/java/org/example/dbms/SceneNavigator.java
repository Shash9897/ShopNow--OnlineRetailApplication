package org.example.dbms;

import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

public class SceneNavigator {

    public static final String INITIAL_SCENE = "initialScene.fxml";
    public static final String LOGIN_SCENE = "loginScene.fxml";
    public static final String SIGN_UP_SCENE = "signUpScene.fxml";

    private static final Map<String, String> sceneMap = new HashMap<>();
    private static Stage stage;
    private static Class<Object> getclass;
    private static String currentScene;

    public static void setStage(Stage primaryStage) {
        stage = primaryStage;
    }

    public static void loadScene(String sceneName) {
        try {
            if (!sceneMap.containsKey(sceneName)) {
                sceneMap.put(sceneName, sceneName);
            }

            Parent root = FXMLLoader.load(Objects.requireNonNull(SceneNavigator.class.getResource(sceneName)));
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.show();
            currentScene = sceneName; // Update current scene
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getCurrentScene() {
        return currentScene;
    }

}
