Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EE133998;
	Tue, 15 Sep 2026 06:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452268; cv=none; b=C6rZK92oxlhr4MeY6a5P/BhmWs9JVLQWlNDBdwQpG2Rf8ctQfgURN/nzdW18LeiEI4s+zucJXIpdyDjzZqhSiWRR7ja0+py4SDMDpQAV+B70SsXAAf8Y266ZJYGEekQOF6iOwhQxlcCvypPkJ6B/GKtvlNIHF+wytq066POYICg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452268; c=relaxed/simple;
	bh=wRlRm5RGVQXTIf8FaigOdHMm9sWUI2iXYZkMq27o8kA=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F2lSWbH8tlGSH2JLKwJmtPP89OfDbaN8A5ZKcakA7T7VdMLUqRYNdf7ueXY9fhd3yPzWB6KVm0tm3K/86X/UPLPr0/CrIzAS8bwzhw8G7A2IVJahnHghz42SIUQaRH4t+qvsjPRnbXJO0BIBwfOpybcGcrmhHego9vOS+yirYjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4pTd8q5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4pTd8q5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A9C1F00893;
	Tue, 15 Sep 2026 06:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789452265;
	bh=ak6XBSdUUAQcVd+0a31LigiWxYjqMY5wvXGnsJkPEPQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=b4pTd8q5j9Qej8cAsZsImCAGpYafKABl2hmk6N38qnC3wbbJ6f3se4POf9ZbGWc2x
	 e68M9frN2X2bv/NNcRikzswWGK3Ka83k8rstqnxjCa5pg1rHGjQ+GZDr4Jvw5GhPr7
	 KkqmFBptq7UtpybqT6p/nA8EXkyCmoIh3gqaQNJhKZEHHrAsgfpSn8WoZa+zdXht5S
	 vOmOjhTZIOrLRxDIgf6AH2BAwcy7qmdgFTYzY2kV3zxENNWC1AZfFAylc5QHEUGVE0
	 Sk50eMNkaAPENdMu63z3908UXBcDwFOAcOOpBURJeUJRiqI5OO3AWlcXFW/pk6zmW5
	 56xjiLzkG7W/w==
Subject: Re: [PATCH net-next 4/6] psp: notify about a disassociation once it
 has happened
From: netdev-bot+sashiko@kernel.org
To: kuba@kernel.org
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 daniel.zahka@gmail.com, willemdebruijn.kernel@gmail.com,
 donald.hunter@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 15 Sep 2026 06:04:24 +0000
Message-ID: <178945226440.22033.5430499132880217307@kernel.org>
In-Reply-To: <20260912200426.121025-5-kuba@kernel.org>
References: <20260912200426.121025-5-kuba@kernel.org>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 2

- [Low] The patch establishes 'PSP device stopped being visible in a
  netns' => PSP_CMD_DEV_DEL_NTF (net/psp/psp_nl.c:381-388), but the…
