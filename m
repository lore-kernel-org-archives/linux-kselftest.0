Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794139479;
	b=sA1p5canxPVxMq0gtuu8iYc7YLg0kEvnFcjdw+/pF2/27LaSZgmtFpxHVRPkUQ1ziQAT
	 NYZxZru6y+HiRN8hCumIvSTMTf+Opd0Nk2bXbYp+FwPlm8J7IWU9GImTazipvNdl+x9+3
	 S7M7xWG+P0X7VXjxGLLdtO6TQ4t20k4QSg0f5zprcdymDyLYqrc3l7RqLhQ6ZNOAKFWGV
	 JE4l37NtIySx0H5fMp1TKrsd5hr5MR+nC69k7cMAKrJki5yL09DysdScE/vCyjiVGuH9b
	 CbmeNUWRoZVo0FUG0XYgApBEpYebaq8Ija8btVPG88ucTQlw2ZqfCr+TIzAqQJewbnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794139479;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Wb8eRjnwc9cUIRttGY09a9xgkF3rw+IiAl215Pk7qnY=;
	b=5Zfq9513k4qjdlDHKlhMOkxDai2QqNYJ6nT1SDQCZdZwQzOuW8ihL083/vPDzsxVwtW6
	 ZQQrAirDDEB2c285CyxqHMN6PSQYlCHVTbiXOCfIswKwTtKLmjG5/hwRaSSni5ng4QabR
	 OtmkzjCDVVrSXvcl94s/QA2IACbpEir47atsJdBRZt8N1PBagy41tP0IjeZbOaz81CMZX
	 L6WUZenGXBiwWQ7TmyKCiXdR+KHKgyOHgmQ2F4XHcDpaADkeesFs/f8NZi089p+2PTWmH
	 xD0bmFBd6sAVHrS0WNHyY02srXWXVFsGcRjDEzuCcxDqpwz2LGnKGmkwaUN7h5Z9l0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CNh1nA9T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387A9606A31C;
	Sun,  8 Nov 2026 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CNh1nA9T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68B81F0089F;
	Sun,  8 Nov 2026 12:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794139478;
	bh=Wb8eRjnwc9cUIRttGY09a9xgkF3rw+IiAl215Pk7qnY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CNh1nA9TmvwB+462UZ+RlEIeRxSPCvs3c1z/KwLsYe+bZz2PfTU93wcUltRX42Y8W
	 o7cNem/dFfNn3xjktp1xLtKJHzPg6jGmjI7qqt5yIQgck6D5p11UVCD8tI5qg26d3P
	 xqj9fct/9u8p9eqQC4oXvuei2NMZiPifP5KHNcWsUn5psIGl0DgVuCXbRplBA7ICoF
	 1PKTKLNA08Mmt89lILh1ICDCtU8Gi056FCmNqFT1L6rSKHfaYdPK070ntpnW9w+H7C
	 vubKOvXInupD2Ilor4jqrJeCF4gDkiQ76EzY94zsZ+rmB1mTpwvVCRLBEDRF9po9kr
	 MpabeI93Agr5A==
Subject: Re: [PATCH net v1 1/2] net: openvswitch: do not record user features
 when the change fails
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, jhs@mojatatu.com,
 paulb@nvidia.com, dev@openvswitch.org, linux-kselftest@vger.kernel.org
Date: Sun, 08 Nov 2026 12:04:37 +0000
Message-ID: <179413947720.994134.15071187484931474185@kernel.org>
In-Reply-To: <20261107113403.797779-2-houminxi@gmail.com>
References: <20261107113403.797779-2-houminxi@gmail.com>
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

- [Medium] The commit message says "A failed request then leaves both the
  features and the key alone".
- [Low] The commit message understates who can trigger the fixed bug and
  what happens.

--

net: openvswitch: do not record user features when the change fails

This patch moves the store of the new features into dp->user_features in
ovs_dp_change() so it happens after ovs_dp_set_upcall_portids() succeeds.
The enable and disable decisions for the tc skb extension static key now
use the local user_features variable. A failed request should no longer
leave the recorded features and the key out of step.

