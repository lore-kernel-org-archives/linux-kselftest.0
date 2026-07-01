Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842473BD62F
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 21:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782942650; cv=none; b=MyVrkGcn1Mxtw6qhyUjulYNQUf5p5m3pQIp5zkhJ6mCpvwPog4f4hQe13e4/fGg7Nm9I+fH1jL+nA0y57M82g28cCocXgJha6p/XnQlZhrUzT7wqwLzeD09yhQuWlUZ7737KWlt9PO8zZWzlg5CZQ81k+CFkh9WpqI0PIc8HkZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782942650; c=relaxed/simple;
	bh=lPY2QwEF/A4RrFxmeDEXKjTC7yfbOe2FA4byDLUu4XE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=Ak9JPNRPj8ib1XBOvzD9r+KT4VA+Zr9TVgK3ul5qX+WE/mpypLzxTa127VLkifOSkLrO/QRfBqjOWp3BXn9NFnL/95An5X/T/ZkfVtjkRZ8lTBYmIfGqaJXsUlW+0+6lOTXALyDS7UUFhEUHVNg2iKJQgcg+m/PyhNjKf9rvnvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mf5Hgkaj; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mf5Hgkaj"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8114a4542b2so14402167b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 14:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782942648; x=1783547448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUzJS7YLrMLTfDgictXRy5FJUzML23tRi1dxlFAvrIc=;
        b=mf5HgkajPVjoDVxVCRqCI4eKZ4iV3Cb1EJ0KoEbSjg8t/9XZlJ2H4EG3vJ01WY6QPk
         AqgJoQDA5065f0mrnn0z4WsF0X5dRrE+O5ZorV/lCpxp6Dnq0pg15GhgRce4QlkdDKPn
         KfBQHbpxa4duBPofSeFX8TZ18oHm/kXQBmZNBQJm2GBMkiKkTQPOfiTh+ZPFYWU/QKML
         zfQ5OxG8btuD+HOGNna1QcHPz3fCJThjYAIZ172hoRFOLSiGO+ALsggSjZEKc7nllxHg
         yhGj4NSUw9zbgfOnTMu3piBwhmo4HLBbKSOP0+nCEaZfC21UBw8w8hF5MdfRtxVL3fY8
         bYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782942648; x=1783547448;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mUzJS7YLrMLTfDgictXRy5FJUzML23tRi1dxlFAvrIc=;
        b=cg2r7xDpaZqoiWRqiczHjsqIc9RJL3Wo/T3VoyJuGxdSX+jVhso6ZzWbdNYMQoydqo
         9jimkyCb/u0Jy5o5Gxj+D4qY8TrNH5PJK4M9Ggv+P6QItfvsqP3yDpvS4lAOTtWcCB+z
         rDSUhm9+hPZXZq+bcgZAJLjLcoQRyzPWkG/MF5KE3Neyef5c7fmQL9UK7VMTRVX/1j81
         Zc3K6PFglbArhsCu9yFIXTXhgNrANdVLiyOsihoy73y9mPFcYLGBFWMJLEuIcozRF8Mb
         9Do9HY8usDg65MocqxAa2QM0TaswY2PZidh8vM87zh7XjqwFevKRnZ2/QWEwwHZH9Wbq
         muEA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6CZoPqn9Sg1yjR1+uo/hhlr0zPCjl25Ch1W4adhHyM3zjNhrlKjBpWi7XJxPrqGuOdwo1WyPEt6S3IrFL/PU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKlzAYDww8Afe78wX9vNSKdqFo5HE+zuFMUXQuk9HJPZFENurS
	LZDGCZGcTIIULnJuUMWxXh6ZXW2j0Ed09xX0m7zj95sJ7IiwQmT2Ssct
X-Gm-Gg: AfdE7cmIcxuDK+FALfqqGAJGo7L/qPz5eAMudU5FV8JLiqHWWMFdUEJt+yD2w1I/pBq
	wd6jF1E8ZapjCSVcCwQxCGDItAmYn0M+uPu+Ve8+rlKaKblIF49EJrx2cpEhY8sbuwhpBQ2JXSE
	MT814EjFEP7KidsISgl9L6hMvKAoBU94oWk8siucVeOSQ5RBRoaaaoeVBSTcadA1yXegPw7pb9f
	f+JukdBeTozAyTVcCvsR2w0jxaBs9ksjQqDYpYDW+CuGdETBv/olDhdvKVwAYozZyMeZ/qPxBPj
	hwucAVoVLibAnwzjYhbe3LACsXkIjryAgJg2hqAXGlf5czYFNuppOMiKMCU7tGNrTIuZJMHpfuP
	MmGAs5KBG7c2zB529aqcymqbL33vPVYP3VCE9gAot4eve2KgdVMyxQCaMGQtgAD2biQ0a+kpDec
	SsawWpMvJEU6x2jV/lfjky9XxI0nq4M4gF8JYqTKB9PLT3+tN/wOSYHxKsxqfgTaaqWw==
X-Received: by 2002:a05:690c:4c06:b0:808:f9bb:3848 with SMTP id 00721157ae682-812e8dfa30cmr38172297b3.13.1782942648546;
        Wed, 01 Jul 2026 14:50:48 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144af4f427sm5173057b3.29.2026.07.01.14.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 14:50:47 -0700 (PDT)
Date: Wed, 01 Jul 2026 17:50:47 -0400
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
Message-ID: <willemdebruijn.kernel.14619b0e23d1f@gmail.com>
In-Reply-To: <20260630-getsockopt_phase2-v2-1-193335f3d4d1@debian.org>
References: <20260630-getsockopt_phase2-v2-0-193335f3d4d1@debian.org>
 <20260630-getsockopt_phase2-v2-1-193335f3d4d1@debian.org>
Subject: Re: [PATCH net-next v2 1/4] net: add sockopt_init_user() for
 getsockopt conversion
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Breno Leitao wrote:
> Add a helper that initializes a user-backed sockopt_t from the (optval,=

> optlen) __user pair passed to a getsockopt() callback.
> =

> It is used by transitional __user getsockopt wrappers while the
> proto-layer getsockopt callbacks are converted to take a sockopt_t, and=

> is removed once the conversion is complete.
> =

> The goal is to help to convert leafs. Example:
> =

>  sock_common_getsockopt(... char __user *optval, int __user *optlen)
>       =E2=86=92 udp_getsockopt(sk, level, optname, optval__user, optlen=
__user)
>                =E2=86=92 udp_lib_getsockopt(sk, level, optname, &opt)  =
 /* needs a sockopt_t */
> =

> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Willem de Bruijn <willemb@google.com>=
