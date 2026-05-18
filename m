Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED4F3803D8
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 03:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779075003; cv=pass; b=ac0ddlfPIN1MnNwi30SOakmho2L6wz0m22JJ6+IfHW1GwyO+7/eh8lM7EqRQz25kYWC84R8eOW87JpZ8uuIbUJqjYwYtw81PLDQinTPcj9q5t4i7mzVEaakkXZ9JZZ9kM600hlyw1kyC87OD6228C9NDiy3pIM//OQm4cnu3soY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779075003; c=relaxed/simple;
	bh=Ah2or2wqmpMc/QA9Fh43Z3aAuzOVZJMZOOpqKfpS3T4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SEF3n5W+OvVtZy0r5TXBY0YqSKS6DY7pXMlzgXwHXRMNQRXuXWMdj6tXUZrb5P5Kw/V6k8d4OGl6T/3xPE4OHf4n7bbfPIi7rlOI0mjUTGLrUIG5mDeVgPAbUZ09liUykBXRX4QP8vHFs750PKgtPiNdbmuIlyUZcGuOoK2ssDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUNfa1Z3; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUNfa1Z3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso19650845e9.3
        for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 20:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779075001; cv=none;
        d=google.com; s=arc-20240605;
        b=lfcLvEXi/RNA+bKTq/pSkAup2Mj+tRAl4EwZFy6Y7EXWjH7AS+TnQTFyO+Z7k4iRJD
         JpbWfQGf1VJt+3OFR8/Q2N3EakogUmc+8BMidDPZ5YzkJWy0YgGC2FOETdca/m/LKoPx
         KHCWluVpFJyiX9GsFOtd2UfjnLSW05avTM76g6hht0U832HxFwoXBCR1LVLmncubfFx2
         aoII/QDOAjv5S6nBlcsJHfTrTQ5xs7AgNLWFUk8juaYWyqjRbMjlouUldJlwJxo4hvUM
         HbyR1/AjWdO7q2EjIFQOgJRTxtOLFw4a5UxAOexz7HpqbyhPZcxkTVffDbdtDXcwBsO6
         50jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ah2or2wqmpMc/QA9Fh43Z3aAuzOVZJMZOOpqKfpS3T4=;
        fh=VSudpGSg5h+tcmFQq/68xWuQhy0wqJ5rg/ilJVaGXTw=;
        b=UwuXGK8qozcGe0Y2vRa+jtOEsgAwFMOB15eI5WKRybswzEIzOhG4VPfzV0/KQOPSKt
         KvLpNea2gtDkEVpJGaLia5BnkGDYFOkF8PtFq4P3j1rcMkmtnKj/PBgmxDkmRcv8xJER
         ekKqi5CBkDGUQv4MlPlFpiEnMdR60Z9bPJ7ZS8vYoZxHMuNATeT+5dTSW4gRjyTqjHrZ
         ys05t2nfgHr0U3IbsCpdRJXaZFgGQcrm3gADbAWz97hdoAeeZopgYgkUmKFhwe7KmZiA
         UqH0aNU7yjvM51zPxlDYiIfZCqopBRhJ5DDOkRAluFDcleZVQQUwnGarTor8OXPlfVXD
         P8Tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779075001; x=1779679801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah2or2wqmpMc/QA9Fh43Z3aAuzOVZJMZOOpqKfpS3T4=;
        b=IUNfa1Z3DM9Bh12g+I6TcllOzu8J/koiqn56iX7+DLbJu0VXaiFl/l7Oy97Qfm0u17
         xQzLHuer/I2vjy3DKKw6FzxEW81cJ6pEpB7KW14g5ZXKFN7oWKG7OuAWOSKz6gTusHf3
         r+d/oQdqbzl25DuBkSuUb11kyPCgY6N7nY6u6mW+lG+xM2S3/mMD2DPsi3d5d2YqVyRr
         BEWYgpDfYurKLER8J3vyVLBZ2mJLKZTyD6z7YRRfK0T0eks3WuUv7niTrQYRFC6sBpJy
         cyreFq6xqwgIYMn1Zv0ch9Y34heYlMdODr0R0cqx0y7o5ZOLxxdBi4qiCOhuryiTyKrR
         rzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779075001; x=1779679801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ah2or2wqmpMc/QA9Fh43Z3aAuzOVZJMZOOpqKfpS3T4=;
        b=Ok+I2Pa+CBJIAhTLXPM6c29c+V/QDwpVR8Cv1ZpVoUIhQK8QI8wXxhpc0cXWCNF40x
         ajaZrT5O8EV09VePAN+4SJjG5WXOghIjeTZhLPQr3n8JDNZkT69KebIuh4t8rRlyWFt4
         4ZXRxkiISfLRR0Me6i1qj3C3OmT5WFvWpDgFOmswGRSN6dnVKIZKMPsWY0E4u6QKCYZq
         BBnrWpHrqOZchvM/JMOH2trwP+5pwHTlM6L+czE7slSXsyQaBuLaZ9YPCgdjarb/Nkk0
         DiDiy9hLucC9JpF/du8ROneE6cCe4OYM0AIXzps/B9bi23oy8qiUySG4wmqjCqQEnGEi
         +rjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SBZ7/G1czrlu3caCz1uJ32g82MROY1V7u988OYWMDN4MjiUHUBmbN5S5M/XZDeex+7/LdYf4pdGNvAIDdItI=@vger.kernel.org
