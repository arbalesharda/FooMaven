import org.junit.Test;
import static org.junit.jupiter.api.Assertions.*;

public class BarTest{
    @Test
    public void TestBaz() {
        Bar bar= new Bar();
        assertTrue(bar.baz());
    }
}
