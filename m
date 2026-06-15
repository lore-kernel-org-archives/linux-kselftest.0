Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF954400E1E
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 15:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538507; cv=none; b=Kgpbf02hy3GEiqO/RRsuMnLHke38U8Lsh4DEIj4MZ/nTUzAsP147tEKxU9HARJNzyt2A7crqHrYxAPTS1IIVqqNtxY6y/8FsVH6B3JVC3g0ectVH8SOOBKKjt8s83f8dlDz3V4sZ/CuTdLfgH2wWfFmawbIwzDHueefUbnGjpQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538507; c=relaxed/simple;
	bh=edS4wwWza3l3hBch2iES+eWpDKEJqliItDw+Mo2XuCw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=MvppuXu0yTunSXVFrsnQTKCRrb+I0raZt86j3wr3cHIIrkGTW/2sI/HLBW4wfVF3Vcv6uF8aJI+IzxKLZWR4FyXvFRd0zrH171nt/8loYyl/pCjtPFOj07mQrcrGr5C1HCPhuwr+LW3j26Staz9Iwadbgx8a9UyXZT8pq/TAuPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aD6TOtbx; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aD6TOtbx"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-69e46524711so2355304eaf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538503; x=1782143303; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edS4wwWza3l3hBch2iES+eWpDKEJqliItDw+Mo2XuCw=;
        b=aD6TOtbxlyLcEuW2VSUUBjbs4fzAzxHeRfAtJhRX491BQuq/nxjlfqUaxonQsYee/f
         oaspwpKWytsIjDZ4zpqkXLRRVAGRTixIsuH1pyjNsUkgFAOQc5jyO7Hj4bcZVmV+Uobw
         AH4lgE9dSC4NVq6pndV4LQMEAnpniViEV0rOFdCGH4OttUgj2z/w5UBDF8PRO1eF7zAy
         fN3VroM78nfGi9wdhkvHZ98DxLTeV0Az956BwCz/Wx3PxR2MIyxKOIT5DmFajOYrZGH4
         Sahwx4QUFry4GyZbBBZM7Hjf1FQU5JoZsJoemnuRHdj1VhQ9MvfDFV68qW5YV4CDCgj7
         MeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538503; x=1782143303;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=edS4wwWza3l3hBch2iES+eWpDKEJqliItDw+Mo2XuCw=;
        b=e3MBMhGUbSTSuqpdsWL0JK3LK+PBby8FyxNRY38Kd2OR7w8b/PJlp5XgahCMtavkVI
         Dt8NlJgTad0paCdQS/ZnP92rz8e6SseyCwhTyg7huyYTtu3LA9d0C0I1RjYYHfWm+kni
         3jo/TnLzAmriBLgQHnb6X8xI9Bg91vTa384E7tEX00cz4i13y/ORet7Dz22lGRC8/SCK
         F5KrCOyjUx/sLcmzS5poJzTgODjNI2OP/97/xTzgu8/zLHqvYbWqMEu3P78enWX0F9qS
         MTb1mDHsaUvgRCOq7A6jD+dhiiDBzN+utYKRXPQ46LMWkSbFMTl6jnW0IiBP2adEtLGE
         wFtA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZdwQY/2xjcFWoKNhLhcctJNy4GIEPowKrnedCg4k0GDAg+bRhnn3x4iXjj93HK5i0hJIqRuQbAo8n0CVPuao=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj6EKSTWqMCxWK8qUv/qcjwRlJb6nlmu5I+yNggvv+3Lu0kTL5
	gcn/5ptKmGG+9sOd+OdlvfJFcPdfG2vBulRLoEkjWM1PXfk7spicrPyS
X-Gm-Gg: Acq92OGXaA3o2/6e111nhBNMDoaULFW4rHMfWGBgLe/EJaWhy1rsj8oXEwNwYPTW+8A
	bnMkmHq8fn0n7pw/YVVpba8HQfLJ/JgVAH2Nv0hs+tLnrSD0ydVBHc+US2A42EKrkHkOrmDIiqW
	Ylsl/s6snX+qHEF9gMfnMljX5AqYU/0owRTO4m8elMp3wSud4w90b0sgzPsRdoLgwWmnU6TKOep
	xfN6+pW44V2tL6lkEzGPRn//daV0VpgwUKI1JDMCcToDhsoxi2TVRa5x9qm8y93GabiBDFsthrc
	EmoZlzFKm2CPOqmov4Z9oy9cKNuoKffpQkhbquCBC8JtWWGVL0tktDEyoYCF4ZB/FMEyQo8co0k
	IG0SSw77SStt3uR6YSWr+fxmILOqg2R+Nmjtz60/RrqlbFcYcetvEpjBh2ouL5RvHoOMKaw+X11
	gNMG5yibSmGCoA5wRmKdlpxSxn0Drlgydi3H9hpaeSMsiwqsk3Eu0/kmUyurEzH5LD/6yk7pNdJ
	DZ6bLFlYpxaUlx4NHjC1MdD1Wk=
X-Received: by 2002:a05:6820:c2c9:10b0:69e:df26:ad45 with SMTP id 006d021491bc7-69edf26ba9bmr5778694eaf.43.1781538502837;
        Mon, 15 Jun 2026 08:48:22 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:6::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69f00d5e926sm3286569eaf.8.2026.06.15.08.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 08:48:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jun 2026 08:48:21 -0700
Message-Id: <DJ9QOWVIXFHR.1S8UL5H0USVCB@gmail.com>
Subject: Re: [PATCH bpf 0/2] bpf: Gate dynptr probe-read kfuncs like helpers
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Nuoqi Gui" <gnq25@mails.tsinghua.edu.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Mykyta Yatsenko"
 <yatsenko@meta.com>, "Shuah Khan" <shuah@kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc
References: <20260615-f01-07-dynptr-probe-read-cap-v1-0-e626cd61a381@mails.tsinghua.edu.cn>
In-Reply-To: <20260615-f01-07-dynptr-probe-read-cap-v1-0-e626cd61a381@mails.tsinghua.edu.cn>

On Mon Jun 15, 2026 at 1:31 AM PDT, Nuoqi Gui wrote:
> The dynptr probe-read kfuncs are registered as common kfuncs. That lets a
> program with the generic kfunc privilege gate call
> bpf_probe_read_kernel_dynptr(), while the legacy bpf_probe_read_kernel()
> helper is exposed only with CAP_PERFMON and is blocked by kernel-read
> lockdown.

It's fine as-is. Won't fix.

pw-bot: cr
