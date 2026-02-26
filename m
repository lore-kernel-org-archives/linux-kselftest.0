Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C31722127B
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 15:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772118124; cv=none; b=Z7EVCMPWXKf0qh3Jqds/CYbjneSq1iMfM84Dmcju6jdpXDmZTZHUOpD2ddzVcSmp7WMf4Dy55xR/UGVcf6hQBXZbzWMaFwuVL/TlgeMexp3xPAZCjs64t6PpKhOHBuiGr7OyuvDA8+6UoQZEARUtlWoKvH3oRSxbpilGrBKUrao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772118124; c=relaxed/simple;
	bh=EPOgpY7qfE74IS9r5PQZ6CfLK6gZgb4B14BVZERxa6E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KyAAb8NvSg8JJA6wFx1i+vF8jDTqid0xoUZcezUhsl8B2J4WAb4OB6PmUcdzEkDy9SkyL3XywEVyrmogR3o0CwUMDtmTkNE5n6xxnNgND3jOlkCEeM/qu6HCpJ+5ECy/5wvvKamfkFh7Jc6J276nYCMNqZs0KkZU1yB/yUODsTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7VKWp+/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7VKWp+/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso9160465e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 07:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772118122; x=1772722922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yI6/1FhqyJ03G1hV3ALjmIdk1suagRQbbHMbWSVeSlQ=;
        b=D7VKWp+/5WlU/myEs9CZwsrc/Tbe3xFKN6pNal3n1WSGFjy5BceURDO8/XiRAfHieZ
         kERf/fntdkdS7fnzkMj/UZyTjUvWxprl0GA+KXFISEcRgwlFAGAmioH1InG5jI3JBsOi
         rX0Ode3gItXibuVIVbnkzcWNCEZO6AV3SmQyFkIXURbyOUPeXfiG3aWeKUcvJ4WEY59z
         lxuorAnSYw/5BR8ny9wIEM82PIbfQw8DmKRYqTsxrXiF5u+ff2BplP3s4r7azHiUCO5a
         wsASfFrOu9qQuXIqz8eHTgHAgdP7Z/G7XgQdcdyfslA+0bsMPb5nX6at1tXikQN4WM0o
         HNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772118122; x=1772722922;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yI6/1FhqyJ03G1hV3ALjmIdk1suagRQbbHMbWSVeSlQ=;
        b=RDpW6f/k8EyTr/5Y9Fog3OIDdo39Lz7hjs41fdKVjolPyXsAKOBHxZPJT1GbNZyNCo
         vDKYj7A146n2oAI2QBvsMcT1nF5HjLuNx8Hqjl0DJJMiVjAb17/+cJrJ6TxdF90YykST
         VmfniiVQ+3psq+CzWK/1RHSiuJ1joRe7vTddKAxuhYRphzYRDGemuOC5J66D/kNglcig
         xs1vaeZWvILGDSl6x2ixGX8om41mItRwvCQazD1oilHnVZOXLFk0gazrfMfTjnj0VluM
         2xhzdNm76loF+IVaD8mWLm+BlibooiPPEm1669ktL/RrqqBfzl2gQcx5FulTQrdqixmh
         0hEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO3K+QvGYmjfrpDjgV/GirHMfzLD6h/VR1r1+Gmae6/ufRi+t6kJ1cRNFjnySxY1sM78sWhtocDFrN4wKq+E4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQwXdShSKKQNsFtOOTcobU2cKZG4NkufUCHW9DETQtNxd0libI
	TVrpjbUm+Y2xYFPftAKNGLgF/tjbHZ0wBOWs8L07nUtQXorVCQF3j7mj
