Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2A93E5564
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 14:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776177379; cv=pass; b=S5W5aSh8+zsSIseN9Ke1Nuap3QQZThnIBCdqqGLdiu9rzbXPSZQ3Fjk/Ci2NE22L4bMXPrhQdm1RYzseDRv3kN5Oz7OSDtTCXjg+BkytQVY6wkUQj12EZg0QsOhGWuYx25FwPXkEkXham6W33QaPWL6E0hDGj9Jeo8hK1OvU2Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776177379; c=relaxed/simple;
	bh=AnsEV6VHaHqEew+Xa56Ltrfs2MD3YtoIUeXjaty5EkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JqnYYBYlyMNySY92pFf1JJ2T9HRVjVjL5bp3ZIcRgrwPaCevgcPzRuv76NHDxhcKTBmxyyiSl9FzhmLhr3P/wDdTnF29OrtLsidKLpMGqtcyEJ/JjCLuCQuvENSTavCfsA5tgnJI3o1mI24X3YgXFnP7nvkWoeRX/zJCD+XZ9Tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUlTTsC3; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUlTTsC3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso69290905e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 07:36:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776177377; cv=none;
        d=google.com; s=arc-20240605;
        b=fnDwioIR0vqcgMpuLACz8BL1hVI2O/Y5zzNfJruTlBxC8Niufs9O93++FI7AjxyeiP
         Zr68/ZzF8VFMh38LWUtpEN503r0KsVdw6VHKaH5nHdvka/r66Sw/l7FCi77AWMRtiWqw
         AO2V+GfeR1b09kstQBA4FaUtckEkXScPfYma2ItGJPTf0ef6SUyZU+8Nguy19qE6mq1d
         zh5f3aHRVScRI6DBKrLFNw2SakS/kH91t3QfEkzaE0o4EsYdtPPulLeY3bYyXRIKWXVT
         g2kNEiyKcgmzXeeg0UqBwZAL8XQNCTWVK0M3eMHAEl39x8SXh3PJ1lk9d44S0inUg+Zq
         9SxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AnsEV6VHaHqEew+Xa56Ltrfs2MD3YtoIUeXjaty5EkY=;
        fh=gSJPlutw28lozMJoX33TGEui3TxvXm3kYZPX6bLYtY4=;
        b=dSWI5tJwfCJoIBAKMZv8U/infkYQsW3Pmr9SFZ8GobvbHXIKpENvSGlMtsq5/XqskY
         VBE6Tpok7mi5Nwy4rPkqiLjzl2G6dTzaGzYOUqra44a18cW82/I35In25TEqtXZatJIz
         twad9Yxw7yolzmJC1CZxp+fxU7+zOO6knvlcCSvPUanKapMP46li3rsWXRCXqhDYNqJD
         GCt5sWpmXvAs5hrLGMYx1rTVXhtWvHUtL5mjBqaJldSv0ZtOK2X9U/cB48C6sA77l5r8
         xoR/6vi0hrSXEFdR3QuxYCygyK61yEK/0irGEm7GMJuR8B0oqYB+JuWFh9CKEcUb1eqj
         od0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776177377; x=1776782177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnsEV6VHaHqEew+Xa56Ltrfs2MD3YtoIUeXjaty5EkY=;
        b=PUlTTsC3aVAA+ZyekIkeHjny6kIG/LHQHmycQcAXH+odg5/6txPL3MKJH3GJyCQkHB
         0VHbMgZt+XaHaCWA8ttAcZZRvO9ODJnXuOO+uOmKq04OuxGu3oOF05P46AdjIMAgq75p
         1g2iSwJfqj1jIgnuoynfpGVWG9myXYm/pK7dBPifH9KZ0tNoF/wBaemcMV1l1xlz8J3/
         ZWuFPRlIE6qzOnT4UWRA/IGRTHcr8Y3+4IdOq2AILgI1Oof/ygFLMrlBqux+n4oEboCa
         Je1BfpUWrlRD9q+IG7jTww/eAr705R3WQH9YwLOz0cBjR8AkMQxl/K7pKJ6lWajvDIts
         hEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776177377; x=1776782177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AnsEV6VHaHqEew+Xa56Ltrfs2MD3YtoIUeXjaty5EkY=;
        b=IS/Ks/yAzw8EnqkYU6uZ9tdFGNV4rVcLHRiP5sX0Ft+JPOT8whtoo9P86tz41oXjBK
         oNPnkPq5l2KRc3TY7+fIOM/4g1nUQmONFojAkpo1g0euC/0tuUKgCKo9nubtPmgD793J
         63qNp6Bx5Q7WtPmdZhx4W19/RZxntuQPEOd2ZdV8AERNDjleMHTvhdOMeLQHuFbG5Ojh
         Sx3JtvG0pOjBsGcdpzxcgj0WMMf7GsIhq95eJ3brmzVklJbQCb/jwu4bxstF1XtwSj6d
         1Fb61zNvK46Yy84X7c16UG4f8udS6qpcjfj+qqkxz9M+bnIZL/hjaNK4+jV/bkW1CojZ
         SIWA==
