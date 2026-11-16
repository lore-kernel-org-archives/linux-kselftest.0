Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794789960;
	b=2sZdPchDO0Izc1d+80clRn6hJKYenPlv3EUVU3IGwz9IskbPDO3Zbedm0zSMpSQSkf2g
	 rg4h5veNVg9b0mAssDwpyFChjygQJWw2tMsx2ehStW/IYtDE9z/tUdCtk2u0o4NZ6IP2f
	 nLqkJFEdDLAeUqrigHg66NVY+IzHHAWJhWEgElPDY6MFdiD5qWlq2XNR+a0IWVQykbYF8
	 WevyI/MFTlRj0mj817UhNwVxUsemog/Pi7S/qSo7rnb9Wx6Y1ydrZlkeqQxOIhZ98C2EI
	 ZwVVsuVh95pxvNLWkCzQ/ixtvnrM9VW8isfLX72gJ+lNhQYsJ3Z6/rztguWSZTOeAZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794789960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lO3Cr5SSAZtOZOOCaZ4gKS/kULSO6nzv/VYrrhRFV3k=;
	b=H+CLuCqUiXIE4K2dQYAa2BjxUhIqMK0ZdIu1NsGs5VPcrs6MiS/CZ2FP0p9Pk6Ai4K23
	 tJMjXTHapv3kMc9gCEnZty+wucYg8RpJ+WmR1DIpMLKA95b77vXSK1wJcbv76Gx6jiDDi
	 AYBHvZ1dmDsv6fUX4uDm4ars+ffhqasfKOV2yKX/glGLlkptFo0wd55nhMux0/c03NGj1
	 CMcqI2srmqzC9PPF8G/puIbxp7Ga54EhyLmypF9kBL+64le5B57jm+7xzxrIy03yUcKf0
	 sopvpihjs8SLD0SmQE2FVKmplN4XdQpyakd8jTuzGEWKE3VKm7HR+G+qCeo6cazf1bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Xt03lFTd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099C2606A329
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 00:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 099C2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Xt03lFTd
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6d68de53053so1850708eaf.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 16:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794789959; cv=none;
        d=google.com; s=arc-20260327;
        b=TN6uNfZ5Eak9gsF7IuWdDxSyU32FEhColy+wjmc9PbN5/PsO8b91jYUcE6GT6IcbB4
         OKpNJSt9ZJ4mkNr5METyoTp0l06G4jl0YGz1NOVsWO3DPJwEggx3ej2fqwY59GRJfrwO
         +cprtzEGt7t3ShZdDyDvtRh25C7c36/IRO3gd5/mg+66JJQHBXetsY4X+vHpoWlg/TqA
         A/sCl7ISvYpkd+YYLz9ahRqz/S7i2GZofw98hb9iNh5PfCaDc+fTnU0twXyPdwbUCgOl
         eeCC4iGZtKMQ0tVUt1SHl+YdG/bp+Qce+2O8wvB2j+x230358Ak7fKCK+5nqvUBx0LET
         1pQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lO3Cr5SSAZtOZOOCaZ4gKS/kULSO6nzv/VYrrhRFV3k=;
        fh=HtUMEiGF3ctI6BC1ngpKOzd1B5fZo3v8fn3sqO4KIhs=;
        b=Q2jiNamAcpEAoiV2kLokCO06X0AZdTzJZuDdr5KwaGWWkU0QptVfGkagpQ8jkRZgHC
         5/uNgnyu8/Te7DYe2Hu7/ui65fXaN8me7k7zS3rI5bA80kUN19SaJXaL2KBCOZ7AFVp+
         OPSRfqZzXYWHo+ZJdZ5CASuNWmrY3UiMmOawFazkeFa175H3vBlVu1YboKqJcQkJ22Fa
         Lfg7dh6jBm67bJ8ES6TIX/D7s9swGezZLpxS59yuxiWVM7QgMqpkC8DHYovsGG6AOd1E
         RbxPlYH6C2h0QsLjikFwwCvKptXKhW5BapUPshTebvl3K1Q6sP1GV6ll9IH3hZjShZ9c
         CJZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794789959; x=1795394759; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lO3Cr5SSAZtOZOOCaZ4gKS/kULSO6nzv/VYrrhRFV3k=;
        b=Xt03lFTdg4jLInQcl04vLeXF9oJW0DFBwZLBN6a6UP614RusImFX02ZlrEXXz3F/ep
         FI/p/57ji0nH0Q/LBj2Vr5Tn4kQ9X0yEFhbcaIipNU/5Dht727hz9wrlYC5v9Dw24gIK
         gcndx96h0ysM2nC3pnuIqO7q2HWfC7yPwMymAp9Vdku3yEN1V2Og7zQOZ14fDuYFsTMu
         3WKaUgWtbxJLvpq9v0jiIsG9cRZAqum8zzpd0kZsrPRCsAMjhZR7M+XVrftklhRZ3tPd
         1OzvmXEgMo6/bzkd5tw/o0lbIPVzDasw4K4X/njk7mkw7MkFiZfaLq2snUGjJCuM2qG6
         XfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794789959; x=1795394759;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lO3Cr5SSAZtOZOOCaZ4gKS/kULSO6nzv/VYrrhRFV3k=;
        b=dAD+2Ja8/8/zZJ50oT/2HLG1s7YA7kxKeg2eJweY51WW9E/UJao4L43KINXJh1eoEo
         mRm14lyHVbLsHYDtl1820GDEjw7SG64PqXXxr1ZekGp8HS7l5qQJOJks4RVQt2FMzGwK
         HuwG7NZW5oByN+di1kWmTg/BiBxUug8mtmZeQaWnA2d1Teq58XcvEm6fGY7AxRAM346c
         m5t2Xj6ejqYAX0YnxfqcsbYQ40Qe7XrrstgS/faR4OggV9dESW39KIkCBmpfisgTzUQI
         moPEJhLZqiZ8QHeRdiOui3gltB+tDtAos3y4szjjU56T8s0oQlgleIz9B9xQhi+QGOlk
         C9MQ==
