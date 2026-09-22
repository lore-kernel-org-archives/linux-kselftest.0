Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A23B47D0
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 04:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051589; cv=none; b=HJHoZOCT5UO7ZKVqq6JDqqOfmac8PFV0XUInDCWK3K8+gxOvyQgPHEa9fyyb0arnKPIbrlgWPyReRYWxJwe2fqEh12TDW6bnJfjLSU+dmnPlffWjA3KQm2r0RP/EOaUcQdWtYhcdDhcDJKRlEAq894tMhPJRsX4d8bcxNFBeu3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051589; c=relaxed/simple;
	bh=jOsq6u4GxP4+4otPjCoyuUQDELVcpp12xkpbUnN0QYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7CaCC3/YpC4EUhudzf9Tc/RABK8FJ9KqaeWBcEydPcG/kjjZm5hfJNb4Pf+l7e/MovsG/1p66DebGCXeCx7i6tyQi6OEd0QTJTAeFIEoBZOQrqq+JO/dscB3RCqdMpGAaA3EQIXzlCaQCJLMBKMh4+PxbC5SddvT5ebj76syoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=SwwFKotn; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="SwwFKotn"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a0299c787so278348185a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 21:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790051586; x=1790656386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jOsq6u4GxP4+4otPjCoyuUQDELVcpp12xkpbUnN0QYI=;
        b=SwwFKotnPBXyAbiOip6KsvyrvaAEbPUrIfT80hNkZjo47vt2S7zb46+DsrO824Kju8
         puzQblb2Wd8o/O/NwysSgAn5MJOykWDfo/D4/aXt2o756MdsFmrk6Nu/TEZqUeAYjumz
         MzUTkori8hd3yjHDVyWBCSicVhkOnCraKpaS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051586; x=1790656386;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOsq6u4GxP4+4otPjCoyuUQDELVcpp12xkpbUnN0QYI=;
        b=phpYfAbDKXd78CBTUo3UJnC2EOYvPvNioih0lQ2XJcX/l4rhRlSXGDnGMaT9zG9lMM
         7HS4kQ/TB+3OlpeEOJNF9huuArzAARu6FSYB1+YFkYP/Se2UEO9Uray8A4sk/nOyBdts
         M2/B6eZL9ytf9jN/8QI3JUIZt5vtU53GBLxmyusEzTzM+mKyi82ApuqxKhmoJ8K5tCPY
         4IjWdbdUYf1gQzMPW7NE7+LvvF3sIqUPt/LT2yWXSGWPznwTiL8m/ouAN/CGkKSK3zsJ
         wVTnxg9/ylaX2G57LIEgBoGiKMG5LTU+Nv1JhLosumwSVajj/2P03EKRPA+foBk+MNzz
         V+aA==
X-Forwarded-Encrypted: i=1; AKwUvBwq0pJ7J0mpY9PxOj6+RDibWHypZgxuz/gX7QIM/BmGX4iLu/Hz+Brm0DYE4h3QQgAUXrGpWKe/WRC5mQuuUSU=@vger.kernel.org
X-Gm-Message-State: AFuF++lTR5j8ZqpR0g7L2UuEf0us+UiBdh91ppkAaV/R91bK3lOCA5tJ
	lzNxwJwEuTPdfZlYzsPZv1ax4Xp5LV7bH2ZTmAfCQ8XxL15yUM6jQpH7d4cDvZoplCs=
X-Gm-Gg: AYBFou2VAebKCUivI5egORLDEqma01TCP3ODUFWkZl6fVj2eyEON03WKd6xClVCEm9h
	ev0/vSdHYxIjJMNwlS3hsiKWML4mRrXB7ocTz8BthnMINRM4gtqsVN/QKJ3iae0XuDr0f6ReP5e
	EMfwkY3nJ3IhmT+5fP/Py3n4BkwbhjKG2oWu6BTDW8FIrKWLM6Srtf/fAVL7Cy6h2Wi8v+IWcCJ
	KmQWFLMTVTi6qyOw+DrgrEcXmzbiDmgDekj0EB5CJKmSBI3L+civnb0tIwX3DlWXz5Mc9po+Xtd
	lSAYaU8VA2G0eSM9JgXRf1JkmQAbU8GjUgQrwtIn03NjiCPvlS1vEBBIhEN+31D/Nv32uwOp8xi
	qBlbt698sOsdo1HZ88ybrw7KSaB9f+RIbBTF01sk/mNmGmV+P9/uCm7Vwvsu8Ajlyk1iwWonNLD
	lPYOf+q2tQK99h4I0yJXGp2bVwwKTg1ehSTOv7xOzWyBwBluEJpuYRLrjpZGRs9/ivdpq9WO5Sx
	6jKvL+J4mq0w1j4iVbJyxbqvqCdnveSAc9tS51pb/+de6WIsWfZbA==
X-Received: by 2002:a05:620a:44ca:b0:93a:10b8:4c3b with SMTP id af79cd13be357-93c15d583a0mr373213285a.2.1790051586610;
        Mon, 21 Sep 2026 21:33:06 -0700 (PDT)
Received: from com-94485 ([199.47.143.14])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1cf0e6bbsm45125785a.1.2026.09.21.21.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:33:06 -0700 (PDT)
Date: Mon, 21 Sep 2026 21:33:02 -0700
From: Jeff Jo <jeffjo@openai.com>
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com,
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: net: check timestamp echo after an
 old ACK
Message-ID: <arIE_i8Ysz5nOI2W@com-94485>
References: <20260921222609.50824-4-jeffjo@openai.com>
 <20260921222609.50824-6-jeffjo@openai.com>
 <CANn89iK00zXGA8sdpH9Y1CkFK3n=uKG9Bci3+=69fGV0UDQ80w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANn89iK00zXGA8sdpH9Y1CkFK3n=uKG9Bci3+=69fGV0UDQ80w@mail.gmail.com>

On Tue, Sep 22, 2026 at 02:08:47AM +0200, Eric Dumazet wrote:
> Note: Even with existing packetdrill binaries in the wild that don't
> check TS ecr,
> tp->rx_opt.ts_recent is still directly testable in pure .pkt via PAWS
> (tcp_paws_discard()),
> the same way tcp_ts_recent_invalid_ack.pkt works:

Thanks for the feedback. I'll send a v2 series tomorrow removing the
redundant SYN_RECV check and replacing the test with a plain .pkt test
that uses PAWS for the assertion. I've verified that the revised test
detects the bug with unmodified packetdrill and passes with the
simplified kernel fix.

For the PAWS probe, I used TSval 300998 rather than 300999, since
Linux's one-tick PAWS tolerance allows the latter through.

I'll follow up with a separate packetdrill fix. How does that sound?
