Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A186421245
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 08:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064624; cv=pass; b=hRSMK6b/eKES8F+W34Q0C7+RYSBMI3ufGjLNwp1pXURtlDDnt77jq9crQLTXoplDcVxipQ71jwI6z9NYRt596o9EEGmr5k13VqYzury63n1QOaDg5sPFv/rZurs58wotW/Y1O8P70fceswa/J0Cn1H/K3uFmk5ZWT7yJ2RYAJgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064624; c=relaxed/simple;
	bh=0TPHr2wjc7lv7i9amMHXALYK0m/OfGIqKy9VfsJQwbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDcVd5txVI7rOZNVori/0OzOA4k970mz43vRQmp6nvDkl8d2vu9GvFZtPUWgQy872hhMg7nRAGmYinOYr2W65CNvMTP8E/c377CozalxjBgD33HKGOo7Ff42KgzxthZX9kTzi2eq9NJOpk4W8rW6t1pwmGyvMiEM2Tdk2A7/KXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UI78I7jg; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UI78I7jg"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb767cc7fso30966341cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 01:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790064595; cv=none;
        d=google.com; s=arc-20260327;
        b=rwF4IgAQZuQQnWsX18hcODK+Jvv7bxqZE0GIfeD4Gr/rX8gW399qNfgT6/Ady9ESLf
         qIykGymBJJ2Zm/VpoJD31BLESSdRvRP/91a8VrNfQKk3FCbF2ZmMzUOJ3Daew/6YUcur
         08Ej0tcjW4ssAosFOH/eHAuDEICPDDtHCooCCeeFE6QTyR2BPo08ZyfUV3LAkr3CsiVO
         1yjf0InTHXuIefmCj8kWI4aYdpct6PYo7AeLcx4/n9CtHEz9bMSe/GVoi1bfzzBefghK
         9LrjGjB6OPLbJnLVFgkwnaW1IzEJUX97McZGpiDZ3wdvoM9CixZy3yE0OYXb43wE6rvh
         itAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0TPHr2wjc7lv7i9amMHXALYK0m/OfGIqKy9VfsJQwbc=;
        fh=rCL67MeRk7mVgeiNzsZvXuEEsTWqQxZobUNtCRw/S/o=;
        b=hOX6Gd0SqASLtYg8fWRToAQHqb5PbIpup4K/7kIUqXFq4fyK9da4CGx8+IZ49cf369
         +XWkJ1PeMpzsgyU0fJvg4yxpQM/8yBDdSrSX1IJvcdfR472LzUqztHCmzgH/OuJnMy2y
         oF0CDgXFRu0UTLiw/WS4r18w6yLVJC0yBuF/VJNQmpUceFoNUgkTBhP/sm4FT+i4GNN5
         JMsHni2yG70h6rj+OH27zz1DJy6d6TjBfWz0XGA+XYBGmseHS5F8t2YMiici+Kx0twOX
         5HNrEkAzk5fTLh+P6vV1IXbVEC+eS5SgKrcKYpnLuBDlXjMDqD98JYGLHMvnOyUTmu6e
         qynA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790064595; x=1790669395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TPHr2wjc7lv7i9amMHXALYK0m/OfGIqKy9VfsJQwbc=;
        b=UI78I7jg2WcXtLSBRhot0Ibx1hwI5uqdSXP9L0/P9Ngf2Wf2tNiyiQJfV0rrLgGMLu
         IJu/JLXLNDQIYa09dB+7MS+wmonGDrQeiaJK1vsnwgq6V6QWOVc3mpTvLwhbxNyWX0Mg
         vre9548+kquflevrnvMByBzcn8QWU4AP0SihQKwfeD2mTRm9eYn0QPBY8UMNYUNPuMQP
         ATuJK9cUr3eA0hU19PIRmOamZ3616OJgOdDCtqVczw/3hUVDlCiJdEXE41W//BVlnMEI
         /SPWl7MLxYS94PfP+CVQPRjGQtBGiWRU5Zxxitz3Htc/PVpRTXJpuq15YZ+WWMCEclX5
         pGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064595; x=1790669395;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TPHr2wjc7lv7i9amMHXALYK0m/OfGIqKy9VfsJQwbc=;
        b=SCKNdhbOCnaWjrSlwj9Y6Q+yjXjjrCOwAnG8frN3TOztTGk6dqXlgMCLxa33Cifc55
         De7UG2tgB1nqkrh7vZKii7dnYXB8QDog2fLCoEHVtLDsjqWlVLNYADQZLlDFlqS9RxiQ
         B9aj5z661Df2P6kbNm9errXH9wy/YLvVT/UP1cWsOc7neoYIkcJG8NZ1OcMQvcWuj5zY
         85TSacp/3x8rwvcfexD45K9BS+WNerZc32B5YUryV5cmMF+VPbJeEGjW+0IFe6VH/yNe
         jmYNELSpr1w/wMO7wzxyKWexiNVdpWab4P9XBoNVgRWbk6YzGeU6WwNPwPmYG81e33gb
         y3cg==