- [Low] The commit fixes user-visible Generic Netlink behaviour ('the
  assoc-list it carried still contained the device which was going away…

--

psp: notify about a disassociation once it has happened

The disassociation notification is moved so it is generated after the
association entry has been unlinked, and a netns which loses its last
associated device is sent a dev-del-ntf instead (using the netns taken
from the netdev). Both the netlink dev-disassoc path and the
NETDEV_UNREGISTER path are converted to the new helper.

> diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
> index 91473f96ad211..273b010d2355c 100644
> --- a/net/psp/psp_main.c
> +++ b/net/psp/psp_main.c

[ ... ]

> @@ -438,9 +440,13 @@ static int psp_netdev_event(struct notifier_block *nb, unsigned long event,
>  	if (psd && psp_dev_tryget(psd)) {
>  		rcu_read_unlock();
>  		mutex_lock(&psd->lock);
> -		if (psp_dev_is_registered(psd))
> -			psp_nl_notify_dev(psd, PSP_CMD_DEV_CHANGE_NTF);
> -		psp_dev_disassoc_one(psd, dev);
> +		/* Nothing to report if the device was never on the list,
> +		 * dev-assoc may have failed after publishing dev->psp_dev,
> +		 * and this is also the main netdevice's path.
> +		 */
> +		if (psp_dev_disassoc_one(psd, dev) &&
> +		    psp_dev_is_registered(psd))
> +			psp_nl_notify_disassoc(psd, dev_net(dev));
>  		mutex_unlock(&psd->lock);
>  		psp_dev_put(psd);
>  	} else {

> diff --git a/net/psp/psp_nl.c b/net/psp/psp_nl.c
> index b57366b5e032b..cdfc2d72fb390 100644
> --- a/net/psp/psp_nl.c
> +++ b/net/psp/psp_nl.c
> @@ -356,6 +356,40 @@ void psp_nl_notify_dev(struct psp_dev *psd, u32 cmd)
>  				psp_nl_build_dev_ntf, &cmd);
>  }
>  
> +/**
> + * psp_nl_notify_disassoc() - notify about a device losing an association
> + * @psd: PSP device (must be locked)
> + * @net: netns of the netdevice which got disassociated
> + *
> + * Must be called once @psd no longer has the association, so that the
> + * notifications carry the state after the change.
> + */
> +void psp_nl_notify_disassoc(struct psp_dev *psd, struct net *net)
> +{
> +	struct sk_buff *ntf;
> +	bool still_visible;
> +	u32 cmd;
> +
> +	lockdep_assert_held(&psd->lock);
> +
> +	psp_nl_notify_dev(psd, PSP_CMD_DEV_CHANGE_NTF);
> +
> +	/* psp_nl_notify_dev() reaches the main netdevice's netns and every
> +	 * netns which still has an associated device. If @net is neither,
> +	 * the device is gone from @net and we should send a delete ntf.
> +	 */
> +	still_visible = !psp_dev_check_access(psd, net, false);
> +	if (still_visible || !maybe_get_net(net))
> +		return;
> +
> +	cmd = PSP_CMD_DEV_DEL_NTF;
> +	ntf = psp_nl_build_dev_ntf(psd, net, &cmd);
> +	if (ntf)
> +		genlmsg_multicast_netns(&psp_nl_family, net, ntf, 0,
> +					PSP_NLGRP_MGMT, GFP_KERNEL);
> +	put_net(net);
> +}

[Severity: Low]

This isn't a bug, but should the assoc side be made symmetric with this?

After this change, losing visibility of a PSP device in a netns produces
PSP_CMD_DEV_DEL_NTF, while gaining visibility for the first time still
produces only a change notification in psp_nl_dev_assoc_doit():

	list_add_tail(&psp_assoc_dev->dev_list, &psd->assoc_dev_list);
	psd->assoc_dev_cnt++;

	put_net(net);

	psp_nl_notify_dev(psd, PSP_CMD_DEV_CHANGE_NTF);

For a netns where this is the first association, psp_dev_check_access(psd,
net, false) would have returned -ENOENT just before the list_add_tail(),
i.e. the device was not visible there at all, yet the netns is only told
about it with a change notification.

Documentation/netlink/specs/psp.yaml describes dev-add-ntf as "Notification
about device appearing" and dev-del-ntf as "Notification about device
disappearing", and psp_dev_create()/psp_dev_unregister() use that add/del
pair. A mgmt listener in an associated namespace would then get a change-ntf
for an object it was never told about, followed later by a del-ntf for it.

Since notification semantics become uAPI once released, would it make sense
to emit PSP_CMD_DEV_ADD_NTF to a namespace which becomes able to see the
device for the first time?

> +
>  int psp_nl_dev_get_doit(struct sk_buff *req, struct genl_info *info)
>  {
>  	struct psp_dev *psd = info->user_ptr[0];

[ ... ]

> @@ -620,13 +654,6 @@ int psp_nl_dev_disassoc_doit(struct sk_buff *skb, struct genl_info *info)
>  		return -ENOMEM;
>  	}
>  
> -	put_net(net);
> -
> -	/* Notify before removal so listeners in the disassociated namespace
> -	 * still receive the notification.
> -	 */
> -	psp_nl_notify_dev(psd, PSP_CMD_DEV_CHANGE_NTF);
> -
>  	/* Remove from the association list */
>  	list_del(&found->dev_list);
>  	psd->assoc_dev_cnt--;
> @@ -634,6 +661,9 @@ int psp_nl_dev_disassoc_doit(struct sk_buff *skb, struct genl_info *info)
>  	netdev_put(found->assoc_dev, &found->dev_tracker);
>  	kfree(found);
>  
> +	psp_nl_notify_disassoc(psd, net);
> +	put_net(net);
> +
>  	return psp_nl_reply_send(rsp, info);
>  }

[Severity: Low]

Should this carry Fixes: tags?

The changelog says the old ordering "is still wrong", and the corrected
behaviour is user-visible netlink content in two paths that both exist in
released code:

- psp_nl_dev_disassoc_doit(), the notify-before-removal block removed here,
  came from commit 06c2dce2d0f6 ("psp: add new netlink cmd for dev-assoc
  and dev-disassoc")
- psp_netdev_event(), converted to psp_nl_notify_disassoc(), came from
  commit 0ddb69e2406e ("psp: add a new netdev event for dev unregister")

Documentation/process/maintainer-netdev.rst says "for fixes the ``Fixes:``
tag is required, regardless of the tree", so adding the two trailers would
make stable selection and backporting reliable.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260912200426.121025-1-kuba%40kernel.org
