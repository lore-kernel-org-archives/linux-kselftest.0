Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD4522D792
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 00:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786409026; cv=none; b=t9S4AVB+YPKDmApwFAOId2YLwP4OFsaoOPhWSD/xm921wfAib+EzAXWXrJJJyy1L54wYonsic8wGpMcMBhUbC8vEwotGnzYMpys9bL50t05o7+64N0OhMO484zlR7l+HVV6RcorWGzLyaGVB20YgbPd8lRvAUMKtjS9N1SaO/18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786409026; c=relaxed/simple;
	bh=m9teEkOYL07/MrN8rozfLG4mzvc0S6Y6kfKQkdxg7nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYan5wCrGYlsHiQO4HNydSm2yelEMiUn3/3ErKXJw4rss3MvI+v4x+6TdCvV4QNAHv3tHGh/s6rmf1lQyVmWFWGX8lI7M8GCV2bTD3WFTKPcY6Pk6t4jaW+JucYgUvhYLrSxV7ErVk+2UOmEWV+qBsTUV9ymDtlnzJ1b164uIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZWBULfv; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZWBULfv"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso483781b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 17:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786409025; x=1787013825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WrNRObEeDTVY+FFBiTLb2qyobZv01j9eyLE5NI7gMx8=;
        b=JZWBULfvtlZU2WE3dJj862ctoTUc14PyEeMMmQ0m0sA4qgwKpNZ2WDSnwMtvvkm1ac
         20Q67GR7EZLYaxAL5MDt3LLd3+0TdzCCPaCjNWyzu6I5jDWPtS/xFwtM3BCf80/V4L+E
         TTA/1s60e9i1gOGmmyPhwjlUrBk1wp800pbkM3VZUPlsE+THELB0XRX4B+Xvm5/Y1h6A
         O8WEN8RvXuFldyFBacYaHNFOHxfkQW6zl0dmx0wZvNDupogCPS0HUGJMAren9jD/1W6z
         hokHj6L2yldZhQEnjagu4OjtmIKgktiV193VL8rvk0DvoGwXbjM09ex1kZDxUoOyddmT
         DnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786409025; x=1787013825;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrNRObEeDTVY+FFBiTLb2qyobZv01j9eyLE5NI7gMx8=;
        b=oxBZLcVoEcfHMHOgwVLIkXuhcWvCVbiPhKWpZzI0vnoX5AwMKczOUmAM/wDe7i52Sn
         UtuA9wG0LH9riR86T9Uaz/lknnEvq545zW8x+JRDiihnqHTDrOegjRHLf0ctj4NYOcsc
         G655Ys8YdPqM7i7sNaKGp5jJiQSTI7dzMYEURzEiP75cXxW7aS4ZenAo5uN19Q0rwfLr
         mFa9UWXVvE+Pa436iNGne6w2DcOo7NwICmwzCMS8dlnoGKGuOzBmsxXCrCaIOLdJY9+T
         HFXo/lzYuqMu14a76Ay//8XYDSrd3ee5w9EgoMSXPUOVAl4A/K5t2ZqlS3jY8+VZa5hC
         yWkA==
X-Forwarded-Encrypted: i=1; AHgh+RrZXD0gsCTjzRQUoD581IVe5LuyNVMDxAZBwzOPgRTz33sWYHZQ/vCx4hkuW1fz8WsndEH0AJw+vefTolebP4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQsYeN2kfuTRAPXNAsvve3KSoUTnSM0f8iy4wDAtP0wDMxqGDU
	X0ySbN5GNYTuLM8pkzZhioNq0fJW+X4efWnX21LbEB8E+5Vm32ZADY/I
X-Gm-Gg: AR+sD13Bm5V4JCRimH4CkDDTUElTmvFnxsoycVWP4AFby0BVNMkimxzI7ei1cFUPRiQ
	1ngBu0I0eKN8U6ToN+gqWt8CZBvWYHOpkY9UpJm+FBgnmovOkPFJkvFJ67QTDjP0qVkHBCxA7Qj
	uFfLA24XfwjdKbqPfSQ+hfAtSkaBogQVl/LYpw/xXfT5XcfZVOSLs9hl4N01FqKGsqIu8f8CZDr
	ulokFW7GaL0hV6tIDA3y1h3D2y2LCMMx5NfJywEfl1cencnUPgMJKOcOoyQk5g/etXxBO4Z75OL
	YOp2aC0uTQtp41zifq03L6e0+J+e3jDKcFOm5D1h8i+BPrqNbN5M6Ag9XVS9fXm9SgkD1MLqXqa
	1v7bZIB77mO9l/fctzrOc4L8VjfOFB8V+boe+7VaJSwWf5f/eTJEM2bBgy1bzLvfKsAjMDUUHlh
	k+B3EavkrorCiW+LZ7reg3AclfIbtwc+JRWmAAT2DIIbb9rDUNXp0rNRu9ZkH7I+oe2Bq4P12P8
	zht0/k=
X-Received: by 2002:a05:6a00:1382:b0:842:63f5:d097 with SMTP id d2e1a72fcca58-84fa17a23f7mr2545543b3a.3.1786409024704;
        Mon, 10 Aug 2026 17:43:44 -0700 (PDT)
Received: from fedora ([216.236.36.152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbed8e9f7f1sm22282a12.28.2026.08.10.17.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 17:43:43 -0700 (PDT)
Date: Tue, 11 Aug 2026 08:43:36 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	jv@jvosburgh.net, shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: bonding: disable DAD for IPv6
 addresses
Message-ID: <anpwOGpAmEhWY-60@fedora>
References: <20260808162345.2442594-1-kuba@kernel.org>
 <ankxIiVLu3qY5jw5@fedora>
 <20260810111450.176b34d6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810111450.176b34d6@kernel.org>

On Mon, Aug 10, 2026 at 11:14:50AM -0700, Jakub Kicinski wrote:
> > In this case, how about add nodad to all IPv6 address setting on bonding
> > tests, e.g. bond_options.sh, bond_macvlan_ipvlan.sh.
> > 
> > After that, we may event remove the sleep time in bond_macvlan_ipvlan.sh.
> > In my local testing all the macvlan/ipvlan test passed with nodad set.
> 
> Can you do that as a follow up, please?
> 
> bond_options.sh is the worst offender for flakiness right now.
> I would like to squash these flakes ASAP.

Sure, and in this case

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
