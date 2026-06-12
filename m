Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFC2345CBE
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781276305; cv=none; b=SAGAFu3WZ5yK0zQyxBX1kJ7/VIIcqKWSgFZRmj8En4qKL0SpfVdZfFW71UNJxnS7p7EQ4SNk/aQMYl3y6e72FAWLL/3SBo2U9MtRk5VfI2o9D5ssX/1EuvtDZf2JraFXaVxBQymCYJyLTb2cz6cyCMW5s+aUdHjJoUan163gAro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781276305; c=relaxed/simple;
	bh=k0qUAcGriL9M3ldME0Wx7uurzJb6Wq7dm2Bl1WpnN98=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=Utojp2xFnRE3RVLy7CHsNUokKq4J0tP7VYrOXIUC+O3IaN3OocF8BhZ+dZ+IdrHPrKJ+RbRqCWMZ3O6btA+oHjvkyLrCBOVmx83+R2F0eLgDnsbahlx6hA1qjZQ+RlP2+OP4NhZn0vl0XVtAE0H0WSs472L5B5SC7N14ot+c1x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZYA9nmo; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZYA9nmo"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6605859ed83so447015d50.3
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 07:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781276303; x=1781881103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3S6NHQe4ZIyWygNURSfM9i/aQz8oPyjRNWHr8uR1BO4=;
        b=rZYA9nmoVuUTHNZk5qxpLYhI9b/2eEx4ouNkM1NXJAHHZgx1XFPvZcSYf7rdaSis4Z
         uMkqDaNk9bQJ6xhsvDFsgFoqz4ewdKq2uUZmWqMzFd8PGEGwyNbhMXu1IyKLkWtbwUZb
         ZlPYog4VDp9+O9OD8XVlK7Uab/JRgbyzfimL0D3AWdIWwttbh8ht8Ch78ENIbY7GPIW9
         ijxj6tmI8JFAgfsi2b4/AITTtz/Io2rlLxSk2JrGCODfP6tPTXWNlS/u9Pc4gup9zyYd
         UFB86r11MAP9/kg3/0vYLwAXTXCfb4BKMBBCW8+S6oeQB3iu3mnITJGesJ3G0zoYgMoB
         iDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781276303; x=1781881103;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3S6NHQe4ZIyWygNURSfM9i/aQz8oPyjRNWHr8uR1BO4=;
        b=IEndQdndDqT/w7N+p5vfIpdbVe/bER75CmOHRQedG1HLlVGD7jcW2spb/YUt445/+q
         KqS5/tM3I6hDK3GQfwWRhsEJa1O9OAO3v7+Bouq4sw6O+X4qoN7p6xixkQDkVuBQfhrJ
         fFFpxsGZa0XEZCw+fy77eZZI3prqMX/Q2oW7/73V8i/p7b+YPaD83KpfiIghzRJfbZHD
         cYz68MhLPvm6jvfpgUYA1sQgooU8fULrRJDdI0+AbFTafJg+t9h4v2cLwrGJDN0OQ+uE
         0M33Tk0mqpemu0DsV1DXRmY+/+AsBxAgh9XKyEXQoBa2xpqSKyQGuY0OO1UI4WRU+PK9
         FEig==
X-Forwarded-Encrypted: i=1; AFNElJ8fsMdXXWs9lZoymlNH+QyrUHtW8KsYOPUWSLVLtNIjWs+LKteG9hWu1MzBQXLXyFOga2xTrr5XPEDQE3z1VXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+EOEwGDQfUKQWfJlv3WKijwmUYR4TChLKwnLDZAGWIXa5EPaB
	0ayBzRTO+O0KxFW1IoMqvJAXe02kgpWKAFif/hmnRU0+cdIi62+bq/hi
X-Gm-Gg: Acq92OFPrR28/cZ1BOhTZ/OZFaUmAvg4XGPvTEzEX53fwbA08IeLmoPYZt1p4Z3W2X0
	0fo4Q01hoJ+gCiSpSIL5/+V3lFHImc4tKbcTXks246S3g+lT5fb8ciP43Sywt8pBxH0cigzjMEc
	6kRrxe465bHmaVMdaqLNzRbLm7493dc5ehDN6GFZT1UAQ12ZaM1GWfDnzkLHjw61lXr7lB8F/EX
	CP829R0vk25tfWwCtywtOR3mTecpZEBljkNsn2Ltv4j3NX1ZTxDeNvCYPpB05H1qxB8dlByE0Re
	IdajMYSxIU9bSZsDZJ53AS597IlozlVynOzp1l+9M9HN1qhR6zJRfmCKSNPcwxiR+1Dzp016KGL
	02laacOWIwkufsYahXogMEJF86WIKhjrJ3/8lwMCyzCNc97sxng8Pxd24dO7i/581nxM2gZ1ru0
	BxZwIX2Pf7HVEiH1dLNjaBEugmkLnWxwXgcXPYW23OPktj7kdklMz+FosE5G+HHTkci+Iit6ujI
	LSwvDo=
