if ( item.getName () ==  "ES.DEMO.ARDUINO001.LUX.V" )
{
  MODBUS.doExport ( 1502, 1, 0, MODBUS.DOUBLE.scaled ( 0.1 ) );
}
