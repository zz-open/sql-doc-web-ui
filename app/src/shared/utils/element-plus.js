export const openFullScreen = (text = "Loading") => {
    return ElLoading.service({
        lock: true,
        text: text,
        background: 'rgba(0, 0, 0, 0.7)',
    })
}