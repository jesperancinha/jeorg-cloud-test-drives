plugins {
    kotlin("jvm") version "1.9.21"
}

group = "org.jesperancinha"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    // retrofit
    implementation("com.squareup.retrofit2:retrofit:2.1.0")
    implementation("com.squareup.retrofit2:converter-gson:2.1.0")
    implementation("com.squareup.okhttp3:okhttp-coroutines:5.0.0-alpha.12")

// Junit
    testImplementation("org.junit.jupiter:junit-jupiter-api:5.0.0")
    testImplementation("org.junit.jupiter:junit-jupiter-engine:5.0.0")
// to run JUnit 3/4 tests:
    testImplementation("junit:junit:4.12")
    testImplementation("org.junit.vintage:junit-vintage-engine:4.12.0")
    testImplementation("org.jetbrains.kotlin:kotlin-test")
}

tasks.test {
    useJUnitPlatform()
}
kotlin {
    jvmToolchain(21)
}