//
// ktBOX1s
//
//


gap1 = 0.001;
gap2 = 0.002;

panel_thick = 2;
front_x = 95+5+panel_thick*2;
front_y = 72+1+panel_thick*2;
front_z = 25+panel_thick;
rear_x = front_x;
rear_y = front_y;
rear_z = 13+panel_thick;

hinge_x = 6.5;
hinge_y = front_y/3-0.3;
hinge_hole = 1.1+0.4;
hook_x = 6.5;
hook_y = front_y/3-0.3;
hook_z = 3;

board_thick = 1.5;
board_hole_x = 89.5;
board_hole_y = 66.15;

lcd_w = 28.03;
lcd_h = 35.04;
lcd_hole_x = 29;
lcd_hole_y = 53.5;
lcd_slope = 0.755;
lcd_gap = 3.3;

A = 1;
B = 1;
C = 1;



if( A ){
difference(){
    union(){
        //color( "Blue" )
        {
            cube( [front_x, front_y, panel_thick] );
            wall_x( 0, 0, 0, front_z );
            wall_x( 0, front_y-panel_thick, 0, front_z );
            wall_y( 0, 0, 0, front_z );
            wall_y( front_x-panel_thick, 0, 0, front_z );
            board_base( 0, 0, 0 );
            
            lcd_base( 20.5, 30.6, panel_thick );
            
            hook( -hinge_x, 0, 0, front_z );
            hook( -hinge_x, front_y-hook_y, 0, front_z );
            hinge( front_x, 0, 0, front_z );
            hinge( front_x, front_y-hinge_y, 0, front_z );
            
            //stopper
            translate( [front_x+hinge_x/2+0.25, 20, front_z+panel_thick] )
            rotate( [90, 0, 0] )
            cylinder( 1, 2, 2, center=true, $fn=30 );
            
            //LED
            translate( [63.5, 0, 0] ){
                translate( [-5.46+3-2.5/2, front_y-15-37.5-1+2, 13/2+panel_thick] )
                cube( [7+2.5, 7, 13], center=true );
            }
            
            //stand
            translate( [0, -7.5, 0] )
            cube( [5, 7.5, front_z+panel_thick] );            
            translate( [front_x-5, -7.5, 0] )
            cube( [5, 7.5, front_z+panel_thick] );            
            
            //Dell wall
            translate( [75, 54, panel_thick] )
            cube( [panel_thick, 21, 10] );
            translate( [75, 54, panel_thick] )
            cube( [27, panel_thick, 10] );
            translate( [75+14+2+2+panel_thick, 54, panel_thick] )
            cube( [panel_thick, 21, 10] );
        }
    }
    translate( [30/2, -gap1, front_z+panel_thick-10+gap1] )
    cube( [front_x-30, panel_thick+gap2, 10] );
    
    board_hole( (front_x-board_hole_x)/2, (front_y-board_hole_y)/2, front_z+panel_thick-board_thick);

    lcd_window( 20.5, 30.6 );
    lcd_hole( 20.5, 30.6, panel_thick );
    
    //stopper
    translate( [front_x+hinge_x/2+0.25, 20, front_z+panel_thick] )
    rotate( [90, 0, 0] )
    cylinder( 1+gap2, 1, 1, center=true, $fn=30 );
    
    translate( [63.5, 0, 0] ){
        //USB
        translate( [1.54, front_y-panel_thick/2+gap1, 13.5] )
        cube( [7.5, panel_thick+gap2*2, 5], center=true );
        
        //SW
        translate( [20+2.54, front_y-10.5, panel_thick/2] )
        cube( [8+0.6, 7, panel_thick+gap2*2], center=true );
        
        //LED
        translate( [-4.46, front_y-15-37.5, 0.5] )
        cube( [4, 2, 15] );
    }
    
    //plug rl
    translate( [76, front_y-panel_thick/2, 24.3] )
    cube( [2.5+2, 3, 9.5], center=true );
    
    //plug wd
    translate( [63.5, front_y-panel_thick/2, 25.6] )
    cube( [8.5, 3, 7], center=true );
    
    //del
    translate( [6, 12, -gap1] )
    cube( [8, 59, 10] );
    translate( [55, 12, -gap1] )
    cube( [40, 10-gap1, 10] );
    translate( [55, 54-gap2, -gap1] )
    cube( [20-gap1, 17+gap2, 10] );
    translate( [55, 29+gap1, -gap1] )
    cube( [40, 25-gap2, 10] );
    translate( [64.55, 19, -gap1] )
    cube( [30.45, 13, 10] );
    translate( [15, front_y-5, 10] )
    cube( [60-gap1, 10, 40] );
    translate( [14, -5, -gap1] )
    cube( [76, 10, 40] );
}
}

