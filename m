Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792832811;
	b=5cxCdQxPHaiH3ZuzNcAxoxpPdBaoQ4VvGC94Zy5Edy4mzYCcYhCl7SlalIWHHmJr08jW
	 BLX2Efv1ZjQEsHLvrxx4N6lSId2Mxk72bDXcCASTWDCHrMeXreN2WW9fmDfvwNeAcxan5
	 qoqEwl8pS3DCMZkAkRnWZujrtWJqnctAOaHp74OiMAZln0q0XYZmZDogdEewrBWXcfqPp
	 UfFYPj/dTpx7YIXXM8WoTVkpZftLG9jIOIZ9y/KmADQoEFcAXZh8pW12APb2xyzh+qPYy
	 GFuCLcYklpj+/C8aRuEQiQSj5u0BTbrZk7bBvuEdR9aM8TwpJdlLhQy/P3Une0WnLPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792832811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bwcOgZhzB8pVzIxjNmq1w6fxr7yFdfROLxQ8KM4F66w=;
	b=fncTSFbbA/SefT8VRC4UVYhQ4qxd8NRHOHBL5P1SGQaJPRUVTzeLh2ByRvmDzxVBoAv4
	 8NjY0xQCe+bwvCDBBd0NhXr6MrB70N6pLCePCzPO9DvWhit/o46Kb5+c7UHgpQThjZgjs
	 pSjVB2cfOW3+4k+ILHYsfiApOfSwQ+Hq32YD46RfkMvTRcZF3r0tSwrqkpzL8EG6cxhfF
	 OhMEBmMF0iWIcZHfSvQhViiTLsCyc78U/0wtIDwL01xQtJfYlEVVB3TAmRtipSWN4+sJQ
	 oHjqa0Jer+naYxmJTG8TuxgQcYhmdo6Z2CFtSqGXr+hUg74pY5pb+MUnn7D5VbFNA3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=peA8j1u8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09718606A31A
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 09:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09718606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=peA8j1u8
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ac4806e210so12807577b3.1
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 02:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792832810; cv=none;
        d=google.com; s=arc-20260327;
        b=JOt+7kIcpZh/m5nSdKqZH+2BRll4Zpct4CjwXwSSuZe0j80UPvZ+otdDZT3dMXir5R
         3WrXsVvMiHi/8ZH6vrQyhaezEvT6tmieaxNBi5ao55dLJPXpB9ECn/jTZzv7wmAw4jZq
         2xdVOmLhMwMBkufgb+VqASlhce/RO5LkZdwdIWSOJJ8LHrQsPGMp5601VxW/qOkDkANa
         EuKfd7ws/N09yLiCD2rAdnciTzpc1u5uurtbbW6RBZnmtJ4TflKuExWE/KuespRfAXaN
         ccJ9TAdKa+Tkqx62zDIKcgQkrvkTGx1pGemaPgosX4K7lxWkBgC6wnRiiN7nRs1qqMc1
         XVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bwcOgZhzB8pVzIxjNmq1w6fxr7yFdfROLxQ8KM4F66w=;
        fh=1cPnH1iqz1pDgNf83AEaAVF2zKc8iAxFGC+KASNIsj0=;
        b=V8jmSA8ebvoiPAk/FZp/BhvRviL5+C6MJqn8Sxp0+30g1JzXX4368PUS0p8dKidlUJ
         xnMdOw0vduRsbdxLgoyna1VeNOsFH2rBseCDbaqc85IkHZmZgphddOIGiBuWbfzGYaH0
         71o0N2e9P32KcsD3Kr/fvNFcR0mAh9iYkh01rMzA4tGNZ11eIauU9BnmQSUCMXLlchLx
         5kDej33HyMaoF++5Z6GxvPsi9j0f1X+lBLnfNuIVsnQMuCcHwBATqWwBWndV/nXdUepW
         azwnsE6eKTvCrymsnV5ApTCg8sNel3zTsKGQ6wCcJdTjOsBfwnQLkApFHT8St7tpmQFv
         7DVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792832810; x=1793437610; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwcOgZhzB8pVzIxjNmq1w6fxr7yFdfROLxQ8KM4F66w=;
        b=peA8j1u8fL46r7ULUkBuBOrWgZjcZROMYGZ7QeWZumuU39NtAgwbi4lKLjEZaLpi47
         QUg2Z6kytDvoBooMMz+RxpxpxOyX0nTLXumOofYA3zDvaLw3eSjq6g8XG5abZjxmwb1X
         lwYYayYMe06KZol633gBGMa9TG9uuDAUqcj7dXfLtMD6f3NfIwLnsj1LL/momBthowgu
         QZx5ma2WqvHDDmnQ4+lOruyPixXvHY9CzMrDSVsXvXD2T8AS9pqeR52DysctWcB8Pdn6
         1ceY6Rd1dN+cDp2NgeNqz3BGo7J1Yzd+gMjD3f229idHPJxrCUHKfs6N1Z8N+QrzXgr4
         Yaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792832810; x=1793437610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bwcOgZhzB8pVzIxjNmq1w6fxr7yFdfROLxQ8KM4F66w=;
        b=IEx7U7g/p5mdmX3LEXHO2LxN8uszVMHAtk/o+gvkx6aZf3aCHuMFlvhz5i06cbOsfk
         eUG28yzsUmasKxbqKlWrIUi+qGcQ41Oc1zYQbwI5PenTc4zlPwkco1Q4YlNn8NkSBggj
         jYRUO6bjwFFBr6/s7MTEZLzXP3pMsx27sipD53FQZjFMyVi/lx+17O3/L0IyZWbp3cTS
         6r8pQJDmZSxZYzAsmz3P8KVDelS4vAPrJyM6HfGVtkVo1IRr69w7dkbPOMOdVPX8BvQE
         8shq7pjbKurkkWQaYWdFief0+udFGMU5oBts7X2nd3oj9BcdY6k8vwhAfxsQYsodD8vl
         NF2g==
