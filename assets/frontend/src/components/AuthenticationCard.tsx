import { SiFirebase } from '@icons-pack/react-simple-icons'
import { Divider, HStack, Stack } from 'styled-system/jsx'
import { Button } from '../parkui/ui/button'
import { Card } from '../parkui/ui/card'
import { Field } from '../parkui/ui/field'
import { Text } from '../parkui/ui/text'
import { AuthenticationType } from '../types'

const authenticationProviders = [
    {
        name: 'AlternativeWorld',
        type: AuthenticationType.AlternativeWorld,
        image: 'favicon.ico',
        key: "alternativeworld",
    },
    {
        name: 'Вход по логину',
        type: AuthenticationType.Internal,
        icon: <SiFirebase key={"firebase"} width={20} height={20} />,
    },
]

export type AuthenticationCardProps = {
    onAuthenticationTypeChange: (type: AuthenticationType) => void
}

export default function AuthentificationCard({ onAuthenticationTypeChange }: AuthenticationCardProps) {
    const authenticationProviderComponent = authenticationProviders.map((provider, index) => (
        <Button variant="outline" width="full" key={index} children={[
            provider.image && (
                <img 
                    src={provider.image} 
                    loading="lazy" 
                    width="20" 
                    height="20" 
                    alt={provider.name} 
                    key={provider.key}
                    style={{ marginTop: '2px' }} 
                />
            ),
            provider.icon || undefined,
            provider.name,
        ]}
        
        onClick={() => onAuthenticationTypeChange(provider.type)}
        />
    ))

  return (<Card.Root maxW="md">
    <Card.Header>
        <Card.Title>Авторизация</Card.Title>
        <Card.Description>
            Создайте аккаунт или авторизуйтесь для управления встроенной файловой системой.
        </Card.Description>
    </Card.Header>
    <Card.Body>
        <Stack gap="2">
            <Stack direction="row" gap="2">
                {authenticationProviderComponent}
            </Stack>
            <HStack gap="2">
                <Divider />
                <Text color="fg.subtle" size="sm" whiteSpace="nowrap">
                    Или зарегистрируйтесь с помощью
                </Text>
                <Divider />
            </HStack>
            <Field.Root>
                <Field.Label>Ваш логин</Field.Label>
                <Field.Input type="username" placeholder="Ваш логин" />
            </Field.Root>
            <Field.Root>
                <Field.Label>Ваш пароль</Field.Label>
                <Field.Input type="password" placeholder="Ваш пароль" />
            </Field.Root>
        </Stack>
    </Card.Body>
    <Card.Footer>
        <Button width="full">Создать аккаунт</Button>
    </Card.Footer>
</Card.Root>)
}