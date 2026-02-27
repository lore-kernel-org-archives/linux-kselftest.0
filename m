Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F15D345CBC
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210247; cv=pass; b=SSbBjZ5SjrPqnRss1+p8PVHBScpm59LdLvfNFyByOpfpwGrDsA6QnJycXFleDIFF545C2zB/owvTE8WFAybH7LnhWeK/cOI7soOqm7TV0u+cBidoA+GCfjPwgJ8o0/THnlcO2pGMwxf5Y46W5kCSg+zpwzipyoqBcA7zPnmh+OM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210247; c=relaxed/simple;
	bh=1kCk/eq/OouXEgwNSEIh6nBqIOCSDYqZ9uAyfIyAIGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VqGDuwj7U/zwi0Ld8c1WdvDpJOghcviLwDlpWC/qRiG1wTKgDgVOPyC+kLOTR2cNYmMAJgV3KZP8b1Ic2txDVEWso8q3/VyTxJ9dwwTYj0fw0cxQWAPDOAgvanaK3vGgy+cVKMSkheq9uWWtEr/7A/6iwKuAc7oZM3AT79rpqpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eisJCZww; arc=pass smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eisJCZww"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-66f747175d8so1050481eaf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 08:37:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772210245; cv=none;
        d=google.com; s=arc-20240605;
        b=HDsqDe1zmShh18vjNDsuiDXNXPoxDpEX+A8fW+nH16dx1nV19tPvCm2XHsLRIqYRLh
         5rnLE/ubI9n2VC9QCI34DRhv0WaZ+ZtMGNQql1804i3vL4A0ippYzm6bLxEojKHppORD
         5o7Tskq/LtvNDt6hxxvtrqkA4+eG6sigU5Vp3tihwnTSg7/hZ2lei01gvTIUcbaGQS8g
         pPbiaKRlQr9Fzx1ICFLGUEbUwtMgancVQnqk6CTsZU0umts1lrsAMJh7ipdILvNqH/iT
         CxSWTaQHL+hPLv/LknAjDSoEyXjMVQJJhvxHFrH5o6CovClDbCL0hHFY+MezPCzgMjYR
         u3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AtUg+xjznFV6FYa3fYU09QAY4geu0kHcNistSYyENIs=;
        fh=NDfHbOA+kWkDMCIuegcaA9N/W/Ta5jCDLHsQ4vRMDg0=;
        b=F2t2CHyIUHoHblRcA054cw4ZXw2IXezkjhGyJxwerhBKoxofenbmXM0ZoC7lWcjZeV
         V9bz0a4YcdA0IXuryOjWBLPM0aJaKxUagFkkko4Wx2Ev9zA96EF1ztSuMZ0g6qq8yC5R
         Ew5g78kdocgh6oJk5Ui56m7FJuEKVgaRoL3wxiRMpEe67AxZZbd4oJB1XNSQyd6MxitA
         0qv4jygKWwtBUQe70kj+QulijsMWkH8sLQFfkkSnFiBLELo/kJjm2ocKHqBoep/a+qto
         qkhx4KyuMnWbZ4yyaYRSKftE9EhSYObp6j18orYs5Y4LCAU7FKauaJunxf4bSyTuOZC/
         Bppg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772210245; x=1772815045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtUg+xjznFV6FYa3fYU09QAY4geu0kHcNistSYyENIs=;
        b=eisJCZwwh9CRLXqiM0Kqi+li3RxTmx8E71XFwP5Ingu8nwQ+v/PyYC07sqjXQJMJFx
         kdkjlMnlZ6xowVYGe3piJJIFOEDQcCDYVmqMa6hYsujFx2SD3itHerg/FidUxoHPYBOR
         DCu/CJhHALF172lKsleY03K9XRto9yCnMap2Jv7Qf+tYKYFmLAqcG3wE65vgBVc7B12n
         5KHS9xtNdW7D6teaegvqYGDB4lUvHdCMKFDmryg4JaOSo68dzsPwvr2IaEK5MRw2OhLh
         xJIAYDx+cblszjhioVuH3JlC9uqv5S8Wanfl9VUXRroKsCFZD9+O9WkVhm3LjCbSQ1So
         RnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210245; x=1772815045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AtUg+xjznFV6FYa3fYU09QAY4geu0kHcNistSYyENIs=;
        b=N2G1yss0uymHP3k/xleTCfq9sIy6Rj/fIQmEE6MBX/935PBqKqy4bF7/FoACstjH2u
         d0JSKhGSiQVGhvNk7J3jXms9BdMgHsZb3yP9b08PkzM3/VKZjq09lLKNTixb6vnFd0lV
         RdQHbfFgNn1xb3QaIMwka0XH9yGH7l6xHxCXV/4HCJzdR6htCfxzI0rVfKUR/Sui1Y01
         Wcz1h2GhTpYGrO2LGv0UHU82B2lHJ86xTo1nwgR077zqBABiFnP7i/Pjt62nvd/SYwrg
         ZZ7sOsTrTX7b0drrBNZL0Ohrfr1XI6HJC+VGtEMi1Ft+8XEZMUGNeMvKaZDbIjKATMQk
         eVYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBuO+i6V0X+D4BxpvwtlnpBr5fM85vevW9Rn7Nu8ZvFQJcYH5EK/hhBBWw6isL4WyeS7oTd0Y/uueNSKt3IoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPac9Ix/yjYUXRSpKpGoSo16b3jAx7KlF4938cwg5DrSTo+IgL
	Z/ipC7mWxPqzkZNe1A4UrFtSIx1WeSKohuIlz5+4xVI5/XlzeXlmGOyO5jXsCNllXvi35uUmuiB
	wwHtreJGPqDiecnevZNcNyGdhD1Iyo3s=
