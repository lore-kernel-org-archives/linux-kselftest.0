Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDD82C0285
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 19:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773255734; cv=pass; b=KeFV064/2NqRpvBrycd9Nsfi5K+2BmeFJVBqyWSpAiGq5gZN4oMEZ2pZdj8kl6/mfGkuy7qD5xb5hHQ0CRVfUnKciWQb2d4llRUjYSahrMSeK8Rd/cA6Nr8anMS10TEOi8lOpZAuhHGmYgEplSEoJnCRcmRWnXWGSmE+100+3+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773255734; c=relaxed/simple;
	bh=zfJqOZ06tqpuB+99lsouSYSt086di6qkELN4k/vFd34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9ehSqk0jAE0yGSBtRnu13sCX6k4WGTa7H56R9ZnUvW863momawVCTNtyseouiIMnHLA7heDMVhE85aYtzJpxZ3k6EgLsb2Qp+XYcuCprq4jFifMAruVHe/u5GhAAChh98wIr8YKZVr4lx6bOfDcKIZJ8GtHmH2rRSkMQtPgH34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TBeRX0md; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TBeRX0md"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56af6737b4fso147759e0c.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 12:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773255732; cv=none;
        d=google.com; s=arc-20240605;
        b=BwX4WH4YrEl7Cf0pAYTljhinoXbtulpBaubPe5ipyem1H3klfjfUOC7Z6PG2Bk9RTQ
         TyFLwdCEkUSwSnH5/dJkeL5RV4aDSg/SQfSgN2Ovz82PH3ENl2pa2zrz7Ctdrh1R1qyX
         sBRXsWmpLrzaXhLoM2fKmtdUlEzPHCxKDBXM90G4oOXh5KQMvXLOM+C+yeRTKpR8YU0m
         bq0GRBee05uGvjUAfLgJChaHpWIvotD1cPFg2CAVPt3T+QY8phPlkG9mMVzbNnx+PIso
         S3OVyyrFs0QnNDBQCcGE1kQud2Fj+p8OU666eyo28TzauZNjnrLibI2EC5vcOz12+bup
         zX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uz9lbPCFP48Ap7OMGU3ZIKIL3RFhqYcqtAKyrJSk2Fs=;
        fh=y9AwH/+rDfvEJUaHCSu1emqoSC0AhfY0AzO5q+VFeTA=;
        b=VgXE1j9BQX2qCq+26WzHBEsAwbU294gXay/NM/iguH7UOVDeAxGuXlp9L3fijlnhz8
         JcHBbUoVIomDrRdrMBDmMzwaoKhALYufCKUzIyPC+8oVfgxEcvidAwhStb+Dj+/5bpsQ
         p3TcLv/ivKiP5F61J4seOBPhl682PTLmsKhG5QWG3JMD3GaC3liutcmG0uSUy4QTcmTC
         T8Ry7sU0YeD8UPXmZudxrf1XUFJkDlTbh5FY739sszw6uNqBBFqSSTu1gfOqDO0F8pCv
         YNFYuUonIwFSsTjq1gnTmk0D9IOx2BYIJKNrtJcYX9tJmbZmAE6ad0ZI5jZJGaL7bJOr
         7+qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773255732; x=1773860532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uz9lbPCFP48Ap7OMGU3ZIKIL3RFhqYcqtAKyrJSk2Fs=;
        b=TBeRX0mdCa/OJSsnURlJq28BnpIiGWxG1EZ5MPsnBogKFWji/GN21IkvrgygHANh5i
         3IQRhvveKadISnBmnzvZ+swljzXy6TZOB3ZdUuzZYXoak/bXsnssmDeW6lyU7TAFRGSC
         EiEBcKEbFNPJyjIOP6lBPBuBS/Y5e2NaEA+1gDrZM4FVyat4qR3ckLLEaDGsR7YXm1YO
         dbBXBvdLAmMC7Cqy8Y3STOoW4JKkPfEDZR4VVh7mqxGS8kzOxft8id7EXVkjmv75EyOP
         PO6KzXDFEc0WnNl5s9i4mtTQbt3KfOpF+wADrtb3JS7ylFVwNjH/CJDJ117nbPjlVqDU
         wDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773255732; x=1773860532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uz9lbPCFP48Ap7OMGU3ZIKIL3RFhqYcqtAKyrJSk2Fs=;
        b=snwUkgOeJKkPT805wgH16owJ6Yq1vKJTapqIG1Kf5n9BFTB06e2B5EUkWAdjoLLzdb
         URWAfeeg2JJcEbAg+xaxZcZPNpH9EUcXXP8a4iDDcP6TO3pL6cIWc363oY+d6aV6NZd4
         tdTDpi9vNUZd/Ao2wh1JfOb6AyrGnuSg7k+ErA/dWAquWrUHttT9HQlXaMPAN18wyhZb
         IL2G1bsX/xRIX24vgUzvQ181gp4/YMY8vFwjzKoFKVh18JhGdjIAIoJHAjga60SBtGy+
         u+NswOqiXspBzfw3+jcGKLZyIYmIqcIKaOkargoPl2vff5GPtPmA9YxOf84YcwqQ85CN
         W6CA==
