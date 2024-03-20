export const ENV = "dev"

export const isDev = () => {
    return ENV === "dev"
}

export const isProd = () => {
    return ENV === "prod"
}