X-Forwarded-Encrypted: i=1; AL+hErFyrTDTk39zzAtHDx9VK8wsSdSV05otqlczMFCBTVGBNs1bpFiAqPGgOzx8HTYfWr/P1D4zK8CR5Cw7jSUurtk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IVvAaNHmPwZQfGdfwBWO6dIcqeFqeq0svSHUuM1iePfibirWS
	40wEg7QSu/v0T0u0ftSyyRAxVhDqQva17u1bsftpesgs6eL0xgqdpTlLhMtlkm6N3w3Qru8qVjI
	CHdC8OV5fDb43lBxDpwIPXXu4g9Px+sfTA0B0DrTJhw==
X-Gm-Gg: AYBFou0gtNrsqkn0ZOoF/FnYdjOURJkOy9y83cbgX6i2TWHw4h+w8GOFjCj2MEkn4uG
	wx6cI22wKa1s+M4QA2gdsh8dblyhtrqkXMgD0MdqMTd/WhHWx8repJiDKsQzaJ5swBXEBGStSEP
	z+Uqr+RzbbesTltNKF4V+Q2qof6X/DXek8N2OvEszj1+95cxOm/0olOavPSOpZkSRUGorn/RLjz
	OVx8yOSOm0f40kDX2FPZtWoBcBYpMCtxfGfpbiplFG55OZqYYN1886pogdcr1KdoFavp79GbU24
	RzbKjJ5itaapGFhmP355xhUouMEb0N+JQiirAocyFyS8cWH75QX1tommaMhuoaV0S6rqGX22bqL
	D5hgXLm6ORXQDmZKH01x2SwO2iwhK5H6Y62LTCmb8yLKjKVbF08m7h433j20v6EhkWCbODYh0Z1
	FW9CX5aK8ABnQ=
X-Received: by 2002:a05:6820:4101:b0:716:bd98:252b with SMTP id
 006d021491bc7-71acc5342dcmr3472073eaf.26.1794789958914; Sun, 15 Nov 2026
 16:45:58 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115214702.50817-1-emmaonana18@gmail.com>
In-Reply-To: <20261115214702.50817-1-emmaonana18@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 16 Nov 2026 00:45:48 +0000
X-Gm-Features: Aa3M54pgGbrVncF7OWBfNtWTvVm2wgZ0k6kyExGgK-4Hkv46OrR8Lf1HTEPy_OU
Message-ID: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
Subject: [PATCH net v2] selftests: net: veth: propagate channel-check failures
 to exit status
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: kuba@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 22:47:02 +0100 Omokefe Emmanuel Onanaroghene wrote:
> chk_channels() reports mismatches with a "fail" line but never sets
> ret, so the script exits 0 even when channel counts are wrong.

I found three more checks in the same file with the same problem:

  bad setting: XDP with RX nr less than TX
  bad setting: reducing RX nr below peer TX with XDP set
  bad setting: increasing peer TX nr above RX with XDP set

Maybe it is worth fixing them all at once?

Tested-by: Tianyi Gao <tianyi@cloudflare.com>

Cheers,
Tianyi
