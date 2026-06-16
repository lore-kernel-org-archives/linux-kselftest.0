Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1493A6F0A
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 21:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644298; cv=none; b=kvGk4SiXJSJ6QRC4js7aWekZoOnklLdfEV8lc86DFAx4MCxJjMbCAV/lEKveLjOZkxDAei4CWLKWPQHfI16CHBkPorQEG0siV3j4Y3IRJEXiupyryL4AlPW5Wsallx3Rct64GXVL4R6JAtJf6mEH/VqijaMNcE8nJEmpCL6dPCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644298; c=relaxed/simple;
	bh=dTScQgtBwOK2hwTaGqbBqTlipviyaPVWGKAq5jz6pQo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Kfo+gKF7GOLqFEOQistkbMbo+u4XEgnn2o9HgbvMYg90dv3ICP7tCaT8+nZpltsYwTsxeveodU92nY2KeQKM7h0snZkcpQEKV2HEjdWJv0xyD/kLOHX+zPw2LbuNrv8sCWPYBXRxlZiAUQox9Ziqt2ZcLhAZVDcqNK9+BSzs0n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=WZrBbQRw; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="WZrBbQRw"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1390f75d8bbso94405c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 14:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781644297; x=1782249097; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAcBK62HKnF0ILRgaewfo9ZdRQ5WRb1ndFmhkIlqveA=;
        b=WZrBbQRw0+GonJJoDpDaKN4rUCpVcE5+xXWpOcyM5T2crzQb9EgyAlIy228bTWzhBT
         idm4/J/j1UhDpClvdYfuQUO/UXFvF2u4dzdtD0z2OL8wDpYY8wPXSKLMWYlG9csjKHI5
         uG9klvoR49UnDvp5XMhyTNz1b0U68Isjz8lBGm6mcnAjgVDv9Mk9dUAN4yWNVFrpJHy8
         Z8P8tk8/u1e2HezStfKPT2OpA+nzyN4U3CgXHRKmMydictI0UozQiCh2EqLJ5tovrAN8
         C55vmclf4LKHR4j+HAX8OECa+UNUousDpfEQ/wfvvwfs2MTiWs6SH5/+GjpRKy9YJpQ/
         iIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644297; x=1782249097;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAcBK62HKnF0ILRgaewfo9ZdRQ5WRb1ndFmhkIlqveA=;
        b=MLmG9/qfpFmpeXZNZ+nRG+GTCHxMNwTQ76/2wqufGTIPg9iBGnZxyD8CFMZS8YuchB
         CHASBe6XHUg84B1tkn5GNFVmuU/w0o9w50Ylrpv1T60RfzZ3apzKAmR6l2PIAjvZPINr
         l0F+Iimx4IJQ+HRX6Uyj4RIWPBgkJ3rlRNXoiQK4btKcWJ0FKBePuWNqxuvM5Rw/YeZW
         6j7jzfcTJjukmZS05QZaFDvnfW9hKbzFkLIrfhqbWxKHYO43HGBlZIo1xz97mkfM1VzE
         xezyqXjMWY0XPqRbkKsgpr7TdoLSetg7ztQUoWU/RXiurYqDi3kK7V1vD+SOp74YFtU7
         6lQA==
X-Forwarded-Encrypted: i=1; AFNElJ+tN1715ZwZHBa3aeKbYqCc7oMQQbU/5HMv/Lk2RkFntVv1qkV3ow/4XqJmeXNsHvbucOM/YG/V6Q24yav8jno=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAxZIj0uACcxIzDdVCI6y2K7m5KtAT+GYBrvKYSq8UOqadPLCK
	Ow/46V3GwbJcFKBIycagNxxn0YmsW8g2CVSd1IVJ8NyARdglqrxjAdN4DUaW0idvBfA=
X-Gm-Gg: Acq92OGDcjB6x5Tl1QMUcRWqvBcRWjLZbTKb3iXJbxfMFxnifBpi2wczr+sHskhtULU
	ex6kUJb492xnOcFmd3WQ/LetN/H2/5HtAEy08cIB1sLDo/Po6Yyp7djWjKpjgntUDMdoBylSwqA
	ub4COWAXEqHYHII1YUsLClyniyAuiwzHjqBqK2g/Dx5ge5eNePBd75Pd9omTe9TWKdBA4VANRaR
	dO5GwWPmvMphGF0WNpnCPtRSgeM8Tz1yjEFxDeojbvcQ28ks3sCAPhKFj5ZwFGLpIChjp7Egbl6
	Ui43Tp9ZyszWQL3ph0GINsWVjk9kS2bDmZ08znsX/tvbfx/eBICS5GU3BLpbAG1GrG5JAZmK9DD
	FefD1TSzwybhYqjymTC7DPEY9E7ooBzOByEhnQRhZhC+xDWY2ZZ/bYnUZm7NPZjIpWsleHIBJio
	royjAE
X-Received: by 2002:a05:7300:80d2:b0:30a:e5d4:1663 with SMTP id 5a478bee46e88-30bc9cad60cmr722692eec.7.1781644296622;
        Tue, 16 Jun 2026 14:11:36 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::1a8e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea4f7a0sm18675598eec.24.2026.06.16.14.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 14:11:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 17:11:33 -0400
Message-Id: <DJAS6XB7815V.1K8T5ZD0UVJQU@etsalapatis.com>
Cc: "John Fastabend" <john.fastabend@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Luis Gerhorst" <luis.gerhorst@fau.de>, "Shuah
 Khan" <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf 1/2] bpf: Fix stack slot index in nospec checks
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Nuoqi Gui" <gnq25@mails.tsinghua.edu.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260617-f01-11-stack-nospec-slot-index-v1-0-e3a080b0cd7e@mails.tsinghua.edu.cn> <20260617-f01-11-stack-nospec-slot-index-v1-1-e3a080b0cd7e@mails.tsinghua.edu.cn>
In-Reply-To: <20260617-f01-11-stack-nospec-slot-index-v1-1-e3a080b0cd7e@mails.tsinghua.edu.cn>

On Tue Jun 16, 2026 at 12:57 PM EDT, Nuoqi Gui wrote:
> check_stack_write_fixed_off() computes the byte slot for a fixed-offset
> stack write as -off - 1, and records each written byte in slot_type[] wit=
h
> (slot - i) % BPF_REG_SIZE.
>
> The Spectre v4 sanitization pre-check uses slot_type[i] instead. For a
> 4-byte write at fp-8 after the lower half of fp-8 has been zeroed, the
> pre-check scans bytes 0..3 and sees STACK_ZERO while the actual write upd=
ates
> bytes 7..4. That can leave the second half-slot write without nospec_resu=
lt
> even though the bytes being overwritten still require sanitization.
>
> Use the same slot index in the sanitization pre-check that the write path=
 uses
> when updating slot_type[].
>
> Fixes: e4f4db47794c ("bpf: Fix pointer-leak due to insufficient speculati=
ve store bypass mitigation")
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  kernel/bpf/verifier.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 2abc79dbf281c..50e80dbbc1784 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -3479,7 +3479,8 @@ static int check_stack_write_fixed_off(struct bpf_v=
erifier_env *env,
>  		bool sanitize =3D reg && is_spillable_regtype(reg->type);
> =20
>  		for (i =3D 0; i < size; i++) {
> -			u8 type =3D state->stack[spi].slot_type[i];
> +			u8 type =3D state->stack[spi].slot_type[(slot - i) %
> +							      BPF_REG_SIZE];
> =20
>  			if (type !=3D STACK_MISC && type !=3D STACK_ZERO) {
>  				sanitize =3D true;

