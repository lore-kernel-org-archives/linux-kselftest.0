Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949882FD694
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 01:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771030; cv=none; b=TrSPtP3kavfcoZxM90jC902nlyJdc/6g9PuNieV9hfgMKTaYi/S4lMTPVdUQarWiQsT/vZPRWCbktX3F35SK9CMncJdPqzDuCmiqFpBHrMjoZMAHyYy7RYcPgKXPeErkCwatsPcbja95w5mlct2LVhK62JrPnCMs1tEZbPjDBPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771030; c=relaxed/simple;
	bh=xX+IXMPW2P6MfkNy8t+mUr9sj2Zll/A3MxrgWHIbltw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DM5HR4krMQcu4isqt9ARDS9OBwwPLqB6ItVH8d1JdG2333BeVR4LagBs6gn43RTTscvCK91n7HIZCtqcR30Dzg5CgRf/wgTfjD2BPwwInCjDlDVpUvHUq190Pvt2vXXfyngLiHTiFReWjIHohIP42eJevYDrmSQSdqex4yC/ddI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQ9J4E51; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQ9J4E51"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso108239b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 18:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784771029; x=1785375829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nx2KjPDx0JgpwngNp+VsU8xD8xU+8AxWDsarHpeVVmI=;
        b=iQ9J4E51vqr80L2/Mgecf01JWnWlp4o3+9Zf1Aa/1q0+IkeMWNNLcQ0WBlqa8ui/k1
         9uVcpSYQnOthNQGpTfI9lzrK7KC8BO+l7YWWe0ztubfdKaqL2jFVY3tqsS8ax/VkzZSZ
         xJxwS4rGCsGO5wccU1e+ol7kZvCW+WaUj1Kglfmhxv1xoYqZGutE6Zj3GVPCOHZ/CF5P
         aL7OjXVWt4tqafuoYvABuy2CvUWClz8Yq7lrBaxYi1DZkRZ5R6gO8bPHTcCFywki8p+i
         0s/7RMlIr6nwVnLRWoCJ7XuJmW5dCdcaBflesVX2uvuHTIZtGwN25v15vm9zuqARF1yu
         Z/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771029; x=1785375829;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nx2KjPDx0JgpwngNp+VsU8xD8xU+8AxWDsarHpeVVmI=;
        b=EKkMa1T7l48m98PKafjgrsg1qdXjZDN0yTeuL2qA3zSm31Uv37sgqE8Y+wqt6w59Z2
         63QF296wIu1h30yJhBZfNaCqUYykOhqUO2L5c6Otge5ui3IFPvUXLsjRwYBZWJE38t3i
         1+JLDdRuwdqORLwajo18z98rKJGX1WKR3dHvouu91AM8t9YSaXtGNVFoyTaFntny23vG
         AHXOrYtm0AdSO5xVTeweW1QHqPxVunui2OPcGz6EL6lqWnu33AY2nqhcheme+ToZt+Wu
         ODGQIrn9V73a2L+ihGdahZasqUj7yi8cZ6jK9B8+e0GiKgBxT54XA1cESjGjk68DBFz/
         MV9w==
X-Forwarded-Encrypted: i=1; AHgh+Rq5rQ8Huz7VffFHegxQiqhyMRKfCreQ4zywMdCJfLE2gR3/6jH3WMOB/JlU0YMlBsvxJBspfdcmQEYSmwDeRg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSr7Q6C7+El7HHvJvLo+sEqYkXc5mmAypsyMgObNuhVKyJmyM7
	C2cXqj5Ktf4M4FWeI0HRqdWJXqNE9ZXJ/JokQ6BFEcWN/jqndTsP08Hv
X-Gm-Gg: AR+sD13eYxdayY/K4ASP7GT+GTGEuImFwqOoDAp5Ukcql2UlFvofNQCsadiU5ZOe8kw
	OEbjzRoeo/9limuASePFrsRjQo6cAuXjGoWX/7curjbe8PuS3nIq8b85uVBKsWOHIILmY5QLuWg
	RfR3IimeOLDna3KTwfzqAl3OX5wdtkcMV0b/qThz7UYGFGFrCN5xpJ4ogfP8iswzm7yEhmNlQJr
	CWHzmjnnhmXcl126tpshdt/Pn9wqEqKJ9Od5/e1Jzjs7b8213PL8xOL23/E2umL2/iKPhJvjaiv
	ikMMOYEoXFQLoD0d9TDycxTIdx1o7KRGySwGBylYCf59v6jaa5gRmvUyk32po+sa4hnFI5QRykd
	IvVj4vHwz3HsZ1XfptCZ1tEAEC+iB8gqBF/vh0rnpAmPgiWfgLldBtpTVF+vWcolvCHWjsb3h3f
	jgWaMNzi0X2A/tZ1wR+ucmw/+fMVVKwObtwK5uV/5qFHcV5Q==
X-Received: by 2002:a05:6a00:10d4:b0:848:5d9b:687c with SMTP id d2e1a72fcca58-84e2bbcf64cmr1398945b3a.54.1784771028660;
        Wed, 22 Jul 2026 18:43:48 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.redmond.corp.microsoft.com ([70.37.26.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f18ba96sm1830121a12.17.2026.07.22.18.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:43:47 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jack Ma <jack4it@gmail.com>
Subject: Re: [PATCH net-next v3 1/3] net: nexthop: add NHA_FDB_PORT for fdb nexthops
Date: Thu, 23 Jul 2026 01:43:02 +0000
Message-ID: <20260723014302.994-1-jack4it@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722152346.GB3022830@shredder>
References: <20260721-b4-vxlan-fdb-port-v3-0-9aa0a543a78a@gmail.com> <20260721-b4-vxlan-fdb-port-v3-1-9aa0a543a78a@gmail.com> <20260722114621.GA2928696@shredder> <e48c03d5-8056-4b65-a651-5f57c1a4da9e@kernel.org> <20260722152346.GB3022830@shredder>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Jul 22, 2026 at 06:23:46PM +0300, Ido Schimmel wrote:
> > No preference on dst_port / DST_PORT versus other options
> > (NHA_FDB_UDP_PORT for example)
> I don't see a reason to make the attribute overly specific (to UDP and
> FDB), which is why I prefer DST_PORT.

Thanks both.  Done in v4: the attribute is now NHA_DST_PORT with a
matching "dst_port" keyword in iproute2, and the internal fields
follow suit (nh_config.nh_dst_port, nh_info.dst_port).  Validation is
unchanged -- the port is still accepted only together with NHA_FDB and
NHA_GATEWAY -- so the name is generic while the feature stays FDB-only
for now, exactly as you suggested.

v4:
  https://lore.kernel.org/netdev/20260723-b4-vxlan-fdb-port-v4-0-46e3a2dd88a3@gmail.com/

Thanks,
Jack
