Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793754880;
	b=X640rXufDX3kLAP8AMSkJ9fSH69CZzH89sha5yJWSmzekwiZ43yJxoPs3scbjOp1+eoX
	 5OPMBE8uImr/0r8xkTfDd0v/jIlTUkCTHU4ncdqiK2xM49m7jCyeXlzmtFCKNLLzOIPxm
	 F4qngzqr1KEkGFqU5IGY5wt79ssCFOx3P5xRSVRWrxBrfs4TLW1cOAX2yK6Q/4Dw4cO8M
	 BI/Mr8MEt73ynoe571bth1F5oI3uc09ksll9jP1xA1C0txbHvxnYvEJSXcDc4HSEOxWF6
	 HNAJyr28qdOf6D0FHXr4lzhoKxlr4ulzu7KuMyV9t255P2WbC/5CkzCuopZRUT7S/eQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
	b=4Y55JngVQsQE3IiZQLI78/GQszkVInjDTsvBrajjVp7+qD+L7/zzNI0lxsOUoevs/d1Q
	 pCP2BJgZiWybUQ28evy5VbX1hMM2yikZfpWefuKuCrUNLBOn8cHy7O0UjNX1Chb/eR/YC
	 kxSJm0hPFB9Bn91/EQE6n9sSNBg3rAQaamQG70pXneUy9PgpjaFn49eIV0iVzvxQKb+nm
	 9OrftDK6aqKfX+oFMXrc9s23yk4mXnn+2YAexMGYWJaDS2cbrLLY+CsyXM3COfk3n2s1p
	 KCCf5Zilada0gDED+n9cbMxa6FdthC9I7W3xtdvV5p/zf5NYgzYjVYf/UI61oM00XpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IR9x7CF7;
	arc=fail smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A47C606A328
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 01:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A47C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IR9x7CF7
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1867897a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 17:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793754879; cv=none;
        d=google.com; s=arc-20260327;
        b=TMJeZ5I+6ZMSbERjGo49vC21IYGgWEtKWD7tkkQXa3mXrhLhWz3QQNwwJNdBBEZsBa
         Rlb8c11TDRK0nhenw1jaQ84z5LWDT1LuZjyMWTO4tVa01/kGJb14xT/O2nzRiw2NjdNR
         INBionLvrE35srybBzjGL+UfZ4tOW75ZfaP7dTRszPMn4z055maeqbnRJux9+EZT6lba
         hDLRKhr7HTR0XO0uS5CuHdlLOVn5Xw1lxo9WgA9ct1P2hVAW80VudBeyVmzFyGJzKj+c
         078nDgGY/LHmz5WYQK1FQoBlL13WH1FqL9lL5LPFFFIDC+3Rpy9gyndKwGpJilF4NDcY
         f15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
        fh=MX/WGnebGOP3Kr7Z8+WDH8U3jyBXmsaAcdz7McFxKI0=;
        b=UFp9aFy2UCbzklsqeteseCTm3sK1eCNBI+kqjHGUikNoR0x0tXLuutnjrBZgJjojij
         yD5dOjvecAqZbT9lInkrIg3XW5ifI1phHOpJUXcJAgFoj73diVErRKEa+NGxVXFknezE
         BySZgcK+FINY0IcthZogNZWzuyQHtYn8LoSsXtReNtDYXI++j0dRY2IiEMg+UJd5M3gn
         3X15GwOlmA1z6eIDJgkF1+YnHt72xNYihC/43P7Yi2LwN3gSqrmmSumwvZ8rcwv0Or8O
         Siwxhc/TkMef8KmdY3KKJwSAU/awdjm+6i4ua2bkQoWahgNsQqnpE4ajlXpqQTbCKAW/
         V+Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793754879; x=1794359679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
        b=IR9x7CF7c4Mx0rniIXPJTap8Sl2/dr9gnbELz6lBJ5PjaAf02D1YAm2LSs37v81qCo
         DJ71amOTkdnMI00EPyhPmP/6O+dR1fHBGhBB8N08HS6IJb3bavA83yLJPIT5q1bmVYfO
         U9I8Mv1AhAISD9gQHYCQU9CqQs9uRSuFf/GBXxNes4jOmAx8FJ1/EC6+PRLfHwtyJlGh
         4bs/oRUDp3W+5e0rZ33XgLzI9zfcEnyXv3UPZwfkyHp9gepUycTy312afEDxLJBu+uDY
         JrNO004oX9+ApUMczZEAcZ/liFPBCKXYAxWJ3CGOVdhpd9Rcsvf05tTRbO/lhbaNTijb
         aS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754879; x=1794359679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
        b=kgKiDtIE2ijf3Y+IqirhHOpxsJcRP4bw/BU6HaKu7RnguRU0IkYsSH2qDHUPaBkWyo
         rq8z4ZGiQKRIEAN4NtN8MzDKeKFW+EBOQswXHtOOp1RSusb3q+YA2A5y5fQ9u4KDyBAH
         qNARYdHVjYoxmKG/nAwti1Gaj4wAumleJ+T5c/G+ULUdxeCijJwTVcJwzov70BOGMB3I
         FKaINg61J9PawaPXHxTOTG0Qpns6aACwE3D8AW0NYLvA34WmtLTRQ9g8cZA+7T3Juo3w
         dlT3umSBooQY8VI3Lr2DvoqhlwPUI16YxU467p4OmZmQ3qrfHSJiLQQLMRzBgU5Sm23y
         XuCA==
