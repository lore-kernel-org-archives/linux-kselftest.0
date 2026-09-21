Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882B93358B9;
	Mon, 21 Sep 2026 03:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789962313; cv=none; b=XMqrDRVyp9l4E3gGDhITXly7mZbcYmYcl8iv8179qM3nVakes2Ae3WE7yR+F+Sl5iwDbApco+EzbAmLKoQ3yyTWb8ls2VVKGYQo+S3NaO+GzcLJwxbnU/VSPtpdAAKxmoaYliAaCbbqUbozG9uxSRRwWTeka5e3hRNXXTinRorA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789962313; c=relaxed/simple;
	bh=2mqcYQ13Dtq6iawIx/ixajTzHx5R5w48dlxlvQDoVOA=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ePkEXtfF/FOGxzSPdCxGSGJ/cihIFckh3y8txQ6y2I41mR54/628m9HQEmW9fIN/wzu50DhVhpFInZ3Y7UJM0dFl09T6GBZbHv8d2F0kPI5p/ifCmBqeClnULBCEn/4M4G9wCEYKmFFdcoQi7JmStiGxzq/LaQfSdkNGyGZ/MKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBB8gG92; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBB8gG92"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40EEF1F000FF;
	Mon, 21 Sep 2026 03:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789962311;
	bh=EPx5RwoBp9LAbXGjS27mFFa+JbitlsUoPMjfbGclCkc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PBB8gG92IM/PrR38dvMf4EXaL5oYQYXQSr1qwoUyDVMJmGFCrOmku8iGiQNtrZ2l4
	 ELo65qyFgSTyHg1hU9dDVKthroJazlNSMjueYf8pJhWUiUMpjKYpGkz0aZE+muDGuJ
	 lJm7c7CVMjMiXKqh1xE9tF2I+Bq01zIHHcN1WjMvk92z4oiRGly+OeQvo9nW/xjOpo
	 bpTBjaeOnS1E9VFEUnBzEXUBkGRX4Kx0KPT2BCtJC0NrF8R0BMFMwK27ZPLOi+UPGi
	 IIVnep7WRrZXcCIn3+gBdO0HNmmRWNEiS1K7ViVywndkWRKdWz3sTQAHOpNniOsaJr
	 FJbvsTNrr+SOQ==
Subject:
 Re: [PATCH net-next v2] selftests: net: fou_mcast_encap: load the fou module
