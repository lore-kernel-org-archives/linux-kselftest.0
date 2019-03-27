From: dan.carpenter at oracle.com (Dan Carpenter)
Date: Wed, 27 Mar 2019 10:32:04 +0300
Subject: [bug report] selftests: cgroup: add memory controller self-tests
Message-ID: <20190327073204.GA15448@kadam>

Hello Roman Gushchin,

The patch 84092dbcf901: "selftests: cgroup: add memory controller
self-tests" from May 11, 2018, leads to the following static checker
warning:

	./tools/testing/selftests/cgroup/test_memcontrol.c:77 test_memcg_subtree_control()
	error: uninitialized symbol 'child2'.

./tools/testing/selftests/cgroup/test_memcontrol.c
    27 static int test_memcg_subtree_control(const char *root)
    28 {
    29 	char *parent, *child, *parent2, *child2;
                               ^^^^^^^^^^^^^^^^
    30 	int ret = KSFT_FAIL;
    31 	char buf[PAGE_SIZE];
    32 
    33 	/* Create two nested cgroups with the memory controller enabled */
    34 	parent = cg_name(root, "memcg_test_0");
    35 	child = cg_name(root, "memcg_test_0/memcg_test_1");
    36 	if (!parent || !child)
    37 		goto cleanup;
                ^^^^^^^^^^^^

    38 
    39 	if (cg_create(parent))
    40 		goto cleanup;
    41 
    42 	if (cg_write(parent, "cgroup.subtree_control", "+memory"))
    43 		goto cleanup;
    44 
    45 	if (cg_create(child))
    46 		goto cleanup;
    47 
    48 	if (cg_read_strstr(child, "cgroup.controllers", "memory"))
    49 		goto cleanup;
    50 
    51 	/* Create two nested cgroups without enabling memory controller */
    52 	parent2 = cg_name(root, "memcg_test_1");
    53 	child2 = cg_name(root, "memcg_test_1/memcg_test_1");
    54 	if (!parent2 || !child2)
    55 		goto cleanup;
    56 
    57 	if (cg_create(parent2))
    58 		goto cleanup;
    59 
    60 	if (cg_create(child2))
    61 		goto cleanup;
    62 
    63 	if (cg_read(child2, "cgroup.controllers", buf, sizeof(buf)))
    64 		goto cleanup;
    65 
    66 	if (!cg_read_strstr(child2, "cgroup.controllers", "memory"))
    67 		goto cleanup;
    68 
    69 	ret = KSFT_PASS;
    70 
    71 cleanup:
    72 	cg_destroy(child);
    73 	cg_destroy(parent);
    74 	free(parent);
    75 	free(child);
    76 
--> 77 	cg_destroy(child2);
        ^^^^^^^^^^^^^^^^^
    78 	cg_destroy(parent2);
        ^^^^^^^^^^^^^^^^^^
    79 	free(parent2);
    80 	free(child2);
    81 
    82 	return ret;
    83 }

regards,
dan carpenter