if( B ){
//translate( [0, front_y, front_z+rear_z+panel_thick*2] ){
//    rotate( [180, 0, 0] ){
translate( [0, 100, 0] ){
    rotate( [0, 0, 0] ){
        difference(){
            union(){
                //color( "Black" )
                {
                    cube( [front_x, front_y, panel_thick] );
                    wall_x( 0, 0, 0, rear_z );
                    wall_x( 0, front_y-panel_thick, 0, rear_z );
                    wall_y( 0, 0, 0, rear_z );
                    wall_y( front_x-panel_thick, 0, 0, rear_z );
                    
                    hook( -hinge_x, front_y/2-hook_y/2, 0, rear_z );
                    hinge( front_x, front_y/2-hinge_y/2, 0, rear_z );
                    
                    //stand
                    translate( [0, rear_y, 0] )
                    cube( [5, 7.5, rear_z+panel_thick] );            
                    translate( [rear_x-5, rear_y, 0] )
                    cube( [5, 7.5, rear_z+panel_thick] ); 
                }
            }
            //del
            translate( [10, -5, 5] )
            cube( [front_x-10-10, 10, rear_z] );
            translate( [10, front_y-5, 5] )
            cube( [front_x-10-10, 10, rear_z] );
        }
    }
}
}

if( C ){
//translate( [76.5+2.54, front_y-15+12.8, panel_thick+9.5] )
//rotate( [180, 0, 0] )
translate( [0, -30, 0] )
//color( "Black" )
sw( 0, 0, 0 );
}



module wall_x( x, y, z, h ){
    translate( [x, y, z+panel_thick] ){
        cube( [front_x, panel_thick, h] );
    }
}

module wall_y( x, y, z, h ){
    translate( [x, y, z+panel_thick] ){
        cube( [panel_thick, front_y, h] );
    }
}

