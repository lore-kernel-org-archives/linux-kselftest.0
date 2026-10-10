Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E105A3B8BCC;
	Sat, 10 Oct 2026 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791623170; cv=none; b=rwktRxATrVuc3Ul/F+yIBv7IdaiRQyyeO200z1vNQkIhFJLiEzTQTAc09d528WZl7CA4+t2S/I5/6lxICu1iwuyLgg4HzDR8iYhyelm3CVJUIINwwoWI4ImFVHBy8mol+bHF5lbCCmCzqT87iRK+8tTtdJgPWrWkK+1HzQ1htbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791623170; c=relaxed/simple;
	bh=uyP+fXkBFXEUN5GSFp719XsAkM0dlIvt9fjtseV/rSw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=StU5y6yvAL/zXLlTgBocgdjS0PkyuNeAV1dPWc0KkfC9ADD89SEcAxgcqj0y6W8SN8c8TAYlkdIfLhDNXoVY7h0zBBm6409BEHE3rAPwIsdyeTiQ819T3Dk0R+YlzJ94eSyXDWpmp6fqztXavKAhzzF2mVklIlv/gaL6gnihpIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfKOhRfv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfKOhRfv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB37A1F00899;
	Sat, 10 Oct 2026 09:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791623168;
	bh=jxXgrrCJlsDzTfffL80QrRQeFK7SVSWVhZTOun6MhdM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YfKOhRfvU/aYiB8wPJGQQujeAs42QNC65WMHkQHe2gMWaBx9drp8V44VC2QunLchC
	 DL20Uwv9Zn22eyBJM9SlSQJZ1mewKqHmPYimNs8ZxtIsv1fvivRQM9Pg9Cp4mCIuOq
	 57PX39Odt2tW2d0VJVuyf1pGEs6NVfj2veXbzlP2Mq7a1F3hOoj5d5HygbAlnpsMQd
	 vvTqRsaytuylGLygDQLjHMp44pHcNwu8rkbCfvEvI+6/LTfeUZxryJ/tOz5Qx1BJJ7
	 dQArTxd5A3KtJQZIq3G7n4DivwWITDeIzL73RbUWtjcuUMWQEFTckU6RyrS3FUGYJv
	 BpQEHLGEWzdnw==
Subject:
 Re: [PATCH net] selftests: openvswitch: Test SET on later IPv6 fragments
From: netdev-bot+sashiko@kernel.org
To: sahaj123.sc@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, dev@openvswitch.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 10 Oct 2026 09:06:07 +0000
Message-ID: <179162316732.434549.3008431843792004994@kernel.org>
In-Reply-To: <20261009090629.1694991-1-sahaj123.sc@gmail.com>
References: <20261009090629.1694991-1-sahaj123.sc@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 3 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The test sends its fragment in a way that can never trigger the
  bug it is meant to catch, so it passes with or without commit…
- [Medium] test_ipv6_later_frag looks for the regression with `grep -c
  'WARNING:.*set_ipv6_addr'`.
- [Medium] test_ipv6_later_frag never checks that the running kernel has
  CONFIG_DEBUG_NET, even though the patch adds CONFIG_DEBUG_NET=y to the…
- [Medium] The new test's packet-counter check (ovs_flow_has_packets)
  runs `ovs-dpctl.py dump-flows` on a flow whose action is a SET, but…
- [Low] The commit message says the test 'covers the later-fragment case
  handled by the upstream fix' but does not name it: commit 3c6a4b11330f…
- [Low] The fragment adds CONFIG_DEBUG_NET=y but not its prerequisite
  CONFIG_DEBUG_KERNEL=y.

--

selftests: openvswitch: Test SET on later IPv6 fragments

This adds an openvswitch selftest that sends a crafted noninitial IPv6
fragment through a flow with an IPv6 source-address SET action. The test
checks that the flow counter advances and that dmesg shows no
set_ipv6_addr warning. It also adds CONFIG_DEBUG_NET=y to the openvswitch
config fragment.

