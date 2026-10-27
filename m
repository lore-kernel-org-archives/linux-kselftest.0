Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793137573;
	b=xA7dyEQqbIyssvTW0IqddCp0RaJQV9ZQHgFbvpKwwtzUtqJTR89LT1Vp0qi6r8sPoX89
	 /aFE4SUWYhqZaulsamB48yXMqa+MkpCK86Xvq7S1+tPg14zu0nmgyG9Vx2HWZ0aRwKzr9
	 I/ofQnmLWnHP7qZ5PcsancvIgno7q54c5rYkflMDZDGhphH4b6LP8f0lV36n3kspJty4G
	 P6rVcKfzpb99tCKwkmcuzFVYwG0jNW/RXLRqd9AylPvvlFzFhJpCa5cq2Wdkm+iY/JSh4
	 S7oGUYs7kpZbnnaX7frtcJL66YuPWR4kCY+JqRUu0WmMnkUej58X2b2qMAhnSNP1iwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
	b=JQvtRHA0bxaOMJt9T98RWcqYE1vtCqp0c4ZEgY5WN9x+UAi0EWQRaEnx4z9ebJidoKS/
	 MxjcfJtKGwlzyOHyX3XOB7iyyQRMfuKy50KRDbfb3miiolkSgL/EnH+eP/VNxeVCFMAgw
	 61GYVR6tSJ1v5jJ2h55siibTnNBIdSkf5f334p07yrwGGQV1jlupHK45UY5OX6H7/PbG/
	 iHdpiDxvRcVzNTlxFqXLTSY4dFjZU6HvW4zqhrjXO9SppvoSxtSFidpWjRDDLagMwht3e
	 ZWGqHvmUrHP4rFxZ0N4YbxbTJY0WaAU2Gi50TdwHxzwFy8OJKIdnfnJkOhdT+4DXLNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wbne8OHp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F7F606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 21:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F7F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wbne8OHp
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4697404c2bso43484166b.2
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 14:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793137571; cv=none;
        d=google.com; s=arc-20260327;
        b=EQaIXWc24ePj47eWsJ0E+Y4xyru8zm7rBfB1Pa7JGuoTgkeCqskbTcM+tQN6WwlPV7
         H+HvIyMc+PFYf2Ri/IP7re/7bF/5x3/UR3dWOttSbus7PmSM/q90Oc2z3TUVbkTvN/fZ
         EEa+6ljmZua1itgl1gxlGEOgNDPSK9bEeyWe/BuB/15jkCf04OUE9FPFZEK/bRVSptJf
         0sUIxPdWOSqDJ6/VEhdl5YPzs6oqncjW74Asi50EqlSSyPWcWsDIXwTKKZHiFCpapK7o
         C4efX1R0kQhuphFsirVaTIpMwqlZ+ygiO7tfwtvvaWU7C5SYUh0jYLedttMXzXeSqa42
         5yzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
        fh=rf+yxhj/+GxF46OPJb4QK2lUz++p26B9ptqn6ilxCo8=;
        b=YJXQS8PLeEl+W0tTlak11FWftJ/RocFEaRjindf3xhemQZYZ4aSwCF6vcRpJ4PARTM
         ydMdTawO4MhWwc8fR6gHVrIvXjRZctEM/wguQIZ8dijykEgu1Li/q7ZiROOL0NntjNqC
         dIZwQkDtuDEdT0v+HLLX4x4g65dGsJlEjLajQiOuC0rmipB4hJTAnvMeaExO0Uu0iVS1
         Iwl+szR3kHkd1b47/up2FjhG+DRuXhjWSpSHSUbS29KPMzJjIFROfpzyzxsDW9GsX0qR
         suDwf2hslBEnRTmMuDNLMvA3eO5BU1p22puZqwLrj4V54kaC/pY1b8xmRYixzvxmx7wW
         pg5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793137571; x=1793742371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
        b=Wbne8OHp5wFBPP5dxuR8+Kp5ZHrm8v80mBFme9V3XRymOzyPXT+ANjuS8mZtAutbOt
         ODy1sui91Ycwohd+oEsUjL53uPSBpLjWgEgWbT0Ma2aK7Hvfe3g01z4xkvRH6s2A/fGZ
         +Zbv9XzVpEdyJwXjAhRmHLJ3XY730+XSfkzgh8qi4omMFnsRCwCi2Puq9v4j/9LjCquY
         7A7TovQ1C2rR2zd4geupuZI+05Cnugg1XhJ4MHSma5JAUcS+LWaaA2qCMueEuNn/BKvO
         xSW9c+bot29ZINzBkQ0CD12vMG5F6NsY2dux4jMT3EVU1twWW7mORuqkOTF0o5JB3euK
         EGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793137571; x=1793742371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
        b=rGMFocwIgyIU1u/5oJolhPj2fFuZUkpAxhh8QrBcFEu01TmkUYrlEGm5LhlaLpVBm3
         j9iZt8iVkokOWOD+LJcaPvSplCSu3JLnsL8HnZq7u/SO0r1ur9MG9w27h/R0WQ46LFjr
         Y1oxoDHLIq/IZtF/rSXySEt+kpyZ2qEz1TlXewEn92A5mkXzg2/9uocV+zHCSHKpr5dd
         Jfe1YK+A3XT95yb1KPKQWyMyWc+5n4gHhEkgWtw26iDVzSqXsUgN78JlrMZfEOMvLpmx
         9JLTnaLLr+D3DRkKlrFxbSQGlJqTlPpK+I4iKIBkjAum17XcJvZqX7TccFoK+oYKm1DF
         EkXg==
