Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747010;
	b=qweUyN9PvMBShVyB0NmeYeYt7EcIlL9ifFYkuBp0gOYUTKWAs1Nl7ccLDEYkA/pJup2O
	 IlBMeb05AYKlSWhBwIviA5lpGcCsA2V3q2kohBelUkC1sG6VfcM+Dg1kYXO3Fz5qbX2iN
	 GVmMgSCQuZJGk9NLpI9Ad7dnyIs7DOBBvfTiNw6/S4cQ8+WIhuTsSx5DFyoQbgKmoX6sx
	 lrQlotb0t829kRGDOgxqjRqsoPHaFbtKNv88RlkTyO+fGU9I+E3AZeccEfKUxnvTzwJ/I
	 sK0lFMzVmTWoVB6z+ywJG492CfpMKu4WeTGSuM28y6oU+yeRHDF0E5w3D42D+c17A1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Bc3q5OMwODprZ3tRrHE2dAObJscCTN7oqVxqSs9CQE0=;
	b=KH2pqWAjHQsGrYoVBOAxXK9MhYvPg36YxswtpRH7i/q8F1JW47QfQCDMbUGxH2Ev0E++
	 Oy56T/Dop4cf59gnuvAnmYWTlzB2A7xxhuRB1/boRpLZNj52DtetJ7YBEWPTRbr6qtzyn
	 hEKkprNd9Si0gThpCrZ3RDnktowzq0jri+3x+mSC42JiDBZYWwvMZCvQYzLOv+tEPqKXb
	 n+mgbD2rTErIEDlLb4oA2jcwJYiwPyuwejxs1h0BS0e1BbaAU5gyWh2nw13lxSNuhJfSo
	 7YptrIbJiEILMR5lcyX/ii5z7mnxRUkPR0V4IProu+fwoWE0Ch/D5QvZuVIfRrjldHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kpwSVOrl;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2193A606A32D
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 23:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2193A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kpwSVOrl
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e831e86ebfso467485ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 15:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793747008; x=1794351808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bc3q5OMwODprZ3tRrHE2dAObJscCTN7oqVxqSs9CQE0=;
        b=kpwSVOrlE5nr+/Gbvw2ZwoGd5KDAngbKsPFGSFjG5uZDqDrVI+gLbg5Ff495N25ok1
         /MWhAAh4jBKMFUNyKUGu2YzW9+2b0TL8VX03ypiXw4ssVIJKJ8NdQIdG9nN2L86viunP
         0GQeIke56pCMcajWzsKXoEzb3qyZLHuNRs26ySYLuk5afWNHqc2hxHe5Kj87hslle2R9
         0HqfFeDQeQaCcAimFol3FR5VaxoRVhOlwEu6ZJ0LDsrXDvONJ+G5lXTb5IuudPJXXsHu
         iX2D7vhnsn0beYOgAG84IpsrPPkPEpqzt74z1aG7nR8CPk+sBemoQJWqRSQwhJAJ/2x4
         soxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747008; x=1794351808;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bc3q5OMwODprZ3tRrHE2dAObJscCTN7oqVxqSs9CQE0=;
        b=BpPfbc3G5p9x7GqQTVWDzVXIbzoxwy3x0UmtsGUgkBGLIffIa8StWdmLef+mCG+ALu
         fjkGMde5HNTCQYjM6JU5SBuU92r6/FK238RHzOztfItgwBBTknaSMYLiJAUm0/yjjiPL
         QGOKIICJqjrXgJmIhLcIaD9ZVLstWB3MsJjsJwjCGeV42QII7WGdiANpXujdZd9IzDDk
         n7xb+wNwCbv0lrWZjrSyNUImHybDeb0TUM5BRaKnrsuzFV4N48TyJhVslo/E3lWCcHmb
         iofXrkVxLg15e14DrmLyPeNpiLWCriXRnJHecuchyVuG8YQe1kLRyq0VRF2l4GOOPE/a
         KRwA==
X-Forwarded-Encrypted: i=1; AKwUvBzA9THQOlhDmd29L2E1h7CKHmF8NVDV5oVBJ0VBzjnFekzCNfdJiLt9YMUBaugkziycmHRvnD4eL87/kwk8r9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rLwNUmfUznCQAVJ5k+l6ddmR6uxxHWZ8EUhNCrsB+b30AfaVI
	DsU1BPUJfA06i+5Ae5NfEUxUsWuYbrx1XgwustDcdBRP1R3SRkV9OHg5Ng0JiOYWzI0=
