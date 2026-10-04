import { useState, useEffect } from 'react'
import { Button } from '../ui/button'
import { BrandGithub } from 'tabler-icons-react'

export function AboutTab() {
  const [appVersion, setAppVersion] = useState('...')

  useEffect(() => {
    window.electronAPI.getVersion().then((version) => {
      setAppVersion(version)
    })
  }, [])

  const openLink = (url: string) => {
    window.electronAPI.openExternal(url)
  }

  return (
    <div className="p-8 text-center flex flex-col items-center justify-center h-full">
      <img src="media://lume-appicon.png" alt="Lume Logo" className="w-24 h-24 mb-4 rounded-3xl shadow-lg" />
      <h2 className="text-2xl font-bold text-foreground">Lume</h2>
      <p className="text-sm text-muted-foreground mb-6">Version {appVersion}</p>

      <div className="text-sm text-foreground space-y-2">
        <p>Created with ❤️ by GLYSATVIK.</p>
        <p>Autozoom for effortless tutorials — record, edit, and export with cinematic flair.</p>
      </div>

      <div className="mt-8 flex items-center gap-4">
        <Button variant="secondary" onClick={() => openLink('https://github.com/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials.')}>
          <BrandGithub className="w-4 h-4 mr-2" />
          GitHub Repository
        </Button>
      </div>

      <p className="absolute bottom-4 text-xs text-muted-foreground">Built with Electron, React, and TypeScript.</p>
    </div>
  )
}
