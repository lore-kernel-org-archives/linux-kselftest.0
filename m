Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB5029E10B
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 13:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058803; cv=pass; b=gVFgbnNi9ds9bnvzeVyjL8c9PMsiVHRwD0We222fB4+k4tK7Vod6wM20P3Nh0tb+ymp2o+RLuV/84CPctNVFXoo/iVb1Ek78Btcc0+z6oqLFQ4PHQgbyUgLwC0NsveybTc9IYs4xqmcTJayrYcLj+OSfhh8eS21PkcCCAAinYgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058803; c=relaxed/simple;
	bh=NrvfAoBO2gpa5p2tJ/J9rrAX/Lc0FG0htGkiFU8pvAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pneli8wYx1A2BbfeIHIqWxn8zWomSmFlyYgDdZhHT02ElZmL/fNQq1jdncWc1Gh10sei6gA7UBrbiT3IprIc28uenG2l+1e3zzItaQrKV22TkTz2Wb2DpLboCFdFJhR3AS1NOF1eQ7t0q6lGaTyA6/TtpAF6wnS60YF9G/vZ2q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SC2uGtrn; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SC2uGtrn"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a10b20634fso8563959a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 06:13:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787058799; cv=none;
        d=google.com; s=arc-20260327;
        b=byCMCwMgglT72w/E74oYoIUftpB8hrJpSWS2A6woonQYwbX5EMr3/D46qJxHLw7ElY
         DmcjBg2wczRgbJ46KMEfPS0sruEpTx4F1RjXcsgWru65l7J9sozGXcHKRmuGN4dC1ciU
         H0P27YLIcwHeMmhV3Uj/gCwG0xwMdob5eNetUpEWArYt+3sQCHfLiN1Zmt7S9+e+SG5d
         S2/t6ZNtQz/xn57+TGl045E5pU1B0UiCvFpSUiA72fFpSMNgb4wq7yWvRhVROPBitI3l
         11k9v88/yea6sxS/Fo/FduKCxkqYeLLRRekhbAHlnPihTTu4Q504uc9tB54iucwJe1A+
         BNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iGklY9B2TVwZnj8ed5pwTJRS4Y3AlZdf07yaEbb8FJE=;
        fh=pYQ2p2WYhan3TFtrBt1U6UrNgCmL0d/b3J7ULgOCEH8=;
        b=XVJA7J14cFJKygkKky2Y3S6xWfKLSwKfkfVyqRHTBG0v7dsKpz26gtOKJWpl8AeQ8M
         wF2i2XEPBCWRr3kpd1ZmQGBWenVsLkkZp7jIBXBRweQ1X+10aQdUqBSLLA59nvh9qEmb
         DGgD+DDLZ024QwK1+IVDr0Uj1c4OQjUh6pRPPUgRbCFGXl3laiwn9ytPK75w7nrKogpQ
         VF0JSQlGlh92wCcOrHLqu8q7jugmGi0db9WZ3T+qQGoKd1MeAjqBRRrbCXhGCN/y7MjU
         dwvu62+l6+U47yVOYqyhzhV5SZzNfdvU/ppvDccQfL3oDsqqCvqkmdPa5hNcG1Lg7nl+
         PwVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787058799; x=1787663599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGklY9B2TVwZnj8ed5pwTJRS4Y3AlZdf07yaEbb8FJE=;
        b=SC2uGtrnEciBn9vvHmOoVP4jCbKoHK87LY5WTMZYwueT1Lp1yR7hsTMtMGQ0Kqenp0
         /TeKbHQmnx6PU5rHopEL6rb9zInFuA1otEcr5IixKoSRUh3O4F+QRSYli8lX+GlK6o6R
         H3MczNoqL3Z5l77AO/lvh2wNS+IPico/TBh16sKIt/sZh/zpcwOP68qNk+GCcCJRFDmT
         Q5cPcexCen6EpP/32Ey4guFfs/6MNOwWdUbLg+5vDXZmypwX4fdLuShzMN+vW04u08K5
         wxhbsZtHZTupYyoLYdcN1TCYvVlO26vwtRZ4cCvK/Ffpb6W397MAAgwt3T6r3e79pxgD
         tIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058799; x=1787663599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGklY9B2TVwZnj8ed5pwTJRS4Y3AlZdf07yaEbb8FJE=;
        b=DzZXeaFMxIo5/D8hQoZQepik10wY5IQfOpl7JXTH6S2mhEpQoJSQ08Dve9b69bWiQq
         0oP4uqh8gs+b/CyPrVeDwGQ0K4/MwlQ8fXxeHCvPpnSQcrPd622Hj2A+RWU3SRBy6cck
         nHzp4Tr2NaxbgoVHIocmvhCv1OMo4DuIlRgz4XchfbFahMK0pe/BgrP8aIEKgif/DcNK
         lbA7UDAO9zPE2H8PmXpouKi4a0ePp1ea6aW6hU8zWXHjy1G3yBkd/YQuqqZs7lgfxRId
         OSjSxrAyi/xWHIYMu3ZWt9ZC4TXh2A1aHy31fHRzhjRnMrCA8KdjVuMieiwTGKApfthd
         jzrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWY6cQvxKiJlVp3VyXcWYopBm1RKS3fG6NsBu2FM6TFdaUsFALu0z/84wtwMBGa5JcRio/vvytEoO8JiyDhB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMSkQAHqVVbmRpt0iPc6M1W8j1rN7q0R0aEpz5k/8J1XwEsmX9
	YIpwX7KE2u86XHtFK/LGF0erUUxz5NaiNPfCNVsgtAHZvKqOMqGUBDhXDdn2YeyE9yXK6IdRSeC
	oAL1oj3oS7bQjMVbHKTrg1JbnZtj5rfw=
