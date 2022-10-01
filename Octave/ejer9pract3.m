1;
close all;
clc,clear;

pkg load symbolic
syms c v m0;

m=m0/(sqrt(1-(v^2/c^2)))
taylor(m, v, 0, 'order', 3)%como hai cuadrados, pois ten que ser hasta orden 2 pero en octave sumase 1 a orden correcta
