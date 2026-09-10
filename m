Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A9C36680E;
	Thu, 10 Sep 2026 01:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789004903; cv=none; b=o+m6UZbrf6O2nTj9US1TJX1RNehWz7F7fApdyqrmtTG2tnO4x/yKuChbDMJtbO0O8xfiW5WfIcFuHztfEuj0l7j1Bc9OtHfUjm7Lwmh6yaIc/TiyCbc1fd7sUwQFQDYTrwxngjPTD84em/jPOoahbEdZlTSlMIO+GlpfSNlMon0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789004903; c=relaxed/simple;
	bh=vOuZWBcSN/9bVgr1W0oHy9JJWPBF47zqq8nNCMusgPA=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m5fssAPOtFW60LaPNTmVS2tJoVAlD9S1DbF3aJQeeBoUURIm5vUOZ0chw6mGyiclVXpHPxuc17iqOY/Rv+wdLUOwXQ3pTbpKNCmNzKr5x3vxJwa5QEUmXtOLu03ucdOlkHdxhNmxH6kmbe8JFpCgqO+l3REsgdZdzQCpgHEbXr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3S16SsP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3S16SsP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDA41F00893;
	Thu, 10 Sep 2026 01:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789004895;
	bh=taKI6DHxGvhYFTerPylSqg0o7BwGHq1Kd67Fp50EeJg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=V3S16SsPwKsQ614sXRTfbZtJisawVds75PAkljiuDVxOm8qRLosCDg2pg0vCsp5lt
	 n3ZRlY+edX+abh05V6y6UgT+o3nUIhOneNO8dGyu6UfJvVO331zFG03FgqiNuDLd5Q
	 Wr3Ruy8E7rPSJ+0PkI0EmtSqMuA5AGKoETWWdxbzz9oDxxRCZGIBUZrGn7UkBor+y5
	 jo/mFjdI2Eo1EhnbyRjKfYJRIl6xlvAGe0hsGZFVxp0KSx5oVdMmPhTKi5mGooduXe
	 Fjv7ysugpUDwemFe5mRh1qr4zetmzwgIwuhU8kJx+y5qzuJY1r0elO49JwVHKr4e6H
	 Mfz0E4YUMqEaw==
Subject: Re: [PATCH net-next v2 2/3] netlink: specs: rt-addr: document
 AF_PACKET multicast dumps
From: netdev-bot+sashiko@kernel.org
To: sigefriedhyy@gmail.com
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com,
 edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com,
 nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com,
 sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Date: Thu, 10 Sep 2026 01:48:13 +0000
Message-ID: <178900489382.219967.10423938088246016510@kernel.org>
In-Reply-To: <20260909013401.14408-3-sigefriedhyy@gmail.com>
References: <20260909013401.14408-3-sigefriedhyy@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 (1) · Low: 1

- [Low] The new getmulticast doc text in Documentation/netlink/specs/rt-
  addr.yaml enumerates ifa-family values (AF_INET, AF_INET6, AF_PACKET)…

Pre-existing issues:
- [Medium] Documentation/netlink/specs/rt-addr.yaml declares a `do:`
  operation for getmulticast (request value 58, reply value 58), and…

--

netlink: specs: rt-addr: document AF_PACKET multicast dumps

This updates the getmulticast doc string in the rt-addr YAML spec to
describe the ifa-family values it accepts, including the newly added
AF_PACKET link-layer multicast dumps and the meaning of the permanent
flag for those entries.

> diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
> index 0ecbd24c890c..2a2310cb0df0 100644
> --- a/Documentation/netlink/specs/rt-addr.yaml
> +++ b/Documentation/netlink/specs/rt-addr.yaml
> @@ -168,7 +168,12 @@ operations:
>            attributes: *ifaddr-all
>      -
>        name: getmulticast
> -      doc: Get / dump IPv4/IPv6 multicast addresses.
> +      doc: |
> +        Get / dump multicast addresses. ifa-family selects the address
> +        family: AF_INET or AF_INET6 for the IP multicast groups joined on
> +        a device, AF_PACKET for the link-layer multicast addresses in the
> +        device filter. Link-layer entries added with SIOCADDMULTI are
> +        reported with the permanent flag set.

[Severity: Low]
The new text reads as if ifa-family were a plain family selector, but
should it also mention that an AF_UNSPEC dump does not include the
AF_PACKET entries?

The PF_PACKET handler is only reachable when the request names the family
explicitly:

net/core/rtnetlink.c:
	{.protocol = PF_PACKET, .msgtype = RTM_GETMULTICAST,
	 .dumpit = rtnl_dump_mcaddr, .flags = RTNL_FLAG_DUMP_UNLOCKED},

and the "all families" walk in rtnl_dump_all() skips it:

net/core/rtnetlink.c:rtnl_dump_all() {
	...
		if (idx < s_idx || idx == PF_PACKET)
			continue;
	...
}

So a client that sends RTM_GETMULTICAST with ifa_family = AF_UNSPEC and
NLM_F_DUMP gets only the IP multicast groups, with no error and no hint
that the device multicast filter was left out.

Since documenting the new AF_PACKET behaviour is the purpose of this
change, would it be worth stating that caveat here too?

>        attribute-set: addr-attrs
>        fixed-header: ifaddrmsg
>        do:

[Severity: Medium]
This is a pre-existing issue and not introduced by this patch, but the
doc string being reworded here still says "Get / dump", and the spec still
declares a do operation for getmulticast:

Documentation/netlink/specs/rt-addr.yaml:
      do:
        request:
          value: 58
          attributes: []
        reply:
          value: 58
          attributes: &mcaddr-attrs

Is there any family that implements a non-dump RTM_GETMULTICAST?  All
three registrations are dumpit-only:

net/core/rtnetlink.c:
	{.protocol = PF_PACKET, .msgtype = RTM_GETMULTICAST,
	 .dumpit = rtnl_dump_mcaddr, .flags = RTNL_FLAG_DUMP_UNLOCKED},

net/ipv4/devinet.c:
	{.owner = THIS_MODULE, .protocol = PF_INET, .msgtype = RTM_GETMULTICAST,
	 .dumpit = inet_dump_ifmcaddr, .flags = RTNL_FLAG_DUMP_UNLOCKED},

net/ipv6/addrconf.c:
	{.owner = THIS_MODULE, .protocol = PF_INET6, .msgtype = RTM_GETMULTICAST,
	 .dumpit = inet6_dump_ifmcaddr,
	 .flags = RTNL_FLAG_DUMP_UNLOCKED},

The non-dump dispatch path needs a doit callback, otherwise err stays
-EOPNOTSUPP:

net/core/rtnetlink.c:rtnetlink_rcv_msg() {
	...
	link = rtnl_get_link(family, type);
	if (!link || !link->doit) {
		family = PF_UNSPEC;
		link = rtnl_get_link(PF_UNSPEC, type);
		if (!link || !link->doit)
			goto out_unlock;
	}
	...
}

So a ynl-generated single-object get built from this do block fails for
every ifa-family value, including the AF_PACKET case being documented
here.  Since this change is extending the "Get" wording to AF_PACKET,
would it make sense to either drop the do block or say the operation is
dump-only?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909013401.14408-1-sigefriedhyy%40gmail.com
