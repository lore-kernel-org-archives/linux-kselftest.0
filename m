Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5371942E42C;
	Tue, 15 Sep 2026 06:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452267; cv=none; b=IPW6JdMtQYwNgC8FW7BTjHPgymRejPCTEAKDqtqYx+eoCDvRSVnmFIE5a2UqPxdbsGFsOHEkVX/Zc2HFS/zwCwawr5DpnvMA7AQ3v5yrOqmxz4M/HAxunDDQURp0eRWcGVbPZwtboDR0akg49nkKMJ0IZzAoybRybvgHjS7OU44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452267; c=relaxed/simple;
	bh=ZDquD5VWIvUhppVwEp/0zYUJq5Mp9j1h5a/1yrT8lCs=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jiUWQn5vtbTdO5CtiJAHHW+w2AvGHabLEPG0L9qWIQfGBvbXh27hD9LI3RDy85WFH0r0Cj1TwftfyK2Z+suRTr39c+ldpCqWLxoFgNT6b+rlwb+bVvM1R413VC04YJa8ybvvN/1b3sC9iig5i5rEo+xox2IvV02zsCuBuiIuMHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJN0+diB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJN0+diB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C8A1F000FF;
	Tue, 15 Sep 2026 06:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789452264;
	bh=fX+PsnjgHG6hqm/1A1ftLGS4DNmg/riIF50tsTdV5KU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SJN0+diBVLlNKE3vz5kyOkJp9s2NuuOKZsKQwCkascMJfrpmEIEAckC05u1r1xemS
	 zGnJGl5248XKTpXES0IrW06f5UA6dlchrdFqJ4vwdL9nTGLhfDm/bDvjaUK8AN0ZbR
	 V73EWHq6qdatZU31T48d2Vyhy6kVYfwpcf5CpuMSjcedfGzKtS2yNb7AUBELrKqhQB
	 hrQ4eIVglI0hZpAdN8NMqEFfzeE8cbqThdY1wcWa4HCvU5YKJNFTO3VSBsWHMl9KRl
	 4ndsy7retWY5/+hG6vueWE5uyiMuzVYW3SnD7vgilgrJsdql+RpZldsx4Yi4B9Fzss
	 zCpQ4BALHJt/A==
Subject: Re: [PATCH net-next 2/6] psp: don't report the main netdevice's
 ifindex to associated namespaces
From: netdev-bot+sashiko@kernel.org
To: kuba@kernel.org
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 daniel.zahka@gmail.com, willemdebruijn.kernel@gmail.com,
 donald.hunter@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 15 Sep 2026 06:04:23 +0000
Message-ID: <178945226311.22033.17255405958222817792@kernel.org>
In-Reply-To: <20260912200426.121025-3-kuba@kernel.org>
References: <20260912200426.121025-3-kuba@kernel.org>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 3

- [Medium] psp_nl_dev_fill() (net/psp/psp_nl.c:294-312) stops emitting
  PSP_A_DEV_IFINDEX in every dev-get reply / dump entry / dev-…
- [Low] The emitter contract changed (PSP_A_DEV_IFINDEX is now optional
  in dev-get replies/dumps) but the in-tree consumers still treat it as…
- [Low] As of this patch alone, psp.yaml documents that PSP_A_DEV_IFINDEX
  is 'Only reported to the network namespace the main netdevice lives…
- [Low] psp_nl_dev_fill() (net/psp/psp_nl.c:301-305) decides whether to
  report PSP_A_DEV_IFINDEX with `cur_net == dev_net(psd->main_netdev)`…

--

psp: don't report the main netdevice's ifindex to associated namespaces

PSP_A_DEV_IFINDEX is moved inside the branch that handles the main
netdevice's namespace in psp_nl_dev_fill(), so namespaces which only see
the PSP device by association no longer get the main netdev's ifindex.
The psp.yaml spec documentation for the attribute is updated to describe
the new rule.

A few questions below.

> diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink/specs/psp.yaml
> index e9c2ee7e28e02..f3266763c3253 100644
> --- a/Documentation/netlink/specs/psp.yaml
> +++ b/Documentation/netlink/specs/psp.yaml
> @@ -38,6 +38,8 @@ attribute-sets:
>          doc: |
>            ifindex of the main netdevice linked to the PSP device,
>            or the ifindex to associate with the PSP device.
> +          Only reported to the network namespace the main netdevice
> +          lives in, an ifindex has no meaning outside of it.
>          type: u32

[Severity: Low]
As of this commit, is the newly documented rule verified anywhere in
tree?  The only test which inspects dev-get output taken from an
associated namespace is _psp_dev_get_check_netkit_psp_assoc() (Check 2)
in tools/testing/selftests/drivers/net/psp.py, and at this commit it only
looks for the by-association entry and validates the assoc-list.

Note the following patch in the series, "selftests: drv-net: psp: check
the ifindex an associated netns sees", adds exactly the missing
assertions:

        ksft_true('ifindex' not in peer_dev,
                  "ifindex reported to an associated namespace")

and the equivalent check in _check_disassoc_ntf(), so the gap is closed
before the end of the series.  Mentioning this only for completeness.

