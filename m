Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30123317173
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 16:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627806; cv=pass; b=M27r+d8d2r+YiIo6HMUXVxPO5Xd4l/YlS2sb+0dfRM5Hikwjh3GJJpi5F7UjgqJ6B7gUFYTtUXqhG+ZeFkjMVVeWPKbfsnGcIS1h0jOjoV6YSjRv3qO4lIb76KI8Oha+eVjT2SSaiKsLkEd1x/ZFjDpPgl+magfYwEs7oMnwQKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627806; c=relaxed/simple;
	bh=Q6TmnOpeExcSP68v1WBPeIpo2KznzbDRRsuXO3vOiv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZAFGrpizoB1bxf0F1LTjy8YV8AjkLq5XD38NP4mla1pdWqDUiVsJKPuPlUK4XdQhljniNIFdJe1+k7GWpdXeZLRLfhLAGmFJdqqLj05gusReasFdC4UMkBpqqz+wpYDPoWbdsluGcHdYrb9DCJFW9+tcUUvyyX3qIeKVDV1tJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kh/NSuIJ; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh/NSuIJ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9358dd7f79so413821566b.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 09:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774627803; cv=none;
        d=google.com; s=arc-20240605;
        b=lfnU5tSt2qlvBa8AGyc4Y4L0BH+EoU4KOI2W2Wt9dvxX2F9Af9p/t1UqZAh7S0U+nZ
         P8MnQbdPvj5Y2Gzd/hEfmDyeCzzxC/JHgTBpauk0OA+NGyxSKSbm/EqJIH/6rweS+w5A
         BwQPUpL2iw5U4OqUuFGLpYxGxpcJKp47vWVp+mmE1D/luywwDGtdGZzAV8/RdkGZufTP
         Y9aby8lXD1asXreGQedUzB48y+vDsuxKT8/+BwOfYl5D+imC6uu6lbRyqJtuMXnb8vSl
         YROyjizojrlod7T/5tm8EZR1tbO6+LKPAjaDcodixEIAKr/L/2h1b5WyJHxSmu2D+XSD
         B2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q6TmnOpeExcSP68v1WBPeIpo2KznzbDRRsuXO3vOiv0=;
        fh=0zyWH/hfniX+F+8Zp0cAYzzWaE6tgAUu4e1bJ7WkQeU=;
        b=PtDHBVsxJJ3arZiIfMqMFvVoGM+DOohvSK36ND46Wv/WaBJUDMV9SJytAQInLVoRG+
         6n4HmlH1pxY2q5nmIRW1l5n8FZdG4Qw/yicdwFDuPNBs6TabqMESraXootghYXmnNPYC
         ckFdRxhM21g/UZDjeSI2EUIB31htdAcpmXksZbAZAMoSIDDE3SKr4Uq6YF8odUrN+jIU
         xhbTLMpn3LL/C6qZEqJTLsBdyRXp1iRMr1/gYQbbshLgGrypRMV8SLlmE6XDFOJBHdFW
         +ByT8R7vyVYY2x18zVv4K9E+y1Mr1Q5q9XOhc7z/TAhDiSqdsgc6dU5k/UuDSDI1KPyo
         Gfvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774627803; x=1775232603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6TmnOpeExcSP68v1WBPeIpo2KznzbDRRsuXO3vOiv0=;
        b=Kh/NSuIJF1TDloSkOyK1rUi5Uq7WuazEGTixR8EBquvk4Bv64flETq/iXOPEZSaHyM
         tS0EPMtoBCXxPfSOe5yifaBYkM5R7TCX72DsgBnERXJY/I2evxlvhm0oJHEAoAjHTx/y
         DfXdKpQBtfuW/8WkVFN+bzyFvdiH/8aPRLwySTRxvCoKwUqZCPF8TJdq9Imof+Qr3qLr
         00t+7iajwW2tgFDFPSPH8r8SYsLfUHpdDGmBvtoE2UkK+3zJj8LYXvbQni2yD/ap/w1d
         5cmp2pzj/crvIe2+ZUcDaAUYOOVFCE8D7pnfGuHvnTn/cXUbHJUQ2n92D9JYC0eLpGsg
         lhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627803; x=1775232603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q6TmnOpeExcSP68v1WBPeIpo2KznzbDRRsuXO3vOiv0=;
        b=WyRvyWEVwAy6TzHtJ6mKjlWEziFBeSG/TQ+u7/JJRRMgo9+e6f6q8rt1MD0zE6HwHl
         YuZa2RY/xUbqyv+uGHNpaXmAAHpCcUkU3h1swPwghyD5TKudZe2JJ2UJ6T3WlklD2eXO
         1UjIJQRWmj+8iMxCsn+3t6cWRl1Fv5dzKsMiaf1WEFgsVCGKKVNa0imlW+snBi/Po0Uf
         IJ2ZGnNcKOf8f8Knl8n/mN1z879OPcawmmW0g7YS3ijVEY2CRX5i0R9aiGiNawwZfwt2
         f996xy5DQrAr+Jt1CHzmAqqNVCwhntm1bAuRf7Ujiyf2k7c0KssV3pvkfiOJ46l2+xqF
         wyyw==
