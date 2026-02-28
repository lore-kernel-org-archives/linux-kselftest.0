Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1AF29BDBF
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 21:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772313967; cv=none; b=kapQk8L4Pne6tsbutedE9grN+Py5lMJ6hyCfLxv+cfKMxapw4h336Xarw2JKukk1Mc+JasUDWkrDCgvzJ+3XXQ2TKrtMKctJPXNxctMjEcN6ThRoRUMQnYJ3807kP3oe92JUlBCGW/iyJU2xnAap8Exa49wZJbjDHhUYuQCpR98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772313967; c=relaxed/simple;
	bh=47ANglfpJaT9gxs4Ja0c8tB6Igre4d/I8jTE/gJ4xwU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EzuKiaygvRCFhjU4SQa8LICZFLQRZJyHnVvmiVqKMg4b1O87wEZb6WGw0aLJH2vuXBHWCRg7ppzWXYsnJCLuNHPnj/zeB3qtrvSLWUOB+QYhil0ZFlgh+k4YtH3Qjk5hdbJH0wQtMi97zp5FBmP+A35NSwpXunSEFAEDN0ZSME0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b=bxj/dmtp; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b="bxj/dmtp"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-899a5cb04f9so42356046d6.2
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 13:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20230601.gappssmtp.com; s=20230601; t=1772313965; x=1772918765; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nihN1Pv89Y5xMabUVLFDrUWeZpS1i87V0sy0blxBCWQ=;
        b=bxj/dmtpLctyN001I+rson+kTAfIE8ALAwtDio5SHHwQEN//U6FueiPAHIouh7JH1r
         cPQqk4aQQQ1XqwYCrzaW1MQ36Wx08eIylYXxZ6Z49GpWqHpJ/t1esKeiJU8PNFxlVHku
         EXmSTPIAIESFNNPQgOqm6PI75sTlr1c8GSOVoVTQu4JBKla7j3/+RX+aMJbCf9DYDFCa
         ETKhy7b3VA/RoWtXtg4rSR1V2jecj/sbGdwHYeZO60E8OGbW9fIjQSQftamrSnCdOuF0
         OnWSjmqw/42wzL7hpjizCk+KdhVLjfQLJ9y0/3DVeGWQyPzW2miNbAEfPQ+hwCpzW+Qv
         yaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772313965; x=1772918765;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nihN1Pv89Y5xMabUVLFDrUWeZpS1i87V0sy0blxBCWQ=;
        b=Qk3TMRtSUyhvYbFv38Q7rw7nTxQNNznFZYs7xG6eh9Ne5EErz6EVusvhSa3x7lDjMo
         rlRKlgzPy5cwmog3h30ii2CglXraE9lZMdXLP6jt+6GGbwAbx92rkSbJhHkH3CwVrTOk
         W8gkJd6Wm2DmOrbUy3L2OHJnTsEgI7k4J/GywMqLtj69vN2i+o+qnznBaIKGpj68utso
         yU0LsGXHiaIleq9wLCI7FL0s0+SWv3CuSAyIxcRUHechEb9Bfnf8Mai67i2RKHpiuZNB
         0GmIHEpNozIkcA5Xr0GXrk5N52gl/Al+NYTslwlaSzdniVf6H1iBb7H71HjjPkvpaBOu
         WwPw==
X-Forwarded-Encrypted: i=1; AJvYcCVo5XXFKwBBW4jT+iIAnm428z9jUOzle8nQ3rxvOIL4kiMzz39Gq+iatwsw5HjLiIk8uNSXE1Z62kB+7afzVd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiGoXJmkp/NpGbHHsI5RBVMasY66rL015dmTVxQdvs8ZxM2s+m
	Io0zcIsAXI7DIiZ0SBB054rxLc9VA6bPJmIc1v9PuVxlNU/DVAHPD2CSn5uUOBRQGxg=
