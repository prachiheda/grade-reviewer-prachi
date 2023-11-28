import static org.junit.Assert.*;
import org.junit.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

class MyStringChecker implements StringChecker{
    public boolean checkString(String s){
        if (s.length() > 4){
            return true; 
        }
        return false; 
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
	public void testfilter() {
    List<String> input = new ArrayList<>();
        input.add("apple");
        input.add("banana");
        input.add("cherry");
        input.add("date");
    List<String> expectedOutput = new ArrayList<>();
        expectedOutput.add("apple");
        expectedOutput.add("banana");
        expectedOutput.add("cherry");
    StringChecker sc = new MyStringChecker();
    List<String> actualOutput = ListExamples.filter(input,sc);
    assertEquals(expectedOutput, actualOutput);
	}

    @Test 
    public void testmerge() {
        List<String> list1 = new ArrayList<>();
        list1.add("apple");
        list1.add("cherry");
        List<String> list2 = new ArrayList<>();
        list2.add("banana");
        list2.add("date");
        List<String> expectedOutput = new ArrayList<>();
        expectedOutput.add("apple");
        expectedOutput.add("banana");
        expectedOutput.add("cherry");
        expectedOutput.add("date");
        List<String> actualOutput = ListExamples.merge(list1, list2);
        assertEquals(expectedOutput, actualOutput);

    }
}
