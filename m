From: pmladek@suse.com (Petr Mladek)
Date: Mon, 16 Apr 2018 14:49:47 +0200
Subject: [PATCH v3] selftests/livepatch: introduce tests
In-Reply-To: <1523544871-29444-2-git-send-email-joe.lawrence@redhat.com>
References: <1523544871-29444-1-git-send-email-joe.lawrence@redhat.com>
 <1523544871-29444-2-git-send-email-joe.lawrence@redhat.com>
Message-ID: <20180416124947.4ehk7xbxoiqrklue@pathway.suse.cz>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180416124947.9CQVdx9tPgpMubRpzvkW8xR6M26LUBf7Cph7JEFNgWE@z>

On Thu 2018-04-12 10:54:31, Joe Lawrence wrote:
> Add a few livepatch modules and simple target modules that the included
> regression suite can run tests against.
> 
> 
> diff --git a/Documentation/livepatch/callbacks.txt b/Documentation/livepatch/callbacks.txt
> index c9776f48e458..6ca2801a6bb9 100644
> --- a/Documentation/livepatch/callbacks.txt
> +++ b/Documentation/livepatch/callbacks.txt
> @@ -116,490 +116,3 @@ virtnet_probe() initialized its driver's net_device features.  A

It might make sense to add a note about sample modules in
lib/livepatch/


> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 64155e310a9f..e4a0e81542ff 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1932,6 +1932,18 @@ config TEST_DEBUG_VIRTUAL
>  
>  	  If unsure, say N.
>  
> +config TEST_LIVEPATCH
> +	tristate "Test livepatching"
> +	default n
> +	depends on LIVEPATCH
> +	depends on m
> +	help
> +	  Test various kernel livepatching features for correctness.
> +	  The tests will load test modules that will be livepatched
> +	  in various scenarios.

It would be great to make a clue how to run the test. Something like:

	  To run tests call:

	  tools/testing/selftests/livepatch/test-callbacks.sh
	  tools/testing/selftests/livepatch/test-livepatch.sh
	  tools/selftests/livepatch/test-shadow-vars.sh

This is inspired by config TEST_KMOD description.


> +	  If unsure, say N.
> +
>  endif # RUNTIME_TESTING_MENU
>  
>  config MEMTEST
> diff --git a/lib/Makefile b/lib/Makefile
> index a90d4fcd748f..98a38441afb0 100644

Otherwise, it looks great to me. Thanks a lot for getting this
together.

Best Regards,
Petr
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
