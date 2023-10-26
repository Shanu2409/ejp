package pack1;

import javax.ejb.Stateless;

@Stateless
public class CurrencyBean implements CurrencyBeanLocal {
    public double inrToDlr(double inr)
    {
        return inr / 82.56;
    }
    public double dlrToInr(double dlr)
    {
        return dlr * 82.56;
    }
}
