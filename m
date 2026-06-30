Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37FA3BBFD3
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 18:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782843667; cv=none; b=eJv2BJfC5RC/nNRoBLIbMXMdPlDfWWm7s0YwLsuU43Swc8oaQPdnv1qfyhC88C/uSMU5W3KXxE7LtyOOUuG7CW6LdGpOs6XcGol/YiM5NGLGSpe1+9ZuR1K9NthiVqM1OyKmZJ8yOontMFv3/8F7cMkYykOFm6gG9CrI6Txv+Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782843667; c=relaxed/simple;
	bh=jyjbQQuuLqwyY8KykaQ4Bai2JXxyDMIAgnVHW2Taqp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tn+iMIEFh1ALe1+h+SvK+FG+8WL3HqLVDg1AWK84+66UpJODxaBSin7HLMNo9xzV/ldWBc6AFIEF1fwYpzAyL5TUOKoLrZFQO+HB5qa4uMe8eROx13uFMWdAa3IVnsFIkvraQjoPJfGzmj98wnjIrinTKVOLkMuAwo8j80s80Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJLmBWBC; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJLmBWBC"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-37fc01881f2so3164928a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 11:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782843665; x=1783448465; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iDrH0SRjEQYISUiTw7blrmw81K2a/xcAsjrbs4oVuRY=;
        b=QJLmBWBCwt0ckIOAIqN8BBUvdSaTkjPnAkBsyMp8DYR+hkf1XqZJZ+Bl1vRGkXgx53
         0IO4TpX06ec8N4GHYrlOQN8yZjSB3ycBYVQsIrj6DAc2oHRjlQmPAq8q0ldztvaRW8gR
         8uuMlojRvceso/Wl4n9qQBQjX3tq06EXONZX8PeoUGJjsxiNvRorKwrIDZcyONT19upT
         YgUJN5Mjhw5Y8Ph9++ePnxcy2u7N+lon1uHLOnXTBG47YLh+ZEMH2XdaA8qhWOtb5c0r
         e1yMnKNs5DdFMyl+KLliQNPeJVOEvuRsg/WDVTRC2jNe2Ja2CUd2A/eRshotSH77BJVk
         rv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782843665; x=1783448465;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iDrH0SRjEQYISUiTw7blrmw81K2a/xcAsjrbs4oVuRY=;
        b=bnQkWtroyh/XI1SDvjjDXoh4U1+ahSeueMNkhN9wDhorUuf9HaZiBD+4/5lTwTxiyJ
         bwZL67P12EQ1z4LNspKGIwdpE6dGaxauyMPkyMMjUYCapXDlcmE92XKvYY9nj2uYCAzr
         3FJKtDfeZnIqc6bTFsl9xpNxJsXDMO0vjBxwsdtRVanR3Vjxc2mLsQLmDbpNOnISyKev
         v51HIdP9iPQX/p8BsMx4wvBfEtXICDs4jAwIsxDwMz0ZBSwnnfyY5g6hUdboBCrKN2Ts
         oqJgj4A63++A/nf76XfnaTmtjs7T6tLcMNolInU6Ktu+QZtVZPVE+QNJWkoBAhgApQoJ
         epeg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5+jsk7MkIneaSvA7R1vhnCzbkkrJt7KiZFLx2y8BkkfPVEtPGAYMftccClMlw7wEbwLlJB12cfIvxJzkHgRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmYuzRrHmxqTOJiVkNguCQx+zS3g8JJRbYgIKsk/IIjerEJZ1O
	P1LaH8kXqfw6pzarSNjBL5gNjhtE4OuY/Am6g8NvGFJdpr1XPsVgnVv4
X-Gm-Gg: AfdE7clXA44PvDDigzUqdV1MNl1Rqm0kMtD3NEZ2ts23E7ofJQFZSeokYVAku1mxFTq
	4jKvKJeUldP14SyzDEmIlKsmD1UuIBAjHCEbXCF/A30PpoXK0fy5dWGqanSlV8yqL8Y+MrBG213
	8e/PFJgAUjh5XnOxxZUmV8qMwo3uxJwnCuFrQpV9p7TMZW05f9fYe56aLZrTggZD+n8ic8Mfni5
	kyKYIHShVqgmKgyuSHLcF/lZ0RfA0309gFgPiqpUqKouOCONmvqU5jbmqKeD/XmycllFgBA+OoK
	RaihVOkdOkTmrVS5KauKp9gCwKJ2H/U+AMXssk84919/gNvg49Hsz56vkfR+fByDOpy79SZ5ZXK
	DBRrDYqdT943qVpNcbNU1rFIWbI3gr5ot1syMH4wk8lF4y1pDoMZuWAQ3w9XJzfEXwXphvJAmaL
	mSMCeo3lz55DjCkW+t
X-Received: by 2002:a17:903:15cf:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2ca2d56494cmr38378155ad.15.1782843665333;
        Tue, 30 Jun 2026 11:21:05 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:70::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382bba19sm19483585ad.70.2026.06.30.11.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 11:21:04 -0700 (PDT)
Date: Tue, 30 Jun 2026 11:19:57 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net-next v2 1/4] net: add sockopt_init_user() for
 getsockopt conversion
Message-ID: <akQIw-CNuDasW-yd@devvm7509.cco0.facebook.com>
References: <20260630-getsockopt_phase2-v2-0-193335f3d4d1@debian.org>
 <20260630-getsockopt_phase2-v2-1-193335f3d4d1@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630-getsockopt_phase2-v2-1-193335f3d4d1@debian.org>

On 06/30, Breno Leitao wrote:
> Add a helper that initializes a user-backed sockopt_t from the (optval,
> optlen) __user pair passed to a getsockopt() callback.
> 
> It is used by transitional __user getsockopt wrappers while the
> proto-layer getsockopt callbacks are converted to take a sockopt_t, and
> is removed once the conversion is complete.
> 
> The goal is to help to convert leafs. Example:
> 
>  sock_common_getsockopt(... char __user *optval, int __user *optlen)
>       → udp_getsockopt(sk, level, optname, optval__user, optlen__user)
>                → udp_lib_getsockopt(sk, level, optname, &opt)   /* needs a sockopt_t */
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
