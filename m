From: shuah at kernel.org (shuah)
Date: Mon, 8 Apr 2019 12:53:39 -0600
Subject: [PATCH kselftest-next] selftests: cgroup: fix cleanup path in
 test_memcg_subtree_control()
In-Reply-To: <20190328025659.25684-1-guro@fb.com>
References: <20190328025659.25684-1-guro@fb.com>
Message-ID: <32b7ae48-99dd-1261-4086-37d416ffcfd5@kernel.org>

On 3/27/19 8:56 PM, Roman Gushchin wrote:
> Dan reported, that cleanup path in test_memcg_subtree_control()
> triggers a static checker warning:
>    ./tools/testing/selftests/cgroup/test_memcontrol.c:76 \
>    test_memcg_subtree_control()
>    error: uninitialized symbol 'child2'.
> 
> Fix this by initializing child2 and parent2 variables and
> split the cleanup path into few stages.
> 
> Signed-off-by: Roman Gushchin <guro at fb.com>
> Fixes: 84092dbcf901 ("selftests: cgroup: add memory controller self-tests")
> Reported-by: Dan Carpenter <dan.carpenter at oracle.com>
> Cc: Dan Carpenter <dan.carpenter at oracle.com>
> Cc: Shuah Khan (Samsung OSG) <shuah at kernel.org>
> Cc: Mike Rapoport <rppt at linux.vnet.ibm.com>


 From and Signed-off don't match. Please fix it and resend the patch.

thanks,
-- Shuah
