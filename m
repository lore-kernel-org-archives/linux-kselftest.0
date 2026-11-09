Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230580;
	b=YIRH0zVz5QQRk201aFOyx6TpEO3VQQvqfwFTA6G7MmWdGZKF5iSqZAW+yCYPOq1yzVHW
	 lki2vpauOYX96o0nkzXNURgMjJIfJxZM9pQ684yU9lezpGcb2J01zCPWuutw79e4K9AW3
	 v8HJNb02O8GXJ1n0PiMQ7qB6/nx7GCXCoS7b38ys/YDiMn/Z1h+awoLaRqkcNvSyiPe5v
	 xLZL5Ry3/gKV71gRCwZje6zuaz3kpZ8LUCMTiGJBVb/lrDTMb812kzu/fzwNpYiq8aXS6
	 pbvXfAVsjltAPLY3vG6sVkfNuVG3z2rCzIxKK75B4RvM7O8+gozv689yQnHHCqQxLGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230580;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=aNeBirIUYExIj5uKDk4rdTAYjqz1qjzH1K2bqDl833g=;
	b=EkCrbl4+zZ4LiylHh51pjnFzA03N7g9wX84nL9pLYwTjxM4Ra5Xb6RMMOhOIfg1D8Low
	 uhOF2yTSVM65v33iOj8KV0GdmBr23EOEigXw0UYV/V1luTKnoCpNjS0l8td3twKyJjp6V
	 FYO9dO12fL3tODRMekCVOLbYHkqpGX0E5qaj1kz5xz77//sqq1gi9cOU+fx553DBNBFsb
	 yCzikRmuR517sXN2R1aSJssEQUG/n4EkbsI250MjlfuhjFOt6jV0CclODS6LfwsUD8uao
	 Bqikh/xZjZEEwXqyxeYsb6+gYubWxy38sSTUR1WQM1s8WvniIG8GLXFRs7jha41MrRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lJAjWdJx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ADB606A31C;
	Mon,  9 Nov 2026 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lJAjWdJx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487161F0089F;
	Mon,  9 Nov 2026 13:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794230580;
	bh=aNeBirIUYExIj5uKDk4rdTAYjqz1qjzH1K2bqDl833g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lJAjWdJxlw9hpyML/OELbLAfBorRSWGwszd0Nn1CjB3EOUBFaZadXMIRL9jJRxbnr
	 l2fHFshdXx+bsSu7A6Z91v4PVmA3jOPfG8ytsbdci95p/Lh1JghVqRzNW6v7qbFu5A
	 jIrioRlOEqVRO2G76R8YMTOupCOPIfCgwp6vhSnuhnBgLRPNoHt/CIF2awQ6khU4/m
	 CoN2JoX3XseVGvW4agfTjjETMKKeSDR9UxmNaraKA65jFOMCSt6s1souQ16VfriRGU
	 VeTJ76U6NId94UfG9QqhX8P5A2c/62ZEQ+c5mGQi9l0kbJdePjPNA/c6Br8n8qxcSj
	 xvrfNED5Rh+xw==
Subject: Re: [PATCH net v2 1/2] net: openvswitch: do not record user features
 when the change fails
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, jhs@mojatatu.com,
 paulb@nvidia.com, dev@openvswitch.org, linux-kselftest@vger.kernel.org
Date: Mon, 09 Nov 2026 13:22:58 +0000
Message-ID: <179423057882.994134.14676780013911062883@kernel.org>
In-Reply-To: <20261108123424.2825403-2-houminxi@gmail.com>
References: <20261108123424.2825403-2-houminxi@gmail.com>
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

- [Low] The commit message says "cls_flower, the bridge, the flow
  dissector and OVS hold references to it" about the tc_skb_ext_tc…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but each failed
  OVS_DP_CMD_NEW leaks one tc_skb_ext_tc static key reference, with no…

--

net: openvswitch: do not record user features when the change fails

