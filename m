Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EAE55D89F
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 18:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001078; cv=none; b=qI4gJksMPqEYmkKlJrE57bOc9II2oSvCu3EAvjXI88duy9j7nFQsHmtu2Dzkv19D3DXMMOFoI6GfNI+7yGhNOWRgUzehofC3En7vrcGiE3yJfBPV7b2gclumMbns+SANGYJwS+Fur2NrKDR3dIiZQetrtnLXV1t8O97tm5Wuy3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001078; c=relaxed/simple;
	bh=byT7Oi0cLhQwYSkFtKGiGpgd82T4uT9+1PBWVi3fXck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+LtLGyJrSJ49rQeHc8E5C5MQDLqGffxpA40898ws0zkF6mueMx0r0c5VvQ6xV+M5ZVfZGrFLoJiWEVtYtx4y5vDh/i9G/6QSX/h+LHSmLCWKES2Yy+5E4jp4Rzu8DAKv1oshidY2YNcWDC/hT1PknueiEXFItSUzilP1muP664=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnd/SA38; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnd/SA38"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc53988d9f3so1752590a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 11:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792001076; x=1792605876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wq8CsgNnCjhuDOhxvAaqmUytJ+XS+cCMriLGrdCHHLo=;
        b=nnd/SA38bm89Ivzv0ASOgGzzkdq+hLveZgclJ3DEmPRvXo1Wg/D1YxOmPVL3wXVBVJ
         egdZCD6DBy6RA95gnqJQP/JbeAwGIsEhqJJVUW/FaG4RAoOHBgIZmw8CgZ6Ga3dvPDB/
         T/1FNGlC6N1EIXCIY9h9oCc94t9BADftyB0PJZTNkbpjIJCwjCFtSZWqW159VIUo3IkP
         c2Yxr+UZohi7TaUpsFE9OgCktLRbk2m6i33/mFyyatpfc6MAVGLUn1xusutvGE6zBL3r
         wtZhfo6B9eK0gx9AH8kJF1D7IQXvzxM+iEvnKgTAAQAShLXzSeyY7sH3VJ2hyGOUub61
         PKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792001076; x=1792605876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wq8CsgNnCjhuDOhxvAaqmUytJ+XS+cCMriLGrdCHHLo=;
        b=CRLjNp2MOFVlXMv2g3Opoc2Pw8mg0u1uFmVp4SEa7F8Y66uOFZobhhoMpasMMSM87F
         Symdd+0Ni+vO8ABSF+BGnRjIATITSYF6EsARcScYTkf2q60TkZIMojCGlQtSl97SLomR
         UUd3bD7H68x+wz6wFS88ggpRKyaZ/Im4oANV4NpTY9ixfZGVZyDMNqtYTZWZsqqCyvL3
         vLA/kwGVOc2bcJJ3u3y7yfvI6FZ13iaIwWNb7O/2XHVesy7Cp2Jupp3db6kHyUlkiTVB
         gAFjssW/qUXS2iqnfj0tFphhgu4X2DuCnejRw2mV6eyekS8EJNkBK73CMJfjVIxnnEbH
         kkvg==
X-Forwarded-Encrypted: i=1; AKwUvBwpGLQ39KHPrOflnKQ5XXDA9Yu+JoLPseQRxszZTJJrwIPKCglfCh3YqJ2Jdpty6UmTFQl1/+rTId1JfrtlwLE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIigYCittuiumzMrx39s9zbuUjiDhWss0zhKXzoGkZcPmL/QxmE
	3zp/ycHCYrXqCXbrrhISKkLUT++sZqjTf3zXZAIl2keGqPgorDAiE47C
X-Gm-Gg: AYBFou0IRzV5Hv1tJGS9SAPzN/IQfCmApIgeqOQv8o8LbDta4GneTvWN+tKeEZmm+so
	Fz5qiqEwL72zVcDXwHNUBS+JaNrsL6qYsYyux8VJRYi/gE9lXca975VDkw3+h++/MPpRp+6VJsA
	Kdc0Oas3zP4rjFIkhyEht4LVa2Ch5scdvqYx6VaNIK1UD1EpgsAdFhJE9GmdiyBCPdX2xUrpLwx
	dKg9ugXYetMupbL6pX7Bv1RRgm6MPhhxfqZm9/6cN7jbEwhD+smA+0ghP7Gx87LDdeJWEcsC7oR
	2NPBX0JAm2IhvqSeRjrQDnV9dz1qwYLqt93S40ktaJNxIyIjeVlYAepoyzL0fU0A6wSahAEod1O
	+vtI2oQdG6aYi+do3TjuptUhLmvqNSFLwGL1GiVWR2yC8GVH98Ug8zSavhdtnJlP19iEz4dzlyZ
	Bz2CA690IT21zbiYIjsLyYKrWdjoYtQViUsLKtWZ54UPm8QizySZzw4Q6bACaR3xbX
