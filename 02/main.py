from circumscribed_circle import Point, CircumscribedCircle
import numpy as np
import matplotlib.pyplot as plt


def load_point():
    print("Specify a point:")
    return Point(*[float(x) for x in input().split(",")])


if __name__ == "__main__":
    try:
        print("Specify three points, each separated on a new line (format of a point \"1.25,1\")")
        c = CircumscribedCircle(load_point(), load_point(), load_point())
    except:
        print("Failed to parse points of the triangle")
        exit()

    # compute optimal viewport
    start_x, end_x = min(c.a.x, c.b.x, c.c.x), max(c.a.x, c.b.x, c.c.x)
    start_y, end_y = min(c.a.y, c.b.y, c.c.y), max(c.a.y, c.b.y, c.c.y)

    padding_x =(end_x - start_x) * .5
    padding_y =(end_y - start_y) * .5
    
    # apply optimal viewport
    plt.axis('square')
    plt.xlim(start_x - padding_x, end_x + padding_x)
    plt.ylim(start_y - padding_y, end_y + padding_y)

    # add a grid to the canvas 
    plt.grid()

    # draw the circumscribed scircle
    c.draw(plt)
    
    # display the plot
    plt.show()
