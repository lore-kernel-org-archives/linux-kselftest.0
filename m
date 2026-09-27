Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188FD23392C;
	Sun, 27 Sep 2026 01:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790472305; cv=none; b=WbBBh6VPiRW/auQKrBIUKEfNoVv4CY/JUQHc97+/6s0666hdJXV0rMxRyeW4TNBalXFoUh/JN95KDSELlbYz8RX+F3mVft/hIzQFVV9z2YaqsTVT1Lg1qn6/R4ijDirhdRRWsskJk6D/PkS8vc5X9pTAxHMnJLEWeYe+HqPkvi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790472305; c=relaxed/simple;
	bh=FmWoIuOVQE6usRct8EJKYaquUVB3FdDc4ALNUS2FpUk=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jGaHEL98MrhynEJLy7rJRo6PtYjioqWhhtzx4cOCBwc1NYiAqWqaGKUZN4WcS+CPxH0EyP4oQt+HD++/VJ0pVo3CT1tAdHh4/LMuoSsqaW7FNAxQrVZh6HRbcqMjWF4SxFE1SgBP9X6LPRa9kAI2liyZWdf6tTsmtbItT8eLBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vkab3tnl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vkab3tnl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6741F000FF;
	Sun, 27 Sep 2026 01:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790472303;
	bh=JyKyFAg2haIkrREE6xjcNJR1u8ce6/qUKg5qdGEs9TE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Vkab3tnlog9khhHBGyWUER0HqGUIdQlDnXx5hv05zPE6bYWJ7JL1MdC5HRUmqfWrn
	 tw7VaINeliH03W5XuWiQ5a90MB34AXcX0pCpoCwqh5aHYLw2A80UnDT75U8qaQoUs4
	 hG9DK2cAj9p1dH86GAzxoy8mOmUcNVWeof1UF3SstnU3X+Xanmp44LgLt5MTmDHNKe
	 pUtp7+4wJq1Cd3FCWmOikYEREaECCF9YzQDaAMAEPWlzmr+UJ9KItRD9g7Fx9IQSLO
	 S67SwEUdjlJW5Ft0hcRH/ajq5Rb3GVLy9R1QXpQ9P/y+vnrGaYOI5tsRsZbwRaXrs2
	 CmPzzuf05oJbw==
Subject:
 Re: [PATCH net 4/4] selftests: net: add lwtunnel route save and restore test
From: netdev-bot+sashiko@kernel.org
To: yuya.kusakabe@gmail.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 justin.iurman@gmail.com, alex.aring@gmail.com, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, razor@blackwall.org, eyal.birger@gmail.com,
 nicolas.dichtel@6wind.com, lucien.xin@gmail.com, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sun, 27 Sep 2026 01:25:02 +0000
Message-ID: <179047230225.2160803.15111196649116481218@kernel.org>
In-Reply-To: <20260923-lwt-encap-noflag-v1-4-8de7ab6c86e9@gmail.com>
References: <20260923-lwt-encap-noflag-v1-4-8de7ab6c86e9@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The xfrm case (save_restore_xfrm,
  tools/testing/selftests/net/lwt_save_restore.sh:87-91) almost always…
- [Low] save_restore() does not check the exit status of 'ip -n "$NS"
  "$family" route del "$prefix"' (line 64).
- [Low] The iproute2 capability probe in save_restore() (line 43) only
  checks the base encap keyword.
- [Low] The same case gets a different name depending on its outcome.
- [Low] setup_prepare() ignores the return value of setup_ns.

--

selftests: net: add lwtunnel route save and restore test

This adds a selftest that installs a route with an lwtunnel encap, saves
it with "ip route save", deletes it, restores it with "ip route restore"
and checks that the restored route matches the original. It covers the
rpl, ioam6 and xfrm encaps and the ip encap with geneve, vxlan and erspan
options, skipping cases the kernel or iproute2 does not support.

> diff --git a/tools/testing/selftests/net/lwt_save_restore.sh b/tools/testing/selftests/net/lwt_save_restore.sh
> new file mode 100755
> index 0000000000000..9666386c622d5
> --- /dev/null
> +++ b/tools/testing/selftests/net/lwt_save_restore.sh
> @@ -0,0 +1,116 @@

[ ... ]

> +setup_prepare()
> +{
> +	setup_ns NS

[Severity: Low]
Should the return value of setup_ns be checked here?

When "ip netns add" fails, for example when the script is not run as
root, setup_ns() in lib.sh does not exit. NS has already been assigned,
and setup_ns() returns ksft_skip:

tools/testing/selftests/net/lib.sh:setup_ns() {
    ...
		if ! ip netns add "${!ns_name}"; then
			echo "Failed to create namespace $ns_name"
			cleanup_ns "${ns_list[@]}"
			return $ksft_skip
		fi
    ...
}

The script then calls tests_run anyway. Each case passes the host-side
"ip route help" probe, and then "ip -n $NS route add" fails with "Cannot
open network namespace ...".

That error matches neither skip pattern in save_restore(). So every case
is reported as FAIL instead of the whole script being skipped.

Most net selftests call setup_ns without checking it. Still, would
"setup_ns NS || exit $ksft_skip" give a more accurate result here?

> +	defer cleanup_all_ns
> +
> +	ip -n "$NS" link add name dummy0 up type dummy
> +}

