Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEE53D171F
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 17:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773163467; cv=pass; b=pypo4L3e7f3esywndX+f+QjN0Q0+dGl79AK224rAwBPIXIm4K/Lb6/BNC8XbcnzwPfUWLMKyEjOKtev1qnMObm/h9kAJftBLbJviQpsb60FYYS4nPuiJPur2pEZXfzcgiUQCr06vlNKu5znPCVbk4CAwGQJiVuYwDP0wH/sOXfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773163467; c=relaxed/simple;
	bh=qe6UOPyH09fVG+sn9JIknvgtuqP2tPFx+HmroRjB1BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e49RWmVeXcoijYC2h1r/XnatAAChn6sPzpR9VG78PYruMuLtgi2Ykvwva4Ef2hWy+WwuOXRF7+ntbboU50Lf++GuUSLh2qANGLajsaz6o9Qdw2CfF44H8rz7zpHY5sYZ1Fl/qNeuLVuv1KzOq8bAFK8In3pk2IQrgkYdxEJFV3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ld7NVVPT; arc=pass smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ld7NVVPT"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-485409ab264so825135e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 10:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773163463; cv=none;
        d=google.com; s=arc-20240605;
        b=aCAai8s+5CMudNZRGX5NcM7Uecc9/KBv+QNWd6VTJxP7X6QuCN5yuhOoZof8p/tug+
         voe6yUxXpP+QeLqXRDDRneCH6ENawxPclXhciZcEP324lUWWZbn8tgfjk20TyPcso9Kv
         gt0ohp75S0gBl878wgjbhf8kTE9iQjg4Y65u00loQswATiynO0tmsFI10OlV0qCp91/6
         qpStrU/27cYJTwpHLFMhfTEPTV24G+22rxzHjt9MIs10C2wC2NnmY0v7UyP+glttrxqC
         YVWjffKB5DZhdZWNjf+UmENnp8OYJXFDSHSl0k9y07UHFXGmdOjxj9rkTyMAatJK46jt
         pxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m34P9qg5/9p0up6Ob522geMpxbEkYzYijmYKyt2ZJUw=;
        fh=+K2b/xVuJWZlZxjhbUmUNm9/agQCw3p1pAdPnAaONAQ=;
        b=bT53n1QHuShG7BznW/6DTTKBhsgDY1ciTMEveDQWiAjUIwBylE/psY3d3e3mVhC0Mw
         cQ0ZVMU+96da3cXkHxV8QNA7NTl9HkxTtPuulEiP8/Wy4VjOCojOhwwPW6dGiSprBDmA
         jkKfMhUkdSjsxP9r76A4saH2/UQaS6vJlk+4hwOY7FTydBzn8XeM9koW/Sl6AxzuU3de
         Y+/g8WkVIb+L7xzCgY0LE7nR6KEUqORAbNtMqc2pwWoaaoma7q7kyJO3sJbpzQDP8VCa
         5xbmN/mtOOKfTcDN2nfRhT87ZPkMCMIQThcnZZLD7P42tkNleSZbYUCmJFFXgiioqqhf
         K/cQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773163463; x=1773768263; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m34P9qg5/9p0up6Ob522geMpxbEkYzYijmYKyt2ZJUw=;
        b=ld7NVVPTHQ3qZjn108yq6rGOKQ8aSqMn0E4BqLLp0jATneuZIHFsKKjd3Hkgy4PJhh
         p5qxLlQtfImvbXRtM7Z3mwTgwM0vNT6QQ7S5/f7MP/J8rOQBEwtdlZKo29DVJwdhJ1o3
         kwdyuBQeDLES+itEZawxZB+FG8FXwWLjg8jw+4ldHM2vXohqKUB52OG6X4Jcv3UVrzZO
         Qjk6Ut/JFpJmFTvPPRrACxL0y7f3m7v7b/9RcruEL7t7st/yQnvSE0bGKPFfX2w7tP6x
         Zk+8aqtmiPkrRDDUZqt3SJjUrjjOBdWWDJLW8d+2Fq7G22hEaZtm4SWaNgfwYlJbIL5G
         iu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773163463; x=1773768263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m34P9qg5/9p0up6Ob522geMpxbEkYzYijmYKyt2ZJUw=;
        b=A1ZruPpyF9CUav7cvMABAiHxIbJ1e4klwrGs0C4C7jw0tuftiyYOPaGorraHfvfj49
         EoKbOhGC4jSmygyKJJUyAtMZnnKqngNrCErufVeHMZSuCx+MOZ7hv3g2Oe4tvvkNC5AZ
         OnjBQa5f6YZb/wPFH1DFFMiezUh+K3ixqLNukSH48VL91QWjzOEm7cUY/ios4muxtStd
         tkjnoZZN1m7kJwDJD4YLG82Q/Mm1g0a2GrotSd97JHVML8j5mulKYlbooixsQhvIzNwQ
         rU5W8Ew1SvbvoyUmNDFVfVSFAEorDIzJtr7gM4tM/2DVq1w+co4WMQJuMesJl43OGSvy
         Xhfw==
