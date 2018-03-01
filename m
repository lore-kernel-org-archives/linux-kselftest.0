From: idosch at idosch.org (Ido Schimmel)
Date: Thu, 1 Mar 2018 21:43:22 +0200
Subject: [PATCH net-next 5/5] selftests: forwarding: Add description to
 the multipath tests
In-Reply-To: <20180301190947.7299-6-dsahern@gmail.com>
References: <20180301190947.7299-1-dsahern@gmail.com>
 <20180301190947.7299-6-dsahern@gmail.com>
Message-ID: <20180301194322.GE4839@splinter>

On Thu, Mar 01, 2018 at 11:09:47AM -0800, David Ahern wrote:
> Add a better description to the summary for multipath tests. e.g.,
> 
> INFO: Running IPv6 multipath tests
> TEST: Multipath: ECMP                                               [PASS]
> INFO: Expected ratio 1.00 Measured ratio 1.02
> TEST: Multipath: Weighted MP 2:1                                    [PASS]
> INFO: Expected ratio 2.00 Measured ratio 2.02
> TEST: Multipath: Weighted MP 11:45                                  [PASS]
> INFO: Expected ratio 4.09 Measured ratio 4.03
> 
> Signed-off-by: David Ahern <dsahern at gmail.com>

I tried to make the output as nice as the tests you sent me, but I
failed. Happy you pitched in :)

Reviewed-by: Ido Schimmel <idosch at mellanox.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
