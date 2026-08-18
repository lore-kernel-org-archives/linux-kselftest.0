Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71058388868
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 02:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787021815; cv=none; b=c1McJCguNfGw74Mmknd/qwnyMPM1bqYB2C2tkPHCqPAD7zGK9chw0KdT7UpeAQ8Y8g82u/DIvjIpTo2ZAAsoWUNlDJCqXuSUTfs3lR9REvnTx/gAn6nS9nSnVP69VeRsMrpNfCFcsiO/J4tphLlLJdsHz+T1pGtb+fbQ9K7tX+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787021815; c=relaxed/simple;
	bh=xn8I5437HVlUNED8Vn83WdHG4cuxInPU17DIb8Fv5ds=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=oDvQH2fnNSPT3G+t77RWOmVFdt4bPWcSgDK3yjloe3eN7cl+T0EiKH5qXP0u8I5sVZMZHk12DmeDM925jXcGqScCid3vfcd0yLABYWz3VgxqJmuNm8sITIP5E8vAEBt9N5ynNK8BGnzZw8taxlRcFG+aIWC53CSTTRWsM2BQw8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9xxAO3v; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9xxAO3v"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66c7264d87dso991110d50.1
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 19:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787021813; x=1787626613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=meizaf4wwL1UKgIATopcY1BI8kyPxXyoEzfgjc7eSiE=;
        b=f9xxAO3vwWTD8QT2Qa3q4nnuGDk9pRFLmVMFMp2RCL8AbHFoDQYbdGbbl6ujB38j9B
         6Kui3Q//YfDQV0ZQJKrD0SRX037m3dk6VDwmkkcZwQ3TE9pPe+Rqx4yfrXZ8EiTgvudT
         AefdslJR4GMXSru6WbwNC3fojaKuTNChB/mJqfM520cWeVN9QXZSk4Y3t1Eb/w14+wsu
         4mixz1AMuwjXIKSwpyTrMc/xwKCpR1oNiL6LxdEkqxYdmL1A6oBnfT7p78qLmtT+Sgzs
         Tfp8i9jDT+f0yQXA+qFXX8beHyVo5s+NXDzsxASa6sn+lrHU18WMOxbw1wZBXATfRliy
         xhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787021813; x=1787626613;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meizaf4wwL1UKgIATopcY1BI8kyPxXyoEzfgjc7eSiE=;
        b=hYuHe2+Nqibaf3J/5ItL+4IvGS1FF+GiLyrV++Vv1z3PoDuwSeW3/xAtv27lzSwxhn
         uzKbMBjpdoIyehVXKi3WNTiupm7In//03fOp/iErs7kegtHPg2KU8IvBdh0OJfueaPBD
         0F4RC5v6CFsnJ62nrBLR8tHvcE+jpOusuM+DvEJZYvi17+ERL4+fAyDgdG4mToJj4LqS
         GqTqVbmPwNeTI2WdvWRWZ7jbmR8t2SKW6L/CmJwSSUFBwtGWbi8n9scatBO3Y3xeDYXr
         /vbaz18F4f39F4pndePz/BNlv5cb4k8ZdMNuU0PfNjhvy+m4844CwSDB2Grhb2+qlHaE
         69HA==
X-Forwarded-Encrypted: i=1; AHgh+RqVqyMENv4t5JzXwoSkwR7Anpb4nxnMlw+epJKpJyt/MyY2s4HEoDoptWuGv0ChEcyPXKSIoN1jxXQXmZBWeWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsUgjEb1UXQUdPED+0fnJCK8XfEEvu1e6z8quPjdYwcejA+poE
	KemMMyK09MqOjFDT+NLrMDLzYXy63gjyYxxUS3Z12O/Ea5Cbxp+jzBpx
X-Gm-Gg: AR+sD10phf8GlZBSbcnUwQ7Rf/jvvVrBZYnRTEtrAuweuyeSMBN5s/bHMv17bWK7K3Q
	49tFuEYozg+l2rs3xrJ6e2lk1Q73Uvdd/UxS3N03/W8x5qH0rs/zj6PQHlxod8/551q4LFliJ3x
	SIFq4IAYKsFI7DDsqGCJCDq/yfKuyxPNyl2bouDM+7fkerGjFVT62ToTVlnGjYTOBo1GyQOek9r
	ttXZb+6KWZXNCflGOoKz4Mh+5i+zSoOH6u4/KS1yJxqbTvZHG8Yn9i+fMMdDKFvemPMvZQZTt4D
	k6Mn3deOTfzBsNWCsb29FfXIsQ77f9Z7zC2lVDzMvt1JhsofaDpTX+WGYUSoNfLLucfPonlKIrt
	3c8vr/NfcSNxxowYp9Fsq2hwyjBou3Ci5Py3WfjUbXHNAAGVInORPffRP7YQiSye6SnUNwWsCJN
	NeKcbsBt8bLa9fAwEky2fdK9+B0TuhFWn9KdLECNgZDPvkCLRuf9PWow0CWZtJ//rACaWuv79s0
	9wwTnYahvylXtd58m142ljYXv2UtZQf+dzDi6qT6g==