X-Forwarded-Encrypted: i=1; AKwUvBzyX9MWRTyYuI8I0AxUlz1Btx+3J6Ivm7DouJf2yHVm7U7+QtNdIAcTnslULRoC8D/V/pKSSOevwA3xfyXM7v8=@vger.kernel.org
X-Gm-Message-State: AFuF++ltAY4zniCRZUn0tYMP0i53knMv7M+i0mx/jb4NTTnqO83uWIWN
	OvQ9sm9ycnQGKarvbrB0FmRcXhAWztMQSXfP2rj0arWG48vBwuVmUQ3XEMFZGC2pPJOq3C9BTCk
	RKmAPKpeoV/BM7hLp7IlyxrV0nzPqU3qgvf6nuJzo
X-Gm-Gg: AYBFou030t1fzVdo3/MvjYThpNEcFg/ojKWKmFzkLDRYVpp+W6BBrS5EblCJz7vLWT8
	39eqZ88uJ6RSORsgmij5X/DWrkli1SsZmcCW8TogpEr6qqNArgxCoQGxSodWsyZHNIq8pWCmO0r
	NbjVJBbPXaX87w5Kr9X5CRsnuGdy1JS95fJ9mDYJ4FV3wDB+25wsu7GGSToN5Hk55QepVC1BAF4
	vys77gdb1ldz2PzlP4Ctli9ZL/gIIw/8lLMvqJRhk6nZ84k2wzEDLZIyzy3FhTGraqrJiU9+luJ
	jTFLo3hRbDtQaxWJRpIUry+ND9aqiv7nEuhskKCq4otwR3s0XB0PnSN1pFQZtP587F4bGtZXSWd
	LdsWjwQlMJVfikAFDzT2S7iRNsG/EkXTz+E1sklY6/hSA6h1sxNjk7VdgrE9CblFOqIEf6A==
X-Received: by 2002:a05:622a:8b:b0:532:9ade:b6db with SMTP id
 d75a77b69052e-532d8ec0addmr44120171cf.68.1790064594490; Tue, 22 Sep 2026
 01:09:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921222609.50824-4-jeffjo@openai.com> <20260921222609.50824-6-jeffjo@openai.com>
 <CANn89iK00zXGA8sdpH9Y1CkFK3n=uKG9Bci3+=69fGV0UDQ80w@mail.gmail.com> <arIE_i8Ysz5nOI2W@com-94485>
In-Reply-To: <arIE_i8Ysz5nOI2W@com-94485>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 22 Sep 2026 10:09:42 +0200
X-Gm-Features: AcwNN1VZRZKeamW0woMTH2MljTZUPUykptvBQbfvKuUK7LNYhzxm8OhK1Dtip-A
Message-ID: <CANn89i+nY499TfuGMvMq3P=Pxw6vBxe+uYH1zioK=bhU--GXYw@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: net: check timestamp echo after an old ACK
To: Jeff Jo <jeffjo@openai.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 6:33=E2=80=AFAM Jeff Jo <jeffjo@openai.com> wrote:
>
> On Tue, Sep 22, 2026 at 02:08:47AM +0200, Eric Dumazet wrote:
> > Note: Even with existing packetdrill binaries in the wild that don't
> > check TS ecr,
> > tp->rx_opt.ts_recent is still directly testable in pure .pkt via PAWS
> > (tcp_paws_discard()),
> > the same way tcp_ts_recent_invalid_ack.pkt works:
>
> Thanks for the feedback. I'll send a v2 series tomorrow removing the
> redundant SYN_RECV check and replacing the test with a plain .pkt test
> that uses PAWS for the assertion. I've verified that the revised test
> detects the bug with unmodified packetdrill and passes with the
> simplified kernel fix.
>
> For the PAWS probe, I used TSval 300998 rather than 300999, since
> Linux's one-tick PAWS tolerance allows the latter through.
>
> I'll follow up with a separate packetdrill fix. How does that sound?

I saw you sent the packetdrill patch for formal inclusion.

Let's wait for it to be merged and our runners to be updated, as the
kernel bug is minor.
This will allow us to get a nicer packetdrill test that exposes the
issue directly instead of via a workaround.

Thanks!
