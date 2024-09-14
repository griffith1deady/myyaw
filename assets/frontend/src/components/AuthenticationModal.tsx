"use client"
import { XIcon } from "lucide-react"
import { useRouter } from "next/navigation"
import { Divider, HStack, Stack, VStack } from "styled-system/jsx"
import { Button } from "~/parkui/ui/button"
import { Dialog } from "~/parkui/ui/dialog"
import { Field } from "~/parkui/ui/field"
import { IconButton } from "~/parkui/ui/icon-button"
import { Text } from '~/parkui/ui/text'


export enum AuthenticationType {
    AlternativeWorld,
    Internal,
    None,
}

export type AuthenticationModalProps = {
    type: AuthenticationType
    onClose: () => void
}

export function AuthenticationModal({ type, onClose }: AuthenticationModalProps) {
    const router = useRouter()
    const authenticate = async (login: string, password: string) => {
        const request = await fetch("/api/authenticate", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "authentication-provider": type === AuthenticationType.AlternativeWorld ? "alternativeworld" : type === AuthenticationType.Internal ? "internal" : "unknown",
            },
            body: JSON.stringify({
                login,
                password,
            }),
        })
        const response = await request.json()
        if (response.success) {
            router.push("/preview")
        }
    }
    return (
        <Dialog.Root open={type !== AuthenticationType.None} onOpenChange={onClose}>
            <Dialog.Backdrop />
            <Dialog.Positioner>
                <Dialog.Content>
                    <Stack gap="8" p="6">
                        <Stack gap="1">
                            <Dialog.Title>
                                <VStack gap="1">
                                    <text>Авторизация</text>
                                    <h1> {type === AuthenticationType.AlternativeWorld ? "AlternativeWorld" : type === AuthenticationType.Internal ? "Внутренний сервер" : "Неизвестный сервер"} </h1>
                                </VStack>
                            </Dialog.Title>
                            <Dialog.Description>
                                <HStack gap="2">
                                    <Divider />
                                    <Text color="fg.subtle" size="sm" whiteSpace="nowrap">
                                        Вход в систему внутренней файловой системы
                                    </Text>
                                    <Divider />
                                </HStack>
                            </Dialog.Description>
                            <Field.Root>
                                <Field.Label>Ваш логин</Field.Label>
                                <Field.Input type="username" placeholder="Ваш логин" />
                            </Field.Root>
                            <Field.Root>
                                <Field.Label>Ваш пароль</Field.Label>
                                <Field.Input type="password" placeholder="Ваш пароль" />
                            </Field.Root>
                        </Stack>
                        <Stack gap="3" direction="row" width="full">
                            <Dialog.CloseTrigger asChild>
                                <Button variant="outline" width="full">
                                Отмена
                                </Button>
                            </Dialog.CloseTrigger>
                            <Button width="full" 
                                onClick={() => authenticate("login", "password")}
                            >Войти</Button>
                        </Stack>
                    </Stack>
                <Dialog.CloseTrigger asChild position="absolute" top="2" right="2">
                    <IconButton aria-label="Close Dialog" variant="ghost" size="sm">
                        <XIcon />
                    </IconButton>
                </Dialog.CloseTrigger>
                </Dialog.Content>
            </Dialog.Positioner>
        </Dialog.Root>
    )
}