X-Gm-Gg: AR+sD10FGdh6yyJLyUFYms20un9PWH/wrRg2niBbcEhMJ1VYw5we3uIaCxSfTR+UMbq
	5mc19omgnHRjpL/A7wkxwHp2BGycfOZKrdzEaEII3fl1PX/S4Ji3e415iM+TX2ljbX2ja5wu+fL
	vz4sPZa11lcUyC0b+lDy9oBnGqCRR9G/sDQRz7PVyob/9koem7s0zPS032RlZMbxPXTEEUroJd6
	pDbhewANY4soTJqq47CeEofgij9ROfyXKxshupsIkI85YOmG6EUIf6TDuNqTddW2+wDhglus3oI
	ZGKvryR+0xUlqQmHFvPLO3PGrMYpPgYSkLx1P3fPMCCvJg==
X-Received: by 2002:a05:6402:21cd:b0:6a3:e40e:f650 with SMTP id
 4fb4d7f45d1cf-6a3e40ef8e1mr3821993a12.6.1787058799088; Tue, 18 Aug 2026
 06:13:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817141156.6079-1-luis@igalia.com>
In-Reply-To: <20260817141156.6079-1-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 18 Aug 2026 15:13:07 +0200
X-Gm-Features: AcwNN1V62W8BaaJ1kbcQBcxCIwzScRNatY9AKqmKZPaqUboU8xIVjVTh7a2De5Q
Message-ID: <CAOQ4uxhoOKC7XyK7D_izd-=28RC2OA0Xmjf41rhhO2kPhM7F1Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/8] fuse: caches documentation and testing
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 4:11=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> Hi!
>
> I'm (finally!) sending v2 of this patchset.  It tries to document (and ad=
d
> a few kselftests) to the different types of caches that are currently in =
use
> within FUSE.  As I mentioned in v1 the idea for documenting this came fro=
m
> Miklos during this year's LSFMM, where he mentioned he would like to see
> caches usage documented before he could merge an initial version of fusex=
.
>
> This version documents symlinks, attributes, ACLs and readdir caches.  St=
ill
> missing: dentries and data caching.
>
> I'm still sending it as an RFC as I'm still not sure if it fulfils Miklos=
'
> initial goal.
>
> As usual feedback is welcome, as I'll (slowly) continue looking into othe=
r
> cache types.
>
> Major changes since v1:
> - Added more caches to the document
> - Changed tests format to single self-contained binaries
> - Since Amir added a new fuse3-based test, the conversion to fuse3 of the
>   fusectl has minor changes to the Makefile
>   - NOTE: I've kept Amir's Reviewed-by anyway (should I drop it?)

It's fine. I trust your judgement.

Please see Sashiko review comments.

My main concern is with the doc - it's not an easy read
and I would have liked it to be and I found many correctness error
which is not a good sign.

Thanks,
Amir.
