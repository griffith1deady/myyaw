export type VisualConf = {
    enableVisual: boolean
}

export type Configuration = {
    visual: VisualConf,
}

export interface WindowIface extends Window {
    configuration: Configuration
    closeOverlay: () => boolean
}