> That key is a
> reference count shared with cls_flower, so the count ends up one short
> and reaches zero while other users still hold a reference.

[Severity: Low]
Could the commit message say more about who can trigger this and what
happens?

OVS_DP_CMD_SET and OVS_DP_CMD_NEW use GENL_UNS_ADMIN_PERM, and
dp_datapath_genl_family sets netnsok, so CAP_NET_ADMIN in a user namespace
is enough. The ops use GENL_DONT_VALIDATE_STRICT and datapath_policy has
no entry for OVS_DP_ATTR_PER_CPU_PIDS. An empty attribute therefore gets
through validation and reaches the -EINVAL in ovs_dp_set_upcall_portids().

tc_skb_ext_tc is a single global key in net/sched/cls_api.c, read by tc,
the bridge, the flow dissector and OVS. One crafted SET from a container
can change skb-ext behaviour for the whole host.

When OVS is the only user of the key, the pre-patch sequence is: a failed
SET records the bit, then a later SET clears it. That calls
tc_skb_ext_tc_disable() with the count at zero, which hits the WARN in
static_key_dec_not_one():

kernel/jump_label.c:static_key_dec_not_one() {
    ...
	if (WARN_ON_ONCE(v == 0))
		return true;
    ...
}

When cls_flower does hold a reference, its own later disable hits the same
WARN. With panic_on_warn set, the system panics.

Would it be worth mentioning the WARN and the user namespace reachability
in the changelog, so stable and security triage can weigh the fix?

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

[Severity: Medium]
The commit message says "A failed request then leaves both the features
and the key alone". Is that true for a failed OVS_DP_CMD_NEW?

In ovs_dp_cmd_new(), ovs_dp_change() runs on a fresh dp where
old_features is 0. A request that carries OVS_DP_F_TC_RECIRC_SHARING
therefore takes the tc_skb_ext_tc_enable() branch above.

new_vport() can then fail. Examples are -EEXIST when a netdev with that
name already exists, -ENOMEM, or an ifindex conflict:

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
err_unlock_and_destroy_meters:
	ovs_unlock();
	ovs_meters_exit(dp);
    ...
err_destroy_dp:
	kfree(dp);
    ...
}

That unwind never calls tc_skb_ext_tc_disable(). The dp was never added
to ovs_net->dps, so __dp_destroy() does not run for it either.

Does each such request leak one reference on the global tc_skb_ext_tc
key? That would leave the key "enabled for good", which the commit
message lists as part of the bug.

The -EEXIST branch has a second path. When genlhdr->version is below
OVS_DP_VER_FEATURES, it calls ovs_dp_reset_user_features() on the
existing datapath:

net/openvswitch/datapath.c:ovs_dp_reset_user_features() {
    ...
	dp->user_features = 0;
}

This clears OVS_DP_F_TC_RECIRC_SHARING without calling
tc_skb_ext_tc_disable(). __dp_destroy() decides from dp->user_features:

	if (dp->user_features & OVS_DP_F_TC_RECIRC_SHARING)
		tc_skb_ext_tc_disable();

so that reference is never dropped. A later SET that sets the bit again
takes another one.

The commit message does name both paths and leaves them out of scope. Both
end in the same state this patch fixes in ovs_dp_change(): the bit in
dp->user_features no longer matches exactly one held key reference. Both
can be reached with CAP_NET_ADMIN in a user namespace, and the effect
applies to the whole host.

Two possible fixes:

- In the NEW unwind, call tc_skb_ext_tc_disable() when dp->user_features
  has the bit, or delay the enable until the request succeeds.

- In ovs_dp_reset_user_features(), call tc_skb_ext_tc_disable() when it
  clears the bit.

Since the patch has Cc: stable, could the closing sentence be narrowed?
Otherwise backporters may read it as meaning failed requests now keep the
key balanced in all cases.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261107113403.797779-1-houminxi%40gmail.com
