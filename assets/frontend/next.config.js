// @ts-check
 
/** @type {import('next').NextConfig} */
const nextConfig = {
    output: "export",
    distDir: process.env.NODE_ENV === "development" ? "dist" : "../dist",
}
   
module.exports = nextConfig