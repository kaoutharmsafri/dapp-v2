// import React from "react";
import { Goerli, useEthers } from '@usedapp/core';
import { MintingNFT } from '../components/MintingNFT';
import { Title } from '@mantine/core';
export function Mint() {
    const { account, chainId } = useEthers();

    return (
        <div>
            {account === '0xfA9e24eed2dB48472e2ecc805Ab08086bAEF31A6' && chainId === Goerli.chainId ? (
                <>
                    <MintingNFT />
                </>
            ) : account !== '0xfA9e24eed2dB48472e2ecc805Ab08086bAEF31A6' ? (
                <center>
                    <Title>Mint NFT Page </Title>
                    <Title c={'red'}>Sorry You don't have the right to see this page !</Title>
                </center>
            ) : (
                <>
                    <center>
                        <Title>Mint NFT Page </Title>
                        <Title c={'red'}>Please Go to home page to Connect ! Or change the network</Title>
                    </center>
                </>)
            }
        </div>
    );
};
