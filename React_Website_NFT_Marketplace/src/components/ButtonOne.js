import React from 'react';
import './Button.css';
import { Link } from 'react-router-dom';

const STYLES = ['btn--primary', 'btn--outline', 'btn--test'];

const SIZES = ['btn--medium', 'btn--large'];

export const ButtonOne = ({
  children,
  type,
  onClick,
  buttonStyle,
  buttonSize
}) => {
  const checkButtonStyle = STYLES.includes(buttonStyle)
    ? buttonStyle
    : STYLES[0];

  const checkButtonSize = SIZES.includes(buttonSize) ? buttonSize : SIZES[0];

  return (
    /*<Link to='https://testnets.opensea.io/collection/unidentified-contract-uzu3own82g' className='btn-mobile'>
      <button
        className={`btn ${checkButtonStyle} ${checkButtonSize}`}
        onClick={onClick}
        type={type}
      >
        {children}
      </button>
    </Link>*/
    <form action="https://testnets.opensea.io/collection/unidentified-contract-uzu3own82g">
         <button
         className={`btn ${checkButtonStyle} ${checkButtonSize}`}
         type={type}>
        {children}
         </button>
      </form>
  );
};