X-Forwarded-Encrypted: i=1; AKwUvBzf2io6nAZto71gX2p5CqZiiKAETpYdS8CIKwT9ghHN8Ohw9sW+aJSoiGjDGC/EYTSoDsz7KGyJLMJPgsjZj5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl8vftHVr0Pbc791yEzFqY3JcU3bF25e6d7TgcXta1rP/qGuXY
	bCNI2hz0VGigbJOphOyieZ+7RD3K94LwSsczRemZVoRa7MWhPd1vM5BHsu0KK97BNBxcfEl5AkC
	CXTeHHXKuKvoVxTucBT/NQUjKuDREW1A=
X-Gm-Gg: AYBFou1C4PHpiCrujMRsQNKCZG1aTN94EXlUgmvo77k/LcKuhKKLPio//zSG6k6t/1j
	2dcd8gYhW1SBS90CxSYR1XY5ZErMTAzrF4Jg0Z6LYdJr/2BYJxY+TlWnguCUHZHQoW07n9TCUr/
	n8KXfHpUIieoywrVYdH4g7XdmLbRyQdAiSyk1WVoch0RqumAc/wxoDDIXAaOFcKUyx12PQBtkJm
	ycvHUw+oxjk0+QONDcVavdvvYAo/2pbI62dRrFzI8w5VePM8K3TKSqf5f5NhWZ5sjclh4fUUWbp
	o5UVeAowPWBrdU7tqgZhVGWou9ovjeYqBmJt+JA2rwUoj+zwAjjmJloZgeaEZlx3RCmyaPmtJ4S
	XTOyy7VUWnH4IeXPHRwzuzIyM5+1cTZQqRZKAWeB2GAyRipKs+fshdqk8dB0j1bZ6F+sgL4Q=
X-Received: by 2002:a05:690c:f07:b0:873:5c0f:28b with SMTP id
 00721157ae682-8b166cb996cmr13153177b3.53.1792832809935; Sat, 24 Oct 2026
 02:06:49 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017020634.792390-1-nickolai@csail.mit.edu>
 <20261024041334.831273-1-nickolai@csail.mit.edu> <20261024041334.831273-2-nickolai@csail.mit.edu>
In-Reply-To: <20261024041334.831273-2-nickolai@csail.mit.edu>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Sat, 24 Oct 2026 10:06:37 +0100
X-Gm-Features: AclHuK-67mTcSnyua7KyheG5Qgmdf3UD4Himo3_0JnMqb1NB2HpTAb2W0dS9rpE
Message-ID: <CAMw=ZnRpCvUBzHb+-vbvgoefZetrnqJc2DNjDKiKKup=J+SVqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pidfs: do not report fields that do not fit into
 the caller's struct
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Oct 2026 at 05:13, Nickolai Zeldovich <nickolai@csail.mit.edu> wrote:
>
> The documentation of struct pidfd_info promises that "If the structure
> size is too small to contain a field (requested or not), to avoid
> confusion the mask will not contain a bit for that field", and asks
> userspace to trust the returned mask when deciding which fields hold
> valid data.
>
> pidfd_info() does not keep that promise. It builds kinfo.mask without
> looking at the size encoded in the ioctl command, and
> copy_struct_to_user() then truncates the copy to that size. A caller
> that passes a 64-byte struct (PIDFD_INFO_SIZE_VER0) and requests
> PIDFD_INFO_COREDUMP or PIDFD_INFO_SUPPORTED_MASK gets a mask with
> PIDFD_INFO_COREDUMP, PIDFD_INFO_COREDUMP_SIGNAL, PIDFD_INFO_COREDUMP_CODE
> and PIDFD_INFO_SUPPORTED_MASK set, while the coredump_* and
> supported_mask fields behind the 64 bytes were never written. Trusting
> the mask as documented, userspace then reads whatever its own buffer
> held at those offsets. The same happens for a 72- or 80-byte struct
> and the fields added after it.
>
> Clear the bits of the fields that lie beyond the caller's size before
> the copy, in the one place that knows both the final mask and the size.
> A request for a field that cannot be returned is thereby answered the
> way the header describes: the field is simply absent from the mask.
>
> Fixes: 1d8db6fd698d ("pidfs, coredump: add PIDFD_INFO_COREDUMP")
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
>
> Notes:
>     The three size thresholds follow the field layout: coredump_mask and
>     coredump_signal end at PIDFD_INFO_SIZE_VER1 (72), coredump_code at
>     PIDFD_INFO_SIZE_VER2 (80), supported_mask at PIDFD_INFO_SIZE_VER3 (88).
>     Masking the request bits early instead (before the coredump and
>     supported_mask blocks run) would save a little work for such callers
>     but leaves PIDFD_INFO_COREDUMP set by the dumpable-state fallback for a
>     live task; clearing the result once before copy_struct_to_user() covers
>     every way a bit can be set.
>
>  fs/pidfs.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Luca Boccassi <luca.boccassi@gmail.com>
