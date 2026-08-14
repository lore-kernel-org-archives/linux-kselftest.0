Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDFB2ECD3A
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 02:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786673005; cv=none; b=KTv/1mnHDmf4RST4AQGWA1PZRJ2hDHXKE2Qe+efmef1oBwlXly8pgNA3LdfFFsxpojur/DI9ibohI84+q8S9UptId+DXWW93fzAW86FZTrmv/qrQlp5bYphfFWYmeuj8WYE4M30Np6wM2oMPwA5nC+7bPJ38gl26CiQ1o2y+STI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786673005; c=relaxed/simple;
	bh=RGe8Hws0KJoVHPzx2CqzIBPEZJNeE2YDqFTKJWDDSGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0o6rf1OmTwxHJ6ddauO4eePZpl36AW2xyUXsEglrahiayPEkfL4htTn5gyVhyqJxszFLKAKe2DhZJPH90SaCc0U4Rtfyk+m8tItvSxMADQ1NBiFklTaI53iCigtkg7gOXZO6ZMZXhuqmVb0orGMuwo+LwttVLp9FZWpNzoKmLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxMxaxiN; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxMxaxiN"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so538716a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 19:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786673003; x=1787277803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=11mUflqlXkmCeAYz7HYUrNSCSADec0/VbBYoFAKPT8s=;
        b=mxMxaxiND1Lnma5oFzVR24h8TmSiNWPDsstja0IILAnrJ2bcghV1bARvQyFkUeu22f
         bj4nTZ9UZ77YwBYNZ20HjtyXLIif/T2MeFhGmobKLIYLzaCX3lz2ERkHeuD27jVXu9Vd
         VUWv8YBFQ093YeEQIanPNdHo+3LdqnkGO2G+OVxxNZuk+KZ8pyDsl/ZMKSsVhUVMMxIP
         rmzPjkkh04MlLqp5BR/avtWuvmXW5xXlDls9lyu3GTSw9UOGTseb5Rg9+miSJq1vt7kj
         iv9+3MfhJ8IrXTC0V+610B9plO6utzd0/MSr22koS7KTGqjNrj0gNZ7ryb7TY8JePWny
         fpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786673003; x=1787277803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11mUflqlXkmCeAYz7HYUrNSCSADec0/VbBYoFAKPT8s=;
        b=EIrPc9FDGavQxIgyC2M2OUlrfxXguPnGINX3t+7KXTDK9uxClfOTfUpd15rVdm7Eoi
         mTrWPPDjxDzpMKZy0O89ZYNCkWKd6ee1yR39PYgW2SCzS/2n5uOOMEKyYqMi2Jitwtk2
         w23h0ABrg/Dvu9fO9LXnbuT0PzKTfq85fSEzedWX9ljfD6umzqhIpRapECfguKfQOyiG
         H9xPw08EylQiChUp12VD6B9M7QyRWDIpYcN/o4ZwFWMMvoNDIjs8kzU8VCH64dLEbbxi
         uenIQiYzKMc5JcrlcEyZpR5u7SObtVPUKYZjfCy5Ntu39oxbcVsyzWK11270k2FYGpQ1
         frKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9xvm6CwEd3ng4+zdRFtzTMMhmqvpXkuOCa8XOpAeVzFTMK78yIj4451M09N9neV21tS+IJHJtyvQxVBtKI34=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs0y7Uh5jTL4takDuS46ODDTPhc2UXuYlDh/NCIKfDdUXdkeL1
	7iL6C5En+pAd2jt3fnzJcguAuzvxRASyyo4/NU6eHy3ce+RBKFvnBtnC