X-Forwarded-Encrypted: i=1; AFNElJ++madtixHraplsi2SGgOAaW9YgZeb9qWJWrfIYjMLhVKqKPTEUdgBUIW5j79i+22jkJgSJBHmX+2TDakHs5Ag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5jAgK68kbvE7QTfgKZh72uOkXyg7N59R6h3Ebyg+T5rOvLUiJ
	2Po6SEP2178QgLK87tcbtdd0is9yP5TlbB8wGCswtgua4n8rdByv4J4Fb8grCb7BfLSt7YrdeBk
	pBxKBbGntD5NofxOIJ6Gcs0vDPD9LLPU=
X-Gm-Gg: AeBDieuCXx10zovVImtMThNhygWYetB/pGsVESV0iqZm8s5Xa3P+RGB0Qlqx6HKSrjd
	/HdxR4ncqwMAby5MQV2fvmDcgId/9maMyQ0xftKf7LGbWhWw1R8QyMLdcm7JrNRdzqn8jyDvCoL
	MKgoiabW5BP651ErXsn8LK/XozqHs13kC5xlkhz9TfTe8eqXD9pI/6drNmpupjTXpOFBu/0ID3u
	9kJKucong9tlkaugCUDvZq7TKxoNxeQok5PxXsY0ATJ8W0MP65ueJtAenxdBcYisaQ/6F+wyp++
	gsxUBbbTjdKUJzE8TLHSz3b+aHEjR2Are5l/y1kCZE3e5fGmwyLu4o6Fs6AxIu3/d0l9H1tta93
	hJz1ilZHdLdnj1Artg9BbwQ0HAA==
X-Received: by 2002:a05:6000:1a86:b0:43d:6e0:9458 with SMTP id
 ffacd0b85a97d-43d642c08b5mr27685966f8f.39.1776177376758; Tue, 14 Apr 2026
 07:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com> <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
In-Reply-To: <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 07:36:05 -0700
X-Gm-Features: AQROBzD11iC8gAKSEnmD0t_Id88yG4ZENQr7azgzst5W9dho6pOaDHcgJ_Mytlo
Message-ID: <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 6:13=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> Hi Andrey, thanks for the prompt review !
>
> On Tue Apr 14, 2026 at 12:19 AM CEST, Andrey Konovalov wrote:
> > On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Found=
ation)
> > <alexis.lothore@bootlin.com> wrote:
> >>
>
> [...]
>
> >> +#ifdef CONFIG_KASAN_GENERIC
> >> +void __asan_load1(void *p);
> >> +void __asan_store1(void *p);
> >> +void __asan_load2(void *p);
> >> +void __asan_store2(void *p);
> >> +void __asan_load4(void *p);
> >> +void __asan_store4(void *p);
> >> +void __asan_load8(void *p);
> >> +void __asan_store8(void *p);
> >> +void __asan_load16(void *p);
> >> +void __asan_store16(void *p);
> >> +#endif /* CONFIG_KASAN_GENERIC */
> >
> > This looks ugly, let's not do this unless it's really required.
> >
> > You can just use kasan_check_read/write() instead - these are public
> > wrappers around the same shadow memory checking functions. And they
> > also work with the SW_TAGS mode, in case the BPF would want to use
> > that mode at some point. (For HW_TAGS, we only have kasan_check_byte()
> > that checks a single byte, but it can be extended in the future if
> > required to be used by BPF.)
>
> ACK, I'll try to use those kasan_check_read and kasan_check_write rather
> than __asan_{load,store}X.

No. The performance penalty will be too high.
hw_tags won't work without corresponding JIT work.
I see no point sacrificing performance for aesthetics.
__asan_load/storeX is what compilers emit.
In that sense JIT is a compiler it should emit exactly the same.
