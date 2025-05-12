mb:
	melos bootstrap

f: 
	mason make feature

bfg:
	cd apps && cd eon_business && cd lib && cd src && cd feature && mason make feature
	