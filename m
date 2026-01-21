Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4A93093CF
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 01:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768959098; cv=none; b=rZVuXSVi4mF2KxamTjJpqCYL6dxLA43tA+7jPcxdOiGgyjQhyAOlhyxEtWvDOEXBbApQAPcE1JrlqJMG3La0Sadsh/PuH6NSA7XxQrseAuZT1Eu3LXxdJtojBwvYOXW56hdB+VZ5SLBZzBgw2jLDqbRvBpGhvTqkOZejoxcLA3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768959098; c=relaxed/simple;
	bh=dEcCU3CGTGTpN7l/rN2LrkYLiTkUZ0f52QXFuNFvEZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmBNXu0ZQCu72Vt952m050jdojeral4M8EBi+DVcxxP/7snYdusj1JcdkItb6W9gcdSnjnGQI5OPFpPfPuDnye9LQ2Lriq8/vQBPI52GApb5QmayRP99t4ujA8wjFzGXUYhNK+JDzhNpY3UB9garP+CvchVoRBaXOaxfSvqaZn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h50dDHrN; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h50dDHrN"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7941578064bso5224527b3.2
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 17:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768959090; x=1769563890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E8iE0KBKIYKbBU2Zh8l50G8fq2WUoVHBO7RlhN61jto=;
        b=h50dDHrNERTJ1JhLzkHKw+qQXwiVbuaQQR89ZbxOVAM/qTicqyHz+TmJptauGGBaPZ
         cCAggqeULVjUU76rRqpnBRdWR4QMjo80ll7nemToQy3qLO6DuUagQlrdWjU0NincmOUH
         CUGqSdo1bZJxWKGKatI5KDK0aYbiufIJWM0QBGiZ/n5L+e2/7u0EWBPvmGCebn2meFvw
         wIWs+f+K5uv71tfkmc64xZBGFvQJhpstftvXfcn6UFTvzAAnwBKCMkwthhdCdhz4Eo3A
         HGhRKe+s0yn1+B0sfkbjkDvmQ/7EIt+01z9dHbvQIEU6qrmkh2JjlHEwoGZ8ed/Ox6Ww
         784w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768959090; x=1769563890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8iE0KBKIYKbBU2Zh8l50G8fq2WUoVHBO7RlhN61jto=;
        b=tWxWv5PaXoPXUt4tUYIQ73k4zMchbumKUi/qiZsFn9KV0yYWlZTrPSeCT0RagH1U/S
         bUsJEJQEeRWFDmLVGHp1PNj13GUD1HxIF0nvSwAC1b5ueseNgBnQn8TEwK1uBcQ3C1lx
         BAteQ0AA2ECMTT45bsgDDko18Kc6RcdHul10I1kAOmOvTJmJ2Ewm8z0fF5Ic3U1Qnf+X
         SEFAvWsswqK+qSHujFZzL541KojRqXDRAKdMdRJan1FXrjlaNcPJkHlsB3bnZPyEPp+N
         h64JZNEKg7uwvyChiHR/qkOGGHTIvRc02gXnXT6FqXIvISNzfEiK0BbhzbQxeQdrkSIj
         6J8g==
X-Forwarded-Encrypted: i=1; AJvYcCXRNQPRn2D7f8rdQrv7tzhJFlmRdtnVuJFokv9Vc2gJTcDN+/vTY21EjglCNuoGHJR34brwpwMJ1wtfDxxXKGo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7VneyPBpiJXihGr0sTyaF7HNb8TVqR3CJyyBTYCGXs8T7VrWE
	CZVtxPqslfkqx7qCwaNeo637ozt9OEO84qfxtz72omBYURsrwteR2BEB
X-Gm-Gg: AZuq6aK5y5lpFNNINP2+UuAMcMF/w6H5A8dsKvJGriPmYIGINJXy7yIJcguFND7SFJf
	gLjLaePuQzXmSSc2f8j5/Ww9irwZyw6/cYvpPqKsUXVqbyma5f8zdXLApD9k5bE8omwk5x7F1lV
	Sny0FPJjeHM8e7S6h95E1v34SOCynFgQZz6JraNF7UJpq0TSaiRD1Cl+f4qriIDieaJ1Dd6X+cp
	hxC360ANYN9AodU3e5/QUPLiftfrlBlEbeNlv8IKh5pJJ4rvgqMdWAt9OghxuI+xpwZY5Ul+xk7
	xtPEIjggFJR5CkQ+6H7fepDucyoY5gmeLGSiyXzBg1jWmzTCHWju9J7hKk7/tF14pts11bFN1bS
	0JTrm35cgFyB7pmib2hlqPe5VPnMzRSZS8/FZsU7J5XsrJ1M0mA4bVFgFKugku5F3xXxzVneAHY
	MSiUjQeCsMnki5vkcK2Qof0VKKGpZLlBzlIA==
X-Received: by 2002:a05:690c:6184:b0:78f:a535:93d4 with SMTP id 00721157ae682-793c52b1e63mr140115457b3.25.1768959089914;
        Tue, 20 Jan 2026 17:31:29 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:7::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66ee062sm59397217b3.15.2026.01.20.17.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 17:31:29 -0800 (PST)
Date: Tue, 20 Jan 2026 17:31:27 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Petr Machata <petrm@nvidia.com>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: net: forwarding: cleanup veth peers created
 via NUM_NETIFS
Message-ID: <aXAsb+sCbyeD/xkL@devvm11784.nha0.facebook.com>
References: <20260120230905.328528-1-aleksey.oladko@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120230905.328528-1-aleksey.oladko@virtuozzo.com>

On Tue, Jan 20, 2026 at 11:09:05PM +0000, Aleksei Oladko wrote:
> Some net/forwarding kselftests set NUM_NETIFS, causing lib.sh to create
> the requested number of veth peer interfaces.
> 
> These interfaces are not removed when the tests finish, leaving stale
> veth devices in the system. This can cause subsequent tests to fail,
> for example min_max_mtu.sh.
> 
> Ensure that veth peers created via NUM_NETIFS are properly removed at
> the end of the tests to avoid interference between test runs.
> 
> Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
> ---
>  tools/testing/selftests/net/forwarding/lib.sh | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
> index a9034f0bb58b..ae7699c0c7e5 100644
> --- a/tools/testing/selftests/net/forwarding/lib.sh
> +++ b/tools/testing/selftests/net/forwarding/lib.sh
> @@ -597,6 +597,10 @@ vrf_cleanup()
>  	ip -6 rule del pref 32765
>  	ip -4 rule add pref 0 table local
>  	ip -4 rule del pref 32765
> +
> +	for ((i = 1; i <= NUM_NETIFS; i=$i+2)); do

I'd suggest 'i = i + 2' here instead of "i=$i+2", as it seems closer to the rest of lib.sh
style.

> +		ip link delete dev ${NETIFS[p$i]} 2>/dev/null || true
> +	done
>  }
>  
>  adf_vrf_prepare()
> -- 
> 2.43.0
> 

I see that some tests that set NUM_NETIFS do not seem to call
vrf_cleanup() (e.g. bridge_activity_notify.sh), so I think those tests
will still leak?

Maybe lib.sh needs a remove_netif() to go along with create_netif(), and
then tests can call it from their 'cleanup()' EXIT handlers? This avoids
the mismatch between vrf_prepare() not creating devices but
vrf_cleanup() removing them.

Thanks,
Bobby
