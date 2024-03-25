module org.example.dbms {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;


    opens org.example.dbms to javafx.fxml;
    exports org.example.dbms;
}