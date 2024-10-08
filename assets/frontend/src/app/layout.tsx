import type { Metadata } from 'next'
import type { PropsWithChildren } from 'react'
import '~/app/global.css'

export const metadata: Metadata = {
  title: 'Create Next App',
  description: 'Generated by create next app',
}

const RootLayout = (props: PropsWithChildren) => {
  const { children } = props
  return (
    <html lang="en" className='dark'>
      <body style={{ backgroundColor: "rgba(0, 0, 0, 0)" }}>{children}</body>
    </html>
  )
}

export default RootLayout
