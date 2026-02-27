Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AABB3451B3
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 06:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772173281; cv=none; b=pbrHHv++onw0960MrTxbEICkCM09bgRaSQx/2CeLh31wB3BdcwA0hLP0boT/Qohs8zyTeTisOSSg0FH3GR08TCRdB9wtJ11tP+oB3qrdx7HZdby2uiuNRNuVnnbEBHn449gS9XRL9z/sdRj1SWpqpc5xRp5nea0CSYGayM99VvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772173281; c=relaxed/simple;
	bh=5DB6r2eGa84AcW440fmyv1J01MFlLdmp3d3rHgWXkGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaBKhofE3UhZH+42+7p8rJgyisc0Q13UOcz9ZbxZQuI/Jc38AYCHvbviKlccHXirIiPWowx07Oz4d9xDUVmKxw8aIIdeVarqvT5ReNHUh4uDrcYV31wD9IifSY9Q0pNN7i3Zft9VafuywViB6boTXaBqFK/R9um4b/X23yfg6DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7PwSHWd; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7PwSHWd"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-824b5f015bcso2028122b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 22:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772173280; x=1772778080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Mwj0TsO3rZmOSUGtHVEu9OCniT19qm1BOQwi4yuWyo=;
        b=m7PwSHWdpVndY4YvytPT3jSPuJASZjCOjYliHfBYqNN/RrOgbM9lccV3QqQdMeW08A
         /iDXLHQsx7TuwEFkUh6+zgmLTQlJQAxpbajrEWSgS2DCIcnluBk69MibM6i9yLDk9kQS
         W+OXUjSX8L4Ky3ZMC2qfsTji/8zN1ASnd9mrB4arl9FKpxYYs8FzLYwSJ6Fpysn3ogkX
         oHyoYtUsCkOEJnNKmG3ABQfd87scckfNsKI6rl9S4JjZkgrsQ2pEouOa/OfeEJwLo9c3
         vem7uvJQlt2G1Ks3v8W0+jC543AwMz4P02qk7so/uqeR6AL/5+idhKkn4Ttl1mpvovTC
         Nd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772173280; x=1772778080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Mwj0TsO3rZmOSUGtHVEu9OCniT19qm1BOQwi4yuWyo=;
        b=eem639j8FE45hP4jYArpcaYKeLgAPWOsYb/TyHAdWfNc+cveibwWgeQSsGhFU9Y6Ck
         rsDnsQcXboKgpsYE/+Q97vDHzKvzlqnBNQqbNA6qcqEEJwj+mDklZYGJWRUMpWRhwRwJ
         8+EFH2lYOYTymXxxbhRFYoLf9VGf/OWyHCq4OyjtSGutaFr31hHpWVKKQg4MdM+Cq4uu
         IIxbEVnMoNEuJOq9NfzoT4okKjOmwsvqL9IsuAWdIJgdjBfE5mw90UNYhDT2BAtLNngn
         x5zXdMfNYfpuC6GgkFCPppwy7DPTfzqRoomVPYbJrbYvv9THqof+sI7vzLQ7vV0xftO5
         RW5g==
X-Forwarded-Encrypted: i=1; AJvYcCWzMOW2LN8MipWQ+kjeM4mBK/5qzOtKpaAJ0RHtZLKz4/QXMh2iH3f1pqffmufKkvtM3gBVUcDfMjX2Y2DFwhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnBzHqqt3GnoPDkZmt7i49e8IVvuLWORJ55J+/sRK8S7X8X2D0
	hTHMuS04m1kKknJbbBVP8VQ/LQaBVAr+etxvxXPMJd/uP1OVv5vNmV/b
X-Gm-Gg: ATEYQzwvwPREays42rmWszXm+CTf6L4egncfY8JhqBQ5wnVVosvScVvN0roOeqvzZ6S
	gm8QtiYn9cIsoBg/OJGQGhtq/eLlGgQibn7H/VMXAhsSUavMNXcKO8CPIa/k6r6rxh0XvvTBsoF
	pxCpnXs25Th153InqibBBHfMYp5mrJZgMcIiRiswqjXz4KeqXdq7dOpYIXtpVSbSIkU8vBsrjKW
	Zdui1svnKZeSRwe8jkVEoztwViSMgQ7cv2uQg+EuGSM+tr/z/Q5yEcr1ObP5eELHDbUln70/8Xk
	urb0bdpCQqb8Ai6GgzlpqRpRK7zIKs+/rYOJx6gqZHobQ4RGHQxHYRuGkdeBRqbH4991OPtSwcj
	e2Bwnzy4OLD4cjojpKHHbvQ+XQQ7QYKFqymmlxS1hal4OGkwgYVhNfw0dtPFc7e/9CPRR+j2sX5
	dIiKoBXPn2Kw9euR1KsLd/akibEKoG1RPcG6GStQ==
X-Received: by 2002:a05:6a00:179f:b0:821:81ef:5dec with SMTP id d2e1a72fcca58-8274d98e6c1mr1716794b3a.8.1772173279754;
        Thu, 26 Feb 2026 22:21:19 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4c5e9sm4062509b3a.2.2026.02.26.22.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:21:19 -0800 (PST)
Date: Fri, 27 Feb 2026 06:21:12 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Jay Vosburgh <jv@jvosburgh.net>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Mahesh Bandewar <maheshb@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCHv3 net 1/3] bonding: set AD_RX_PORT_DISABLED when
 disabling a port
