*&---------------------------------------------------------------------*
*& Report ZTEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztest.

DATA: lt_t000 TYPE TABLE OF t000.

SELECT * FROM t000 INTO TABLE lt_t000.

DELETE ADJACENT DUPLICATES FROM lt_t000 COMPARING mtext.
