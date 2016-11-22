<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>

## 1 - a

The matrix M you recovered from the normalized points(3x4)

$$
\begin{bmatrix}
0.7678583 & -0.4938480 & -0.0233978 & 0.0067444 \\
-0.0852134 & -0.0914682 & -0.9065233 & -0.0877568 \\
0.1826502 & 0.2988292 & -0.0741924 & 1 \\
\end{bmatrix}
$$


The < u, v > projection of the last point given your M matrix 

$$
\begin{bmatrix}
0.230255 \\
-0.733151 \\
\end{bmatrix}
$$

The residual between that projected location and the actual one given

$$
0.3311468 \\
0.0366748 \\ 
0.3307520 \\
0.3270174 \\
0.3691145 \\
0.2260546 \\
0.6621557 \\
0.4471918 \\
0.0620970 \\
0.6713163 \\
0.2645835 \\
0.1547889 \\
0.3328788 \\
0.2957651 \\
0.4789042 \\
0.6887012 \\
$$

## 1 - b

Average residual for each trial of each k (10x3)

$$
\begin{bmatrix}
0.54197 &  0.79157 &  0.67537 \\
0.79344 &  0.81156 &  0.67144 \\
0.60739 &  0.89174 &  0.78361 \\
0.74070 &  0.75056 &  1.07775 \\
0.81784 &  0.57962 &  0.73812 \\
0.74839 &  0.84538 &  1.07590 \\
0.77192 &  0.84533 &  0.84965 \\
0.81931 &  0.70716 &  1.05079 \\
0.69495 &  0.78912 &  0.54777 \\
0.45516 &  0.74748 &  0.56262 \\
\end{bmatrix}
$$

Explain any difference you see between the results for the different k’s

* it seems the larger the k, the worse the match is. overfitting?

The best M matrix (3x4) 

$$
\begin{bmatrix}
 0.7670573 & -0.4980520 & -0.0129625 &  0.0083361 \\
-0.0852856 & -0.0878271 & -0.9127388 & -0.0889733 \\
 0.1829259 &  0.2975254 & -0.0704165 &  1.0000000 \\
\end{bmatrix}
$$

## 1 - c

The location of the camera in real 3D world coordinates 

$$
\begin{bmatrix}
-1.53427 \\
-2.35330 \\
 0.27232 \\
end{bmatrix}
$$

## 2 - a

The fundamental matrix generated from your least squares function

$$
\begin{bmatrix}
-6.6068e-007 & 7.9064e-006 & -1.8848e-003 \\
 8.8267e-006 & 1.2186e-006 &  1.7228e-002 \\
-9.0854e-004 & -2.6420e-002 & 1.0000e+000 \\
\end{bmatrix}
$$

Fundamental matrix 

$$
\begin{bmatrix}
-5.3588e-007 & 7.8997e-006 & -1.8848e-003 \\
8.8382e-006 & 1.2180e-006 & 1.7228e-002 \\
-9.0854e-004 & -2.6420e-002 & 1.0000e+000 \\
\end{bmatrix}
$$
