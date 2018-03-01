From: idosch@idosch.org (Ido Schimmel)
Date: Thu, 1 Mar 2018 21:37:36 +0200
Subject: [PATCH net-next 3/5] selftests: forwarding: Handle 0 for packet
 difference in multipath tests
In-Reply-To: <20180301190947.7299-4-dsahern@gmail.com>
References: <20180301190947.7299-1-dsahern@gmail.com>
 <20180301190947.7299-4-dsahern@gmail.com>
Message-ID: <20180301193736.GC4839@splinter>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180301193736.3KXsOVuW-CYWug65LIYZXzf4N4bLMks_XhQGZu_ySso@z>

On Thu, Mar 01, 2018@11:09:45AM -0800, David Ahern wrote:
> If the packet stats have a difference of 0, the test output shows:
> INFO: Expected ratio 2.00 Measured ratio
> Runtime error (func=(main), adr=9): Divide by zero
> (standard_in) 2: syntax error
> (standard_in) 1: syntax error
> ./router_multipath.sh: line 187: test: : integer expression expected
> TEST: Multipath                                                     [FAIL]
> 	Too large discrepancy between expected and measured ratios
> 
> Handle the 0 and display a cleaner message:
> INFO: Running IPv6 multipath tests
> TEST: Multipath                                                     [FAIL]
> 	Packet difference is 0
> 
> Signed-off-by: David Ahern <dsahern at gmail.com>

Reviewed-by: Ido Schimmel <idosch at mellanox.com>

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
