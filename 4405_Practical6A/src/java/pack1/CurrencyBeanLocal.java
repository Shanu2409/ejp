package pack1;

import javax.ejb.Local;

@Local
public interface CurrencyBeanLocal {
    public double inrToDlr(double inr);
    public double dlrToInr(double dlr);
}
