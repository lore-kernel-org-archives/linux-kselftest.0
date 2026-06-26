Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B14713B293
	for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 00:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782434702; cv=pass; b=B0gsJJrFldQoIq/T0Wzt+kgYyiPPnlnAISo4CfDiY8Ye/4W9/pos2c/Jj4NUM1Gyphg9N+sPDZvokoI5lmQxMzZydJFdtra88kXYRRdC4sSyUgodLiffSGVaIsGnPSGYI6tO/Tu5h3xgbexBDwTFv/UylTuUixFlxTU8KJAC1rA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782434702; c=relaxed/simple;
	bh=qDlaZCT/bRkhpcy3xTI5ru1VC2ZNdnSfV7CknniNyvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGZlrp50kzfnJIqunzNC/bdrC8MknsknPYluk1GcCXJOMWT5l4fOdJnWGnboJWyeTlVZ9QOkMR2N9OlJ0eANQ8dPlgkcjPaWlFOmtbuan+79qHENM2bT3wkpKL+t6Wo2MUduf0RzGzljSeAe+kSukokrdpMrLojAvoWOHNEAubA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoIX4+VM; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoIX4+VM"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7fe4808741eso5760477b3.1
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 17:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782434699; cv=none;
        d=google.com; s=arc-20260327;
        b=EXXO6PAIM94ZdPPNIk5iaQQGE2jRc/KgPSiKQu7HXZ1PHoO4uvdyjdMvEmovr3UubY
         RDk0ymDBJVnBxj0WTl2lk0TlOgYjDsUQQkR69Gc3NynPcv1vZc+s+Y5PynatRJLm5aWx
         J9viUr1oV7cqUNQXkSqeuXdKiQ1UHroOitWi6CN4ucA5sZyBBZHhAuFs10OsaOuTIpQ2
         goSNL43qNimIB5F9IBuxMeVwIINkcTdUgpIkxMtGCAaIZGUgzpHS5gg9NLTnBSz4UuFx
         Hgpa8zzNJ9M4lzSfyJJWOQCC6WzrUCo7gaFUpNH3OcGtHXbwL0nWc175jwyAoAcMtb8x
         lJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qDlaZCT/bRkhpcy3xTI5ru1VC2ZNdnSfV7CknniNyvo=;
        fh=NfvBJ85yeQPTH+eo5ho8lgrF1OFOzRj0P48V3A2BZJM=;
        b=DSSE1LIg/9Pq6FtB6TpxMWuFqm+YqZiSZu43oBUyylcUDLfLIw7qfQwr32sWbN86nq
         cEU2yQ5hxA2GXNbNuHhZoQMDFtuCi1CQ+vE+lwWfMgnVUjT06WFjOhVFeW1NjzLY+RZ0
         PDpFWo0sy3/Cd2AGQ2cS+cQKeIx03OUYIthjEMMbfbzCvnXUEg5PeOxARql1WBHSdv7t
         E9RNM5KwFzgb8xGwhLibLRGzOUX1wXmuoClnkoAgGbfRH2rQxZ6QB1KRro5jvSJBt9OY
         0j2RWxmgETdqjBYKhOCIMoquakJXnfH/qOBeURIG5zGkBnF03bu3m3kN1E/WmAAfkmsD
         Ubrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782434699; x=1783039499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDlaZCT/bRkhpcy3xTI5ru1VC2ZNdnSfV7CknniNyvo=;
        b=HoIX4+VMUcp9NOV1AfN64kImvHLusZ0yeKZlSIg7Zr5NshhZMx0xpz9bj5Uh1oMMpR
         vthFoY/GwjnfB704iKTsvgs8Nsm1dzvW/YxiVEl0HvAfZBKnoufqOgwTyLmlFLiP/I/a
         5e5E961abIzy+yyWCUpHl32FiTNxEJa+UntqsQc0n7C4Mas7w/5ldMVtoj1mikcQGRvt
         lmdu2uXBZEE1+1zFy/FhvCBMWroet+qZJUDQ7Evkl+I4OOOZRGLeShdRyTgWD3ZwXuTo
         CYZkJgdRsM0JoQ+I5WuH9uhR6DRPr/lROf/k4lCSd8pxg/TTh0LIdxolRwzgkwJZDYzs
         kFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782434699; x=1783039499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qDlaZCT/bRkhpcy3xTI5ru1VC2ZNdnSfV7CknniNyvo=;
        b=oc3KjIG0D0GB2nGWGd8aLPCX5NW+ytNRmghpZ+X26HgB6760tLcVAFTAbfxwygfrwo
         GWVVI0StgsHhAF2AhwIRBhCxeUi15ewNqyTRvMuS3B+y8q7lvhdOctGPXWwzh95QdC/G
         lHJUJoqURf4HYyTQSBEnI8sjsheLR+9zwLXOececxtGQ3A/CissW8ONEpdK9I8cvPHGg
         rSbwDUkOPQh5OJOh0Zp6NpxS4icjyfj2WsxBEpoFcDzdBPDjMclqehk+stKFjzfSe0s+
         WhpNkJIxe//9Y7OAqJt46Vfj6mRKce45JHkRXP1P5dLtwOQ6YpmytxOeGJvb4ntC9GXA
         XC2g==
