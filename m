Received: from mail-dl2-f32.google.com (mail-dl2-f32.google.com [74.125.229.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9753C108B
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 20:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108801; cv=none; b=STUihTQxoMPtOfhiJzMFQ62xPmkGj3DDa/PeLvddSiQhJChb4U/yPgXl5c1IUGXfMjHV/1fPfhdBY2zYUGc0RLaKarUABwGUzquoztcsO1Ea65Y9CVWsoVcysfc0LLj3d2bMbkwK9M1j2E/0GAqw4PCVx5AiEkDJhcE3JyLoHKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108801; c=relaxed/simple;
	bh=b7yiiiVzjNolnX+5vmFrNaqT8CYZKoWM7E7gNxa2Uq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=roo2uVQZI9kS0aStoDqR5X9DYkVG83XqZQVmKfzQVZw23p2iffKK5qNxK2Fz+7uPM2nDzYzA4gOa4uvnFBiH6xYtowPahtftLhf+ugHqTLeW9HuXYvhdvfSr2t3fg0ds7WiOiGNLRrWKMHvkQEREDM66oCYVsWdQs8acsYYP7D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QM+/jddd; arc=none smtp.client-ip=74.125.229.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QM+/jddd"
Received: by mail-dl2-f32.google.com with SMTP id a92af1059eb24-1437b77c274so132617c88.3
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 13:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790108787; x=1790713587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DmZHmFTN/GI+Q0CTZwWa92OwQr166WO/bCQuEomtguQ=;
        b=QM+/jddd7ZJk5RM42t2RB4Q4/3g6jjfUe9fIxR75XvaQBVmBg5snPw20a6GAfP8SCO
         3GdK0mh/2IWbIk6S8F/ldDJkkJBY8T08twPnuvbX3zMe/6aiqjnBRP3C4RGbczdKKoEr
         A19FwjX1fNFlQ2gtF76j/KtIQHTFuD05M0oYP3qQvl5XA6uAiBlYqIsa3/5QsvRa3LHi
         1MwUY7/XAqScJ2s0uinK03fn/Tm0L3eO2fPsrC71dwzYs5dKFUZ2rV7qK5Ks8lii5tk7
         Mbhel+wCtN2TvPYLEoU5KZtxWu2VRXc0H77msMdKV8wrV2gb2XknQsSswB9wcgShx4gk
         PuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108787; x=1790713587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DmZHmFTN/GI+Q0CTZwWa92OwQr166WO/bCQuEomtguQ=;
        b=1RQ62G4m8Ols5Q9ub6MuTvAqW8wRmRNq3+F4NjcIdagsUseY8mhkFdgw+1dfVUpQUx
         2H7nMmvqKTuLW323b1cnj68rl6NUW/9DUwRC4LOBuUF9NOt+pE4nSq8qxpQKjVRelo7x
         NnsrvDmTdp47p8CmwjcU4CtBNOcW5yHTnvSqlkHgTDcl71N9Q7U/WEUh/Fc8TgXFCsw/
         g/9XuUa3Vs/IophnGEXMVQ2dNpuJsN900NtVhwZwfAt7hbfzWnN60rwWO+pVsRgzgrq8
         YacwkaFyEjAEaVXceVx0HFwOzaTtrgFSkivagjpmyULOfwCQuaYa4xPutpu0+keI/4M4
         PMnQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3USNkotxa6bVBjBh2CvLTaJzEe/w77c4Fwe2Y8DaDTc/iwjFdjLYhs6eFtNjtwdr88MGc7w7IatWQHc/orD0=@vger.kernel.org
X-Gm-Message-State: AFuF++npH0ChxaADgfL5g94awXVZYuG9Q3KXTUgwKeqO/eYASJGObq89
	zJJS6zn1IVCdyoHQ7D0LsvlZf2xQnnnN6zz+KK3OBFDFYAHqSPeIlJ6N
X-Gm-Gg: AYBFou3lBfNyOLm256Regz2Cyz0KPTtqzLxcic9SNNpczzewloipPBk2HT7SfNe4be9
	/k7LN5shJU7/XcFsYZULwbBYR0XLT5vargWrB16NzEMOJXL81q9gmSe/5FdnlARRIECS+o1NLu6
	IEqjzMZEM8Ota9inME0w9mgRS5mSt84p/SuoBz+cdq+mQyhUofwnU9SdlfcSo1MXweB1aIpnmoY
	Kmtom5HcgpGj87Pah3e/q+dcjWM2XR86A+Qtt5T2zx361W1j8LYhR3ueawkmxcQ9iD1egJ1+dyR
	0ewQbz7FkJtSdkD/7i5/NV5d9v/0XnkhU+JJDggOkoW59RFc6/d9sUZpkosJEGCYRVWU0QpwaKe
	qBt19fL/NvOrjwCTGkw6skHfSyJ6KJglLB9wyWncMy+1UqDeEURfWb84MO4gbAAb9Gv/N5muB4w
	aNqJQGKweP9T2u4Db68G5LYrsRgZBan6ZEaueUXZ0AEdgBEMWOr0WA0xXu/x0AUpz/Iz5LKRzZE
	DwE2fLpXKGzJwbZvN3IlLZMdB9lhd2C5aEz8qoe1ssqVtxXAQKgsznxsZC08/JICRZzJohl3EI=
X-Received: by 2002:a05:701b:4546:10b0:143:298b:ba79 with SMTP id a92af1059eb24-144f91ed3eemr496551c88.40.1790108786209;
        Tue, 22 Sep 2026 13:26:26 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:f16e:2102:25ad:9cdb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm1149953c88.6.2026.09.22.13.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:26:25 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	hemendranaik@gmail.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	tahiliani@nitk.edu.in,
	vishy0777@gmail.com
Subject: Re: [PATCH net-next v6 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Wed, 23 Sep 2026 01:56:18 +0530
Message-Id: <20260922202618.25970-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179002340887.2160803.8030592378545876774@kernel.org>
References: <179002340887.2160803.8030592378545876774@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review. Replies are inline below.

> Can this case ever pass with a released iproute2? [...] Turning that
> blob into the literal tokens "prob", "delay" and "deficit" requires the
> companion iproute2 change [...] which is not merged. [...] Would it make
> sense to add a 'dependsOn' probe so the case skips when the userspace
> support is absent, or to assert only what current tc prints?
>
> A related question: the pattern hard-codes the exact label text and
> ordering of the not-yet-reviewed userspace formatter. If the iproute2
> side lands with different wording or field order [...] does this
> kernel selftest then break while the kernel itself is unchanged?

We'd like to keep the check as it is, without a dependsOn probe.
There are several cases that were written against, and still assume, 
newer tc wording with no dependsOn guard at all, e.g.:
  - tc-tests/qdiscs/fq.json (commit 3007d8712c9b, "adjust fq test to
    latest iproute2")
  - tc-tests/infra/qdiscs.json (commit 56acc7f51974, "Adapt test's
    output to HFSC's iproute2 printing changes")
  - tc-tests/actions/police.json (commit b7df2e7eaef7, "Adapt tc
    police action tests for Gb rounding changes")
  - tc-tests/actions/bpf.json (commit ac2944abe4d7, "Be compatible
    with newer tc output")

We're doing the same thing here: this test is paired with the
companion iproute2 patch, same as those cases were paired with the tc
versions they were written for.

> Can this case fail intermittently depending on the host environment?
> The assertion needs a backlogged flow at the instant the dump runs
> [...] its exit status is discarded with '|| true'. If ping is not
> installed, or the installed iputils rejects the fractional -i 0.001 /
> -W 0.01 arguments, the fq_pie queue stays empty [...] Would it be
> better to check the ping result, or to enqueue traffic in a way that
> does not depend on neighbour solicitation timing?

We'd like to keep the ping command as it is. The same pattern
('-W 0.01 -i 0.001 ... || true') is already used, unguarded, elsewhere
in this test suite - for example in case a4c3 in
tools/testing/selftests/tc-testing/tc-tests/infra/qdiscs.json. So this
isn't a new risk, it's existing practice..




