// A namespace-visible Apex class
@namespaceAccessible
public class testApexClass1 {
    private Boolean bypassFLS;
    // A namespace-visible constructor that only allows secure use
    @namespaceAccessible
    public testApexClass1() {
        bypassFLS = false;
    }
    // A package private constructor that allows use in trusted contexts,
    // but only internal to the package
    public testApexClass1(Boolean bypassFLS) {
        this.bypassFLS = bypassFLS;
    }
}