Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE5F37E315
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 22:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118806; cv=pass; b=aFkrzxZVclpwJn/wEDRFACjl5zPiZFh5sU490n23YtBzaDVovd7SEHyHexpHFZOywxpC9U+IRPhL70bA797aog8lPHeOCnX1U4tzvnD5kylNH10Xz6OVrzQqTyPl/DttFmblH5uFr2QPYlOy2eW4JNdu8xLGuIAqGyA517t0PkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118806; c=relaxed/simple;
	bh=kNKohDEFFmW+7dpbriwJO4wAUSXkwkDI/vzNUTsWEFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WW6ZSJDL8OzHHOu9QLZkKBXEzfwc88R20KuNconJikeJvH9kV2DpfQvqcCwlVcCSAJCbUCc5bn7M0SVr9RxwfbcDrjznBuaX0QHwLW/HHIiLQW/mxly4xDk6sPkN8FtJ0BA19YZiP1bC+FpiulZHe3npjE5y8TA7rvQziy++cT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g03i7k/S; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g03i7k/S"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so4912555f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 15:20:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776118804; cv=none;
        d=google.com; s=arc-20240605;
        b=RkznauExnHQgo6TwGIx/UZuISu4KIfEs+WlgflAONsH4JXQ1OolBNXtLE0qQ+KSrAP
         iohNe61AkBtGDgf77fDAkGagyx2YlWL7W25glpZewth4wnKF5ZqHMB469FPY9ErTrR6H
         ETya44t7cQYhleyrwgYKH29Ikc51tHXpftCZYjeiUFHDqBP8rZnSYNpE7/VD7f2EkqZI
         sxJHre6yeeH99EeKHsu0B2e75FZp29nPXdGrrbMXusQS35n7tevBGDN1m0tMSFkPc5es
         /QHU/DuPeWoXAbn2dsOWmeUwYE30wbbmu6y2xtl+ZeYHmphXRaOA10T4BNBKYI51tl3A
         vjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=00dCXJraG3Nz3xP1Zulfjafowes4Ec60LER8Tb820vo=;
        fh=edttsJYbfv3HnY0PHrkACNWkq8HTTwEJ/c5Z7b/CHEY=;
        b=ZyQyB65Ut/nioFJUKREynD9aSmmJoY0nJRRLTpcuhxG9cKr2aJZcdZear2J0tu20UC
         MHb7JwLXEr5ffNJPFFEouOJSJl1BNpi8WzHXzSVNMJK3YqhdlbF70meT4QWw38/Y6Qp6
         H8Jxq+nSiXgx9AJc44+0OdR6q5HZBhL3lQlMpM1dSU7FbhxjyJmxJue8zYh0Q6enDnMf
         OGsuYRbpF/8piJEXhuYro5pBUh9CrpFcw6W3DnOCAdfWBhU1sX/5dFpVTAqdLt7rWBRq
         5HTkDVHquh5XQtcE4p6wqRZWtb564dRrZ+H16mokfVm7WgzYy4QIroV9MyJ+9+ZjBDR3
         N2SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118804; x=1776723604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00dCXJraG3Nz3xP1Zulfjafowes4Ec60LER8Tb820vo=;
        b=g03i7k/SVwApX7g+StbK7o5DoNWnSQdUBXeflYN78e6cgXdTC1NMSDWX0fA1qNCgiG
         Fe+uEf0ppHM637+NeBB428R0bZiTnKxXceJti+Q+7RyRt0Yk3c2rO+TQH6QrafXV/fx8
         T2xBrwTX6hNdLNXENBcrmwqLNJFlho65WvBrLaE0ZBNbqcmaacyp3Q01yS0vGlGDlt/G
         KLOVD+Ft9DkpsRy4Br5WuFXv9p+fhdFIF4pRdzyuAE7uLLALM6g0X987SkSH0vDOVR01
         4ySURLElGvE3aXojgG+lo1r81r7/D4Jt8twXDlc6FOKHMyqVEs4PxjtLu3a+XhnzkHYG
         xrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118804; x=1776723604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=00dCXJraG3Nz3xP1Zulfjafowes4Ec60LER8Tb820vo=;
        b=DqGymebD0R04FFGI13bwf5PDpNkPgh+Q0BOwvCx+U/uj3anvYCNxIp47048UqBaqyi
         fGx46zbpQbjnZs3ptZEPS+E84aNcoN6p7UCwTXJW9j7Msrm/IOoJY9Vnvyj6Hu/beEIn
         mN2TM/57M9NYi/+sbxojKiqLJK5Rsd44U7/a8CYO7THiSGQ5xUWYyBwxklrGiglG33dp
         5BtHGOxUFkHWIVaXun4iPqXNXU6Dcdwr7IOD1nU98qGp7U/DbT1xzZdakIXUH7Niahpp
         iBiDFoTlJd3OF3fpzZS/qr/aFiq5DjTd6A/Ufr5neghtP+sWDXQUdVUDiiV2PxIjYfEu
         6viw==
