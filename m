Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535798;
	b=yD5y0aeRdga7tzT8/DfFqOqXw14INgt+Ld+jKrkE+3jX0adBSpu2oAYJAD8dU85V52vM
	 D9i+Ox+S7JELtkG/8yu8uJTaNcH8zHyzCVkBxthdxuo76SV5KqS6Mo7aboun0e7GeHuAx
	 UbzkSEbeUXSUf6PbyH9IO3u/NyYzzQRUl0hnC/oJ3pNx6jnJt7DERBuB8gZrzUUcj6Ws8
	 CpCChR48dhRjqlnoQdmlVNEZs1XMKGcP5qD8f8Q9PMijlMVLKqSnzW9qLbT3QcqgBVt5z
	 kGkz24B9zXK5dONDCn6dKnhLb+GK6yEJ77zwe1pqXLSRjW4PSn+5EiblNg9M4wPQugA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535798;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Qxe57lMNKukT31B5po2sqaJC36RczLL5Kjvfjsw19PE=;
	b=wACyMK/ba0lv9ovk3HFKeZIh9ztJVBMSDW5sPOLsDZCK9ArB08nzXFO/O8KmHt9DlxGQ
	 LY842TpMPx+YrJQyrP3dfYghTrsd5uF5lq3rCRfx1RFC6CHtwNECzUSbLFbkNozSrf+Tw
	 gRjnI86GgjkopXQC4oI0JjOLTdivt3FJjrE6ffxGTV2qeuX1Bkp+DIRA4e5vOape5t7N+
	 KHmoQOuUPRW9XWVHwotg8cu5WVve+AcgLkpAWJ7XtQ8CtkLOsQhTrzfjOfl5/M08D0chn
	 1QPbIRatc3J0JNeVVP+nPulEmxaKUQo0KxAW4uTqI6mCJRZzEgvUkFpQ2g11MDdUgyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=THR5ispW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AA4606A31E;
	Tue, 24 Nov 2026 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=THR5ispW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2321F000ED;
	Tue, 24 Nov 2026 15:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795535797;
	bh=Qxe57lMNKukT31B5po2sqaJC36RczLL5Kjvfjsw19PE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=THR5ispWIaQhB99nOBAFofxpXpIdVAm0fVy4q/IRS0YyUrMS3CEitYtmLbH6xHugX
	 Qn10JvblAN3uvpDEThmUsLP3Y2AXQi193V9kzuglJ8mJF17SQhJLshAaGFUVKVrQb2
	 DUoCd8qf1clkuijJUW+6N8NidmmVcmm+06BclEOn/peTAQtIkjJjK4+wA6KvzLZ9W5
	 xoPktGHzfyWwv6uM6+PY2ZE645rhYAbtNsWUsMx5zBQ0mpg9AsIIhc1N8L/CDCX3xq
	 7cy7PCXjjiAopz7zlF57wAlPnrkqefqLW74ltkMHCMVgthE/4yEahj5KhelBsOQrwz
	 FIEhsgU7ovhbA==
Subject: Re: [PATCH net v8 2/2] selftests: net: test joining genetlink groups
 no family owns
From: netdev-bot+sashiko@kernel.org
To: anilkaushikwireless@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, idosch@nvidia.com,
 nicolas.dichtel@6wind.com, jacob.e.keller@intel.com, jiri@resnulli.us,
 fw@strlen.de, martineau@kernel.org, v3rdant.xiang@gmail.com,
 aliceryhl@google.com, linux-kernel@vger.kernel.org, nhorman@tuxdriver.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 24 Nov 2026 15:56:36 +0000
Message-ID: <179553579621.3135.2576494122860587206@kernel.org>
In-Reply-To: <20261123155503.2497063-3-anilkaushikwireless@gmail.com>
References: <20261123155503.2497063-3-anilkaushikwireless@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In tools/testing/selftests/net/nl_genl_mcast.py, _free_ids()
  decides whether it runs in init_net by comparing the inode of…
- [Low] bind_before_family() in
  tools/testing/selftests/net/nl_genl_mcast.py first checks that NET_DM…

--

selftests: net: test joining genetlink groups no family owns

This adds a Python selftest that checks Generic Netlink multicast group
IDs that no family owns cannot be joined. It covers
setsockopt(NETLINK_ADD_MEMBERSHIP), bind() with a group mask, and
loading drop_monitor after a bind(). The free IDs come from a family
dump, and the checks are meant to be skipped outside the initial
network namespace.

