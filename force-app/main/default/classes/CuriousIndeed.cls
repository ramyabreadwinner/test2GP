@NamespaceAccessible
public with sharing class CuriousIndeed {
    @NamespaceAccessible
    public static Integer minimumMad = 1;

    @NamespaceAccessible
    public static Integer getMadOrMadder (Integer isMad) {

        // They didn't specify, let's set the default.
        if (isMad == null) {
            isMad = 0;
        }

        // The goal here is to make them more mad on the way out.
        isMad++;

        // return our defined minimum
        return (minimumMad > isMad) ? minimumMad : isMad;
    }
}