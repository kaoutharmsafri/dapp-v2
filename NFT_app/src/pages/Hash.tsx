// import React from "react";

import { Title } from "@mantine/core";
import Hashing from "../components/Hashing";
import { Goerli, useEthers } from '@usedapp/core';


export function Hash() {
    const { account, chainId } = useEthers();

    return (
        <div>
            {account && chainId === Goerli.chainId ? (
                <>
                    <Hashing />
                </>
            ) : (
                <>
                    <center>
                        <Title>Hash generator page</Title>
                        <Title c={'red'}>Please Go to home page to Connect !</Title>
                    </center>
                </>
            )}

        </div>
    );
};
