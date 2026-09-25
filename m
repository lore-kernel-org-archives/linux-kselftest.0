Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889B7367B87
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 19:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362949; cv=none; b=D/tpMpGxVKUn/wg1J5qQM33OMw0TpmZ2/Cf1cH4CMj0tRNDylsAKbDTcn6Ac585w2w98XfYZtvgVffq/sLg9CxHEFbLbDvHEXA8NbqqrVemLDB1hkY92CSMBE+qCXh/z622nUe4yt+2a6KzXnbvgiSigv7QV6RYvJrKEbFchZAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362949; c=relaxed/simple;
	bh=miYvRcEGFmsRj3R3StAtd5ze/ExutceELLrIDIigKYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppXtjEaKcp5YqPSzT6HDstP990218bnvnzmj/9nEECb4XVV/nF05NiBiiGVHizIrrrTX++59oT+/xWViSJ5UHJWBr+4GPVxQHmKccBCJgw6MbtvFlvIeJd5cqAkw18qQUOOGMnoqtT0A+0YvWdLwrC1eO9agxrcgasiav3ub5Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4Z0c5iH; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4Z0c5iH"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso747605a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 12:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790362948; x=1790967748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZbHzbG6KX4HjmnobdQp+43LfGiR+GIwDBr6SWkkO9VU=;
        b=N4Z0c5iHeZIAOdlqnWJXQD9W9KmfOn82z65vrzTrFjRMYKFNe2K+RB7I1B2bRudVim
         8J6V49/+ciBaFeJIQUBEP34DY8m7hTw/2tGjHH69ZtZB5CVEcBRh316lyqs4BCOv1u/7
         QP0qFDo/+Vlz1nJQe5NrIrOMKMCZL4SWCXcSR3tbvbo8H21RD7A0X5TPUVm+VvIOe31w
         emjqMwaRZFugSNIPyez1xgN3otfi9u7ZvdnOQ31Wl3gS0wPKtWFBzmJg3jIy+javRALB
         wj6STZ0SJTZa3Pjpgcj40D7W0/NrWe5mrr4Yq3erZtERx8Z6oGVFIUy+cVwtM6dnyc9c
         36Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790362948; x=1790967748;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZbHzbG6KX4HjmnobdQp+43LfGiR+GIwDBr6SWkkO9VU=;
        b=lUKU/Zb3w155WQ2DjdI1O1iZlF11kjT2Kz+pnD0vfBwc5f+ifQywVRCdALJogf5Vd5
         IB3vHqVtAJ/khnFXmecwfvyasln8SRAiYKtW0h/sFBvS8LDG9Lq/lDKgiuO+PfB93vl7
         SFDoYGZKn5vOwUtXEet47UHiiPFUwZxI9X9OFrtqLEv1JQQ8FlGgULxdB+4g9VAe2dA0
         oZIshDEKLR0towdqlnzinVhREJdG7rLWis8lOZWGjy/qGNSYNh1yEG6IuJQPInHT5Gkm
         avLYvdGgmPsDRv97HKdVS6okrdioIC6c3F26BWCavymRTkLLeOwJi88PeCBBLBYTP4Ox
         +YMw==
X-Forwarded-Encrypted: i=1; AKwUvBxqdzu7JGY3PuXdOAHZAswzBqoa0HCYxhqeE59Dp4XUG4I0ogmlY1WMj2TcSCeE9Xj2DQRiNiIdcjwxX0uNjmw=@vger.kernel.org
X-Gm-Message-State: AFuF++nxeubgJIY3lek/YfLxNYDch71ML149Xiwi4Hhos63YgaqY9dcz
	wdUW8d7Ig362tAbV1ZtuSv4GPfrPXTWJ8UOuOA5iEdJz0ZpE4h8LFg0U
X-Gm-Gg: AYBFou1qgQt+ha9PxfW0DIkYO1Xv/jLW5EntrDgP9q7B2kq5jTrd9ks4Jek7D+K4avz
	Ptp15w4lon8KH7l6jgoWJmeKSO1ZvhxBR2/COdaM5aL2/NiSlh8Nd6n6frfmgOGx9KyhP19CM0r
	K9mpbsU7HAAcrKoEiWe+ar98ys5VV463WoWqTM+/pLp5gqZUbFd8ESWpQmWo2bOcOeM/1EU5wCb
	XrefKZr+g1ctR0EOjrBVtZ7ho5KtDoMHB9t163XKkoo8N4prIMHeBsAImCBaTdNja2vbfpwvtKU
	oUaRZ5ydU8vv0g83z8pKof6bJVFErTTbDgXQPiaOCFsSOE44uaVmuu6zzTChiHyzlidA7vgKkPL
	HJXYLeMx8g6BPNuzhhwcMoHc+d0Gvn+d+4LcsZalw4XCuLc4pSxVs/2W7YJt7/zOF8ED3oHnZpB
	xnPKzNN1MbRcffVHqiAQqJgOeWt+ywQ2T9N6ymwoFrop5kiU/7K+JDM8CJz/c84oM4
X-Received: by 2002:a17:90b:1dcd:b0:39e:d36c:ee54 with SMTP id 98e67ed59e1d1-3a0bb55308cmr2493435a91.5.1790362947509;
        Fri, 25 Sep 2026 12:02:27 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm12331068a91.12.2026.09.25.12.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:02:26 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:02:22 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	david.laight.linux@gmail.com, kernel-team@meta.com
Subject: Re: [PATCH net-next 1/6] ipv6: reject a negative optlen in
 do_ipv6_getsockopt()
Message-ID: <arbE6i8JZrOs-DO9@devvm7509.cco0.facebook.com>
References: <20260925-sockopt_expand_out_v2-v1-0-c3ef2e3bb5c0@debian.org>
 <20260925-sockopt_expand_out_v2-v1-1-c3ef2e3bb5c0@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925-sockopt_expand_out_v2-v1-1-c3ef2e3bb5c0@debian.org>

On 09/25, Breno Leitao wrote:
> IPv4's do_ip_getsockopt() rejects a negative optlen right after reading
> it. do_ipv6_getsockopt() never has, and nothing downstream treats it as
> an error either: len is an int, but every consumer compares it unsigned,
> so -1 behaves as a huge value and each site clamps to its own reply
> size.
> 
> 	len = min_t(unsigned int, sizeof(int), len);
> 
> So getsockopt(fd, SOL_IPV6, IPV6_TCLASS, buf, &len) with len set to -1
> answers 4 bytes and reports 4, rather than failing.
> 
> This is a bug ready to bite us in the near future, let's get this fixed.
> 
> I've found this because testing the rest of the patch was returning
> inconsistency when optlen = -1.

If I can do getsockopt with len=-1 today and get 4 bytes back, isn't
that a uapi and we are gonna break someone?
