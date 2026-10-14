Received: from mta1.migadu.com (out-225.mta1.migadu.com [95.215.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D228455C1C4
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994859; cv=none; b=BmBz5pc/H3gGUmbgKDbmt66DtPxByuuy7wfZgrZTx1SFsOK6Om93uYnzRLcionIlBm3JTUci33oEhW2ExFMAxTJd2y9c990KovajZy2Kbrao9P1vGMqTWUbQs6bs6OcZGdod2wCkISbAVRTVz/E+YiSD7TxADR4tus84xCnS+E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994859; c=relaxed/simple;
	bh=rKvGD/uQgvEu1y9QYyQ3BOrlGUecI24T5itI4gKAr8A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d6ylNgE3x+WqY0XlPHWulT/OTCBRTJh47hObXi7ti7YVoOc6Ya2MkSOvek9ELyADodr0mC+KAtcecdk4hy/oIxT+0tfU+VWFprWB6GXOV7jJbCs46j8L63Xvwwn60OzD8thNkk+jziZErLEYZqDw8KllqbtNQ28sVrk7CN0rcm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ih/ZlP0B; arc=none smtp.client-ip=95.215.58.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ih/ZlP0B"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rKvGD/uQgvEu1y9QYyQ3BOrlGUecI24T5itI4gKAr8A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791994853; v=1; x=1792599653;
 b=ih/ZlP0BMkDZDRlvf+S1KeZwWaUhrpp2qQQb8IROHURJ8N76LQjAtPEQ/a/HZmpvdxss1rAJ
 VuVmcOCfj/MUP2pvlQCJFaVmfdEJ9PD8IXLVbcnTVahF1MRnWS32eWawNXNjn35ggp0bNRy+HtX
 rmOOiTX4Fh3/IvGRraBCinPs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1e510aac7886c557;
	Wed, 14 Oct 2026 16:20:53 +0000
X-Mizu-Trace-ID: 1e510aac7886c557
X-Migadu-Flow: FLOW_OUT
Message-ID: <b6ca5327e6263cc3b6c0e381d502ce8b5570d413.camel@linux.dev>
Subject: Re: [PATCH bpf-next v2 7/7] selftests/bpf: Skip compare_text
 subtest when stdout is not saved
From: KaFai Wan <kafai.wan@linux.dev>
To: bot+bpf-ci@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
 john.fastabend@gmail.com, andrii@kernel.org, eddyz87@gmail.com,
 memxor@gmail.com,  martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org,  emil@etsalapatis.com,
 ihor.solodrai@linux.dev, shuah@kernel.org, nathan@kernel.org, 
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
 donggeunyoo.kernel@gmail.com, leon.hwang@linux.dev,
 menglong8.dong@gmail.com,  yatsenko@meta.com, jiangfeng@kylinos.cn,
 bjorn@kernel.org, puranjay@kernel.org,  vineet.gupta@linux.dev,
 mykolal@fb.com, bpf@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org,  llvm@lists.linux.dev
Cc: martin.lau@kernel.org, mason@kernel.org
Date: Thu, 15 Oct 2026 00:20:30 +0800
In-Reply-To: <b66b343a0a91711a6a520e11b284941771cbb23ad8c8f1bd5f831594b567b5fa@mail.kernel.org>
References: <20261014113043.640435-8-kafai.wan@linux.dev>
	 <b66b343a0a91711a6a520e11b284941771cbb23ad8c8f1bd5f831594b567b5fa@mail.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-10-14 at 12:08 +0000, bot+bpf-ci@kernel.org wrote:
> > selftests/bpf: Skip compare_text subtest when stdout is not saved
>=20
> TL;DR: Nit only: the new test__skip() in the compare_text_mismatch subtes=
t
> gives no reason for skipping; a short comment or stderr message might hel=
p.
> The skip logic itself looks correct.
>=20
> > diff --git a/tools/testing/selftests/bpf/prog_tests/prog_tests_framewor=
k.c
> > b/tools/testing/selftests/bpf/prog_tests/prog_tests_framework.c
> > index b4cd7c7ff439..ddb6cdc1579f 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/prog_tests_framework.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/prog_tests_framework.c
>=20
> [ ... ]
>=20
> > @@ -203,14 +203,18 @@ void test_prog_tests_framework_compare_text(void)
> > =C2=A0	}
> >=20
> > =C2=A0	if (test__start_subtest("compare_text_mismatch")) {
> > -		err =3D compare_text_to_expected("line two\n", "line one\n");
> > -		fflush(stdout);
> > +		if (!env.subtest_state->stdout_saved) {
> > +			test__skip();
> > +		} else {
> > +			err =3D compare_text_to_expected("line two\n", "line one\n");
> > +			fflush(stdout);
> >=20
> > -		ASSERT_EQ(err, -1, "mismatch_rc");
> > -		ASSERT_HAS_SUBSTR(env.subtest_state->log_buf, "-line one",
> > -				=C2=A0 "diff_has_expected");
> > -		ASSERT_HAS_SUBSTR(env.subtest_state->log_buf, "+line two",
> > -				=C2=A0 "diff_has_actual");
> > +			ASSERT_EQ(err, -1, "mismatch_rc");
> > +			ASSERT_HAS_SUBSTR(env.subtest_state->log_buf, "-line one",
> > +					=C2=A0 "diff_has_expected");
> > +			ASSERT_HAS_SUBSTR(env.subtest_state->log_buf, "+line two",
> > +					=C2=A0 "diff_has_actual");
> > +		}
> > =C2=A0		test__end_subtest();
> > =C2=A0	}
> > =C2=A0}
>=20
> This isn't a bug, but could the skip in the compare_text_mismatch subtest
> carry an explanation?
>=20
> 	if (!env.subtest_state->stdout_saved) {
> 		test__skip();
> 	}
>=20
> A subsystem guideline flags selftests that skip silently with no message,
> and test__skip() here prints nothing about why the subtest was skipped.
> The same condition covers -v in non-parallel mode, a libc without
> open_memstream() support, and an open_memstream() failure, so the reason =
is
> not obvious from the test output alone.
>=20
> For context, the skip itself looks correct: env.subtest_state is non-NULL
> inside the subtest, test__skip() sets subtest_state->skipped, and
> test__end_subtest() handles a NULL stdout_saved.
>=20
> The other skips in this file are also bare test__skip() calls, and
> test__skip() takes no reason argument, so the guideline may not map clean=
ly
> onto test_progs.=C2=A0 If a reason is wanted, would a short comment above=
 the
> test__skip() call, or a separate message printed to env.stderr_saved, be
> appropriate?
>=20
just one line for this, we can print why the test skipped. and short commen=
t for patch#6
>=20
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>=20
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/385595=
67568

--=20
Thanks,
KaFai
