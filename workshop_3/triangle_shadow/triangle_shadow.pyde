'''
COMO EN LAS PANTALLAS, el plano de referencia en Y aumenta hacia la parte inferior de la pantalla se infiere que los calculos de las funciones edge dan negativas cuando
se está en orientación antihoraria, sentido en el que se debe tener segun las fórmulas y teorias 
'''

V1 = {'x':75,'y':75,'z':100,'color':color(255,0,0)}
V2 = {'x':25,'y':140,'z':100,'color':color(0,255,0)}
V3 =  {'x':100,'y':150,'z':100,'color':color(0,0,255)}
color_yellow = color(255,255,0)

def setup():
    
    size(200, 200, P3D);
    '''
    background(100);
    fill(51);
    stroke(255);
    translate(50, 50, 0);
    #rectMode(CENTER);
    rotateX(PI/4);
    #rotateY(PI/4);
    #rotateZ(PI/4);
    rect(0, 0, 100, 100);
    triangle(20,20,20,50,40,50)
    '''
    #size(200, 200)

    
def draw():
   #noLoop()
    background(128);
    
    loadPixels()
    for x in range(200):
        for y in range(200):
            loc = x+y*200
            pixels[loc] = get_baricentric_coor(x,y)
            #print("pixel",x,y)               
    updatePixels()
    
                
def edge_function(ini_vector,end_vector,pixel):
    #a = (ini_vector['y']-end_vector['y'])*pixel[0] + (end_vector['x']-ini_vector['x'])*pixel[1] + (ini_vector['x']*end_vector['y'] - ini_vector['y']*end_vector['x'])
    determinant = (end_vector['x']-ini_vector['x'])*(pixel[1]-ini_vector['y']) - (end_vector['y']-ini_vector['y'])*(pixel[0]-ini_vector['x'])
    return float(determinant)

def get_baricentric_coor(x,y):
    loc = x+y*200
    current_color = color(pixels[loc])
    '''
    F12 = edge_function(V2,V1,(x,y))
    F23 = edge_function(V1,V3,(x,y))
    F31 = edge_function(V3,V2,(x,y))
    '''
    F12 = edge_function(V1,V2,(x,y))
    F23 = edge_function(V2,V3,(x,y))
    F31 = edge_function(V3,V1,(x,y))
    #print("F12",F12)
    #print("F23",F23)
    #print("F31",F31)
    if F12 > 0 or F23 > 0 or F31 > 0:
        return current_color
    w1 = F23
    w2 = F31
    w3 = F12
    paralelogram_area = F12 + F23 + F31
    l1 = w1/paralelogram_area
    l2 = w2/paralelogram_area 
    l3 = w3/paralelogram_area
    
    zP=l1*V1['z']+l2*V2['z']+l3*V3['z']
    zp=zP/100
    #print(zP)
    
    return color(zp*255*l1,zp*255*l2,zp*255*l3)

def keyPressed():
    
    if key == '+':
        V1['z']+=10
    if key == '-':
        V1['z']-=10        
    
    print(V1['z'])
