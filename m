Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4623803D3
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 02:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781316623; cv=none; b=CLxCZPxB4hvRFsOM1G9jQuG/xEyOBbcmpOFOEqFlXaPrnTrEUZIWZE/2Xn9N3zR+/JtjSULmEysMsxCs62clheUeaCE97T2ojhTc+zy2gLlCvX7j/RGkj+oEf3v9xstlFmrKZSUzR2hEoMvtRe3NKz+k1k86xc8Y0E6foSgRB9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781316623; c=relaxed/simple;
	bh=uTqsrI3kXHlZ9s5FCWhR0+ezVXqQfpVv9lD9udQjaag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2T77RGt+Jotz1Bq98UhejLYdE88n6OuahmnK5myYk0fgUfal9XVn6+10VmlWxMYxqJW0UzIi2aD42om9DC54Jrq5OD5jLZXJJrHw7QkRzcYS8bdGUm3M9WnNF95w+uAJNXIOU3zebuwb9SWdFKcOqnrH2m3WxmSLgQ+AvD9Hfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYBNAx6R; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYBNAx6R"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so1146496a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 19:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781316622; x=1781921422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wlXZARvbuLg9eimNdY6LbUYqojjxqaDI2VXv+ws27Jk=;
        b=WYBNAx6RA3iHPgNBsHKg4uE+y16iBvAyMLIjSJjtVZOb3mrw5ALHYKZAjujzpuizAn
         XEYzSZUyhdLbQVSbmvk37prtPys0Khb7V+gyjUkS4L8PHfAVHYpwRCgeUJTTD3Tmn+Fs
         HZz8V5BzT8DmnRgJFK/o/ms07Q4nCvFGkXDZN95clbcrAkTry6NWv+UgcJ9S661w5vqs
         gADNzKaJ9VKbF7MlUjQNW7oINoGnsOxItnXPmNmUDPEi2B+1Wv9HxCtjLFTKxZ7YRdXR
         xhblQkcNhsdXFBYM/ahhBritH+mfGzNmbsSQqkaI9xMsjQi75yiW10zD75Fq7LjqXqji
         ujaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781316622; x=1781921422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlXZARvbuLg9eimNdY6LbUYqojjxqaDI2VXv+ws27Jk=;
        b=MO4ob56BdOk25QuHWze0uGqy6iqPdKkwvOMPSkCYOw7cjE/kbtewvv+6qb8+Y/jHtz
         m5t1twIre99ltNRWMAxt0JnyxZYT0uNpnzVL7kBL5HWWXHcJpijDNrI9Uh0T8o7xwFny
         Gcjeaxdcy/gufoTAGqWFsMPNHHV+i50Zr6ePKrUwBUYj+te+CGahpDBsT2X4twqHdVJW
         m8If3e7R24/kGCJ46vakzo79sA039OnfrQncn7V5YAzgUEgZn47ySdIBmx7cs+zWH+/j
         cj+BK1K1u629uZ+BLwWWNb6HYYdiM1kOkgdytPiR6pg2EwICQB/COZfPqHngIOyFAFX/
         ou6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+fWuZj7pNjKw2qKRNbqfYE7617m8CAdx80VL4oIXm6DAiPSxm04TYyeVvBeqroCYcGvWS7/qEvJa8MdcYjiBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC9+yA35F+6FLZHSBtYrAZp4oQag3s7xI444ifoXHhiusYdpF8
	AT2u1lGJEUPTOpqiEKjizAvL5qGUxXAg+mqmd8+f3OqwmpGMHMIOBn2h
X-Gm-Gg: Acq92OGZKXHKo6J1Jjbnq6nZzSXplSyzAQGR8nXyckYpuhIHqDAbZ33XuU4pqhftlgp
	oCsUnW8VBSqfVQTpMHdyJJ5vX7TifNm9EVPYG2y1vlEyo6dqGW2FVq4ruxjjO5H3GO5MOGgO8KZ
	b7Wbjs5k4q9oh7p7ulj54HT8OOhenNQ/p8jK+eELbIGoI2Mh4A/ulUKol1UGKWaHWMJUjk7rydi
	LQPUU8mUfBtyg33+nbUZyGboHLwG/O16qDfF3a4umngcEY6Eo9X8I3R5yQMFHWxmlEWputtGf0o
	rR+FDqrGXv/q8kH1lp9wUMJtxy8pcf6f7eEpydEy6MDaxSe4ctxxhSlN6TY/AhCJhHglA8lUnNZ
	cJ+Ab+1pDg2XpGtv4NX9843yd6DWta6CG+yjN/hKSPqUObGq21yqgBTA+/RlYal8wcQ3iB/vttr
	Tg6h2R3K2CN+XQxc3Grk2sfcZf9ro=
