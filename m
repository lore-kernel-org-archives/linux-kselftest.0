Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793398946;
	b=bk0Ssf8lk1B0qLagdZ3hed60lVskz79Rw1yWrCrf7ei3zUSzMMFibAiVW6clmnH+17+7
	 EiktP0ul7lvEToWl0GWpSFnhZUuCeJBSf49wKNjbXrlKEdzU5DNuUyalDLAPig5eVgePy
	 YYipm1jNoEP53QCtj9rMEb3onPh6S1m3Ns8PWiVRcqX1rJXmpUdkSswJwceh2HstZce3H
	 sCLlcSM6rFuzfGcKWOWIwCc8Y5whfRB7Nrsna8MRBxrIPRgidPKklyNUx6JSLSz1OXDLl
	 vGC9UzoPK2vrwuyuhx3pjUBz6D89oqkU+Uc0S8+57FIA40xKwY81d6hXNlT9XpnFt5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793398946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=dOhv0H0wKDT8tH3E7ShVIFIuKTH7HC8Fm0b689izP2c=;
	b=GRF+oAgw+TDE1PMb8LSEog4CTegamB/oxa5NPORkSqIbnaXVbXlO9K2Di9JCPRqX6Yc6
	 pGGbd/R2D6c2yD3dWict0wrVEc5jNR/TEx9vKEmHRLmfS2FBQrQCSRsefBTgEE9aIRFze
	 jmX94x2sAhnYnhG+FryHmPisWXvCeFJ/mIHHHO4xXoewawtVpndzOp2BW1LknWX2bo5Ih
	 xVVS7Q3OpGQ6Tt6KwU2jjt0NWQR1bbpbDb3Svvig7IrWS+g/Kt2gLlaZYgrkFHZD7PASj
	 kcld6eYSEl8UBS9zQf0AzL/Cad7cI2koP12LC2DEWv4iYqYCG2Nwz15aWidmTU6GYPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0iaGytAP;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAF5606A32F
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 22:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AAF5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0iaGytAP
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a058315c79so664710b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 15:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793398945; x=1794003745; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOhv0H0wKDT8tH3E7ShVIFIuKTH7HC8Fm0b689izP2c=;
        b=0iaGytAPbeI5fAusmFtYFGoODd2Pg5dBYv6EA4h8rGqis1I/kVpxyMNfJE85eCvMEX
         jSBtbOpj6Ft5byoDf7xB829YoTOwazmdit0EgiNdTYE2eSsaQotwIiYsG2ABsmbQOWPI
         eRKmiSgmGzKK7uj4DAK0XM5YkUSuZySm92VWCWxGIwJpkp3g1H344tmn1VBQj2sQWjrn
         L9NuDrjqW2aF7b8RSRyxWkLJwYE5mx/Pclewy4n5MS/dFx4jgUp1n03gA1qXgWvkC2Fa
         8aXoo+o+6Nc4Z/6fX66d3Qujo2ZJiJNbayS5WvqSxiBSCA1RrVGZv3sGEfBnWPESZd3L
         VrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793398945; x=1794003745;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOhv0H0wKDT8tH3E7ShVIFIuKTH7HC8Fm0b689izP2c=;
        b=uZOWjaenjSMTtPhF7XuF8iyaoyjNrQn59eUsfzbttS/pMM68eOKdShwHqfaNcDixp5
         yTY5OXi1wYDD0t7nNGJ2Zd8S8JbQFZSrIhxG77PqnqfW0o/kctsrahsjYT8XwGz/MZdd
         9LuZsoWyOK9Ai4aEwUvornGbDHjc61b6LEOiePExJkI/h9HG2XMhzUgnoJ6ZysI3pwPQ
         mdDR6rZWmbSHFSYxqHsL7z141a4fnJo/IkTpUd5q8rQbW43RZPYxexNmVaBsPqk+f4wJ
         MBnl2GyZf5LJvrIfXqYD9/3Z9hzuA4yPP59htQ0yXtsQH9DPK9DDgzVLotwO8XPAon3G
         /pgw==
X-Forwarded-Encrypted: i=1; AKwUvByIHApeW81yB1b7bNgWuT/6+YarT72dUqmkNnClrM3BEFTBd/peV4+6s8i9yD3/0pXVwFYv+EUbLH2tJGolDHo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNqJxIzRK8hS0HNyuXZv5H7yDsBC0Or+nvK/DlqnTOKtY9WpsJ
	dHB1CvKEM1c8OE6jt/lcYB+VqinoOshcT1Sr1UhJcv+9ara2LfLU7Qb4
X-Gm-Gg: AYBFou1q6W9rHQuG0K4phoihameL107HZDhPxuLmBEero7+SJcC3qGeyvKuP1jTzUbO
	7ZBBRfXv2kDNvkIGpUQVchMg1Qvt0zgf/V17Z7Lnyq5fi8FIwn6Z/SDVLYqefRveqlfTE+zPsos
	oe3AHktarbh4Naj40B7PuaxmvRTWJ1bf5KhxTq/xyGQJGc3MSQi9biSy3QsEPe4hCfwlwGEnwKU
	ODVvFigvimhmSAfvAnmhTu6jJFpmY1zEfs51G16bXiUHvwP9JzISsWRn0c5osNHn2udXX6uacrL
	D3n1DNBzFNlRJd2mjIGuF3ffpX9Rq4i5pkLeGrh7tYj1NkfomCeyE76zfg6Yoq0UGYAykACjqjt
	kKY+07bR1IHpAZsHxAIU6YkugE9gbaVRr16zws4tTz3cwMcK2hAOo6ivFmdB3+Z7c26iuPlZDfc
	kiyDGqtpco+MlWzLHbKb5mAux3UYpo4QZkXhRE7awHRyaBt/gBvdxDHICoLdwW4wHDP/nzkHsrN
	qHsRbGlEfpf0UCJpJCHmpJ68uVVf+z+mOXp9DhRT2Bx2uYzA78IutygLP/RjVcVElKQGW9Zr4SB
	FuHGyWro0LS4sVqRsvfK6DFHxBRVVMuuwduEM3cTPUJ6SgV+ukdcJYXvzZkfrgOGSskxW00Yb0z
	qyh4C4PQoPNTqNe+P2Y7mdef2lP0pqFYhGg==
X-Received: by 2002:a05:6a20:c98d:b0:3e2:86b6:9be9 with SMTP id adf61e73a8af0-3e928d4687fmr3155562637.28.1793398945278;
        Fri, 30 Oct 2026 15:22:25 -0700 (PDT)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d38eesm414805b3a.40.2026.10.30.15.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 15:22:24 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 22:22:24 +0000
Message-Id: <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com>
To: <mikeba@sentinelone.com>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Shuah Khan" <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption cause false
 recursion drops in trampoline progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Oct 25, 2026 at 04:02 AM Mike Bazov via B4 Relay <devnull+mikeba.sentinelone.com@kernel.org> wrote:

> Is disabling preemption in __bpf_prog_enter_recur() on !PREEMPT_RT the
> preferred fix for fentry/fexit, or would you prefer a different
> mechanism for reconciling preemptible execution with prog->active and
> the per-CPU private stack?

No.
We cannot disable preemption, since progs are not short
with may_goto they can take 1/4 sec.

Sounds like private stack is the culprit.
Should we disable it?

pw-bot: cr
