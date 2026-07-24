Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BD0242D62;
	Fri, 24 Jul 2026 13:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898775; cv=none; b=lxlznY9wnhTJHEuPG4wqTPYF3mJuAkY0ecNVaJFz/A53yAJkMzLssDJG5nsa99OwlR3Mnd23Swep/BI4pIcMgEHCLzVPTPESa8kegHIpVeG8/uabtSuy4g/u4C0mtcMSRWgR2VRXJ1cR7njTN/VSQkuVJs8uAQjRS/Z4yj3F39I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898775; c=relaxed/simple;
	bh=Bi7qZk/Ql2taZZEJa14s61cgCuQ7W+CRV2iNhHecASo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVozKen/GdHCAs8l/mWafFrGX6OfNeJZibfl7/yu5gKgumTZ6gwnwOlyQgLsxOEEP8hzPSSlrbhS03OC0Pr1JRLViXKSKRHjNsMxg8W3ZBl1nMAzLvrgQJ6SbYIdhEyCnpdM0Ty6s4eZ4piveUkt1PJTzP7fsdFO/2Ac2NQG0Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyLDP4cZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyLDP4cZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A145D1F000E9;
	Fri, 24 Jul 2026 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784898774;
	bh=xTvKZjO4rm11/HEb7zAMrmLhaE2geBJNY7oaTD2PxTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GyLDP4cZwvWJRkH8VhFDs3oEvhrBzaXam8GlqaSiyAo7LL0LxKged7CA1D4efP74v
	 XeZ4xRgUpAlnhBpdt2UnR4kRnTangF0yKN6g+dPbfgSftJEs2xHV/RsdX/LNnfke64
	 0fGQCqej1tnwwBN6UgZqFRLqGK1zVAzIbLa0VAgfFtWA38Qtgqq/MumMAGYxFQFpYf
	 3xC01JBr9k7A/MHFsp1AQIYAK4sM0MthGstLo22etGzwroSomRRgt9FE7S/kbiDnSH
	 MsRFrOKlKdSirBJZLI9ijlLN66gg3ho+DyrlOOa2QhwmFzr659kpzOcF25fC5C8pH3
	 B3PlYiJE91ZqQ==
From: Simon Horman <horms@kernel.org>
To: xiexinet@gmail.com
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	wsa+renesas@sang-engineering.com,
	jie.luo@oss.qualcomm.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fmancera@suse.de,
	bigeasy@linutronix.de,
	fmaurer@redhat.com,
	luka.gejak@linux.dev
Subject: Re: [PATCH net-next v4 3/4] net: hsr: allow PRP RedBox (interlink) creation
Date: Fri, 24 Jul 2026 14:12:46 +0100
Message-ID: <20260724131246.679974-1-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717201457.54-4-xiexinet@gmail.com>
References: <20260717201457.54-4-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/#/patchset/20260717201457.54-2-xiexinet@gmail.com?part=3
---
--- Patch [3]: [PATCH net-next v4 3/4] net: hsr: allow PRP RedBox (interlink) creation ---
commit bc0d779cf60ce71e2ec7abbdba515576e82afb69
Author: Xin Xie <xiexinet@gmail.com>

net: hsr: allow PRP RedBox (interlink) creation

With the PRP interlink datapath, duplicate discard and supervision support
in place, a PRP device can act as a RedBox. Remove the rtnetlink rejection
of "type hsr ... interlink <dev> proto 1"; the feature is implemented
unconditionally by the preceding patches.

> diff --git a/net/hsr/hsr_netlink.c b/net/hsr/hsr_netlink.c
> index 8099f2069a748..88940e8014b24 100644
> --- a/net/hsr/hsr_netlink.c
> +++ b/net/hsr/hsr_netlink.c
> @@ -121,14 +121,8 @@ static int hsr_newlink(struct net_device *dev,
>  		}
>  	}
>  
> -	if (proto == HSR_PROTOCOL_PRP) {
> +	if (proto == HSR_PROTOCOL_PRP)
>  		proto_version = PRP_V1;
> -		if (interlink) {
> -			NL_SET_ERR_MSG_MOD(extack,
> -					   "Interlink only works with HSR");
> -			return -EINVAL;
> -		}
> -	}

[Severity: Medium]
Since we are enabling interlink here, does this expose an issue with the
transmit statistics in hsr_forward_skb() that was added earlier in the
series?

When a frame is received on the interlink port from the SAN, or the RedBox
generates a proxy supervision frame, we call hsr_forward_skb() with the
interlink port.

In net/hsr/hsr_forward.c:hsr_forward_skb():

    if (port->type == HSR_PT_MASTER || port->type == HSR_PT_INTERLINK) {
        port->dev->stats.tx_packets++;
        port->dev->stats.tx_bytes += skb->len;

This appears to unconditionally increment the port's tx_packets and tx_bytes,
even though the frame was received (not transmitted) or is being transmitted
out of the slave ports instead of the interlink port. Will this artificially
inflate the network statistics for the physical interlink device?

[Severity: Medium]
This is a pre-existing issue, but does removing this restriction expose a
memory leak in the hsr_dev_finalize() error path?

If hsr_add_port() succeeds for the first slave, its RX handler becomes active
and can receive frames, dynamically allocating nodes in hsr->node_db or
hsr->proxy_node_db via softirqs. If adding the interlink fails shortly after:

net/hsr/hsr_device.c:hsr_dev_finalize():

err_unregister:
    hsr_del_ports(hsr);
err_add_master:
    hsr_del_self_node(hsr);

    if (unregister)
        unregister_netdevice(hsr_dev);
    return res;

The err_unregister path destroys the ports and unregisters the master device,
but omits a call to hsr_del_nodes(). Does this cause the rtnl core to free
the netdevice and leak the dynamically allocated hsr_node structures?

[Severity: High]
This isn't a bug introduced by this patch, but does allowing tagged frames
on the interlink port trigger a silent SKB data corruption?

When an HSR or PRP tagged frame is received on the interlink port, it is
forwarded to both slave ports. hsr_forward_do() calls create_tagged_frame()
for each slave.

In net/hsr/hsr_forward.c:hsr_create_tagged_frame():

    hsr_set_path_id(frame, hsr_ethhdr, port);
    return skb_clone(frame->skb_hsr, GFP_ATOMIC);

And similarly in net/hsr/hsr_forward.c:prp_create_tagged_frame():

    prp_set_lan_id(trailer, port);
    return skb_clone(frame->skb_prp, GFP_ATOMIC);

Both calls directly modify the path or LAN ID in the data buffer of the
original shared SKB before cloning it. Does the second modification for
the second slave overwrite the first modification in the same underlying
buffer, causing the first slave's cloned SKB to be transmitted with the
wrong tag?

>  
>  	return hsr_dev_finalize(dev, link, interlink, multicast_spec,
>  				proto_version, extack);