X-Forwarded-Encrypted: i=1; AJvYcCUJf2acstfG3pzILur99pNZHjo6uQGMAkrcuUvp2W5R+K3i94O4WW+uB4Fww37aqMnf4ecoxniYNN2Fm9CmF/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrPSbhGtPyQbGWtz8tz4nZ0bmM2UNnPJem+DrlfLdo7nfMtNiH
	ngbO3uZ/v2O9y7pTggX1Tve/xqk7TF7L0OyZy8HBs2Z6n/z8fnqNgWzmHBilYo8V1mca6mgsNL5
	2UgVksDrGOAFkzXp7w//H/zczQQbI/+U=
X-Gm-Gg: ATEYQzwcAsAE0YZ9MrA4tt/kWPTQVkQjSAoG/a84dpOGgefaXADfRk1gLTsRiEZdDE2
	ctAQrly410eh9iFub/+idZ+l8Jt5+PrB4LXK9vPfcCzPJLxtWaJXMXFXd3T+oSwGRIp0kE7UKxr
	hNq968opB/Hi5mpNIlN/88yCj4ZJ2c9aGdRK83Z2FeO/b/Q4GFCszFPkTTfKacNSwM9JXUf6e2p
	bWwlsfOg0RJzHEZDzdDRaXgfO0MxWE8f16LbzkHuWl7dxlYGCCMv7md4sgEtvhcvtStTd6+lA30
	OyHdPxq4HeiJVGyLtmmDj/wCEoOEHlyqerXF96zbwjzOggGHUUXleR7ELutH
X-Received: by 2002:a05:600d:6450:20b0:483:a2b0:d210 with SMTP id
 5b1f17b1804b1-485419e0654mr57793155e9.7.1773163462372; Tue, 10 Mar 2026
 10:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303150639.85007-4-leon.hwang@linux.dev> <47fbcb9aa941b07054bfef30b802d488688fafdf6df889e78b38313a614b98c1@mail.kernel.org>
In-Reply-To: <47fbcb9aa941b07054bfef30b802d488688fafdf6df889e78b38313a614b98c1@mail.kernel.org>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 10 Mar 2026 18:23:45 +0100
X-Gm-Features: AaiRm513_5D97dMh5zZ6mTaj8z2tHS7OLQWsE8CcolmJzu3CwwWzrNbuIqXtyes
Message-ID: <CAP01T74sqmUAL7=PuzFPNbghX+6N_OzrsZiOHcMEMtg01CuL4A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/6] bpf: Disallow !kprobe_write_ctx progs
 tail-calling kprobe_write_ctx progs
To: bot+bpf-ci@kernel.org
Cc: leon.hwang@linux.dev, bpf@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, yangfeng@kylinos.cn, 
	menglong8.dong@gmail.com, puranjay@kernel.org, bjorn@kernel.org, 
	pulehui@huawei.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	kernel-patches-bot@fb.com, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Mar 2026 at 17:04, <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> > --- a/kernel/bpf/core.c
> > +++ b/kernel/bpf/core.c
>
> [ ... ]
>
> > +     switch (match) {
> > +     case BPF_MAP_OWNER_MATCH_FOR_INIT:
> > +             if (owner->kprobe_write_ctx != aux->kprobe_write_ctx)
> > +                     return false;
> > +             break;
> > +
> > +     case BPF_MAP_OWNER_MATCH_FOR_UPDATE:
> > +             if (!owner->kprobe_write_ctx && aux->kprobe_write_ctx)
> > +                     return false;
> > +             break;
> > +     }
>
> In the v1 review, Alexei Starovoitov asked for strict conformance
> both ways rather than one-directional validation:
>
>     "Don't be fancy. Require strict conformance both ways
>     in *all* patches."
>
> https://lore.kernel.org/bpf/CAADnVQ+-V0-1i8_+CYpK7G0CnV-2n8e9Szv43yM3Az197eL_0A@mail.gmail.com/
>
> The BPF_MAP_OWNER_MATCH_FOR_UPDATE case still uses one-directional
> matching, rejecting only !owner->kprobe_write_ctx && aux->kprobe_write_ctx
> but allowing the reverse.  Was this an intentional design choice, and
> if so, should the changelog note the disagreement?
>

Let's follow the approach Alexei outlined, while the changes look ok
to me, let's remove the one way check and just do
owner->kprobe_write_ctx != aux->kprobe_write_ctx, same for the other
two checks. With this we can also get rid of this INIT vs UPDATE
distinction.

Other than that I think patches are good, please also test both
directions in the selftest in next respin.

>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22630000544
