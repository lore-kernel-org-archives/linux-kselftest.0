Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792515960;
	b=5oBnaEfDEQ4El04oqt8fo5uyE6vEmmpZAlGSjXq1WUAmVT6GZNpJlf+69vOnf1S4dTnA
	 Pb/bSS2ojYO84aYhB2FrUvT/W90zdTtliWddOoflpWspifso9imZem1NipAeZS5eQoCxE
	 n8mdS5G6NQtjge6J/nwy2ap0sueVItMpfGAR9/KcnUwmHI2ACF304VwG6YE6TopPBX2+K
	 446YGm773lsChdrqeEjNFFkMgGvgpBYycZEOz/dehZb5YfVeBukzdwZR0re+jxLXgyiNn
	 LEaE00orvplpqmoqmoI9GaC6FQp1d8HGEb8WxixhJQI8WQ+PiZvVv7fIympRCsHc0MA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=;
	b=Ew1HoPJ5LQj6r6Wq/waRNmgs3sO3vv+5dA5KQ3b5jXZqz8nnpjPEgBkV+15fsFlY2PaB
	 FDPBexgV/smCcB7EQVnm5PPrSPT9H+bcjQOBqREj4wEtKCPgcoqOzutzYCGjWK4AtU7mn
	 jONa0ldhUMBWsgrA8PQ9D5s7d4R9LBFQUNfnpUsrem8PQGZqRHV8XKW8kIuG06RPGs4E5
	 YRMoy1vgcfxP9QWPhVXu2FiNbu6kEpVsgIQFpDTQh2t4OkBnRCpTccf3IaE7MPasqbC/L
	 hGqBFvVyxqchqWkKrVRL0Sz/N3pkKC2wV4+bTXdHQIO9nIQ2dIdqj+9mZrb6ke4OeXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="EjiCtsY/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8133606A338
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 17:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8133606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EjiCtsY/
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0f1dfef72so3723607b3.2
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 10:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792515959; cv=none;
        d=google.com; s=arc-20260327;
        b=TLVXvEvhnuByZdiNr1819A6WnKBBsP1VyzL+bP9UaT/b+HNBSH+3FA7k5R/IsnZf2r
         Pf/LlnNpqMFbSbzUpo6ZWe5cAMUD9BNi+4ORFJfFJmi0hWDgTpDN1cTheluc0W6vONnK
         RaEGnU0pg5vY3RavFMiFCPmc69eBWMoAbhsOmcTZE620pVxAt8c8JHgh/1j5JyeFmbnm
         nklKvQCPmtP9bRSUSCQgHPSG8SZVIqGqoFqjuxPFmkwDm6/3bKFtMy8nuuWZs/tOPHMq
         8NfNtG1JZNb/nRC8AzL8wsr+5Co8WdyaIJ7oA0YSguT8WFTZ8SYDkwx6ROe5+MKqvr4i
         PjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=;
        fh=Bf/r7SChxAO8yUVxHUy1nXvloAIvbLqVTtBILtlSUMc=;
        b=pj2Bw0In4eDtPthzIM7+CUlc3g9I1ctqsT9UEoymo/S+wG70WHk7szaCPBJnZABlSb
         kAdeWCqAbVZ9M1SoW6+gJbhh5BySCMhXooUpc5nNaHDmRXoX45s0eUYOCUEfKG748TmH
         77pZsjMZspm2aCzpNLorRHJwEToPk/jj2JyN8Tw2ngY7LjBvL+AzAtvuyrCeSvUB9AAt
         98+Oc5b36HmSl/DvzNvPCGcE4ANAwbriCJQ++55Au/pl3CtTeIUkAx1zRyutJmB8+DLp
         IuWM7aMWBNt/nshYo1Yt4r3uRhJeDd/tsUW+zw7dAeBx7viN6TkYQB5kzKJVbPh6EVSs
         QDhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792515959; x=1793120759; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=;
        b=EjiCtsY/ZOF90gjCs/BDy14TUFvLnpqFVe7zF4DpPHBfTP6HnmeZFgtdMcb9BvlJTp
         4pxSbR5yKKYpyLVtBdpCBsvyBRD54nXnijUfOskpIyUAV1j2g35x18xFYvNJmyTIYgZt
         0iuxf+Px6JyXIGwyCSNSM6+QMU9PoDZyA990d3LGTuvOicsVF4XRBN0VpNObEKNthGjJ
         axPCwU/9cS7gMDkq+phYi5LAcbFA9Pi9h/h2LkktmB6IW4qqlRmTx/BLgILC5JIcw7dF
         bhbJlMjF2Utkn9qL1MppP7RH2+AGU3g8+qlJjopyhCLl6gosrso1m+nEzVxM4AKoFKV1
         xu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515959; x=1793120759;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=;
        b=LGgQC8xVj5psObCWWoQocvk/aRv+qMc5OJm+sWoTj4EKNxoE1hnNLwUvH3qdNHNfqH
         hU/0SBPZ8SVOs7Ja7zgF8MimmBufx4BXX58aOCCnCsPtHmwYossbJe07362h8YdqWD7I
         rK7TqHx4HGqVfECD2q9ddJQNVxaexNzHheccDU7hRY7MPsxbl+o1WFo2c3X8cvWKbn0C
         CvXURAhp6B2wEBLpWHWF+18cm+GdUlRnubExrkwVbyBywKEl3fJZh6Jl6HstdjUb+O+H
         wLwH5snSWyZUCbXQcfyju4FQsF5I4umnmA9zeorpN74FxKgxtavxQzrRCuRrLmj5hGPg
         yslQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3P2xyp0Lms4k5mn1Qz6xWUlRcMDL1hclr4j3iBm46n8PbpT1+vefu6cTV33BLTDeatuyyysQ9uygE3h5xfBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3Ukjk+CPqHcblrIxFszbNQqTBZZE58o4sAJfvw0tEu7HuVLNq
	0EKIachofsv1wINfBSxLI90Ormkka7W6fC0xeW0WInvtQAp+YiUUq2Bb4VygstdoegSWKtYNB3W
	EZ9hRW81QykS2utg6ne4JIHTwy+lAgOg=
