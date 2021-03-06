//@author Raymond Harry Rudy rudyhar@jp.ibm.com
//Counterfeit coin finding with 5 coins.
//The false coin is 3
OPENQASM 2.0;
include "qelib1.inc";
qreg qr[6];
creg cr[6];
h qr[0];
h qr[1];
h qr[2];
h qr[3];
h qr[4];
cx qr[0],qr[5];
cx qr[1],qr[5];
cx qr[2],qr[5];
cx qr[3],qr[5];
cx qr[4],qr[5];
measure qr[5] -> cr[5];
if(cr==0) x qr[5];
if(cr==0) h qr[5];
if(cr==32) h qr[0];
if(cr==32) h qr[1];
if(cr==32) h qr[2];
if(cr==32) h qr[3];
if(cr==32) h qr[4];
barrier qr[0],qr[1],qr[2],qr[3],qr[4],qr[5];
if(cr==0) cx qr[3],qr[5];
barrier qr[0],qr[1],qr[2],qr[3],qr[4],qr[5];
if(cr==0) h qr[0];
if(cr==0) h qr[1];
if(cr==0) h qr[2];
if(cr==0) h qr[3];
if(cr==0) h qr[4];
measure qr[0] -> cr[0];
measure qr[1] -> cr[1];
measure qr[2] -> cr[2];
measure qr[3] -> cr[3];
measure qr[4] -> cr[4];
