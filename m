Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E3B3A961F
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 03:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773111725; cv=none; b=MuqmngoklNtxddiZ5z4qYAQdNw5UT3mzS0cdrr5tgkel7PGaFIdNypS5GpzsVpeoEaiRNaopOaUdnhP6gYV9NF9PO/b1QzdoPDQTbi7F0kcyQ95axg1yfz4gFoc38YxlKxDyjX1on3E1VO8PAKH2XrG9UpGIiJKsTgeoiIsBbF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773111725; c=relaxed/simple;
	bh=/HorepIizoh0hKhgpr99KvxAfLGwEIYusSEtJs8vCNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKOcE4CZiAQlIa2mFULNapJqd/Utezh/keQYsEyALMtooi8Qjh1MMbiLBgeFtSxx7SsfkvHRclyb+f3Ta9rSxQNP5LLZoGmYv7fs5P5bMW9C95GKKy2iABLD38xnbYmyHQIrRMH4xTSO3POBUTu5LUZ3s0aarCiEyYwKJa6trI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTUdtqMZ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTUdtqMZ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ae88e16485so19456295ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 20:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773111724; x=1773716524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LEwKSMSqIEpe5269DAkL86L1DhMYaTmIOzSUDoQBS/g=;
        b=JTUdtqMZ/bVTnc0LWC9LdPJe/SsQ5os4nohO30T6eloEh10wyj8r17b17uJLmWrJw5
         BFMUCFxxQOzwDpW5tXMH9pvHbRLZA1MzSofzxs2BQ1Y7F5vD0ZLxtvDmPK9sZenfKR+T
         v/K+RpwofJjNvoQMrYB/c/kFgohOJP7ujqVuvHvCZI1iRB0rX7xQkcee07SyO48byioO
         DREuJB4GbjRQwfV3yvjSPxq3K9P6n8+z3p0wJbfIraNn824b1ZuXzgsXtO4L4o4lRoH0
         ro+vJL2BmBqfnyzhC0v6ZmQys/50kiGq0NsApmD3bexadnEoAc5n4CCJ+C43lGV+nWCe
         FynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773111724; x=1773716524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEwKSMSqIEpe5269DAkL86L1DhMYaTmIOzSUDoQBS/g=;
        b=tsDSDvJkYiVc/qwnqLQCGj4pEHZoQR+9i1DByJleVUVLrLKo44reCowX/7O9ARH3He
         ym+3GMxnt1jlLbDunCjf7pylK2QGqMsX0HJVYV8zCocBEriSuZ88AugC85Fo4bEFHl5s
         qtYjJZQRVbk7M7MjuIQKThLP+4KNO8NDtr3p/+KnnoIWB1BI3YL+UP4aRz4dH7sf2lpP
         86lSX8LkOO+shrfuaaed4GQFTMm8d6T+eAr1hTKJfkvD9B0i9HPC6Fxn2f6jtLXEOdhM
         JgmIQRa+EUlNjSkjjMGDLZYjquuM5e7klIWq8Lm2X99fJWMtfltn35GsDQxLGlcOP/Xt
         FUNg==
X-Forwarded-Encrypted: i=1; AJvYcCV5uTYYb+G3XTl3Y8gNtAcR+l6NBLM2gko3TdJKWbNv9HiMCTbjxIjDYMakb2eZ8yLDz3ixVtcvbzJZK2kTbUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfN/KchFMHNu+wP+ZrGKTuYeqDmgd5fPKon5+Ds47sGzEmt7is
	DYZuRyU8jxhLI/RbwDYD4N32HW3PjZeWSjwBOI1d5n3q+jQpxbJkew4a
X-Gm-Gg: ATEYQzwtZolDpn6QD7i0pY+jcFgVGEYD8+AGVofoo85miIWG75C59JavH7sTypzQ2ej
	hSOSmZsatxEr+jZHrdb1VLcv06JLLlHHKVzYqYuMwvLPZk96/Kw1rbv9zArFN6cIUrWJozRGNQn
	y/W2m909oUerjGtu6W1dauVjJutxoEuFxsuVlfr85MFrcyXQYDkvNyb1JMJKa53ue8DlI4IjbrT
	lm0Kkq3bHnB9jbRkhWULq4JIBwKUNKnPF5HWtaTNxLaOt+fzkxbEpmkI2ikjvNGTEPQY1mpMRMT
	o94iAXRUC8zTBL0eitBcWeLqmPwbkVuSqhHNXBcGrAcMu9WM6+17kI+hhA5Lz6lhgtEi+O5fEOk
	8nJgZBtTB/mXRIp3jPlGXjv6UI7EMeQO/eQ1uSjuIZQeZicwcFTsydtTVGD/qZa69ES6E5WxmA+
	wo6SD74ge3XxnAfX2mwxee5ZABYkU=
X-Received: by 2002:a17:903:4b27:b0:2ae:6317:56e3 with SMTP id d9443c01a7336-2ae824f4d54mr124977875ad.28.1773111724083;
        Mon, 09 Mar 2026 20:02:04 -0700 (PDT)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9b9c6sm149702665ad.29.2026.03.09.20.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:02:02 -0700 (PDT)
