"use client"
import { XIcon } from 'lucide-react'
import { Container, Center, VStack, HStack } from 'styled-system/jsx'
import { Card } from '~/parkui/ui/card'
import { IconButton } from '~/parkui/ui/icon-button'
import { Splitter } from '~/parkui/ui/splitter'
import { Tabs } from '~/parkui/ui/tabs'
import { Text } from '~/parkui/ui/text'
import { WindowIface, Configuration } from '~/types'

export default function Home() {
    return (
        <Container 
            py={{ base: '16', md: '24' }} 
            display="flex" 
            justifyContent="center" 
            alignItems="center" 
            height="100vh"
        >
            <Center>
                <Card.Root width="2xl" height="600px">
                    <Card.Header>
                        <HStack width='full' justifyContent="space-between">
                            <Card.Title>myyaw</Card.Title>
                            <IconButton 
                                aria-label="Close Dialog" variant="ghost" size="sm"
                                onClick={() => {
                                    const windowCtx = (window as any) as WindowIface
                                    console.log(windowCtx.configuration)
                                    console.log(windowCtx.closeOverlay())
                                }}
                            >
                                <XIcon />
                            </IconButton>
                        </HStack>
                    </Card.Header>
                    <Card.Body>
                    <Tabs.Root defaultValue="visual" variant="enclosed">
                        <Tabs.List>
                            <Tabs.Trigger value={"visual"}>
                                {"Visual"}
                            </Tabs.Trigger>
                            <Tabs.Trigger value={"battle"}>
                                {"Battle"}
                            </Tabs.Trigger>
                            <Tabs.Indicator />
                        </Tabs.List>
                        <Tabs.Content value="visual">Know React? Check out Solid!</Tabs.Content>
                        <Tabs.Content value="battle">Know React? Suck dick!</Tabs.Content>
                    </Tabs.Root>
                    </Card.Body>
                </Card.Root>
            </Center>
        </Container>
    )
}
