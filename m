Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D260741440B
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 19:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069751; cv=pass; b=MITBJdLqtM+mbwFqw419eL/zehLqfQTAgdB4p2dqqofcAy7hXDV88NHu1IbjdG//q5n45/3KxcH3ewkklf2gf45IXeRTQ5h4SevRkYBtyWxrEAmsn4ldoa+idKybwobcaOfVl4/vItb65M6kwmE0BwJunkQN0TeDmOCUgBJOOb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069751; c=relaxed/simple;
	bh=S5QyluVCeJaGYGDzXLLVWroaz+aSorb6LrOcEvmKFPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtxCrRzrebMGaeElChM6olx8bH4RZITch8Jp6CqO7B76CfV0sfC9anhbImeYQEumBmD9NfsfX/rMzHyka/6klynCFIzEeEYYZ384wjersxWi2fVSDG5T6sDfJvMYSNwO9bzhYoRyUH7u1NFH6O3JR5XiJDFlIsXgKjr4kIua6YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hJJSjbxd; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hJJSjbxd"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97e9adae64cso111434241.3
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 12:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789069748; cv=none;
        d=google.com; s=arc-20260327;
        b=P8uNvDwOIbKtyDJ9yDF96BEFpG/jYSOSigoAK+UPF2mzJIOsfH2Y8x0gCi0AHVAiKj
         966mf9j23BJzMiW4Y6W+pwf5Znrqm6uCOhqOZt/pt8F+wtwqUUq4NZ40YCpfyTRiX4j6
         5BJ3kduNuuQsolPibVLOgRvo/lIo4ObxoD/JXHRufFdTsn2u94nn006G1RlcC8JSqDnK
         H6fMOnbFnvnlUP4OcmiA99aHMxHdVZO59ykjdfa59uN62YWniQeSta0o/jOP5sAzuaP7
         BvMk65bj8DpYOb+NIefm0Zr7X8gflyQuTK0rG0ttKS7xmHBhh5ENbWqY2v6hKpC68Sc/
         91SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c0ksCIwXvtdjyIyjGDoU93CuaajQfyrtF2GSd2bTtEE=;
        fh=qcbaL1H0Qrrv6D4fG/Ge/jb4pAnLl7PGzgTAQfVHWIk=;
        b=gGLxLc+Vg7OYaR7krrIwMtn8ioz3Y4s/4KgOk01V4dNfNZ+hDGuq6r9WE6JzK78pSD
         Bu8MU/b6/73yXtpPaM2mRbDXpMKfPwIKIedUuZZFYWG7YaXNEgiwjkQY8T2SBPvOJXXQ
         yVWQySk11zH0jC4ZrVzyey6uaAa03oW9S+lebakjX97QcG+XuZpiTp/bvevtiLX2/d78
         VVKLPDjACdZAbw8ckHrDZM1D3gYGTLJA43xIEDdfazZWpWpyiLQJhJXIQaFIz8xVd3xO
         u9Vq86Ph0DSM9tMysmtPVAWpb0/oaGME580MmESrSSSgGBbpEas3A3WGsXqV1FvpQiO5
         byVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789069748; x=1789674548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c0ksCIwXvtdjyIyjGDoU93CuaajQfyrtF2GSd2bTtEE=;
        b=hJJSjbxdHExbOZDQ4jDMI4vrXo/29l2llpvCiaKyLmKKqTMMIwy294VXpFGeQ/p3BR
         tCQ50ZDcFEFcIL3QjVEPZMx6/gj2aVomkGt+CH8HQbkMYu717o8wOd879EAbuw9Z1Fau
         Atekpt4+s9in5YNqB8E0pWVgQHVCIgrn9kaYS+WB8nOyxwhQQunsPdYU7posiqVdICbR
         Fom6j6jgP5dHRP1mj3K0P/VNW0EfdkYvCLWvn/0EmaUZ09/3LOHtNRYN8P+uCJ6cWG3B
         HephzAUWwyh5eLeWeOgGYQYIZYJuSG4ZoxIsCfxojuFJei3gVqHW8nCWWvaTBXN+6jwh
         3g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069748; x=1789674548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0ksCIwXvtdjyIyjGDoU93CuaajQfyrtF2GSd2bTtEE=;
        b=nWJF98oN5NmEGxhpDoS0VWLphnCgFY0e0tPhoHJTNUD1yQRiItAcj9tT7dfvddQ8TH
         cfXQ6ExhbsAhLcmetL+yW6+5ccS554P1prN2nPpxeqEgxTBodG7ACf+WNmuU+oitNn6m
         Y167f6w5JiYB1Rp9Ar/UhxKD88ZsA54Lifk+Y/qIEBBC+wDVDm/tTLWe10alw39GB0Lt
         c7PU2+Fts0gzV8Yqrgl0twZn/6NJCFEEE6m+KTnHLoqdvM2VqRewhz1Sq1YzJBeRPZzU
         i2AytWH9JAObGLaL6qKPoXFBx2M6AhhyMAOjfnZL5peHbMz4pA1T+bcQK+8rA1N3iBLE
         3KEA==
X-Forwarded-Encrypted: i=1; AKwUvBxL728ZJcEZ8cHPk/UQ0q4pw1gegeBAL1ogZYbFTbG+pskD+GsveGQ7EjZffHamwemg5n3pwPdxfDJgDzC8PXI=@vger.kernel.org
X-Gm-Message-State: AFuF++mbfHzIqQi0sE8SgAWibc8H5hgdD96sfwkbqtS2A4SE83raB8G/
	XiE8uzbA81vytPS7w0+B4P+FqICM1o0I7cK7D/X3/VYWgIaZ1tuVard+hxFdT197FcFhxrl4QOh
	dpHi5ZED0XA9xZ+vikeTF6WX7SRF4O7hy5QYBOyY=
