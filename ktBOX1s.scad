//
// ktBOX1
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
hook_z = 2.5;

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
B = 0;//1;
C = 0;//1;



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
            translate( [front_x, hinge_y, 0] )
            
            //hinge
            cube( [hinge_x, front_y-hinge_y*2, hinge_x] );
            translate( [-hinge_x, hinge_y, 0] )
            cube( [hinge_x, front_y-hinge_y*2, hinge_x] );
            
            //stopper
            translate( [front_x+hinge_x/2+0.25, 20, front_z+panel_thick] )
            rotate( [90, 0, 0] )
            cylinder( 1, 2, 2, center=true, $fn=30 );
            
            //LED
            translate( [63.5, 0, 0] ){
                translate( [-7-1, front_y-15-37.5-1, panel_thick] )
                cube( [6, 4, 12.5] );
            }
        }
    }
    translate( [30/2, -gap1, front_z+panel_thick-10+gap1] )
    cube( [front_x-30, panel_thick+gap2, 10] );
    
    board_hole( (front_x-board_hole_x)/2, (front_y-board_hole_y)/2, front_z+panel_thick-board_thick);

    lcd_window( 20.5, 30.6 );
    lcd_hole( 20.5, 30.6, panel_thick );

    //hinge
    translate( [front_x+hinge_x, hinge_y-gap1, -hinge_x] )
    rotate( [0, -45, 0] )
    cube( [hinge_x*sqrt(2), front_y-hinge_y*2+gap2, hinge_x*sqrt(2)] );
    translate( [-hinge_x, hinge_y-gap1, -hinge_x] )
    rotate( [0, -45, 0] )
    cube( [hinge_x*sqrt(2), front_y-hinge_y*2+gap2, hinge_x*sqrt(2)] );
    
    //stopper
    translate( [front_x+hinge_x/2+0.25, 20, front_z+panel_thick] )
    rotate( [90, 0, 0] )
    cylinder( 1+gap2, 1, 1, center=true, $fn=30 );
    
    translate( [63.5, 0, 0] ){
        //USB
        translate( [1.25, front_y-panel_thick/2+gap1, 13.5] )
        cube( [7.5, panel_thick+gap2*2, 5], center=true );
        
        //SW
        /*translate( [20, front_y-10.5, panel_thick/2] ){
            cube( [10+0.6, 6, panel_thick+gap2*2], center=true );
            translate( [0, 6/2, 0] )
            rotate( [-45, 0, 0] )
            cube( [10+0.6, 6, panel_thick+gap2*2], center=true );
            translate( [0, -6/2, 0] )
            rotate( [45, 0, 0] )
            cube( [10+0.6, 6, panel_thick+gap2*2], center=true );
        }*/
        
        //LED
        translate( [-7, front_y-15-37.5, 0.5] )
        cube( [4, 2, 15] );
    }
    
    //plug rl
    translate( [76, front_y-panel_thick/2, 24.3] )
    cube( [2.5+2, 3, 9.5], center=true );
    
    //plug wd
    translate( [63.5, front_y-panel_thick/2, 25.6] )
    cube( [8.5, 3, 7], center=true );
    
    //del
    translate( [4, 12, -gap1] )
    cube( [10, 59, 10] );
    translate( [55, 12, -gap1] )
    cube( [45, 10, 10] );
    translate( [55, 29, -gap1] )
    cube( [45, 42, 10] );
    translate( [63, 19, -gap1] )
    cube( [37, 13, 10] );
    translate( [15, front_y-5, 10] )
    cube( [40, 10, 40] );
    translate( [14, -5, -gap1] )
    cube( [76, 10, 40] );
    //translate( [-20, -10, -gap1] )
    //cube( [20, 100, 40] );
    //translate( [front_x, -10, -gap1] )
    //cube( [20, 100, 40] );
}
}

if( B ){
//translate( [76.5, front_y-15+12.8, panel_thick+9.5] )
//rotate( [180, 0, 0] )
translate( [0, -20, 0] )
sw( 0, 0, 0 );
}

if( C ){
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
                }
            }
        }
    }
}
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
            translate( [0, -gap1, 0] )
            rotate( [0, 45, 0] )
            cube( [hinge_x*sqrt(2), hinge_y+gap2, hinge_x*sqrt(2)] );
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
            translate( [0, -gap1, -hook_x] )
            rotate( [0, -45, 0] )
            cube( [hook_x*sqrt(2), hook_y+gap2, hook_x*sqrt(2)] );
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
            //color( "Black" )
            union(){
                cube( [14, 14, 9.5] );
                translate( [14/2-10/2, 14/2-4/2, 9.5] )
                cube( [10, 4, panel_thick+4] );
            }
            translate( [14/2-3.8/2, 14/2-2.5/2, 0-gap1] )
            cube( [3.8, 2.5, 2.5] );
        }
    }
}
