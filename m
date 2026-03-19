Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480AE3BE64C
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932495; cv=pass; b=m0cXebf3Hfoz9TWieCmLtF4k+S3rszjD9Hho6hcer/p6KNhTBejUWKTVg1Y/XdNE3csF6NB45xkV/qThIL9OpGP5nyS7DDpA8rJGI3zWf6eIjsQVpwwZYOwMiB7rueDj1Xl7RG+Udy2MS8bmkNLzhWJ+VTuvyS0ySmk+bhU9zaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932495; c=relaxed/simple;
	bh=JM0nLN4VC3fM/jo/n5vvKQclmHQR9MzZPkOXF3LfwLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oohw5R/silb7+rAWzfcDb8wcvvwsp+WjlF6ellS+ySeQfvzee/hkwxpYCmVYlVSQOenTyypwTnMRxOgJ5Zw8DlyMfXJFDE4sSSg6cYxos5QJ2S8N4FkVKVituzvEyt4a+0kv6gd5OKB4WXKrCIaK9yotF9mzDSSC7ICRx51Bny8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fc07dkVk; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fc07dkVk"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79a5ad7cc52so11628397b3.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 08:01:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773932492; cv=none;
        d=google.com; s=arc-20240605;
        b=LE/JCRZlGANywgJIW+EHwG637FwJ3H+hXbGVjMr4Lsdd1tHDm2bNd/BoJSL8vTnYNK
         SEo5UtyiaBZt+lWfFv8plDAJ8kROebnQ5rIyOagFqmR54HkvYFHeRHCOb8prY/Q2XE0B
         QLfbUTar02QAS/RhGIiU1/MnHHRpfJscAICCCVSUkZssXp/6gk+KhgR+g8e12I/vTnLk
         2qQs5fHpnX1IN8fIY9gqYtqP8M12l8fS1rP0v6/GTnhuQBZ9w5JpImeOKwjBzm1z7M1A
         JIBGDmzWI63h99QSKDtwnQC5D0ea1e3zcWL37WXg1JWmf3DyHVBwoKG08zCDN18OCimu
         TxbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kNOzaniBhKwab2/cDV0vRovKevUI10ARwl0nTO4/vVs=;
        fh=Y/a6gYg6pn33la/fUYasG78xeYwD6Ujb0DCdh/RJtwU=;
        b=KdZQhb1aves8Fx5Csctrus5jF4tSytv6KQw7CSCyYztzV7VZmSamw+t4CFDIXyKwE6
         DL9/6+fhcqJIOQgdIQn1JQbj/Ze/PmKMbhQxek5mwi5n1/V8tNWAIPuH/Miajx0PWUro
         0er08BURMZt2yDkb3XYnQvl96VRQzVJjJKRCHxCk9r853VOaqAX1yRF4VxhY4LIDtrrF
         uWBP7kYrplAa8WKVswzRee06hHdauY2/j/WKOIGIRldo9t++bkIDlGUL/amTdqCC0atX
         n9u5ffjIaT4qqG+OLB9T/CKB0bf0vJ3s6L/7fUzvF7p1BGmgfVDlSCT91d4L3zaZ9lSy
         +R9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773932492; x=1774537292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNOzaniBhKwab2/cDV0vRovKevUI10ARwl0nTO4/vVs=;
        b=fc07dkVkcG3Gri8TXYY2aMZZ2g7Zb+8DzCuqjXeiFf3nx0AztfD+JP/nbHWmziqrwS
         jP2kEXoEjB/aWtd7SlV0ogzPGc/XW9++indmNrPukNtC88SjL6alZij6ts4OE2xdaWJe
         1epQms7zHsU0ozHkIrYXbMr1WAy0ZN8gAJuVDUA4MrrwxVb9hBz1RFCLi9lff3gmHqcE
         Hu07xuJjtizOGdc1mjyYrUChcHdY+VWL3th1mSFsVpPkETSic2o4wEM3iihQT1G+9JZk
         cyIADwwXtNXtU/s6tQTXBzOMlS6ICsyRmng0meMDZa49OkQjxB4EmwtFsRyg5a+1L20E
         LTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773932492; x=1774537292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kNOzaniBhKwab2/cDV0vRovKevUI10ARwl0nTO4/vVs=;
        b=Jo2PCEIAL5+nejVOa3qpEMFVF/JsVA4rM9VglTsLEr0gOILlRAVxzpayce9ESMWDl8
         Qz4nt78u71PL6LEQks3Y5/3eKuHaR1HuJyrO+QVJKtVQEen8qJvnP5vrK0VotuYua7ch
         11pFnioV5cRw19N3u4/mqvhPtfff3oftQguk/XYHvf+dPdp17UNgQIKY5ZL2anFg9B3F
         6DoNYUKHIW+kMh05416xhfhuqLFULk0+4If3pnkk+BuaCDoEcROS42tZDg5Qy/9/7KFZ
         fuWsgNRBFv/0/fZ7UA50IpUAfN3x2K6JlXViVuIJftgBfNToO5A/VWN7ymXMfwLKE2AO
         9PCA==
