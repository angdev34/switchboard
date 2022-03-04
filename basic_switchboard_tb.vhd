library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity basic_switchboard_tb is
End basic_switchboard_tb;

    Architecture Behv of basic_switchboard_tb is
    signal source, target : std_logic_vector(7 downto 0);
    signal source_bin,target_bin : std_logic_vector(3 downto 0);
    signal duration : time;
    signal arahat : integer range 0 to 3;
    file input: text;
    component Switchboard is
      port( A : in std_logic_vector(7 downto 0);
	    B : out std_logic_vector(7 downto 0);
            Q : out std_logic_vector(3 downto 0);
            S : in std_logic_vector(3 downto 0);
            T:  in time;
	    Arahat: in integer range 0 to 3);
    end component;
        type Aport is array (integer range <>) of std_logic_vector(7 downto 0);
	type Sport is array (integer range <>) of std_logic_vector(3 downto 0);
	type connection_time is array (integer range <>) of time;
	type port_check is array (0 to 3) of boolean;
    begin
	Switch_board : Switchboard  port map(source, target, source_bin, target_bin, duration, arahat);
	process
	variable A_request : Aport(0 to 7);
	variable A_process : Aport(0 to 3);
	variable B_request : Sport(0 to 7);
	variable B_process : Sport(0 to 3);
	variable time_request : connection_time(0 to 7);
	variable time_process : connection_time(0 to 3);
	variable portcheck : port_check := (false, false,false,false);
	
	variable Quantity: integer :=0;
	variable QuantityID: integer :=0;
	
	variable read_line: line;
        variable A: std_logic_vector(7 downto 0) :="ZZZZZZZZ";
        variable B : std_logic_vector(3 downto 0) :="ZZZZ";
        variable T: integer :=0;
        variable space : character;
	variable portID : integer :=0;
	variable check : boolean :=false;
	begin
		file_open(input,"input.txt",read_mode);
		while not endfile(input) or ( Quantity - QuantityID /= 0) loop
		
		if (Quantity - QuantityID = 0) then
			readline(input,read_line);
			read (read_line,A);
		        read (read_line,space);
		        read (read_line,B);
	                read (read_line,space);
		        read (read_line,T);
			for i in 3 downto 0 loop
			if portcheck(i) = False then
				if A_process(0) /= A and A_process(1) /= A and A_process(2) /= A and A_process(3) /= A  then
					if B_process(0) /= B and B_process(1) /= B and B_process(2) /= B and B_process(3) /= B  then
			 			check := True;
			 			portID := i;
					end if;
				end if;
				
			end if;
			end loop;
			if check = True then
				A_process(portID) := A;
				B_process(portID) := B;
				time_process(portID) := T * 1 sec;
				portcheck(portID) := true;
				source <= A_process(portID);
				target_bin <= B_process(portID);  
				duration <= time_process(portID);
				arahat <= PortID;
				check := False;
			else
				A_request(Quantity) := A;
				B_request(Quantity) := B;
				time_request(Quantity) := T * 1 sec;
				Quantity := Quantity + 1;
			end if;
		else
			A := A_request(QuantityID);
			B := B_request(QuantityID);
		        T := time_request(QuantityID) / 1 sec;
			for i in 3 downto 0 loop
			if portcheck(i) = False then
				if A_process(0) /= A and A_process(1) /= A and A_process(2) /= A and A_process(3) /= A  then
					if B_process(0) /= B and B_process(1) /= B and B_process(2) /= B and B_process(3) /= B  then
			 			check := True;
			 			portID := i;
					end if;
				end if;
			end if;
			end loop;
			if check = True then
				A_process(portID) := A;
				B_process(portID) := B;
				time_process(portID) := T * 1 sec;
				portcheck(portID) := true;	
				check := False;
				source <= A_process(portID);
				target_bin <= B_process(portID);  
				duration <= time_process(portID);
				arahat <= PortID;
				QuantityID := QuantityID + 1;
				
			else
			--for complex switchboard   
				
			end if;
		end if;
		
		for i in 0 to 3 loop
		        if portcheck(i) then
			 	if time_process(i) >0 sec then	
				 	time_process(i) := time_process(i) - 1 sec;
				else
					A_process(i) := "ZZZZZZZZ";
					B_process(i) := "ZZZZ";
					time_process(i) := 0 sec;
					 portcheck(i) := false;
				end if;
		        end if;
		end loop;

		wait for 1 sec;

		end loop;
		 file_close(input);
		
	end process;
    end behv;