X-Forwarded-Encrypted: i=1; AKwUvBz+CCtfkAfxxCvy0nTo2a4DQKSZQ2KOpHv9d2AXVoJCHPpP+U8098V4tRF9Sqg86UfUQtXY03mdaK+N+U2Rjew=@vger.kernel.org
X-Gm-Message-State: AFq9FYIz+G0Z/RZdcDYTNvJseJDU+oBQWrhvG+4yTLDaqSjEuUXhijGt
	OIJ5wM4exnCsNUisblOhH3Gk8IiXqI1tw/UlVbryKa+BTi1limLy7G+0lW5RQil/ck/7Qop+Hov
	XFYoNpOVSYEvayJjLcOkdHoZg6DBNZmgTfDmE8ngO
X-Gm-Gg: AYBFou2l5PALlIta5UaCjr5KlN3eayvasaf16Oc55TY8po1fRuH/inCrroD32z343hU
	nuA5ia04gaUW/J2VzH31ldFyr8RCZ4ihBMUD6+ec5k58TXbIoKFc8/px1oaHiaPAlRcdk54JV/n
	6YFln/GHk6ye0gKuxkpz+vHqrACdlmwbQ+0WmDjPwowwQuhpL9E6FyjXOnN6MU0q1i7AXg8oMRi
	IrFB4X65+dhmxdymRHn03lf77Y6JFYnRETiRXlVt9It/6Anhx8lMm5lHXGvMtre8Sb/Yt+wlWTL
	S8cTHivvbSYz5xuFNlccBw47qbaiqC/HjPDbKVP240ODklUNlDQ93vh5iwk/Ud5dNiomp9lwhxA
	kp1vivx5EUl/FJ9DwO+sjIKzHPqGVaC6ThbPXKiFn1i8XuKHCtHthu3YbnC1C02tqivk=
X-Received: by 2002:a17:906:794a:b0:c36:7579:fe6d with SMTP id
 a640c23a62f3a-c49bdf3769bmr41163366b.11.1793137570881; Tue, 27 Oct 2026
 14:46:10 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-12-wusamuel@google.com> <90371d2279a5eb08966a82325922e1f15eb93560d4019f5c9020956cadb4120a@mail.kernel.org>
In-Reply-To: <90371d2279a5eb08966a82325922e1f15eb93560d4019f5c9020956cadb4120a@mail.kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 14:45:59 -0700
X-Gm-Features: AclHuK8QaCDsAbnjPaGufNN4kMFz5cqAaOc_WFmJQjgBqVdaEIaSp_a56eCEZoc
Message-ID: <CAG2KctpuWLxdxB+LzrBO8eGsL2E0m_DphcG4cauB0cHuEDEoRw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
To: bot+bpf-ci@kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, andrii@kernel.org, 
	eddyz87@gmail.com, ihor.solodrai@linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, martin.lau@kernel.org, 
	mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:51=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:

[...]

> Would it work to fall back to libbpf_kallsyms_parse() for typeless extern=
s
> that are still unresolved after the ioctl pass?  That only costs extra ti=
me
> when a symbol is actually missing.  Alternatively, the kernel query could
> match the .llvm. suffix for data symbols.  I did not find a fix for this =
in
> the rest of the series.

Yes, for strong externs. In v3, if a strong extern returns -ENOENT,
I'll fallback to /proc/kallsyms to scanning .llvm.<hash> suffix,
keeping the same semantics as before.

Weak misses must default to zero without falling back to a scan.
Otherwise, all objects marked __weak would pay the full /proc/kallsyms
scanning cost. This is a slight semantic change, as a weak symbol with
a ThinLTO-renamed static now resolves to zero. However, this is the
behavior of the light skeleton (gen_loader.c), so perhaps it's
acceptable. I'll note this in the v3 commit message.

[...]

> Should the fallback cover any error other than -EADDRNOTAVAIL (and other
> real lookup errors), or at least -EACCES as well, with a pr_warn() for th=
e
> errors that are not handled?

I'll update v3 to log pr_warn() and return on open() failure or lookup
errors. And then I think I should reset partial state and fall back to
/proc/kallsyms on ENOTTY, EPERM, EACCES, and EOPNOTSUPP.