X-Forwarded-Encrypted: i=1; AJvYcCVstXG9hyoYe2QPafZI4Y3b+mpGoZbJ4SXufRJ0c4wJdWh6XWI5y87RAPJZM2HSviHJOJuTjlkMjCLRH1muZJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWT6vEEdmzRCe89UBJ6dJsFZsFfiqmmA0QEVJo0tci+Gtu8HSk
	8Lqp5mWhZjmXtN6z36+uOrzLW9gsZDoTr4r+Uypqk69XKelPiqeqj0CxM63keBL7REFa5fYyZlt
	jq5hk0xzMdxCbNNZ7IqLLQEfwBnhHSXk=
X-Gm-Gg: ATEYQzzWD68uKA2xH5Pfw55ILNp38gCBN0p36g/s80D/v6vIdlcsFxr+M5UOP0dOAGI
	RiF2+EkIihIpyqaLohv6oMlgLpfpuKal/zF6amBrCsFYdE5zHQoLIA5NQZWeXSgYKt/Sr4N0RPe
	i///zsu+5YmQ9ME7ODcEVmvMQOalyijwi2TDXwuuoe8Yids2fl390xAwcwtxR14gCy3QgdB/ohp
	qRurj3fyqkfMnZCowAE3+r7LEI6WC0f1jV+PvzCTQ2loG+a7uw5/78OOGGM8Hok36JOBqWiyth0
	EliH9hOS0b+bWcOMrg+G
X-Received: by 2002:a05:690c:e3ce:b0:798:6042:12f8 with SMTP id
 00721157ae682-79a71cb3425mr67781757b3.55.1773932491706; Thu, 19 Mar 2026
 08:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319031227.330505-1-sun.jian.kdev@gmail.com>
 <20260319040337.366375-1-sun.jian.kdev@gmail.com> <CAADnVQJAg1hYmsbVaHcR0jYZY2v3A4iNOiPaMAWRVGpf0qPN_w@mail.gmail.com>
In-Reply-To: <CAADnVQJAg1hYmsbVaHcR0jYZY2v3A4iNOiPaMAWRVGpf0qPN_w@mail.gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Thu, 19 Mar 2026 23:01:19 +0800
X-Gm-Features: AaiRm51jQOs-wRpxQuIRzEtqS4hO4WyoZmuNflEiqt1alJyaQ1dOm0ZSn9Ilbw8
Message-ID: <CABFUUZG8ALyYEH=QbeM0kd9eAjmRPBPDfaYHYek8T4-=+X+8_g@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/bpf: move trampoline_count to dedicated
 bpf_testmod target
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Paul Chaignon <paul.chaignon@gmail.com>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 2:14=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> if you want to land these patches please participate in code reviews:
> https://lore.kernel.org/bpf/CAADnVQ+TKKptnNB25V3=3Dbcdybh5G6c2DyW2sYtXvyR=
aVnPN8MA@mail.gmail.com/

Understood.  Will participate in reviews as well.

Sun Jian