> diff --git a/net/psp/psp_nl.c b/net/psp/psp_nl.c
> index f91665748dde0..b57366b5e032b 100644
> --- a/net/psp/psp_nl.c
> +++ b/net/psp/psp_nl.c
> @@ -294,13 +294,16 @@ psp_nl_dev_fill(struct psp_dev *psd, struct sk_buff *rsp,
>  		return -EMSGSIZE;
>  
>  	if (nla_put_u32(rsp, PSP_A_DEV_ID, psd->id) ||
> -	    nla_put_u32(rsp, PSP_A_DEV_IFINDEX, psd->main_netdev->ifindex) ||
>  	    nla_put_u32(rsp, PSP_A_DEV_PSP_VERSIONS_CAP, psd->caps->versions) ||
>  	    nla_put_u32(rsp, PSP_A_DEV_PSP_VERSIONS_ENA, psd->config.versions))
>  		goto err_cancel_msg;
>  
>  	if (cur_net == dev_net(psd->main_netdev)) {
> -		/* Primary device - dump assoc list */
> +		/* Primary device - report the netdev, dump assoc list. */
> +		if (nla_put_u32(rsp, PSP_A_DEV_IFINDEX,
> +				psd->main_netdev->ifindex))
> +			goto err_cancel_msg;
> +

[Severity: Medium]
Should this carry a Fixes: tag?

The unconditional PSP_A_DEV_IFINDEX in psp_nl_dev_fill() has been in the
dev-get reply, the dump entries and the dev add/change/del notifications
since 06c2dce2d0f69 ("psp: add new netlink cmd for dev-assoc and
dev-disassoc"), which was based on v7.1-rc7 and therefore shipped in the
released v7.2.  The tree here is v7.3.0-rc2.

That means the message layout narrowed between two released kernels for
the same command: an application built against v7.2 sees the attribute in
by-association messages, while v7.3 and later omit it, and netlink gives
userspace no way to probe for the difference.

Would adding

  Fixes: 06c2dce2d0f69 ("psp: add new netlink cmd for dev-assoc and dev-disassoc")

plus a sentence in the changelog about the userspace-visible narrowing be
appropriate, so the correction lands in the same stable trees as the
feature?

[Severity: Low]
With the attribute now optional, do the in-tree consumers still handle a
dump that mixes entries with and without it?

tools/testing/selftests/drivers/net/psp.py, _init_psp_dev():

        for dev in cfg.pspnl.dev_get({}, dump=True):
            if dev['ifindex'] == target_ifindex:

ynl omits absent attributes, so a dump containing a by-association entry
raises a Python KeyError here and aborts the test file, where before this
patch it fell through to the clean:

        raise KsftSkipEx("No PSP devices found")

Would dev.get('ifindex') be better?  In the suite as configured every
_init_psp_dev() call uses the host-namespace socket, so the current tests
should not hit it, but the dump is no longer guaranteed to contain the
key.

The same applies more mildly to tools/testing/selftests/drivers/net/
psp_responder.c, in the -i selection loop in main():

        if (opts.ifindex) {
            if (d->ifindex != opts.ifindex)
                continue;

With the attribute absent d->ifindex is 0, so such a device is silently
skipped and the responder reports the device as not found.  This one is
not a behaviour regression as such, since the top-level ifindex it
compared previously belonged to another namespace anyway.

[Severity: Low]
Can the namespace test and the ifindex read disagree here?

The branch predicate reads dev_net(psd->main_netdev) and the attribute
then performs a second, independent read of psd->main_netdev->ifindex.
The psp family is registered with parallel_ops and the dev-get and
notification paths take only psd->lock, no RTNL, while a concurrent
migration in netif_change_net_namespace() publishes the netns before the
new ifindex:

net/core/dev.c:netif_change_net_namespace() {
    ...
    netdev_lock(dev);
    dev_net_set(dev, net);
    netdev_unlock(dev);
    dev->ifindex = new_ifindex;
    ...
}

Nothing in psp re-pins the psd on a netns move - psp_netdev_event() bails
out for anything other than NETDEV_UNREGISTER:

net/psp/psp_main.c:psp_netdev_event() {
    if (event != NETDEV_UNREGISTER)
        return NOTIFY_DONE;
    ...
}

so a reader can pass the test with the old netns and then serialize the
ifindex the device has in its new namespace, which is the case the doc
hunk declares meaningless.  Symmetrically, a notification built for the
main_net already pinned by psp_nl_multicast_per_ns() can flip to the
by-association encoding, since psp_nl_dev_fill() re-reads dev_net()
rather than using that pinned net:

net/psp/psp_nl.c:psp_nl_multicast_per_ns() {
    /* device may be changing netns in parallel */
    rcu_read_lock();
    main_net = maybe_get_net(dev_net_rcu(psd->main_netdev));
    rcu_read_unlock();
    ...
}

Would reading the netns and the ifindex once under a single
rcu_read_lock() with dev_net_rcu(), or passing the already-pinned
main_net down into psp_nl_dev_fill(), close the window?  The
consequence is only a stale or foreign u32 in one message.

>  		err = psp_nl_fill_assoc_dev_list(psd, rsp, cur_net, NULL);
>  		if (err)
>  			goto err_cancel_msg;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260912200426.121025-1-kuba%40kernel.org
