Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795641314;
	b=W5YGuMEfm4VNAc2vzPKIbVPbmgRtZ6cMhdEf0W7u81HwjzWxogw4rItpCfQ9w1xKH676
	 dExc4wPpDcii9zXjtPaOMfwiWdWycWTxhlY3ddBRXO6ekl7u0oA8bm9Zo4A3HxIjbGkyQ
	 pw/pgFGb13oZ1RK7qacYJtZxYTZY4nalWCgg0m+s/x+g+z883pU28lHFXd4Kxyk1Tpgmx
	 LfNQ+6NZZN0ZzWMjx+0D31vbVfgeXUnjK7y6yM6QRKB5Me/8UtBmTukry/jBJEdQHHIHe
	 7EOENhUh4YHGVPMRtf+RY+emtl5TdAoQ0Ir0p5G769ydPV6c9FOLmunmQUZt6zNSq3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
	b=Mkt9Rzk6bXV0s5K7xiYmZgynMM/wlugYpg3iFf9Hm3wWbkbpPGg+3LJRYqABmsHtgdo8
	 2GpUiZ+WbO5btUH4QHaopEyZHEDrdojkA4UQnvgMLyNJEmrBqK1eTC+u5FIVYGQtGxYW8
	 zUMnzQ7qJ9y8Srr0iQXlC8jCoEq3wA2YArx+tpKx02hsN3gq/VG0c28LnBKb2gt3RLnUP
	 1oDXHafqg+lO+TfIYaLhEwARTEJHYCB0+W8kCDdxb+HsN4GFBAvF2w8T8nDvrn/Gz87tu
	 K9AaVRh4NGbYMn0GNH11GS9MBKAdGn7wu6eV7F9CCezKZSRID/PH+7bzzqq6o3/layg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ZFZGa1Mu;
	arc=fail smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B814606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 21:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B814606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ZFZGa1Mu
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4d26094beso56275627b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 13:15:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795641313; cv=none;
        d=google.com; s=arc-20260327;
        b=E2DzBxPHk6TRmKz7MoSivc/fJnlnvktesFXkHjC4KCb2kGq2FxK4KN6YVj2fMz5KmG
         ZCZaYmlGsH+6yPgSxEv4b7tqGLSMLyA39Jfpj7Gjj0OhjmV9aWwLo5Jk1i6IiNbWEQDd
         gMv53sTSXH4fFiuhqE608JIyfT23IkSFaVqdPr2cyxM8rDw3c4u0vu6wWtnqdCoZmdPy
         oULNoZ7Z61Uo8K8eZi/tcCYfdGtd04SsTLXkT1o4VMQTaYl0hPI5wtjdWdaKlIRNSjzC
         +e8nUuNqQH+WfMM+OvsS8vYXVFU7a30wQCKZpYaTu7c1C9m5NxeaD0va35tipq7l2Olp
         SoDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
        fh=8M8THUTfWVgQ4ylvbsi8ziAPFuBEk7lfxJaBbtY3CyM=;
        b=YgeK8nX4vxM/8KdBcKLDqYs97OGJMtWRgZhMfbpzQqk4v3eKRlfCVHzA/HdDrIIOoZ
         Rg8aZpC2oS/QgQ7+NjzvOIAvWi/r6G+/tu8YMlcXp0xVFbKarfvImODCNrkdleyjuaxD
         sdxwqus6jQ6qMrtavJLdlLvRrv3r3KVlreEX4epylIMNbxm+BrNWy8Cs0bWQeRZ1DU3B
         fWAZLm6Jb4qtlDCsX0JvB2H6yBPqQWstJEAGRYfWs9YNI9eo61t/rAir9fTaoJ3tvhJ/
         rrKA5Z/jffX1C+nMUbRxuOsLPRt6j7dDfnVKvxSu/9qlGAxuUbMFNco4QMUQozLDYheT
         RFPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795641313; x=1796246113; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
        b=ZFZGa1MuixAy7IjqsLRjY3SC2wAYhkVYCbqN/PVHdn1TM6cmbtD2eRYhqN8A+siVVP
         btUqX/zenGSbVIfr02R/5p+0+h+5DzzOrdwaY/Gelrhz4Vx6jIZfKk57P1PkCT49sU8x
         b3NiMSXkhqHdA0ObMv+/ZNPMqaIR3PVmzpf6/hwl9/dvbvOCH1caXW56EXHVRxrh44Y2
         9LjVNlPYZwwZt6QTPK7OElvfcE09PMvp/BsN5xFr5rpQ3/ySs+4K73CK0Fb0PikHcIG0
         LovIokxWXQN7mPthNCukcvqbGvJBoG4gjzp2fUpJCzr1kcepNE3+QV6ajRdTd+P3DNMP
         h9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641313; x=1796246113;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
        b=wLv2jXkDGb8n4Xvm/ppVaClgeehgtpBImOs8gZgLCH5Q/5IPMPnNyop6qUgGgDVKAt
         8Jf6Mcz2S+J5Mstm7x71TC+/ZcAnOInmbFjHXG5WZ0g/LpSfOJG2L4mNfiDflaSb3+et
         qVE2wt2GyHNA+RVxyop6p+T+scxQ3Of2j6BIqqXmSafHT76Tmy/dTkSNxrhduQuCxB51
         CidjmaW6iOZi1DjTdHU0IyDd+gOwLVS6Xu54NjvwBYYLLguiVE5Y/xyTRWTJ1YMGha6P
         8PagJT5pPOngOo0UaZ/hCa5JvScJVE03knl0FKhIcVx+OhIcOIX8TFBdA6bKXxkdgXQT
         Y0JA==
