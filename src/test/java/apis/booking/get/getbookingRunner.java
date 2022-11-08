package apis.booking.get;

import com.intuit.karate.junit5.Karate;

class getbookingRunner {

    @Karate.Test
    Karate testGetBooking() {
        return Karate.run("getbooking").relativeTo(getClass());
    }
}
