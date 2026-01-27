Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAE218872A
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 06:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769493632; cv=none; b=DZUyhk1+HTBTiGsZgDjb9sZchjrBy99mtWbL2ciqDoaItzB3t04Tp5uB2gBEYc9in/gLI/K10RgbGYRRqXqRT+w16xj8mO1p2D4nmQwgppxeqBOp5TDM+qMbB5UCj4fNQ6c/kj5/6FSCGy3TDAgbthoIlrX1K+dFsx9S3dhlHww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769493632; c=relaxed/simple;
	bh=v/u+rBX4luP4l2y0k4d4MJwxSQLjgxjIcVpFBIL6lHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7XsrpuoTDuiSHfZCjDQ3L+AWLvQlp+ZB/MR4fzRbPTss4IVd84+/ZfHqNqq4J3Z1A5/1EPk0sm5rx5XOovvfx12nXfk4lqLfPyHmtALIMVx8qq88/c+vgSZSFtADhvUgrFYxfe5Mw1R9z7V9XBs0cL5to+ej8PzHseFVJFXS7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLDqdHPf; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLDqdHPf"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-11f36012fb2so7484144c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Jan 2026 22:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769493630; x=1770098430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a803xA0SW+lSUQWToabOiMzbo1P7cUc3kCdEW2eaQec=;
        b=DLDqdHPfWk0o+gSD5pgARfeKHy2TUdAaS8uw1NmauBipNaULr5DL+mLTBxcMKTkjxG
         +w5gjtRDs8DR1RtwVb9nwlv7k+E1OtsCPJHtHONYHtT4J+xnSMPhA3VCb4CJe8ycczuL
         ENFpSLbU5Adck6SIVvpmOJOok+lWIPro6yf7zoPVJONnljqQkIEdVR9sALcLQ+q7EKSc
         7STZ3CSGsWs21Swpq2QhkaTIzMZc1lpqNNyXJAlMWlTLoT8JYzcKcJnVJ3HzGRiSskV3
         K/vIJ1pcgleYZHjGwTu/c0OxE510Mvuzwk1kpR+elyWCeiOr5GzExE5p7ak0Kr4t6Yxq
         EzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769493630; x=1770098430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a803xA0SW+lSUQWToabOiMzbo1P7cUc3kCdEW2eaQec=;
        b=EB6/T3viBO1BTiSe6xo2A9kPBllv7HCu9k2whoEpFIMnukFo/P4gd0v85sBdUzuD4m
         /cfL75nCEAVUW/wxIROnH+zPuEIBEXK38/PlYtFYBgKySkZnVTs3eEc2FABKAlWOsEj9
         IObuEoGWl3p8s5aTuG+C0U8hfck7PJrGpK/2IfhIxssP31ztrRZ6jfRGGID7PfnrBXmR
         2dD66Wp9u3p1NNDBf3IRNDkVBD654iDxdAiUlREclbOOi9U9CAgaUnhadu3uEigmvX8A
         VyQ1/btWDS5vPzL2GCPcDUwuvaJ6qFEqETXpaE7nMglCmy94Lxgwcmlf4NjUXzNK3p5J
         DdnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT/zyfqChdgbRY5ilCd9V8K3c+zBPDeL7gksR64oFBj7KU9M/3Eet2mKwGzV28bsAcuJw9049elmiygX3T9lc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze5B+7RL5eUidr+Vv1wC9/P6FP+MFvvBXhAdAQ5gzgExl7cEDy
	p8hXjpGJ1QZJ1iU3DGZ6HYeLnnaIzl89M2vO5cYtvOecEaRrhx1iloU=
X-Gm-Gg: AZuq6aJHDjknGteeyOY5Rg8tXh+YN+toVJIpoqeHUqnOPAMwrHkjJWJHhLProvpbS1B
	kaQ0tSiwRCXgj0+pan7dehYRjHdvhQj9zLCqm1fUVE8iidiZvzdFAP/rDkD5OlBIsNM2AhPDSM1
	R+znkfbxOuFtreSay+iuoThJ7zkqsixnJJWk8T0tuBwFtoVOLiIm42UmTLYTyVn8QszgPtCAO2a
	HT6mhiCxxyDN6hadRdBU+TrlNlxmStcRS43fwaPa+C9fK4RHj6pt53wtVpPyAoLAwnS0AWW+0x8
	duuXzXg3QKw9msuUhjYuC8FZvg+ztcKtpQ4lkAEk3jTUj80JkBMmJjKpIgmEWvVF7o3NjMDq9n3
	UYp1/kHdMFoLWKVZAw16ZEVbs4Vomu1ksZN7/cqGnO7d0juAOYNNdPgVRGGGLFHcjrVzTd8okWu
	wt9AwP/HWsKweOAZsvev5AYCQDRsrPG5Rxqpn7LDlzQMKsHP59zMsPo9h0jjTdM1Vi1WRTj8Jve
	beEA3BF4L5n+Wkg
X-Received: by 2002:a05:7022:20f:b0:123:2d00:1668 with SMTP id a92af1059eb24-124a00e861emr496547c88.49.1769493629755;
        Mon, 26 Jan 2026 22:00:29 -0800 (PST)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90d13esm21240114c88.2.2026.01.26.22.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 22:00:29 -0800 (PST)
Date: Mon, 26 Jan 2026 22:00:28 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Mina Almasry <almasrymina@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	asml.silence@gmail.com, matttbe@kernel.org, skhawaja@google.com,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v10 0/5] net: devmem: improve cpu cost of RX
 token management
Message-ID: <aXhUfC7ZyYge1jti@mini-arch>
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
 <20260120170749.101e8bcc@kernel.org>
 <CAHS8izMZxM6rcF+7Lfw=KFv4dmbHGSUrQBPmxO+sYj=V3TRuwQ@mail.gmail.com>
 <aXe2QhzL4DoVbesQ@devvm11784.nha0.facebook.com>
 <20260126173124.1f0bb98e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260126173124.1f0bb98e@kernel.org>

On 01/26, Jakub Kicinski wrote:
> On Mon, 26 Jan 2026 10:45:22 -0800 Bobby Eshleman wrote:
> > I'm onboard with improving what we have since it helps all of us
> > currently using this API, though I'm not opposed to discussing a
> > redesign in another thread/RFC. I do see the attraction to locating the
> > core logic in one place and possibly reducing some complexity around
> > socket/binding relationships.
> > 
> > FWIW regarding nl, I do see it supports rtnl lock-free operations via
> > '62256f98f244 rtnetlink: add RTNL_FLAG_DOIT_UNLOCKED' and routing was
> > recently made lockless with that. I don't see / know of any fast path
> > precedent. I'm aware there are some things I'm not sure about being
> > relevant performance-wise, like hitting skb alloc an additional time
> > every release batch. I'd want to do some minimal latency comparisons
> > between that path and sockopt before diving head-first.
> 
> FTR I'm not really pushing Netlink specifically, it may work it 
> may not. Perhaps some other ioctl-y thing exists. Just in general
> setsockopt() on a specific socket feels increasingly awkward for 
> buffer flow. Maybe y'all disagree.
> 
> I thought I'd clarify since I may be seen as "Mr Netlink Everywhere" :)

From my side, if we do a completely new uapi, my preference would be on
an af_xdp like mapped rings (presumably on a netlink socket?) to completely
avoid the user-kernel copies.
