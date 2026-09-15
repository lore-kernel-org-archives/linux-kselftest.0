Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EFD47B43E
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465388; cv=none; b=JlqjPQ8rHu4iwBb0NgABjvX95Jeu+79UM74O0c7/qargvcp2q/Zh8kBn3Kyt4qn6+t9fOsyBD327t6FqxvlpK8K7EoqEjKUqXZxvZxCE48mYUNXHc973eKSNtGQALQhqfGaQJR1Y7YgIaH12zRuE+bJpt8Dz4zt/qHyFY2z3ioY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465388; c=relaxed/simple;
	bh=VyeplrMBWX9gIbnAWAoJIe4EUJ/Bhml+BvmnrlPRG3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMp4q2MRJKXPqrV1kkMvibIGvfA0Os9enJ7t9BJlB7646qK9EP48U7Gl1x6fUs0MhqkzDIVifr/9OpbEHCRThX+qgyqNlzWX4S3Fy9eCX9CNxfM9uGiOC9qjv5cekzDxEPoCX0rQ0xxHuU768kHijk6wFqB4afGzfnxSnaLBO3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuUBSlGz; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuUBSlGz"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48437356d60so44937f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 02:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789465380; x=1790070180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bW+iPkrSzo0otQQoBYJMGRZoMXs1UqJR5g1BDpvaw78=;
        b=SuUBSlGzNbD9/YPIE8c0YdTyuPDV9AzpHH3xD3ZcybXE4aEI/15OHKlZ6DJGv0pyLB
         pjKW0lozwXYZYbtalcxaDmtwNKu/mtU8MIiGoOsdJFtqGTfY9JXXcVkbkQGC7SYM+5C0
         lmICabhQEj9t0e9ax7Q8lkl1KohzBwW27IMiR4/bO0djfic1n7kTbfK7Rmn85xyw0dw/
         xbhVVlK9mwt9T6VX/Ki2VhsZdYktYZO3IVeFRUcZ96D29/1DAjCSM8d83C+wq3oyL6Uk
         91uUUcj36Oo+2angyF6jecY9HGNz+TOtddyz3+U5S+2tULJF7Hk5jfoNDJFofEwH74xu
         +DPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465380; x=1790070180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bW+iPkrSzo0otQQoBYJMGRZoMXs1UqJR5g1BDpvaw78=;
        b=X4Cwo4V1uv7lsOkM/1Rufp9EHRsmUu+lGVpMsxVrxwBuPLcCrL23UI3Em1XmOyjwmp
         Wkt+KqcBuA+IFwAfNRRuizx+LJGdTvpoA4UUlWUY7TCREjjlQQkXMDBJs4s5/Tqkq+12
         HxKNcwRLAqWeCpGBb7fwGqjwX3CCj5PXsXRUZxrmXKIPgT2HZ24781hJfZiZWmIJ1rf6
         tMH1zyrRWsbaZ2cnGwdnEwUfumZrAYXESwe2uTH2wW2cg42UnVlnZx1owR4LpE/270yp
         aT6QByXDc215eCQDwrTnFInal2bWVQFkFbgdWcyuI3duWoqhDCCmlOa06Sk/KKPwEYfi
         0uRw==
X-Forwarded-Encrypted: i=1; AKwUvBzOWn2xLtzcsCjveoysgfN3stvwRfg/F8HilUPck4MYNVrPojk6poFEL4jI2atp8f0kXC8gqrqksm51sKk3Qt4=@vger.kernel.org
X-Gm-Message-State: AFuF++k5W1/ILmUc5t+HIAQ3DG/pfDGKfKqgwxhog1zmB2p1g2XM1u+c
	irLD/6qsCw8NmtUoYQuVkmuVOFQImMGDB3rn4GV2J+KEaUq+bplGOBka
