From: dan.carpenter@oracle.com (Dan Carpenter)
Date: Wed, 27 Mar 2019 10:29:06 +0300
Subject: [bug report] x86/mpx, selftests: Add MPX self test
Message-ID: <20190327072906.GA14812@kadam>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190327072906.tAeo-BTnTZXThD48PeucMTYqYbPzVmHdjGfmZLf987g@z>

Hello Dave Hansen,

The patch e754aedc26ef: "x86/mpx, selftests: Add MPX self test" from
Jun 8, 2016, leads to the following static checker warning:

	./tools/testing/selftests/x86/mpx-dig.c:435 inspect_pid()
	error: uninitialized symbol 'inspect_self'.

./tools/testing/selftests/x86/mpx-dig.c
    411 int inspect_pid(int pid)
    412 {
    413 	static int dig_nr;
    414 	long offset_inside_bounds_dir;
    415 	char bounds_dir_buf[sizeof(unsigned long) * (1UL << 15)];
    416 	char *dig_bounds_dir_ptr;
    417 	int total_entries = 0;
    418 	int nr_populated_bdes = 0;
    419 	int inspect_self;
                    ^^^^^^^^^^^^

    420 
    421 	if (getpid() == pid) {
    422 		dprintf4("inspecting self\n");
    423 		inspect_self = 1;
                        ^^^^^^^^^^^^^^^^

    424 	} else {
    425 		dprintf4("inspecting pid %d\n", pid);
    426 		mpx_dig_abort();
                        ^^^^^^^^^^^^^^^
Maybe this doesn't return?

    427 	}
    428 
    429 	for (offset_inside_bounds_dir = 0;
    430 	     offset_inside_bounds_dir < MPX_BOUNDS_TABLE_SIZE_BYTES;
    431 	     offset_inside_bounds_dir += sizeof(bounds_dir_buf)) {
    432 		static int bufs_skipped;
    433 		int this_entries;
    434 
--> 435 		if (inspect_self) {
                            ^^^^^^^^^^^^
This is never set to zero.

    436 			dig_bounds_dir_ptr =
    437 				fill_bounds_dir_buf_self(offset_inside_bounds_dir,
    438 							 sizeof(bounds_dir_buf),
    439 							 &bounds_dir_buf[0]);
    440 		} else {
    441 			dig_bounds_dir_ptr =
    442 				fill_bounds_dir_buf_other(offset_inside_bounds_dir,
    443 							  sizeof(bounds_dir_buf),
    444 							  &bounds_dir_buf[0]);
    445 		}
    446 		if (!dig_bounds_dir_ptr) {
    447 			bufs_skipped++;
    448 			continue;
    449 		}
    450 		this_entries = search_bd_buf(dig_bounds_dir_ptr,
    451 					sizeof(bounds_dir_buf),
    452 					offset_inside_bounds_dir,
    453 					&nr_populated_bdes);
    454 		total_entries += this_entries;
    455 	}
    456 	printf("mpx dig (%3d) complete, SUCCESS (%8d / %4d)\n", ++dig_nr,
    457 			total_entries, nr_populated_bdes);
    458 	return total_entries + nr_populated_bdes;
    459 }

regards,
dan carpenter
