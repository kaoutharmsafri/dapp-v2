import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './index.css'
import { DAppProvider, Config, Goerli } from '@usedapp/core'
import { MantineProvider } from '@mantine/core'
import { getDefaultProvider } from 'ethers'
import '@mantine/core/styles.css';

export const config: Config = {
  readOnlyChainId: Goerli.chainId,
  readOnlyUrls: {
    [Goerli.chainId]: "https://goerli.infura.io/v3/b2a286047e4e4075834d46be94103b4d",
    [Goerli.chainId]: getDefaultProvider('goerli'),
  },
  gasLimitBufferPercentage: 10,
}

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <DAppProvider config={config}>
      <MantineProvider >

        <App />
      </MantineProvider>
    </DAppProvider>
  </React.StrictMode>
)