X-Gm-Gg: ATEYQzyK/fMqJ+qAAP81NFxqeZL0tqtTP53z2U3Ygt8B9rEE/JZkr8dEVs/2z1OcuDj
	KeRAKwAnfuvHBM2bwrgJ9u16g+/D98E5f/ZIBWdRHknhk+B5tSjB4ImXv8LBCpyy1K2SGWqOAh1
	VXCCNlKxvhXTdN+ub+6cQ+6q6RjZFMyC9MCGY41d/vfWA5aB3RrHbFVVLHONCQM9/IGu1mj6LxA
	fO7Q5mtkEK1pa3Y/cwQ7eR9hXptle6xkt3e2aCTHmcffMx7fnFTPcgrX3NdKwKFULgm/GndbAnP
	N/0Vxvg=
X-Received: by 2002:a05:6820:4b91:b0:676:83f9:c8ef with SMTP id
 006d021491bc7-679faf6de7bmr2129142eaf.65.1772210244934; Fri, 27 Feb 2026
 08:37:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225133229.550302-1-ptikhomirov@virtuozzo.com>
 <aaGHu3ixbw9Y7kFj@redhat.com> <aaGIHa7vGdwhEc_D@redhat.com>
In-Reply-To: <aaGIHa7vGdwhEc_D@redhat.com>
From: Andrei Vagin <avagin@gmail.com>
Date: Fri, 27 Feb 2026 08:37:13 -0800
X-Gm-Features: AaiRm513NgjvEk0OvGli0FMTNAplncs3-HvUI0iqn8dQlxQQVOMBiqw8bIuTMxs
Message-ID: <CANaxB-zh6MLRniZ1WNkZ6iBgbFMLKEVtnpOoLzKGS15X6d0m=A@mail.gmail.com>
Subject: Re: [PATCH 1/2] pid: make sub-init creation retryable
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Jan Kara <jack@suse.cz>, 
	Aleksa Sarai <cyphar@cyphar.com>, Andrei Vagin <avagin@google.com>, Kirill Tkhai <tkhai@ya.ru>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Adrian Reber <areber@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 4:04=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> Currently we allow only one attempt to create init in a new namespace.
> If the first fork() fails after alloc_pid() succeeds, free_pid() clears
> PIDNS_ADDING and thus disables further PID allocations.
>
> Nowadays this looks like an unnecessary limitation. The original reason
> to handle "case PIDNS_ADDING" in free_pid() is gone, most probably after
> commit 69879c01a0c3 ("proc: Remove the now unnecessary internal mount of
> proc").
>
> Change free_pid() to keep ns->pid_allocated =3D=3D PIDNS_ADDING, and chan=
ge
> alloc_pid() to reset the cursor early, right after taking pidmap_lock.
>
> Test-case:
>
>         #define _GNU_SOURCE
>         #include <linux/sched.h>
>         #include <sys/syscall.h>
>         #include <sys/wait.h>
>         #include <assert.h>
>         #include <sched.h>
>         #include <errno.h>
>
>         int main(void)
>         {
>                 struct clone_args args =3D {
>                         .exit_signal =3D SIGCHLD,
>                         .flags  =3D CLONE_PIDFD,
>                         .pidfd  =3D 0,
>                 };
>                 unsigned long pidfd;
>                 int pid;
>
>                 assert(unshare(CLONE_NEWPID) =3D=3D 0);
>
>                 pid =3D syscall(__NR_clone3, &args, sizeof(args));
>                 assert(pid =3D=3D -1 && errno =3D=3D EFAULT);
>
>                 args.pidfd =3D (unsigned long)&pidfd;
>                 pid =3D syscall(__NR_clone3, &args, sizeof(args));
>                 if (pid)
>                         assert(pid > 0 && wait(NULL) =3D=3D pid);
>                 else
>                         assert(getpid() =3D=3D 1);
>
>                 return 0;
>         }
>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Acked-by: Andrei Vagin <avagin@gmail.com>

Thanks,
Andrei
