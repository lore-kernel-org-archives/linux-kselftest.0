Received: from mail-ej2-f1.google.com (mail-ej2-f1.google.com [74.125.228.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5202D739C
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 19:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787512934; cv=none; b=kyE7XeSuFNwoV7QPpeEq9KSufv/jUG5IqYDCBKfjMyRwFcnGzdeIIaANd79sDKVExNbrdsNWPjAvhSY3fezR7oRlM6LCcgburSFZe+davW/RleHXkN62WBEmnsjnTNsrx/bH1c1WUiTeto3FCs8F7jqJUvy6754UdGJ7WvBkfew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787512934; c=relaxed/simple;
	bh=j45b+uAVcfYFp9miH01OhKsck29XdrcoZPx//LaW6lw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=MSodCUXtqncRv+3F+Z6yBCRatWfmzFEu4bE+/muK2iioNCCcVrFzP3hXGxfIg5DaXswicvgzvG9gOuIKwnWR1KRQq1CmtJNbGgJrFy/5OfAwQbfLlJysWzZdXw6RvAJVrsP0rnhSjx4zSr8PlZJOmwwkkOlLKrSiVscpT0LnL0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+rlXt5d; arc=none smtp.client-ip=74.125.228.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+rlXt5d"
Received: by mail-ej2-f1.google.com with SMTP id a640c23a62f3a-c15be76348eso130684066b.1
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 12:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787512931; x=1788117731; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AgbQ6sZtBwwoD7uNP8BvqrzBrojliltUsB8bki3GEHg=;
        b=R+rlXt5dkInnSJ3NZQSwxUUdX4Z0mj2ZEFxfW2KkD0PUyY8iKA8hsFeeQEHQnVczl9
         nNdNO5m+PXtaw1kp+pSAZbiWmWEKo6vDXec4FD6l3v+qFaf2YxtyN4BFhHse/RnjxI9E
         YZphmItM4uOipqM6OaNqQsAchiutBpVR0IxG8N+Eld8v52PyFn1C+3Dkh0st98AaiZeJ
         C/rhdnUNkymz8Ba2AMSYsiA8bzmKw2U+lkM07fX+XO4yP3/FcSLPpzdaeN1fmyY2KP4D
         GOOkCpioMbQtD53ACATWu4ws6JTtKCEl7l4GTTU4avt+oympJQcDXUcn0w5tpCEG8Njb
         UZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787512931; x=1788117731;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AgbQ6sZtBwwoD7uNP8BvqrzBrojliltUsB8bki3GEHg=;
        b=AtzKl4qAD1j7v2B+MYzUvPSZlEgN95cAgBivEcWKmat9wBMTum9Vy++4N84mrO3BJi
         wjfTbzQLcM5Awgd9qG7oG4HC5CElVhYNyhgAFZz23cJ30IFjeWJ2IHdbwG7qyH4g3zzV
         qgm/TrIgYaSy3QzDuf7TDrAEV2rgh+uhf1niCEY9fy7zBX0hcvdQhZnX0e4djD+b+kkK
         eG8x3ODbEzEeqPs2v7Akx1+6aKFOpngyoIvGR3ujMlcAxjbzOw9n7rWbhTD+x2Zgd2xQ
         NeKic3ybjHD2QuOWxnPZ2yshRwk7sIBqkVQX9hX6zY+SRDiMzTmlj8CZiU5iT1po00WX
         brBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRyeTDPd1HIOyGJSHBIpgqapabPhX5XnKLFPDTtLFLlI+q5buW1y3E1rRcPoQgcgMUgPayp2/onnJXUqjdLPw=@vger.kernel.org
X-Gm-Message-State: AFuF++mn/jfwFz9Fj29ZzW4d1FYybg4daAIhUzGHmpUtkDFoD8jpqCSx
	QI+/4z23ZfRtoSHCD+WMQ9XmX5WMYGTPrPwXkfl4W8QexFPxNN4560bY
X-Gm-Gg: AR+sD13fg/e4b9YNW38YKZpvhWpKVsXfP5+uG4jLUih/rdDPGct02EORfWxlTWfRVsG
	IkHzFajCFFUF3ug7PT/4/xtj7cIVfe6clN2gL+HoZwUZPutxWwT1aFGCKbPPZ/ElNsMIlYsjibL
	6B71EdA97929pCFCxvIrbN1ib0jwPylS/rkGOnzHGNOMOStoeKDfdT6giHF887dcBnAXG+GHZyG
	tICwTPnxUYEKrC4QQFFVdApKFBc9DLkkKLhXOAZ9EFR8y6J/MJRYhKgY8/rt4YVW0j2/fsQbUwK
	7gyzfcrDvWk19o3bB8Zh0bApl4tvOUdXIha6FIqh0W0W5ZU8X7/Tjz1yUOClZX+JoxGXknbIT1Q
	LVQSsQ0ykgksP/YxN/d4ym+1l7zBgR5EbAGRpio064NSbs2BMC1xeatJwt09i5WGfno1SNt+S6O
	PfnSPbTpoMZS6al7CA1LPYeEFT+Qov3ut9OSF0y/POwW1MerQwTmem1Mtym488b74Gffis54boM
	wumCh3PPcIkLH59aCFa6+fBl6tMdZspZdiB/Pk1KQ6july3DvNU+Tbwh/8Kqbt1B7waVeXBtdko
	zTWCjQbTU/kJI27JN2RWy9IvsKA=
X-Received: by 2002:a17:907:c243:b0:c16:2e4f:a372 with SMTP id a640c23a62f3a-c246a5f45b5mr2793318266b.13.1787512930795;
        Sun, 23 Aug 2026 12:22:10 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f809bsm1023976866b.41.2026.08.23.12.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 12:22:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Aug 2026 21:22:09 +0200
Message-Id: <DKWKG7IBK7NR.2N7RGBGBM22JV@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Jianlin Shi" <shijianlin11@foxmail.com>, <bpf@vger.kernel.org>
Cc: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <martin.lau@kernel.org>, <eddyz87@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <john.fastabend@gmail.com>,
 <kpsingh@chromium.org>, <sdf@falco.dk>, <haoluo@google.com>,
 <jolsa@kernel.org>, <emil@tsalapatis.com>, <pulehui@huawei.com>,
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4 0/5] bpf: fix stream capacity, read, and
 oversize handling
X-Mailer: aerc 0.21.0
References: <tencent_E69EAE29327E25B3548A9AF3F4FA289A6806@qq.com>
 <cover.1787492521.git.shijianlin11@foxmail.com>
In-Reply-To: <cover.1787492521.git.shijianlin11@foxmail.com>

On Sun Aug 23, 2026 at 4:17 PM CEST, Jianlin Shi wrote:
> v3 addressed Kartikeya's review on v2 and the related Sashiko findings.
> v4 fixes the stream_oversize selftest to verify capacity rollback on the
> same BPF program stream, since streams live on prog->aux and are not
> shared across programs.
>
> Tested locally:
>   stream_oversize and stream_partial_read (equivalent to
>   ./test_progs -t stream_oversize,stream_partial_read).
>
> Changelog:
> v3 -> v4:
>   - In stream_oversize, perform the oversized bpf_stream_printk() and a
>     subsequent successful "foo" push in the same program; read that
>     program's stream in userspace instead of switching to stream_syscall.
>   - Drop a redundant vscnprintf() comment in bpf_stream_stage_printk().
>
> v2 -> v3:
>   - Refactor bpf_stream_release_capacity() to take a length.
>   - Fix staging-path capacity leak; use vscnprintf().
>   - Return partial bpf_stream_read() progress on copy_to_user() fault.
>   - Reject truncated bpf_stream_vprintk() output with -E2BIG.
>   - Add selftests for oversize and straddling-buffer partial read.
>
> v1 -> v2:
>   - Retarget to bpf-next as suggested by Pu Lehui.
>

Adjusted patch 5 for AI concerns for the selftests and applied. Will post a
separate fix for u32 concern. Thanks!

> Links:
> v3: https://lore.kernel.org/bpf/?q=3D%22PATCH+bpf-next+v3+0%2F5%22+fix+st=
ream+capacity
> v2: https://lore.kernel.org/bpf/tencent_C919BB32458A4DAD645A68F441345B971=
E05@qq.com/
> v1: https://lore.kernel.org/bpf/tencent_E69EAE29327E25B3548A9AF3F4FA289A6=
806@qq.com/
>
> Jianlin Shi (5):
>   bpf: roll back stream capacity when allocation fails
>   bpf: fix stream capacity leak in staging path
>   bpf: return partial progress from bpf_stream_read on fault
>   bpf: reject oversized bpf_stream_vprintk output with -E2BIG
>   selftests/bpf: cover stream capacity and partial read edge cases
>
>  kernel/bpf/stream.c                           | 53 +++++++++------
>  .../testing/selftests/bpf/prog_tests/stream.c | 65 +++++++++++++++++++
>  tools/testing/selftests/bpf/progs/stream.c    | 18 +++++
>  3 files changed, 116 insertions(+), 20 deletions(-)

