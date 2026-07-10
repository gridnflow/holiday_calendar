package com.gridnflow.feiertage.kalender

import org.junit.Assert.assertEquals
import org.junit.Test
import java.time.LocalDate

/**
 * Unit tests for the widget's D-day countdown.
 *
 * These pin down the fix for the "D-day never decreases" bug: the widget must
 * recompute the day count from the stored holiday DATE against today on every
 * update, instead of showing the frozen number the app last wrote.
 */
class HolidayWidgetTest {

    @Test
    fun `recomputes countdown from iso date against today`() {
        // Holiday 2026-08-15, today 2026-07-10 -> 36 days.
        val text = HolidayWidget.daysText(
            isoDate = "2026-08-15",
            fallbackDays = 999L, // deliberately wrong: proves ISO wins over fallback
            today = LocalDate.of(2026, 7, 10),
        )
        assertEquals("in 36T", text)
    }

    @Test
    fun `countdown decreases as today advances`() {
        // THE BUG: same stored data (fallbackDays stays 36), later day -> the
        // widget must show a SMALLER number, not the frozen 36.
        val iso = "2026-08-15"
        assertEquals("in 36T", HolidayWidget.daysText(iso, 36L, LocalDate.of(2026, 7, 10)))
        assertEquals("in 26T", HolidayWidget.daysText(iso, 36L, LocalDate.of(2026, 7, 20)))
        assertEquals("in 5T", HolidayWidget.daysText(iso, 36L, LocalDate.of(2026, 8, 10)))
    }

    @Test
    fun `shows Heute on the holiday itself`() {
        assertEquals(
            "Heute!",
            HolidayWidget.daysText("2026-08-15", 36L, LocalDate.of(2026, 8, 15)),
        )
    }

    @Test
    fun `shows Morgen the day before`() {
        assertEquals(
            "Morgen",
            HolidayWidget.daysText("2026-08-15", 36L, LocalDate.of(2026, 8, 14)),
        )
    }

    @Test
    fun `shows dash after the holiday has passed`() {
        // Past date -> negative -> placeholder, not a stale positive number.
        assertEquals(
            "—",
            HolidayWidget.daysText("2026-08-15", 36L, LocalDate.of(2026, 8, 16)),
        )
    }

    @Test
    fun `falls back to stored days when iso is missing`() {
        // Older app version wrote no ISO date -> use the last stored number.
        assertEquals(
            "in 7T",
            HolidayWidget.daysText("", 7L, LocalDate.of(2026, 7, 10)),
        )
    }

    @Test
    fun `falls back to stored days when iso is unparseable`() {
        assertEquals(
            "in 3T",
            HolidayWidget.daysText("not-a-date", 3L, LocalDate.of(2026, 7, 10)),
        )
    }
}
