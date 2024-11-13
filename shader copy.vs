precision mediump float;
    varying vec2 v_position;
    uniform float u_time;

    float random(vec2 st) {
        return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
    }

    void main() {
        float time = mod(u_time, 1.0) / 10.0;
        vec4 color = vec4(0, 0, 0, 0.5);  // Set alpha to 0.5 for partial transparency

        float x = floor(v_position.x * 64.0 * 3.0);
        float y = floor(v_position.y * 48.0 * 3.0);
        float randValue = random(vec2(x + time * 10.0, y + time * 10.0));

        if (randValue < 0.2) {
            color = vec4(1, 1, 1, 0.5); // Adjust alpha here as well
        }

        gl_FragColor = color;
    }