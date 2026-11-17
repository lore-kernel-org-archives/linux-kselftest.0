Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794934492;
	b=NqhHH4Tl21+SGDUEplo448tLRNNo4js6jT3a7GVscOUuVMjagMYOMr0WpXzqgXcUIib5
	 D1gjAkEH9XMCViVbuC9kAoXnFSvfzMpSoNt5Nj/U5JBE6HFfRNigk0ufoCQhiviSU6Lt+
	 6aQAqA8JGpanPHT3iL1nZYD4RyfyJUzBqke9Uzc96Ulf0Kk1r4icRNikwJpqQHdUXKZ1e
	 30mEcOleISeRLyLQ3baduzyaciAt2KRBWkjIT7T0Zug0DMywPJQ20iZEc7kNX/45Aq6Fu
	 kDgpv+omcpKWPAXaQpcwVdwJUWdETyk2jfQ1LoKNkI7AG11Cqxh3Qi+nzsaa6q73xuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934492;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=DGDRp2kvtb93Toj3Qe9cR7ofTSqhSOCGBjvMYhNFgBc=;
	b=nXju98KhjoYr//PcPKtGiFAf8ufbBGLqq7PxM2lOSy+B+BxqRuOlg8sWg5IgdN1Lv0m8
	 R9abXIi8D9VpsItBrU1Ac19Vrrp5xpgkfWkee7vkn1KvZ8Av3z5s1dBcviZHOJfv81XGF
	 74GopkGOqhyf20pKJwmAmcnLy4k9l3IjuRZHABaXBhbVmm/jifP45JFcbNX4VROTHOtsi
	 O9wSC56wGp3pMqHh+u2xXDhDkNEHRkDAxR8jpcnljybKXbM5gzwvBv8Feb+fue+V25EE7
	 vaxbes3CEGMvq1JAv+LUnbqQgEsGNXBqnkAzemCgo57TScOjUbDAl0X2SU32SaBxidA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QHqQsfjQ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=boSBA9BM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4DC606A32F
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 16:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E4DC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QHqQsfjQ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=boSBA9BM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794934491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DGDRp2kvtb93Toj3Qe9cR7ofTSqhSOCGBjvMYhNFgBc=;
	b=QHqQsfjQKtr9LJKCFW64WCyAfWedjSVLliUPZ1Zh85vdoki/F9/VqkoFJU0RMpBOKJ6Xan
	KUhgcxdDMnHbQ+e46iAJ/IHtsM/vGRRIYXcko7FZK0LuRPalWUoNCLyc4Och2BzsMccoGQ
	XAu+qvfJ/z8pVAoHeOunYRii3Kf3UE0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-ttc0_nwHPbm4Z0ipL96BmA-1; Tue, 17 Nov 2026 11:54:49 -0500