X-Gm-Message-State: AOJu0YxdeNWrmjI4FJT2GlFKXH73Vvw2SzGIDlCW80R3h0dqjO7OVIAm
	XRLSSjEYyVzhNapL2a0TST/0a1uFbYXgF5+0wOniwDNvJXkmTYVmoDIaNe30tNWDZxX7zfbHX7R
	szgEjS9vuPFYqRTc4HBLZaBMweoAC4otfuzsAfN2s
X-Gm-Gg: ATEYQzwNWiZLXvbHSnQcq9q7QylHcO2NlKOK2SyCT6OaGfOHWQbJbu4ztWTJnJeKqHj
	izg+JdY1RE9beh9JZoCmhKdXNeppJ4CeeRiQrykrFbn+yOq4Ch2+6oibH91akRWMmTxd5DtUTLV
	jmpfS6a30q7p6jzz0ViGeur2glCHFAUT6f4+vn/qHdJ/SiY6PNRGvfcRo1JlEMj/z0BUiTmAXPW
	ouA2TMDb13RvusgMZSOp+g2GopKFYih68twIcrrQvr6ssay6BatCnBAN5JS2cFGyP2WhtRxRk83
	4XwCtQ==
X-Received: by 2002:a05:6122:3124:b0:559:67df:5889 with SMTP id
 71dfb90a1353d-56b4746b3bemr1279193e0c.6.1773255720320; Wed, 11 Mar 2026
 12:02:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311110523.26624-1-liwang@redhat.com> <20260311110523.26624-4-liwang@redhat.com>
In-Reply-To: <20260311110523.26624-4-liwang@redhat.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 11 Mar 2026 12:01:24 -0700
X-Gm-Features: AaiRm53iDnGUJF5u0qqalvkYJgTqMlUyE1Y1xwWQJeyH2Stn3OuZlTpplmBlfwY
Message-ID: <CAJD7tkawFFwiV72S5eJfmqaH63k+kisMNLPrc8-u-9taGRanCQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] selftest/cgroup: fix zswap test_no_invasive_cgroup_shrink
 on 64K pagesize system
To: Li Wang <liwang@redhat.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 4:06=E2=80=AFAM Li Wang <liwang@redhat.com> wrote:
>
> The test_no_invasive_cgroup_shrink and allocate_bytes use a hardcoded
> stride of 4095 bytes when touching allocated pages. On systems with 64K
> page size, this results in writing to the same page multiple times
> instead of touching all pages, leading to insufficient memory pressure.
>
> Additionally, the original memory limits and allocation sizes are too
> small for 64K page size systems. With only 1M memory.max, there are
> very few pages available, and a zswap.max of 10K may not provide enough
> room to store even a single compressed page. This can cause OOM kills
> or false positives due to insufficient zswap writeback being triggered.
>
> Fix these issues by:
> - Using sysconf(_SC_PAGESIZE) instead of the hardcoded 4095 stride in
>   both allocate_bytes() and test_no_invasive_cgroup_shrink().

AFAICT there are other instances of hardcoded 4095 and 4096 values in
the test, do you mind having a separate patch that updates all of them
to the runtime value?
