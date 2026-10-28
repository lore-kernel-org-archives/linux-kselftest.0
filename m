Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793211145;
	b=tlMsk+o2blfRUE/DemT1840CclErIrYCRB2ekePCGNshexZlNtDwHuhxluEsmVVRlAC6
	 D7ryPkVEQS02ySIUvkZ9GZV1s6K0f9vohQLx3xfWNhpcQw+rwlpwLoaMtRAUSHEnpJ7ib
	 KtNYaMgjrvAbJ64HXoVKaImQFITK2f27KAX2eKNMKoEnnyUyeGj/QAvS9LQQBs+6uvk6H
	 KxJp7c3p+U69Ln1z2wpQrTbr/e9B2F+vdIVQZ+WNQPzc4xg6EicAXr+J07sXKS9RBf3q+
	 6jxHjdjlV8tc+0+eGafxNaP5OunZZgAWEcuV/30PrPvLhwvy5GwJRAIcYNsKePCUexw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=;
	b=BVqOdLjg6dJFwis4AEhvIZxYios11mWPf5gb7ie6SS9tBUIuq1HhUEgpa5E3almv/mI5
	 WB0DhQU7NKmVDKTdmAnTJ0x+xHU7qlIWgOu17pHtSLt3q6bHkEqjLfaBhSPpTaKigZhTg
	 /JIO0eiF/BDCA2Dv+S25ZCpHVmuDeyt1JwlmBDM8LR4Hs5OE/2i+jI7qlYaseWRDPiaaV
	 tpr+F/5NTRMC4tIh1FyPPbXyU6UHCsbf+n+lldWF3X/Wll4VQYuO+yDRomxXgHTJ69krs
	 0wnY3pV6DEQBX+7K+BIt55mBNQer8Qj/zm3x/R9YVDuwl/03bbmTYRRnv/Jdw46aW9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALSf6WKa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED56606A979
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 18:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED56606A979
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALSf6WKa
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-677d9c68d09so171082d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 11:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793211144; cv=none;
        d=google.com; s=arc-20260327;
        b=T6CgkAPtIZ4uWu6O1UgDh5R98WvdohtgIg7upVgm0jx5vDC5dJ2G7IUC4APOZuJLYx
         3wzneWha+DmWKeevasFtWADx8X7ni3yJmOd07tWYa4o8WBtQXS41b9fnlDM0JKY3lMPy
         b/8fUvwaCTmO2gGTG2qCkaZPNy1C0EUMCMIMmTzo5KIJlZgs/qo22Mto3hmFC0FAGKu7
         aWC4uNHTaGJVjKF3MEqOJg43X5zycOBVuk3IE/0rFsnq6RPFB7Gc7AHqfGkPqP0cBFpr
         9wW/3/ehFgLE0AhRUUmH3Pf+GBRwBKkodsxfKM4DwQDE4sNjQAWygc3CJpID46s1JWab
         3KLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=;
        fh=6uSE+tI7n2F72f/H3F8wqNmIUyA0I+R05IvyBiCfWXM=;
        b=TcX1iMwqVOa4jP5PiIL+IJWjbLIyNAkhER96JzJ+jHg147cBBPlM57ngfuieYQbFRM
         NoWw4dgPMt/RAELZQyyvlA065HD6m3ZCNY18viL1mD5aE1Y9umMk0eAX/fcBQquxFa5q
         QHDmUKArdhpshw1+8PLvJqBNQ5TK/C5H21t/oWzSMLtHlUL+5JEuCWoojeTV6HQWexn7
         nX69Tlu7EWxXB/nVnStkmMZdeTyZQNGavVxa9DxNHa7ERjtqOCmpSTdTKYI9i4GGSTfs
         5r6BThlAM3PmaDnxxmxf9iL7sa7gwQT51XV6K6DUYQcLg0ZqwrmQtSTq2/KBxm6jKOxT
         xVLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793211144; x=1793815944; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=;
        b=ALSf6WKanFx5JvmwlsLgV8fFdqXM6xTDgPgW9yrrFjM6/vBGqYK5MP8vdjEFd6Sd98
         NBVXpxDxP5phBJEQbTM6ZF819Et3/utRfYgAYvVe1/7CPYGeKwjbZCJN2+eWDd+DPgOJ
         /JYgpa/2NylgB+nTergZPvZ1EvWvqMF606I1SYcSYUg7ByrEMXm1mMsFZ652rdG5agyO
         B7s01u4kNZ/56+zsY+mpL/w7IdzRejnSTJl0usSaFROTaNzSYew6f1rFzZzNTYa/jteU
         Duz/k0QuEMkQ11mraTPIuGOS/qrwrzXXpBwPJitSAC/lEqMeD/uihh/wLI3vDBA6yzMf
         CDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211144; x=1793815944;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/wxxGxoBJyhbGLsecA52KNGsy8WsqvTWX50Wr5bw0M=;
        b=Z8ofOzV+c/Pa2gNI0qPgEYCXrTed79csLXXWSLFpsi57QsrtEmmnJOHB3tEUlqrwSP
         jOsdRrl09utR+8xU7DcYtwKymT9oV7R+cev45JEmaF377I6K4/E4q415OTvcgOTyHca0
         tlA5wHxFUW5fEmi+kN3QJxdO5fPaZA4EYGpYjAfcHrj1B04Y6snricDhc2RV0PAiAiLP
         AGHQ+efUGBXLuDBBOZPnG9Tr6NAwdzkXflhqUJMqxzA1TGKpLl79nKZZymV1LX5ATtqV
         q3rCpakzBwx3r87D3JHWDdo4PjCVoMidu44cnu8jgUbe73K5uZtdW3mXqxieQjtZPd5l
         EwLw==
