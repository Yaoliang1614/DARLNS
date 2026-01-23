# DARLNS, Paper is preparing to submit to the journal.


<<<<<<< HEAD
1、All the codes run on MATLAB 2019b.
=======
1、All the codes is our offering demo, which runs on MATLAB 2019b.

2、demo.m is the main file of our method, which includes the loading of data, subspace learning and clustering.  It is the entrance of codes.

3、DARLNS is the our algorithm. Domint\_Affinity\_representation.m is our DAR, and TNNfromPython is tensor nuclear norm of low-rank tensor.

4、Tools is the tool box of our methods, which  is used.

5、ORL\_32x32.mat and Yale\_32x32.mat are our offering datasets as examples to run our method.


\#############################################################################

# Parameter Settings
---
 $\alpha =[0.01, 0.05, 0.1, 0.5, 1, 5, 10, 50]$ and $k=[5, 10, 15, 20, 25, 50, 75, 100]$.  
 The better clustering can be tunned by the carefully gird searching near parameters that we give the range of the above.

# Clustering results on our examples
| Method       | ORL - ACC       | ORL - NMI       | Yale - ACC      | Yale - NMI      |
|--------------|-----------------|-----------------|-----------------|-----------------|
| LSR          | 0.710±0.024     | 0.843±0.12      | 0.530±0.021     | 0.553±0.015     |
| LRR          | 0.710±0.015     | 0.826±0.006     | 0.539±0.020     | 0.550±0.015     |
| SSR          | 0.756±0.017     | 0.875±0.009     | 0.532±0.024     | 0.590±0.015     |
| AOPL_root    | 0.615±0.000     | 0.809±0.000     | 0.461±0.000     | 0.488±0.000     |
| IDRS         | 0.692±0.020     | 0.832±0.010     | 0.522±0.005     | 0.558±0.009     |
| SDSGC        | 0.554±0.000     | 0.774±0.000     | 0.473±0.035     | 0.507±0.010     |
| RLSR/MVCP    | 0.953±0.031     | 0.986±0.009     | 0.721±0.049     | 0.767±0.038     |
| CDSESLRTL    | 0.921±0.019     | 0.965±0.007     | 0.888±0.050     | 0.915±0.030     |
| DARLNS       | 1.000±0.000     | 1.000±0.000     | 1.000±0.000     | 1.000±0.000     |

  

<<<<<<< HEAD
If you have any questions, please contact me with QQ:2508466534 or Email:2508466534@qq.com  
=======
If you have any questions, please contact me with QQ:2508466534 or Email:2508466534@qq.com  
>>>>>>> 262f7241baf3db73cd9d20f72ee499c284083d0d
