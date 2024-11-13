precision mediump float;
varying vec2 v_position;
uniform float u_time;

void main() {
    // Define bar width, speed, and set a fixed number of bars
    float barWidth = 0.03;    // Adjust bar width as a fraction of canvas width
    float speed = 5.0;      // Speed of the bars moving to the right
    const int numBars = 5;   // Fixed number of bars (constant)

    // Initialize the color to white for the background
    vec4 color = vec4(1.0);

    // Loop to create multiple moving bars
    for (int i = 0; i < numBars; i++) {
        // Calculate the x position for each bar, offset by i to space them out
        float xPos = mod(u_time * speed + float(i) * 0.4, 2.0) * 1.3 - 1.5;

        // Check if the current fragment is within the bounds of the bar
        if (v_position.x > xPos && v_position.x < xPos + barWidth) {
            color = vec4(0.0, 0.0, 0.0, 1.0); // Black color for each bar
        }
    }

    gl_FragColor = color;
}