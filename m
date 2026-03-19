Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6D13E5EFE
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935672; cv=none; b=c4XWOHqHudBjtkNZwa1Awu920UYnQJc+U1+RDNgeV0UBVVzanoNgmeDDNZgz1OV7VfLV6sPLKJ+c2j2rg6PpO+J3wW6qG6FjbTlvkVjSilNHe/l6ltzJwg+PQJGTVEdu+z57hyOWtm9jlHTA05qCvl158aA/JCwQCHJbB1UjwaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935672; c=relaxed/simple;
	bh=R8P+nzrGUnHar1fqbHTHhRFzTZN26dppzSbv7zUS0FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+252xh+xs21AqBLuYR3klhAf6QXYCqcVxaDUhabVSZC81pjvsUVvIGq3qB17qcQ/sqZC+bQLzHdUhVlpvxqSK3PPDWDRn8TNv0DIbx9vpsSw9LwvTCc5IuKqFWrVV8SftXwQfnKnzzYaNMe4nCWzwutE6PM/o5XrgOZ7TV5ZdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+8mmbCo; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+8mmbCo"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82987437624so671062b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773935670; x=1774540470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flkM1UPgnzZIIWUPlhpYdE/CMruOMnml9ArMjCoVGE8=;
        b=m+8mmbCoDRXID1BSDq4Yo8bF2vMzor2WqvMm9Nw0Y2AJ63KQ206DCRziTdiW6BuDBa
         l+3E5e+hcL9SDO6+it1cO13CRo3sa4QYguChCHGKFBQQhZMsvRiNm0vpukn293Wesyw5
         NyhmpGeXMjIp52E4EiVka+WgbJIHq1h2wd1RegjH5L/RoZ29l8se8WoEOvKNAHhmRw1l
         ZSVEx2JAz5+O4cjZI1sVEGiqv0IXjbsOj8VtE0s8fsH3mR1Nho6okKKHAWGpQ6rXOUfK
         atalspuIyLhm79iWEeJCJ4L3dLxGToieE5iZjdmC+/p8rGo1NxzcAFaCVSlx+p11o04x
         S8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773935670; x=1774540470;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=flkM1UPgnzZIIWUPlhpYdE/CMruOMnml9ArMjCoVGE8=;
        b=IDzAVzEwsfkUXNMPYXYv9qXbm0fFkUBE6fAqCtqqST3jg8h9uNkmTZ5FrmZZem3zFR
         6851V77y/fWWidN06LXdY1cFSA+IokFj2O/s7kenX4STF2Y08dRu4xGTPqTvtjPum8Jm
         MHpVVt4kYKH0gcYbFe3XunKM73Y7jm/ZYk9TweAO28ORYwIFtn/lCPrnAeIM5fKxpN87
         fEUg22lLaLKQMSEBN3BNJhtUHcMSBYKpeIOpKr2eOIhieqlnbs/FjsXohDjP24r+Z7m8
         6igCn8nSZinqZEaS/zGiRhSDsYa2Y+QcPoeQHIj+IcUHpAPU73RGvnnBH4wJrN0Xh9Ia
         BbYA==
X-Forwarded-Encrypted: i=1; AJvYcCW0NGouI0sHUTfw9KWRhoyAJkbmvlDoZbHdIz+qHOLWs5FBLmieOKFX9Ge8p/KG9p0WjS7OEpwUABbld0jwUV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YypedZGANYLwnM44ajAR6QuZbyvJB61Ra4KUb6sEcpsV0ZZcUXg
	nDZAu52hlOiRJ1LpeumQ3xXQvfc7vQabdQ8jq9iyBLwEhDoPLDGJzM4=
