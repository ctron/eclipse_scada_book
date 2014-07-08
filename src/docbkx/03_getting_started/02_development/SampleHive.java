package org.eclipse.scada.examples.modbus.exporter;

import org.eclipse.scada.da.server.browser.common.FolderCommon;
import org.eclipse.scada.da.server.common.MemoryDataItem;
import org.eclipse.scada.da.server.common.ValidationStrategy;
import org.eclipse.scada.da.server.common.impl.HiveCommon;

public class SampleHive extends HiveCommon
{
    private FolderCommon rootFolder;

    public SampleHive ()
    {
        setValidatonStrategy ( ValidationStrategy.FULL_CHECK );

        setRootFolder ( this.rootFolder = new FolderCommon () );
    }

    @Override
    protected void performStart () throws Exception
    {
        super.performStart ();

        MemoryDataItem mem1;
        registerItem ( mem1 = new MemoryDataItem ( "mem1" ) );
        this.rootFolder.add ( "mem1", mem1, null );
    }

    @Override
    public String getHiveId ()
    {
        return SampleHive.class.getName ();
    }

}