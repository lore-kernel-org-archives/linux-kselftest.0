Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753088;
	b=kA9MPDpHcywmEHuIv0tQrsekt2mC8+Yvq+VZuIiAXkBRRAgQ+xCg9aeg/YJ57pcJp4ms
	 Y3hkAWWFCFRsW/qm/YI3i93/lYV5jvqSmz+C8TOqb8+D0wrjwmvNhYhFnWJYOYtJF/Q6A
	 XrzPqdQsfeCoJJM1/B1sZyODrmAym3aYB3K+Tzzv0gyXC50O0oe8WfVjj12dLBfaaYUBN
	 vMh2y4AY59qfK769H28WNDiZRHSqU+F/OQ2C+XleTOytclEtROSirM9MuTdzvX1VlpZ0i
	 mFOK/B/bHQeZBhMqVO0c59sz0CIyRRR+28APrDtLJW6tjhBDwA7G+fM4QhKWaXNJFew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753088;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xDaWwYamnM8xFgiMskxFb1AkwtDbpPrZEs7/nRoZh10=;
	b=dl16GovmZN8KIQcxJaeYwZ+SLo4yV62knrJ6cPXpsMN85iL/uXnOgP3LxzVYRPLSR2V7
	 bP4Pznvbv1v4ckLC5090gFM+vbkJ0Re1MvOgCJM607VuveWZhGe/eEcpjwxffZM4sqInY
	 RCZv9CHz2+Tbd7YWsIIpylo1bBxJ1zmadt7Hy9zsAIxPj3YIQmN31cBPXYaUlhEv2gkVx
	 CLa1Vazm5Z6eVXMK9VpiOkVM2z2qw+VAWAndbuI3hxas7FtriaT84hZZ4L9NWnMYQvcbg
	 cKok5ZB5AF0FwFiHbDULHWNEoWaQvpiBRhxKGymrs4RnrlK9HiDwq11kO/M7Vh1GZ8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2gVgahM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C803C606A335;
	Wed,  4 Nov 2026 00:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2gVgahM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A311F0093A;
	Wed,  4 Nov 2026 00:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793753087;
	bh=xDaWwYamnM8xFgiMskxFb1AkwtDbpPrZEs7/nRoZh10=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=N2gVgahM1JnQBqJ9NY7L/7RnEhKM1tIO7WEh1uWGlxsOTH3bcjO21ozBzKZwxbBEV
	 XFZt/PmHlBpKYsXyKJStEcFyxBWAEnwbzEFaFUvtDjhFua7EOwVlDtUOjDc8aZ32S3
	 US5J13Te3US01ru9Z1WZHl5DK8RxD7wkK9eYkLqHFh+hL1NHvEA/P5yihx/fsIpUhj
	 /x5lYZ97+1Bs+f7ibEpcSlfmOGlvtWqedMoMVWEdxaADIpZy0x45ZKdzAasdvwsOjP
	 XOpC+C8GG4s4Axnlcs/Aw/Hb6AOw0dAfb9FLKekkhe9YPpmmuLte+Ebhbo9KW8DgBh
	 ifhiROVZCnAfg==
Subject: Re: [PATCH net v4 5/7] selftests: drv-net: psp: test ipv6 tcp socket
 with extension headers
From: netdev-bot+sashiko@kernel.org
To: toddfreed@meta.com
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sashiko-bot@kernel.org, kuba@kernel.org, bjorn@kernel.org
Date: Wed, 04 Nov 2026 00:44:46 +0000
Message-ID: <179375308652.488856.5309560182914770139@kernel.org>
In-Reply-To: <20261103001143.246081-6-toddfreed@meta.com>
References: <20261103001143.246081-6-toddfreed@meta.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] _remote_count() treats only an existing qdisc of kind 'clsact' as
  usable.
