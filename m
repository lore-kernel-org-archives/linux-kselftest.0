Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795766983;
	b=scx9gFD5fHRCTwR+GHw4ZyBpqq4jjdeMbfRoEJMRVAyMarDnoLi8vHyoeosXOE9YGeWP
	 cdcFXBBWexKgZSwJ8WxIMvAFzKLuJfHoBbX1aBsa75BuTkI2BsbZlsjQJuaCULZ/dSxgT
	 HE+K1QIB1b+i0NSnVsFNyzr9wEWoYrC31tcRy3fruroP5aENzmDkB9oi8I0ZvMRCWUV7t
	 E2QP1Nl6fhXARTG8yJCB902Po0kZepYhX/iOpyXEb8NJW2KT98HyHLeUNr/aJqk6oEvVo
	 QuLCS0ZYMbbAy+FJTHDlEaI7alHKg8Ctm5gjwblx/GWbSsbqR2QIVoDQOR6rWtHKo/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lfAZ+eV95Jshg9Xk+E5kfkX1skkeC9iTSDENSIQrVdQ=;
	b=wGv1+Etuoy8dJJU0RogZXP+LuRBXfhYx9gQbB7KjKxF2yKEDj9SOjHeMKV0fsagaZsqf
	 NRTnwL6/9svcj7jqU5eJGRQQO2kPZSC0J2sNrVWULObvA77cLbyo7PLCE8k/fLcFcC/ev
	 LIKcSCrWXp6dwnSmYhTVK9KtWSmqSpbHWzuaTynTTBySND+pr+b+2g8gqc+T89OplXItr
	 FyoteNsIhUXaGbIBvAVo+grd7mJQvdEM6E/Fl8pQyueEeNb6gwDSKd7leNZy/nHJzaSEU
	 QRkzwH+IPpfR8c7Vs9jy8K9lEYWjhjghgplK11UF7Scmg/P5Ic7CjxDCZrOI2lZz+gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UJfo/M9Y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0EB606A681
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 08:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA0EB606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJfo/M9Y
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4a76f63b243so6325859fac.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 00:09:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795766981; cv=none;
        d=google.com; s=arc-20260327;
        b=EBt4/ZR9GCQxBCtyXBa4L7bUgoyK57u5guqjnuTuIW8+SPlEW++1qqXhcOlBvYhuhM
         njnAGA0dqmna7CzylNK45cC2xLPqCPn6VO00bocC1NY9xxYReoGb1V9V56GdBpgpKRHN
         RtkZZdMJX+SUypfK6cazpEUnbFzJ8IprJfs8gumQps6pp/cZmgOgEBeu1bP00Pxz1Lcs
         00KII+5B4ZLnbkMpiL8eFRJ1r/7fu/8S0yHiUAJoU/cm/nBv2A8h7duYYkSD6s05+4oT
         3MDIY4+wCk7SpZMICx1/WJvXCMfY/sCaeAerkvmNcAghxU69Qsgo3TkjwHtAR3vjj5XM
         IGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lfAZ+eV95Jshg9Xk+E5kfkX1skkeC9iTSDENSIQrVdQ=;
        fh=HKP5YItkGxXn5ukQMgbhTx874TvOFZktet517PeakxA=;
        b=sndVlE7YJIV2CXJzDIhkou9bv5Pn4ujcMYvG/GT9Daj6qOig2J6pcRmiatKS6nqkHF
         xaMbzqUElor+uubWtr1hs3EkwKIS7igGXRk3xeJir8rERSenRfc5dYKOhZTyip6vkqIr
         vZ0whQ1d+43gXKVRGczqqC7k+56yyHCSEKzZZFgWJMhA/ovqS3aMfNSYQ0BFcXtPKO/i
         4l/Ba5aIpd41zHKG2krbKj5I/pmzNaKACzrsUxMx56bPfGYhGsqE8oopAOaAJRwSSlAo
         qlzbk/CRcOjDX98WZCoD8F724sw1it1yi7rSa9DuYhp5naB6MJDcNmGIs4UKwILcjOP4
         TrBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795766981; x=1796371781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lfAZ+eV95Jshg9Xk+E5kfkX1skkeC9iTSDENSIQrVdQ=;
        b=UJfo/M9Y+aH86agR5L+WdNAthAJZBgv1KW4YobBsiUHeT+8DGstD3A9sa8KmEbAD6D
         2/wVonWaFRqXqx5jFQ79Lb0+IqD6mS70s6tGB+XHyzaOJwmvwalQnxmgyDqOlTNqSwRe
         N1U3kwrgZHkw09myz5Diuf+QmYXI6OhMr+ADY5Pel+gfP9pnMAq32CSNZCdD5rSM7o3T
         gCRoJjVC7qabX1Q6sYeQkwvd5YgM7DdXBY6E139+zfhTlCWNNKFEpbpEYuyWk9YeiZTC
         RW7GZv7g2wX3QdW4UqwmxBsbvQGsMjDaQAXXFdIVR9QXglZ5bINkcnfZgmJnCe3+1+fQ
         Rdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795766981; x=1796371781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfAZ+eV95Jshg9Xk+E5kfkX1skkeC9iTSDENSIQrVdQ=;
        b=uLyv6C9Mz6H7WFVri7YHO7Hk9/KyEv6eG91waJPsTSn08gaMEtwvJfPuCeQgENaXN6
         NK4qdwxAWT6Rv5+gnIzq4qlKFrxZoI9n512hqRwzLy0ARn1V3lQftgk2lypjiiZ9W2s7
         HRmO0Hy9szpMSrFuE/fKIkCCKnzbHgQll48JnA2wisbEkanvBGzR+1ram79GlOvuLIXC
         Aielrl1QNHb2sO9rkpwWizxpD3vP3pu90yqpinzfXiiQfUq5PYZXM5++FyxfM2eb0tdK
         OoWtLZed5yIyzpAxJrvEjjJ0OIM+Dmq8vbbN+89N/fug8634xtPv9HTFzk2HkRka1jgw
         OfEQ==
