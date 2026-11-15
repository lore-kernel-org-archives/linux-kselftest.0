Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794758571;
	b=wYrUFtwigsGho4WoWxUe9ov5F2qZl/VbmQrvJeYHtJdVkRQuzRTM1s3lvBSCzgRv7Z+e
	 AzenZvIwwvpMOWwTOJCDjF2r1b7aFhIF9PeusDZcp9N0KaPSfn9JFGn39i88+Bz4kKnQT
	 G7my4TI6Vxf9CsDKLLa9NJYbbjXv1eZ7b2TIMjS3bJEc11IwhkdVGBmLnsp+Ekxev5DvD
	 /Nr9D4+k9qVmiDqlMCJ8hn8hteCOxXLgk/G9lzHydcafUM6t+r+yWZgjFAc5AsE1j3zau
	 OKihfEKATkqxPn5hodWGZxmgq7fMJusHCuEnQb7M5dCghw+M0D4z/UDvG3qowjc6xFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758571;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=6o20K47FTSJ3fNc9dXoLvvdyjdlNctQb9/oL/0Ev1js=;
	b=AZTB/P+PYzUwHAmKYDsyF8QeeACe63SZxmpQNcrU6GfELrbPEBRWb4/LULMxu9lxrY3Z
	 xCavrNUy5wr+OMzp5pOKTVqWw/v3ms3ts8yQeG1jk5YoYQ8trBYALsSNmlRgiDgL761pl
	 MHwHj/LSQ8Qs0ljiaTRpMHNdqD9sduUih1zLQ6nx3s7Ip59TsszPhNrIUa7Ixz8xRuagx
	 YuhEcTIasgJrmD3EydfLkd7ufW3GXVHAt7uCp8zfDRmbUrVm64YElfciX9ER/KkVSKOms
	 uQ4bwtXuwrbxohuxQoTn1ZuCVOaQHVL6WtNdbotL+hUecL61CuwHM+q10RjHvUr/r4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VmFDLa7Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A892C606A338;
	Sun, 15 Nov 2026 16:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VmFDLa7Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C961F000C7;
	Sun, 15 Nov 2026 16:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794758571;
	bh=6o20K47FTSJ3fNc9dXoLvvdyjdlNctQb9/oL/0Ev1js=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VmFDLa7QcLRWoMu+ysh3hNyWjCSJ9ZR8GTmWzU/4FQS3A1ZxjjELnasXlBcjvFxmM
	 VOU3H0ZJkraZVkXzQ0QZnvSb7UGMQWJ3C/+SryCvv5JPvQ3qM+t8sJ28hNOADmgqCw
	 cl7EIs9qPpbk8peyNtx/UMgwBwP7yPZxScg89pzZcOeJWrgdtT47UKtJ5aXtPIre+O
	 3sGFBO25KB46ZfWdSs6Y8BDSMZ+D1qmDEE3qAuIV7eDsSsg9f8qDDEJF3ToBTuSg7I
	 yZZNE2bmWFJn7gZirm1y9aLxERy2IDkIKWQ268mtuL+hFrj4vY2vnHXCykg/v7WwMk
	 vt8yQrmWcLAlA==
Subject: Re: [PATCH net-next] ipv6: always apply all.force_forwarding to every
 interface
From: netdev-bot+sashiko@kernel.org
To: g.goller@proxmox.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org,
 idosch@nvidia.com, nicolas.dichtel@6wind.com, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sun, 15 Nov 2026 16:02:50 +0000
Message-ID: <179475857004.2199510.11986005836315752622@kernel.org>
In-Reply-To: <20261112-ipv6_always_apply-v1-1-8df846631005@proxmox.com>
References: <20261112-ipv6_always_apply-v1-1-8df846631005@proxmox.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new selftest test_all_force_forwarding() in
  tools/testing/selftests/net/ipv6_force_forwarding.sh fails every time…

--

ipv6: always apply all.force_forwarding to every interface

This commit changes addrconf_sysctl_force_forwarding() so that every write
to all.force_forwarding is applied to all interfaces, even when the stored
value does not change. It now takes RTNL for every write and sends netconf
notifications only for actual value changes. It also extends the
ipv6_force_forwarding.sh selftest to cover the new behaviour.

> diff --git a/tools/testing/selftests/net/ipv6_force_forwarding.sh b/tools/testing/selftests/net/ipv6_force_forwarding.sh
> index bf0243366caa7..383d1ec64f1c1 100755
> --- a/tools/testing/selftests/net/ipv6_force_forwarding.sh
> +++ b/tools/testing/selftests/net/ipv6_force_forwarding.sh

[ ... ]

> +test_all_force_forwarding() {
> +    local ret=0
> +
> +    echo "TEST: all.force_forwarding"
> +
> +    ip netns exec $ns2 sysctl -qw net.ipv6.conf.veth21.force_forwarding=0 || return 1
> +    ip netns exec $ns2 sysctl -qw net.ipv6.conf.all.force_forwarding=1 || return 1
> +    check_force_forwarding veth21 1 "all.force_forwarding applied to interfaces" || ret=1

[ ... ]

> +    # Disabling all.forwarding resets force_forwarding, including on all
> +    ip netns exec $ns2 sysctl -qw net.ipv6.conf.all.forwarding=1 || return 1
> +    ip netns exec $ns2 sysctl -qw net.ipv6.conf.all.forwarding=0 || return 1
> +    check_force_forwarding all 0 "all.forwarding=0 resets all.force_forwarding" || ret=1

[Severity: Medium]
Can this check ever pass? Earlier in test_all_force_forwarding() the
script writes all.force_forwarding=1, which stores 1 in
net->ipv6.devconf_all->force_forwarding.

The later all.forwarding=0 write goes through
addrconf_sysctl_forward()->addrconf_fixup_forwarding(). The devconf_all
branch there only updates devconf_dflt->forwarding and then calls
addrconf_forward_change(net, 0).

addrconf_forward_change() clears force_forwarding only in the
per-device configs:

net/ipv6/addrconf.c:addrconf_forward_change() {
    ...
	for_each_netdev(net, dev) {
		idev = __in6_dev_get_rtnl_net(dev);
		if (idev) {
			...
			if (newf == 0 && idev->cnf.force_forwarding) {
				WRITE_ONCE(idev->cnf.force_forwarding, 0);
    ...
}

Nothing resets devconf_all->force_forwarding (or
devconf_dflt->force_forwarding) when forwarding is disabled. So
sysctl -n net.ipv6.conf.all.force_forwarding should still return 1 at
this point. The check would then print "FAIL: all.forwarding=0 resets
all.force_forwarding (got 1, expected 0)", and the script would exit 1
on every run.

ip-sysctl.rst says the flag "will be reset on all interfaces". That
matches the code, not this assertion.

Should this assertion be dropped, or changed to expect 1? Or is the
intent for all.forwarding=0 to also reset conf/all/force_forwarding in
addrconf_fixup_forwarding()?

> +    check_force_forwarding veth21 0 "all.forwarding=0 resets interface force_forwarding" || ret=1
> +
> +    return $ret
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-ipv6_always_apply-v1-1-8df846631005%40proxmox.com