X-Gm-Gg: ATEYQzxbh8lZb3g/hpmImrYa8LQjxsubJ2eFTMxQPkX2/5xiaWr4ncMXa6LP27lNWAo
	AEsdpK0FLFwHjvu6cuSgbXD1LfS8C2htvl/zsbBNEUO/TPwZ/NunJ2kiU05RvsfZdLC1g2JCZHy
	7p5tbEhxpM6VImLLd0VqXLeC/vh3EiIS+BitaeUtm0+5ci7EC9kbg0t/XEltdZsxqWnSiFsDLg3
	d8ZYdKVmgi2lnrYxj2WWmuGVIGTlon1dExPubYNsWkCdB7haWipnkIew/rlCuKTw88tyRrBgff7
	DrrrRRxXKX9js7NroDdgUD6dd7sfdI1QiwY/mbb+yjvqFN4fn93tOY45ypNaRA4ThQGSZu8Irnl
	Bi7U5cCxOOMjrCtoiFsVYEOpCMyM+E6LIzgqw52TjWT7xHJ2E30B/MTDzE9dHJvrZXzllG0RLKq
	Vu9CqWLgjJZLoX2FImJxIXFhIED4Qe2cPr/2tfZOAFkhJ3ACRzM+4/c9sjLIY/45hF3yjvS8E1l
	h1uTglmhdstLFbC8Q==
X-Received: by 2002:a05:6a00:a8c:b0:829:f777:dad4 with SMTP id d2e1a72fcca58-82a7a97b202mr3053986b3a.29.1773935669410;
        Thu, 19 Mar 2026 08:54:29 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb51d1sm7913205b3a.28.2026.03.19.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:54:29 -0700 (PDT)
Date: Thu, 19 Mar 2026 08:54:28 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"michael.chan@broadcom.com" <michael.chan@broadcom.com>,
	"pavan.chebbi@broadcom.com" <pavan.chebbi@broadcom.com>,
	"Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
	"Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
	"saeedm@nvidia.com" <saeedm@nvidia.com>,
	"tariqt@nvidia.com" <tariqt@nvidia.com>,
	"mbloch@nvidia.com" <mbloch@nvidia.com>,
	"alexanderduyck@fb.com" <alexanderduyck@fb.com>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	"sd@queasysnail.net" <sd@queasysnail.net>,
	"jianbol@nvidia.com" <jianbol@nvidia.com>,
	"dtatulea@nvidia.com" <dtatulea@nvidia.com>,
	"mohsin.bashr@gmail.com" <mohsin.bashr@gmail.com>,
	"Keller, Jacob E" <jacob.e.keller@intel.com>,
	"willemb@google.com" <willemb@google.com>,
	"skhawaja@google.com" <skhawaja@google.com>,
	"bestswngs@gmail.com" <bestswngs@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"leon@kernel.org" <leon@kernel.org>
Subject: Re: [Intel-wired-lan] [PATCH net-next v2 08/13] bnxt: use snapshot
 in bnxt_cfg_rx_mode
Message-ID: <abwcNMcZHW0ThCkW@mini-arch>
Mail-Followup-To: Stanislav Fomichev <stfomichev@gmail.com>,
	"Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"michael.chan@broadcom.com" <michael.chan@broadcom.com>,
	"pavan.chebbi@broadcom.com" <pavan.chebbi@broadcom.com>,
	"Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
	"Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
	"saeedm@nvidia.com" <saeedm@nvidia.com>,
	"tariqt@nvidia.com" <tariqt@nvidia.com>,
	"mbloch@nvidia.com" <mbloch@nvidia.com>,
	"alexanderduyck@fb.com" <alexanderduyck@fb.com>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	"sd@queasysnail.net" <sd@queasysnail.net>,
	"jianbol@nvidia.com" <jianbol@nvidia.com>,
	"dtatulea@nvidia.com" <dtatulea@nvidia.com>,
	"mohsin.bashr@gmail.com" <mohsin.bashr@gmail.com>,
	"Keller, Jacob E" <jacob.e.keller@intel.com>,
	"willemb@google.com" <willemb@google.com>,
	"skhawaja@google.com" <skhawaja@google.com>,
	"bestswngs@gmail.com" <bestswngs@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"leon@kernel.org" <leon@kernel.org>
References: <20260318150305.123900-1-sdf@fomichev.me>
 <20260318150305.123900-9-sdf@fomichev.me>
 <IA3PR11MB89866985981DB64EFEBDF0ACE54FA@IA3PR11MB8986.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <IA3PR11MB89866985981DB64EFEBDF0ACE54FA@IA3PR11MB8986.namprd11.prod.outlook.com>