X-Forwarded-Encrypted: i=1; AL+hErEIuuRuh21GNGNOZY2t6G/HrXu3YMcxVYD/21n+6bz+2DJbyYNobbzjJY8Ovk76jhRjoeUzw+YbikWJi4hnuc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o4sCevDQkxwKt7XIzqLIf76z74iS7GYnqr/GZz//3wYhT0NJy
	rvuuR/3lPESts/F68js/p5bFzZx3N3lPgbvtX6tRN1Cf7QgRey6lIiJc7nJY3olYX+0Bc9K2Z28
	JeiCzX1+PW7woeDv4fr9HU8fVsqwg/nU=
X-Gm-Gg: AZFdTZca7kd503GPP9JQAt+Ag6t7Z7aRBVHYef+nK7hIsjK6gumjtSW9/+DNkrVvQTt
	5/kyERp+yPAK9oqQRThcmSm2Bbg4jz0b701ougyUu824Xy2TfL6OrhEhORdxvWWJAh5KcUq55pn
	E1MW1gnT9X2r6tUeUBaVur+oSAngGUD+g2OEVNlzii8tk7ON0SkAjnf0fXDaXQEJuGu5Hq35MI1
	2w1E/pnlp/iPB5bFf6eRWbIO5vKGJTPI3lCZ+jEK6l78nwT7PwH9uNmm9qvzV5PSJwOVG4jrTH+
	eu/3o3l4g8IN+fQHExoLiZWE0IEI++FMlV0qAJFQECJtTiz74MYGJNh6MDmph3v/2/Xgxy9x+qY
	3jjKEc3gU7duCorLfqzreG8yVFDJfwzQV0+U6yqma99UthWfj5CJmny8SF0UugrHcV7p4aXfTVd
	LEbz6JYX7ZA/31z80jQ2AO6NO26FrGEgEe7Mq9
X-Received: by 2002:a05:6808:250f:b0:564:57c3:2b28 with SMTP id
 5614622812f47-57a095fcf70mr17846706b6e.8.1795766981639; Fri, 27 Nov 2026
 00:09:41 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126231706.1303486-1-sashal@kernel.org>
In-Reply-To: <20261126231706.1303486-1-sashal@kernel.org>
From: Ming Lei <tom.leiming@gmail.com>
Date: Fri, 27 Nov 2026 02:09:30 -0600
X-Gm-Features: Aa3M54o9OdJEVwey50VSDsmvCuHgnyt-id-FpKGF0N0f936dbtzbMBmFg508QQA
Message-ID: <CACVXFVPGY42hY9qF9485H49xh_ZQm5nPEU-hX2gNVeJ8QBKoiA@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/ublk: use the configured kernel UAPI headers
To: Sasha Levin <sashal@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Uday Shankar <ushankar@purestorage.com>, 
	Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 5:17=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> With generated headers in an output directory, the hardcoded source-tree
> include path falls through to distribution headers. New ublk flags and
> structure members, including UBLK_F_IO_DESC_SIZE, are then missing.
>
> Use KHDR_INCLUDES to consume the headers from the kernel under test, and
> add the headers target as an order-only prerequisite of the ublk
> programs, as nolibc-test does, so that a standalone build installs them
> first. Baseline builds fail on the missing definitions; GCC 14 and Clang
> 21 builds succeed with the output-directory headers and target liburing
> development files available.
>
> Fixes: e371b9d3368c ("selftests: ublk: kublk: fix include path")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Changes since v1:
> - Rebased onto v7.4-rc3, where 3197517875fd ("selftests: ublk: fix the
>   build and file offsets on 32-bit") touches the same lines. No other
>   change.
>
> KernelCI's kselftest builds of mainline 9437ee8b6cf6 still fail on
> kublk, metadata_size and ublk_cancel_ready without this, with gcc and
> clang on arm64 and x86 and with gcc on arm, on undefined UBLK_F_* flags,
> struct ublk_param_integrity and FS_IOC_GETLBMD_CAP.
>
> v1: https://lore.kernel.org/r/20261014200144.1364828-1-sashal@kernel.org

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming Lei