> This covers the later-fragment case handled by the upstream fix.

[Severity: Low]
Could this name the fix? It appears to be commit 3c6a4b11330f ("net:
openvswitch: validate transport header presence in set_ipv6_addr").

The commit message also doesn't say that the patch adds CONFIG_DEBUG_NET=y
to tools/testing/selftests/net/openvswitch/config. That change applies to
every OVS selftest built from the fragment. It turns on all
DEBUG_NET_WARN_ON_ONCE() checks and turns off the transport header reset
in __netif_receive_skb_core().

Should that be mentioned too?

> diff --git a/tools/testing/selftests/net/openvswitch/config b/tools/testing/selftests/net/openvswitch/config
> index a825e0b5c88e5..b062ebbce0f00 100644
> --- a/tools/testing/selftests/net/openvswitch/config
> +++ b/tools/testing/selftests/net/openvswitch/config
> @@ -3,6 +3,7 @@ CONFIG_INET_DIAG=y
>  CONFIG_IP_SCTP=y
>  CONFIG_IPV6=y
>  CONFIG_NETFILTER=y
> +CONFIG_DEBUG_NET=y

[Severity: Low]
Does this fragment also need CONFIG_DEBUG_KERNEL=y? From net/Kconfig.debug:

config DEBUG_NET
	bool "Add generic networking debug"
	depends on DEBUG_KERNEL && NET

DEBUG_KERNEL has no default. If this fragment is merged into a base config
that lacks DEBUG_KERNEL, DEBUG_NET is silently dropped and the warning this
test looks for can't fire.

x86_64_defconfig and i386_defconfig already set CONFIG_DEBUG_KERNEL=y, so
the common case isn't affected.

[ ... ]

> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index a31f7fb6882dc..b9a4c4bf40672 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh

[ ... ]

> @@ -66,6 +67,11 @@ ovs_wait() {
>  	return 1
>  }
>  
> +ovs_flow_has_packets() {
> +	python3 "$ovs_base/ovs-dpctl.py" dump-flows "$1" |
> +		grep -Eq 'packets:[1-9][0-9]*,'
> +}

[Severity: Medium]
Can dump-flows format the SET action that this test installs? The SET
branch of ovsactions.dpstr() in ovs-dpctl.py does this:

    field = datum
    mask = None
    if field[0] == "OVS_ACTION_ATTR_SET_MASKED":

Here datum is the decoded ovskey nla returned by
self.get_attr("OVS_ACTION_ATTR_SET"). So field[0] indexes an nla object
with the integer 0 instead of checking the action name. This branch is not
inside the try/except that covers the other actions.

ovsflow.dpstr() puts the "packets:N," text in the same string as the
actions, and dump-flows prints nothing until that whole string is built.

If indexing the pyroute2 nla with 0 raises KeyError, dump-flows exits with
a traceback and prints nothing. Then ovs_flow_has_packets never matches,
ovs_wait times out, and the test fails even on a fixed kernel.

Whether it raises depends on how pyroute2's nlmsg_base implements
__getitem__. The formatter itself isn't new. However, no existing test
dumps a flow with a SET action, so this test seems to be the first to
depend on it.

> @@ -445,6 +451,43 @@ test_action_set() {
>  	return 0
>  }
>  
> +test_ipv6_later_frag() {
> +	local t="test_ipv6_later_frag"
> +	local warning="WARNING:.*set_ipv6_addr"

[Severity: Medium]
Will this pattern match the warning on every build? __warn() in
kernel/panic.c prints the headline like this:

	pr_warn("WARNING: %s:%d at %pS, CPU#%d: %s/%d\n",
		file, line, caller,

For the DEBUG_NET_WARN_ON_ONCE() in skb_transport_header(), %s:%d is the
include/linux/skbuff.h location. %pS names the out-of-line function that
contains the WARN. The [inline] frames in the syzbot trace come from
offline symbolization and don't appear in raw dmesg.

set_ipv6_addr() is a static helper with two call sites, both in
set_ipv6(). In the syzbot build, set_ipv6() was already inlined into
do_execute_actions(). If the compiler also inlines set_ipv6_addr(), the
headline names do_execute_actions or set_ipv6 instead. The test would then
pass even though the warning fired.

Would it be more reliable to match on the skbuff.h WARN location or on the
skb_transport_header_was_set() condition?

> +	local before after
> +
> +	if ! dmesg >/dev/null 2>&1; then
> +		info "dmesg unavailable - cannot check for kernel warning"
> +		return $ksft_skip
> +	fi

[Severity: Medium]
Should the test also skip when the running kernel doesn't have
CONFIG_DEBUG_NET? Without it, include/net/net_debug.h has:

#define DEBUG_NET_WARN_ON_ONCE(cond) BUILD_BUG_ON_INVALID(cond)

and __netif_receive_skb_core() also resets an unset transport header:

#if !defined(CONFIG_DEBUG_NET)
	if (!skb_transport_header_was_set(skb))
		skb_reset_transport_header(skb);
#endif

The test only skips when dmesg can't be read or when a matching warning is
already present. On distro or CI kernels not built from the config
fragment, it returns 0 once the flow counter advances instead of returning
$ksft_skip.

[ ... ]

> diff --git a/tools/testing/selftests/net/openvswitch/ovs-ipv6-frag.py b/tools/testing/selftests/net/openvswitch/ovs-ipv6-frag.py
> new file mode 100644
> index 0000000000000..869f9d6503ef4
> --- /dev/null
> +++ b/tools/testing/selftests/net/openvswitch/ovs-ipv6-frag.py

[ ... ]

> +    packet = ethernet + ipv6 + fragment + payload
> +
> +    with socket.socket(
> +        socket.AF_PACKET, socket.SOCK_RAW, socket.htons(0x0003)
> +    ) as sock:
> +        sock.bind((interface, 0))
> +        sent = sock.send(packet)

[Severity: High]
Can a fragment sent this way trigger the warning at all? It looks like the
test passes both with and without commit 3c6a4b11330f.

The socket is bound with ETH_P_ALL, so packet_snd() leaves skb->protocol at
0. Then this happens:

packet_snd()
  packet_parse_headers()
    skb->protocol = dev_parse_header_protocol(skb);  /* ETH_P_IPV6 */
    skb_probe_transport_header()
      __skb_flow_dissect()
        /* NEXTHDR_FRAGMENT, non-first fragment */
        fdret = FLOW_DISSECT_RET_OUT_GOOD;
      skb_set_transport_header(skb, keys.control.thoff);

Nothing on the way from veth to OVS clears it. __dev_forward_skb2(),
skb_scrub_packet() and __netif_receive_skb_core() all leave a set
transport header in place.

parse_ipv6hdr() in net/openvswitch/flow.c also returns early for a later
fragment without touching it:

		if (frag_off) {
			key->ip.frag = OVS_FRAG_TYPE_LATER;
			key->ip.proto = NEXTHDR_FRAGMENT;
			return 0;
		}

So on an unfixed kernel, set_ipv6()->set_ipv6_addr()->
update_ipv6_checksum() calls skb_transport_offset() while the transport
header is already set. The check in skb_transport_header() doesn't fire:

	DEBUG_NET_WARN_ON_ONCE(!skb_transport_header_was_set(skb));

As a result, after equals before and test_ipv6_later_frag() returns 0.

The syzbot trace quoted in 3c6a4b11330f goes through
ovs_packet_cmd_execute(). There the skb is built from netlink with no
transport header. Does the test need to inject the packet through
OVS_PACKET_CMD_EXECUTE to cover this regression?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009090629.1694991-1-sahaj123.sc%40gmail.com