X-Gm-Gg: AYBFou2EplojolnwApqkKU6kNG7/VcHyyaxCP6La3mr4/qaj+NFQae98LbCbva7OkmV
	vt3pFX1jbJJNfovpZeihRKL4X7FV/s+mcEimzba/Zqplp69jELtrqTDNIEruChKZztciYCWBjGQ
	YRwit9tUo6kAFnk3PCxvUAvOwgCGz6+3kVVyGv8DWOfQXpl/8ge9phIRTZVC1QPCoCvItkVlSiM
	7uvEtGxWzqu4Z3o7U2cSqOsSD4+nwE94q01Q97lRtU0mCK3/VqpCRnE4TDG/EM3OsBCseUpVaal
	fW/kvxcibxZ094AifdodUiydClfd7rWVflrtfo0vbmTX4LTGdsYDgl8nmLG5u7rdSpHLqAtAGyR
	9CfeAiu3lTukOconn9KVpOfAm/AuVna7NKr702/NrPa0HFxch7lj7
X-Received: by 2002:a05:6102:6402:b0:790:c7bb:43fd with SMTP id
 ada2fe7eead31-792a93b09acmr1242358137.8.1789069748029; Thu, 10 Sep 2026
 12:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823123549.1120133-1-morbo@google.com> <20260823123549.1120133-3-morbo@google.com>
 <20260824083538-d0eff358-e1d4-4af6-9e61-d4d816783266@linutronix.de>
In-Reply-To: <20260824083538-d0eff358-e1d4-4af6-9e61-d4d816783266@linutronix.de>
From: Bill Wendling <morbo@google.com>
Date: Thu, 10 Sep 2026 12:48:51 -0700
X-Gm-Features: AcwNN1V1PayGvWHzKjDrmg88i9kvWNJySD9iq9lUAMBCtIxwSRTkDSXpz02lxUY
Message-ID: <CAGG=3QXojhEsqvk-L5vT3w37z_VO+p1=8vrJCJ44sTz_V-YRGg@mail.gmail.com>
Subject: Re: [PATCH 2/2] lib/tests: Add KUnit test for struct stack_trace
 __counted_by_ptr attribute
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Ryota Sakamoto <sakamo.ryota@gmail.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Dmitry Antipov <dmantipov@yandex.ru>, Petr Mladek <pmladek@suse.com>, Kir Chou <note351@hotmail.com>, 
	codemender-patching+linux@google.com, linux-hardening@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 11:41=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Sun, Aug 23, 2026 at 12:35:33PM +0000, Bill Wendling wrote:
> > Add a custom KUnit test suite 'stacktrace_counted_by' to verify that th=
e
> > __counted_by_ptr annotation on the 'entries' field of 'struct stack_tra=
ce'
> > behaves correctly.
>
> The implementation of __counted_by_ptr should be tested by a dedicated un=
ittest
> for that feature. And I am fairly sure that already exists. It should not=
 be
> tested in random subsystems.
>
I'm looking at `tools/unittests` and...what in the world is it
supposed to be testing? It looks like it's testing absolutely nothing
of substance. I assume you want there to be a test that runs and
produces a stack trace triggered by an invalid access, right? I'm
unable to find any tests in `tools/unittests` that do anything like
that...maybe I'm missing something?

-bw

> > The test verifies that 'max_entries' correctly limits and validates acc=
ess
> > to 'entries' when CONFIG_ARCH_STACKWALK is not defined. If it is define=
d,
> > the test is cleanly skipped at runtime to prevent compile-time or runti=
me
> > failures due to 'struct stack_trace' being undefined on modern
> > architectures.
> >
> > Assisted-by: Gemini Next
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > Cc: Kees Cook <kees@kernel.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Brendan Higgins <brendan.higgins@linux.dev>
> > Cc: David Gow <david@davidgow.net>
> > Cc: Rae Moar <raemoar63@gmail.com>
> > Cc: Ryota Sakamoto <sakamo.ryota@gmail.com>
> > Cc: Kuan-Wei Chiu <visitorckw@gmail.com>
> > Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Cc: Dmitry Antipov <dmantipov@yandex.ru>
> > Cc: Petr Mladek <pmladek@suse.com>
> > Cc: Kir Chou <note351@hotmail.com>
> > Cc: codemender-patching+linux@google.com
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
> > Cc: linux-kselftest@vger.kernel.org
> > Cc: kunit-dev@googlegroups.com
> > Cc: linux-hardening@vger.kernel.org
> > ---
> >  lib/Kconfig.debug            | 10 +++++++
> >  lib/kunit/.kunitconfig       |  1 +
> >  lib/tests/Makefile           |  1 +
> >  lib/tests/stacktrace_kunit.c | 51 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 63 insertions(+)
> >  create mode 100644 lib/tests/stacktrace_kunit.c
>
> (...)
>
> > diff --git a/lib/tests/stacktrace_kunit.c b/lib/tests/stacktrace_kunit.=
c
> > new file mode 100644
> > index 000000000000..7ec48edf84fe
> > --- /dev/null
> > +++ b/lib/tests/stacktrace_kunit.c
> > @@ -0,0 +1,51 @@
>
> (...)
>
> > +}
> > +#else
> > +static void test_stack_trace_counted_by(struct kunit *test)
> > +{
> > +     kunit_skip(test, "CONFIG_ARCH_STACKWALK is enabled, struct stack_=
trace is not defined");
>
> If the test requires a specific kconfig symbol, then depend on it in kcon=
fig.
> Putting all of the code behind a single, giant ifdef is pointless.
>
> > +}
> > +#endif
>
> (...)
