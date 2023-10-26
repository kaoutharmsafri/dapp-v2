// import React from "react";
import { Goerli, useEthers } from '@usedapp/core';
import { Box, Title } from '@mantine/core';
import { Transaction } from '../components/Transaction';
export function Transactions() {
    const { account, chainId } = useEthers();

    return (
        <div>
            {account && chainId === Goerli.chainId ? (
                <>
                    <Box maw={500} mx="auto">
                        <Transaction />
                    </Box>
                </>
            ) : (
                <>
                    <center>
                        <Title>Transactions Page </Title>
                        <Title c={'red'}>Please Go to home page to Connect !</Title>
                    </center>
                </>
            )}
        </div>
    );
};
