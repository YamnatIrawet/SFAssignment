public class CustomAuraExceptionData {
	public String name;
    public String message;
    public Integer code;
    
  /*  public CustomAuraExceptionData(String name, String message, Integer code) {
        this.name = name;
        this.message = message;
        this.code = code;
    }*/
    public String CAEfill(String name, String message, Integer code) {
        this.name = name;
        this.message = message;
        this.code = code;
        return 'This is Error result example';
    }
}