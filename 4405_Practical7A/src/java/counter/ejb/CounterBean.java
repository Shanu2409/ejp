package counter.ejb;
import javax.ejb.Singleton;
@Singleton
public class CounterBean {
private int hits = 1;
// Increment and return the number of hits
public int getHits() {
return hits++;
}
}