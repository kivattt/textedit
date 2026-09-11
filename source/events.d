module events;

// TODO: move from std.concurrency to custom eventqueue

// Keycode numbers:
//     Linux: read() syscall
//     Windows: ReadConsoleInputW()
enum EditorKey : int
{
    BACKSPACE = 127,

    // Input sequences escaped with \x1b
    DELETE = 1000, // Arbitrary number beyond the range of char
    HOME,
    END,
    CTRL_HOME,
    CTRL_END,

    ARROW_LEFT,
    ARROW_RIGHT,
    ARROW_UP,
    ARROW_DOWN,
    CTRL_ARROW_LEFT,
    CTRL_ARROW_RIGHT,
    CTRL_ARROW_UP,
    CTRL_ARROW_DOWN,
}

EditorKey CTRL_KEY(char k)() {
    return cast(EditorKey)(k & 0x1f);
}

struct KeyEvent {
    EditorKey key;
}

struct ResizeEvent {
    size_t newWidth;
    size_t newHeight;
}
