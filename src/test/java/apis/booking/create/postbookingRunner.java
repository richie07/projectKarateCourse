package apis.booking.create;

import com.intuit.karate.junit5.Karate;

class postbookingRunner {

    @Karate.Test
    Karate testGetBooking() {
        return Karate.run("postbooking").tags("@regresion").relativeTo(getClass());
    }
}
