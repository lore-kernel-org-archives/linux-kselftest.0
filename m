Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CB43DF01B
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906637; cv=none; b=fqcPsJeN8ZyzyPu6Y/7f7yp46mQop3Df4JabV54/wdADLLiXXCzFY3R3RWt+NMG7opiVfjlN9Sabp1Gkq5uNmIgNjb4hSnpjU4H9xJHKmI3WlAF8Iul13GKJJtHuG7yjqHYrs6OXdNI+OMcewoU7YYx1f+pRx+wzKUTb9uVAZgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906637; c=relaxed/simple;
	bh=P5AYiYaexfBJ/K3fA1q4qvJtcqVqhbY/zXL2LN0DYa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3RIiR4NAK6/pFKukswRVFYpWW4qZpKpkqmmL0e4fuGab+SufXT5jKhcTxCJ5w82kxMrq9PbwSenB2z2WoazZnlejXfSKi+4c4xCucg4vGwd1DwLjVIobEGK3XT7Y7w0M69hLbDTiAWVHt+W35yIrjoxb8Jjbw/6pQcBZrUFLWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p019Oz2N; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p019Oz2N"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-837b39eb078so679383b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 07:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777906635; x=1778511435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zh0KAxFwMLTC3nMk85f7Nx2m9dqehymzX+YJyU/vwmc=;
        b=p019Oz2NBulotq4MIwmCpXzzkkVVu4GlXxiNtEqqBBYSVyt4mpaHOy8OXvZwICcpoo
         l0NmA9V93kSJ4Dc8aHE/X5B94LTvy1liXHZIM/YQ07oQtZ1yHhfFm0GH2poIhk/AX9TL
         7qptPDVMu2fXehJBEJYKQZj5c/cp9knhj5SwxWi8CArCWzdLOvaQTlOQmVeFecte+YT4
         nxhHtWJ4MUsxMZqymQ4F6RyJsvPf5BTQJciJfDfTxeG96CK602NdDqSXmR3nPDzaw80a
         umDIwoeY+q+Bj+MK1kEg+j3fBGlkgprYtT609vYYB70d5kgHiFi8K3IGfGFpPXzllX19
         T6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906635; x=1778511435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zh0KAxFwMLTC3nMk85f7Nx2m9dqehymzX+YJyU/vwmc=;
        b=KiPSEsiyOMcjFMhSAtMratFFuNFaROt1HtrsL6PAtd/tIcgxn96hTRwJQ6jkGVdLPg
         8oNfql7gCGF2UFMyBO8KU/6PF+dyOEa8Fq+WtzEElX9NcgVPy0N2U7AdArYqD7s/FzWE
         HL3rSYK27KBFVvCPljXWLNHdzW68QTIQpgx2B7OKBgnIgFUKYeeXD5Rh5yN3hSGurYKu
         gHrycbD8nEEx6tOmd7059WZi5KU5skGd9RzzskSTpkaQIa2DRM9rRkuQuAk9PypgyzB1
         ZTnWD5/3gjTFn06tquX6gfM29Lub606X4U7IhORZO8H0SS9+MeBiwlqMyGD/bhPK81hl
         akSw==
X-Forwarded-Encrypted: i=1; AFNElJ8GJNk00kWnqiSkXHCmvQe58KIIc+so0YuJQUejQTFqsRw7BVKp44Aht5eQmaPUkC6JCdEsj7h+KtY42CryqPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWABK2w7VHOZ6N77vJF4loAaren7Pc/d13mofTa0VAyVdB4LBb
	/xiO3gwGUCHAPiVJYTqfUUdUbLRp+itzuZAD//ACd5JHqKGrNm0DLlPJ
X-Gm-Gg: AeBDievzixusbbrxavJJjYNdpH6R+OrQSMSIT++xqcg/AR8eF2sdvU64qqIuXtkoTyP
	fi+wjylE00T1J8jNgIIT4GJiha3KmFz2Rpj0U5c3WsZjTkhOUh2/SjiMdBCdR7Wl5zrr4xqUuom
	n1WM2+CKxEhy09yHQqTP3+ZAsF4lOTpdo6Z90qoLehOg1A9M0I/mqkyLA6feX9vpwZCv/EH4fDq
	IU2+nPhkIaTZkoWOi06raQhsS0DT7ZEmNQdmgw3e5m7mYo8d4rzII2oBNryyjtZyVoXAS22/xHF
	H+9kZnbeY/6ED8DUS7PZeoOQGlndQOTeqIa/THvfbM/vx49+z5ywa+BP6TaGTDAulsCpqKoiODK
	7z5b21prrGwquYOx2DBRwTOppAOPPEEm7b3j9aucNOWZai80aNrhtB7JczdH7hBv/JpUeZ0vY++
	av+QdBfh6O+IsoqP9m/sac/vkX0U0=
X-Received: by 2002:a05:6a00:a1f:b0:821:7d7e:41cd with SMTP id d2e1a72fcca58-8352d012d24mr9616412b3a.10.1777906635168;
        Mon, 04 May 2026 07:57:15 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:49::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-837aa3e4f30sm3467508b3a.1.2026.05.04.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:57:14 -0700 (PDT)
Date: Mon, 4 May 2026 07:57:14 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH net-next 3/3] net: selftests: add getsockopt_iter
 regression tests
Message-ID: <afizImGChdnDsj9S@devvm7509.cco0.facebook.com>
References: <20260501-getsock_one-v1-0-810ce23ea70e@debian.org>
 <20260501-getsock_one-v1-3-810ce23ea70e@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-getsock_one-v1-3-810ce23ea70e@debian.org>

On 05/01, Breno Leitao wrote:
> Add a single kselftest covering the proto_ops getsockopt_iter
> conversions for AF_NETLINK and AF_VSOCK, using one fixture per protocol:
> 
> netlink:
> 
> NETLINK_PKTINFO covers the flag-style int path (exact size, oversize
> clamp, undersize -EINVAL); NETLINK_LIST_MEMBERSHIPS covers the
> size-discovery path that always reports the required buffer length back
> via optlen, even when the user buffer is too small to receive any group
> bits.
> 
> vsock:
> SO_VM_SOCKETS_BUFFER_SIZE covers the u64 path (exact size, oversize
> clamp, undersize -EINVAL).
> 
> Each fixture also exercises an unknown optname and a bogus level so
> the returned-length / errno semantics preserved by the sockopt_t
> conversion are pinned down.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

A few nits if you happen to respin (or for similar tests in the future):
- add ASSERT_EQ(optlen, xxx), won't hurt
- christmas tree (although not sure how much we care, you'll have to move
   optlen = sizeof() assignment)

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
