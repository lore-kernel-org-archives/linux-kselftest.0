Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E13C81B2
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 07:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669661; cv=none; b=Fri5lPrn/jy9+C3gE1jDd7y38zkMxgMEQmGlF9hDXmulooCiK739BQcp7YqrG1UnWI/5FfN9rTrtFUQTDeDueWkPenggnSQrZbM5I2ovkR76N/5Y2wI9HPT2h1+C8f71MrJ9mcnqbZ44F2GyCOWwpbC0lQi47vFS14+SLDX5NWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669661; c=relaxed/simple;
	bh=RaIYkUfGrTauNfU/fKxJ6fGfioZ/3/GCN64xoXCFToc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BCIyy29DTNXDF1gBIvh9GgOktUFuGpuSLSpjvouoiRf818Ld5MbHnoj642MlRGCkcJjOgeb8AENuOKwylstRrYXriEk7y6kbw82zvQ2LHT5LL62TBoLQNcLSqhSSojqWCUN4M4D2Du+seBgzhEIR+26/7WQtepmBIyh7+nKkX+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGkqCKGh; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGkqCKGh"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8453427d3f4so510866b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 00:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783669659; x=1784274459; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yjtDP2RXjezG1cG58MMunIqUUp8s3pwkHt+EzmYlVO0=;
        b=AGkqCKGhxp2zrfXX8V/j47U9yDXbzcmaCAH88bKY/ZZam8uShFydex3Ge6cHVBshJO
         qyLBN0RtXkCAdRByNj0so2Mncp38IOLtQXTsP0BKaXhiYDQ1X9sI41FoAwJa2ulvXZK8
         dLf7RxWRIuggYoH7dT1U+dhfDqcAJHqS8EvS7cTOKpwDwqsu8W0NFvwxcqvoVtj9cOFa
         NWHWq3DKrtRB48KAmA4T4q6Ku6VV05K8BuVw1oL8yBCZNn8tyFVgHGBN6hTzbQNcqFOq
         oTNckBxcyA1bMwej6BbIEhkBgeMbQYQjwMsgOuAe3c3ZmQqvqEWlBQ4xMzMmfr7epRg9
         8epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669659; x=1784274459;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjtDP2RXjezG1cG58MMunIqUUp8s3pwkHt+EzmYlVO0=;
        b=GsbpKHSls4oSoY1GJcClvobF47ZP3ax77o2aiCFw0TUG34d0fZwEGWeJAC9e1mcdD/
         X7JlxyKNWdjeH2Vxmw06bVtMEsBBnJWAsUb6p1A37shErEzFO4Cw/FUlcU66RBMeUtO0
         xNSDBWlDqpG9PTwZQcZgZs8y6OO/ZRrI73bYCx+mqokCWtQxPmfFbiOROIE6jqZKNSL0
         DiKCNZLx9pLEx9COcVE09MqCF+56KBEVih7OiV22XNwlDTEV75sC7UqsY0NoxtxaRaNc
         RIWBQZn1BIQaSy/FQAjjdVUhvSII7u6IdQca37aZFF5azBL1aDS14fZrdf1qT/Ob/5Uj
         TqhA==
X-Forwarded-Encrypted: i=1; AHgh+Rqq7LwMZArtT361bZsc5JRh7aSSDObkNZtDyhGAvPT94YGXbq3UDLFhH5m0DNjYxhu8aYZ4oBqnGhH8O+qwA7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWTgppP8wGxWj7lAzYn70HbEVak8MhdGQReoI1YKpg5Cz+xFKW
	cV4DGZ11K5GW5YOC3UPvThq+IU69NgOLzfI8klCc5dj1YVQCtw57R0LWZ2yFQw==
X-Gm-Gg: AfdE7cnyoJRE0TrTPirwNnGzrJ5q1EPrN/ZY3z9pku+znrm1VospceklHpbUX23xeiS
	B5xClPjZkq6V7lPhkZbmVHcGTa3eb6W47NmQbueQ90Whf+iXWBAMgMfhVT7bwT761xP6mmwDmFd
	CfOE9hmGo74DnPIFvC5A98Bc20T79vmid3GTX13r2znG/iDfHVpDtNPAvKOYrOxKOJB891fkMmH
	4G24FzZL7aB+r5oFUhFzYMCuVZrXkGM8hgbK8ptSYB5aIMywNhyvgKmka04E/Ven3nYoILrupGI
	EnL4zxlJxrluBC5cQiCD1RhN6mBCOzqxdNvUOI/BnUxgllw9R3Cs9W7kxSaan1oedS0KfD71X9x
	gqVorcu8It8zqQ0F6sLWSE3r58ZRrRAMLuYxrw9dtqC4EUU1OAvdLlE+K813K8SszuJUvRo3RX+
	p2PE+j2RggZnOnMqY1iK7vlgnkG37b0xW7zrwxcyiS