From: netdev-bot+sashiko@kernel.org
To: fuqingshuang@kylinos.cn
Cc: apw@canonical.com, joe@perches.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, willemb@google.com, littlesmilingcloud@gmail.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 21 Sep 2026 03:45:09 +0000
Message-ID: <178996230975.2160803.17640968761180621275@kernel.org>
In-Reply-To: <20260917033049.792209-1-fuqingshuang@kylinos.cn>
References: <20260917033049.792209-1-fuqingshuang@kylinos.cn>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new IPv4 gate in
  tools/testing/selftests/net/fou_mcast_encap.sh (`if modprobe -q fou;…
- [Low] The IPv4 subtest is now gated solely on the exit status of
  `modprobe -q fou` (tools/testing/selftests/net/fou_mcast_encap.sh:162).

--

selftests: net: fou_mcast_encap: load the fou module

The patch replaces the unconditional IPv4 subtest invocation in
fou_mcast_encap.sh with a modprobe -q fou guard, running setup_ipv4() and
run_ping_test() only when the modprobe succeeds and calling log_test_skip()
otherwise.

Link (v1): https://lore.kernel.org/all/20260911100158.854183-1-fuqingshuang@kylinos.cn/

> diff --git a/tools/testing/selftests/net/fou_mcast_encap.sh b/tools/testing/selftests/net/fou_mcast_encap.sh
> index 70210d39fba33..5f84d58d3075b 100755
> --- a/tools/testing/selftests/net/fou_mcast_encap.sh
> +++ b/tools/testing/selftests/net/fou_mcast_encap.sh

[ ... ]

> @@ -160,8 +158,13 @@ run_ping_test() {
>  }
>  
>  setup_common
> -setup_ipv4
> -run_ping_test -4 eoudp4 "$TUN4_R" "FOU/GRETAP IPv4 multicast encap resubmit"
> +
> +if modprobe -q fou; then
> +	setup_ipv4
> +	run_ping_test -4 eoudp4 "$TUN4_R" "FOU/GRETAP IPv4 multicast encap resubmit"

[Severity: High]

Does this guard actually cover the CONFIG_NET_FOU=m case described in the
commit message?

The encap ops needed by "ip link add ... type gretap ... encap fou" are only
compiled in under CONFIG_NET_FOU_IP_TUNNELS:

net/ipv4/fou_core.c:
#ifdef CONFIG_NET_FOU_IP_TUNNELS
	... fou_iptun_ops / gue_iptun_ops ...
#else
static int ip_tunnel_encap_add_fou_ops(void)
{
	return 0;
}

and net/ipv4/Kconfig has:

config NET_FOU_IP_TUNNELS
	bool "IP: FOU encapsulation of IP tunnels"
	depends on NET_IPIP || NET_IPGRE || IPV6_SIT
	select NET_FOU

Since a bool=y selecting a tristate forces it to y, doesn't CONFIG_NET_FOU=m
imply CONFIG_NET_FOU_IP_TUNNELS=n?

In that configuration the module init still returns success and registers no
TUNNEL_ENCAP_FOU ops, so modprobe -q fou exits 0, setup_ipv4() runs, and:

	ip -n "$NSENDER" link add eoudp4 type gretap \
		remote "$MCAST4" local 10.0.0.1 \
		encap fou encap-sport "$FOU_PORT4" encap-dport "$FOU_PORT4" \
		key "$MCAST4"

still fails, because ipgre_newlink_encap_setup() -> ip_tunnel_encap_setup() ->
ip_encap_hlen() returns -EINVAL when no ops are registered for the encap type.

setup_ipv4() checks none of its command exit statuses and the script does not
use set -e, so get_rx_packets() yields an empty string, rx_delta becomes 0, and
run_ping_test() logs exactly the line quoted in the commit message:

  TEST: FOU/GRETAP IPv4 multicast encap resubmit (received 0/100)  [FAIL]

The commit message also states:

  This matches the existing fou6 handling in this script and the pattern used
  in pmtu.sh.

setup_fou_or_gue() in pmtu.sh does both halves:

	modprobe fou || return $ksft_skip
	run_cmd ${ns_a} ip fou add port 5555 ipproto ${ipproto} || return $ksft_skip
	run_cmd ${ns_a} ip link add ${encap}_a type ${type} ${mode} local ${a_addr} remote ${b_addr} encap ${encap} encap-sport auto encap-dport 5556 || return $ksft_skip

Only the modprobe half is adopted here, and that half cannot express the
CONFIG_NET_FOU_IP_TUNNELS gate. Would a capability probe, mirroring
setup_ipv6() and returning $ksft_skip when the "ip fou add" or the gretap
creation fails, work better for this?

As an aside, the IPv6 branch only degrades to a skip incidentally: the last
command in setup_ipv6() is

	ip -n "$NSENDER" neigh add "$TUN6_R" lladdr "$recv_mac" dev eoudp6

which fails when the tunnel was never created, so setup_ipv6() happens to
return non-zero.

> +else
> +	log_test_skip "FOU/GRETAP IPv4 multicast encap resubmit"
> +fi

[Severity: Low]

The commit message says:

  modprobe is a no-op when CONFIG_NET_FOU=y, so default selftest builds
  remain unchanged.

Is that accurate when /lib/modules/$(uname -r) is not populated?

With CONFIG_NET_FOU=y (which is what tools/testing/selftests/net/config sets),
modprobe can only resolve a built-in module name through the modules.builtin
files and modules.dep that depmod generates during make modules_install. On a
freshly built kernel booted without installing modules, or on a minimal
initramfs or VM image where modprobe is not on PATH (exit 127), modprobe -q fou
returns non-zero even though FOU is fully available, and this else branch is
taken.

In that case setup_ipv4() and run_ping_test() never run, so a real regression
in the __udp4_lib_mcast_deliver() resubmit path would be reported as a clean
skip. The -q also suppresses any diagnostic, unlike pmtu.sh which uses plain
modprobe.

Would running modprobe -q fou for its side effect only, and then gating the
subtest on an actual capability check, avoid turning a working built-in
configuration into a skip?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917033049.792209-1-fuqingshuang%40kylinos.cn