X-Forwarded-Encrypted: i=1; AKwUvBzICHF8O07yNk/0eDf7Ux7IN4fSfySAY6nXlXH6x6KDmevTaApVFFsZ7wfvANGUxXuAY4qxBJmY5wL8rGO4+Wc=@vger.kernel.org
X-Gm-Message-State: APuU4Z88lmzu+SFhbqlAomkzdjnj5Rxi7UvZg/5YdKWdwf1400ZK7wHY
	Bn8UR5CREM6ZM4cntJ8PQa7RYWBLyYQuqVJLAjpaoOgPhwNpOk5UZXgSaR3OCoLHsTTzfNR5IYf
	51UO5hOFZHsMbc5r6BLtKnGPtKGrZ4xjN/G6ognMf
X-Gm-Gg: AYBFou08bPlj7yb+VSBYqZS8uM1GF6qhMZM4YxULZO746SumD77WOrh/7yDjOVzvgiA
	pi8gUL/lrVx1ax0w0sGwmAqCpGfNoZKVhDCIc8mVgh62CJGfcRIGHc79aZdJA/vyd1bCmCvaf+D
	QSZVA7f4+JoCIbSPwyhfLKIgwxtGRM8hCw4aF5zGx/2CSbgTV9lQsdPdev2gFXgbsYBKWCRGu+v
	V5wWNQr0LifOuauRM6VMBX4MjU47/YJOAqs68/kBfFKaPrw0AXkEuunTKKBgnDr7hqHrzzAxoX/
	L+QLUm6mUW61nNNOPcfa6ZRSb+7yf9HMXXNrEahQnOCPYYRLvkO2d2S5Y5kG/bj/dz1zSKRBJgk
	cBewljfJc1kV6lSgIXxY+Tv5R4NqpKQEiyctDEr0ObLEqIOO3/yXg6EZZ0MxRMxEKc0p7gT0=
X-Received: by 2002:a17:906:9946:b0:c4d:939:526b with SMTP id
 a640c23a62f3a-c4d0939530bmr80653766b.0.1793754878307; Tue, 03 Nov 2026
 17:14:38 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
 <20261030100215.6f8e0d4f@pumpkin>
In-Reply-To: <20261030100215.6f8e0d4f@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 3 Nov 2026 17:14:26 -0800
X-Gm-Features: AclHuK-cSPxC_sFXLW9VVvDKj-9cMyP8tHQ9MAfu7xEMrtFl6vQvJ8w_LlboHFk
Message-ID: <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Thu, 29 Oct 2026 15:05:45 -0700
> Samuel Wu <wusamuel@google.com> wrote:
[...]
> > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > would be different symbols at different addresses. Please correct me
> > if I'm missing something here!
>
> Only that the user might really want one of the copies.
> Sometimes there is only the copy.

Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
pagination to cover these. A prefix query for "foo." also finds the
copies when plain foo does not exist (expanded on this in my reply to
Andrii's Oct 30 mail in this thread).

[...]
> > > Have you tried measuring it with my patches that speed up the kernel
> > > 'search by name' code?
> > > That speeds the lookup by a factor of ~18 (testing the code in usersp=
ace).
> >
> > Not yet. Can you point me to the latest version? Happy to try it out.
>
> I've just forwarded you all the patches.
> (They include patches to the tests and scripts/kallsyms)
> I'll copy you (and the other people getting this email) for v3.

Thanks for forwarding the patches! I'll be looking out for your v3. I
tested them across baseline, baseline + my series, and baseline + my
series + your series, using the same two benchmarks and setups as v2
patchseries:

Loading a BPF program with 11 typeless ksyms via libbpf (8-CPU x86-64
Cuttlefish VM, 273k /proc/kallsyms lines; BY_NAME, unfiltered, so each
query also scans ~35.8k module symbols for ambiguity):
- Base: 156.1 ms
- Base + my v3 series: 2.05 ms
- Base + my v3 series + your v2 series: 1.95 ms

Perfetto symbolizer (8-CPU x86-64 VM, 175k /proc/kallsyms lines;
BY_ADDR; init / 50k cached symbolizations):
- Base: 129.1 ms / 28.0 ms
- Base + my v3 series: 0.04 ms / 3.4 ms
- Base + my v3 series + your v2 series: 0.04 ms / 3.1 ms

I'm seeing your series help most when the vmlinux name search
dominates: on the Cuttlefish VM, a vmlinux-filtered BY_NAME call is
5-7x faster (hit: 8.3 us -> 1.7 us, miss: 9.5 us -> 1.4 us).

[...]
> > > > +     __u64 query_flags;      /* in - query mode (enum kallsyms_que=
ry_flags) */
>
> There is no need for a command here - use the ioctl cmd.

Agreed, done in v3
