
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import {Home} from './pages/Home';
import { Hash } from './pages/Hash';
import { Nav } from './components/Nav';
import { Mint } from './pages/Mint';
import { Display } from './pages/Display';
import { Transactions } from './pages/Transactions';
import { MyWallet } from './pages/MyWallet';


function App() {
  return (
    <>      
    <BrowserRouter>

    <Nav/>
      <Routes>
        <Route index element={<Home/>}/>
        <Route path='/hash' element={<Hash/>}/>
        <Route path='/mint' element={<Mint/>}/>
        <Route path='/display' element={<Display/>}/>
        <Route path='/transactions' element={<Transactions/>}/>
        <Route path='/mywallet' element={<MyWallet/>}/>
      </Routes>
      </BrowserRouter>
    </>
  )
}

export default App
