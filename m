Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846821;
	b=YMpdbkPIkzqTKxPL8TJ9AP5cEKmXuM+mqeb0fXBOwsfksGZ4J6gPuWuQIvSXqhESmbKU
	 27QTo567oWjpjxq+DVQrc12naSvNgyPLVvM8nzVODPKW2d9qNrlhCHWwGe6moFil2EFVP
	 Mo6kP7/1Lhdf+i9n+oy84tA4MbOgT6XkH23KbU/EcRQaVTAwZdwV7m8Lmvi62jlRRfn0R
	 3eBB22fRnJMwGBiayQmLhu4bwUu/kheN+fCtLowDjeeqLc6E5XrrPX+jO27R6RgWstHB3
	 3fNLsdy7QVg0B1tJPQbKknifGebrVECoPZQC+M2Q/tYyhTOR1YbIy+o86GYPqXmtkcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846821;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=H5M4PsxOirRTJY7Xf/9ZuzKVZPyqS56IjeQL35ENvRw=;
	b=s8bGbxYWPdQXD2E+NLEtEuQGtZ2iRbNq7dQl0mA0e550xLIjDqxNhJwssx/wXru1DFEx
	 A9u0CK+m3gVC2/asH7lY9tBbq1GFiFVocF0At6VH+8NhwC5fdaZsxxtNuBMRgAYbzcogH
	 1QYB7ZcXguxXgTR34UUlY6laHCjJ0/wPBcxZ9UqsbI807HWk0JS78wGiVqnIZAWkEeNeo
	 V433VE1kqAdm7LXHNLdCLm2qiragOnV1mFrpXgziBh9VTxDO6Gvg2wouwX1WOxq2l59wR
	 Au8YzUTS2ZWVPT+S79XgkTUqjN2SLPW758huFA7lH5/GE9e8eQ3IQJbk6HJhCLFzvFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDcF6mZT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E00606A339;
	Mon, 16 Nov 2026 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDcF6mZT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE7B1F000CD;
	Mon, 16 Nov 2026 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794846821;
	bh=H5M4PsxOirRTJY7Xf/9ZuzKVZPyqS56IjeQL35ENvRw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NDcF6mZTnw5jDeNXAtIXpmLyP+IdkVxeigEotB0VukEQsInc8hUQqnea98TzujDVj
	 YYmFQF7AjJ51eePqKNEaSlLMRMUd1LoKR7GxB8UVwdU1YyPLf+lIyDNwxD34yvLXil
	 N04XhqKpL/NBEwFFaLHm03vd4jsv4WcNYU3zCGHSjR7jNgAOvl1cpC+w0H0rxG6s3B
	 MLjp4bVomOI9dr1rYwQQ4DjQA+rWMr3KTrm6ST6qKC+DtfrM5GOgF5qcvVGar5P0Rf
	 1MGZgWiJ+9NbN6Yyi1ty4N+3DozORgCOHJY/FeZSxnhUn+Ks9+g6RsYNvngIK/abkV
	 OYPmqVGc6iv+g==
Subject: Re: [PATCH net v4 1/2] net: openvswitch: do not record user features
 when the change fails
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 16 Nov 2026 16:33:40 +0000
Message-ID: <179484682026.3136.13753538826492049125@kernel.org>
In-Reply-To: <20261115163134.3202677-2-houminxi@gmail.com>
References: <20261115163134.3202677-2-houminxi@gmail.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch changes __dp_destroy()
  (net/openvswitch/datapath.c:1973) so that its first statement is…

--

net: openvswitch: do not record user features when the change fails

This patch moves the write of dp->user_features in ovs_dp_change() so it
happens after the per-cpu upcall portid update. It adds
ovs_dp_set_user_features(), which keeps the tc skb extension reference in
sync with the OVS_DP_F_TC_RECIRC_SHARING bit. The helper is then used from
ovs_dp_reset_user_features(), the ovs_dp_cmd_new() error path and
__dp_destroy().

> diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
> index b2a0b09fd4a56..8fcb9f2c8ece0 100644
> --- a/net/openvswitch/datapath.c
> +++ b/net/openvswitch/datapath.c
> @@ -1704,6 +1704,20 @@ static struct datapath *lookup_datapath(struct net *net,
>  	return dp ? dp : ERR_PTR(-ENODEV);
>  }
>  
> +/* Called with ovs_mutex. */
> +static void ovs_dp_set_user_features(struct datapath *dp, u32 features)
> +{
> +	bool was = dp->user_features & OVS_DP_F_TC_RECIRC_SHARING;
> +	bool now = features & OVS_DP_F_TC_RECIRC_SHARING;
> +
> +	if (now && !was)
> +		tc_skb_ext_tc_enable();
> +	else if (!now && was)
> +		tc_skb_ext_tc_disable();
> +
> +	dp->user_features = features;
> +}
> +

[ ... ]

> @@ -1961,8 +1970,7 @@ static void __dp_destroy(struct datapath *dp)
>  	struct flow_table *table = &dp->table;
>  	int i;
>  
> -	if (dp->user_features & OVS_DP_F_TC_RECIRC_SHARING)
> -		tc_skb_ext_tc_disable();
> +	ovs_dp_set_user_features(dp, 0);

[Severity: High]
Can this early clear of dp->user_features race with upcalls that are still
in flight?

Before this patch, __dp_destroy() only dropped the tc reference. Now
ovs_dp_set_user_features() does a plain store of 0 to the whole bitmap, so
OVS_DP_F_UNALIGNED, OVS_DP_F_DISPATCH_UPCALL_PER_CPU and the other bits are
cleared too, not only OVS_DP_F_TC_RECIRC_SHARING.

When this store runs, every vport is still attached, the datapath is still
on ovs_net->dps, and call_rcu() has not run yet. Softirq readers on other
CPUs can still be inside queue_userspace_packet() for this dp, and that
function reads the field twice:

net/openvswitch/datapath.c:queue_userspace_packet() {
    ...
	if (dp->user_features & OVS_DP_F_UNALIGNED)
		hlen = min(skb_zerocopy_headlen(skb), cutlen);
    ...
    skb_zerocopy()       /* user_skb gets page frags, now nonlinear */
    ...
    pad_packet(dp, user_skb);
}

net/openvswitch/datapath.c:pad_packet() {
	if (!(dp->user_features & OVS_DP_F_UNALIGNED)) {
		size_t plen = NLA_ALIGN(skb->len) - skb->len;

		if (plen > 0)
			skb_put_zero(skb, plen);
    ...
}

Say __dp_destroy() stores 0 between these two reads. Could pad_packet()
then call skb_put_zero() on the nonlinear user_skb and hit
SKB_LINEAR_ASSERT() in skb_put()?

plen is nonzero whenever the packet length is not a multiple of 4.
ovs-vswitchd always sets OVS_DP_F_UNALIGNED. So it looks like deleting a
datapath under traffic (OVS_DP_CMD_DEL, vswitchd teardown, or
ovs_exit_net()) is enough to open this window. That needs only
CAP_NET_ADMIN in the owning user namespace.

The same clear also changes in-flight upcalls in ovs_dp_process_packet()
and output_userspace(). During teardown they fall back from per-CPU
dispatch to per-vport portid selection.

The new kernel-doc in datapath.h says:

    so this field is written last, through
    ovs_dp_set_user_features(), with ovs_mutex held.

Here, though, __dp_destroy() writes the field first, before any vport is
detached.

The datapath is only freed after an RCU grace period. As far as I can
tell, no fast-path code reads OVS_DP_F_TC_RECIRC_SHARING per dp; flow.c
checks tc_skb_ext_tc_enabled(). Would it be enough for __dp_destroy() to
keep the old conditional tc_skb_ext_tc_disable()? Or it could call
something like:

    ovs_dp_set_user_features(dp, dp->user_features &
                             ~OVS_DP_F_TC_RECIRC_SHARING);

The same bit could already be flipped racily through OVS_DP_CMD_SET and
ovs_dp_reset_user_features() before this patch. Closing that older variant
would also need queue_userspace_packet() to take one READ_ONCE() snapshot,
pass it to pad_packet(), and use WRITE_ONCE() in the setter.

The only later patch in the series, "selftests/net/openvswitch: check that
a failed set keeps the features", does not touch net/. So this is still
present at the end of the series.

>  
>  	for (i = 0; i < DP_VPORT_HASH_BUCKETS; i++) {
>  		struct vport *vport;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115163134.3202677-1-houminxi%40gmail.com
