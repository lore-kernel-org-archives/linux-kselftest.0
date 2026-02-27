Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71776348445
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 04:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772165695; cv=none; b=KkDi90VwqEe4EC8FoWjHAo1an5qo6BSlzsvL8yJ3oK/7DOFhKJjk2O4ntFu2CxiNptFfac3S/fhXCoavIF2FOAbNfyxgL74NJWTA0eOs5aJJuFU3YUo5K4L51JXMUN4X5XjRLmljXp0zI6xnJ0obgN6egFldBo/uLovo5d22jwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772165695; c=relaxed/simple;
	bh=Gs/pKQwH9oEtI+kh0WAwy+xeE9gG/o9N9rMwPHZZ6+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OR+mim5ag24riaOq73SSnyUXupVDZDcCW+4rEgArhEEkZ/J1lwaREDykS4/k4VFwKlW+ICrmwZrOe+Q3SHbQVIlqRgN/qPYWnGAJVvz4XclfhK3b4mKtKsNmDsqXOoBTw+bKOCKUoeJp2/2w3kWpWakBM8ykULIYZmKb2UnW0w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8vu5ywv; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8vu5ywv"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3591cc98871so668111a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 20:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772165694; x=1772770494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PUNsocJu+CsJs541F5Hy2fpBAZtIUCUpvMDQ/p/bFPE=;
        b=F8vu5ywvsxLLd82Tk+QvVi8uhCpE6R44sWSO+g5gGL6n35t0wmsX8xRKQ7l5Sbhl0o
         OaEFhUxh+mr+ELszuhljsQl7wqBs2DB3fpUmrcIzWGTwOMlsqu/5/qPlpph74SXz9Xo0
         wrOe0sJnBTNX/6VvKGzkHHhOTGezNyZDZm69XZfZRtMuYtJDjapgdRgfBd2/90JkTGfy
         G1AkZ8+xkCOf9Ni0zHoehX5GhKhjvUop5VMhpiXbLp/GDkmpvvYnUm/mpE4v805C62Qy
         ooouMfJyz+O3m7aJOvbTxZEhQK8vY9y6QGeTaLwhdGRTok7nUEkKehXiNINEiDuXqkiG
         O2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772165694; x=1772770494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUNsocJu+CsJs541F5Hy2fpBAZtIUCUpvMDQ/p/bFPE=;
        b=tFjHQn6apbdVSiZqt4NY6YHsa7IehWwDFaNvpVwsCDko5OcBnGGoI0hbV2ohdzzre5
         02nq7KFG8zJZBwQMAyj/QusJQ7yDmfVtQYRJel8uxQN6XMFEjnpfj+m3UWki/ixGCROk
         wUuOAHRF8+I4whgmCEbhXV6NCQd1Z9wkIc07/aFBgWflb/AnFnv1nuZ2Xda6LerwFNlV
         9zSbnG7FKDtvwyALlpGWdpgq6+j2Z0PgBr/dx3HlWK1s4XRv+8di14s12Eo5Wr0LF3yL
         sBsCi9rAES0c+LbvD/mSfxFLBjxsmRw35KsRavH+GTcfQWgE4YzKZN9cesZVWUMx5+S7
         QB+g==
X-Forwarded-Encrypted: i=1; AJvYcCWTUgV+oHYmbKD8e/U7J2yatJp9f8gAtbSi1MF1eF40FoPmiOQ5ehmi24uTW3PwX8r67zhQwaZDVgfVr9yFcgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxsBRsFJl08RbPzDVfvffXAuPuXdBvRNfLrfouCR+jEfrt13Iv
	WIfLJuIeYsNvCJD+TrcwFEC55bx7JiZqqKNrgYqO4eVZDHFC/HocbC0r
X-Gm-Gg: ATEYQzyZfrOgiQweAYcSN2m1Rz5VLwA4DSvAIgUUEhBSiyyxdqr/FTEr/lHKcdnHAW1
	O6njz7eXsc3nqbOJcXFo4eMm9UQxu2jmIPF30HWiD1tmEm5PJyDFqOY0ywv75tY55KyS+eEevmM
	R6OpY1gyhE2uudNRSaBCzN/FiNf71u0zOa64zF48jBAj0ewrseVZBVTtfn5z57Z8olWELnxGzvI
	b9SRyNTNjZBXhiykLoTAG1WZmGQSONr/0wLfe4/B6qXGEeUuH3cwY7eFnkC32eXlb96Q+UQyVBc
	I8Q2fRSP5VSlwKdP3y2phxsFdV1FlSsAaN7yEUtmVm95movTvTqFCX7b3HX0c4yzI+RPphAWvje
	y5WAEJh90rzl2l6+vCaOCAOPJ9jhQzFtAz4CTZ0z1RhmOLvhX44EQPZ7ky00fTEUFmvWQ2tJeql
	SwSMSP6IztTp1MRntaxs2XOPYtYWg=
