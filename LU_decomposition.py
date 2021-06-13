def LU(A):
    n = len(A)  # Give us total of lines

    b = [0 for i in range(n)]  # set vector b = 0 for every element

    for i in range(0, n):  # set vector b to be the last column of matrix A
        b[i] = A[i][n]

    j = i  # set j = i to create dimensional vector, which is a matrix because matrix is in form of L[i][j]

    L = [[0 for i in range(n)], [0 for j in range(i + 1)]]  # set the matrix L to 0 for all elements it contains

    for i in range(0, n):  # traverse through the whole matrix where i runs from 0 --> n respectively
        L[i][i] = 1  # here, you can actually write L[i][i] since you want to set the matrix to be identical,
        # which only contains 1s in the diagonal line and 0 else where

    U = [[0 for i in range(0, n)], [0 for j in range(i + 1)]]  # set the matrix U to 0 for all elements it contains

    for i in range(0, n):  # traverse i through the range from 0 --> n
        for j in range(0, n):   # for every i, traverse j from 0 --> n, exit the loop when j = n. For example,
            # for i = 0, we would have have j = 0 & j = 1 before we get to i = 1
            U[i][j] = A[i][j]   # assign elements of matrix U to be respectively the same with elements from matrix
            # A. So U11 = A11, U12 = A12 and so on

    n = len(U)

    # (4) Find both U and L matrices
    for i in range(0, n):  # for i in [0,1,2,..,n]
        # (4.1) Find the maximun value in a column in order to change lines
        maxElem = abs(U[i][i])
        maxRow = i
        for k in range(i + 1, n):  # Interacting over the next line
            if (abs(U[k][i]) > maxElem):
               maxElem = abs(U[k][i])  # Next line on the diagonal
               maxRow = k
    print(U)
    print(maxElem, maxRow)


A =  [5,4 , 6], [2,1,3]
print(LU(A))
