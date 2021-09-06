package conduitApp;
 
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import static org.junit.Assert.*;
import org.junit.jupiter.api.Test;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.KarateOptions;

class ConduitTest 
{
    @Karate.Test
    Karate testSample() {
        return Karate.run("feature/HomePage").relativeTo(getClass());
    }  
}
