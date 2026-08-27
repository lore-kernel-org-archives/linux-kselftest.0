Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C192D288D0
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 07:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815314; cv=none; b=DMlNDcRO6ITqPQLx4WFO+Iitf4KXSmBY0CbuZgWcI8RbAA2wcCiAcjP6MY24YVv8oFTe+d1kVldRTFqO4d+iDFBseExWFQSou+ZO8ZYkdOofw6fn0zDewMXr8S80G3cXNgFcurpNgAutxLYx32M3GBiSMQdGhKgLZv0LTk1Ks8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815314; c=relaxed/simple;
	bh=QN4LLJKILJcpX1pZV2MhOQxGl4YiamTZyX0WyUCUqng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgK/pV0ZwqPsMQmZn4XvJ7BoQXKQIz5YVKVTnzIwo7o+NOqYmsxs/RUv4jQ0AWtvnUAp5yeJD6KRWWHotSgz6leQrpBVO/rAVBRWASgQcTKRVmi5vYSYB2s+s2ANq3osZ9qcQNUp9WED7JyTXmwMD9BsUgXxHdDTHiLiTGyV8qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97bf910aa70so495304241.2
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 00:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815312; x=1788420112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D8yjs5lhxn9uGJPZAn9jjZ+Jj2fso4i8f+hR78O5TqU=;
        b=FhxLIzD/8cr/uToSSmiaX7n8gd5Zd6kosPXB3yn/lmmoV3WIUn7yWz/ctBxzZMSawo
         RoFfK9X/HgQGSWCI1VZhZ1NMD97kZ9GKdtuaauaV3NI8//cX9xuDAIQDY/0FZLhomx2x
         lvuD0qd+W66KwX/Yq2S8RsUw2w6+r5sWuIrgGBHpS2NMxj3kg0OicMYODUwKJoYJbpVX
         r032suCPasgCn/SR4DGfA21Tpgqa9baDpNvwTl5lcLdd8htJMLRe4wt9RodLudNfshAj
         hLWuXfNRgO0gOorWgqxsoLFouHYk/FLJCU3oR0Gkn61Ai0544iYm3ogE1q0FkSpH+16g
         vYXg==
X-Forwarded-Encrypted: i=1; AHgh+RpXnGOAIvZBuQFwEWEvsv7gs9VlLrlBVfI/YfTB3ItD2xnKDfcpqhiYOjG4Xfwzk+rRoy7YEWc+1QHyqraPWxM=@vger.kernel.org
X-Gm-Message-State: AFuF++kJhOxUmBykiZuOxLdhco9V/rsP35FqTNIDGAqqlO5pSFOlGN+8
	7CBu+ASEAjdowcnXWUeaYTCXzE53tlOL9E21l7vdhFw1tvz1hiThYoFDj5LzgUqS
X-Gm-Gg: AR+sD11lFK7qZ/mmVMgMPiQFe7GrVgdE8bNF7vGW+H0GAtBeTUA1H2lBbw8KboaIP5w
	nQ5Nf68QYrDQwyeI9MJRdsnsByiLYr9LQtb6jmFXunPijJwnXw0mkjK8go37JmMOX4cnlrAa8Zd
	dbl7nOdDg2+P5d4UYdvOOpi3SOt/FEhNAIwfUcZkoZMVhnbbTGlgJ3HfZ2AnSnbHyd6XNo/1j7f
	F4hLdQ10gU3coiuWkwZqaf7QBcU4aj8fwb1SSoCjiihVCSfe67Atj33bwcwEWK9LX2F2lXP6a+S
	527j5+jAyaSIRwNy72AbwblDns9oQGDP+o0dXW3QaErsAnzTJSINdqjOlC1wnFSK2KUZpyE9JYv
	EhcZJJCUSYrNxWYPb5a7W3EHQ3h37g5ZgSs3po3GGuzd74IqP2XfKTVKyIBkqMMYjCZGAnfEX6i
	ut5nu07mfcTHNnOECoFZYfLdDftQdNeSYutc/os4YwPbd15Rkr5YODrLW8ctWcvfzvJtXCw48KX
	UM+EJ4m4aUZX5f87Z4Yb9BjEQ==
X-Received: by 2002:a05:6102:5109:b0:777:ab3c:b88c with SMTP id ada2fe7eead31-782c0bff4femr3644297137.8.1787815311632;
        Thu, 27 Aug 2026 00:21:51 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-783057173f7sm3795001137.2.2026.08.27.00.21.51
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 00:21:51 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97e781bb3e0so10714241.3
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 00:21:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RovJI19IPitsyTU8HggGhRQMjYY1V7PfMMs7N3PoHpFg+xyJO6ZyltGQBLnEWe5wJQiyHDWMIUxf0QAS9/Fmpg=@vger.kernel.org
X-Received: by 2002:a05:6102:5109:b0:777:ab3c:b88c with SMTP id
 ada2fe7eead31-782c0bff4femr3644287137.8.1787815311094; Thu, 27 Aug 2026
 00:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <64c6e0191bd8ccef0074ffbb09bd0584680d710b.1787584360.git.geert@linux-m68k.org>
 <20260826205058.a6ff019d0584f75c7f50430b@linux-foundation.org>
In-Reply-To: <20260826205058.a6ff019d0584f75c7f50430b@linux-foundation.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Aug 2026 09:21:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWm5N5tbwy3rhaKJu-n_BDmQwGsjze5LquWPMrhPmUroQ@mail.gmail.com>
X-Gm-Features: AcwNN1URxO1QJnlEtHmK-oLPYjqqMK6cTFFsDtUxL-F8NHfwrH50duGsc6bxHhU
Message-ID: <CAMuHMdWm5N5tbwy3rhaKJu-n_BDmQwGsjze5LquWPMrhPmUroQ@mail.gmail.com>
Subject: Re: [PATCH] raid/kunit: Enable RAID6 PQ and XOR benchmarks if KUNIT_ALL_TESTS=m
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Thu, 27 Aug 2026 at 05:51, Andrew Morton <akpm@linux-foundation.org> wrote:
> OK, thanks, but...
>
> hp2:/usr/src/mm> scripts/get_maintainer.pl -f --no-rolestats lib/raid
> [not linux-raid@vger.kernel.org]
>
> Patches enthusiastically accepted ;)

At your service
https://lore.kernel.org/7a2e5de234cc0286e3fe9bc11b810433775f2280.1787815121.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