On 03/19, Loktionov, Aleksandr wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf
> > Of Stanislav Fomichev
> > Sent: Wednesday, March 18, 2026 4:03 PM
> > To: netdev@vger.kernel.org
> > Cc: davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> > pabeni@redhat.com; horms@kernel.org; corbet@lwn.net;
> > skhan@linuxfoundation.org; andrew+netdev@lunn.ch;
> > michael.chan@broadcom.com; pavan.chebbi@broadcom.com; Nguyen, Anthony
> > L <anthony.l.nguyen@intel.com>; Kitszel, Przemyslaw
> > <przemyslaw.kitszel@intel.com>; saeedm@nvidia.com; tariqt@nvidia.com;
> > mbloch@nvidia.com; alexanderduyck@fb.com; kernel-team@meta.com;
> > johannes@sipsolutions.net; sd@queasysnail.net; jianbol@nvidia.com;
> > dtatulea@nvidia.com; sdf@fomichev.me; mohsin.bashr@gmail.com; Keller,
> > Jacob E <jacob.e.keller@intel.com>; willemb@google.com;
> > skhawaja@google.com; bestswngs@gmail.com; linux-doc@vger.kernel.org;
> > linux-kernel@vger.kernel.org; intel-wired-lan@lists.osuosl.org; linux-
> > rdma@vger.kernel.org; linux-wireless@vger.kernel.org; linux-
> > kselftest@vger.kernel.org; leon@kernel.org
> > Subject: [Intel-wired-lan] [PATCH net-next v2 08/13] bnxt: use
> > snapshot in bnxt_cfg_rx_mode
> > 
> > With the introduction of ndo_set_rx_mode_async (as discussed in [0])
> > we can call bnxt_cfg_rx_mode directly. Convert bnxt_cfg_rx_mode to use
> > uc/mc snapshots and move its call in bnxt_sp_task to the section that
> > resets BNXT_STATE_IN_SP_TASK. Switch to direct call in
> > bnxt_set_rx_mode.
> > 
> > 0:
> > https://lore.kernel.org/netdev/CACKFLi=5vj8hPqEUKDd8RTw3au5G+zRgQEqjF+
> > 6NZnyoNm90KA@mail.gmail.com/
> > 
> > Cc: Michael Chan <michael.chan@broadcom.com>
> > Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> > ---
> >  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 24 ++++++++++++++--------
> > -
> >  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> ...
> 
> > -static int bnxt_cfg_rx_mode(struct bnxt *bp)
> > +static int bnxt_cfg_rx_mode(struct bnxt *bp, struct
> > netdev_hw_addr_list *uc,
> > +			    struct netdev_hw_addr_list *mc)
> >  {
> >  	struct net_device *dev = bp->dev;
> >  	struct bnxt_vnic_info *vnic = &bp-
> > >vnic_info[BNXT_VNIC_DEFAULT];
> > @@ -13623,7 +13625,7 @@ static int bnxt_cfg_rx_mode(struct bnxt *bp)
> >  	bool uc_update;
> > 
> >  	netif_addr_lock_bh(dev);
> > -	uc_update = bnxt_uc_list_updated(bp, &dev->uc);
> > +	uc_update = bnxt_uc_list_updated(bp, uc);
> >  	netif_addr_unlock_bh(dev);
> > 
> >  	if (!uc_update)
> > @@ -13642,7 +13644,7 @@ static int bnxt_cfg_rx_mode(struct bnxt *bp)
> >  	if (netdev_uc_count(dev) > (BNXT_MAX_UC_ADDRS - 1)) {
> >  		vnic->rx_mask |=
> > CFA_L2_SET_RX_MASK_REQ_MASK_PROMISCUOUS;
> This limit check uses the live device list, dev->uc.
> In the new async model, the live list can differ from the snapshot.

Oh, yes, good catch! Will do s/netdev_uc_count/netdev_hw_addr_list_count(uc).
