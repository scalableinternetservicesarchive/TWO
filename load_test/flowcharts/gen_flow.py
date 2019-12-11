sess_cnt = 1
with open("../gen.sh") as handle:
    for line in handle:
        if line.startswith("SESS"):
            with open("session"+str(sess_cnt)+".flowchart", "w") as f:
                print("st=>start: start", file=f)
                print("e=>end", file=f)
                for i, trans in enumerate(line[6:-2].split()):
                    if trans.startswith('"'):
                        trans = trans[1:-1]
                        print("op"+str(i)+"=>operation: "+trans, file=f)
                    else:
                        print("op"+str(i)+"=>operation: think "+trans+"s", file=f)
                print("st(right)->op0", file=f)

                for j in range(1, i+1): 
                    if j%10 < 5: direction = "right"
                    if j%10 > 5: direction = "right"
                    if j%5 == 0: direction = "right"
                    print("op"+str(j-1) +"("+direction+")->op" + str(j), file=f)

                print("op"+str(i) + "(right)->e", file=f)

            sess_cnt = sess_cnt + 1