X-Gm-Gg: AYBFou1w1pjShhExpS46T3/N2UBUnUVgBpGz2ynMby2Sqvl/P7RKD6ySjmEsl2TDT7o
	kSlw6/aP/3a1pFI1/z0GxTVin4STItqAPYc9ut9iQnvhXsASlL1ujjqAZRA4G1fxaq8MsPVCFJU
	q40BmMLtP2bRyVbSs0xq7ILR/9Ob5YTgWKgfbc8jj91zMQpgNgY2dBW5VAQmkluPWunCebcQI7N
	5Frl5vcI18B58Yzua/C1z6vf5E85F5/+IgrEfQF4g3C53FUpccqHJjNGXYn2v8eKHUMPib2lEk2
	gCpagMOw3R+bMIO/Dm6Yz/UmlPlFydUa58XGvFReL3JQFNL+w3heSWOTHVkISZ9U3flUSYn+hSn
	A0c78oEgJz4Vwc7mUaEyhd+HxsQL2953EAwW/JoIe5rsDSoDaKUzUGgtgBcbVIWE69U3KspEfxR
	lO55vPwkcXGsR/zUzm64ghd8LQyVcXWX8aUn8PSuo1uE0LDaTUIBqtzo7T4Di+qTIZyFHyk55yp
	IFd0a9NAHMrNGwI0GlUkjFuVAGuvpMJ7S/eE/VyqthXEoJFnDvfU7sxOpyBYLqmefmmsVsqi87s
	tBpd6Cuvzw9iex4cSLrAf/EbJXY18/+r1iTwNO9TAg==
X-Received: by 2002:a17:903:1cc:b0:2e5:6158:b9c1 with SMTP id d9443c01a7336-2eb364e0730mr142081315ad.47.1793747008425;
        Tue, 03 Nov 2026 15:03:28 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:74::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091207dbsm301785ad.49.2026.11.03.15.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:03:26 -0800 (PST)
Date: Tue, 3 Nov 2026 15:03:25 -0800
From: Joe Damato <joe@dama.to>
To: Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com,
	kernel-team@meta.com
Subject: Re: [PATCH net-next v4 4/7] ipv4: igmp: convert ip_mc_gsfget() to
 sockopt_t
Message-ID: <aupoPbQlx899hNir@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Breno Leitao <leitao@debian.org>, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com,
	kernel-team@meta.com
References: <20261103-sockopt_expand_out_v2-v4-0-2d36da923578@debian.org>
 <20261103-sockopt_expand_out_v2-v4-4-2d36da923578@debian.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-4-2d36da923578@debian.org>

On Tue, Nov 03, 2026 at 03:01:03AM -0800, Breno Leitao wrote:
> MCAST_MSFILTER reads its reply through ip_mc_gsfget(), reached from
> do_ip_getsockopt() and from nowhere else. Convert it the same way as
> the ipv6 side, and build the sockopt_t at the call site for as long as
> the caller still carries a sockptr_t pair.
> 
> optlen here only has to cover the fixed part, and the real reply size
> comes from the gf_numsrc field inside it. This is nasty, but userspace
> relies on it, so sockopt_expand_out() preserves the same mechanism: it
> grows optval only for a user address, and only far enough for the
> sources the socket has.
> 
> ip_mc_gsfget() writes the source list, and its two callers write the
> fixed part afterwards, at the head of optval. iter_out only moves
> forward, so the callee advances over the fixed part rather than
> addressing each source by offset.
> 
> The callers then rewind. The reply length they already compute is
> exactly what the callee consumed, ss_offset plus the sources it wrote,
> so both land back where they used to write: offset 0 for the native
> reply, gf_fmode for the compat one. The bytes are the same.
> 
> ip_get_mcast_msfilter() and compat_ip_get_mcast_msfilter() only store
> *optlen after their own copy succeeds, so a copy failure can't report
> a changed length: -EINVAL, -EADDRNOTAVAIL and -EFAULT all leave the
> caller's optlen word unchanged.
> 
> The old code stored *optlen before writing the fixed part, so an
> unwritable optlen word stopped the fixed part from being written. Now
> the fixed part is written first.
> 
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  include/linux/igmp.h   |  2 +-
>  net/ipv4/igmp.c        | 20 +++++++++++++-----
>  net/ipv4/ip_sockglue.c | 57 +++++++++++++++++++++++++++++++-------------------
>  3 files changed, 52 insertions(+), 27 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
