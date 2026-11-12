Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467112;
	b=xeYjIdZhxTg9oeYz1oteXI1dZWi2xpeS5PXuzfLfdauBlS3OYo2snx5qPMC4C3P3jgAU
	 TFZUd7KiXWn9wK42vucORPd52Djy2eqGEUJ4c+UfFqs8d7veMrnHAE5ax8h/Oua1e2G9I
	 NSn3Em99aaiTUeM8szP2XkcD+3AAdjpF1qmqKXJmf5PJoagXO21LKgTyzb4cdMfvk4wgj
	 N2z/xDpkCAysnBotrRNrXcbhM4y/INteKUfi2tN1G8LcBepXy0SvNjXYB/KBQBHyn/On/
	 YoCJ+Id87Vbf0s7QpMH11oG4LSrJ2XjENmdVcfJqQRvJ+oH+rbNakynh0VngOzgbpDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=BhXIIma0KyYX4XFmWxtnNZ2v8I5eSZ8V5FzW7KusbPo=;
	b=SkntdBgGEGrXEgSJ5bhSbDJkFYlYmA0sM2zcEIvSetWkCf25YpfG9u5TXE7MoXYwXyK2
	 FJi6s+IT7APLBrw0RzdRicgkIPFWkXEzb1pn2BxZ4oBKoRTwMrnQ9vtLuK8yB5sLhY2ZY
	 Ig4+P8dcD0tuOcXoY7b7orEEeaj41Egc4fAtNVj5tI1kKhyE7mEaqagof/m/M2BEhChh6
	 h8rqXGlgBXXWtoBxQpYN0eBDLdLjXkq2EUGskrVm4m9oXlWhQMCkSz0QZIwKB0mc4+YcD
	 kpP4w58t6hEfRsNfBxvUO4734qbUmKIq5dpvfZn6/zAROKtvOJg1d9oePABVRbsVmBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=etsalapatis.com;
	spf=pass smtp.mailfrom=etsalapatis.com;
	dkim=pass header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=ErZn5GOK;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607D3606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 07:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 607D3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=ErZn5GOK
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso2464774a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 23:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis.com; s=google; t=1794467110; x=1795071910; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BhXIIma0KyYX4XFmWxtnNZ2v8I5eSZ8V5FzW7KusbPo=;
        b=ErZn5GOKi0CEkJzCCpPNKT/ryKX64Xp9SX3BkfEIg7z0SqLdvbprdvHg91F9ccANlZ
         b+xQCYd0HJcrW9ksPlHYPcSiH0krExXJ59LCzEA+Kfbl1+HsaPPEwC4yAH9xh2Ieg1r3
         hlhdg2hFAnTYCC9HdMZoF+Qw58W5zni6RvWfHad/ATF+DtvVfurV6i0yCpzV/tZRXlvm
         dEujBKmrfMKJdt9eq4Zmb9aXueL/6L+PB0H+pKR97SVJeglPuQxEGNOzxINdrIfRVYUn
         gmNsaV2z5KhD7/hMp1GoQ+F4FtVLoXkAnzkBITMCQxVyP9V2sJhfslqtsbuf5iFPwrfI
         S+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467110; x=1795071910;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhXIIma0KyYX4XFmWxtnNZ2v8I5eSZ8V5FzW7KusbPo=;
        b=y4O7zXfZ1CBct3A3/0ODr+4kGyJFZHyOTvsevfqVn2WzC9KlqXjpJj+s/z81xyNkJi
         Ee/UoiXI8bz7xJKykKCHSuvhRjWwiu7GrzM4lBD6JEQUcCg+Zv/Ua57EnMJSLhUiKWbZ
         8CnSVTo7ql899sR3XRizDWbqLVnRA2VyGi2MPMVvdGCdFjM1j4TqHs504QEp8I3l306x
         kz/vYxaLyvzoMrW8M/mGVvvQNUfNlFQpZGF/52smarVE65Smv9zaKQrEYndCJaFZHTBZ
         rcraDAmuVaMu20hUbjdpUQRfRhDQM3dtikcA6xspDkIr1ph+4PEcJQ4GVBM/tPggCvke
         u/Qg==
X-Forwarded-Encrypted: i=1; AL+hErG5lRrXGciG2rgdPPbAPo5B/G6TdgBMeWs909MzKz8UHYQnlbcVSYdr8/+aHiDEpoVn0sqIdK4a3jLk6WVY2Yg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SHqcTzsFENb9qXUry7uU5h6FSJk795XHDtOAMdQqe8RAtIJYK
	Kxh/Npgl8U+sl/7FJhwlTIL+5P4HsVX2h+X4jrLHlCaHss+K9fENg6KBDvT3uCSHkS0=
