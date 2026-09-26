Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1D136B915
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 20:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452951; cv=none; b=J0a4rrirraBNWCFd9a4YgncKCrWiLGZHHFRc8rQ3qTSvtvOg+4Jbus9lerYjD6iyosdIw2EW5f3XEgLihCuMxQc4gVPsLGfy7poZgmch7P1zGQd6YPeRNll6UyhcCh1AOgMN6ghUns3fZjAQQCNn+UZaTxgi9Xzt10bkn56TVhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452951; c=relaxed/simple;
	bh=6jPgiSRUf5T6hQBG2tDr0gOSmgHP5/l9XHs7Uw9gxtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUe3RZvYGRrJkLypHlbkpEFgXcFKBCc6wK1XZygTs07AIPcu6/Di7KGiwNN/Igq8a+8wKx96BCjFkedanZDcVxVcl6qmsyn1ZCnqdYoopWotCPPduvqD1bKD9+OA4YL/kgrMtUFo7DRvojzZgqgK00udcTbiXiKVZic3aXys1So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQooFrqp; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQooFrqp"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bec20a6fso672142a91.0
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 13:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790452949; x=1791057749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o5nGqbOD5YuuDgh3hqWH/jfIt3JTY1EA1m2kdqTIaSU=;
        b=AQooFrqpvPBEUKvYY9WUhhL9/tEv2mF0hrLERzSF0KlPwcHJQrroX/H+bolEOxdxYN
         P0kQsApdMIURvdzNRYWVUPrxG4rDcTmo/blLuR0VvsuzRv+DY336x4TKVZeXE8k9cFOf
         7al3XAo+7j3G0sHErA/8p+OhiFzNd5JvfCuBsrtkh9HNJjE3uVjk+Q9AlQLay1Zao6zp
         6hfI7viQp7BtLqMKsz2NsH6epUZ/LkuYnnnVX51mbKE0Ks5FM9W1okU3zcLRECgRG367
         GzE8OLpv/MG95VVKqq1BxNUN38MjnAY2jL0kubRg4PIv8zxuO0uZv6aLrdM5nTQpovhs
         3FBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790452949; x=1791057749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5nGqbOD5YuuDgh3hqWH/jfIt3JTY1EA1m2kdqTIaSU=;
        b=AnQIWxp1PS582nws8UMnjCRlSe9lvHXoFmDTA3ipkrJ2VaGPqw+nPJyk9f8Hj00vum
         OXXlb8o9OFRxcrBHWXcWviHFNR6zSKey9PmfI9nB4acQGYJJhFqaEgTIGLBA4Z6/Tzxt
         8xTAzAcs8iIcd6WETKNpYi08nKNFecdpNUn+Pb+5oh38neS1d6sA8J0XEMkz7zwsbigt
         nr6eI9W4WZm2JBikS2o4QvKQmCRJPQYpD0sa3ALn85qNUxYsK45qWRVZxH1RMsyDyGrP
         P0eNLLcYmzloNUbyJtM+ObCaXYOLAudvexh2uNZKklz2peZrv5Z6fwsrrbYUeW+Zr+6C
         vVtQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+LUY5dMzKXss2G7T6rpvwIZTv0nfmJ2OwhEikd2oORksUAt+qNmcagiQm//acaNwmJ55jOn1Aui6HZ4qWQO4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQsaMGfSXr4x6baRlG77kAevsF1NRiwCk2v+uhXvMX3AbYzKfe
	651I8LjegVZYI+wuOGHeeWBvypUO+/qI2Ez1k+gGjzkGAQXHVXSxriBZ
X-Gm-Gg: AYBFou1NsAqTQGSbdPvQlA2cBdBb7jzePkKFHYdMmYm+npN+uqnNwnDBHxrEJ78hIgq
	YdkHf5Zk4IpuT5cK9OBY01cQFsSVZheI+u4nubexWPBwXFa5oAm2AlTBMU5XlkuteOEMQrOI7fE
	L1l/IqqX96DT+WBPyQvfbg8oe2HC521JvfhypwrWRlrNwb8FyzKph50IcdRKbBSclVFDGiNLcMy
	pbmiLZ6utoeVV2e99vl2ddpoY6LioKWFah/pLCX8ygc2RJf9ytZG4AsBb8kTS52NsofZRVA8qpz
	/i0n61/5hAupPYfbhVyxpF0nDJD1Nhs5m+MKZlb9wJioUXXXnSb3thd5akkQMLoQ8HyqaHqDsZf
	NTmT9OHzl2yuNxVgScauGDr2lOem03BfY9TXsZ1FTn4Knz/Q+TNeEX6tCOzdYuan1R2HCfu3er+
	+0aRlZI1nCiGvNpDB4iWrzBvpiKvZI5mvmq0k38LmB+hYwuCIBf4rlm79UhCXQjqWr/lZuyZ8=
X-Received: by 2002:a17:90b:2704:b0:3a0:ce02:6dda with SMTP id 98e67ed59e1d1-3a0ce026f76mr1980554a91.19.1790452948987;
        Sat, 26 Sep 2026 13:02:28 -0700 (PDT)
Received: from gmail.com ([2a03:2880:7ff:72::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0c2e986easm12124169a91.1.2026.09.26.13.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 13:02:28 -0700 (PDT)
Date: Sat, 26 Sep 2026 13:02:14 -0700
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	dev@openvswitch.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/2] selftests/net/openvswitch: add SCTP flow
 key test across conntrack NAT
Message-ID: <argkxqdmcxa605b/@gmail.com>
References: <20260918144647.2024095-1-houminxi@gmail.com>
 <20260918144647.2024095-3-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918144647.2024095-3-houminxi@gmail.com>

On Fri, Sep 18, 2026 at 10:46:47AM -0400, Minxi Hou wrote:
> After conntrack NAT rewrites a packet, OVS refreshes the cached flow
> key in ovs_nat_update_key(), which has a per-protocol branch for the
> L4 ports (UDP/TCP/SCTP, conntrack.c). Address-only NAT cannot tell a
> working SCTP branch from a missing one: the ports survive unchanged
> either way, so a post-recirc match on the original port stays green
> even with the branch deleted. The suite's NAT coverage drives TCP
> over nc, and the merged SCTP test has no conntrack in the path, so
> the SCTP branch goes unexercised.
> 
> Add test_sctp_nat_connect_v4: untracked client traffic to
> 192.168.0.20:4443 hits ct(commit,nat(dst=172.31.110.20:5555)),recirc,
> and the post-recirc flows match the translated tuple,
> ipv4(dst=172.31.110.20),sctp(dst=5555). Reply traffic is matched on
> the restored original tuple, sctp(src=4443). With the SCTP branch
> broken the translated port never reaches the key, no post-recirc
> flow matches, and the association fails. The probe flow uses the
> same ct+nat action as the real flows, so a kernel without
> CONFIG_NF_NAT rejects it at flow-add time and the test skips instead
> of failing. The config fragment sets CONFIG_NETFILTER_ADVANCED=y so
> CONFIG_NF_CT_PROTO_SCTP is visible, CONFIG_NF_CT_PROTO_SCTP=y, and
> CONFIG_NF_NAT=m so the reference build actually has those pieces.
> After the association succeeds the test pushes a known payload
> across and waits for the listener to log it.
> 
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---
>  .../testing/selftests/net/openvswitch/config  |  3 +
>  .../selftests/net/openvswitch/openvswitch.sh  | 93 +++++++++++++++++++
>  2 files changed, 96 insertions(+)
> 
Reviewed-by: Narcisa Vasile <narcisav.kernel@gmail.com>

