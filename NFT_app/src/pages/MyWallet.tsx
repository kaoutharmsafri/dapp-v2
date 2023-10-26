import { Title } from "@mantine/core";
import { Goerli, useEthers } from '@usedapp/core';
import { Nftwallet } from "../components/Nftwallet";

export const MyWallet = () => {

  const { account, chainId } = useEthers();

  return (
    <div>
      {account && chainId === Goerli.chainId ? (
        <>
          <Nftwallet />
        </>
      ) : (
        <>
          <center>
            <Title>NFT Wallet page</Title>
            <Title c={'red'}>Please Go to home page to Connect !</Title>
          </center>
        </>
      )}
    </div>
  );
};

