Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF58D27B34F
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 01:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771983735; cv=pass; b=VqNHKMkt65VGWv3svMI/w2ZozLDnFThxSFsP1GrOt3BQ9GjO/qRQ+xqXSopLqf5WPMLPDjMCxq/QA5jc+9J0tkpqNwMJrMU/9YetNHc9vyXjeFh/dLiiTJPsio6Je51rwIVykfmxDUbkG2sR0FnVf+wGy0WFj6gjgbxFiH1LVI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771983735; c=relaxed/simple;
	bh=fSG7iYPHa6eh72+ECqC+nUnnjAWHHtqapODHBA60oxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFIAivbriTm0ibDAPvRn3dnxEhLvUyqs5JaP0445PN52VmRFDK+Bck/jMBhGGbeGCZnL+ZPwqEEJ2ukPDEYS/wZjRfs30KpurPZUUmy6wy+lZGU99GRqQD/EoKRIivDppofCeyzY0U8dYfvukdL+f1vn+/Av5oZmasA+UB28+xA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kLYdFTTS; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kLYdFTTS"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5069a785ed2so199581cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 17:42:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771983732; cv=none;
        d=google.com; s=arc-20240605;
        b=lYddJH8Wpm8B4WFgKUdG3ZGDnfhD8wpsEA7iONAXZa6NmkToUwxyenFTxbiX/FGJII
         6bsV74wzWZeUyHfBITeptuW6fJddVhXi5JkyJkzIb7jyh4zS5bf9PC/W/MHk+0ygu76i
         qvP/8rVrQFDTVqTAzbMY+CJolaoEDWhfskPpHMjIZfzUGqYJMqbU3TRKsWKv7YiO74rT
         FlwS/2JVVY2hPEjjJ7F6/EUSUSDp34jdf1zvxfJH85RaHmlWS3bVYhc0R+BFl6VCMi67
         tbYAgkjFeHIxpdPPBw03n3gxHCP/rrsdlwUtjYAD6IOQGF46dX3fHA5379TqcWQ+pXnV
         gTAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F99IpJbD5AmJltFy7mpJIVD8IelNT1aL7uENGvnuRwM=;
        fh=Xr+OgC5AXpH8WMCAw+jqrrK/iqCAe2x+nBqURQcx0rA=;
        b=kKyb/XrSg2/PT94UHjclqSCb2LRtC+3dp+QLcB0Hvm+JXevMXnaTyI5GouRLvd8cam
         xEcRiQHL1LNHVIG9pIvPGtnv1Pr/gq5gJbqf/TukGIb/JM/2L3yfpY/qmFv7FkLVYgkO
         oidkLoKo9UfmWJV5CnLwfGG8J0sBQyxXOMJ5+DQhxzCeAzaThjBsELOQlUa8BljRk5+m
         J8osYGZjgwPI2BJJu4/zsJkcjcTVrKqQDWfT8kYV8E1En8nhirOjBc535NyPV1+HZepA
         k7VMweeR3AhMZRMMpmRGKWgEXq+FujViD0GGM4E5u9fXd9thHs/jq32msPcxrODrqRzz
         +NEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771983732; x=1772588532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F99IpJbD5AmJltFy7mpJIVD8IelNT1aL7uENGvnuRwM=;
        b=kLYdFTTSLXNmamQBEgHpqprMLEnaMM80D7ysBacB+vVKfPwxa8nRCAHk+jk7WfJz4Y
         qkpUSvXiMHYGdHCeSL6OcaKLFzCbv/1tQ9Zv88mIo9m5JGzgHAI11u9n8rWUvJLz6k1s
         ZJKp/4vx7EWFvryKxHIC0mxjuvtbkPR2sIyrF0JI/9WcxLTFzT2ek2oZaOTMYvZSNEk6
         PVXFdcvaVHm/T40XT/HArcaTam3z23C1jdtmYBDQegM07dt+iDeSWjucf+W8MTdDdYAR
         X1pIYUue/3RC5KBpCK9ru/XuzzL6mJ3bv9zaPhpHp40AlvH0v79LZgCu2R6MFDwHj7aa
         MENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771983732; x=1772588532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F99IpJbD5AmJltFy7mpJIVD8IelNT1aL7uENGvnuRwM=;
        b=frlZHq7Q41vRSS+YEL0fZZ40JEuv1gz737mN3cBMqqYbuqmoKyVJfNpvus8W4PgAPP
         QXv1B0EWrQkpXG4Ai8+lX3S5Wrz44njIurBcUnBaoYT3ChqZAeEcwoXkjR3/5Aa2WNJR
         3BjnvNGKNohG10YPgi/JkiPc3kkvc85QeVHY45pWmT8KtFHeqTtcRzUVDkOmSxzMgmax
         X2yc0sVBPNsIMXWJCrSr+BWs54YvzbNplqSYnzzpwkFiFzMqkJspqXL/WqGOa+xDYfHG
         zrL1zX+Mt2fVFq4izMdrrb5oHxzkD37Xx0iX/a3jaWq7oqbiGows/K6PLaqnFQRga2UA
         Emug==