This patch moves the store to dp->user_features in ovs_dp_change() so it
happens after the per-cpu upcall port ID update. A failed OVS_DP_CMD_SET
therefore no longer records the new features. The tc_skb_ext_tc enable and
disable decisions now use the local user_features variable.

> tc_skb_ext_tc is one static key for the whole host. cls_flower, the
> bridge, the flow dissector and OVS hold references to it, and the key
> stays on while any of them holds one.

[Severity: Low]
Is this list of reference holders accurate? Only cls_flower and
openvswitch call tc_skb_ext_tc_enable() and tc_skb_ext_tc_disable(). In
net/sched/cls_api.c those two wrap static_branch_inc() and
static_branch_dec().

The bridge and the flow dissector only read the key through
tc_skb_ext_tc_enabled():

net/core/flow_dissector.c:
	if (tc_skb_ext_tc_enabled()) {

net/bridge/br_private.h:
	if (!tc_skb_ext_tc_enabled())

The description of what happens to these readers is still correct. Could
the sentence say that cls_flower and OVS hold references, and that the
bridge and the flow dissector only depend on the key?

> diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
> index b2a0b09fd4a56..00043aef2d030 100644
> --- a/net/openvswitch/datapath.c
> +++ b/net/openvswitch/datapath.c

[ ... ]

> @@ -1812,10 +1810,12 @@ static int ovs_dp_change(struct datapath *dp, struct nlattr *a[])
>  			return err;
>  	}
>  
> -	if ((dp->user_features & OVS_DP_F_TC_RECIRC_SHARING) &&
> +	dp->user_features = user_features;
> +
> +	if ((user_features & OVS_DP_F_TC_RECIRC_SHARING) &&
>  	    !(old_features & OVS_DP_F_TC_RECIRC_SHARING))
>  		tc_skb_ext_tc_enable();

[Severity: High]
This is a pre-existing issue that this patch did not introduce. Can every
failed OVS_DP_CMD_NEW leak one tc_skb_ext_tc reference?

In ovs_dp_cmd_new() the dp is newly allocated, so old_features is 0. A
request that carries OVS_DP_F_TC_RECIRC_SHARING always gets to
tc_skb_ext_tc_enable() here.

If new_vport() then fails, for example with -EEXIST because the name is
already taken, the error path frees dp without a matching disable:

net/openvswitch/datapath.c:ovs_dp_cmd_new() {
    ...
	err = ovs_dp_change(dp, a);
	if (err)
		goto err_unlock_and_destroy_meters;

	vport = new_vport(&parms);
	if (IS_ERR(vport)) {
	...
		goto err_destroy_portids;
	}
    ...
err_destroy_portids:
	kfree(rcu_dereference_raw(dp->upcall_portids));
    ...
err_destroy_dp:
	kfree(dp);
    ...
}

The only disable at teardown is in __dp_destroy(), and this path never
gets there:

	if (dp->user_features & OVS_DP_F_TC_RECIRC_SHARING)
		tc_skb_ext_tc_disable();

ovs_dp_reset_user_features() has the same gap. It sets
dp->user_features = 0 on an existing datapath without a disable. After
that, __dp_destroy() will not drop the reference, and a later SET that
turns the bit back on takes another one.

The commit message says these paths "still leave the key one enable
ahead". OVS_DP_CMD_NEW only needs CAP_NET_ADMIN in a user namespace that
owns the netns. Can't the sequence be repeated, adding one enable for
each failure? For example, create datapath X, then keep sending NEW for
X with TC_RECIRC_SHARING.

That would leave the host-wide key stuck on, and cls_flower and OVS
could no longer turn it off. When the count reaches INT_MAX,
static_key_fast_inc_not_disabled() refuses the increment. The
WARN_ON_ONCE() in static_key_slow_inc_cpuslocked() then fires, and that
panics hosts running with panic_on_warn.

The next patch in the series only changes selftests, so this is still
there after the series. Would it make sense to add a
tc_skb_ext_tc_disable() to the ovs_dp_cmd_new() error path and to
ovs_dp_reset_user_features()?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261108123424.2825403-1-houminxi%40gmail.com
