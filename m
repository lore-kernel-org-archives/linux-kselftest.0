From: dan.carpenter@oracle.com (Dan Carpenter)
Date: Tue, 26 Jun 2018 12:03:48 +0300
Subject: [bug report] selftests: cgroup: add memory controller self-tests
Message-ID: <20180626090347.cuwod4fv5koqbu63@kili.mountain>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180626090348.HSBFjJPOV6KbjJW6DDufMN1Y478szLICyJFXid-1WVA@z>

Hello Roman Gushchin,

The patch 84092dbcf901: "selftests: cgroup: add memory controller
self-tests" from May 11, 2018, leads to the following static checker
warning:

	./tools/testing/selftests/cgroup/test_memcontrol.c:76 test_memcg_subtree_control()
	error: uninitialized symbol 'child2'.

./tools/testing/selftests/cgroup/test_memcontrol.c
    69  
    70  cleanup:
    71          cg_destroy(child);
    72          cg_destroy(parent);
    73          free(parent);
    74          free(child);
    75  
    76          cg_destroy(child2);

The problem with using one error label to handle all possible returns
is that some stuff hasn't been initialized yet.

    77          cg_destroy(parent2);
    78          free(parent2);
    79          free(child2);
    80  
    81          return ret;
    82  }

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