Date: Tue, 10 Mar 2026 03:01:55 +0000
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
Message-ID: <aa-Jo1mn3Cs5FN90@fedora>
References: <20260226125331.28147-1-liuhangbin@gmail.com>
 <20260226125331.28147-2-liuhangbin@gmail.com>
 <942584.1772155015@famine>
 <aaEB6X6WPs7EBM33@fedora>
 <949695.1772167347@famine>
 <aaE32DlfrX9S5KNT@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaE32DlfrX9S5KNT@fedora>

Hi Jay,

Any comments for this?

Thanks
Hangbin
On Fri, Feb 27, 2026 at 06:21:20AM +0000, Hangbin Liu wrote:
> > 	Such a backup interface is typically carrier up and able to send
> > or receive packets.  The peer generally won't send packets to the backup
> > interface, however, as no traffic is sent from the backup, and the MAC
> > for the bond uses a different interface, so no forwarding entries will
> > direct to the backup interface.
> > 
> > 	There are a couple of special cases, like LLDP, that are handled
> > as an exception, but in general, if a peer does send packets to the
> > backup interface (due to a switch flood, for example), they're dropped.
> 
> OK, this makes sense to me.
> 
> > 
> > >> 	Where I'm going with this is that, when multiple aggregator
> > >> support was originally implemented, the theory was to keep aggregators
> > >> other than the active agg in a state such that they could be put into
> > >> service immediately, without having to do LACPDU exchanges in order to
> > >> transition into the appropriate state.  A hot standby, basically,
> > >> analogous to an active-backup mode backup interface with link state up.
> > >
> > >This sounds good. But without LACPDU exchange, the hot standby actor and
>                          ^^ I mean with LACPDU exchange..
> > >partner should be in collecting/distributing state. What should we do when
> > >partner start send packets to us?
> > 
> > 	Did you mean "should not be in c/d state" above?  I.e., without
> > LACPDU exchage, ... not in c/d state?
> > 
> > 	Regardless, as above, the situation is generally equivalent to a
> > backup interface in active-backup mode: incoming traffic that isn't a
> > special case is dropped.  Normal traffic (bearing the bond source MAC)
> > isn't sent, as that would update the peer's forwarding table.
> > 
> > 	Nothing in the standard prohibits us from having multiple
> > aggregators in c/d state simultaneously.  A configuration with two
> > separate bonds, each with interfaces successfully aggregated together
> > with their respective peers, wherein those two bonds are placed into a
> > third bond in active-backup mode is essentially the same thing as what
> > we're discussing.
> 
> In theory this looks good. But in fact, when we do failover and set the
> previous active port to disabled via
>   - __disable_port(port)
>     - slave->rx_disabled = 1
> 
> This will stop the failover port back to c/d state. For example, in my
> testing (see details in patch 03), we have 4 ports, eth0, eth1, eth2, eth3.
> eth0 and eth1 are agg1, eth2 and eth3 are agg2. If we do failover on eth1,
> when eth1 come up, the final state will be:
> 
> 3: eth0@if3: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc noqueue master bond0 state UP mode DEFAULT group default qlen 1000
>     bond_slave state BACKUP ad_aggregator_id 1 ad_actor_oper_port_state_str <active,short_timeout,aggregating,in_sync,collecting,distributing> ad_partner_oper_port_state_str <active,short_timeout,aggregating,in_sync,collecting,distributing> actor_port_prio 10
> 
> 4: eth1@if4: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc noqueue master bond0 state UP mode DEFAULT group default qlen 1000
>     bond_slave state BACKUP ad_aggregator_id 1 ad_actor_oper_port_state_str <active,short_timeout,aggregating> ad_partner_oper_port_state_str <active,short_timeout,aggregating,in_sync> actor_port_prio 255
> 
> 5: eth2@if3: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc noqueue master bond0 state UP mode DEFAULT group default qlen 1000
>     bond_slave state ACTIVE ad_aggregator_id 2 ad_actor_oper_port_state_str <active,short_timeout,aggregating,in_sync,collecting,distributing> ad_partner_oper_port_state_str <active,short_timeout,aggregating,in_sync,collecting,distributing> actor_port_prio 1000
> 
> 6: eth3@if4: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc noqueue master bond0 state UP mode DEFAULT group default qlen 1000
>     bond_slave state ACTIVE ad_aggregator_id 2 ad_actor_oper_port_state_str <active,short_timeout,aggregating,in_sync,collecting,distributing> ad_partner_oper_port_state_str <active,short_timeout,aggregating,in_sync,collecting,distributing> actor_port_prio 255
> 
> 7: bond0: <BROADCAST,MULTICAST,MASTER,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default qlen 1000
>     bond mode 802.3ad actor_port_prio ad_aggregator 2
> 
> So you can see the eth0 state is c/d, while eth1 state is active, aggregating.
> Do you think it's a correct state?
> 
> Thanks
> Hangbin