X-Forwarded-Encrypted: i=1; AL+hErGBqRrHBxpRcVNmFD03i2DUw4ND5QdixRZMWBDKifRMO1zSstgXDEmoFydHjLSVjMmG+FFKvHN4+EoGcPswP1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jrEWhdjDelUViUMmE+300nbqP5kBNNKYt7WyWfnxQoX4ZO1Vi
	6WfU6cRSBy8SqIQGkovZak2KR/DDpKRd4wvXZ6a9xnP5sK1/VaiG/iagQuAk71lrp9YVPsB/bgi
	Ig6Q53wly4tDjBMtScbxgzz3kqxUBwqqNPr/1q6SOMg==
X-Gm-Gg: AZFdTZcFeguekjN29UaJwRIKEGL4tVaUYetiXz5ABtchQbBvubXLSR6xiJfpu1NSvVD
	avP0pHwgv5bur2IvS4XAyIpo1TIDZSJJemFZiQELLSIcWAcx42oSvr/v0sWfmnGH8FEVvAWsQq9
	VNX2AJgycFX2BhpeklxSQBKY05e91CYeAMzHu5CCUuTcNTBnP3KDxZ/Ncuvxq33bJmUasFcyVHG
	6gXGy3u63lnHVs6QIUnuyX173Cr+1uG+l+jxyzRKs4qRO3T+1j7nuzisdabCwwmtA7yhEM5wciC
	Gx3Cu/MgIbDEyFjt2pGbnnyWi/OmBK+87KSKDDkO3nVKsn/dCMJHEaCA/7bKsfHLB7oPf44Fhq6
	NNt3nwEEplcrQJpDtu2CfIvNZ8iZQz+maM7ejtzBvQbz3w8om6RWgUi+8yO+ZuHY3TF4/
X-Received: by 2002:a05:690c:4d41:b0:8b3:527b:d18f with SMTP id
 00721157ae682-8b520456090mr78329377b3.11.1795641313439; Wed, 25 Nov 2026
 13:15:13 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-tcp-l3mdev-exempt-ports-v1-1-ccc2a3a6cd09@nexthop.ai> <179556272605.3135.9300919500524716345@kernel.org>
In-Reply-To: <179556272605.3135.9300919500524716345@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Wed, 25 Nov 2026 14:15:02 -0700
X-Gm-Features: Aa3M54pDddf1z2GThzIkP6Ya0YrZfZnwcPcCDFy0GPN_7KFQAEfTKsiiMCChi8o
Message-ID: <CAAv61uTjxQD6WUU-ZH1YG6Q_rOzPD5MKtAJvRQnmpm-nqFAs1g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] tcp: add net.ipv4.tcp_l3mdev_exempt_ports sysctl
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review. v2 addresses these as follows.

> [Medium] fix the lookup instead of adding a sysctl

I kept the sysctl. With both listeners present, today's result is
stable but depends on creation order and address family. Making the
VRF-bound listener always win would change that for every
tcp_l3mdev_accept user and may break some existing clients,
so v2 keeps the default and makes the new behavior user configurable
per port.

That said, I can change the default lookup instead if maintainers prefer that.

The per-port scope is intended: on a listed port, a VRF with no
listener of its own refuses the connection instead of falling back to
the unbound listener.

The sk_incoming_cpu tie does not apply to listed ports: the unbound
socket returns -1 before any score is added.

> [Medium] the docs say more than the code does

Fixed. The docs now say that only listener lookup changes, and that
established lookup and bind() conflict checks still follow
tcp_l3mdev_accept.

> [Low] a listener bound to the receiving device also matches

Fixed in the docs.

> [Low] CONFIG_NET_L3_MASTER_DEV

Fixed. The sysctl, field and bitmap now exist only with
CONFIG_NET_L3_MASTER_DEV, next to tcp_l3mdev_accept.

> [Low] net_cachelines documentation

Fixed.

> [Low] bitmap updates are not atomic

This is the same handler and behavior as ip_local_reserved_ports, and
it only matters for a single write longer than a page. I left it as
is.
