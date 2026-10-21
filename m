Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792599060;
	b=q3++/prs3nGWTuSZILyvYMoAKz+/+6Wq5BOATdT1Z8Tv9sGqPGkpf+Wt8EqQOrDDfjq8
	 aVrPtowIQvwoy/brzk8DqJ5qXqC4clO18JTjVziKFcmE/vPca8l9wG4ieHg5+JUO3ChVs
	 fAK20L3CxqbyP+TzE+CZ9zZ4GrgATxJZSuL+ShdUr1IlsD+NjV363TcoJsleIfva0mV2K
	 /CcwMqpawSnSyzUYAhRrzTzPm6YxREfzCxI9bWaiCwXfjtr2p0WVBMXP7bXYNeR5uwHlR
	 Pj87PSP+5aQVhC1UsuPIhVN3eONAslSzKeQe7zKK1IxVrbqfruAQXKIZYVUrHe7QzvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dBMzagSihcLR+OgRyCjXq3R/npWvu2cSWMevTjvmpMA=;
	b=Ru7MSWeGlHGK6Q8vAKu02UV3wgkeq4Upol5BHh6zzHok8hkYmQQv2NkP5GVxKuwy7XDd
	 bWXvHHumt8EZ31cRxTkgTk+jmowmNvlkKYepAb7FdaeXvvQ91T5fcfQxhUzxBhfE01xcy
	 3PW4mHdF/UFz08t3RHOAQy3yjGKwxgf4P6fnLGorJxT7lxRD7rZYE7tamI1smCKe/6zAs
	 7zDkI0h4jXb0OhAmzKE7/s65+cs7N/TGGJfPwwx3furQ7aU9+2yvr0GMmEVLbZIgXByMU
	 40JnZU2OvW+8tvTH/AdHIzIFsfAxJ+p7IDt9zR2E3ugv+eLtiyzh8V5CUUSx8S0ANkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WOlWRiXV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F80606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 16:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F80606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WOlWRiXV
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9f6a16afcso66605ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 09:10:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792599059; cv=none;
        d=google.com; s=arc-20260327;
        b=qFqd3u3sHrzZAl9hH65t2mmDA/KTBwwczs709OTRkx0PqukrhRlRGqRZbfIivokBDm
         d9+npCJ4NvCcA1R5HtBI8BgXJHFNK5H2nmDK/EZ2RgpOehxmT9FrDMKeR8bicQ6CZi4J
         wocNzeiwjSTXMkQwgh6B8fve1RJvsyDkNtnivNWSn3KllOXbPuvP03MBBvQTPIITkQhU
         +alglh+wkffUfgENuDDBI+sJHPUIlHVeDkP24xQ90LahMT/6eRV+FIYgiB0lrHE2xPHV
         p+ypzYqAZsVGsghzRh6o7/FmHsKIYeWx+QysA0w2E0Cy/rvQBHG1F+8AdpxyXPkdMFQq
         xsog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dBMzagSihcLR+OgRyCjXq3R/npWvu2cSWMevTjvmpMA=;
        fh=w28qR6U9nx7ulUNqx5sAe7Oj8RGWCNN5VhROSJSqsYA=;
        b=Z2gAm0np510DsrAt1pEr+CmeRgpWRNjJneDwsX+qwDa13lAGcFV1AsyPtOBc3Cu3kZ
         lZwllWihqcpRwAgaUWOlJ27e2hsOoNKQZj1/qF657dfA26qPw/CA5+50iohECyyeWJrc
         OWZSq+tzPcFYO0n74X9b42g2BRzWDLvP1KTyhN2DosHurktwqElKzQnzfmaVs+0YphhI
         t0Uh7FYgezV6i+B303q3OnA37dWrxbcgV3O5LmTD1SNcEabLVALXl0q7+ufpJbI37m//
         vobWiXw+EZuIoyj3FWpQLZWiKyVxEbclIVRreN1u7Oek9AKLmpwAKZub69ozHqIGpGbR
         8Blg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792599059; x=1793203859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dBMzagSihcLR+OgRyCjXq3R/npWvu2cSWMevTjvmpMA=;
        b=WOlWRiXVavEBBM5vAIph0iQUch6mB5PUDFp8xqBWZ6LohrmiMsn2Y7E2HLyhNP/zof
         wf3uLhcaX2N2x4Q7b6lNhyPa6bsx2Zyw9amFhZztMOSxQIC+R7Ur61PS5jjiqUnhsrRA
         gaEuruvHUCI1VtxKi7humVmBR0F4FUZCX1rNDPs0LbsgqBRjCIYETNYDot9PwIIb2iXE
         BI4YOVK7a7qRJHEx5wTHGKW/+PyR73dj6+Q+YuaKg7iseaicGXpQYhNWvsEs/w+sD+Gj
         xXR+AqwZwoGOAxT2OhNn4hIU43mtLUe0QbGquaDfLOV9LL1aEo2d+e6/OAe3XHeLKPf0
         ow2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599059; x=1793203859;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dBMzagSihcLR+OgRyCjXq3R/npWvu2cSWMevTjvmpMA=;
        b=Ro1008EWCePzuUuOIg6hKu08edGegY9vGKxUiJM3/MyddtKUJBdXZXjXPm5P4Wi1R8
         bqhJoeSaie4ZJEIFnn5TKQubS7nWR0wSvz7Dy6YnWd2TAfOo8ze0wmTqBGQk1kCRjpOk
         MT7F7Ai4TyUCFmzZyodDUmReIjXAXeyhErFJsO4bgpHEW3y4W4y6rCqt4uxIJgNnliKt
         62wtKgCzm1ATr5KKQTpqcEBqcM/5d2khe1CnVAUz49vvqHOoxTCo7S2nJodPusnXERBM
         rkav75YzQiuBJwluHnCercwS85jW7e48QF3R/ucBp6fyM2b2LLsy4baAS+AD+71F/czu
         2IVg==
