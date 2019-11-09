counter: int = 0;
name: string = "Jon";
average: float = 0.5 * (x+y);

counter: int;
name: string;
average: float;

// A function that accepts 3 floats as parameters and returns a float
sum :: (x: float, y: float, z: float) -> float {
    return x + y + z;
    print("Sum: %\n", sum(1, 2, 3));
}

/*
*
* Let's test some multi-line comments
*
*/

/* and some single line */


Vector3 :: struct {
    x: float;
    y: float;
    z: float;
}

a: [50] int; // An array of 50 integers
b: [..] int; // A dynamic array of integers

print_int_array :: (a: [] int) {
    n := a.count;
    for i : 0..n-1 {
        print("array[%] = %\n", i, a[i]);
    }
}

generate_linear_srgb :: () -> [] float {
     srgb_table: float[SRGB_TABLE_SIZE];
     for srgb_table {
         << it = real_linear_to_srgb(cast(float)it_index / SRGB_TABLE_SIZE)
     }
     return srgb_table;
}

srgb_table: [] float = #run generate_linear_srgb(); // #run invokes the compile time execution

real_linear_to_srgb :: (f: float) -> float {
    table_index := cast(int)(f * SRGB_TABLE_SIZE);
    return srgb_table[table_index];
}

draw_particles :: () {
    view_left: Vector3 = get_view_left();
    view_up: Vector3 = get_view_up();

    for particles {
        // Inside for loops the "it" object is the iterator for the current object.
        particle_left := view_left * it.particle_size;
        particle_up := view_up * it.particle_size;

        // m is a global object that helps us build meshes to send to the graphics API
        m.Position3fv(it.origin - particle_left - particle_up);
        m.Position3fv(it.origin + particle_left - particle_up);
        m.Position3fv(it.origin + particle_left + particle_up);
        m.Position3fv(it.origin - particle_left + particle_up);
    }
}

draw_quad :: (origin: Vector3, left: Vector3, up: Vector3) [m] {
    m.Position3fv(origin - left - up);
    m.Position3fv(origin + left - up);
    m.Position3fv(origin + left + up);
    m.Position3fv(origin - left + up);
};

draw_particles :: () {
    view_left: Vector3 = get_view_left();
    view_up: Vector3 = get_view_up();

    for particles {
        particle_left:= view_left * it.particle_size;
        particle_up:= view_up * it.particle_size;

        draw_quad(particle_left, particle_up, origin);
    }
}

Entity :: struct SOA {
    position : Vector3;
    orientation : Quaternion
    // .. many other members here
}


test_func :: (using e1: $T, e2: T) {
    all_entities : [4] Entity;
    for k : 0..all_entities.count-1
        update_position(&all_entities[k].position);
    
    for k : 0..all_entities.count-1
        update_orientation(&all_entities[k].orientation);
}

sum :: (a: $T, b: T) -> T {
    f1: float = 1;
    f2: float = 2;
    f3 := sum(f1, f2);
    
    i1: int = 1;
    i2: int = 2;
    i3 := sum(i1, i2);
    
    x := sum(f1, i1);
    print_any :: (a: Any) {
        if a.type.type == Type_Info_Tag.FLOAT
            print("a is a float\n");
        else if a.type.type == Type_Info_Tag.INT
            print("a is an int\n");
    }
    
    print("% % %\n", f3, i3, x); // Output is "3.000000 3 2.000000"
    return a + b;
}

node :: struct {
    owned_a : !*node = null;
    owned_b : !* node = null;
}

example: node = new node;
example.owned_a = new node;
example.owned_b = new node;

delete example; // owned_a and owned_b are also deleted.