- [Low] data_send_ipv6_exthdr() installs the extension-header socket
  option in phase 2 (`s.setsockopt(socket.IPPROTO_IPV6, opt,…

--

selftests: drv-net: psp: test ipv6 tcp socket with extension headers

This adds a PSP selftest that sends on an IPv6 PSP TCP socket in three
phases: no option, an extension header option set (dstopts, hopopts or
rthdr), then the option removed. After each phase it checks the device
tx-packets counter and what the peer received. A software flower filter on
the remote counts and drops any UDP packets that leak out.

> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
> index a5b1e14f120f0..c9a725cc89a27 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py

[ ... ]

> +def _remote_count(cfg, proto, match):
> +    """
> +    Count, and drop, the @proto packets matching flower @match which reach
> +    the remote, with a software filter on its ingress (offloaded filter
> +    counters are refreshed periodically). Dropping keeps such packets away
> +    from the remote's stack. Returns a function reading the count, or None
> +    if the filter can't be installed.
> +    """
> +    flt = (f"dev {cfg.remote_ifname} ingress protocol {proto} pref 1 "
> +           f"handle 0x5053 flower")
> +    try:
> +        qdiscs = tc(f"qdisc show dev {cfg.remote_ifname}", json=True,
> +                    host=cfg.remote)
> +        if not any(q['kind'] == 'clsact' for q in qdiscs):
> +            tc(f"qdisc add dev {cfg.remote_ifname} clsact", host=cfg.remote)

[Severity: Low]
What happens here if the remote already has a plain ingress qdisc rather
than clsact?

clsact and ingress use the same ingress parent. tc qdisc add sends
NLM_F_EXCL, so tc_modify_qdisc() rejects the request:

net/sched/sch_api.c:tc_modify_qdisc() {
    ...
				if (n->nlmsg_flags & NLM_F_EXCL) {
					NL_SET_ERR_MSG(extack, "Exclusivity flag on, cannot override");
					return -EEXIST;
    ...
}

The CmdExitFailure is caught and _remote_count() returns None. Then
data_send_ipv6_exthdr() raises KsftSkipEx("can't count UDP on the remote").

The existing ingress qdisc would accept the "filter add dev X ingress ...
flower ... action drop" command unchanged, so the test skips even though it
could run.

Should the check also accept a qdisc of kind 'ingress'?

The later patch "selftests: drv-net: psp: test that ipv4 psp packets aren't
fragmented" reuses this helper, so it would skip in the same way.

> +            defer(tc, f"qdisc del dev {cfg.remote_ifname} clsact",
> +                  host=cfg.remote)
> +        tc(f"filter add {flt} skip_hw {match} action drop", host=cfg.remote)
> +    except CmdExitFailure as e:
> +        ksft_pr(f"Can't install a filter on the remote: {e}")
> +        return None

[ ... ]

> +@ksft_variants(_ipv6_exthdr_variants())
> +def data_send_ipv6_exthdr(cfg, opt, val):

[ ... ]

> +        # 2. With the option: dropped, not counted, and nothing reaches the
> +        # peer. The data stays queued.
> +        s.setsockopt(socket.IPPROTO_IPV6, opt, val(peer))
> +        tx_pkts = _get_quiesced_stat(cfg, 'tx-packets')
> +        udp = remote_udp()
> +        queued = _send_careful(cfg, s, 20)
> +        _check_data_outq(s, queued, force_wait=True)
> +        ksft_eq(_get_quiesced_stat(cfg, 'tx-packets'), tx_pkts)
> +        ksft_eq(remote_udp(), udp, comment="UDP at the remote")
> +        _check_data_rx(cfg, total)
> +        total += queued
> +
> +        # 3. Option removed: the queued data, then new data, sent and
> +        # received
> +        tx_pkts = _get_quiesced_stat(cfg, 'tx-packets')
> +        s.setsockopt(socket.IPPROTO_IPV6, opt, b'')
> +        wait_outq_empty()
> +        total += _send_careful(cfg, s, 20)
> +        wait_outq_empty()
> +        ksft_gt(_get_quiesced_stat(cfg, 'tx-packets'), tx_pkts)
> +        _check_data_rx(cfg, total)
> +    finally:
> +        _close_psp_conn(cfg, s)

[Severity: Low]
If an exception is raised after the phase 2 setsockopt() and before the
phase 3 setsockopt(..., b''), the finally block closes the socket with the
extension header option still set and data still queued.

Possible sources are a RuntimeError from _send_careful(), KsftFailEx("no
action on the remote filter") from remote_udp(), CmdExitFailure from the
remote tc/ssh calls, or netlink errors from _get_quiesced_stat(). Plain
ksft_eq() failures don't raise, so they don't hit this.

On a fixed driver every packet from this socket is dropped, including
retransmits, the FIN, and the ACK for the peer's FIN. After s.close() the
socket stays as an orphan in FIN_WAIT1 until the orphan retries run out.

Until it is destroyed, sk->psp_assoc stays alive. That keeps the
psp_dev_get() reference taken in psp_assoc_create(), the entry on
psd->active_assocs, and the device TX key, which psp_assoc_free() only
removes at socket destruction.

Could the later dev, assoc and removal cases run by ksft_run see this
leftover association?

Would clearing the option in the finally block, or with a defer, before
_close_psp_conn() let the queued data drain and the connection close
cleanly?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261103001143.246081-1-toddfreed%40meta.com