X-MC-Unique: ttc0_nwHPbm4Z0ipL96BmA-1
X-Mimecast-MFC-AGG-ID: ttc0_nwHPbm4Z0ipL96BmA_1794934488
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso482985e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 08:54:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794934488; cv=none;
        d=google.com; s=arc-20260327;
        b=Y6Uxus4uQfsiGuiTCjCwyjEHARyxbradnPkOz10yoRBYLUpYH6GOjYqdk0MemW4r0y
         LSpOoNMuC60Pv4sPo9vjR96JzXzmIXIENWFM9H3ukREy88gWcC1BbW4piMJFIrrZaa8D
         5zc+t56Vc2bJ5gcfPq4vEAxswKOh6T5M5X4LOd7VC8bwtZJEP3WL/EUhgo6Afz/0j7fU
         EXNSjbtgfo+o0oW7/JE/8ACJZvMoiWbfciRRZwb9Z1kkSTY0ZzzpdJQJ2uwxhDhwBzSv
         KiVJlCimEe/Dep/UifU8HCRHV4xfY51GOJ7FXmqHRwFTAPtHfHrv+FAi5bWoGA8nG6rd
         ZGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DGDRp2kvtb93Toj3Qe9cR7ofTSqhSOCGBjvMYhNFgBc=;
        fh=FH02UNocXoF1vTjL1LOxI37u3FCwE9eiD2QaV1b9TJU=;
        b=k4aV8HvXtymsX/jcotaG9tWEQd0nN4gZCCvlLa2TaCii9pgAC8MS4OCFZAD/Rv+U5Q
         eVfBc5GyojAb/RSul/adoSaBLxJ2OPInXWq3/kv3flic9QPyCSQIktkYlySJUuuvwNJj
         k7K43X+VcKCqvqtBH6m72tQrkscsEh8TNEh2nNcLQpYyZ/c8Cu08fQKhSA1lzNWO/Ucv
         A+kRaxtqXhSLmjgbRgOXpzEB3eMqzKHjhzKU8N1S5UX45CN0+sPuP7UL/qahoBj0BJjV
         M6v77nRoJnof4RnodrBHSvypV8ejAlM3yBSAY6qkB6e3wJvf8yGH6hq4yX7SZnDhes3o
         V1mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794934488; x=1795539288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGDRp2kvtb93Toj3Qe9cR7ofTSqhSOCGBjvMYhNFgBc=;
        b=boSBA9BMzgzp/9GTmKfzsDUrEtRv3AnbWstOHFz5RtX6cqce2mGNSogsMbMOPU6V7t
         t8sl1g10XuWgovp0GQ3sglig/7cekSSHrErpAp7g2J5WXMz1WjElWhUBuI6EEVR+S90z
         MS73Y2D3szqB6xm2oC4MxjbNeYYFab8+w3rtw5oh++JtxsW7LBy+sLA1o16hBpCdaUMI
         2nQ3yFkVyF1r5bcvfAlywRT/mGzOg9oWln9HDcdjFN1gKVLL9q40dEi1N7X2ZutwIRg0
         UJDxAZWIhtfjcWCHUxCrQeAyIqiKmYiNMJsSrKtOV4GTBUXrafotFydASMGtuvAItyzB
         kzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934488; x=1795539288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGDRp2kvtb93Toj3Qe9cR7ofTSqhSOCGBjvMYhNFgBc=;
        b=rOiXtDwmHTEgbdpiy+0iUBKzEOw0X55yX4fbD3CdkFs+TjJaA/+Bx2fu+mH+f5HQ2u
         MrS3dOQwcgrb5JQaDVbwvcyvmprPrLozR0vmBtm/2tjTlP328ECnvv060gt6Ogzu+BB2
         A6OKS4OH9tcf8wJD1cIVtcaads9RF/JwJDr2QHrq1ZQLnbbcbwWWMyvXNRSm7JN+r9N4
         zt4RS+NK6vwWQF6oGXkFAyhFf5YASLv8JpsxgRji4uhi2UOvK6AJqi7dyFAflO9CxWUb
         S93+F5O6iZ7c2Gx9wseQQrYfyn5sj4kDhveUDsCaw1evOGV/6loFOl4gCI3ix/9mbx9D
         IWUg==
X-Forwarded-Encrypted: i=1; AL+hErF++EzwzWJ6Q2om96cHMmIshO96fGQfOoAjmOUzArXTtMafNqqsM491btZjtltl0Y4qSRIlOzKM8raaa4bqAFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U2SxxQebBu27Wme3wqQcBDmiIDmKVLeg9SJyCy7o7oGrqoZ5k
	Uv8Y4oirbe9w3nBemn5YQr1yI5swiqXa4cIMFLDbPsdBvXcUrJKk4MYqQyY/o9988gp+uxyoGgc
	pCpZXAFdZiTHTNPgClYW0+I6upP/bm4tdRFI8XRePE+Ix6xbMIH7KlJSeC/LdsX+wWnYvvWh/wG
	mLuKdHi8i6cfNoqDIAD5dl/LHPCtDlHQIfVfJaSBbbn0Np
