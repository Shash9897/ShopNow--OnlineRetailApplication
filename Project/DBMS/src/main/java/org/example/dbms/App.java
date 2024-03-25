package org.example.dbms;

import javafx.application.Application;
import javafx.stage.Stage;

public class App extends Application {

    @Override
    public void start(Stage primaryStage) {
        SceneNavigator.setStage(primaryStage);
        SceneNavigator.loadScene(SceneNavigator.INITIAL_SCENE);
    }

    public static void main(String[] args) {
        launch(args);
    }
}
