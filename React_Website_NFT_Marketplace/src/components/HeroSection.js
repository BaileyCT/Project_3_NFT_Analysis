import React from 'react';
import '../App.css';
import { ButtonOne } from './ButtonOne';
import './HeroSection.css';

function HeroSection() {
  return (
    <div className='hero-container'>
      <video src='/videos/video-2.mp4' autoPlay loop muted />
      <h1>University of Toronto FinTech Bootcamp Student Created NFT Marketplace</h1>
      <p>Click GET STARTED to access the marketplace!</p>
      <div className='hero-btns'>
        {/*<Button
          className='btns'
          buttonStyle='btn--outline'
          buttonSize='btn--large'
        >
          GET STARTED
        </Button>*/}
        <form action="https://testnets.opensea.io/collection/unidentified-contract-uzu3own82g">
         <ButtonOne
         className='btns'
         buttonStyle='btn--outline'
         buttonSize='btn--large'>
           GET STARTED
         </ButtonOne>
      </form>
      </div>
    </div>
  );
}

export default HeroSection;