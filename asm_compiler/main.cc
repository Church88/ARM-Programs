#include <cstdlib>
#include <iostream>
#include <fstream>
#include <iterator>
#include <vector>
#include <algorithm>
#include <sstream>
#include <string>
#include <unistd.h>
using namespace std;

void die(int line_no = 0) {
	cout << "Syntax Error on line " << line_no << endl;
	exit(1);
}

int main(int argc, char **argv) {
	//If we pass any parameters, we'll just generate an assembly file 
	//Otherwise we will generate an assembly file, assemble it, and run it
	//A, B, C, I, J, X, Y, Z.
	vector<string>data;
	vector<int>label_v;
	vector<pair<long,int>>goto_v;
	data.push_back(".data\n");
	int arr[8] = {'A', 'B', 'C', 'I', 'J', 'X', 'Y', 'Z'};
	int rval[8] = {4,   5,   6,   7,   8,   9,  10,  11};
	bool assemble_only = false;
	if (argc > 1) assemble_only = true;
	ofstream outs("main.s"); //This is the assembly file we're creating
	if (!outs) {
		cout << "Error opening file.\n";
		return -1;
	}
	outs << ".global main\nmain:\n"; //Get the file ready to rock
	outs << "\tPUSH {LR}\n\tPUSH {R4-R12}\n\n";
	outs << "\tMOV R4,#0\n\tMOV R5,#0\n\tMOV R6,#0\n\tMOV R7,#0\n\tMOV R8,#0\n\tMOV R9,#0\n\tMOV R10,#0\n\tMOV R11,#0\n\tMOV R12,#0\n";

	int line_no = 0;
	while (cin) {
		string s,l,u;
		getline(cin,s);
		line_no++;
		if (!cin) break;
		transform(s.begin(), s.end(), s.begin(), ::toupper); //Uppercaseify
		auto it = s.find("QUIT"); //TERMINATE COMPILER
		if (it != string::npos) break;
		stringstream ss(s); //Turn s into a stringstream
		int label;
		ss >> label;
		label_v.push_back(label);
		if (!ss) die(line_no);
		outs << "line_" << label << ":\n"; //Write each line number to the file ("line_20:")
		string command;
		ss >> command;
		if (!ss) die(line_no);
		//COMMAND START
		if (command == "REM") {
			continue;
		}
		else if(command == "INPUT") {
			ss >> command;
			if (!ss) die(line_no);
			char c_input = command[0];
			int input_pos = 0;
			for(int a3 = 0; a3 < sizeof(arr); a3++) {
				if(arr[a3] == c_input) {
					input_pos = rval[a3];
				}
			}
			if(input_pos == 0) {
				die(line_no);
			}
			static int strx2 = 0;
			string input_data;
			stringstream input_data_s(input_data);
			input_data_s << "strx_" << strx2 << ": .long 0\n" << "fmtInput_" << strx2 << ": .asciz \"%d\"\n";
			string input_data_str = input_data_s.str();
			data.push_back(input_data_str);
			//Outs
			outs << "\tLDR R0,=fmtInput_" << strx2 << "\n\tLDR R1,=strx_" << strx2 << "\n\tBL scanf\n";
			outs << "\tLDR R1,=strx_" << strx2 << "\n\tLDR R0,[R1]\n" << "\tMOV R" << input_pos << ",R0\n";
			strx2++;
		}
		else if (command == "GOTO") {
			int target;
			ss >> target;
			if (!ss) die(line_no);
			//CHECK IF LABEL IS REAL
			bool target_t = false;
			pair <long,int> goto_label;
			goto_label = make_pair((long)target,line_no);
			goto_v.push_back(goto_label);
			outs << "\tBAL line_" << target << endl;
			continue;
		}
		else if (command == "EXIT" || command == "END") {
			outs << "\tBAL quit\n";
			continue;
		}
		//YOU: Put all of your code here, interpreting the different commands in BB8
		else if (command == "PRINT") {
			//Print Code
			ss >> command;
			if (!ss) die(line_no);
			char c = command[0];
			if(!(c == '\"')) {
				int pos_0 = 0;
				for(int a0 = 0; a0 < sizeof(arr); a0++) {
					if(arr[a0] == command[0]) {
						pos_0 = rval[a0];
					}
				}
				if(pos_0 == 0) {
					die(line_no);
				}
				outs << "\tMOV R0,R" << pos_0 << "\n" << "\tBL print_number\n";
			}
			else {
				for(int x2 = 0; x2 < command.length(); x2++) {
					ss.unget();
				}
				string comm;
				getline(ss,comm);
				for(char& slash : comm) {
					static int pos_s = 0;
					if(slash == '\\') {
						comm[pos_s+1] = tolower(comm[pos_s+1]);
					}
					pos_s++;
				}
				static int strx = 0;
				string data_label;
				stringstream data_l(data_label);
				data_l << "str_" << strx << ": .asciz " << comm << "\n";
				string data_finish = data_l.str();
				data.push_back(data_finish);
				outs << "\tLDR R0,=str_" << strx << "\n";
				outs << "\tBL print_string\n";
				strx++;
			}
		}
		else if (command == "LET") {
			//LET VAR = SOMETHING
			ss >> command;
			if (!ss) die(line_no);
			char cmp = command[0];
			int pos_1 = 0;
			for(int a1 = 0; a1 < sizeof(arr); a1++) {
				if(arr[a1] == cmp){
					pos_1 = rval[a1];
				}
			}
			if(pos_1 == 0) {
				die(line_no);
			}
			ss >> command;
			if(command[0] == '=') {
				char op1;
				char op2;
				char opr8tr;
				ss >> command; //Reading x or number
				op1 = command[0];
				if(find(arr,arr+8,command[0])) { //If number or var is in array (not sure is this does anything currently, I think it always evaluates
					ss >> command;               //Reading opr8tr
					char *x_p;
					long i = strtol(command.c_str(),&x_p,10); //if number it will simply move it to correct Rpos
					if(!(*x_p)){
						outs << "\tMOV R" << pos_1 << ",#" << i << "\n";
					}
					else {
						//Command didn't equal a number, so we must pull vars from memory and operate
						int pos_op1 = 0, pos_op2 = 0;
						opr8tr = command[0]; //since first opr8tr was already read, assign opr8tr
						//cout << opr8tr << " <- opr8tr\n";
						ss >> command;
						op2 = command[0];
						if(isdigit(op2)) {
							if(opr8tr == '+'){
								outs << "\tADD R" << pos_1 << ",R" << pos_1 << ",#" << op2 << "\n";
							}
							if(opr8tr == '*'){
								outs << "\tMUL R1,R" << pos_1 << ",#" << op2 << "\n";
								outs << "\tMOV R"<< pos_1 << ",R1\n";
							}
							if(opr8tr == '-'){
								outs << "\tSUB R" << pos_1 << ",R" << pos_1 << ",#" << op2 << "\n";
							}
						}
						else {
							for(int a2 = 0; a2 < sizeof(arr); a2++){
								if(arr[a2] == op1) {
									pos_op1 = rval[a2];
								}
							}
							if(pos_op1 == 0) {
								die(line_no);
							}
							for(int a3 = 0; a3 < sizeof(arr); a3++) {
								if(arr[a3] == op2) {
									pos_op2 = rval[a3];
								}
							}
							if(pos_op2 == 0) {
								die(line_no);
							}
							if(opr8tr == '+'){
								outs << "\tADD R" << pos_1 << ",R" << pos_op1 << ",R" << pos_op2 << "\n";
							}
							if(opr8tr == '*'){
								outs << "\tMUL R1,R" << pos_op1 << ",R" << pos_op2 << "\n";
								outs << "\tMOV R"<< pos_1 << ",R1\n";
							}
							if(opr8tr == '-'){
								outs << "\tSUB R" << pos_1 << ",R" << pos_op1 << ",R" << pos_op2 << "\n";
							}
						}
					}
				}
			} else { 
				die(line_no); 
			}
		}
		else if(command == "IF") { //Implement when you're not tired idiot
			char var_op1,var_op2;
			string l_op;
			ss >> command;
			var_op1 = command[0];  //Capturing our first var
			int op1_pos = 0;
			for(int a4 = 0; a4 < sizeof(arr); a4++) {
				if(arr[a4] == var_op1) {
					op1_pos = rval[a4];
				}
			}
			if(op1_pos == 0) {
				die(line_no);
			}
			ss >> command;
			l_op = command;     //Capturing our logical operator, this will guide flow
			ss >> command;
			var_op2 = command[0]; //Capturing our second var
			int op2_pos = 0;
			for(int a5 = 0; a5 < sizeof(arr); a5++) {
				if(arr[a5] == var_op2) {
					op2_pos = rval[a5];
				}
			}
			if(op2_pos == 0) {
				die(line_no);
			}
			//construct if's for l_op resolution
			ss >> command; //Capturing "THEN"
			if(command == "THEN") {
				ss >> command;
				if(command == "GOTO") {
					ss >> command;
					char *op_d;
					long op_dest = strtol(command.c_str(),&op_d,10);
					pair <long,int> op_dest_label;
					op_dest_label = make_pair(op_dest,line_no);
					goto_v.push_back(op_dest_label);
					ss >> command;
					if(command != "ELSE") { //Detecting end of string stream maybe?
						for(int x1 = 0; x1 < command.length(); x1++) {
							ss.unget();
						}	
						if(l_op == ">") {
							outs << "\tCMP R" << op1_pos << ",R" << op2_pos << "\n";
							outs << "\tBGT line_" << op_dest << "\n";
						}
						else if(l_op == "<") {
							outs << "\tCMP R" << op1_pos << ",R" << op2_pos << "\n";
							outs << "\tBLT line_" << op_dest << "\n";
						}
						else if(l_op == ">=") {
							outs << "\tCMP R" << op1_pos << ",R" << op2_pos << "\n";
							outs << "\tBGE line_" << op_dest << "\n";
						}
						else if(l_op == "<=") {
							outs << "\tCMP R" << op1_pos << ",R" << op2_pos << "\n";
							outs << "\tBLE line_" << op_dest << "\n";
						}
						else if(l_op == "==") {
							outs << "\tCMP R" << op1_pos << ",R" << op2_pos << "\n";
							outs << "\tBEQ line_" << op_dest << "\n";
						}
						else if(l_op == "!=") {
							outs << "\tCMP R" << op1_pos << ",R" << op2_pos << "\n";
							outs << "\tBNE line_" << op_dest << "\n";
						}
						else {
							die(line_no);
						}
					}
					else {
						if(command == "ELSE") {
							ss >> command;
							if(command == "GOTO") {
								ss >> command;
								char *op_d2;
								long op_dest_2 = strtol(command.c_str(),&op_d2,10);
								pair <long,int> op_dest_2_label;
								op_dest_2_label = make_pair(op_dest_2,line_no);
								goto_v.push_back(op_dest_2_label);
								if(l_op == ">") {
									outs << "\tCMP R" << op1_pos << ",R" << op2_pos << "\n";
									outs << "\tBGT line_" << op_dest << "\n";
									outs << "\tBAL line_" << op_dest_2 << "\n";
								}
								else if(l_op == "<") {
									outs << "\tCMP R" << op1_pos << ",R" << op2_pos << "\n";
									outs << "\tBLT line_" << op_dest << "\n";
									outs << "\tBAL line_" << op_dest_2 << "\n";
								}
								else if(l_op == ">=") {
									outs << "\tCMP R" << op1_pos << ",R" << op2_pos << "\n";
									outs << "\tBGE line_" << op_dest << "\n";
									outs << "\tBAL line_" << op_dest_2 << "\n";
								}
								else if(l_op == "<=") {
									outs << "\tCMP R" << op1_pos << ",R" << op2_pos << "\n";
									outs << "\tBLE line_" << op_dest << "\n";
									outs << "\tBAL line_" << op_dest_2 << "\n";	
								}
								else if(l_op == "==") {
									outs << "\tCMP R" << op1_pos << ",R" << op2_pos << "\n";
									outs << "\tBEQ line_" << op_dest << "\n";
									outs << "\tBAL line_" << op_dest_2 << "\n";
								}
								else if(l_op == "!=") {
									outs << "\tCMP R" << op1_pos << ",R" << op2_pos << "\n";
									outs << "\tBNE line_" << op_dest << "\n";
									outs << "\tBAL line_" << op_dest_2 << "\n";	
								}
								else {
									die(line_no);
								}
							}
							else { 
								die(line_no);
							}
						}
						else { 
							die(line_no);
						}
					}
				}
				else { 
				die(line_no);
			}
			}
			else { 
				die(line_no);
			}
		}
		else {
			die(line_no);
		}	
	}

	//Clean up the file at the bottom
	outs << "\nquit:\n\tMOV R0, #42\n\tPOP {R4-R12}\n\tPOP {PC}\n"; //Finish the code and return
	for(auto i : data) {
		if(data.size() == 1) {
			break;
		}
		else {
			outs << i;
		}
	}

	outs.close(); //Close the file
	//Check label vec here
	bool reached_end = false;
	int where_a = 0;
	if(goto_v.size() >= 1) {
	for(auto a : goto_v) { //for goto's pushed and requested
		reached_end = true;
		for(auto b : label_v) { //check label's pushed
			if(b == a.first) {
				reached_end = false;
				break;
			}
		}
		if(reached_end) {
			die(goto_v.at(where_a).second);
		}
		where_a++;
	}
	}
	if (assemble_only) return 0; //When you're debugging you should run bb8 with a parameter

	if(system("gcc main.s print.c")) {
		cout << "Assembling failed, which means your compiler screwed up.\n";
		return 1;
	}
	//We've got an a.out now, so let's run it!
	cout << "Compilation successful. Executing program now." << endl;
	execve("a.out",NULL,NULL);
}