X-Gm-Message-State: AOJu0YypLzi7kq78mp06AskaP99Rq9bKe+8WQrluXk3uFEIOPdnKHJJa
	l1LkaSZrCK8L9Uf57EMLjWT8kXXu0gywzvIhhg1ya9Qcs6zJ1xKKwSdwVKPa19W74AespeglPdx
	Qhe69p01d9NlvAoE86MgCcvrfNjyLL+M=
X-Gm-Gg: Acq92OFtnnDI5Ah7nVP7Lnbbv8CIv71PZ4SMTmvfWB+kx/ggJYcbnfgHWP75CGL1BCM
	SM88rcpRcCtmX+Iy50bSV2/Eqo0lqhBBsCqE/Tr9kuJE6gU9GQeXcYpa2fI2wr/jrWzH27lABKE
	UFTGFO/4m3uOpufWgzVai44WjiuNYFtEr4qS2YSNypSgMxq+shZG/jaHfzh0U8dOQgQrgHU37S0
	/lgMfj7qM2EOoQ8pDiWKNwivC3WiaGXCqpu5VP2jKM23nXU8NmBusuoF04DMNloP8bLNCoR8Aa1
	i+CkfK6DB9yS3NDHu/VNle1b8q1L2wbV9VP3dlcOvif2+SJwqBI2jUnjNbEadxvke5B9/73Q1At
	Rqb5MdMycikbNIRn5zSA3bCBFhQ==
X-Received: by 2002:a05:6000:26c3:b0:45d:b14b:23fb with SMTP id
 ffacd0b85a97d-45e5c366f83mr20413156f8f.11.1779075000433; Sun, 17 May 2026
 20:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515071504.2054786-1-yuyanghuang@google.com>
In-Reply-To: <20260515071504.2054786-1-yuyanghuang@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 17 May 2026 20:29:49 -0700
X-Gm-Features: AVHnY4IEM0nvjSnXzFwg7aWUVavgM-pZSVaHMNKMxqjmbw4PkrOQcMdn5z4rIOY
Message-ID: <CAADnVQ+Mc81ciE+6i4Mvg5h=fRNq6460w0-NAw_bU12oaBWruQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 0/2] bpf: Align syscall writeback behavior with
 user-declared size
To: Yuyang Huang <yuyanghuang@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, Alexei Starovoitov <ast@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Yonghong Song <yonghong.song@linux.dev>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 12:15=E2=80=AFAM Yuyang Huang <yuyanghuang@google.c=
om> wrote:
>
> The bpf(cmd, attr, size) syscall copies up to 'size' bytes on input, but
> several commands write outputs back to userspace unconditionally. If the
> caller passes a short buffer, this can lead to out-of-bounds writes,
> potentially overwriting adjacent userspace memory.

The whole thing sounds like a user space bug.
Please demonstrate a case where this issue is seen
by using libbpf APIs.