X-Received: by 2002:a05:6a00:8588:b0:848:662c:cb85 with SMTP id d2e1a72fcca58-848662cd2c6mr3665501b3a.6.1783669659223;
        Fri, 10 Jul 2026 00:47:39 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b60571sm9833231b3a.9.2026.07.10.00.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:47:38 -0700 (PDT)
Message-ID: <9732d0d410c8e267fd53f99c5d456eb44be5026b.camel@gmail.com>
Subject: Re: [PATCH bpf v4 1/2] bpf: Reject negative const offsets for
 buffer pointers
From: Eduard Zingerman <eddyz87@gmail.com>
To: sun jian <sun.jian.kdev@gmail.com>
Cc: Shung-Hsi Yu <shung-hsi.yu@suse.com>, bpf@vger.kernel.org,
 ast@kernel.org, 	daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, 	memxor@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, 	jolsa@kernel.org,
 emil@etsalapatis.com, shuah@kernel.org, mmullins@fb.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Fri, 10 Jul 2026 00:47:35 -0700
In-Reply-To: <CABFUUZEropo5ROshFt+mD+AtF_6VRGcyaOES-wUjasL5J2W4eQ@mail.gmail.com>
References: <20260708090151.151729-1-sun.jian.kdev@gmail.com>
	 <20260708090151.151729-2-sun.jian.kdev@gmail.com> <ak5HLLrYK3R_g2y_@u94a>
	 <CABFUUZHpPwuTk69hb54WugJwssFuvoqFFPv34dZRbKLLc1PwwQ@mail.gmail.com>
	 <ak8XSRiLKx5WcIQw@u94a>
	 <1f8aad47f61fbf85eb55276e4bb01bfcff61393e.camel@gmail.com>
	 <CABFUUZEXYduca34g22YZ1ESyYe3Yc3kYQrTEWLMxB5X0ZmYn8w@mail.gmail.com>
	 <4349d987d34f9426bdbb09a5d02de61da8f3e746.camel@gmail.com>
	 <CABFUUZEropo5ROshFt+mD+AtF_6VRGcyaOES-wUjasL5J2W4eQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-07-10 at 15:25 +0800, sun jian wrote:
> On Fri, Jul 10, 2026 at 2:23=E2=80=AFPM Eduard Zingerman <eddyz87@gmail.c=
om> wrote:
> >=20
> > On Fri, 2026-07-10 at 13:52 +0800, sun jian wrote:
> >=20
> > [...]
> >=20
> > > There is an observable effect on the target bpf base. I tested it wit=
h a
> > > temporary raw_tp writable test_run reproducer, not part of the series=
. It
> > > attaches a raw_tp writable program to bpf_test_finish and triggers it
> > > through BPF_PROG_TEST_RUN. The program does:
> > >=20
> > > r6 =3D *(u64 *)(r1 + 0)
> > > r6 +=3D -8
> > > *(u64 *)(r6 + 0) =3D 0
> > >=20
> > > With KASAN enabled and the BPF JIT disabled, on the bpf base without =
the
> > > verifier fix, the program loads, attaches, executes, and KASAN report=
s:
> >=20
> > Could you please identify why the behaviour differs between bpf and bpf=
-next?
>=20
> I checked the current bpf-next, but I could not reproduce the difference.
>=20
> Both the public cgit page and my local bpf-next/master and bpf-next/for-n=
ext
> point to:
> a4553044d1af ("Merge branch 'bpf-bound-rdonly-rdwr_buf_size-kfunc-return-=
size'")
>=20
> I tested that tree with only the selftest patch applied. The staged diff
> only contains:
>=20
> tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid=
.c
> tools/testing/selftests/bpf/progs/verifier_raw_tp_writable.c
>=20
> The negative const-offset case is still accepted at load time:
>=20
> #637/2 verifier_raw_tp_writable/raw_tracepoint_writable: reject
> negative const offset:FAIL
> run_subtest:FAIL:unexpected_load_success unexpected success: 0
>=20
> and the verifier log only shows:
>=20
> processed 4 insns (limit 1000000) max_states_per_insn 0 total_states 0
> peak_states 0 mark_read 0

Here is the branch:
https://github.com/eddyz87/bpf/tree/tp-buffer-negative-offset
It is the current bpf-next HEAD [1] plus patches #1,2 and a revert of patch=
 #1.

I have KASAN enabled, the test is passing:

#317     raw_tp_writable_reject_nbd_invalid:OK

[1] c3d5ef291a2a ("selftests/bpf: Add test for scalar id on sign-extending =
stack fill")

> The current __check_buffer_access() in that tree still only rejects a
> negative instruction offset and a non-constant var_off. It does not check
> the folded effective offset, so this case still has off=3D0 and var_off=
=3D-8 and
> is accepted.
>=20
> So, at least on a4553044d1af, I do not see bpf-next rejecting this case. =
If
> you have a bpf-next commit or verifier log where this case is rejected, I=
'd
> be glad to take a look and reconcile; I may well be missing something in =
my
> setup.
>=20
> Thanks,
> Sun Jian
> >=20
> > [...]
