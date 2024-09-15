"use client"
import { XIcon } from 'lucide-react'
import { Container, Center, VStack, HStack } from 'styled-system/jsx'
import { Card } from '~/parkui/ui/card'
import { IconButton } from '~/parkui/ui/icon-button'
import { Splitter } from '~/parkui/ui/splitter'
import { Text } from '~/parkui/ui/text'

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
                            <IconButton aria-label="Close Dialog" variant="ghost" size="sm">
                                <XIcon />
                            </IconButton>
                        </HStack>
                    </Card.Header>
                    <Card.Body>
                    <Splitter.Root
                        size={[
                            { id: 'sidebar', size: 30 },
                            { id: 'rootView', size: 70 },
                        ]}
                    >
                        <Splitter.Panel id="sidebar">
                            <Card.Root width="full" height="full">
                                <Card.Header>
                                    <Card.Title>Navigation</Card.Title>
                                </Card.Header>
                                <Card.Body>
                                    <Text>A</Text>
                                </Card.Body>
                            </Card.Root>
                        </Splitter.Panel>
                        <Splitter.ResizeTrigger id="sidebar:rootView" />
                        <Splitter.Panel id="rootView">B</Splitter.Panel>
                    </Splitter.Root>
                    </Card.Body>
                </Card.Root>
            </Center>
        </Container>
    )
}
