Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4566E5616A7
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 16:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995835; cv=pass; b=hDKwtr4beI552lGi3AdJi1Xw8LhK5j/cuB85VjgRzW/sFcXGkYlQLpQeLtrV89h2IUM47K2lyYE752g0gStkxMyYOuY+eDbzjFyoIYy4Mu4HvDdVlRDqMOxuYiuhbVTvPSOtJXe67ZkiYJeU0Vz4qTmUw0vA1l+xDhuSjCx31PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995835; c=relaxed/simple;
	bh=4Ce3A1dUBiGV5q4+6qdTDhsc65OklCGH9uvF3HVnuco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSVRQgsPS9VW1/VW9hQuXxC1ZlB/g4PX1TLJ62iub8wFvg0Ih5TEyxhDbnSgfoczzxEB/KYHSijRODE2MmgmWyaO2Gv2uegB+la9vlbgygbooNM8HRottIGyJ0XfjbXbIZKGTiLxOVzndN3O/UdsaTGdO4lPVrGkWvmthjcMC5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTYTCsa6; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTYTCsa6"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b21cf1a580so444262a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 09:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791995832; cv=none;
        d=google.com; s=arc-20260327;
        b=L4toUe1I+XF4+IAtRRI5mxMgMrLvd/xZh9vg5P+bixN8Xpw7EopfefMm2G2jBdutL/
         NaSaZ1DTCyCrro2U+YRB8Cc2l2TSVLc3m0VyirMZyW6GD7ZKbdESo8Dx38MEpPrrNHCa
         hWjg8F9G4mknzJn4oCjE6O5WcL7if58gwZxXJbmiQgE67vQ4ndGz8oivfzc1/o8iJ1y1
         uXolKdoh/rwWGGVumeUsJ6QsAx+W9gvR+vK6Cu+IbAqG8NUwq1P3vDIBhkjXuBMckJZV
         XWmsvRqi3+YPoq482B6rFVv0cWTgdekli14TvZTa5o4rd7b8rsR6UNgMxYthW4c3eXyj
         QDTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OuNAqYyZmsOksNl+TNR2Xq9jMZpySZooddEaC50en2k=;
        fh=rc8kEyT/xy4Uy4JmegWpJ+EsoEBLnqI7qL+0PHPsiZE=;
        b=O1fvwldPS4mDOc2xQJWjMSpABO3wAWUV1wIBy5rvEArWFBGurJ6qqLi80v6gxeKszB
         13dRDXXLuSzl6aHIryEbGjG3vQmvPIsldHYKOF8K1+rxwHYh2AQFMtpLO3LgKRdlsa7y
         RselvkCs0Z93CF/YUoAzlp55wM9Ti8hk9BXzKOjDDp12tl5LXmmpsKfsofMEklyHx2MW
         jU28QEnYonMj3nFsVP72ea61mTaSWdlaj+tRxOXFE5Yqh+BYzfdueEap4Ic1d1Uxm6hD
         muTeEdv7xkhbPqnmMvpBpCmz8joDio5SurHkpXBu5Y+NL6yjgjHlQKUH9rCB4lSKCw5E
         xLmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791995832; x=1792600632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OuNAqYyZmsOksNl+TNR2Xq9jMZpySZooddEaC50en2k=;
        b=OTYTCsa6IUhAoIBQ62uigV1V5mo6qVy6LHrEBrj1PfpxDkC47Y1SA2rB6wnTWumW2i
         oQeG3RuIBHW2xgNJaVqw0hPVMNgRF94u5ixigsshnxtPhwMIoxFgRpoBTkO8dAVCjIuA
         Fwf5vqba0jthrLs9LeGXIXI8khZTU+7V0k9uAcyVZ2R0DzKKnTXdItHe2DmdJ0x0QxUt
         dZhc7vfV185KOqMxSfqyToHMMqhuqtCCA5MytwHYOR0FkI0wRo32yHmVQh+VaarX5HoX
         D5Jl/c1LB3RdSp7K8T1H9L7ziBb770cvEIhsa8Y4vVDjfbzVEpyr6QJiYKN+AgBFpwFP
         gIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995832; x=1792600632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuNAqYyZmsOksNl+TNR2Xq9jMZpySZooddEaC50en2k=;
        b=f/WblRk4TXQcT512NIO7Ez63990CPVduXk6a8D0ikWM6ZAL/iSiJL1tIH9ua0wgGl9
         CeMAwqEcoJ2tpDccTfBWVYX03sKqjzmxPQQyLiiJviJ/jgBge1hthOvSvV38c/hOvh0S
         iXdYIkWAYdd8g74cnYom5gdDHTsJrRq4dEpdLBUcSvRW0uFjVNde+lTNj30Z6x7sF1b2
         CItg0CUrMMu8+IbjK89l3MjI6gd5uLvLzsUxM0ru9sq2XceUhn4y9K1bm34sGm1IxGMU
         kJ9LJB+6HVOmprONi9tNmWvBlP/DZ/f4Opqr+mwZ112T/kqiR3XcgOH63bjH+1onaGeq
         /pJQ==
X-Forwarded-Encrypted: i=1; AKwUvByBNMUJtPm3U8Dpx7Bem+TzX11zHkPzlY+GdVPsPfjcvz4x5ztqzn05/hgg8vY0ttXwi43DTb9j1/TsIyWA3mU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgJOTuR0YIgJ9BQOD6UxmupdHFqyAumQmvQ+gjuTWwwi9ib5u8
	V1Vd6MirsL6n8KkAR7Pt+u7HvQzTEz8GroXvTk3MqgN0307Fa/fb+85i77iQv30Kt1QsGJ/jqWs
	Zm+b6KZ8AwynVFM7aLX9bheM+cJwDkHI=
