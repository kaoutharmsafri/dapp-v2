// src/components/Home.tsx
// import './App.css'
import '@mantine/core/styles.css';
import { Title, Text } from '@mantine/core';
// import React from 'react';
import { WalletConnect } from '../components/WalletConnect';
import { Goerli, useEthers } from '@usedapp/core';

export function Home() {
  const { account, chainId } = useEthers();

  return (
    <>
      <center>
        <Title>Welcome !</Title>
        <Text>Hello</Text>
      </center>
      <WalletConnect />
      <div>
        <h1>
          {account && chainId === Goerli.chainId && (
            <>
              <center>
                <Text>Your Account is:{account}</Text>
              </center>
            </>
          )}
        </h1>
      </div>
    </>
  );

};