X-Received: by 2002:a05:6a00:3385:b0:886:c8d1:632f with SMTP id d2e1a72fcca58-897c82b072amr13779945b3a.42.1792001076265;
        Wed, 14 Oct 2026 11:04:36 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:56::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804e391dsm1439578b3a.39.2026.10.14.11.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:04:35 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:04:24 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com, 
	kernel-team@meta.com
Subject: Re: [PATCH net-next v2 0/7] ipv4,ipv6: convert the getsockopt
 switches to sockopt_t
Message-ID: <as_EIAJpsA1nWKU4@devvm7509.cco0.facebook.com>
References: <20261009-sockopt_expand_out_v2-v2-0-8ac08c469ecb@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009-sockopt_expand_out_v2-v2-0-8ac08c469ecb@debian.org>

On 10/09, Breno Leitao wrote:
> This series continues the migration to sockopt_t, as described in [1].
> do_ip_getsockopt() and do_ipv6_getsockopt() are the last two switches
> still taking a sockptr_t pair, and everything they forward to now takes
> a sockopt_t, so convert them both.
> 
> Patch 1 settles what a negative optlen means on SOL_IPV6 before the
> conversion makes it matter. do_ip_getsockopt() rejects it, but
> do_ipv6_getsockopt() never has, and the int options answer it as 4.
> Treat it as 4, as David Laight suggested, instead of failing callers
> that rely on it.
> 
> Patch 2 fixes a latent bug in sockopt_expand_out() [2] itself: it caps
> the expansion at INT_MAX, but iov_iter_revert() refuses to unroll past
> the smaller MAX_RW_COUNT.
> 
> MCAST_MSFILTER has to move before the switches above it. It is the last
> option with the quirk sockopt_expand_out() was added for [2]: optlen only
> covers the fixed part, and the real reply size comes from the gf_numsrc
> field inside it. Patches 3 and 4 convert it on both families, and store
> the reply length only after the final copy succeeds, so a copy failure
> can't report a changed optlen.
> 
> Patches 5 and 6 convert the switches themselves. Each wrapper keeps its
> __user prototype and builds the sockopt_t, so the proto layer is
> untouched. ipv6_getsockopt() cannot use sockopt_init_user(), which
> rejects a negative optlen, so patch 6 moves the clamp of patch 1 up
> there and builds the sockopt_t after it.
> 
> Patch 7 grows the selftest with an ip and an ipv6 fixture, pinning the
> returned length, errno and reply bytes.
> 
> The temporary sockptr_t-to-sockopt_t glue can go away once the higher
> level callers take sockopt_t too. For now, the series keeps the proto
> callbacks unchanged and converts only the leaf helpers.
> 
> Link: https://lore.kernel.org/all/20260401-getsockopt-v2-0-611df6771aff@debian.org/ [1]
> Link: https://lore.kernel.org/all/20260914-getsockopt_phase6-v2-0-e48befc9602e@debian.org/ [2]
> 
> To: David Ahern <dsahern@kernel.org>
> To: Ido Schimmel <idosch@nvidia.com>
> To: David S. Miller <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Simon Horman <horms@kernel.org>
> To: Alexei Starovoitov <ast@kernel.org>
> To: Daniel Borkmann <daniel@iogearbox.net>
> To: Andrii Nakryiko <andrii@kernel.org>
> To: Eduard Zingerman <eddyz87@gmail.com>
> To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> To: Martin KaFai Lau <martin.lau@linux.dev>
> To: Song Liu <song@kernel.org>
> To: Yonghong Song <yonghong.song@linux.dev>
> To: Jiri Olsa <jolsa@kernel.org>
> To: Emil Tsalapatis <emil@etsalapatis.com>
> To: Ihor Solodrai <ihor.solodrai@linux.dev>
> To: John Fastabend <john.fastabend@gmail.com>
> To: Stanislav Fomichev <sdf@fomichev.me>
> To: Shuah Khan <shuah@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: bpf@vger.kernel.org
> Cc: linux-kselftest@vger.kernel.org
> To: Stanislav Fomichev <sdf@fomichev.me>
> Cc: david.laight.linux@gmail.com
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Changes in v2:
> - Treat a negative optlen as 4 instead of rejecting it with
>   -EINVAL as v1 did, per David Laight and Stanislav Fomichev. 
> - Fix sashiko findings
> - Link to v1: https://patch.msgid.link/20260925-sockopt_expand_out_v2-v1-0-c3ef2e3bb5c0@debian.org

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