Message-ID: <aaE32DlfrX9S5KNT@fedora>
References: <20260226125331.28147-1-liuhangbin@gmail.com>
 <20260226125331.28147-2-liuhangbin@gmail.com>
 <942584.1772155015@famine>
 <aaEB6X6WPs7EBM33@fedora>
 <949695.1772167347@famine>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <949695.1772167347@famine>

On Thu, Feb 26, 2026 at 08:42:27PM -0800, Jay Vosburgh wrote:
> >> 	I'm not sure I'm seeing the problem here, is there an actual
> >> misbehavior being fixed here?  The port is receiving LACPDUs, and from
> >> the receive state machine point of view (Figure 6-18) there's no issue.
> >> The "port_enabled" variable (6.4.7) also informs the state machine
> >> behavior, but that's not the same as what's changed by bonding's
> >> __disable_port function.
> >
> >Yes, the reason I do it here is we select another aggregator and called
> >__disable_port() for the old one. If we don't update sm_rx_state, the port
> >will be keep in collecting/distributing state, and the partner will also
> >keep in the c/d state.
> >
> >Here we entered a logical paradox, on one hand we want to disable the port,
> >on the other hand we keep the port in collecting/distributing state.
> 
> 	"disable" the port here really means from bonding's perspective,
> so, generally equivalent to the backup interface of an active-backup
> mode bond.

Oh, got it.

> 
> 	Such a backup interface is typically carrier up and able to send
> or receive packets.  The peer generally won't send packets to the backup
> interface, however, as no traffic is sent from the backup, and the MAC
> for the bond uses a different interface, so no forwarding entries will
> direct to the backup interface.
> 
> 	There are a couple of special cases, like LLDP, that are handled
> as an exception, but in general, if a peer does send packets to the
> backup interface (due to a switch flood, for example), they're dropped.

OK, this makes sense to me.

> 
> >> 	Where I'm going with this is that, when multiple aggregator
> >> support was originally implemented, the theory was to keep aggregators
> >> other than the active agg in a state such that they could be put into
> >> service immediately, without having to do LACPDU exchanges in order to
> >> transition into the appropriate state.  A hot standby, basically,
> >> analogous to an active-backup mode backup interface with link state up.
> >
> >This sounds good. But without LACPDU exchange, the hot standby actor and
                         ^^ I mean with LACPDU exchange..
> >partner should be in collecting/distributing state. What should we do when
> >partner start send packets to us?
> 
> 	Did you mean "should not be in c/d state" above?  I.e., without
> LACPDU exchage, ... not in c/d state?
> 
> 	Regardless, as above, the situation is generally equivalent to a
> backup interface in active-backup mode: incoming traffic that isn't a
> special case is dropped.  Normal traffic (bearing the bond source MAC)
> isn't sent, as that would update the peer's forwarding table.
> 
> 	Nothing in the standard prohibits us from having multiple
> aggregators in c/d state simultaneously.  A configuration with two
> separate bonds, each with interfaces successfully aggregated together
> with their respective peers, wherein those two bonds are placed into a
> third bond in active-backup mode is essentially the same thing as what
> we're discussing.

In theory this looks good. But in fact, when we do failover and set the
previous active port to disabled via
  - __disable_port(port)
    - slave->rx_disabled = 1

This will stop the failover port back to c/d state. For example, in my
testing (see details in patch 03), we have 4 ports, eth0, eth1, eth2, eth3.
eth0 and eth1 are agg1, eth2 and eth3 are agg2. If we do failover on eth1,
when eth1 come up, the final state will be:

3: eth0@if3: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc noqueue master bond0 state UP mode DEFAULT group default qlen 1000
    bond_slave state BACKUP ad_aggregator_id 1 ad_actor_oper_port_state_str <active,short_timeout,aggregating,in_sync,collecting,distributing> ad_partner_oper_port_state_str <active,short_timeout,aggregating,in_sync,collecting,distributing> actor_port_prio 10

4: eth1@if4: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc noqueue master bond0 state UP mode DEFAULT group default qlen 1000
    bond_slave state BACKUP ad_aggregator_id 1 ad_actor_oper_port_state_str <active,short_timeout,aggregating> ad_partner_oper_port_state_str <active,short_timeout,aggregating,in_sync> actor_port_prio 255

5: eth2@if3: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc noqueue master bond0 state UP mode DEFAULT group default qlen 1000
    bond_slave state ACTIVE ad_aggregator_id 2 ad_actor_oper_port_state_str <active,short_timeout,aggregating,in_sync,collecting,distributing> ad_partner_oper_port_state_str <active,short_timeout,aggregating,in_sync,collecting,distributing> actor_port_prio 1000

6: eth3@if4: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc noqueue master bond0 state UP mode DEFAULT group default qlen 1000
    bond_slave state ACTIVE ad_aggregator_id 2 ad_actor_oper_port_state_str <active,short_timeout,aggregating,in_sync,collecting,distributing> ad_partner_oper_port_state_str <active,short_timeout,aggregating,in_sync,collecting,distributing> actor_port_prio 255

7: bond0: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    bond mode 802.3ad actor_port_prio ad_aggregator 2

So you can see the eth0 state is c/d, while eth1 state is active, aggregating.
Do you think it's a correct state?

Thanks
Hangbin