X-Forwarded-Encrypted: i=1; AHgh+RrLUMScRDsylW8TAK/1t9WHTsu9ZD3gKZM7ce3a4gWWHqmshS/hwVKg2I4eGLvIZB1p0y/1cuYbW9YWGHCiEgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXvTJlV6F/MyFXqWRQVhRl0YiWx6ZYs/+fapPHbsrcNNiBU2y5
	IJl87xhtbS6ui4VGzzSZQV5UiCCg4J+A8vDl/dWT2heK7duENHx3CZnfleIGXZBFmUKnSR13b0H
	w9kQpGAdv/+oZcmTGufrrOJwspG9Dbr8=
X-Gm-Gg: AfdE7clSwmLMOiNng9I4kAzJMV5TXwr/nh6zaY+x7bg8nf7OU4SgN97tLNLaHaDdNF3
	XK1ot/qdCIjdkw1mA18HAN2eQrNoNtU4RiA0fqqs0szzrQVZcpomZQ5PCu/iGB0La/KWjxZlPgD
	JrvUP8j2hzTISJMd8+YTc1uo2m2/C+gKiR4yA4Xjh07vGuXoHyFaS9cLcc0QMxDSLR0DtAFOnEt
	ZiTzhpyVLnPhIOFHTptTZyPc8mrbUw7qXk7wv/iFl5LOhaIbakCOHyeDHcAlE0WJrZvVDT3Ibwi
	UKyDS6ODW3kK98lbNzPMijOaOjswFcjFXalp7529
X-Received: by 2002:a05:690c:c506:b0:7ff:ec2:ae84 with SMTP id
 00721157ae682-80a6c38aba5mr46790787b3.46.1782434698639; Thu, 25 Jun 2026
 17:44:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624072031.735846-1-sun.jian.kdev@gmail.com> <01858c50447df77199abbe570d3ce06288200721.camel@gmail.com>
In-Reply-To: <01858c50447df77199abbe570d3ce06288200721.camel@gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Fri, 26 Jun 2026 08:44:46 +0800
X-Gm-Features: AVVi8Ce2U8kHbUxy6dShWRtgiFBkuNxyVGLKtEIwEDJCnvZ_KURmKrCP2zEl1Iw
Message-ID: <CABFUUZGoasydgU3M6_tsBw52o-+_Rb0bZugruirGhkdMjFW9ag@mail.gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Avoid eliding lookup NULLness for inner map templates
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, andrii@kernel.org, martin.lau@linux.dev, 
	memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	shuah@kernel.org, dxu@dxuuu.xyz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 2:53=E2=80=AFAM Eduard Zingerman <eddyz87@gmail.com=
> wrote:
>
> On Wed, 2026-06-24 at 15:20 +0800, Sun Jian wrote:
> > Commit d2102f2f5d75 ("bpf: verifier: Support eliding map lookup
> > nullness") allowed the verifier to elide NULLness of
> > bpf_map_lookup_elem() for array maps when the key is statically known t=
o
> > be within max_entries.
> >
> > This is not valid for array maps used as inner map templates. For such
> > maps, the template's max_entries is not necessarily the same as the
> > max_entries of the concrete inner map used at runtime. As a result, a
> > key that is within the template's max_entries can still be out of range
> > for the concrete inner map, and the lookup may return NULL.
> >
> > Do not elide lookup NULLness for array maps used as inner map templates=
.
> >
> > Fixes: d2102f2f5d75 ("bpf: verifier: Support eliding map lookup nullnes=
s")
> > Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> > ---
>
> This was already fixed by commit:
> 53040a81ae57 ("bpf: Keep dynamic inner array lookups nullable")
> Please do not send stale patches.
>
> [...]

Sorry, I missed that this had already been fixed by 53040a81ae57
("bpf: Keep dynamic inner array lookups nullable").

I will drop this series.

Sorry for the noise.
