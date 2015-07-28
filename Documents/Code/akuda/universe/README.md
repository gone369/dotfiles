# Universe Web app

install npm first   
```
brew install node
```     
or
```
sudo apt-get install node
```


```bash  
npm install bower # if you haven't installed bower  
npm install grunt  
npm install grunt-cli -g 

sudo npm install
bower install
```

serve and watch files using grunt:  
```bash
grunt compass:dev
grunt foundation:dev
grunt wiredep
grunt
```
look in localhost:3000  

# To convert everything from SCSS to SASS (note to self)
sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass
