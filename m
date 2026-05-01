Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FDC30E82D
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777656776; cv=none; b=o4kairHEoLdYn5uq/uhegemclVMW8AGVF7D2yfQb/k5Qw/8zBWnz0dSa2zDBy0nUumgWTU70t+Z+mt67ot5F3KBkaukWdfEo9C8hHUVG5ZUIdw9dMGgpIEzbBJTuGTm6qgjZVArzwMx5FY+64tNciQwM4NnrqTrvEya1QPkIBC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777656776; c=relaxed/simple;
	bh=NaBbNXwWIH1VnZaIKy4sMwMBtFjUTNWJd1g7S4np/Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9Qch9SAZwWiSXS/w0W+6oqVvG+dZyd1bI742jzfNN8pp0B+YLEvbvFoqW5HQin9wdjzBZp1j+n5XVL1ze8CJCfBZcaaZhzsLAb46VmgvQefZI1aIZxNJ3zAXIGsHYSo/jpc7kHLkJj/Orm3YbTSDGjEam9jryLvuxaYcw4hIS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efxVWf89; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efxVWf89"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79ee5037d44so33963267b3.0
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 10:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777656774; x=1778261574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AryNV0l+jgUF7izPhm+UoZG1NwQ31VUz12XuoxZ/bAc=;
        b=efxVWf89qiF/V/OzGoKXB8Uevv7jlCkk4CbS2SAJ5HU/JhmNsDwmue6U7l9s1KVxVA
         PHYAsbfhDEty5RRsDr8mgCdgJRzYXy6WjxW0pACtsi9aIAcsSk8p6VHsmSNZCWOZxDt/
         uVzPB9Z0/IX+mFx52HIsIUVelkJJc+5YOW+ZTMLoHL37Hta/sz2qXq/Hz9Oog/alu2C7
         3FTnQCaB5DLc19uOmBXs9b9LwUvtmwNUOuMLGW1RG2P/RpwBKUPwQFfpANCmPDCPsEta
         RACS6MiRRb0KMR+6Bs2UmN23KCWS8YLuyHnqQ49qOEbgItkrtac9ceB0xoX11BMlBwUG
         X3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777656774; x=1778261574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AryNV0l+jgUF7izPhm+UoZG1NwQ31VUz12XuoxZ/bAc=;
        b=VQJA80BbKlYoMqYkZPF/KRJF8/a2MyY2tV/Y15CLkroP2LSo3jueHvgisnm0u0Lk/J
         ErcQu+ostBYooFcM1u+Gpq9h7Cv8mgURpNZYx9B7jRDXds8FwJVGWU4nfjpdFYpRWJqC
         rED4ZqFXtMgNwH3QjkOcr1F/DZ2tL+XCfH2OE7CSUpstCW3k89Lu7jN6yH73TvoBPOhT
         bwK6BKujhNcXZNWbw2iQ3jZG2F2z2wcYRbvP+bQ+ER36s6BqTChXP3jgfiaiINDarJDE
         THEhp8iDR5wugMIAblohuK4EHKCU9zaLJ3lXspZOUkplejoN71tbTPRDcKCfx3aO/K/1
         ooZA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZdNAyRTULvEJBvzfWr3F3ZEvzL4aeRpFBhLYfrtkmm9V+k8MPbZR+58ffLl1KcNKzR+bPL5ZJBpm59Z4CkyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPisF9w43fMkpWMKPCk0ofmbadjriEXSa/cz36MrFhuvZsMw2w
	AI8CzsXlF9WHzs+QDqylf7plIay1QJ2byWKAXFxN36OfGioTNOBtKjKK
X-Gm-Gg: AeBDiesCwvT6+OyvhyEBUpregMDctgv146rTg0KnD0vzx4MiX2AL7Oe5FxjNSgqD5K1
	G8minHgbfS20sKjvhwaGzxOLMz0vFppfJbJPpW6PQdWVBxiP1BsTL7xDt0shUEmaPPlB156noBR
	lXVvZPW/6a7LFGi6XdIS/WGKiDnH2rxwvISzfkn9rcljpUZpPHsIUVZYhVx2moch3hKH5Lzh+tl
	1vkiCe0HI7D/tTeAzPh5lYMBpfqt/1bopwSVMYxMKUqNwI5jV6eRxTsgNtm/iEiWtXDtRXMNcJp
	AtBaMXI7GSROcjvb/jFAfod0JBZ79goGVO02PJMzLUKYQFk3ekWKuhKGFcEO0RggB/pG6gHanAw
	CRZ5BTFRF6c3ajQqypdUQGmJlr19LCxM9t2ndaao8zbep0NRdEL/k719PSe46iNm/otN3xXBx75
	LzwjZSKXqEzEU2aUJd39AJ9cM9qbjujJwqQQfneaPumx3UJC/GzyGmS10=
X-Received: by 2002:a05:690c:1d:b0:7b4:6f40:654 with SMTP id 00721157ae682-7bd768772a4mr4403587b3.4.1777656774212;
        Fri, 01 May 2026 10:32:54 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:70::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd665694b8sm13710007b3.21.2026.05.01.10.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:32:53 -0700 (PDT)
Date: Fri, 1 May 2026 10:32:44 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Shuah Khan <shuah@kernel.org>, sdf.kernel@gmail.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH net-next 2/3] vsock: convert to getsockopt_iter
Message-ID: <afTjvM1P4gjPSvW8@devvm29614.prn0.facebook.com>
References: <20260501-getsock_one-v1-0-810ce23ea70e@debian.org>
 <20260501-getsock_one-v1-2-810ce23ea70e@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-getsock_one-v1-2-810ce23ea70e@debian.org>

On Fri, May 01, 2026 at 08:52:52AM -0700, Breno Leitao wrote:
> Convert AF_VSOCK's getsockopt implementation to use the new
> getsockopt_iter callback with sockopt_t. The single
> vsock_connectible_getsockopt() callback is shared by both
> vsock_stream_ops and vsock_seqpacket_ops, so both proto_ops are
> updated to use .getsockopt_iter.
> 
> Key changes:
> - Replace (char __user *optval, int __user *optlen) with sockopt_t *opt
> - Use opt->optlen for buffer length (input) and returned size (output)
> - Use copy_to_iter() instead of put_user()/copy_to_user()
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  net/vmw_vsock/af_vsock.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> index 44037b066a5ff..d4a97eeb596e6 100644
> --- a/net/vmw_vsock/af_vsock.c
> +++ b/net/vmw_vsock/af_vsock.c
> @@ -155,6 +155,7 @@
>  #include <linux/random.h>
>  #include <linux/skbuff.h>
>  #include <linux/smp.h>
> +#include <linux/uio.h>
>  #include <linux/socket.h>
>  #include <linux/stddef.h>
>  #include <linux/sysctl.h>
> @@ -2091,8 +2092,7 @@ static int vsock_connectible_setsockopt(struct socket *sock,
>  
>  static int vsock_connectible_getsockopt(struct socket *sock,
>  					int level, int optname,
> -					char __user *optval,
> -					int __user *optlen)
> +					sockopt_t *opt)
>  {
>  	struct sock *sk = sock->sk;
>  	struct vsock_sock *vsk = vsock_sk(sk);
> @@ -2110,8 +2110,7 @@ static int vsock_connectible_getsockopt(struct socket *sock,
>  	if (level != AF_VSOCK)
>  		return -ENOPROTOOPT;
>  
> -	if (get_user(len, optlen))
> -		return -EFAULT;
> +	len = opt->optlen;
>  
>  	memset(&v, 0, sizeof(v));
>  
> @@ -2142,11 +2141,10 @@ static int vsock_connectible_getsockopt(struct socket *sock,
>  		return -EINVAL;
>  	if (len > lv)
>  		len = lv;
> -	if (copy_to_user(optval, &v, len))
> +	if (copy_to_iter(&v, len, &opt->iter_out) != len)
>  		return -EFAULT;
>  
> -	if (put_user(len, optlen))
> -		return -EFAULT;
> +	opt->optlen = len;
>  
>  	return 0;
>  }
> @@ -2631,7 +2629,7 @@ static const struct proto_ops vsock_stream_ops = {
>  	.listen = vsock_listen,
>  	.shutdown = vsock_shutdown,
>  	.setsockopt = vsock_connectible_setsockopt,
> -	.getsockopt = vsock_connectible_getsockopt,
> +	.getsockopt_iter = vsock_connectible_getsockopt,
>  	.sendmsg = vsock_connectible_sendmsg,
>  	.recvmsg = vsock_connectible_recvmsg,
>  	.mmap = sock_no_mmap,
> @@ -2653,7 +2651,7 @@ static const struct proto_ops vsock_seqpacket_ops = {
>  	.listen = vsock_listen,
>  	.shutdown = vsock_shutdown,
>  	.setsockopt = vsock_connectible_setsockopt,
> -	.getsockopt = vsock_connectible_getsockopt,
> +	.getsockopt_iter = vsock_connectible_getsockopt,
>  	.sendmsg = vsock_connectible_sendmsg,
>  	.recvmsg = vsock_connectible_recvmsg,
>  	.mmap = sock_no_mmap,
> 
> -- 
> 2.52.0
> 

Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>
