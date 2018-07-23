From: dsahern@gmail.com (David Ahern)
Date: Mon, 23 Jul 2018 06:47:25 -0600
Subject: [PATCH net-next] selftests: forwarding: gre_multipath: Drop IPv6
 tests
In-Reply-To: <cf0e380baf6a6aa5cf384017e8d69fec79750cfe.1532341813.git.petrm@mellanox.com>
References: <cf0e380baf6a6aa5cf384017e8d69fec79750cfe.1532341813.git.petrm@mellanox.com>
Message-ID: <91178516-49f9-82c5-8a29-d130254e0de1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180723124725.oWqgy18gi9GLnU20xh3tp9qilS_OjRshQ30kXo1h0IM@z>

On 7/23/18 4:33 AM, Petr Machata wrote:
> Support for device-only IPv6 multipath next hops was dropped in
> commit 33bd5ac54dc4 ("net/ipv6: Revert attempt to simplify route replace
> and append") and as of commit b5d2d75e079a ("net/ipv6: Do not allow
> device only routes via the multipath API"), attempts to add a next hop
> like that yield an explicit diagnostic.
> 
> Correspondingly, drop the IPv6 parts of GRE multipath test that are
> supposed to test that code.
> 
> Signed-off-by: Petr Machata <petrm at mellanox.com>
> ---
>  .../selftests/net/forwarding/gre_multipath.sh      | 113 ++-------------------
>  1 file changed, 6 insertions(+), 107 deletions(-)

Reviewed-by: David Ahern <dsahern at gmail.com>

Thanks for following up.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