X-Gm-Gg: ATEYQzy/ff15Lr1AJXq2v0tPzfLOeQFVrtfR8CKfBBQLj5gfuw7LlNlmk2wTqMaAy0P
	s1IUxNKJbbwcLD67KpkTYY/3CO3JRVVpElMz5AsQDWIERwRH7FRrQfkcWwABTzPAeh6LYyx8Uau
	0a5VaW67i5MrKopu0Ivg3cpUdoe2zQ+8p5is70QUnUuT0UUnks3Fahk1TZFT9DrKbjKK3UaVUwz
	X031Z9/5cw1HpuJSud5ulmgNgiWbay1aLud+KS0BXw4IueKqYsDbD5wbvI+4RR6YQyIx/0mET6x
	KnTDML4NfAeloPWoV+mG1DDAPROiKpI5VL1UqCjQHi7gqG/tDIbOB02Df2QTlhCya4cMfnztC9O
	2tR3RKoVaWbLtI6lFOaJWnsRRDgPdCyNrXhVdd0hL7bNj63ZXqRmvym+qssnp4watvov9BWrmXJ
	noVh8wh7NVQxi9U4729Vtgi2vrymz4bQ==
X-Received: by 2002:a05:600c:4fc7:b0:483:709e:f239 with SMTP id 5b1f17b1804b1-483c3decaf9mr43090825e9.22.1772118109848;
        Thu, 26 Feb 2026 07:01:49 -0800 (PST)
Received: from localhost ([2620:10d:c092:500::5:5405])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm91724925e9.4.2026.02.26.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:01:49 -0800 (PST)
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>, bpf
 <bpf@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
Cc: Quentin Monnet <qmo@kernel.org>, "Bastien Curutchet (eBPF Foundation)"
 <bastien.curutchet@bootlin.com>
Subject: Re: [Question] json parsing and bpf selftests dependencies
In-Reply-To: <DGOTPHTTR5ZE.Q7ALRR86ZZ6N@bootlin.com>
References: <DGOTPHTTR5ZE.Q7ALRR86ZZ6N@bootlin.com>
Date: Thu, 26 Feb 2026 15:01:47 +0000
Message-ID: <87ldgfpmzo.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com> writes:

> Hello,
> I am pursuing my quest to convert standalone bpf tests (from
> tools/testing/selftests/bpf) into the test_progs framework so they can
> be executed automatically by the CI tooling.
>
> I would like to continue on the bpftool tests, especially
> test_bpftool.py ([1]). This one involves quite a lot of json parsing on
> bpftool output (to validate that some entries are present in the
> output, depending on the used command), which does not seem to be a use
> case currently in bpf selftests. The first tests may be handled by some
> manual parsing (eg strstr'ing keys in the output, that's what I've done
> for the recently converted bpftool_metadata test, see [2]), but that's a
> bit fragile, and there are more complex subtests for which this loosy
> strategy will get even more fragile (eg
> test_feature_kernel_full_vs_not_full generates json output with two
> different commands, and tests the diff).
>
> I then face the need to have some proper json parsing in test_progs. I
> kind of understand that there is a will to keep the dependency list
> small for test_progs, so I'm asking here what could be the best option
> for this:
> - is it ok to make test_progs depend on a new json parsing library (eg:
>   cJSON) ? and so add the library to CI images ?
> - or some implicit dependency on some CLI tooling (eg: jq) ? and so, add
>   the cli tool to CI images ?
> - test_progs is reusing json_writer.c from bpftool ([2]), should we
>   rather write a custom  json_reader.c as well (even if not needed at
>   that point by bpftool itself) ?
>
> Any opinion on this ?
Can we please make that test_progs can be built without json deps and
run tests that do not require them, it's useful because we build tests
in a restricted container image, where adding a new library may be
undesirable (I'm not talking about github CI).
>
> Alexis
>
> [1] https://elixir.bootlin.com/linux/v6.19.3/source/tools/testing/selftes=
ts/bpf/test_bpftool.py
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/tree=
/tools/testing/selftests/bpf/prog_tests/bpftool_metadata.c#n49
> [3] https://elixir.bootlin.com/linux/v6.19.3/source/tools/bpf/bpftool/jso=
n_writer.c
>
> --=20
> Alexis Lothor=C3=A9, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
