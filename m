Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843244A40C
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 10:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518987; cv=none; b=qVifPV90YBVtlj/9h+xwjLFzRwiJ7sRGu/S5akEXYQMKsOH41sC7E5NSlgLkVvkKMHK32/W32kSrUcGVTxNZu7dDAGHWU7abQn0+IXxsfoxdcXJpXZqL7kFUPWrDTi6biUHOW3uURMvuTFIJp6s+3Z8gVuIUVR1jgx87Jp3Y5qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518987; c=relaxed/simple;
	bh=14oWaO8y6kGduZOTbJrPXUHKyBBu9i5dpXXvYnAKRSM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=a8TPuL+vCkxiEFwIT3ZcpId3ruOPxmiKpurgLpfuR0KqraLbaSEZFHsmmn3c3+53UKcw9deAsD9DykPbJjOeQeivVxvXmnBoVrL8vPGefsDwkmckMwE8v6SSnp7KUyazABwdG6CYmoVt9EhEIKLhtFyDdH61JPfuV+m0QbUn/rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIORgWTR; arc=none smtp.client-ip=74.125.225.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIORgWTR"
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-4926d058720so2681305e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 03:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518984; x=1789123784; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R3u9g8flI7rRarp9QuZV2hara4otiGm0KnyRuI1Bei8=;
        b=bIORgWTRvmWjQSxSXxLvJxYYovQvEDHq2HnOUeNQtouc8LdXexBsJh9l2mOtqzqMBm
         +Ic7jcmbtp4Y2pj1vqYtPiJtTobfTbRDgSgx0l9Kmyr7k229qbc2v9YKsJ+wLwh+6iXT
         /t49JXB2swCnHIBNbHgbevKa1qQ4SgQZ3pkmKvghB9f3YNR8n6SmekCpGfHrOGUf4ekO
         nnMNHhMa1/hRm0X6RfC4egbmEkkWnh+UWw42b3aZRl2pnYl+jyStUVUUbcJ/fLVhS7E1
         FFgCttQvDdXrpPiP+O1gQ/6ZuR34mHoYcN6jN5qmFmidtzYzXzoip6jCGksl3zcGogPe
         CBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518984; x=1789123784;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3u9g8flI7rRarp9QuZV2hara4otiGm0KnyRuI1Bei8=;
        b=jsxvAPTmnC3bN5DUqcWwNwDfbskl6GJ3iecarkZqBmkrysHTYnM7KQFP8KSqzBN8ue
         D9Os2+Bcy8EzY1+YNifmDPFsO3X1mHEMchFoAOubPxCikSU5jn1FjJAmngK/sWCmrrt0
         0MwGoEV2Xa1v1lPWjgkrYxRbYZjAOnfSjueR7KUq4J5hEidQwCtz39v7/Aq31hlrW7zU
         JYsETk2XIloSxMXjN5d6ewX4pVl9/1JUQ2d7vDilHFn2oK2tGZGVYdw5fxOq/q+nnh9O
         MyJCNY88v4kmTjkLrF0qtLFbTBY3VwFLZzYakuLSg4n1Xogoa5T+Mz2WCTCgbGoEzneB
         Bidg==
X-Forwarded-Encrypted: i=1; AKwUvBxivWt/oEvRetcUE6dPXdWJYSHBzMsjR++6lOeT7YXSf+be3jXhaXIz7r5/J/IygLFfJDdlGNzYZWNom/apNUE=@vger.kernel.org
X-Gm-Message-State: AFuF++mq3Tu1v/bWSwN8W1IS1mqMH/n5GtftUw1pkb9euyJhfX5IN4Jw
	2DiAbrbO8J5quLGbvMUKsesiswrHxAhhV4KO8TSwmB1OymWqmc//SdLe
X-Gm-Gg: AYBFou2/YtvfNlcqQfp4einYNDpuN3sn7FfuhUOpMGMDmQ2tZsdEuRES/JX7gQBqift
	c31/D44iaBdzceEMjGMOfWcSjxiOpNMhviEJ7rm9MWzg99yi7j4Dfpohks2AyZCImY7Mu7SwlsP
	7aJ8BJlZpiC75VspSwpSTeKbiWJJf5HRY7zQI5zmF1pmyLiXJnqO/fQ/YB7tMW72gUpCnyvfsl2
	8sL6+HUYUjz1O3OI+Yb/tUg08qAKOdkgEP6+fJ0T2wm1IdkP4l5XZXDgmNu8/IYVYpMgec3KGPO
	sQcWgEmqlaouzT6Xkj6aDHUDd/EzjN+bj+B5r7+uEGkniDhU7XkVMDr9U09Sl6UnqPpQ80RwD3R
	Z6gLlX8jphCPOxdDym1Tcz2vQU2g5KCnkmsnySnGle5bjCkY6d9tqGYrnWTXwsF+PlKVEt0mUsC
	HXfFoum1ylWFNm7SgouSVlwLwpsZ4b+FS1H/B7dpk+4kfzWpbBlO3W9IeU5p1R53p/L3AzUijLN
	cc2XFCK1/7Tl9GnwGpaMKScKlnd6BBFSXT4XV8f5qxMPGspw5ffm1XyXdoCJdlLL9FHHEoQk1nV
	jzdlD3sY2ozQo+dY+nwUC0JNcKg=
X-Received: by 2002:a05:600c:46d1:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49cf820c992mr53868815e9.6.1788518983443;
        Fri, 04 Sep 2026 03:49:43 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm141983635e9.15.2026.09.04.03.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:49:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 12:49:42 +0200