X-Forwarded-Encrypted: i=1; AKwUvBwiyOVUnoAIgqFZ02hTeo3feDK3F7ea4NRdd8+gSzsItgih1BaYllYpxdVwpky3OfhJZgviyHJwiHmdh/vqdns=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVcQRqiugppr3FL5UiGvUZ1AmXS5qteKNExutN26Kw1lFOFccU
	70fIXqWmStEJNL+jvHw3RshpaBca/CjACFmD0IPUr6151dZITYXxz9xcaFByngjWMRot2DERM/h
	T/ZkM/h6SFlkQt5lJ16hMgYlHUpWtmfw=
X-Gm-Gg: AYBFou3OlT6Z/IFJUyutL5b+NS2auBV6pfhly4Yhw6/maQwTQTb2KDY5Oo8Al1xlFBh
	4djJTPegKDWGNsHuTiYBxVaRdZRWEWk3JgBpr3/gS/8L7MfeGk6f0xxEr9FCZ4YAGH/A51HQgBU
	YyUchT1KQQX8ZwMzDaX2/YooNcrcN5WIgk3TcAIB9ke8XDm4yGet/rfMjwrpDblCPzo/jBu1tBf
	uRvCLL/sHa8kwhDIhPD9go559K5schaRAwjLLXGJhwERXi1ziiRyTGY/5bGdnR8yKiSLJJT3Ss8
	mGGDnN4+Q6ZzhBrcdQr9AlNKmeVRDFfNIOB2yTNUzgwoLOYorquCyUP5ksrJNEV2SYGnR0PuNE5
	hiAgWriFhgLzdBS4EN6jVIHWYPGoizkjeQmI=
X-Received: by 2002:a05:690e:a4e:b0:675:6f06:5642 with SMTP id
 956f58d0204a3-67a7b9945d2mr4650525d50.1.1793211144098; Wed, 28 Oct 2026
 11:12:24 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 11:12:22 -0700
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 11:12:22 -0700
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261023-bug-word-at-a-time-zeropad-kasan-v2-1-be0ecfbae847@gmail.com>
References: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
 <20261023-bug-word-at-a-time-zeropad-kasan-v2-1-be0ecfbae847@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 28 Oct 2026 11:12:22 -0700
X-Gm-Features: AclHuK-o5YV67AfwlA9WNsjqOxV_ScugEYWYzUg986KltKOOqPQjM_oQFfVaIog
Message-ID: <CAPAsAGyEUL1fj2-1=NGBDDO-z47cOHmcFDFexY9T_1_1LCMQJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
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
	kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Peter Collingbourne <peter@pcc.me.uk>
Content-Type: text/plain; charset="UTF-8"

Qiliang Yuan <odys.yuan@gmail.com> writes:

> load_unaligned_zeropad() reads a word that may run into an unmapped
> page and recovers through an exception fixup. It does the word loads of
> sized_strscpy() and of the name compare in dentry_string_cmp(), path
> components in hash_name() and hashlen_string(), and the trailing bytes
> in x86's csum_partial().
>
> It is inline assembly on every architecture that implements it, so
> KASAN and KCSAN never see these loads, while read_word_at_a_time() at
> least checks the first byte of each word. A use-after-free or
> out-of-bounds read of a name handed to path lookup goes unreported, and
> so does strscpy() reading from a bad source, which the kasan_strings
> KUnit case expects to be reported. On x86_64 with generic KASAN:
>
>   KASAN and string KUnit suites      failures
>                                   before    after
>   CONFIG_FORTIFY_SOURCE=n              1        0
>   CONFIG_FORTIFY_SOURCE=y              1        0
>
> Check the first byte with instrument_read() at the start of
> load_unaligned_zeropad() on every architecture, as read_word_at_a_time()
> does. All callers only load a word whose first byte belongs to the
> string or buffer they read, so the check does not flag their intended
> reads past the end. Add a no-op instrument_read() for the powerpc
> selftest that builds the header in user space.
>
> Suggested-by: Peter Collingbourne <peter@pcc.me.uk>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> Reviewed-by: Marco Elver <elver@google.com>
> ---

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