X-Forwarded-Encrypted: i=1; AJvYcCXtukl1kOD8e3YRcyTkQzg5amq8BoECklX1I/9rYkH94pFd8vWPEVu9AVICBEZtPJbFUBNfUmd08sADk8uhIFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNoHoPNF+fJkuUxw8wcgfA7fHqifsYvOxdZlTlVgEdfhErjDnV
	EkjDUB+2XL3o4YWkrzoh3ngAsUHf81BR6WxeLFEu4M6d9bKEOqlTYb2ge3lRBIbjK7xJKpkWdll
	jlCKGmRoDsbv8LfTEo0TloA80XauS6jU=
X-Gm-Gg: ATEYQzxRKRMwfimwYxwL1FIYX117zqxpcn5ELg9mdd8X4a/6HwfedJTQQNBK5tjdo+a
	JEFtme/yZ2amzP7+Jn7+Iynqn6YkiBv5tIyPVFFSC5+S7fmtcAkFHPSQGV3HHFRPe1F2M0HWWVl
	6fVlkPQX6A65sH+oqQMyxrWHlh3bBMN1/KpAK9aw5I0yk7etLWAxqwEWZ593N6a0aiZA921Qfnq
	47ddSMBSVzIDekcRaZ8L/Q2+rIJKc2djAEmHL5Y9LklX+aaOSP9ZmTcV2RD6GI8BCqQGGO+Payl
	O3wrrB+2YVIYJHQEt1Twf6hoL5x6pxhXYQVyFO5MsW3gPHem37npGPV0+8F2+NyrDEqSDC513l2
	jE+U7mPp5OGnj2nbW9+cmHEssxw==
X-Received: by 2002:a17:907:3cc7:b0:b83:e7e:3732 with SMTP id
 a640c23a62f3a-b9b507a5dd5mr212383266b.30.1774627803420; Fri, 27 Mar 2026
 09:10:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327141616.1961457-1-hayatake396@gmail.com>
 <20260327141616.1961457-2-hayatake396@gmail.com> <CAADnVQLh76CWYJCJXgOst43FcJOrPP2Y0wcwGPX71QqmiD+7pA@mail.gmail.com>
 <CADFiAcLvdjE7zwqf-hpH01jnbxtnWQNoj4+zBwK0+RU80-k9bg@mail.gmail.com>
 <CAADnVQLR6Y94wKo1G_4w0-xTPdR8ws38oGu3xfHOXxNKcqjyWA@mail.gmail.com>
 <CADFiAcJtjVHYVQeYJ_znVsjiJkEBmLfOafp5srY0HQMGwVtiQQ@mail.gmail.com>
 <CAADnVQ+0EwaJXgS1WSDf12+Ds2Uxbh9KMpDcyq+gyZjcQ_6+dw@mail.gmail.com> <CADFiAcJFy-n5Zz+Wj1dWEH0WcK+PhKXi7cbvdsLnPhMXRcVktg@mail.gmail.com>
In-Reply-To: <CADFiAcJFy-n5Zz+Wj1dWEH0WcK+PhKXi7cbvdsLnPhMXRcVktg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 27 Mar 2026 09:09:52 -0700
X-Gm-Features: AQROBzC83d7M3ywFEBHgpYKvreBOkrl4uhLAWBsTwhT1G3q975_gL7m2eQX0iKg
Message-ID: <CAADnVQJmqKVZC1gkvAaAmO9V=cnYPO0UYB6Wyp6Shko4tZeUQg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, x86: patch tail-call fentry slot on
 non-IBT JITs
To: Takeru Hayasaka <hayatake396@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 9:06=E2=80=AFAM Takeru Hayasaka <hayatake396@gmail.=
com> wrote:
>
> Sorry about the top-posting.

yet you're still top posting :(

> That makes sense, thanks. I agree perf can provide visibility into which
> BPF programs are running, including tail-called ones.
>
> What I am still unsure about is packet-level / structured-data
> observability. My use case is closer to xdpdump-style debugging, where I
> want to inspect packet-related context from specific XDP leaf programs
> in a live pipeline.

see how cilium did it. with pwru tool, etc.
