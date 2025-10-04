# blood_pressure_monitor.jac
# Jac Blood Pressure Calculator

obj BloodPressure {
    has systolic: int,
        diastolic: int,
        category: str;
}

walker bp_check(systolic: int, diastolic: int) -> BloodPressure {
    bp = spawn BloodPressure;

    bp.systolic = systolic;
    bp.diastolic = diastolic;

    if (systolic < 120 and diastolic < 80) {
        bp.category = "Normal";
    } elif (120 <= systolic < 130 and diastolic < 80) {
        bp.category = "Elevated";
    } elif ((130 <= systolic < 140) or (80 <= diastolic < 90)) {
        bp.category = "Hypertension Stage 1";
    } elif ((140 <= systolic <= 180) or (90 <= diastolic <= 120)) {
        bp.category = "Hypertension Stage 2";
    } elif (systolic > 180 or diastolic > 120) {
        bp.category = "Hypertensive Crisis 🚨 (Seek emergency care)";
    } else {
        bp.category = "Unclassified (Check input)";
    }

    return bp;
}

with entry {
    std.out("=== Blood Pressure Monitor ===");
    bp1 = bp_check(128, 82); # Example input
    std.out("Systolic: " + str(bp1.systolic));
    std.out("Diastolic: " + str(bp1.diastolic));
    std.out("Category: " + bp1.category);
}
