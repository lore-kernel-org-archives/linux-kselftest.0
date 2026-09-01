Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9432E285C
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 18:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788285878; cv=pass; b=eizHCiAB9LlwFPl2F8ujv0OfPWJS6dXU/gcVCaikUYIbLYFfa1bkeFMUM4V5MXxFr3HYWpHSTvcjibbMsq4th79F2pxXtqlnFGZe16R6/OLyvapqZ0AasJa8+IvpE6M9nyjEEe3IXSTnMxuLaMtPEP8z4y1tDtQ7QxBnLppa7Xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788285878; c=relaxed/simple;
	bh=hUVVEFTVIn467SJywBoEi/ks8xT0q4iqiCkzqcTtTlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTfh0tehNr7v+pC4lOHl2d5R7wGWHFxHuVcvbXmMULHJ7Z3GemLvLrAPgJP5il95vRiAESD9SEV88JTSyH1ilgWqYQzH/fa7EQWEHU7mshKS9RjsAMYbpTMYzxvOCTrCK4PJMiRJD4LqYHmo9qeM5uRwOqv/xGnmy9Tjf0OS3l4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vf6ICtHz; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vf6ICtHz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso1019385e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 11:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788285875; cv=none;
        d=google.com; s=arc-20260327;
        b=KrpB9E1UVSZ3AZLlbbeLVRIX4//izpgkEKgVCRYQ1X9aiPY1hgJhonxK2Kw7omjj2T
         VbpISwWXqwluhkDUO0aMcpvw9Nyl88dj2WxeC3qsP8p5u7zDqHkvg+8lFN/4EphdNDXS
         7lBuEnlwt1X/fPxtU+Rw9jFhTWTMi2+YrWMq4/ygH6YP05YDaNsWuVVhMhH7vmmrqcp5
         rQdqEASnK/2rro/7+uTU75406krqGQeZea3rtHjVIXt+hfrUuZuhex0W0C9e83N9QJs8
         iOChD22ztPr2a+KCRHN0E62OuDFhHcNLRYBQSzxvsSH6uCq2Uu0+uqqcSVwma9z6+0gL
         IDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hUVVEFTVIn467SJywBoEi/ks8xT0q4iqiCkzqcTtTlw=;
        fh=9jhzFPx94PGFavgIEYT/BZOwZLYwAFR04yKxt2ysqZc=;
        b=TzJ33380X0FTCX6B2e8qLj3k3PeV9qSK2uaAAJKtI+xU+Ypwwz7tY5LTfijpauqhvi
         us31ct49OvvssD1/nXZ7rmCwXqtGMbYuFdVTvdc2kN710lcl1B+XKqP51yEZnPjUjOdU
         ETY/pZuDfwYfu5DOQNraabuh9TP1DU1dwH8ubNwbonexzWkIU1CfBJXpYWTBE0OoP0SU
         LTNxQNcVMAWWEifvJMfs/9MEJUy6rkmzofAHfW50HP7ip74vzQoC8j3f/H5ZK/oNN+Jh
         vVEyX/H2zmVt+xWDHawvz+YR3skpr1An8ZG3dsULX0b/2QRuiJKsVJQkn1erCevtfQzK
         XlLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788285875; x=1788890675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hUVVEFTVIn467SJywBoEi/ks8xT0q4iqiCkzqcTtTlw=;
        b=Vf6ICtHzn/LDfQuY7Z29s+dgl6mgQc6v7VXMT8JRZjShdnRssZ/LFMRcRkaJdyI1j0
         RYNvUDVThmTNmdcGBXgr2Bzt7/sFe/wA15iEaMq1m0E3ILsQvhLjShFDk3Qzct3X/lcz
         8sBhOVjDL+v6jmyb5cwX1nbsUijkcK4z/Sw2Ph3LKpkVQbc7flb+3EuQvFJgyIwUBX3N
         ReVqhksUcQ5+udyeRvB/qywZwoM1QRNh84svFrFAOKZ19iQ4vnBBVMrdh0jc0hEanFvm
         3eYln+BjgvuH6hxea5JIVXW4kzv+WgJRAQujtzNloEU0PR8mM0diQHHpKokb5uqztoSF
         FPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788285875; x=1788890675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUVVEFTVIn467SJywBoEi/ks8xT0q4iqiCkzqcTtTlw=;
        b=nrii1THpNr2c2upgsWWTImzmi0sjGodIQawtcYOj/dpdJZBlE2gjePgaoNqLJRtYkZ
         LTR4vL81pkwMyOLaOz5TeopoeGmaITfv85lMpL/vZSjjhmNfoslGWfGlOc02evrNMdgn
         kwQyod5onirh5WMP4hWrHx9TZpigepKUo9GlQtrc3LHhc+AdOunRl0Q/VoMpBi8AH90T
         8oudXu/nIvol+6azJnjpbtYKnjNhj34aFqodnd+iR4xHPYQighnvoFm3SBfPLya/SuHg
         Tgi41hv5Fy9gjHZqV0fHTVFyQuVgwh+hmgDM0dznerNK3wHwC+KpQJLtSL85vXRlTCyZ
         H30g==