> diff --git a/tools/testing/selftests/net/nl_genl_mcast.py b/tools/testing/selftests/net/nl_genl_mcast.py
> new file mode 100755
> index 0000000000000..4e86a5556b627
> --- /dev/null
> +++ b/tools/testing/selftests/net/nl_genl_mcast.py

[ ... ]

> +def _free_ids(ctrl):
> +    """Return the IDs in 1..32 that no family owns."""
> +    # Outside init_net, the dump skips the families that are not netnsok,
> +    # but their groups are still owned.
> +    try:
> +        netns = os.stat('/proc/self/ns/net').st_ino
> +        init_netns = os.stat('/proc/1/ns/net').st_ino
> +    except OSError as e:
> +        raise KsftSkipEx("cannot check the network namespace") from e
> +    if netns != init_netns:
> +        raise KsftSkipEx("not in the initial network namespace")

[Severity: Medium]
Does comparing against /proc/1/ns/net actually detect init_net?

/proc/1 is resolved in the PID namespace of the procfs mount. Some
containers have their own PID and network namespaces, for example Docker
or Podman without --net=host, or systemd-nspawn. There, PID 1 is the
container's init and shares the test's non-init netns. The inodes match,
so this skip doesn't fire.

In that netns, ctrl_dumpfamily() hides the families that are not
netnsok:

net/netlink/genetlink.c:ctrl_dumpfamily() {
    ...
	if (!rt->netnsok && !net_eq(net, &init_net))
		continue;
    ...
}

genl_bind() still walks the global genl_fam_idr with no netns or netnsok
filter, so the groups of those families are still owned.

acpi_event_genl_family in drivers/acpi/event.c is one example. It has an
mcast group, no .netnsok, and is registered on any ACPI system. The
NET_DM events group is another one if drop_monitor is loaded on the
host.

Those IDs then land in the free list. In join_free(),
setsockopt(NETLINK_ADD_MEMBERSHIP) on the acpi_event group succeeds. On
the NET_DM group without CAP_SYS_ADMIN it raises PermissionError. Either
way, ksft_raises(FileNotFoundError) fails.

In bind_mask(), netlink_bind() keeps the bits that genl_bind() accepted,
so ksft_eq(_members(sk), 0) fails as well.

Because of this, the commit message statement "these checks are skipped
outside the initial one" doesn't hold in that setup.

Separately, a non-root user can't stat /proc/1/ns/net, because it needs
ptrace read access to PID 1. That gives EACCES, and the OSError branch
skips the tests. Should the commit message mention this case?

[ ... ]

> +def bind_before_family(ctrl) -> None:
> +    """A free ID joined with bind() stays unjoined when a family takes it."""
> +    names = [fam['family-name'] for fam in ctrl.getfamily({}, dump=True)]
> +    if 'NET_DM' in names:
> +        raise KsftSkipEx("NET_DM is already registered")
> +
> +    free = _free_ids(ctrl)
> +    with _sock() as sk:
> +        sk.bind((0, sum(_bit(gid) for gid in free)))
> +
> +        # Looking up the family loads drop_monitor.
> +        try:
> +            ids = _groups(ctrl.getfamily({'family-name': 'NET_DM'}))
> +        except NlError as e:
> +            raise KsftSkipEx("drop_monitor is not available") from e

[Severity: Low]
Should drop_monitor be unloaded again once this test is done?

ctrl_getfamily() autoloads it here:

net/netlink/genetlink.c:ctrl_getfamily() {
    ...
	request_module("net-pf-%d-proto-%d-family-%s",
		       PF_NETLINK, NETLINK_GENERIC, name);
    ...
}

No exit path in bind_before_family() removes the module again. That
covers the success path, the "NET_DM got no group ID that was free"
skip, and an assertion failure.

Every later run on the same boot then hits the "NET_DM is already
registered" skip at the top of bind_before_family(). So this check runs
at most once per boot, and reruns only report SKIP.

> +
> +        if not any(gid in free for gid in ids.values()):
> +            raise KsftSkipEx("NET_DM got no group ID that was free")
> +
> +        for name, gid in ids.items():
> +            ksft_eq(_members(sk) & _bit(gid), 0,
> +                    comment=f"member of NET_DM {name}")

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123155503.2497063-1-anilkaushikwireless%40gmail.com
