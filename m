Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447903033C6
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792007491; cv=none; b=XYpVcMcDa+9JvFgGIeA8uT7k+qNK+vC7ndiUJ779w4cL0s4G+sSPRsQcqSqo6GlFuOFUu2lobgGg3Eu2EFZBE/gUlhuAH3w3mzrUPRGrHYZ4+bgICZem4dxcOWqSrr3CCL8ssbr9IXp49mLLhKRvHof1gmWse9C1H5pzuNXzmwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792007491; c=relaxed/simple;
	bh=C4QdF0kfD5I7YkBEnXi8MMrfwuUCiXACZGR7/E2177Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QtiaFyW98cQc1GHAtvOHjPv+j/NJOZuL5HCaxfO563tsoDSRi8fdkB2c3ZF19SGa9Pqhpew26ppl8UicVMgxRW90tMIJF8/C9E4SqBN70eP1rtLmbV2wP54IjPt2zD4Auvwh4aA7MuXuhAfEtvVWgn67nnbZtjPs7HC+HvPeNzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=vnwsjeH0; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="vnwsjeH0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e7006bbf77so8886165ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1792007488; x=1792612288; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hzofueAYnlurj6BhEZgw1n60GJllU6UFAaFK5QM85x4=;
        b=vnwsjeH0ud4Xcj59MsVrDXMvnx9aPp3zwZST2da6sxMyWEJTTHumk3twuFHtadTPZp
         +3gnNTnMbSLRlzGV7t7B3EjlzjyIZOwlth6nD6xmQ7KeSFT4dkSEbZ+4prkrfvqEP/Mb
         x6wdFxhvF4l560eTuxAj0SNJXojKn+5uI+mYY2DD65xPb3REEwO2KhtOWNAueGI+jxU7
         eRe2T7opGKoYHSPWuNhryLrnJsEtVzQDPtNrhf2gdcWRJUFkpIhQ4paLUdaAYsZnGdjV
         +Waz8LdVK0jVFyZfl3RfRXW+MBRe1RsR4vXFPy37DvjU6M/vRghPVXj+qk81514ViQX+
         RXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792007488; x=1792612288;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzofueAYnlurj6BhEZgw1n60GJllU6UFAaFK5QM85x4=;
        b=OuxBUXEQCGClX6nCv1VYFpkdN6FykBA9qyexMDzyLTZG479pJ802Xu9I2q7LcML3Og
         Xog9odGeDI70N43x0n1dhZsnN43HIek4sRgX0cV9dI4JbF75ZzrN9i1eKUJuhSeIQ+GK
         +LDG6PfW44j4org/r/I5xI25wG09yhVJVg6rntb+uzKgU4tmrqk/6oLpCOVFRyqIGhJp
         rZ1IpMs8lF0MeagmKq40sE2G3KzDRFHHlmQ2PFGwH63OGFjx2ab4nyN34mbURzYnF2Ju
         VLOga5z4/5GVfzvB58sooVKktshHbx8kCgXM1Honl8vp4Vz7ThwuoWN8kE4+ok2S7Vy3
         tr3g==
X-Forwarded-Encrypted: i=1; AKwUvBypwxjjOgjjNPK1XxJhUfy5GF0/un5yOZ36IyuTKckjOrbIUAnlcFdSjTrTNdcoCuC+FFryEB/7E/xy9XfuwBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJxxVFcIkttpMv3kmDqL+SiWTZs1nuOjajvRaiGXst7TC+oZtZ
	zkcbsn+BK6Y76Z5Gabrz0DRYZJfxSKx/1Ykw1yBFimM62hSnXGaNBXIyOVkk/61itJk=
X-Gm-Gg: AYBFou2zg+www+GZNVYo58imXRDdmU+eG/gpteOyeacpLt15ftbdV6Hy+iqXqPTI9yU
	6Y1jx2rMWZAeMGEWopwrtZxV9ZO4l99JWoihxyElTYPElBVNjb1JbJTv2KHQQiSG2iizXHD6CjC
	qXWKgKDbYkzv+AV8TldxlZbSZIGNImE5irXVAQGJG9Jv6RyR3bOyk7IdB5aMYIRNfAGDzDx2lxK
	GjZ+FJ3LquGSMY/G/bwaZBiNe5hRv22AyqXUAUzPg9FMOupD63JLef9023Q25UF/qeuuhNteMbO
	HRg8xDKcB7ji91/82gURVnS3zebPCrw08VV1N3GnbWUbawX3kiBLCu4godJ4lhLmY6tHKpB6L37
	ktlDVSp+sDM8Vblkhnsd4QHjGqmIshMEb+ATaLIXrPySDAee0nJUMvS1F+VipzXvQ38SG3ZbedH
	OeFQrE+qC6QbE3H/gKW5Bm7drXBB18S0buDcOKtpDMBhJ8CHO+9yJ8CALkSEfuVlvsJrm1eoXoX
	2/k0+76RrEDptgycPXkH7CDyl+Q
X-Received: by 2002:a17:903:38c4:b0:2dd:c100:4257 with SMTP id d9443c01a7336-2e842f11875mr141177635ad.59.1792007488455;
        Wed, 14 Oct 2026 12:51:28 -0700 (PDT)
Received: from localhost (107-190-31-93.cpe.teksavvy.com. [107.190.31.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e8c9sm72720135ad.23.2026.10.14.12.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 12:51:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 19:51:26 +0000
Message-Id: <DM4TMYJX3BXY.15067Y489FKUR@etsalapatis.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next 0/2] selftests/bpf: Skip libarena when arena
 spin locks are unsupported
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
X-Mailer: aerc 0.21.0
References: <20261009-selftests-bpf-libarena-nr-cpus-v1-0-e726ccc66fc6@gmail.com>
In-Reply-To: <20261009-selftests-bpf-libarena-nr-cpus-v1-0-e726ccc66fc6@gmail.com>

On Fri Oct 9, 2026 at 1:49 AM UTC, Qiliang Yuan wrote:
> serial_test_libarena runs the test programs of libarena, whose buddy
> allocator serializes its operations with an arena spin lock.
>
> arena_spin_lock() fails with -EOPNOTSUPP on kernels built with more
> than 1024 possible CPUs, as distributions commonly configure them.
> buddy_init() reports that as -EINVAL, and every test then fails at
> arena_buddy_reset.
>
> Patch 1 makes buddy_init() return the error of the lock, patch 2 skips
> the tests when resetting the allocator fails with -EOPNOTSUPP.
>

If new kernels expect more than 1024 CPUs, we should update libarena and
arena_spin_lock() to support them instead of returning EOPNOTSUPP.

pw-bot: cr

> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
> Qiliang Yuan (2):
>       selftests/bpf: Return the lock error from buddy_init() of libarena
>       selftests/bpf: Skip libarena on kernels with too many possible CPUs
>
>  tools/testing/selftests/bpf/libarena/src/buddy.bpf.c | 5 +++--
>  tools/testing/selftests/bpf/prog_tests/libarena.c    | 9 +++++++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> ---
> base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
> change-id: 20261009-selftests-bpf-libarena-nr-cpus-50fc5dd00fe2
>
> Best regards,