X-Received: by 2002:a05:690e:e8c:b0:66b:32bb:740f with SMTP id 956f58d0204a3-66cbbc4d0edmr1507033d50.0.1787021813383;
        Mon, 17 Aug 2026 19:56:53 -0700 (PDT)
Received: from gmail.com (234.207.85.34.bc.googleusercontent.com. [34.85.207.234])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cb47a6f08sm1695866d50.17.2026.08.17.19.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 19:56:52 -0700 (PDT)
Date: Mon, 17 Aug 2026 22:56:52 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Alice Mikityanska <alice.kernel@fastmail.im>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Hannes Frederic Sowa <hannes@stressinduktion.org>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Alice Mikityanska <alice@isovalent.com>
Message-ID: <willemdebruijn.kernel.13f661653b580@gmail.com>
In-Reply-To: <6f5e403b-dc29-41e0-8cdc-ac17dba30bde@app.fastmail.com>
References: <20260813120351.2807829-1-alice.kernel@fastmail.im>
 <20260813120351.2807829-3-alice.kernel@fastmail.im>
 <willemdebruijn.kernel.22c7d90c91d06@gmail.com>
 <6f5e403b-dc29-41e0-8cdc-ac17dba30bde@app.fastmail.com>
Subject: Re: [PATCH net v2 2/2] net: ipv6: Clamp to IP6_MAX_MTU in
 ip6_dst_mtu_maybe_forward
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Alice Mikityanska wrote:
> On Thu, Aug 13, 2026, at 23:25, Willem de Bruijn wrote:
> > Alice Mikityanska wrote:
> >> From: Alice Mikityanska <alice@isovalent.com>
> >> 
> >> Commit 427faee167bc ("net: ipv6: introduce ip6_dst_mtu_maybe_forward")
> >> dropped the IP6_MAX_MTU clamp that used to be present in ip6_mtu(). A
> >> similar IPv4 commit ac6627a28dbf ("net: ipv4: Consolidate ipv4_mtu and
> >> ip_dst_mtu_maybe_forward") preserves the IP_MAX_MTU clamp.
> >> 
> >> Restore the upper bound in the IPv6 flow to avoid potential 16-bit
> >> overflows in forwarding paths.
> >> 
> >> Fixes: 427faee167bc ("net: ipv6: introduce ip6_dst_mtu_maybe_forward")
> >> Signed-off-by: Alice Mikityanska <alice@isovalent.com>
> >> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> >
> > Reviewed-by: Willem de Bruijn <willemb@google.com>
> >
> >> ---
> >>  include/net/ip6_route.h | 2 ++
> >>  1 file changed, 2 insertions(+)
> >> 
> >> diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
> >> index 09ffe0f13ce7..fb59a5885faa 100644
> >> --- a/include/net/ip6_route.h
> >> +++ b/include/net/ip6_route.h
> >> @@ -382,6 +382,8 @@ static inline unsigned int ip6_dst_mtu_maybe_forward(const struct dst_entry *dst
> >>  	rcu_read_unlock();
> >>  
> >>  out:
> >> +	mtu = min_t(unsigned int, mtu, IP6_MAX_MTU);
> >> +
> >>  	return mtu - lwtunnel_headroom(dst->lwtstate, mtu);
> >>  }
> >
> > It appears IPv4 only clamps device MTU, not route MTU:
> >
> >         mtu = dst_metric_raw(dst, RTAX_MTU);
> >         if (!mtu)
> >                 mtu = min(READ_ONCE(dst->dev->mtu), IP_MAX_MTU);
> 
> This is some old code from v5.14, it changed in commit ac6627a28dbf
> ("net: ipv4: Consolidate ipv4_mtu and ip_dst_mtu_maybe_forward"), and
> IPv4 clamps MTU in both cases since then.

Oh indeed.

> > I don't think that was necessarily intentional. Perhaps route MTU
> > itself is already bounds checked on configuration. The device MTU
> > min() was added after a syzbot report, in commit c780a049f9b.
> 
> This commit merely adds READ_ONCE to the existing min.
> 
> > Current IPv6 proposal is arguably more robust, covering both. There
> > just remains a difference between IPv4 and IPv6 code paths.
> 
> So, looking at the fresh checkout, it seems that my patch covers the
> difference, right?

Yes, agreed.
