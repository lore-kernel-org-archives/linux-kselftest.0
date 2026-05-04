Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4E83DDDD6
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906455; cv=none; b=IH6xgfGtb+i/xnVWCUftSJTI+IxusvYfF4CkUqaGLf2kSj2Rj0mNJ8gBkCClS1bPpQdgn/NN6MPwSecZPanyJkUcgLS/pAJeCicZA8RoVSQnth4sj3hIs9tA12wFwjZzYv3FZxNHpVkLLY+VjEkl3yMvPxAJ5FWKzH5D3kXM21w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906455; c=relaxed/simple;
	bh=6wZYZofD5XBH7p3dPRhe98oA4McZcgeESmYvHekXAmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jn+PbWqwOuoSPRG3BHEi+osWydRvHCaRQ2RE1aIo8LLmcEzMYl+WIJimKaZn4P0YSML8B8RUohwnWDlo04zWn+gLIzc5bvuC7HKvv4KaoA+1tZqX6clkv3Au3lSuGuV57MTCo5z4f9vXsYXIGrSeSuO7c6Pn1TYnWMDSAZRopXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=So+A9Jim; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="So+A9Jim"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2b9705613ddso24431725ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777906452; x=1778511252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OsUMHAzB3E1Lhy1w/m7z6HnCWQkTFKvmq9eCCZpqQi4=;
        b=So+A9JimTyzK40ologFi+5r1sfoeVEZMeK7snc8OfqEbzevesSh/dpqZj1hZaN15ta
         es60B5nqf1WB/589/jh/2XM/31iB2JpY1/JicywP+Aaa/yw96srFpQGlPY4ZdLWlZvuR
         vE5VHFl6yrCxUV9slFebKlMrDcw+lc+S8zTBUUn52EXDpyXO7t5ycGY8+2Keloxm+LDB
         zVvKgwwDrEAG7ia+6Fuuv1HVJf0DVCRTF5P4l91vpbTfxr2lPDQzUiD4PwLyV30OHKjp
         U1HU1wBDGf0zozUovcQ/P5HJMeuF32OSuG4ZfwZ2hBl3M+7Qv36SSdIWgBh51QuCL9e5
         0vCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906452; x=1778511252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsUMHAzB3E1Lhy1w/m7z6HnCWQkTFKvmq9eCCZpqQi4=;
        b=QYRj+gkxiJmQAEwNNYSUEK5skf9H9bR4BD/dhlQxnYR9JNzwwmxtHh09XHvMZmwyKo
         w8s75h7h48G4bhCPrYYxQfE8GJNycWrDg0nH64ufhVRBm4MWmdjT23MeY3G1LuXANrvm
         Or4z1ei26ZqCUz2MCxWBfVvq58zjB4tUGbshVp55rHJMJw2lfziQ+qQ3TztEzjmSIZ6p
         sPky1ez6ik/b0FmaUIhSEMYyXh+7e3hEFBFmVU4eg+aj8IT2YY1E2FeNVlWXNlLA4tr0
         Dz0hc8Bf5sHDh0j/knPtf4XM3aYMTh2c6DSxAct+rM+N7ojD4R52I++4WhvGMlJMJ+SG
         H70w==
X-Forwarded-Encrypted: i=1; AFNElJ/Dw05frae//UPC2J85WXk0t18Wd58049iHDVJwXpCuUsp+TsRGrldYyNgKH9ZmgbJzycn/42N001c9jdurJVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rU+Aflj+yI0rN8mZWwnRO8hDBLz6dHYO9UbS195BUdFU2d5+
	LmO5Z5p6/tPlWTVOaJwvXNKSH+ACNVUYWTCXozbApCD2DtECRBbYr7Vc
X-Gm-Gg: AeBDieuHc70z4gTQsiqIyFWPaD7BULWyaaigseedWcfncB2Qu2Ci4/rjce5mznVJYjy
	/OBRQPU1sYd5+j3k0ty65nCJy0xbypEwuOdMDGMBxG43P5y9L0apG9thsgXaV95ecBLOxcSU5tp
	49MmXc/rS0IW1BEWcrCoQuFSKjmh2LnWAMsem8NiM0pjosGjpmjf8QqjuMQYby7cthcGpFN2DoM
	s7+w5prjH6JaWqzaOX0speHbPltYI8/0F/gu+4cYwJmErD+a7g6Hgf0T9teUYFvKZWlJOQHpPr6
	7RMEEc6+aPhXE+RztyHvm/ihvRjIPfUMVjXc/pEq1Vn9yskz+RZwptI6cTmRSj4mWZZ1jl6wQU6
	+IRqzOkHfxAgstvFIcS7M5/LpQZcLCyZnucko1DLnlNqy5UCkelquLfOA97TBaGh1FVFkIiY4G8
	b7CXVUsnXBDFWJuv6/jV7/BqelzUw=
X-Received: by 2002:a17:903:4b4b:b0:2b7:88d8:efde with SMTP id d9443c01a7336-2b9f256dcf1mr95395225ad.7.1777906452391;
        Mon, 04 May 2026 07:54:12 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:73::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae4a127sm142842165ad.67.2026.05.04.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:54:11 -0700 (PDT)
Date: Mon, 4 May 2026 07:54:11 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH net-next 1/3] netlink: convert to getsockopt_iter
Message-ID: <afizBv-egs3PPbTE@devvm7509.cco0.facebook.com>
References: <20260501-getsock_one-v1-0-810ce23ea70e@debian.org>
 <20260501-getsock_one-v1-1-810ce23ea70e@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-getsock_one-v1-1-810ce23ea70e@debian.org>

On 05/01, Breno Leitao wrote:
> Convert AF_NETLINK's getsockopt implementation to use the new
> getsockopt_iter callback with sockopt_t.
> 
> Key changes:
> - Replace (char __user *optval, int __user *optlen) with sockopt_t *opt
> - Use opt->optlen for buffer length (input) and returned size (output)
> - Use copy_to_iter() instead of put_user()/copy_to_user()
> - For NETLINK_LIST_MEMBERSHIPS: walk the groups bitmap and emit each
>   u32 sequentially via copy_to_iter(), then set opt->optlen to the
>   total size required (ALIGN(BITS_TO_BYTES(ngroups), sizeof(u32))).
>   The wrapper writes opt->optlen back to userspace even on partial
>   failure, preserving the existing API that lets userspace discover
>   the needed allocation size.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