X-Gm-Gg: AYBFou3A/INqzpjehannKR3PApffh0FK5rrYw7BTzLo9DLOMQDMnQAQAgIcsI0Do/5a
	0I0I33lIq5zZHLaqVOHg/BUovoXnNLcPYMB5shwz/XSNw7RXrIcapfJ/6+GWsiXylzAxQHNX8ky
	K2xk6eEJqt6+n8BnHMVcctjdqBCShsMW+tk/KAfGq5MfyBsDSsF2xfkpI6IBehvns9LuHYCzkHN
	Gv4eY5FY9cTAF/ixpLtvyUfOw9xMpG5C0lxOJJXVK6axJT3bBrCEcDZTWP5ROWOMKy4YvnMvIaF
	2mLa+CWbTer5SiPKpvZTa7UftOU3mxQie+yAchJQ0VO5heA3t+bGasNXTqfr0fEUO0IKQsNXjfi
	d4zfxEn5Woc0yfk1Lp+iMeY6oUuAWZIqkSG2n88j8ygIaBi9LBQCkUwuxHn1VCN4cA+9nngtmv0
	GdalbWNQTVfQ4Vzm0oAt9TM/tkkM1m9uJL+xX2SYSwjJVxtKZGY4/3nGwSOslUS2Z4sf6oTf40H
	nHzNzkYwWzwYhs6/VRoWm3VJTAxp8LR/e1jD4AQ2yg6frCOtxOCbzW6J5KjLhfFSIYpb38L6h6O
	D6qIo3bgTtz4YsfTP4PqIYLMH5Svy48/vcGmk/9nj4fyarmSOv+faPA8M2xzNu67aMdgjDriBl3
	rcbyn7myHJKd5RGR4zA==
X-Received: by 2002:a17:90b:4a12:b0:3b0:9fbf:8951 with SMTP id 98e67ed59e1d1-3b182e0346bmr4836706a91.5.1794467110421;
        Wed, 11 Nov 2026 23:05:10 -0800 (PST)
Received: from localhost (107-190-31-93.cpe.teksavvy.com. [107.190.31.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e06833sm29122375ad.68.2026.11.11.23.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 23:05:10 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 07:05:07 +0000
Message-Id: <DMT1I0RRNARI.1LTPB6JPWY4E9@etsalapatis.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, <david.dai@linux.dev>, "Gavin
 Guo" <gavinguo@igalia.com>, <bpf@vger.kernel.org>,
 <sched-ext@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH bpf-next v3 0/3] selftests/bpf: libarena: Add
 ordered-walk and lockless-peek support to the rbtree
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Changwoo Min" <changwoo@igalia.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Shuah Khan"
 <shuah@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0
References: <20261111100951.230730-1-changwoo@igalia.com>
In-Reply-To: <20261111100951.230730-1-changwoo@igalia.com>

On Wed Nov 11, 2026 at 10:09 AM UTC, Changwoo Min wrote:
> A sched_ext scheduler can build a task queue on libarena's rbtree, keyed
> by vtime, in place of a vtime-ordered DSQ. Such a queue needs three thing=
s
> the tree lacks. This series adds them:
>
> - Serve equal keys in insertion order, as vtime-ordered DSQs do (1/3).
> - Add rb_next(), so that a consumer can walk past tasks it cannot run
>   in key order (2/3).
> - Cache the leftmost node and the node count, so that other CPUs can
>   peek at the head and the length without the writer's lock, like
>   scx_bpf_dsq_peek() and scx_bpf_dsq_nr_queued(). Add rb_init() and
>   rb_fini() for a tree embedded in another object (3/3).
>
> Each patch adds selftests, which run with:
>
>   $> ./test_progs -t 'libarena/test_rbtree*'

Hi Changwoo,

feel free to keep my:

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

(though I didn't add them myself to v1's patches 2 and 3,
I assume transcription error?)

>
> Changes in v3:
> - Make the lockless readers static inline. A plain static function in
>   a header fails -Wunused-function under -Werror in a file that does
>   not call it (bot+bpf-ci, 3/3).
>
> Changes in v2:
> - Drop the comment on the insert helper and keep the name
>   rbnode_least_upper_bound() (Emil, 1/3).
> - Move rb_next() before the caching patch and into rbtree.bpf.c with the
>   other traversal functions (Alexei, Emil, 2/3).
> - Hand the head to its successor at the top of rb_node_remove(), before
>   an RB_ALLOC tree frees the node, so that a lockless reader never sees a
>   freed head. This drops the wrapper, was_first and the rename to
>   rbnode_remove() (Alexei, 3/3).
> - Drop the cache line alignment of the lockless fields, which showed no
>   measurable benefit (Alexei, 3/3).
> - Rename the lockless readers to rb_first_lockless(),
>   rb_first_key_lockless() and rb_nr_nodes_lockless(), and document that
>   a caller that dereferences the head must keep the node valid itself
>   (Emil, 3/3).
> - Drop __always_inline from static functions (Emil, 3/3).
> - Add Reviewed-by tags from Alexei and Emil.
> - Rebase on bpf-next.
>
> v2: https://lore.kernel.org/bpf/20261111073416.203153-1-changwoo@igalia.c=
om/
> v1: https://lore.kernel.org/bpf/20261028060046.549097-1-changwoo@igalia.c=
om/
>
> Changwoo Min (3):
>   selftests/bpf: libarena: Order equal rbtree keys FIFO
>   selftests/bpf: libarena: Add rb_next()
>   selftests/bpf: libarena: Cache the rbtree's leftmost node and count
>
>  .../bpf/libarena/include/libarena/rbtree.h    |  57 +++-
>  .../bpf/libarena/selftests/test_rbtree.bpf.c  | 303 ++++++++++++++++++
>  .../selftests/bpf/libarena/src/rbtree.bpf.c   | 120 +++++--
>  3 files changed, 457 insertions(+), 23 deletions(-)
>
>
> base-commit: 0fb18ce8a2e9de830433923cf65838933d615359

