import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;

class hasA implements StringChecker {
  public boolean checkString(String s) {
    return s.contains("a");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }

  @Test
  public void testMergeRightEnd2() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }

  @Test
  public void testFilter1() {
    List<String> str = Arrays.asList("a", "b", "c", "ahoo");
    List<String> output = ListExamples.filter(str, new hasA());
    List<String> expected = Arrays.asList("a", "ahoo");
    assertEquals(expected, output);
  }
}


