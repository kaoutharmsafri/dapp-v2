import { Title } from "@mantine/core";
import { Goerli, useEthers } from '@usedapp/core';
import { Displaying } from "../components/Displaying";

export const Display = () => {

  const { account, chainId } = useEthers();

  return (
    <div>
      {account && chainId === Goerli.chainId ? (
        <>
          <Displaying />
        </>
      ) : (
        <>
          <center>
            <Title>Display data page</Title>
            <Title c={'red'}>Please Go to home page to Connect !</Title>
          </center>
        </>
      )}
    </div>
  );
};