X-Forwarded-Encrypted: i=1; AKwUvBzGFWeyvVFqbhSfshR8pFhbg0VkrVWjt+axO0zsr4kpUWvyrJGRIZU5WA+P50L6dsasTgpNpxnDIrZt5gQyhl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZIuGqHqW8Du6qs/1zTJczA01dpF6j7E1YgGnhciJ3gDfv1Okh
	xMaD7sxUVzZaU8wHLY91hUSujAIFVNIMJ7qyleIajdFNpWO7kzAncDvN6/JFQUK58Hr1QsH6TtY
	c+URdVJNgWD3YxtqPJ+lD+Do2GR3k5u06u0p69ZpQ
X-Gm-Gg: AYBFou2gzBd50aMmm80asbPWG5p5wl+DfG3PsjReDxPyTWOFVQEfCQLYYji+dcH1agV
	2VC0hR5YVcSKPIhenp7iwBtPT1Mr0wgybl8HePk2S0JQCBXFjF9oQFrO7rU8bNV+D8LHTYYaBGd
	tx+JA4JTQDp+SfhfDIRGSqoVKSPu8+REXP0U++g/7Dczm8ZhaLvA3ISVvQSFoENDqjfglbBppve
	5lTx6Hawj7QJfnBFNeyJPGRjFxeqG6/rnCBq12tZ4f2SB9Sy6wE6yP0zhv1+GRQJHnBM7S5xr2A
	sXbDMnpituwiFQQghhCmU6BgXCF+1QrhHHl7Sav0El8HFsdFSRqk5CU8TbRBbIRvh7OZRYF7ScQ
	O6tmi2Sa7ih60x+57YIdXlWvu14BV6hKlkiE9LMJRW+IGlYXXSneiofIRgTl9q/rstw==