X-Forwarded-Encrypted: i=1; AJvYcCUIVpmMxG1+J3USfBPArAwqJTiCRHheF3CEq0AdCAfcEDvUAB0JqOGxkNash+3OfFcDGBI9qtOBPQxRvgVoILA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcn6z4IREnRZGq2ah+um7MJhZEG1ruYm/yBOcluprg0qdi56JN
	2Vv5dsMUEZ8JK5rpkGIUz1VOG6HcHfUjuxGj+Gl1WiNX/6ctRwsMgPpnrRYDUMMi7JCx09DCuuE
	9fosJ6tkO3Qmzh8OWP1ZTkkubi/ASq4xMmpSewMiF
X-Gm-Gg: ATEYQzxa5pY0GTNmxvnVF1hSmhvvCDp4KtJJcRevvBxKltmXq1QdOp6OaOWxVG3DR3Z
	qlIh8VgR/K7DdaaVQN6QUnxjP1dUpwUHj6ZOTNG3nJCgqr+82Wefcif+mqi7Qb7aP0XuQsfLVE9
	ZQnDMlxpdXAaNETtCs8774vGQaotNRHdYMH9tYBr30dqffgO9puypZcxNpnYjeJdEKBLm1UJ60H
	DF+/JPYJQCWgcGVR9lfYq+yNYCrNXxypB4x9JbLUfMWPPDqs02ufY8vBRrHCMsQSujShQlkYqoV
	YQTZM76Xwcpjs6mSuOMYK9Ui81KzmzEruUhpcQ==
X-Received: by 2002:a05:622a:104:b0:4b7:9a9e:833f with SMTP id
 d75a77b69052e-5073a331817mr1017391cf.7.1771983731358; Tue, 24 Feb 2026
 17:42:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225003349.113746-1-tjmercier@google.com>
In-Reply-To: <20260225003349.113746-1-tjmercier@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Feb 2026 17:41:57 -0800
X-Gm-Features: AaiRm50kACbFZbXVHNUOAqky21tWPRXOj0gubJWsGd8_Mi6NEHNo7tC0V2PB_Hs
Message-ID: <CABdmKX28oeHEhzet+G9vu6Dm1ZwFu9OQNoeWaj=g2Y=9_9nUog@mail.gmail.com>
Subject: Re: [PATCH bpf] selftests/bpf: Fix OOB read in dmabuf_collector
To: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	bpf@vger.kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org
Cc: quic_sukadev@quicinc.com, jaewookl@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 4:35=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> Dmabuf name allocations can be less than DMA_BUF_NAME_LEN characters,
> but bpf_probe_read_kernel always tries to read exactly that many bytes.
> If a name is less than DMA_BUF_NAME_LEN characters,
> bpf_probe_read_kernel will read past the end. bpf_probe_read_kernel_str
> stops at the first NUL terminator so use it instead, like
> iter_dmabuf_for_each already does.
>
> Fixes: ae5d2c59ecd7 ("selftests/bpf: Add test for dmabuf_iter")
> Reported-by: Sukadev Bhattiprolu <quic_sukadev@quicinc.com>

Sukadev just let me know that Jerome Lee <jaewookl@quicinc.com> should
actually be the reporter here.

> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>  tools/testing/selftests/bpf/progs/dmabuf_iter.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/progs/dmabuf_iter.c b/tools/test=
ing/selftests/bpf/progs/dmabuf_iter.c
> index 13cdb11fdeb2..9cbb7442646e 100644
> --- a/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> +++ b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> @@ -48,7 +48,7 @@ int dmabuf_collector(struct bpf_iter__dmabuf *ctx)
>
>         /* Buffers are not required to be named */
>         if (pname) {
> -               if (bpf_probe_read_kernel(name, sizeof(name), pname))
> +               if (bpf_probe_read_kernel_str(name, sizeof(name), pname) =
< 0)
>                         return 1;
>
>                 /* Name strings can be provided by userspace */
> --
> 2.53.0.414.gf7e9f6c205-goog
>