module board_base( x, y, z=0 ){
    base_x = 10;
    base_y = 7;
    translate( [x, y, z] ){
        difference(){
            union(){
            translate( [panel_thick, panel_thick, panel_thick] )
            cube( [base_x, base_y, front_z-board_thick] );
            translate( [panel_thick, front_y-panel_thick-base_y, panel_thick] )
            cube( [base_x, base_y, front_z-board_thick] );
            translate( [front_x-panel_thick-10, panel_thick, panel_thick] )
            cube( [base_x, base_y, front_z-board_thick] );
            translate( [front_x-panel_thick-10, front_y-panel_thick-base_y, panel_thick] )
            cube( [base_x, base_y, front_z-board_thick] );
            }
            translate( [panel_thick-8, panel_thick-gap1, panel_thick+4.5] )
            rotate( [0, 45, 0] )
            cube( [base_x+6.5, base_y+gap2, front_z-board_thick] );
            translate( [panel_thick-8, front_y-panel_thick-base_y-gap1, panel_thick+4.5] )
            rotate( [0, 45, 0] )
            cube( [base_x+6.5, base_y+gap2, front_z-board_thick] );
            translate( [front_x-panel_thick-10+5, panel_thick-gap1, panel_thick-5.7] )
            rotate( [0, -45, 0] )
            cube( [base_x+6.5, base_y+gap2, front_z-board_thick] );
            translate( [front_x-panel_thick-10+5, front_y-panel_thick-base_y-gap1, panel_thick-5.7] )
            rotate( [0, -45, 0] )
            cube( [base_x+6.5, base_y+gap2, front_z-board_thick] );        }
    }
}
module board_hole( x, y, z=0 ){
    hole_height = 10;
    translate( [x, y, z-hole_height+gap1] ){
        translate( [0, 0, 0] )
        cylinder( hole_height, 1.6, 1.6, $fn=30 );
        translate( [0, 0, hole_height-(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
        translate( [board_hole_x, 0, 0] )
        cylinder( hole_height, 1.6, 1.6, $fn=8 );
        translate( [board_hole_x, 0, hole_height-(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
        translate( [0, board_hole_y, 0] )
        cylinder( hole_height, 1.6, 1.6, $fn=8 );
        translate( [0, board_hole_y, hole_height-(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
        translate( [board_hole_x, board_hole_y, 0] )
        cylinder( hole_height, 1.6, 1.6, $fn=8 );
        translate( [board_hole_x, board_hole_y, hole_height-(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
    }
}

module hinge( x, y, z, h ){
    translate( [x, y, z] ){
        difference(){
            union(){
                cube( [hinge_x, hinge_y, h+panel_thick] );
                translate( [hinge_x/2+0.25, hinge_y/2, h+panel_thick] )
                rotate( [90, 0, 0] )
                cylinder( hinge_y, hinge_x/2-0.25, hinge_x/2-0.25, center=true, $fn=30 );
            }
            translate( [hinge_x/2+0.25, hinge_y/2, h+panel_thick] )
            rotate( [90, 0, 0] )
            cylinder( hinge_y+gap2, hinge_hole, hinge_hole, center=true, $fn=30 );
        }
    }
}

module hook( x, y, z, h ){
    translate( [x, y, z] ){
        difference(){
            union(){
                cube( [hook_x, hook_y, h+panel_thick] );
                translate( [0, 0, h+panel_thick] )
                cube( [hook_x, hook_y, hook_z] );
             }
        }
    }
}


module lcd_window( x, y, z=0 ){
    translate( [x, y, z-gap1] )
    cube( [lcd_w, lcd_h, panel_thick+gap1] );
    translate( [x+lcd_w/2, y+lcd_h/2, z-gap1] )
    scale( [lcd_w*lcd_slope, lcd_h*lcd_slope, lcd_h*lcd_slope] )
    rotate( [0, 0, 45] )
    cylinder( 1, 1, 0, $fn=4 );
}
module lcd_base( x, y, z ){
    translate( [x-0.5, y-12, z] ){
        translate( [0, -0.6, lcd_gap/2] )
        cube( [8, 7, lcd_gap], center=true );
        translate( [lcd_hole_x, -0.6, lcd_gap/2] )
        cube( [8, 7, lcd_gap], center=true );
        translate( [0, lcd_hole_y+0.6, lcd_gap/2] )
        cube( [8, 7, lcd_gap], center=true );
        translate( [lcd_hole_x, lcd_hole_y+0.6, lcd_gap/2] )
        cube( [8, 7, lcd_gap], center=true );
    }
}
module lcd_hole( x, y, z ){
    translate( [x-0.5, y-12, z-1.2+gap1] ){
        cylinder( 6-1.5, 1.6, 1.6, $fn=8 );
        translate( [lcd_hole_x, 0, 0] )
        cylinder( 6-1.5, 1.6, 1.6, $fn=8 );
        translate( [0, lcd_hole_y, 0] )
        cylinder( 6-1.5, 1.6, 1.6, $fn=8 );
        translate( [lcd_hole_x, lcd_hole_y, 0] )
        cylinder( 6-1.5, 1.6, 1.6, $fn=8 );
        
        translate( [0, 0, (6-1.5)-(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
        translate( [lcd_hole_x, 0, (6-1.5)-(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
        translate( [0, lcd_hole_y, (6-1.5)-(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
        translate( [lcd_hole_x, lcd_hole_y, (6-1.5)-(2.4+0.15)] )
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
    }
}


module sw( x, y, z=0 ){
    translate( [x, y, z] ){
        difference(){
            union(){
                cube( [14, 14, 8-0.5] );
                translate( [0, 0, 8-0.5] )
                cube( [1, 14, 1.5] );
                translate( [14-1, 0, 8-0.5] )
                cube( [1, 14, 1.5] );
                translate( [14/2-8/2, 14/2-4/2, 8-0.5] )
                cube( [8, 4, panel_thick+5] );
                translate( [-1.6, 0, 0] )
                cube( [1.6, 14, 2] );
                translate( [14, 0, 0] )
                cube( [1.6, 14, 2] );
            }
            translate( [14/2-2.3/2, 14/2-2.3/2, 0-gap1] )
            cube( [2.3, 2.3, 2.5] );
        }
    }
}