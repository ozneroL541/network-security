import static spark.Spark.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class App {
    /** Logger instance */
    private static final Logger logger = LogManager.getLogger(App.class);

    String[] users = {"admin", "Alice", "Bob", "Charlie", "Dave", "Eve"};

    public static void main(String[] args) {
        /* Port */
        port(80);
        /* Route */
        get("/", (req, res) -> {
            boolean validUser = false;
            String userAgent = req.headers("User-Agent");
            if (userAgent == null) {
                userAgent = "Unknown";
            }
            // 🔥 VULNERABLE LINE
            logger.error("User-Agent: " + userAgent);
            
            for (String user : new App().users) {
                if (user.equals(req.queryParams("user"))) {
                    validUser = true;
                    break;
                }
            }
            if (validUser) {
                return "Welcome, " + req.queryParams("user") + "!";
            } else {
                return "Invalid user.";
            }
        });
    }
}
