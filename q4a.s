.pos 0x0		 # start
                 ld   $sb, r5					# sp = address of last word of stack
                 inca r5						# sp = address of word after stack
                 gpc  $6, r6                    # r6 = pc + 6
                 j    0x300						# call main()
                 halt                     
.pos 0x100
                 .long 0x00001000               # int * e
.pos 0x200		                                # foo(int c, int d)
                 ld   (r5), r0					# r0 = c
                 ld   4(r5), r1					# r1 = d
                 ld   $0x100, r2                # r2 = &e
                 ld   (r2), r2                  # r2 = e
                 ld   (r2, r1, 4), r3           # r3 = e[d]
                 add  r3, r0                    # r0 = c + e[d]
                 st   r0, (r2, r1, 4)           # e[d] += c
                 j    (r6)                      # return
.pos 0x300										# main()
                 ld   $-12, r0					# r0 = -12 = -(size of callee's part of main's frame)
                 add  r0, r5					# allocate callee part of main's frame
                 st   r6, 8(r5)					# save ra on stack
                 ld   $1, r0					# r0 = 1 = value of a
                 st   r0, (r5)					# save a on the stack
                 ld   $2, r0					# r0 = 2 = value of b
                 st   r0, 4(r5)					# save b on the stack
                 ld   $-8, r0					# r0 = -8 = -(size of caller's part of foo's frame)
                 add  r0, r5					# allocate caller's part of foo's frame
                 ld   $3, r0					# r0 = 3 = value of c
                 st   r0, (r5)                  # save c on the stack
                 ld   $4, r0                    # r0 = 4 = value of d
                 st   r0, 4(r5)                 # save d on the stack
                 gpc  $6, r6                    # set return address
                 j    0x200						# call foo(3, 4)
                 ld   $8, r0                    # r0 = 8 = size of caller part of foo's frame
                 add  r0, r5                    # deallocate caller part of foo's frame
                 ld   (r5), r1                  # r1 = c
                 ld   4(r5), r2                 # r2 = d
                 ld   $-8, r0                   # r0 = -8
                 add  r0, r5                    # allocate caller's part of main's frame
                 st   r1, (r5)                  # save c on the stack
                 st   r2, 4(r5)                 # save d on the stack
                 gpc  $6, r6                    # save return address
                 j    0x200                     # call foo(3, 4)
                 ld   $8, r0                    # r0 = 8 = size of caller part of foo's frame
                 add  r0, r5                    # deallocate caller part of foo's frame
                 ld   8(r5), r6                 # load return address from stack
                 ld   $12, r0                   # r0 = 12 = size of callee part of foo's frame
                 add  r0, r5                    # deallocate calle part of foo's frame
                 j    (r6)                      # return
.pos 0x1000
                 .long 0
                 .long 0
                 .long 0
                 .long 0
                 .long 0
                 .long 0
                 .long 0
                 .long 0
                 .long 0
                 .long 0
.pos 0x8000
# These are here so you can see (some of) the stack contents.
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
sb: .long 0