X-Gm-Gg: AYBFou0tPWsE1k2zYvVTsPjCp277tnX+SP77Uvw/+1T4eKysccNjMWxwM+mM0pwF7nU
	9CtJamasC4Z+jkGnKn1cgHrMYiQ7HgQuNGU/7fVczHmELvpIfqx49wUgr129+70GEuWn51dz29x
	NCnL1QBCvBGO8+paMlafPnILd3Nmysav2BN+7XLIt6CwONINSRHAQ3Nz2vo39Ibiu28vHNicabE
	CoUSgkFTPjpHePWYrBjrUazcmjF0FttHVYxhaJj8D60Mvp9PhAAcWy8aJPqNQpB+JoZcYXGHi2m
	raiCk4kc8o2EVA8hiS2EVven9Jn7KkuoHdZ5CbrcPrrhz+wNmFxfr/oJRIMYN/xbNvDQtytsdRJ
	fznkl+ycfK+bZG4s7SKkGDZkxF9+77XHL8dS7v1Ciia3btylviHEc1tjeqpQ7N9nbsGESXQG1Jy
	N8hfr3fqUTGUej+4ZFeJXHuvtJXTbKcaKZZyhXH5dy2ThOgdt6TV+sKfe9elC0STV+84y5emo/
X-Received: by 2002:a05:600d:8651:20b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49e82915984mr584455e9.25.1789465379457;
        Tue, 15 Sep 2026 02:42:59 -0700 (PDT)
Received: from mobilestation ([185.195.191.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef28e6asm49140045e9.1.2026.09.15.02.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:42:59 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:42:55 +0300
From: Joseph Steel <recv.jo@gmail.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: "maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>, 
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>, 
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, 
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"joabreu@synopsys.com" <joabreu@synopsys.com>, "yi.fang.gan@intel.com" <yi.fang.gan@intel.com>, 
	"jun.ann.lai@intel.com" <jun.ann.lai@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net v4 3/7] net: stmmac: Rework S-VLAN handling
Message-ID: <judv4nfaaapgqpykt5lbnne33mojwqcwvipbxc3xuyc46j424h@cxqtyhepnbpu>
References: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
 <20260908164309.59282-4-ovidiu.panait.rb@renesas.com>
 <ybotecadvx2x3ucgqjunv77fuyeaxmwl5tn77fswraztiklrdo@ajhpl4c52hcy>
 <OSCPR01MB12769E621C234C53F33FA88F7D3BA2@OSCPR01MB12769.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSCPR01MB12769E621C234C53F33FA88F7D3BA2@OSCPR01MB12769.jpnprd01.prod.outlook.com>

On Tue, Sep 15, 2026 at 09:27:51AM +0000, Ovidiu Panait wrote:
> Hi Joseph,
> 
> > 
> > Hi
> > 
> > On Tue, Sep 08, 2026 at 04:43:05PM +0000, Ovidiu Panait wrote:
> > > The ESVL and DOVLTC bits control S-VLAN tag processing and have
> > > nothing to do with the double VLAN feature, which only provides a way
> > > to process an additional inner VLAN tag. However, the driver code
> > > that handles them always refers to "double VLAN", which is unrelated
> > > and makes the implementation confusing. The driver does not use any
> > > of the inner VLAN tag features, and the networking core does not
> > > support offloads for the inner tag anyway.
> > >
> > > To simplify the logic and to reduce the confusion regarding S-Tag vs
> > > double VLAN handling, drop the is_double logic and add a hw_svlan_en
> > > flag that is set when S-Tag hardware handling is enabled.
> > 
> > I believe I suggested to just change the "double" word to "svlan", and
> > not to drop the respective logic completely. The number of S-VLAN tags
> > added/removed must be still counted, otherwise any subsequent VLAN
> > S-Tag removal will disable S-VLAN processing even if there are S-Tags
> > left added.
> > 
> 
> While working on this I realized we don't actually need to toggle the
> S-VLAN bits on/off whenever a S-VLAN tag is added/removed. We can just
> keep them always set as long as the NETIF_F_HW_VLAN_STAG_RX or
> NETIF_F_HW_VLAN_STAG_FILTER features are advertised.
> 
> This simplified the S-VLAN logic quite a bit, by getting rid of the counting.

and reduces the system security by permitting the packets that
otherwise would be filtered out by the controller if there is no any
S-VLAN tags added. So no. The counting logic here is quite
appropriate(-ish).

-Joseph

> 
> Ovidiu
> 
> > -Joseph
> > 
> > >
> 
