-----------------------------------------------------------
-- COMPONENTE: SUBTRATOR DE 8 BITS
-- DESCRIÇÃO:
--     SUBTRAI DOIS VALORES DE 8 BITS, RETORNANDO UM OUTRO
--     VALOR DE 8 BITS
-----------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SUBTRATOR_8BITS IS
	PORT(	
		A,B  : IN STD_LOGIC_VECTOR (7 DOWNTO 0); 
		COUT : OUT STD_LOGIC; 
		S    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE BEHAVIOR OF SUBTRATOR_8BITS IS
SIGNAL COMPLEMENTO : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT SOMADOR_8BITS IS
PORT(
	A,B  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	CIN  : IN STD_LOGIC;
	COUT : OUT STD_LOGIC;
	S    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;
	
BEGIN
	COMPLEMENTO(7) <= '1' XOR B(7);
	COMPLEMENTO(6) <= '1' XOR B(6);
	COMPLEMENTO(5) <= '1' XOR B(5);
	COMPLEMENTO(4) <= '1' XOR B(4);
	COMPLEMENTO(3) <= '1' XOR B(3);
	COMPLEMENTO(2) <= '1' XOR B(2);
	COMPLEMENTO(1) <= '1' XOR B(1);
	COMPLEMENTO(0) <= '1' XOR B(0);
	RESULTADO : SOMADOR_8BITS PORT MAP(A, COMPLEMENTO, '1', COUT, S);
END; 