X-Gm-Gg: AYBFou13xQnXBDRR1twiLkVV00nWzK+uCuJWb6YIErvw7FLDs28zCTxPTMmCQEEkgRt
	fgiPWBkkXTIcrnq+9AHzOCSJNg4U4nP+YuN3DinLPcMYYub/JrWskDcHH9huiudKgEfFSvB/480
	m/462E6Hbu2+2DD1OulDsWx6HU3JOvlOXL+mPFCQz481uGV3gcR1OwcXlO2EXkX+og4KLGvsxfn
	7dY1w0o52T4zQZdKU2Tu91P/Dr5pN8rQ79N/sNIY63MmIT6Xv0YsuUVhhm39YsHzSKdAXsmkZ7d
	BGDd5j6Rv91e/0wS7ZzSgTO7/IDT1KfHwR9hDIZNubQm2JiN82iwmM303GqUoQXkbFWLU+/q/u9
	vSh830eJEehbkFnpyNz3K4QVea8CqTxd5M3W2G/GBiQ==
X-Received: by 2002:a05:6402:21c3:b0:6aa:e263:51c with SMTP id
 4fb4d7f45d1cf-6b17c24db3amr11030515a12.16.1791995832171; Wed, 14 Oct 2026
 09:37:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014080730.8817-1-ludwig.rydberg@gaisler.com>
In-Reply-To: <20261014080730.8817-1-ludwig.rydberg@gaisler.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 14 Oct 2026 18:36:59 +0200
X-Gm-Features: AclHuK_ZGp2lGIoPZvcbnwXZDKGGTjofIqBhe5kacncTBCbRPxupw58DTxV_730
Message-ID: <CA+=Fv5Tz8Nq3TrAvejMK0oroPsXz1PGdXoAj=ck5WcArU4j9dg@mail.gmail.com>
Subject: Re: [PATCH 0/3] sparc32: add seccomp filter support
To: Ludwig Rydberg <ludwig.rydberg@gaisler.com>
Cc: Andreas Larsson <andreas@gaisler.com>, "David S. Miller" <davem@davemloft.net>, 
	Kees Cook <kees@kernel.org>, sparclinux@vger.kernel.org, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Oleg Nesterov <oleg@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Stian Halseth <stian@itx.no>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ludwig,

On Wed, Oct 14, 2026 at 10:07=E2=80=AFAM Ludwig Rydberg
<ludwig.rydberg@gaisler.com> wrote:
>
> This adds SECCOMP_FILTER support for sparc32 on top of Stian Halseth's
> sparc64 series (v2):
> https://lore.kernel.org/r/20260902072745.3412940-1-stian@itx.no
>
> Patch 1 splits syscall_trace() into syscall_trace_enter() and
> syscall_trace_leave() as on sparc64 and most other architectures.
>
> Patch 2 adds a call to seccomp_permit_syscall() in syscall_trace_enter()
> to filter system calls. A denied syscall skips the call and goes
> through the syscall exit work with the return value already set.
>
> Patch 3 extends the seccomp_bpf selftest's SPARC support to sparc32.
>
> Testing:
> seccomp_bpf on v7.3-rc1 with the whole seccomp series applied on a
> GR-CPCI-GR740 board from Frontgrade Gaisler:
>
> - UP: pass:99 fail:0 skip:12
> - SMP with out-of-tree patches that implement the futex atomic
>   operations with CASA on LEON: pass:99 fail:0 skip:12
> - SMP without them: pass:89 fail:10 skip:12.
>   FUTEX depends on !(SPARC32 && SMP) (see 3f2bedabb62c) and glibc aborts
>   with "The futex facility returned an unexpected error code" in the 10
>   tests that use threads (KILL_thread,
>   user_notification_filter_empty_threaded, tsync_vs_dead_thread_leader an=
d
>   the 7 TSYNC tests).
>
> The 12 skipped tests need the UPROBES which sparc32 does not have.
>
> Ludwig Rydberg (3):
>   sparc32: Split common syscall_trace() to syscall_trace_{enter|leave}()
>   sparc32: add seccomp filter support
>   selftests/seccomp: add sparc32 support
>
>  arch/sparc/Kconfig                            |  2 +-
>  arch/sparc/include/asm/thread_info_32.h       |  2 +
>  arch/sparc/kernel/entry.S                     | 33 ++++++++--------
>  arch/sparc/kernel/kernel.h                    |  3 +-
>  arch/sparc/kernel/ptrace_32.c                 | 26 ++++++++-----
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 38 +++++++++++++------
>  6 files changed, 66 insertions(+), 38 deletions(-)
>
>
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> prerequisite-patch-id: 5772aba3cb572833df13529ec6bb03ae9e848e25
> prerequisite-patch-id: 70a54ba398c763e45f9332ff4cc06b3f2a3e7825
> --
> 2.35.3
>
>

Tested the series on a dual-CPU HyperSPARC SPARCstation 20 with
my patched v7.3-rc1 kernel, including SMP futex support.

The cross-built seccomp_bpf selftests completed on real hardware:
92 passed, 0 failed, 19 skipped. The harness timeout was increased
to 180 seconds; test workloads were unchanged. No new kernel
messages or taint appeared.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
