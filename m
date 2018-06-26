From: guro@fb.com (Roman Gushchin)
Date: Tue, 26 Jun 2018 10:15:22 -0700
Subject: [bug report] selftests: cgroup: add memory controller self-tests
In-Reply-To: <20180626090347.cuwod4fv5koqbu63@kili.mountain>
References: <20180626090347.cuwod4fv5koqbu63@kili.mountain>
Message-ID: <20180626171520.GA10359@castle.DHCP.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180626171522.E3oZC_pFD873GPhLyfUjO_BV766uO7fSDAhglS48_Lw@z>

On Tue, Jun 26, 2018@12:03:48PM +0300, Dan Carpenter wrote:
> Hello Roman Gushchin,
> 
> The patch 84092dbcf901: "selftests: cgroup: add memory controller
> self-tests" from May 11, 2018, leads to the following static checker
> warning:
> 
> 	./tools/testing/selftests/cgroup/test_memcontrol.c:76 test_memcg_subtree_control()
> 	error: uninitialized symbol 'child2'.
> 
> ./tools/testing/selftests/cgroup/test_memcontrol.c
>     69  
>     70  cleanup:
>     71          cg_destroy(child);
>     72          cg_destroy(parent);
>     73          free(parent);
>     74          free(child);
>     75  
>     76          cg_destroy(child2);
> 
> The problem with using one error label to handle all possible returns
> is that some stuff hasn't been initialized yet.
> 
>     77          cg_destroy(parent2);
>     78          free(parent2);
>     79          free(child2);
>     80  
>     81          return ret;
>     82  }

Hello, Dan!

Thanks for the report!
Just sent the fix.

Thanks,
Roman
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
