From: idosch@idosch.org (Ido Schimmel)
Date: Thu, 1 Mar 2018 22:12:09 +0200
Subject: [PATCH net-next 1/5] selftests: forwarding: Only check tc
 version for tc tests
In-Reply-To: <20180301190947.7299-2-dsahern@gmail.com>
References: <20180301190947.7299-1-dsahern@gmail.com>
 <20180301190947.7299-2-dsahern@gmail.com>
Message-ID: <20180301201209.GA8190@splinter>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180301201209.dPd2BO3UnSj7ZLSv0gAc5wz1-YI4lKxoawQY-rQVZPg@z>

On Thu, Mar 01, 2018@11:09:43AM -0800, David Ahern wrote:
> Capabilities of tc command are irrelevant for router tests:
>     $ ./router.sh
>     SKIP: iproute2 too old, missing shared block support
> 
> Add a CHECK_TC flag and only check tc capabilities if set. Add flag to
> tc_common.sh and have it sourced before lib.sh
> 
> Also, if the command lacks some feature the test should exit non-0.
> 
> Signed-off-by: David Ahern <dsahern at gmail.com>
> ---
>  tools/testing/selftests/net/forwarding/lib.sh      | 29 ++++++++++++++--------
>  .../testing/selftests/net/forwarding/tc_actions.sh |  2 +-
>  .../testing/selftests/net/forwarding/tc_chains.sh  |  2 +-
>  .../testing/selftests/net/forwarding/tc_common.sh  |  2 ++
>  .../testing/selftests/net/forwarding/tc_flower.sh  |  2 +-
>  .../selftests/net/forwarding/tc_shblocks.sh        |  2 +-

bridge_vlan_aware.sh also uses tc to check flooding and learning. Looks
good otherwise.

Reviewed-by: Ido Schimmel <idosch at mellanox.com>

Thanks, David!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