X-Forwarded-Encrypted: i=1; AHgh+RrVhqEy0iVQ82wCWhta5Bmq7eCgyyY9QJsrkdjv0ItQjpD+/Fyzy67CxyJetrApbZmkYaldm8UwigQB/xk1JYY=@vger.kernel.org
X-Gm-Message-State: AFuF++nwRiVwl4zwEJcIy13TjVNH4n5KfVrgiA7B4bqQqstoK+1aKnxz
	2ZeJwAcjGAh1cqt5d/e0vr6W1sJW00/2zJFU3SiJbNnQvGmQv/5nEbPDmMZBIWHsJbwBHt20YQq
	IzOFHcYvv0n5fUKe8fAgX9U4R4Q1z3XQ=
X-Gm-Gg: AR+sD10N8ti2W9GV64Go4FFihpwXZlYMCM6htTDxC5PxWg2h42ZymnIZXsghLaIeFcw
	7c8ZHV80aElW3p23Fo+Hytykubsv0GXxD1a0BvtL7nhmNana6CU+e/TnCgQsDwrxQm4uKl2Hmrm
	iy3YCEgTqxc/yxvTB0iXWfPYERejxtQiFfzOLV6GoJtzgre7UAsgVm/hhCh0W8IifzcF//1cULT
	fh2umGQBpwCfvQgwqTV7ALbeiq2ahDHzqcir5TgWuvZiJr1KOAiNZld6B8nyYRj6/PCUOyf+LZO
	LKBNMCeTyrChQrPOKWXnMSYEHwTiaeSGT4GSCurBg+hYsFcj6IOWNPq3Bds1lse01Yp5XkKI6z1
	fSbM=
X-Received: by 2002:a05:600c:a012:b0:49c:d818:8764 with SMTP id
 5b1f17b1804b1-49cd81887aemr257261865e9.11.1788285874997; Tue, 01 Sep 2026
 11:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901161317.3468233-1-joshua.hahnjy@gmail.com>
In-Reply-To: <20260901161317.3468233-1-joshua.hahnjy@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 1 Sep 2026 14:04:22 -0400
X-Gm-Features: AcwNN1VidmfJ5pX46qChkksGP0fJtnDQ2Hgbr8MA8crLeorD9MO_R1ONtmYEAUQ
Message-ID: <CAKEwX=MD_EcAaLzMGnMytVJ_KTGmv=hpR2h-DD+w0oJRjzkg6Q@mail.gmail.com>
Subject: Re: [PATCH] selftests/cgroup: Skip test_no_invasive_cgroup_shrink if
 zswap shrinker is enabled
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, cgroup@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:13=E2=80=AFPM Joshua Hahn <joshua.hahnjy@gmail.co=
m> wrote:
>
> The test_no_invasive_cgroup_shrink selftest checks that when a cgroup
> has zswapped out more pages than memory.zswap.max, that it does not
> trigger writeback for other cgroups. To do this, it compares the
> writeback count in a control cgroup and makes sure that it is 0,
> and compares it to the writeback count in a aggressor cgroup who
> does expect to see writeback.
>
> When the zswap shrinker is enabled however, there is an additional path
> to zswap writeback, which can happen independently of reaching the
> memory.zswap.max limit.
>
> The writeback counter cannot distinguish between invasive noisy-neighbor
> driven writeback and the zswap shrinker work, so the test becomes
> invalid.

I think writeback in the control group (zw_group) happens right during
the first round of memory allocation, but there shouldn't be any on
the second round (as the second round involves writing to wb_group
only). So if we read zswap writeback counter of that cgroup (zw_group)
right after that first allocation round, and make sure delta =3D 0 after
the second round, then that should work for both shrinker_enabled =3D Y
v.s N.

If it's still too noisy, then I'm fine with skipping it when
shrinker_enabled =3D Y.