X-Forwarded-Encrypted: i=1; AFNElJ8FS99nQWeu369mI1pPx4sXifngj95w8F3vRHuBpA3HDMNqEKR1YyHBge2ZoZLgJIpkN5Tmdj67mFcCC2++mIE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu5ed5Q+dy6Mus0rf3qYTMIkw6Z21Zwl01iyrUs7TlwlARawxm
	yP73DwthKw6pe/bjebv0r85RGUsTqpb7qGie2lFFEmGhsUHM4rwblWLIhIWqgOXhOrKSqXkLWW5
	J6jmcodzV1qhTe7CiXBaV80I8cNMui+c=
X-Gm-Gg: AeBDievx0YPneJHv/WYrLFqRmasuvoGuNb6v1kt4s/jUeefGbbNgnZqcPrU7lyxgTL/
	gIc/LuUqJboxOBNEJG9tj3B3tARt0/h/ctYwoEYowqsm4WN5i4mUK4rGPsBJrhjOmGLv1aUQayD
	tHdbaTsUxgU+c+etlS+tcxeCd5L93/0yylFnHuZIWhYC+4oxFjnhk7BVaB/RFNXcFIEGDESI7A3
	KVYVQS/KDal7uyKeO6g9JaQZgQVXiB5RMmy8Aui2OH+5kw/2iEwaWTxsKbXQnGRduylfFu2qIuM
	hD518jx+LNl6ZUZ8g/N9EbXPDuo0/VJDnbSCfEu9
X-Received: by 2002:a05:6000:2c0a:b0:43d:576e:63 with SMTP id
 ffacd0b85a97d-43d642d363bmr22139849f8f.39.1776118803430; Mon, 13 Apr 2026
 15:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-1-1a5831230821@bootlin.com>
In-Reply-To: <20260413-kasan-v1-1-1a5831230821@bootlin.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 14 Apr 2026 00:19:52 +0200
X-Gm-Features: AQROBzDwNCNsQCHGNuFB9CZ_Z628O1o6wbow_4AViz1wzqVpQC382sCN6eDZsJc
Message-ID: <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Foundatio=
n)
<alexis.lothore@bootlin.com> wrote:
>
> In order to prepare KASAN helpers to be called from the eBPF subsystem
> (to add KASAN instrumentation at runtime when JITing eBPF programs),
> expose the __asan_{load,store}X functions in linux/kasan.h
>
> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@boot=
lin.com>
> ---
>  include/linux/kasan.h | 13 +++++++++++++
>  mm/kasan/kasan.h      | 10 ----------
>  2 files changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 338a1921a50a..6f580d4a39e4 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -710,4 +710,17 @@ void kasan_non_canonical_hook(unsigned long addr);
>  static inline void kasan_non_canonical_hook(unsigned long addr) { }
>  #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
>
> +#ifdef CONFIG_KASAN_GENERIC
> +void __asan_load1(void *p);
> +void __asan_store1(void *p);
> +void __asan_load2(void *p);
> +void __asan_store2(void *p);
> +void __asan_load4(void *p);
> +void __asan_store4(void *p);
> +void __asan_load8(void *p);
> +void __asan_store8(void *p);
> +void __asan_load16(void *p);
> +void __asan_store16(void *p);
> +#endif /* CONFIG_KASAN_GENERIC */

This looks ugly, let's not do this unless it's really required.

You can just use kasan_check_read/write() instead - these are public
wrappers around the same shadow memory checking functions. And they
also work with the SW_TAGS mode, in case the BPF would want to use
that mode at some point. (For HW_TAGS, we only have kasan_check_byte()
that checks a single byte, but it can be extended in the future if
required to be used by BPF.)



> +
>  #endif /* LINUX_KASAN_H */
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index fc9169a54766..3bfce8eb3135 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -594,16 +594,6 @@ void __asan_handle_no_return(void);
>  void __asan_alloca_poison(void *, ssize_t size);
>  void __asan_allocas_unpoison(void *stack_top, ssize_t stack_bottom);
>
> -void __asan_load1(void *);
> -void __asan_store1(void *);
> -void __asan_load2(void *);
> -void __asan_store2(void *);
> -void __asan_load4(void *);
> -void __asan_store4(void *);
> -void __asan_load8(void *);
> -void __asan_store8(void *);
> -void __asan_load16(void *);
> -void __asan_store16(void *);
>  void __asan_loadN(void *, ssize_t size);
>  void __asan_storeN(void *, ssize_t size);
>
>
> --
> 2.53.0
>