X-Received: by 2002:a17:90a:d44e:b0:36b:2179:6d23 with SMTP id 98e67ed59e1d1-37a01c36da1mr5844647a91.7.1781316621781;
        Fri, 12 Jun 2026 19:10:21 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:41::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379c3240b5esm2395134a91.0.2026.06.12.19.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 19:10:21 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:10:15 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net-next 2/2] udp: convert udp_lib_getsockopt to sockopt_t
Message-ID: <aiy7ZR7Yz2Z4Ioyd@devvm7509.cco0.facebook.com>
References: <20260612-getsockopt_phase2-v1-0-7b01f1f5d106@debian.org>
 <20260612-getsockopt_phase2-v1-2-7b01f1f5d106@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612-getsockopt_phase2-v1-2-7b01f1f5d106@debian.org>

On 06/12, Breno Leitao wrote:
> In preparation for converting the proto-layer getsockopt callbacks to the
> sockopt_t interface, switch udp_lib_getsockopt() to take a sockopt_t.
> 
> The thin udp_getsockopt()/udpv6_getsockopt() wrappers keep their __user
> signature for now: they build a user-backed sockopt_t with
> sockopt_init_user(), call the helper, and write the returned length back
> to optlen. The helper uses copy_to_iter() instead of copy_to_user().
> No functional change.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  include/net/udp.h |  2 +-
>  net/ipv4/udp.c    | 40 ++++++++++++++++++++++++++--------------
>  net/ipv6/udp.c    | 17 ++++++++++++++---
>  3 files changed, 41 insertions(+), 18 deletions(-)
> 
> diff --git a/include/net/udp.h b/include/net/udp.h
> index 8262e2b215b4e..1fee17274745f 100644
> --- a/include/net/udp.h
> +++ b/include/net/udp.h
> @@ -430,7 +430,7 @@ struct sk_buff *skb_udp_tunnel_segment(struct sk_buff *skb,
>  				       netdev_features_t features,
>  				       bool is_ipv6);
>  int udp_lib_getsockopt(struct sock *sk, int level, int optname,
> -		       char __user *optval, int __user *optlen);
> +		       sockopt_t *opt);
>  int udp_lib_setsockopt(struct sock *sk, int level, int optname,
>  		       sockptr_t optval, unsigned int optlen,
>  		       int (*push_pending_frames)(struct sock *));
> diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> index 70f6cbd4ef73b..0691f74db2c11 100644
> --- a/net/ipv4/udp.c
> +++ b/net/ipv4/udp.c
> @@ -76,6 +76,7 @@
>  
>  #include <linux/bpf-cgroup.h>
>  #include <linux/uaccess.h>
> +#include <linux/uio.h>
>  #include <asm/ioctls.h>
>  #include <linux/memblock.h>
>  #include <linux/highmem.h>
> @@ -2995,18 +2996,12 @@ static int udp_setsockopt(struct sock *sk, int level, int optname, sockptr_t opt
>  }
>  
>  int udp_lib_getsockopt(struct sock *sk, int level, int optname,
> -		       char __user *optval, int __user *optlen)
> +		       sockopt_t *opt)
>  {
>  	struct udp_sock *up = udp_sk(sk);
>  	int val, len;
>  
> -	if (get_user(len, optlen))
> -		return -EFAULT;

[..]

> -	if (len < 0)
> -		return -EINVAL;

I see this part now in sockopt_init_user, but you mention that it's a
transitional helper. When we drop it, will we loose this <0 check?
Maybe keep `if ((int)opt->optlen < 0))` here for backwards
compatibility?