X-Gm-Gg: AR+sD10MzAafLAFWIT/P1AM1HHQ9kKmTqF0gAw+22479yH8MzCYryHU0rYNavPAN5un
	wYFHgUj/9Y7b/7KD2pAnuioSTChnBwA1+oTH/Pd920FntPsP0Ia09hdmeA9KR8Y8IYXOsLxhxPK
	surn6c9zNGN9EuwBAQRsFsiAzzJQgET5qIZKxKtYjykSxdoCNsRDpYIdVf2j3k2bRecvWPiPltJ
	q7cs9Xo4YAe9Z+/X+wdCMVTeglmW2tofPSIsquXvIjhk1AoX2LnYxfBNlgRZhAHwwNwon7MFxxh
	vyJTzL8d9L2cRGPH1wi8xKAaFX7xp+YEdIzx60SH4AIXmKtkJFzT8S3UUmHCCu/eoFzkL8nJbHY
	wEIgOAR1z411W+QtE3QCbPhx7TNI63bQPryKEEu38dZt8EF0tHyp87+BfPovgVQd5CNVGHjjHao
	Ln7qs7EuKEPe9hSnofoRsJKINiVwZWYCs03B0PPYZpCQgakk2YJ9JURakfIAlgSo9ghnyMWGJdC
	3b1HBwxai5EOchNFeEPFmb1
X-Received: by 2002:a17:90b:3c02:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-3933b785b2bmr2677191a91.1.1786673003303;
        Thu, 13 Aug 2026 19:03:23 -0700 (PDT)
Received: from fedora (n058152022186.netvigator.com. [58.152.22.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b71e1f9sm361942a91.3.2026.08.13.19.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 19:03:22 -0700 (PDT)
Date: Fri, 14 Aug 2026 10:03:14 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH net-next] selftests: net: separate ipv6_flowlabel_mgr test
Message-ID: <an53YmW_owzL5-_E@fedora>
References: <20260813030708.37609-1-marcelomspessoto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813030708.37609-1-marcelomspessoto@gmail.com>

On Thu, Aug 13, 2026 at 12:07:05AM -0300, Marcelo Mendes Spessoto Junior wrote:
> The ipv6_flowlabel_mgr used to be a component of a broader overall
> flow label test, defined in the ipv6_flowlabel.sh file. This wrapper
> script called tests defined on ipv6_flowlabel.c and
> ipv6_flowlabel_mgr.c files, using predefined parameters and enforcing
> the in_netns.sh helper to set network namespaces for each test env.
> 
> However, the ipv6_flowlabel_mgr.c was drastically changed recently.
> These modifications led to the mgr tests becoming a self contained and
> independent test suite, enforcing netns creation by itself and
> not relying on the ipv6_flowlabel.sh wrapper for proper test execution
> anymore. Therefore, remove the mgr tests from the wrapper and update
> the Makefile to handle it as a standalone test program instead.
> 
> Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
> ---
>  tools/testing/selftests/net/Makefile          | 2 +-
>  tools/testing/selftests/net/ipv6_flowlabel.sh | 3 ---
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
> index ab890e6f79dd..0f5c178bc224 100644
> --- a/tools/testing/selftests/net/Makefile
> +++ b/tools/testing/selftests/net/Makefile
> @@ -150,7 +150,6 @@ TEST_GEN_FILES := \
>  	ip_local_port_range \
>  	ipsec \
>  	ipv6_flowlabel \
> -	ipv6_flowlabel_mgr \
>  	msg_zerocopy \
>  	nettest \
>  	psock_fanout \
> @@ -183,6 +182,7 @@ TEST_GEN_PROGS := \
>  	epoll_busy_poll \
>  	getsockopt_iter \
>  	icmp_rfc4884 \
> +	ipv6_flowlabel_mgr \
>  	ipv6_fragmentation \
>  	proc_net_pktgen \
>  	reuseaddr_conflict \
> diff --git a/tools/testing/selftests/net/ipv6_flowlabel.sh b/tools/testing/selftests/net/ipv6_flowlabel.sh
> index 2eeda39bf64c..5d1b5464c54c 100755
> --- a/tools/testing/selftests/net/ipv6_flowlabel.sh
> +++ b/tools/testing/selftests/net/ipv6_flowlabel.sh
> @@ -7,9 +7,6 @@
>  
>  set -e
>  
> -echo "TEST management"
> -./ipv6_flowlabel_mgr
> -
>  echo "TEST datapath"
>  ./in_netns.sh \
>    sh -c 'sysctl -q -w net.ipv6.auto_flowlabels=0 && ./ipv6_flowlabel -l 1'
> -- 
> 2.55.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