X-Gm-Gg: AYBFou0vwJBEgjahIfs/McAD+7vqJhHwgEGjzAJ/sivdVn5rlxLERMgiO4PYdqGHPRy
	DTPV4veSu4QwkPyS4Yblt/KYrFleES5EJWCdpfeZwWrNn2eUqc1Tk4xm4jI6eRlByvFjPuX4HGy
	l4263l6D5QoLFKs+cDiNyXsy8OAu24uFcUZhF8dSL40J/TEXYOogCqxi4kzOamUf/Uppl/hl+z6
	NxxV/BUTpDqVazvhvOj/R0+NQlhgX/tYlv0e+8VwgbOr3TKKyh2t9blmM3QZNUmHNZ09TFs0GYE
	y1cZcprboILNIAEo+kPpObCC8Ec9icP4hjPBVDTsICo4eSkc94XoBg==
X-Received: by 2002:a05:690c:6087:b0:8b0:da84:d1c1 with SMTP id
 00721157ae682-8b0f1f1a89fmr64960787b3.0.1792515958898; Tue, 20 Oct 2026
 10:05:58 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 13:05:58 -0400
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 13:05:57 -0400
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261019-bug-word-at-a-time-zeropad-kasan-v1-2-f21a3ed6a477@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
 <20261019-bug-word-at-a-time-zeropad-kasan-v1-2-f21a3ed6a477@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 13:05:57 -0400
X-Gm-Features: AclHuK_DtrU2XCq8YwSMY07NqOt7wGt-hW6PGZPkgwrcRUr2dimhQIUPQ6PwL98
Message-ID: <CAPAsAGz89aKUHzm6U9PQZfkGq-GnWsm8AYHeo5+4u34LHk4uZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kasan/test: cover load_unaligned_zeropad()
To: Qiliang Yuan <odys.yuan@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Qiliang Yuan <odys.yuan@gmail.com> writes:

> On architectures with CONFIG_DCACHE_WORD_ACCESS, load_unaligned_zeropad()
> does the word loads of the dcache name compare and of path name
> hashing.
>
> None of the KASAN test cases reads memory through it, so nothing
> noticed that KASAN did not check these loads at all.
>
> Add a case that reads a freed object through load_unaligned_zeropad()
> and expects a report. Skip it with hardware tag-based KASAN, since
> arm64 turns tag checking off for this load:
>
>   kasan_load_unaligned_zeropad, x86_64, generic KASAN
>   without "word-at-a-time: check the first byte in
>   load_unaligned_zeropad()"                                 FAILED
>   with it                                                   PASSED
>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
