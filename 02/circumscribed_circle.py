import math
import numpy as np


class CircumscribedCircle:
    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c

    def draw(self, plt):
        """Draws the circumscribed circle as well as the triangle"""

        # draw triangle sides
        self.draw_lines(plt)

        # draw centers of triangle's sides
        self.draw_side_centers(plt)

        # compute circumccenter
        circumcenter, radius = self.circumcenter()

        # circumbscribe the triangle
        self.draw_circle(circumcenter, radius, plt)

        # highlight the circumcenter
        self.draw_cross(circumcenter, plt)

    def draw_line(self, a, b, plt):
        """Draws a line between the two given points"""
        arr_x = np.array([a.x, b.x])
        arr_y = np.array([a.y, b.y])
        
        plt.plot(arr_x, arr_y, color=(0.,0.,1.))

    def draw_lines(self, plt):
        """Draws lines between three points of the triangle"""
        self.draw_line(self.a, self.b, plt)
        self.draw_line(self.b, self.c, plt)
        self.draw_line(self.c, self.a, plt)

    def draw_side_centers(self, plt):
        """Draws crosses at the center of each line of the triangle"""
        self.draw_side_center(self.a, self.b, plt)
        self.draw_side_center(self.b, self.c, plt)
        self.draw_side_center(self.c, self.a, plt)
   
    def draw_side_center(self, a, b, plt):
        """Draws a cross at the center of the side"""
        center = a.center_to(b)
        self.draw_cross(center, plt)

    def draw_circle(self, a, r, plt):
        """Draws a circle with the center at the point `a` with radius of `r` """
        phis = np.arange(0, 2 * math.pi, 0.01)
        plt.plot(*self.xy(r, phis, a.x, a.y), ls='-', color=(1.,0.,1.))

    def draw_cross(self, a, plt):
        """Draws a cross at the given point"""
        size = 0.05
        plt.plot(np.array([a.x + size, a.x - size]), np.array([a.y - size, a.y + size]), color=(1.0,0., 0.)) 
        plt.plot(np.array([a.x + size, a.x - size]), np.array([a.y + size, a.y - size]), color=(1.0,0., 0.5))

    def circumcenter(self):
        """Computes the circumcenter as well as the radius of the circumscribed circle"""
        ax = self.a.x
        bx = self.b.x
        cx = self.c.x
        ay = self.a.y
        by = self.b.y
        cy = self.c.y

        d = 2 * (ax * (by - cy) + bx * (cy - ay) + cx * (ay - by))
        
        if d <= 0:
            # diameter cannot be smaller than zero
            print("Not a triangle...")
            exit()

        ux = ((ax**2 + ay**2) * (by - cy) + (bx**2 + by**2) * (cy - ay) + (cx**2 + cy**2) * (ay - by)) / d
        uy = ((ax**2 + ay**2) * (cx - bx) + (bx**2 + by**2) * (ax - cx) + (cx**2 + cy**2) * (bx - ax)) / d
        
        return Point(ux, uy), Point(ux, uy).distance_to(self.a)


    def xy(self, r, phi, x, y):
        """Computes X and Y coordinate from phi and radius"""
        return r * np.cos(phi) + x, r * np.sin(phi) + y


class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def distance_to(a, b):
        """Computes the distance between two points"""
        return math.sqrt((a.x - b.x)**2 + (a.y - b.y)**2)

    def center_to(self, b):
        """Computes the coordinates of a point between two points"""
        return Point((self.x + b.x) / 2, (self.y + b.y) / 2)