X-Received: by 2002:a17:902:f606:b0:2e3:981:4cc4 with SMTP id
 d9443c01a7336-2ea1e3c3553mr10748135ad.9.1792599058774; Wed, 21 Oct 2026
 09:10:58 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018133032.24467-1-breno3011alves@gmail.com>
 <20261018134322.26445-1-breno3011alves@gmail.com> <20261018134322.26445-3-breno3011alves@gmail.com>
In-Reply-To: <20261018134322.26445-3-breno3011alves@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 21 Oct 2026 09:10:45 -0700
X-Gm-Features: AclHuK_C5BpDKqLu193wcVkXT5s0qoAMdlZwM9YFf1CsJCDKK7jQ0mXPyuVrBug
Message-ID: <CAP-5=fUs-+Tdv1XNcDX4o=tM_KXh59JuAewVPTsoi8EZia476g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] perf/tests: convert check_*.pl helpers to Python
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 6:43=E2=80=AFAM Breno Rodrigues Alves
<breno3011alves@gmail.com> wrote:
>
> Faithful re-implementations of the four Perl test helpers in
> tools/perf/tests/shell/common/:
>   - check_all_patterns_found.pl
>   - check_no_patterns_found.pl
>   - check_all_lines_matched.pl
>   - check_errors_whitelisted.pl
>
> Same CLI, same output, same exit codes. All use only the Python
> standard library. TESTLOG_VERBOSITY and TESTLOG_ERR_MSG_MAX_LINES
> environment handling is preserved.
>
> Update all 37 call sites across base_probe/ and base_report/ to
> invoke the .py versions. Update Makefile.perf's install-tests
> target to install *.py files (in addition to *.sh) from
> tests/shell/common/. Remove the four old .pl files.
>
> All four were verified byte-for-byte identical to their Perl
> counterparts on synthetic inputs.
>
> Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>

Hi,

The build in perf-tools-next is now running mypy and pylint (when
available) on all python scripts:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/tests/Build?h=3Dperf-tools-next#n100
We disable some options:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/Makefile.perf?h=3Dperf-tools-next#n317
Applying this patch breaks the build for me because of this and 1
pylint issue. I see:
```
$ make -k -C tools/perf O=3D/tmp/perf12 DEBUG=3D1 all
make: Entering directory '.../tools/perf'
  BUILD:   Doing 'make -j28' parallel build

Auto-detecting system features:
...                                   libdw: [ on  ]
...                                   glibc: [ on  ]
...                                  libelf: [ on  ]
...                                 libnuma: [ on  ]
...                  numa_num_possible_cpus: [ on  ]
...                           python-module: [ on  ]
...                             libcapstone: [ on  ]
...                               llvm-perf: [ on  ]
...                                    zlib: [ on  ]
...                                    lzma: [ on  ]
...                                     bpf: [ on  ]
...                                  libaio: [ on  ]
...                                 libzstd: [ on  ]
...                              libopenssl: [ on  ]
...                                    rust: [ on  ]

  INSTALL libsubcmd_headers
  INSTALL libperf_headers
  TEST    /tmp/perf12/tests/shell/common/check_errors_whitelisted.py.pylint=
_log
  INSTALL libsymbol_headers
  INSTALL libapi_headers
  INSTALL libbpf_headers
************* Module check_errors_whitelisted
tests/shell/common/check_errors_whitelisted.py:13:17: W1514: Using
open without explicitly specifying an encoding (unspecified-encoding)

------------------------------------------------------------------
Your code has been rated at 9.76/10 (previous run: 9.76/10, +0.00)

make[3]: *** [tests/Build:124:
/tmp/perf12/tests/shell/common/check_errors_whitelisted.py.pylint_log]
Error 1
make[3]: Target 'pylint' not remade because of errors.
make[2]: *** [Makefile.perf:690: pylint-tests] Error 2
make[2]: Target 'all' not remade because of errors.
make[1]: *** [Makefile.perf:343: sub-make] Error 2
make[1]: Target 'all' not remade because of errors.
make: *** [Makefile:82: all] Error 2
```

I like the change although the perf tool and kselftests may get merged
through different trees. It may be better to separate the patches.

Thanks,
Ian
