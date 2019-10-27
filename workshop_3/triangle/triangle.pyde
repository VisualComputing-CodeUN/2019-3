
sizeScreen = 600
backgroundColor = color(50)
A = 20
flag = 0

V1={'x':int(random(sizeScreen)),'y':int(random(sizeScreen)),'color':color(255,0,0)}
V2={'x':int(random(sizeScreen)),'y':int(random(sizeScreen)),'color':color(0,255,0)}
V3={'x':int(random(sizeScreen)),'y':int(random(sizeScreen)),'color':color(0,0,255)}


def setup():
    size(sizeScreen,sizeScreen)
    calculateOrders()
    
def draw():
    background(backgroundColor)
    strokeWeight(1)
    stroke(255,255,255,70)
    #dibujar grilla
    noFill()

    for x in range(width/A):
        X = A*x
        #Vertical Lines
        line(X+A,0,X+A,height)
        #Horizontal Lines
        line(0,X+A,width,X+A)
        for y in range(height/A):
            center=(A*x+A/2,A*y+A/2)
            strokeWeight(2)
            point(center[0],center[1])
            strokeWeight(1)
            
    if flag == 0:
        
        #shadow
        for x in range(width/A):
            for y in range(height/A):
                center=(A*x+A/2,A*y+A/2)
                point(center[0],center[1])
                loc = x+y*width
                col = get_baricentric_coor(center[0],center[1])
                fill(col)
                rect( center[0]-A/2,center[1]-A/2,center[0]+A/2,center[1]+A/2 )
                strokeWeight(2)
                point(center[0],center[1])
                strokeWeight(1)
        
        strokeWeight(5)
        #print("pinta R G B y triangulo")
        stroke(V1['color'])
        point(V1['x'],V1['y'])
        stroke(V2['color'])
        point(V2['x'],V2['y'])
        stroke(V3['color'])
        point(V3['x'],V3['y'])
        stroke(255)
        strokeWeight(1)
        noFill()
        triangle( V1['x'],V1['y'],V2['x'],V2['y'],V3['x'],V3['y'] )
        

    elif flag == 1:
        #print("pinta R")
        strokeWeight(5)
        stroke(V1['color'])
        point(V1['x'],V1['y'])
    elif flag == 2:
        #print("pinta R G")
        strokeWeight(5)
        stroke(V1['color'])
        point(V1['x'],V1['y'])
        stroke(V2['color'])
        point(V2['x'],V2['y'])

def edge_function(ini_vector,end_vector,pixel):
    #a = (ini_vector['y']-end_vector['y'])*pixel[0] + (end_vector['x']-ini_vector['x'])*pixel[1] + (ini_vector['x']*end_vector['y'] - ini_vector['y']*end_vector['x'])
    determinant = (end_vector['x']-ini_vector['x'])*(pixel[1]-ini_vector['y']) - (end_vector['y']-ini_vector['y'])*(pixel[0]-ini_vector['x'])
    return float(determinant)

def get_baricentric_coor(x,y):
    loc = x+y*400
    current_color = backgroundColor
    F12 = edge_function(V1,V2,(x,y))
    F23 = edge_function(V2,V3,(x,y))
    F31 = edge_function(V3,V1,(x,y))
    if F12 > 0 or F23 > 0 or F31 > 0:
        return current_color
    w1 = F23
    w2 = F31
    w3 = F12
    paralelogram_area = F12 + F23 + F31
    l1 = w1/paralelogram_area
    l2 = w2/paralelogram_area 
    l3 = w3/paralelogram_area
    return color(255*l1,255*l2,255*l3)

def calculateOrders():
    
    V1 = globals()['V1']
    V2 = globals()['V2']
    V3 = globals()['V3']
    if edge_function(V1,V2,(V3['x'],V3['y'])) > 0:
        #print("se cambia coordenadas de V2 con V3")
        tempX = globals()['V2']['x']
        tempY = globals()['V2']['y']
        globals()['V2']['x']=globals()['V3']['x']
        globals()['V2']['y']=globals()['V3']['y']
        globals()['V3']['x']=tempX
        globals()['V3']['y']=tempY
    
    #else:
        #print("no se necesitan cambiar los puntos")
    
        
def mousePressed():
    if globals()['flag'] == 0:
        #va a clikear primer punto
        globals()['V1']['x'] = mouseX
        globals()['V1']['y'] = mouseY
        #print("V1",V1['x'],V1['y'])
    elif globals()['flag'] == 1:
        #va a clikear segundo punto
        globals()['V2']['x'] = mouseX
        globals()['V2']['y'] = mouseY
        #print("V2",V2['x'],V2['y'])
    elif globals()['flag'] == 2:
        #va a clikear tercer punto
        globals()['V3']['x'] = mouseX
        globals()['V3']['y'] = mouseY
        #print("V3",V3['x'],V3['y'])
        
        #calcula el orden de los vectores si es necesario cambiarlo segun el determinante
        calculateOrders()
        
        
    globals()['flag'] = (globals()['flag'] + 1) % 3 
    
def keyPressed():
    print(key)
    if key == '+' and globals()['A'] < height:
        globals()['A']  += 10
    if key == '-' and globals()['A']  > 10:
        globals()['A']  -= 10