[ ... ]

> +	RET=0
> +
> +	if ! ip route help 2>&1 | grep "^ENCAPTYPE" | grep -qw "$encap"; then
> +		log_test_skip "$desc" "iproute2 lacks the encap"
> +		return
> +	fi
> +
> +	out=$(ip -n "$NS" "$family" route add "$@" 2>&1)
> +	rc=$?
> +	if ((rc)) && [[ $out == *"encapsulation type"* ||
> +			$out == *CONFIG_LWTUNNEL* ]]; then
> +		log_test_skip "$desc" "kernel lacks the encap"
> +		return
> +	fi
> +	check_err "$rc" "Failed to add route: $out"

[Severity: Low]
In the geneve, vxlan and erspan cases, encap=${desc%% *} is "ip". The
probe only checks that iproute2 supports "encap ip". Does it also need
to check for geneve_opts, vxlan_opts and erspan_opts?

Some iproute2 versions support "encap ip" but not these option keywords.
There, parse_encap_ip() stops at the unknown token and route add fails
with a generic parse error:

  either "to" is duplicate, or "geneve_opts" is a garbage

That message contains neither "encapsulation type" nor "CONFIG_LWTUNNEL".
So check_err() records "Failed to add route" and the case reports FAIL,
not the SKIP described in the commit message.

> +
> +	dump=$(mktemp)
> +	defer rm -f "$dump"
> +
> +	before=$(ip -n "$NS" "$family" route show "$prefix")
> +	ip -n "$NS" "$family" route save "$prefix" > "$dump"
> +	check_err $? "Failed to save route"
> +
> +	ip -n "$NS" "$family" route del "$prefix"

[Severity: Low]
Should the exit status of this route del be checked?

iproute2's restore_handler() sends RTM_NEWROUTE with NLM_F_CREATE and
without NLM_F_EXCL, and it treats EEXIST as success. If the del fails to
remove the route, the restore sends an exact duplicate. Then
fib_table_insert() or fib6_add_rt2node() returns -EEXIST.

In that case restore still exits 0, and before and after match because
the original route was never removed. log_test reports PASS, but the
kernel never parsed the restored RTA_ENCAP.

Would it help to add a check_err after the del, and perhaps to check
that "ip route show $prefix" is empty before the restore?

> +	ip -n "$NS" "$family" route restore < "$dump"
> +	check_err $? "Failed to restore route"
> +
> +	after=$(ip -n "$NS" "$family" route show "$prefix")
> +	[ "$before" = "$after" ]
> +	check_err $? "Restored route differs from the saved one"
> +
> +	log_test "encap $desc route save and restore"

[Severity: Low]
This isn't a bug, but the same case gets a different test name depending
on how it ends. The skip paths above call:

	log_test_skip "$desc" "iproute2 lacks the encap"
	log_test_skip "$desc" "kernel lacks the encap"

Those produce names like "rpl" or "ip geneve_opts". The pass/fail path
uses "encap $desc route save and restore" instead.

Could both paths use the same test name, so that results tracked by name
line up across runs?

> +}

[ ... ]

> +save_restore_xfrm()
> +{
> +	# iproute2 takes every argument after "encap xfrm" as an xfrm one
> +	save_restore xfrm 2001:db8:3::/64 dev dummy0 encap xfrm if_id 1
> +}

[Severity: Medium]
Will this case ever run under the in-tree selftest config?

tools/testing/selftests/net/config sets CONFIG_XFRM_INTERFACE=m. Only
the xfrm_interface module registers xfrmi_encap_ops, from xfrmi_init().
Module autoload is disabled for this encap type:

net/core/lwtunnel.c:lwtunnel_encap_str() {
    ...
	case LWTUNNEL_ENCAP_XFRM:
		/* module autoload not supported for encap type */
		return NULL;
    ...
}

So unless xfrm_interface is already loaded, the route add goes:

rtm_to_fib6_config()
  lwtunnel_valid_encap_type()
    lwtunnel_encap_str() returns NULL, so no request_module()
    fails with -EOPNOTSUPP, "lwt encapsulation type not supported"

That message matches the *"encapsulation type"* pattern in
save_restore(). The case is then logged as "kernel lacks the encap" and
skipped.

The test routes through dummy0 and never runs modprobe. It also never
creates a "type xfrm" link, which would autoload the module through
MODULE_ALIAS_RTNL_LINK("xfrm").

Suppose the xfrm fix earlier in this series ("xfrm: lwtunnel: accept
RTA_ENCAP without NLA_F_NESTED") were reverted. Would this case still
SKIP instead of FAIL, unless an earlier test happened to load
xfrm_interface?

Would it make sense to create an xfrm interface in $NS before adding the
route, for example with "ip -n $NS link add ipsec0 type xfrm external"?
Running "modprobe -q xfrm_interface" would also work.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260923-lwt-encap-noflag-v1-0-8de7ab6c86e9%40gmail.com