X-Gm-Gg: AYBFou0CT5lh8VtrLcaNmGYfxab18Kvmd3kI1ZQgEALnIhAtkzVZLP7MPsyjdqb3zCn
	She8MByiVitZtYYzcqG0slK4gG5Xt5IiAju3xJFKWqm6Qotm++OPYg0a4Y4oKWVhb5zI7ET/ss5
	ct7Uy08+2AHIvtJUADe7e/ZhcdKbcLmFAkOyhGqbSodRzNDYBuytTmtrZSf9i1lbh1NTm+VA7y7
	FVUnMH9EV9KPusopQ==
X-Received: by 2002:a05:600c:6986:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb6a2db52fmr178231665e9.0.1794934488513;
        Tue, 17 Nov 2026 08:54:48 -0800 (PST)
X-Received: by 2002:a05:600c:6986:b0:4bb:6a2d:b438 with SMTP id
 5b1f17b1804b1-4bb6a2db52fmr178231035e9.0.1794934488110; Tue, 17 Nov 2026
 08:54:48 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com> <20261107023917.40606-9-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20261107023917.40606-9-himanshu.chauhan@oss.qualcomm.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Tue, 17 Nov 2026 11:54:35 -0500
X-Gm-Features: Aa3M54roB7QDb-4IN47SMi2aVS10SiwVpvGI_zdHUzKl8EZH9k7SzFLp96gzPDI
Message-ID: <CADRr4bc4v4Uaf2_1ZRFJXoru6a=g+PEYgKKK-vEzXgmV6bXqPQ@mail.gmail.com>
Subject: Re: [PATCH v8 8/8] perf tests: keep bp_signal memory accesses visible
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, Ingo Molnar <mingo@redhat.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 9:40=E2=80=AFPM Himanshu Chauhan
<himanshu.chauhan@oss.qualcomm.com> wrote:
>
> In the breakpoint signal handler test, a breakpoint is set on
> __test_function. Keep that helper as a real call target so the breakpoint
> has a stable address.
>
> The test also relies on the watched variable being accessed as distinct
> memory operations. Use READ_ONCE() and WRITE_ONCE() for those accesses
> instead of making the object volatile, so the source marks the exact
> operations that must be preserved.
>
> Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Reviewed-by: Jesse Taube <jtaubepe@redhat.com>

I personally would send this separately so it's clear that it should
be applied to the perf tree.
Thanks,
Jesse Taube

> ---
>  tools/perf/tests/bp_signal.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/tools/perf/tests/bp_signal.c b/tools/perf/tests/bp_signal.c
> index f580ba7486b1..2e4f7747d32f 100644
> --- a/tools/perf/tests/bp_signal.c
> +++ b/tools/perf/tests/bp_signal.c
> @@ -36,15 +36,14 @@ static int fd3;
>  static int overflows;
>  static int overflows_2;
>
> -static volatile long the_var;
> -
> +static long the_var;
>
>  /*
>   * Use ASM to ensure watchpoint and breakpoint can be triggered
>   * at one instruction.
>   */
>  #if defined (__x86_64__)
> -extern void __test_function(volatile long *ptr);
> +extern void __test_function(long *ptr);
>  asm (
>         ".pushsection .text;"
>         ".globl __test_function\n"
> @@ -54,16 +53,19 @@ asm (
>         "ret\n"
>         ".popsection\n");
>  #else
> -static void __test_function(volatile long *ptr)
> +static noinline void __test_function(long *ptr)
>  {
> -       *ptr =3D 0x1234;
> +       WRITE_ONCE(*ptr, 0x1234);
>  }
>  #endif
>
>  static noinline int test_function(void)
>  {
> +       long value;
> +
>         __test_function(&the_var);
> -       the_var++;
> +       value =3D READ_ONCE(the_var);
> +       WRITE_ONCE(the_var, value + 1);
>         return time(NULL);
>  }
>
> --
> 2.43.0
>