X-Received: by 2002:a17:90a:fc4d:b0:359:1cbd:5495 with SMTP id 98e67ed59e1d1-35965c27e66mr1359669a91.6.1772165693735;
        Thu, 26 Feb 2026 20:14:53 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dcc94desm3265535a91.7.2026.02.26.20.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 20:14:53 -0800 (PST)
Date: Fri, 27 Feb 2026 04:14:45 +0000
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
Message-ID: <aaEaNRof1yjUynNe@fedora>
References: <20260226125331.28147-1-liuhangbin@gmail.com>
 <20260226125331.28147-2-liuhangbin@gmail.com>
 <942584.1772155015@famine>
 <aaEB6X6WPs7EBM33@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaEB6X6WPs7EBM33@fedora>

On Fri, Feb 27, 2026 at 02:31:05AM +0000, Hangbin Liu wrote:
> > 	I haven't tested this in some time, though, so my question is
> > whether this change affects the failover time when an active aggregator
> > is de-selected in favor of another aggregator.  By "failover time," I
> > mean how long transmission and/or reception are interrupted when
> > changing from one aggregator to another.  I presume that if aggregator
> > failover ater this change requires LACPDU exchanges, etc, it will take
> > longer to fail over.
> 
> I haven't tested it yet. I think the failover time should be in 1 second.
> Let me do some testing today.

I did a test and the failover takes about 200ms with the environment in patch 03.

Here is the full log

Code: the timer count starts after the old active port link down.
```
ip -n "${c_ns}" link set eth1 down
date +'%F %T.%3N'
ip -n ${c_ns} -d link show eth2
while ! ip -n ${c_ns} -d link show eth2 | grep -q distributing; do
        sleep 0.01
done
date +'%F %T.%3N'
ip -n ${c_ns} -d link show eth2
```

Log:
2026-02-26 22:59:54.334   <-- The time when eth1 link down

5: eth2@if3: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc noqueue master bond0 state UP mode DEFAULT group default qlen 1000
    link/ether 12:40:54:81:d3:80 brd ff:ff:ff:ff:ff:ff link-netns b_ns-PKIXVg promiscuity 0 allmulti 0 minmtu 68 maxmtu 65535
    veth
    bond_slave state BACKUP mii_status UP link_failure_count 0 perm_hwaddr 26:10:46:58:22:e4 queue_id 0 prio 0 ad_aggregator_id 2 ad_actor_oper_port_state 7 ad_actor_oper_port_state_str <active,short_timeout,aggregating> ad_partner_oper_port_state 15 ad_partner_oper_port_state_str <active,short_timeout,aggregating,in_sync> actor_port_prio 1000 addrgenmode eui64 numtxqueues 4 numrxqueues 4 gso_max_size 65536 gso_max_segs 65535 tso_max_size 524280 tso_max_segs 65535 gro_max_size 65536 gso_ipv4_max_size 65536 gro_ipv4_max_size 65536

2026-02-26 22:59:54.529   <--- The time when eth2 enter collecting,distributing state

5: eth2@if3: <BROADCAST,MULTICAST,SLAVE,UP,LOWER_UP> mtu 1500 qdisc noqueue master bond0 state UP mode DEFAULT group default qlen 1000
    link/ether 12:40:54:81:d3:80 brd ff:ff:ff:ff:ff:ff link-netns b_ns-PKIXVg promiscuity 0 allmulti 0 minmtu 68 maxmtu 65535
    veth
    bond_slave state ACTIVE mii_status UP link_failure_count 0 perm_hwaddr 26:10:46:58:22:e4 queue_id 0 prio 0 ad_aggregator_id 2 ad_actor_oper_port_state 63 ad_actor_oper_port_state_str <active,short_timeout,aggregating,in_sync,collecting,distributing> ad_partner_oper_port_state 63 ad_partner_oper_port_state_str <active,short_timeout,aggregating,in_sync,collecting,distributing> actor_port_prio 1000 addrgenmode eui64 numtxqueues 4 numrxqueues 4 gso_max_size 65536 gso_max_segs 65535 tso_max_size 524280 tso_max_segs 65535 gro_max_size 65536 gso_ipv4_max_size 65536 gro_ipv4_max_size 65536

Thanks
Hangbin
