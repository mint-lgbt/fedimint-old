import React from 'react';

const Logo = () => (
  <svg viewBox="0 0 192 192" className="logo">
    <defs>
      <linearGradient
        id="a"
        x1="39.43"
        y1="152.57"
        x2="152.57"
        y2="39.43"
        gradientUnits="userSpaceOnUse"
      >
        <stop offset="0" stop-color="#296331" />
        <stop offset="1" stop-color="#68bd45" />
      </linearGradient>
    </defs>
    <circle cx="96" cy="96" r="96" fill="#1c331b" />
    <circle cx="96" cy="96" r="80" fill="url(#a)" />
  </svg>
);

export default Logo;
