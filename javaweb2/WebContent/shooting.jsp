<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

        <style>
            canvas
            {
                border: 1px solid;
                background-color: white;
            }

        </style>

        <script>
        	var state='<%=(String)session.getAttribute("login")%>';
        	var name='<%=(String)session.getAttribute("name")%>';
        	var id='<%=(String)session.getAttribute("id")%>'
        	
            var heart=new Image();
            heart.src="JPG/heart.png";

            var enemy2_bullet=new Image();
            enemy2_bullet.src="JPG/enemy_bullet.png"
           

            var score=0;
            var x=150;
            var y=370;
            var dx=2;
            var dy=2;
            var mouseX;
            var mouseY;
            var danmaku_speed=4;
            var keypress={};
            var onshoot=new Array();
            var enemy2_shoot=new Array();
            var reload=false;
            var enemys=new Array();
            var myLife=3;
            var blur=false;
            var boss1=false;
            var boss1_state="not_clear";
            var boss1HP;
            var last_score=-1;
            var stage=0;
            var makeEnemy
            var makeEnemyP=false;
            setInterval(drawGame,10);
            setInterval(move, 10);
            setInterval(checkMissile,10);
            setInterval(enemy1move,10);
            setInterval(checkEnemy1,10);
            setInterval(checkHero,10);


            setInterval(enemyReload,1500);
            setInterval(bossReload,2000);
            setInterval(bossReload2,2200);

            function enemyReload()
            {
                for(var i=0;i<enemys.length;i++)
                {
                    if(blur==false)
                    {
                        if(enemys[i][3]=="enemy2")
                        {
              
                            var enemyX=enemys[i][0]+5;
                            var enemyY=enemys[i][1]+36;
                            var enemyHP=1;
                    
                            var temp=[enemyX,enemyY,enemyHP,"enemy2_bullet",3];
                            enemys.push(temp); 
                        }
                    }
                    
                }
            }

            function bossReload()
            {
                for(var i=0;i<enemys.length;i++)
                {
                    if(blur==false)
                    {
                        if(enemys[i][3]=="boss1")
                        {
              
                            var enemyX=enemys[i][0]+5;
                            var enemyY=enemys[i][1]+36;
                            var enemyHP=1;
                    
                            var temp=[enemyX,enemyY,enemyHP,"enemy2_bullet",3];
                            var temp2=[enemyX,enemyY,enemyHP,"boss1_bullet1",3];
                            var temp3=[enemyX,enemyY,enemyHP,"boss1_bullet2",3];

                            enemys.push(temp); 
                            enemys.push(temp2); 
                            enemys.push(temp3); 
                        }
                    }
                    
                }
            }


            function bossReload2()
            {
                for(var i=0;i<enemys.length;i++)
                {
                    if(blur==false)
                    {
                        if(enemys[i][3]=="boss1")
                        {
              
                            var enemyX=enemys[i][0]+5;
                            var enemyY=enemys[i][1]+36;
                            var enemyHP=1;
                    
                            var temp=[enemyX,enemyY,enemyHP,"enemy2_bullet",3];
                            var temp2=[enemyX,enemyY,enemyHP,"boss1_bullet1",3];
                            var temp3=[enemyX,enemyY,enemyHP,"boss1_bullet2",3];
                       
                            enemys.push(temp); 
                            enemys.push(temp2); 
                            enemys.push(temp3); 
                        }
                    }
                    
                }
            }

            function checkEnemy1()
            {
                for(var i=0;i<enemys.length;i++)
                {

                    if(enemys[i][1]>550)
                    {
                        enemys.splice(i,1);
                    }

                    if(enemys[i][2]<=0 && enemys[i][3]=="enemy1")
                    {
                        score+=50;
                        enemys.splice(i,1);
                    }

                    if(enemys[i][2]<=0 && enemys[i][3]=="enemy2")
                    {
                        score+=70;
                        enemys.splice(i,1);
                    }

                    if(enemys[i][2]<=0 && enemys[i][3]=="boss1")
                    {
                        score+=1000;
                        boss1=false;
                        boss1_state="clear";
                        enemys.splice(i,1);
                    }

                    if(enemys[i][3]=="enemy2")
                    {
                       if(enemys[i][5]==false)
                       {
                           enemys[i][5]=true;
                           //setTimeout(function(){enemys[i][5]=false;},1000);    // 문제점 적이 사라지거나 하면서 배열이 변할텐데, 그 변한 배열의 상태를 1초후에 바꿔버림..
                            var enemyX=enemys[i][0]+5;
                            var enemyY=enemys[i][1]+31;
                            var enemyHP=1;
                    
                            var temp=[enemyX,enemyY,enemyHP,"enemy2_bullet",3];
                            enemys.push(temp); 
                       }
                        
                    }

                        
                        
                    
                }
            }
          
            function checkHero()
            {

                if(x<0)
                {
                    x=x-dx;
                }

                if(x>320)
                {
                    x=x-dx;
                }

                if(y<0)
                {
                    y=y-dy;
                }


                if(y+30>500)
                {
                    y=y+dy;
                }

                for(var i=0;i<enemys.length;i++)
                {
                    if(x>=enemys[i][0]&&x<=enemys[i][0]+40&&y>=enemys[i][1]&&y<=enemys[i][1]+40&&(enemys[i][3]=="enemy1"||enemys[i][3]=="enemy2"))
                    {
                        enemys.splice(i,1);
                        myLife--;
                    }

                    else if(x+30>=enemys[i][0]&&x+30<=enemys[i][0]+40&&y>=enemys[i][1]&&y<=enemys[i][1]+40&&(enemys[i][3]=="enemy1"||enemys[i][3]=="enemy2"))
                    {
                        enemys.splice(i,1);
                        myLife--;
                    }

                    else if(x>=enemys[i][0]&&x<=enemys[i][0]+40&&y+30>=enemys[i][1]&&y+30<=enemys[i][1]+40&&(enemys[i][3]=="enemy1"||enemys[i][3]=="enemy2"))
                    {
                        enemys.splice(i,1);
                        myLife--;
                    }

                    else if(x+30>=enemys[i][0]&&x+30<=enemys[i][0]+40&&y+30>=enemys[i][1]&&y+30<=enemys[i][1]+40&&(enemys[i][3]=="enemy1"||enemys[i][3]=="enemy2"))
                    {
                        enemys.splice(i,1);
                        myLife--;
                    }

                    // boss

                    else if(x>=enemys[i][0]&&x<=enemys[i][0]+60&&y>=enemys[i][1]&&y<=enemys[i][1]+60&&enemys[i][3]=="boss1")
                    {
                        enemys.splice(i,1);
                        myLife=0;
                    }

                    else if(x+30>=enemys[i][0]&&x+30<=enemys[i][0]+60&&y>=enemys[i][1]&&y<=enemys[i][1]+60&&enemys[i][3]=="boss1")
                    {
                        enemys.splice(i,1);
                        myLife=0;
                    }

                    else if(x>=enemys[i][0]&&x<=enemys[i][0]+60&&y+30>=enemys[i][1]&&y+30<=enemys[i][1]+60&&enemys[i][3]=="boss1")
                    {
                        enemys.splice(i,1);
                        myLife=0;
                    }

                    else if(x+30>=enemys[i][0]&&x+30<=enemys[i][0]+60&&y+30>=enemys[i][1]&&y+30<=enemys[i][1]+60&&enemys[i][3]=="boss1")
                    {
                        enemys.splice(i,1);
                        myLife=0;
                    }

                    // bullet
                
                    else if(x>=enemys[i][0]&&x<=enemys[i][0]+30&&y>=enemys[i][1]&&y<=enemys[i][1]+31&&(enemys[i][3]=="enemy2_bullet"||enemys[i][3]=="boss1_bullet1"||enemys[i][3]=="boss1_bullet2"))
                    {
                        enemys.splice(i,1);
                        myLife--;
                    }

                    else if(x+30>=enemys[i][0]&&x+30<=enemys[i][0]+30&&y>=enemys[i][1]&&y<=enemys[i][1]+31&&(enemys[i][3]=="enemy2_bullet"||enemys[i][3]=="boss1_bullet1"||enemys[i][3]=="boss1_bullet2"))
                    {
                        enemys.splice(i,1);
                        myLife--;
                    }

                    else if(x>=enemys[i][0]&&x<=enemys[i][0]+30&&y+30>=enemys[i][1]&&y+30<=enemys[i][1]+31&&(enemys[i][3]=="enemy2_bullet"||enemys[i][3]=="boss1_bullet1"||enemys[i][3]=="boss1_bullet2"))
                    {
                        enemys.splice(i,1);
                        myLife--;
                    }

                    else if(x+30>=enemys[i][0]&&x+30<=enemys[i][0]+30&&y+30>=enemys[i][1]&&y+30<=enemys[i][1]+31&&(enemys[i][3]=="enemy2_bullet"||enemys[i][3]=="boss1_bullet1"||enemys[i][3]=="boss1_bullet2"))
                    {
                        enemys.splice(i,1);
                        myLife--;
                    }

                    // heart
                    else if(x>=enemys[i][0]&&x<=enemys[i][0]+40&&y>=enemys[i][1]&&y<=enemys[i][1]+40&&enemys[i][3]=="heart")
                    {
                        enemys.splice(i,1);
                        myLife++;
                    }

                    else if(x+30>=enemys[i][0]&&x+30<=enemys[i][0]+40&&y>=enemys[i][1]&&y<=enemys[i][1]+36&&enemys[i][3]=="heart")
                    {
                        enemys.splice(i,1);
                        myLife++;
                    }

                    else if(x>=enemys[i][0]&&x<=enemys[i][0]+40&&y+30>=enemys[i][1]&&y+30<=enemys[i][1]+36&&enemys[i][3]=="heart")
                    {
                        enemys.splice(i,1);
                        myLife++;
                    }

                    else if(x+30>=enemys[i][0]&&x+30<=enemys[i][0]+40&&y+30>=enemys[i][1]&&y+30<=enemys[i][1]+36&&enemys[i][3]=="heart")
                    {
                        enemys.splice(i,1);
                        myLife++;
                    }
                }
                
            }
            
         

            function makeRandomEnemy1()
            {
                var odds=Math.floor(Math.random()*200);
                var odds2=Math.floor(Math.random()*100);

                if(odds>80 && blur==false && score<300)
                {
                    var enemyX=Math.floor(Math.random()*310);
                    var enemyY=0;
                    var enemyHP=3;
                    // x좌표, y좌표, HP, 종류, 스피드
                    var temp=[enemyX,enemyY,enemyHP,"enemy1",2];
                    enemys.push(temp);
                }

                else if(odds>80 && blur==false && score>=300 && boss1==false)
                {
                    var enemyX=Math.floor(Math.random()*310);
                    var enemyY=0;
                    var enemyHP=3;
                    // x좌표, y좌표, HP, 종류, 스피드
                    var temp=[enemyX,enemyY,enemyHP,"enemy2",2];
                    enemys.push(temp);
                }

                else if(boss1==false && score>=1000 && boss1_state=="not_clear")
                {
                    enemys.length=0;

                    boss1=true;
                    var enemyX=100;
                    var enemyY=55;
                    var enemyHP=50;
                    var temp=[enemyX,enemyY,enemyHP,"boss1",2];
                    enemys.push(temp);
                }

                
                if(odds2<2 && blur==false)
                {
                    var enemyX=Math.floor(Math.random()*310);
                    var enemyY=0;
                    var enemyHP=1;
                    
                    var temp=[enemyX,enemyY,enemyHP,"heart",2];
                    enemys.push(temp); 
                }
                
                
            }

            function enemy1move()
            {
                for(var i=0;i<enemys.length;i++)
                {
                    if(enemys[i][3]=="enemy1" || enemys[i][3]=="heart" || enemys[i][3]=="enemy2")
                    {
                        enemys[i][1]+=enemys[i][4];
                    }

                    else if(enemys[i][3]=="enemy2_bullet")
                    {
                        enemys[i][1]+=enemys[i][4];
                    }

                    else if(enemys[i][3]=="boss1_bullet1")
                    {
                        enemys[i][1]+=enemys[i][4];
                        enemys[i][0]+=2;
                    }

                    else if(enemys[i][3]=="boss1_bullet2")
                    {
                        enemys[i][1]+=enemys[i][4];
                        enemys[i][0]-=2;
                    }

                    else if(enemys[i][3]=="boss1")
                    {
                        if(enemys[i][0]>270||enemys[i][0]<30)
                        {
                            enemys[i][4]=-enemys[i][4];
                        }

                        enemys[i][0]+=enemys[i][4];

                    }
                }
            }

            function checkMissile()
            {
                for(var i=0;i<onshoot.length;i++)
                {
                    for(var j=0;j<enemys.length;j++)
                    {
                        if(onshoot[i][1]<0)
                        {
                            onshoot.splice(i,1);
                        }

                        //boss
                        else if(onshoot[i][0]>=enemys[j][0]&&onshoot[i][0]<=enemys[j][0]+60&&onshoot[i][1]>=enemys[j][1]&&onshoot[i][1]<=enemys[j][1]+60&&enemys[j][3]=="boss1")
                        {
                            onshoot.splice(i,1);
                            enemys[j][2]=enemys[j][2]-1;
                        }

                        else if(onshoot[i][0]+30>=enemys[j][0]&&onshoot[i][0]+30<=enemys[j][0]+60&&onshoot[i][1]>=enemys[j][1]&&onshoot[i][1]<=enemys[j][1]+60&&enemys[j][3]=="boss1")
                        {
                            onshoot.splice(i,1);
                            enemys[j][2]=enemys[j][2]-1;
                        }

                        else if(onshoot[i][0]>=enemys[j][0]&&onshoot[i][0]<=enemys[j][0]+60&&onshoot[i][1]+30>=enemys[j][1]&&onshoot[i][1]+30<=enemys[j][1]+60&&enemys[j][3]=="boss1")
                        {
                            onshoot.splice(i,1);
                            enemys[j][2]=enemys[j][2]-1;
                        }

                        else if(onshoot[i][0]+30>=enemys[j][0]&&onshoot[i][0]+30<=enemys[j][0]+60&&onshoot[i][1]+30>=enemys[j][1]&&onshoot[i][1]+30<=enemys[j][1]+40&&enemys[j][3]=="boss1")
                        {
                            onshoot.splice(i,1);
                            enemys[j][2]=enemys[j][2]-1;
                        }

                        // 일반 적
        
                        else if(onshoot[i][0]>=enemys[j][0]&&onshoot[i][0]<=enemys[j][0]+40&&onshoot[i][1]>=enemys[j][1]&&onshoot[i][1]<=enemys[j][1]+40&&(enemys[j][3]=="enemy1"||enemys[j][3]=="enemy2"))
                        {
                            onshoot.splice(i,1);
                            enemys[j][2]=enemys[j][2]-1;
                        }

                        else if(onshoot[i][0]+30>=enemys[j][0]&&onshoot[i][0]+30<=enemys[j][0]+40&&onshoot[i][1]>=enemys[j][1]&&onshoot[i][1]<=enemys[j][1]+40&&(enemys[j][3]=="enemy1"||enemys[j][3]=="enemy2"))
                        {
                            onshoot.splice(i,1);
                            enemys[j][2]=enemys[j][2]-1;
                        }

                        else if(onshoot[i][0]>=enemys[j][0]&&onshoot[i][0]<=enemys[j][0]+40&&onshoot[i][1]+30>=enemys[j][1]&&onshoot[i][1]+30<=enemys[j][1]+40&&(enemys[j][3]=="enemy1"||enemys[j][3]=="enemy2"))
                        {
                            onshoot.splice(i,1);
                            enemys[j][2]=enemys[j][2]-1;
                        }

                        else if(onshoot[i][0]+30>=enemys[j][0]&&onshoot[i][0]+30<=enemys[j][0]+40&&onshoot[i][1]+30>=enemys[j][1]&&onshoot[i][1]+30<=enemys[j][1]+0&&(enemys[j][3]=="enemy1"||enemys[j][3]=="enemy2"))
                        {
                            onshoot.splice(i,1);
                            enemys[j][2]=enemys[j][2]-1;
                        }
                    }
                }
            }

            function hero()
            {
                var canvas = document.getElementById('myCanvas');
                var context = canvas.getContext('2d');

                context.beginPath();
                context.rect(x, y, 30, 30);
                context.fillStyle = "yellow";

                context.fill();
            }

            function enemy(enemyX,enemyY,enemyType)
            {
                var canvas = document.getElementById('myCanvas');
                var context = canvas.getContext('2d');

                if(enemyType=="enemy1")
                {
                context.beginPath();
                context.rect(enemyX, enemyY, 40, 40);
                context.fillStyle = "blue";
                }

                
                else if(enemyType=="enemy2")
                {
                    context.beginPath();
                    context.rect(enemyX, enemyY, 40, 40);
                    context.fillStyle = "purple";
                }

                else if(enemyType=="heart")
                {
                    context.drawImage(heart,enemyX,enemyY);
                }

                else if(enemyType=="enemy2_bullet" || enemyType=="boss1_bullet1" || enemyType=="boss1_bullet2")
                {
                    context.drawImage(enemy2_bullet,enemyX,enemyY);
                }

                else if(enemyType=="boss1")
                {
                    context.beginPath();
                    context.rect(enemyX, enemyY, 60, 60);
                    context.fillStyle = "black";
                }

                context.fill();
            }
            

            function drawGame()         // 게임을 만드는 핵심부분
            {
                var canvas = document.getElementById("myCanvas");
                var context = canvas.getContext("2d");

                context.clearRect(0, 0, 350, 500);

                if(myLife<=0)
                {
                    stage=2;
                }
                if(stage==0)
                {
                    context.fillStyle="black";
                    context.font = '30pt Arial'
                    context.fillText("탄막 슈팅게임",50 ,200);
                    context.font = '20pt Arial'
                    context.fillText("게임 시작",120 ,290);

                    context.font = '15pt Arial'
                    context.fillText("방향키 : 이동    스페이스바 : 공격",30 ,380);

                   

                    context.font = '10pt Arial'
                    context.fillText("렉으로 인해 보스몬스터가 바로 나오지 않을 수도 있습니다.",5 ,480);
                    
                }

                else if(stage==1)
                {

                    if(makeEnemyP==false)
                    {
                        makeEnemyP=true;
                        makeEnemy=setInterval(makeRandomEnemy1,1000);
                    }
                if(myLife>0)
                {
                    for(var i=0;i<onshoot.length;i++)
                    {
              
                        shooting(i);
                    
                    }

                    for(var i=0;i<enemys.length;i++)
                    {
                        if(enemys[i][3]=="boss1")
                        {
                            boss1HP=enemys[i][2];
                        }

                        enemy(enemys[i][0],enemys[i][1],enemys[i][3]);
                    }

                    hero();



                    context.fillStyle="black";
                    context.font = '15pt Arial'
                    context.fillText("점수 : "+score,20 ,460);
                    context.fillText("생명력 : "+myLife,20 ,490);
                    

                    if(boss1==true)
                    {
                        context.fillStyle="black";
                        context.font = '12pt Arial'
                        context.fillText("보스체력",30 ,23);
                        context.beginPath();
                        context.rect(30, 30, boss1HP*6, 20);
                        context.fillStyle = "red";
                        context.fill();
                    }
                    
                }

                }
                
                else if(stage==2)
                {
                    clearInterval(makeEnemy);
                
                    if(last_score==-1)
                    {
                        last_score=score;
                    }
                  
                    
                    
                    context.fillStyle="black";
                    context.font = '20pt Arial'
                    context.fillText("Game Over",100,230);

                    context.font = '15pt Arial'
                    context.fillText("점수 : "+last_score, 135 ,270);

                    context.font = '15pt Arial'
                    if(state=="ok")
                    {
                    	context.fillText("점수기록", 135 ,350);
                    }
                    
                    else
                    {
                    	context.fillText("다시하기", 135 ,350);
                    }
                    

                }
            }
                  
                
                
                

        

            function shooting(i)
            {
                    var canvas = document.getElementById('myCanvas');
                    var context = canvas.getContext('2d');
                   
                    context.beginPath();
                    context.rect( onshoot[i][0],onshoot[i][1], 20, 20);
                    context.fillStyle = "red";
                    context.fill();           
                    onshoot[i][1]-=danmaku_speed;
            }

           

            function move()
            {

                if(keypress[37]==true)
                {
                    if(dx>0)
                    {
                        dx=-dx;
                    }

                    x=x+dx;
                    
                }


                if(keypress[39]==true)
                {
                    if(dx<0)
                    {
                        dx=-dx;
                    }

                
                    x=x+dx;
                    
                }

                if(keypress[38]==true)
                {
                    if(dy>0)
                    {
                        dy=-dy;
                    }

                    y=y+dy;
                }

                
                if(keypress[40]==true)
                {
                    if(dy>0)
                    {
                        dy=-dy;
                    }

                    y=y-dy;
                }

                if(keypress[32]==true && reload==false)
                {
                    reload=true;
                    setTimeout(function(){reload=false},200)
                    temp=[x+5,y];
                    onshoot.push(temp);
                }

                
            }

            function keydown(e)
            {
                keypress[e.keyCode]=true;
            }

            function keyup(e)
            {
                keypress[e.keyCode]=false;
            }

            function fblur()
            {
                blur=true;
            }

            function focus()
            {
                blur=false;
            }

            window.addEventListener("keydown", function(e) {
				if([32, 37, 38, 39, 40].indexOf(e.keyCode) > -1) {
					e.preventDefault();
				}
			}, false);


            
            function mouseclick(e)
            {
                mouseX=e.offsetX;
                mouseY=e.offsetY;

                if(stage==0&&e.offsetX>=121&&e.offsetX<=233&&e.offsetY>=266&&e.offsetY<=292)
                {
                    stage=1;
                }


                if(stage==2&&e.offsetX>=134&&e.offsetX<=214&&e.offsetY>=331&&e.offsetY<=350)
                {
                	
               
                    // location.href="UserController?action=new_score&score=last_score"
                    		
                   if(state=="ok")
                   {
                	var form = document.createElement('form');
                    form.setAttribute('method', 'get');
                    form.setAttribute('action', 'UserController');
                    document.charset = "utf-8";
                    
                    
                    var hiddenField = document.createElement('input');
                    hiddenField.setAttribute('type', 'hidden');
                    hiddenField.setAttribute('name', 'score');
                    hiddenField.setAttribute('value', last_score);
                    form.appendChild(hiddenField);
                    
                    var hiddenField2 = document.createElement('input');
                    hiddenField2.setAttribute('type', 'hidden');
                    hiddenField2.setAttribute('name', 'nickname');
                    hiddenField2.setAttribute('value', name);
                    form.appendChild(hiddenField2);
                    
                    
                    var hiddenField3 = document.createElement('input');
                    hiddenField3.setAttribute('type', 'hidden');
                    hiddenField3.setAttribute('name', 'action');
                    hiddenField3.setAttribute('value', 'new_score');
                    form.appendChild(hiddenField3);
                    
                    var hiddenField4 = document.createElement('input');
                    hiddenField4.setAttribute('type', 'hidden');
                    hiddenField4.setAttribute('name', 'id');
                    hiddenField4.setAttribute('value', id);
                    form.appendChild(hiddenField4);
                    
                    document.body.appendChild(form);
                    form.submit();
                   }
                    
                   	else
                 	{
                	   score=0;
                       last_score=-1;
                       myLife=3;
                       var boss1_state="not_clear";
                       makeEnemyP=false;
                       boss1=false;
                       x=150;
                       y=370;
                       stage=0;
                       record=false;
                       enemys.length=0;
                	}
                }
            }

        </script>
<meta charset="UTF-8">
<title>탄막 슈팅 게임</title>
</head>
<body onkeydown="keydown(event)" onkeyup="keyup(event)" onblur="fblur()" onfocus="focus()">
        
        <canvas id="myCanvas" onclick="mouseclick(event)" width="350" height="500"></canvas>
        
    </body>
</html>