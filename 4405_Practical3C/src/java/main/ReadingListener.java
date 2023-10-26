package main;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.AsyncContext;
import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;

public class ReadingListener implements ReadListener {
    private ServletInputStream inputStream = null;
    private AsyncContext context = null;
    
    public ReadingListener (ServletInputStream in, AsyncContext ac) {
        this.inputStream = in;
        this.context = ac;
    }
    
    @Override
    public void onDataAvailable() {
        try {
            StringBuilder stringBuilder = new StringBuilder();
            int len = -1;
            byte bytes[] = new byte[1024];
            while (inputStream.isReady() && (len = inputStream.read(bytes)) != -1) {
                String data = new String(bytes, 0, len);
            }
        } catch (IOException ex) {
            Logger.getLogger(ReadingListener.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public void onAllDataRead() {
        System.out.println("Invoked onAllDataRead()");
        context.complete();
    }
    
    @Override
    public void onError(Throwable t) {
        context.complete();
    }
}