Message-Id: <DL6H2DO8O3BZ.3CU50815EL05A@gmail.com>
Subject: Re: [PATCH bpf-next v3 0/4] bpf: Cancel special fields in resizable
 hashtab on recycle
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <chenyuan_fl@163.com>, <bpf@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 "Mykyta Yatsenko" <mykyta.yatsenko5@gmail.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Shuah
 Khan" <shuah@kernel.org>, "Nuoqi Gui" <gnq25@mails.tsinghua.edu.cn>, "Yuan
 Chen" <chenyuan@kylinos.cn>
X-Mailer: aerc 0.21.0
References: <0560a24d-2cf9-4e5b-aa61-580af1e56de1@gmail.com>
 <20260901062845.1379760-1-chenyuan_fl@163.com>
In-Reply-To: <20260901062845.1379760-1-chenyuan_fl@163.com>

On Tue Sep 1, 2026 at 8:28 AM CEST, chenyuan_fl wrote:
> From: Yuan Chen <chenyuan@kylinos.cn>
>
> v3 addresses Mykyta's review of v2 [3]. Both comments concern patch 1:
>
>   1. "Could you please double check if this is needed at all? I think
>      bpf_map_free_internal_structs() going to reset special fields to 0,
>      so immediate reuse by __bpf_async_init(), bpf_task_work_schedule()
>      correctly identifies fresh fields."
>      -> Correct: bpf_obj_cancel_fields() resets the timer/workqueue/
>      task_work slots in place (xchg to NULL in bpf_async_cancel_and_free(=
)
>      and bpf_task_work_cancel_and_free()), so no re-initialization is
>      needed on reuse. rhtab_init_map_value() is dropped entirely; the
>      element alloc path now matches htab's non-prealloc path
>      (alloc_htab_elem()), which also performs no explicit init.
>
>   2. "Let's directly call bpf_obj_cancel_fields() here and below, so it
>      is consistent with htab."
>      -> Done: the rhtab_cancel_fields() wrapper is removed and
>      rhtab_delete_elem()/rhtab_map_update_existing() call
>      bpf_obj_cancel_fields() directly.
>

I split out two fixes from this, given Nuoqi's patch was already acked befo=
re, I
decided to take that one with Mykyta's ack, and also rewrote commit log and
simplified tests where possible. The remaining issue should be th BTF relat=
ed
problem, please send that separately, but also simplify it.

The current fix is too convoluted. Just taking extra map BTF refcount for t=
he
dtor record should hopefully suffice.

> The resizable hashtab still eagerly calls bpf_obj_free_fields() on
> element delete/replace, which runs kptr destructors from the caller's
> execution context (unsafe in NMI). This follows the existing discussion
> on RHash special-field recycling (Nuoqi Gui's series [2] and the review
> [1]): patch 1 applies the cancel semantics like hash/array maps
> (a3a81d247651); patch 2 fixes a program-BTF use-after-free in the
> mem-alloc destructor found while testing; patches 3-4 add regression
> tests (NMI update, and per-field delete/re-insert cycles).
>
> Changes since v2 (all from Mykyta's review [3]):
>
>   * Drop rhtab_init_map_value(): bpf_obj_cancel_fields() resets the
>     timer/workqueue/task_work slots to zero on delete, fresh elements
>     come zeroed from the bpf mem allocator, and kptr slots must stay
>     untouched, so no re-initialization is needed (matching htab's
>     non-prealloc path).
>   * Call bpf_obj_cancel_fields() directly instead of a rhtab-specific
>     wrapper, consistent with htab.
>
> [1] https://lore.kernel.org/bpf/DKEVG8ZVJDDQ.2G40FTOIZKU57@gmail.com/
> [2] https://lore.kernel.org/bpf/20260726-f01-23-rhash-cancel-bpf-next-v1-=
0-6e5e1131d885@mails.tsinghua.edu.cn/
> [3] https://lore.kernel.org/bpf/0560a24d-2cf9-4e5b-aa61-580af1e56de1@gmai=
l.com/
>
> Yuan Chen (4):
>   bpf: Cancel special fields in resizable hashtab on recycle
>   bpf: Fix use-after-free of program BTF in mem-alloc destructor
>   selftests/bpf: Test rhtab kptr recycle from NMI context
>   selftests/bpf: Test rhtab special-field combinations
>
>  kernel/bpf/hashtab.c                               |  98 +++++-
>  .../selftests/bpf/prog_tests/rhtab_fields.c        | 337 +++++++++++++++=
+++
>  .../testing/selftests/bpf/prog_tests/rhtab_kptr.c  | 184 ++++++++++
>  tools/testing/selftests/bpf/progs/rhtab_fields.c   | 378 +++++++++++++++=
++++++
>  tools/testing/selftests/bpf/progs/rhtab_kptr.c     | 146 ++++++++
>  tools/testing/selftests/bpf/rhtab_fields_common.h  |  19 ++
>  tools/testing/selftests/bpf/rhtab_kptr_common.h    |   6 +
>  7 files changed, 1152 insertions(+), 16 deletions(-)
>  create mode 100644 tools/testing/selftests/bpf/prog_tests/rhtab_fields.c
>  create mode 100644 tools/testing/selftests/bpf/prog_tests/rhtab_kptr.c
>  create mode 100644 tools/testing/selftests/bpf/progs/rhtab_fields.c
>  create mode 100644 tools/testing/selftests/bpf/progs/rhtab_kptr.c
>  create mode 100644 tools/testing/selftests/bpf/rhtab_fields_common.h
>  create mode 100644 tools/testing/selftests/bpf/rhtab_kptr_common.h
>
> --
> 2.54.0

