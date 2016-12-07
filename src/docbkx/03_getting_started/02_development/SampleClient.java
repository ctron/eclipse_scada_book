package org.eclipse.neoscada.sample;
 
import java.util.Observable;
import java.util.Observer;
 
import org.eclipse.scada.core.ConnectionInformation;
import org.eclipse.scada.core.client.AutoReconnectController;
import org.eclipse.scada.core.client.ConnectionFactory;
import org.eclipse.scada.core.client.ConnectionState;
import org.eclipse.scada.core.client.ConnectionStateListener;
import org.eclipse.scada.da.client.Connection;
import org.eclipse.scada.da.client.DataItem;
import org.eclipse.scada.da.client.DataItemValue;
import org.eclipse.scada.da.client.ItemManagerImpl;
 
public class SampleClient {
 
  public static void main(String[] args) throws InterruptedException {
    // the ConnectionFactory works a bit like JDBC,
    // every implementation registers itself when its loaded
    // alternatively it is also possible to use the connection
    // directly, but that would mean the code would have to be aware
    // which protocol is used, which is not desirable
    try {
      Class.forName("org.eclipse.scada.da.client.ngp.ConnectionImpl");
    } catch (ClassNotFoundException e) {
      System.err.println(e.getMessage());
      System.exit(1);
    }
 
    final String uri = "da:ngp://localhost:2102";
 
    final ConnectionInformation ci = ConnectionInformation.fromURI(uri);
 
    final Connection connection = (Connection) ConnectionFactory.create(ci);
    if (connection == null) {
      System.err.println("Unable to find a connection driver for specified URI");
      System.exit(1);
    }
 
    // just print the current connection state
    connection.addConnectionStateListener(new ConnectionStateListener() {
      @Override
      public void stateChange(org.eclipse.scada.core.client.Connection connection, ConnectionState state, Throwable error) {
        System.out.println("Connection state is now: " + state);
      }
    });
 
    // although it is possible to use the plain connection, the
    // AutoReconnectController automatically connects to the server
    // again if the connection is lost
    final AutoReconnectController controller = new AutoReconnectController(connection);
    controller.connect();
 
    // although it is possible to subscribe to an item directly,
    // the recommended way is to use the ItemManager, which handles the
    // subscriptions automatically
    final ItemManagerImpl itemManager = new ItemManagerImpl(connection);
 
    final DataItem dataItem = new DataItem("memory-cell-0", itemManager);
    dataItem.addObserver(new Observer() {
      @Override
      public void update(final Observable observable, final Object update) {
        final DataItemValue div = (DataItemValue) update;
        System.out.println(div);
      }
    });
  }
}