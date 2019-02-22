From: dsahern at gmail.com (David Ahern)
Date: Fri, 22 Feb 2019 17:37:41 -0500
Subject: [PATCH] selftests: fib_tests: sleep after changing carrier. again.
In-Reply-To: <20190222102741.31173-1-cascardo@canonical.com>
References: <20190222102741.31173-1-cascardo@canonical.com>
Message-ID: <767c0a6e-41a4-e1cd-00a4-197cbcb41af5@gmail.com>

On 2/22/19 5:27 AM, Thadeu Lima de Souza Cascardo wrote:
> Just like commit e2ba732a1681 ("selftests: fib_tests: sleep after
> changing carrier"), wait one second to allow linkwatch to propagate the
> carrier change to the stack.
> 
> There are two sets of carrier tests. The first slept after the carrier
> was set to off, and when the second set ran, it was likely that the
> linkwatch would be able to run again without much delay, reducing the
> likelihood of a race. However, if you run 'fib_tests.sh -t carrier' on a
> loop, you will quickly notice the failures.
> 
> Sleeping on the second set of tests make the failures go away.
> 
> Cc: David Ahern <dsahern at gmail.com>
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo at canonical.com>
> ---
>  tools/testing/selftests/net/fib_tests.sh | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: David Ahern <dsahern at gmail.com>