X-Gm-Gg: ATEYQzzaL3aonLwPx51xvwUvgwukgOm/LGX3DxtKo0R3bMFNUD/RpsLJVLzetTY25+t
	bLXoKwDHKiiQ5LjySGbrlz9VnYd6XWSGXshFwyqhn8/qqQVpGSnGDjJwR0EcBblKbjzu42bngYl
	bwjabrX5MsqxS/4ZpnWza78fb0WpKaS9qzoDt9bAMY1tAb4ZEjNr9UPgrnNnBzVCWTgn/9z3aZx
	kVbx22vQryghzDEV66oK9siZBCaXFsdH7mzCNNpb8d+mY0ErN60ejh/zXBhO9fMWSrB1auFSlF5
	iRd6Up02AaSM5c86aAxvDjqvue6NgEDhwhKfmpF/BrbVaRqapz/MNdNfA5358Yq0zI1kSawL/6P
	42ApnBESY8A9GjDVzopwbH8pVeu3x5ln90aTCpB4ZxDqsRuYIkxFjm0wS4eOQCsl8hWqT37a35n
	vDaxRj8no4MjbDEYVCTQgAH/LduQ6J3iZGRQ==
X-Received: by 2002:a05:622a:203:b0:4ff:8da6:2289 with SMTP id d75a77b69052e-507528d2b3bmr92975801cf.27.1772313965464;
        Sat, 28 Feb 2026 13:26:05 -0800 (PST)
Received: from localhost ([140.174.219.137])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074481c0e5sm84462561cf.0.2026.02.28.13.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 13:26:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 16:26:03 -0500
Message-Id: <DGQWV6Z1YV14.1I11KQX54LSOQ@etsalapatis.com>
Cc: "Hui Zhu" <zhuhui@kylinos.cn>
Subject: Re: [PATCH bpf-next v3 0/3] Fix test_cgroup_iter_memcg issues found
 during back-porting
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Hui Zhu" <hui.zhu@linux.dev>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "John Fastabend"
 <john.fastabend@gmail.com>, "KP Singh" <kpsingh@kernel.org>, "Stanislav
 Fomichev" <sdf@fomichev.me>, "Hao Luo" <haoluo@google.com>, "Jiri Olsa"
 <jolsa@kernel.org>, "Shuah Khan" <shuah@kernel.org>, "JP Kobryn"
 <inwardvessel@gmail.com>, "Roman Gushchin" <roman.gushchin@linux.dev>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <cover.1772261955.git.zhuhui@kylinos.cn>
In-Reply-To: <cover.1772261955.git.zhuhui@kylinos.cn>

On Sat Feb 28, 2026 at 2:11 AM EST, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> While back-porting "mm: bpf kfuncs to access memcg data", I
> encountered issues with test_cgroup_iter_memcg, specifically
> in test_kmem.
>
> These patches are my fixes for the problems I encountered.
>

Nit: Could you be a bit more descriptive about the series' contents?
Cover letters normally focus on what what the patch does - for example
the issues being found during backporting is not pertinent to the patchset=
=20
itself, because the issues are still present on bpf-next.

> Changelog:
> v3:
> According to the comments of JP Kobryn, remove kmem subtest from
> cgroup_iter_memcg and fix assertion string in test_pgfault.
> v2:
> According to the comments of JP Kobryn, added bpf_core_enum_value()
> usage in the BPF program to handle cross-kernel enum value differences
> at load-time instead of compile-time.
> Dropped the mm/memcontrol.c patch.
> Modified test_kmem handling: instead of skipping when nokmem is set,
> verify that kmem value is zero as expected.
> According to the comments of bot, fixed assertion message: changed
> "bpf_mem_cgroup_page_state" to "bpf_mem_cgroup_vm_events" for PGFAULT
> check.
>
> Hui Zhu (3):
>   selftests/bpf: Remove kmem subtest from cgroup_iter_memcg
>   bpf: Use bpf_core_enum_value for stats in cgroup_iter_memcg
>   selftests/bpf: Check bpf_mem_cgroup_page_state return value
>
>  .../testing/selftests/bpf/cgroup_iter_memcg.h |  2 -
>  .../bpf/prog_tests/cgroup_iter_memcg.c        | 38 +++++--------------
>  .../selftests/bpf/progs/cgroup_iter_memcg.c   | 18 ++++++---
>  3 files changed, 22 insertions(+), 36 deletions(-)

