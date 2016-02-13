//this is a minimal terminal-based port of Threes. 

//this uses an MS-DOS header so those of us using mac/linux don't have access to it. 
//but spend some time taking a look at this and try to figure it out.
//google for bits you don't understand, its all there.

//source file: http://pastebin.com/gWD3VKpH

#include<iostream> 
#include<ctime>
#include<cstdlib>
#include<array>
#include<iomanip>
#include<conio.h> 


using namespace std;

array<int,16> b,c;

int r() {
	return rand()%3;
}

void main(){
	srand(time(NULL));
	int ch = 0;
	int dx=0, dy=0;	
	b[9] = 1; 
	b[10] = 2;
	do {			
		system("cls");
		if (ch==72) dy=1; 
		if (ch==80) dy=-1;
		if (ch==75) dx=-1; 
		if (ch==77) dx=1;	
		bool g = dx!=0 || dy!=0;
		bool m = !g || (ch==0);
		while(g){
			g = false;
			int d = (dx==1 || dy==-1);
			for(int i=0;i<16;i++){
				int ii = (dx==-1 || dy==-1)?15-i:i;
				int j=ii/4;
				int ni = (dx==1)?(ii+1):((dx==-1)?(ii-1):((dy==1)?(ii-4):(ii+4)));
				bool go = b[ii] && ((dx==1 && ii%4!=3) || (dx==-1 && ii%4!=0) || (dy==1 && j%4!=0) || (dy==-1 && j%4!=3));				
				if (go){
					if (b[ii]==b[ni]){
						b[ii]=0;
						b[ni]*=2;
						g = true;		
						m = true;
					}
					else if (b[ni]==0){
						b[ni] = b[ii];
						b[ii] = 0;
						g = true;
						m = true;
					}
				}	
			}
		}
		for(int i=0;i<16;i++){
			int j=i/4;
			bool go = (b[i]==0) && ((dx==1 && i%4==0) || (dx==-1 && i%4==3) || (dy==1 && j%4==3) || (dy==-1 && j%4==0));			
			if (go) b[i] = r();
		}	
		for(int i=0;i<16;i++){
			cout << setw(3) << setfill(' ') << b[i] << ' ' << (i%4==3?"\n":"");
		}		
		cout << "\n";		
				
		if (!m){
			int score = 0;
			for(auto i: b) score+=i;
			cout << "Score: " << score;
			return;
		}
		dx = dy = 0;			
	}	
	while((ch = _getch()) != 27);
}