X-Received: by 2002:a05:690e:144f:b0:65e:43da:a470 with SMTP id 956f58d0204a3-662782f5925mr2641422d50.30.1781276303255;
        Fri, 12 Jun 2026 07:58:23 -0700 (PDT)
Received: from gmail.com (141.139.145.34.bc.googleusercontent.com. [34.145.139.141])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66274c4017asm1259158d50.1.2026.06.12.07.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:58:21 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:58:19 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, 
 sdf.kernel@gmail.com
Cc: netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
Message-ID: <willemdebruijn.kernel.26a37316bb5e2@gmail.com>
In-Reply-To: <20260612-getsockopt_phase2-v1-2-7b01f1f5d106@debian.org>
References: <20260612-getsockopt_phase2-v1-0-7b01f1f5d106@debian.org>
 <20260612-getsockopt_phase2-v1-2-7b01f1f5d106@debian.org>
Subject: Re: [PATCH net-next 2/2] udp: convert udp_lib_getsockopt to sockopt_t
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Breno Leitao wrote:
> In preparation for converting the proto-layer getsockopt callbacks to the
> sockopt_t interface, switch udp_lib_getsockopt() to take a sockopt_t.

What is the benefit of this conversion?

It does add a lot more complexity and makes the code less obvious.
 
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
> -
> -	if (len < 0)
> -		return -EINVAL;
> -
> -	len = min_t(unsigned int, len, sizeof(int));
> +	len = min_t(unsigned int, opt->optlen, sizeof(int));
>  
>  	switch (optname) {
>  	case UDP_CORK:
> @@ -3037,9 +3032,8 @@ int udp_lib_getsockopt(struct sock *sk, int level, int optname,
>  		return -ENOPROTOOPT;
>  	}
>  
> -	if (put_user(len, optlen))
> -		return -EFAULT;
> -	if (copy_to_user(optval, &val, len))
> +	opt->optlen = len;
> +	if (copy_to_iter(&val, len, &opt->iter_out) != len)
>  		return -EFAULT;
>  	return 0;
>  }
> @@ -3047,9 +3041,27 @@ int udp_lib_getsockopt(struct sock *sk, int level, int optname,
>  static int udp_getsockopt(struct sock *sk, int level, int optname,
>  			  char __user *optval, int __user *optlen)
>  {
> -	if (level == SOL_UDP)
> -		return udp_lib_getsockopt(sk, level, optname, optval, optlen);
> -	return ip_getsockopt(sk, level, optname, optval, optlen);
> +	sockopt_t opt;
> +	int err;
> +
> +	/*
> +	 * keep the old __user pointers, until ip_getsockopt() moves
> +	 * to sockopt_t
> +	 */
> +	if (level != SOL_UDP)
> +		return ip_getsockopt(sk, level, optname, optval, optlen);
> +
> +	err = sockopt_init_user(&opt, optval, optlen);
> +	if (err)
> +		return err;
> +
> +	err = udp_lib_getsockopt(sk, level, optname, &opt);
> +	/* indepedendent of the err, return optlen */

typo

> +	if (put_user(opt.optlen, optlen))
> +		return -EFAULT;
> +	/* Optval was updated in copy_to_iter in udp_lib_getsockopt() */
> +
> +	return err;
>  }
>  
>  /**
> diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
> index 15e032194eccc..731122deed8a5 100644
> --- a/net/ipv6/udp.c
> +++ b/net/ipv6/udp.c
> @@ -1826,9 +1826,20 @@ static int udpv6_setsockopt(struct sock *sk, int level, int optname,
>  static int udpv6_getsockopt(struct sock *sk, int level, int optname,
>  			    char __user *optval, int __user *optlen)
>  {
> -	if (level == SOL_UDP)
> -		return udp_lib_getsockopt(sk, level, optname, optval, optlen);
> -	return ipv6_getsockopt(sk, level, optname, optval, optlen);
> +	sockopt_t opt;
> +	int err;
> +
> +	if (level != SOL_UDP)
> +		return ipv6_getsockopt(sk, level, optname, optval, optlen);
> +
> +	err = sockopt_init_user(&opt, optval, optlen);
> +	if (err)
> +		return err;
> +
> +	err = udp_lib_getsockopt(sk, level, optname, &opt);
> +	if (put_user(opt.optlen, optlen))
> +		return -EFAULT;
> +	return err;
>  }
>  
>  
> 
> -- 
> 2.53.0-Meta
> 


