Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D62882D6
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 01:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775008273; cv=none; b=GTLSAf4Nhh6RdeCA6CYvzOEFRWG+Mdw4tvLhQ5a5233C3HZMscxVmSmVwS/x/n1E6b98QaxAqvyuBFrfYZUViGi6RR5xpVVjN7kZTGEtfwKaFUuiauBm0czSIXWTcKd14mWA4R4RidREcTgzfxyIWiGHGRRGYGbJIq80p7d4ruw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775008273; c=relaxed/simple;
	bh=q7VUBOhSMncR/g/BRF1P57/J1Z7UEn9TCx7hwTrkP9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHuiEK0DiJ8EAI/6gbfTAJYVVCzWNualNu30WKs/CtLE779ObQT1Bo6tfMFPgWHfVVC6u0DLcooVWxdji3Ws04aCtR9a9tFiw1XKe3vYm0qrqwJrsno8qenpEfxDnbeih3vIAsBVoZTqE4PFFrxSz8Rh10RxO7zGxVCrtEtFUCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX9x10TL; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX9x10TL"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82cebbdab08so207596b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 18:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775008271; x=1775613071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6tuuYL0UZ6hlb3mMxVvw/iMPpkf63ZZk/aXRRgX7gW8=;
        b=EX9x10TLovmHqTOjdD6IbTh4g+sPY7RfCDZyGql2805Eq+pD7MyHivkiw/vtDD8vNk
         uK7wfS2oQf3E3FaW0K61LgF/zjsiUAllbMPU+XYBCJb5EyzARRjosvO05Xr091QW1OxR
         5BVc1DIymQVZwSzYxmA3WFFPTnSOd+hJqLKx/N+6lDc5ssnWtmd9eNL/3qm4i5NaNaEz
         XRwDFt+d2+T3miq8tf6x5OPkb6AoTyj4MhVmHsbbQTF8zg4tkGZyop4SSGa8ubk+ILqL
         PnCbDPtkuPWvQWF0Jsx2MSRFkYhkob2NiqImveAuL03duq3C3o+f6tMO2ew81hFrXyRk
         BCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775008271; x=1775613071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6tuuYL0UZ6hlb3mMxVvw/iMPpkf63ZZk/aXRRgX7gW8=;
        b=SIJuNWjjSI1WU9fHzOGS9Om6XevHaNCPaCoWPXDE4GgVCSyPNzXNLLjp65MCjzil3N
         yakHWr2AOSYWIaHhccLemhLfGI4EocHxOdNCEgmlUafkTIGuTbX6gx9mxkCUZwbwwxEj
         UJJf8f+FcdC89hGF2Zk4hM5fheZPeKQ3otjKE6aRn2V8bb0MMV9OfpDPEE51vQaIwN/K
         06Pxs2BGjrj9Bv/iF7UtQtybe67+wkbT42ExWAXvaLCFLxvgOJq7+chwgy8kf15EwiZ1
         8oRMZlbM3TVn9Ej457WfByufslPk11oIDGk9TyligGIgRr5S/FUhJ9hi6+uGBd4RXNEe
         vhyg==
X-Forwarded-Encrypted: i=1; AJvYcCWWb8YM/1rfY9EENYipYuT+cb1LS5ULxl1HwZHy96A+vm6fOiiczIJz1sxzrC6hxrlg+jj59TTh0r+YVSIg2Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgujiCWA7OoUfSAzbkHKIAddcJQT6hNtw5N8KzdihoIcmetxqk
	oI4gorQcbejws7ER2zgs2I/dXpVCH/TBO4LvLJUgzHFuhOkaDAo4uUP7
X-Gm-Gg: ATEYQzxUADzQhMhdWQBTxefuRyqyBCHSVgeBbOoEOneAYRLOBuQx2Kkj5o+AFrhoaGZ
	Q5swmp8P0jYPZaDOiuSTvrPGVBORyVWfkl0bZw92LvGG4/jOokx0GyfTCPvWypDh4yn197j1kAO
	ipMN12FyY0ntsGIhglm46uu4IhaoDH7mnvzKyPIQZr9yfAhIXlJne6rvofMZNoLqZzcvQySnUh9
	UtnTZyj2dnyeM+CCj+5Ek41HiyzGSpivkpUzVYHX6ePN2iiNIGsaxppxKyX30iAq8sMHdmcuSrN
	AcV6hM7YZ2zSO2WGtWPziC6cFAPBi5owB3GFPBc781DtihsloFp3f4cKWBl5SLOqQ6TtidZHhQK
	k3XcMBefuB1c5hOTM9F1b3Atp99po9bD2zcJ2V4LPU+qaW8/9OqhRhEdGD4q5RRlT2h6VnftuaK
	r5nXed2/p0LE82x3vD4mBLlgVvY9U=
X-Received: by 2002:a05:6a00:330e:b0:7f1:4:66b with SMTP id d2e1a72fcca58-82ce8b327f7mr1798375b3a.44.1775008271133;
        Tue, 31 Mar 2026 18:51:11 -0700 (PDT)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cd7d0410bsm3904816b3a.33.2026.03.31.18.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 18:51:10 -0700 (PDT)
Date: Wed, 1 Apr 2026 01:51:02 +0000
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
Message-ID: <acx6BqhwBSgUuE0F@fedora>
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

On Fri, Feb 27, 2026 at 06:21:20AM +0000, Hangbin Liu wrote:
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

Hi Jay,

Do you have any comments for this issue?

Thanks
Hangbin
