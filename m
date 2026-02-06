Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183E5379982
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770374942; cv=none; b=gOIQ8iFykDAKFMr3lmGphrS9slgjtFisXEfqi1z6XfgLNEiqoUSVDC+Bbx0tYFhGfiBOQdXkFNzsqrdTmhzADuYbXFyT8GReOjCs1MkG1yskEMT18MNZ9bfIV9tZmmlKVx1wX7aj0AI2+00FYfVgr8EoIRd49WUx8TprCiJL+sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770374942; c=relaxed/simple;
	bh=wocnho69+8xuXH257OKNIA1dWHd6LbmLrLkg1JkFLWA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rs1Fb+vWTeqCDUWJeSlNyjg/azfnBlBiZyaVF1tteVd7Pbls7g+RCZ0llVqswxpKGX8X1qyMBV1v9Uqi5LdLmdxjpLIqX2ad0YBF+sH2Iersw1Pd6CXk0QuRdKbE7RPvgHm2tAqUBi1K9mA4oDB6CeV9lyy+3BX78u3wuwlFSaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rtZWqmqR; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rtZWqmqR"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4803e8b6007so21065675e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 02:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770374940; x=1770979740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zmOo5omjcqnuztYn9eehOA9zK7mZfLWvH1J22yg9LQ=;
        b=rtZWqmqRaD68PY071wjROzdd1xDQR7g7FtiVVCGzrLrc4FZ5UsgZ/92JpxbXK368bO
         fqIwGSwEY2IRZff60pbVxF3x807cPDj1XmfQ5weGgs2loKNM9aQhBfFkRG29WH9kwnXu
         56GPKpP4MNezr9Aq0761pyoRSY9PqovaMOkYWXX6JHD+DhU3mkyteoTyFhNoiAJFKbTV
         wlb4P8gqhWBlmTWrlGH4Zjgo9uVhUJrNjvpuGGVBCX6B6Xdl3sEoKxrKBEev6eFbK/3B
         Rv82Wnp40onelRNCY+B9cBIp8a/IF54dIpGPoaiJtlhKdiwfSj5T8wrZ576tyOErzyZH
         jMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770374940; x=1770979740;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2zmOo5omjcqnuztYn9eehOA9zK7mZfLWvH1J22yg9LQ=;
        b=e6tPAA2WR6jm19PN42UzdvXt5EevoK/JE7E1DTanBCCzORr9KkedQ9tQWQkxneHD5M
         LPfWhvsBACU6rh0y/nDCmF6MtLqXog7bK3fcQL1d5cJcyajmRlILsqyNMTZrpSxY+UUF
         JAQRiB5AJx8VeDIenmEfsiEe0mZshVyqnrLDgnvfeCOpugNsTW7cq3S1ewb4ZnuwEkTv
         G+TLHd55I5vnbsUlr0JOLj7n3DRQo3BIoOQ0gzhCVqflNKFDhcWLM6nHKVFnwh2phO9w
         CelK5pG/JIhTh669UGL4hrYt04siYXpjXzwMSd8GPVf1KERw0pLfTK2aQSuhozJ0E/s7
         Hd6w==
X-Forwarded-Encrypted: i=1; AJvYcCVsDQsopZxqLM5vC3fwJ8UcfyTBGq3zvpRvJ4g81PyaF20EZrEJD65bu98bFbaqHojYcHmXPuJP+TYkpGVnsZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNybq+E89jZQOsbQl1puEFEvlKrKB6Cfi0015O3dLj3ypY+ED2
	kNpsxNCULx3bAqmbH4MIHtY+GwjXQntWmGnl446WzvkDEYPFTXtTc0E2frv5LCVNp2jt2EvC+CD
	J8EsYgJkttHS8Yg==
X-Received: from wmpg38.prod.google.com ([2002:a05:600c:4ca6:b0:47a:7874:d5d])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b23:b0:47f:8c05:786b with SMTP id 5b1f17b1804b1-4832021eae9mr34302145e9.28.1770374940592;
 Fri, 06 Feb 2026 02:49:00 -0800 (PST)
Date: Fri, 06 Feb 2026 10:48:59 +0000
In-Reply-To: <20260206081704.53215-1-liuhangbin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260206081704.53215-1-liuhangbin@gmail.com>
X-Mailer: aerc 0.21.0
Message-ID: <DG7TJFKZNG1J.19BZF87IWD3UG@google.com>
Subject: Re: [PATCH selftests] selftests: Use ktap helpers for runner.sh
From: Brendan Jackman <jackmanb@google.com>
To: Hangbin Liu <liuhangbin@gmail.com>, <linux-kselftest@vger.kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Brendan Jackman <jackmanb@google.com>, <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri Feb 6, 2026 at 8:17 AM UTC, Hangbin Liu wrote:
> This has been on my todo list for a long time. We should use ktap
> helpers in runner.sh. I saw Brendan did some work in d9e6269e3303
> ("selftests/run_kselftest.sh: exit with error if tests fail") to make
> run_kselftest.sh exit with the correct return value. But we still use a
> custom solution in runner.sh. Let's convert all the print messages to use
> formal ktap helpers. Here=E2=80=99s what I changed:
>
>   1. Move TAP header from runner.sh to run_kselftest.sh, since run_kselft=
est.sh
>      is the only caller of run_many().
>   2. In run_kselftest.sh, call run_many() in main process to count the
>      pass/fail numbers.
>   3. In run_kselftest.sh, do not generate kselftest_failures_file; just
>      use ktap_print_totals to report the result.
>   4. In runner.sh run_one(), get the return value and use ktap helpers fo=
r
>      all pass/fail reporting. This allows counting pass/fail numbers in t=
he
>      main process.
>   5. In runner.sh run_in_netns(), also return the correct rc, so we can
>      count results during wait.
>
> After the change, the printed result looks like:
>
>   not ok 4 4 selftests: clone3: clone3_cap_checkpoint_restore # exit=3D1
>   # Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0
>
>   ]# echo $?
>   1

Sorry I'm being a bit lazy by not investigating this myself but the
current intended behaviour is for runner.sh to output correct KTAP,
right? Could you describe what behavioural changes this is expected to
bring - does it fix/change the KTAP output? (Or if it's just a cleanup
with no intended change then please note that in the commit message).

I have not reviewed the code properly yet (I just read enough to check
that it still does the thing I care about i.e. return an error code when
something fails). I can do a proper review next week if you add a bit
more context re the question above though.

> -	wait
> +	# Handle the return values when running in netns.
> +	for pid in "${pids[@]}"; do
> +		wait "$pid"
> +		rc=3D$?
> +		[ "$rc" -eq "$KSFT_PASS" ] && KTAP_CNT_PASS=3D$((KTAP_CNT_PASS+1))
> +		[ "$rc" -eq "$KSFT_FAIL" ] && KTAP_CNT_FAIL=3D$((KTAP_CNT_FAIL+1))
> +		[ "$rc" -eq "$KSFT_SKIP" ] && KTAP_CNT_SKIP=3D$((KTAP_CNT_SKIP+1))
> +		[ "$rc" -eq "$KSFT_XFAIL" ] && KTAP_CNT_XFAIL=3D$((KTAP_CNT_XFAIL+1))

These variables don't seeem to have anything to do with KTAP so I think
they should have a different name prefix. I guess KSFT_*? Or maybe
RUNNER_* or something.

Also I guess we should initialise them to 0 so they are still set if no
tests actually get run?

Also I think it's probably time to start documenting the
interface of runner.sh - sorry I probably should have done this when I
created kselftest_failures_file. Can you add a comment at the top to
show that these variables are part of the "API"?
