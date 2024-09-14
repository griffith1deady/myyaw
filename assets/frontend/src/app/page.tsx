"use client"
import { Container, Center } from 'styled-system/jsx'
import AuthenticationCard from '../components/AuthenticationCard'
import { AuthenticationModal, AuthenticationType } from '../components/AuthenticationModal'
import { useState } from 'react'

export default function Home() {
    const [currentAuthenticationType, setAuthenticationType] = useState<AuthenticationType>(AuthenticationType.None)
    return (
        <Container 
            py={{ base: '16', md: '24' }} 
            display="flex" 
            justifyContent="center" 
            alignItems="center" 
            height="100vh"
        >
            <AuthenticationModal type={currentAuthenticationType} onClose={() => setAuthenticationType(AuthenticationType.None)} />
            <Center>
                <AuthenticationCard onAuthenticationTypeChange={setAuthenticationType} />
            </Center>
        </Container>
    )
}
