Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA062BEC3F
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 03:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405247; cv=none; b=Z4CBp/siZjEhCLWwyZXZnEQmtNcefxR4I3kEX8Ub1QSUb5pgO/CU0EGAjL3iQgbqSGPVXMsvNwr+qNKrYh5a5JtEO3J7j5Jvbp6nmiRjtOxuh8EoyskoJuBj2YW89UPNA5hHQ4OQXzDig6zYF8fBdZMDJ/Dvor1eQgVcA7zJsjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405247; c=relaxed/simple;
	bh=Gdn6FlTTrtnoQY7PyAJfU2F9mE8bnDKAHVlEH3i2pI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L/jKus3gRQQzZbgcPJzJJugmOdmH8EmymTxVxu3o8gLy/5u7LwAkDZAIxXmJsQbkjyCx//G3NRojKWgGQ8YVFf/+2k0ZzkDEk/vmpGZj6xfV+SXadACR+JEurpmpToG2gx6VjzayA2ZQmvi6b87f1MKzTCNAhk7eeiMftRa58WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsI7vf+d; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsI7vf+d"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d032846c95so22605885ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 20:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788405245; x=1789010045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vESU/1COBgvnCI0rsLCZoKytSIIaf3V11jedMnJg7JU=;
        b=bsI7vf+dc/Hom2bUfNW2LIsPdRYqWhGggoiRxXQBLrsFf651ewjgPOY+T/QMe92pi2
         qaZ10i5GudVWlMJ3l+FrvWMFvKrmlAQ+l/aDI2V7r6JwzkDuDS5C0kbQ0ZjVXrqcPVrT
         dNBtlukCor+ejxIvA9udM8mp4nbR/qRobRXqut0Ym5hmEuUS/q55RnNC1MB5+q1+VB0k
         3Kc6zesKY4j4uMJx5VQgjSyjzQbGbf/ROxfdwn2X4JFGBm7Hxf5ptwhcdjQSpwstUjeE
         gFyOP1Gj3SYoDgzpH0XDavI3478dQIuIYbLk8dlY5Psc4A7kQbcHfxhwNy9JVtX0qLVM
         fHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788405245; x=1789010045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vESU/1COBgvnCI0rsLCZoKytSIIaf3V11jedMnJg7JU=;
        b=qB2nrwuf2AjNQxk+Oae86FMcqGcpE51rDX2gUBamVe7hXNMKtK2zt+BDQE737IS6d+
         6+M/8HgauZ0s8I3hCu/aOOuK2w7SkONflhU9PRx1sbo2ucPHYBMXLxQLPzPjDt76jUOR
         Uyjaubgi5tIh2aVq1hmzDsHS3yA6YfEJSTXmqPlyU1rfmSlGSFQ+kDjaLYvOLlJfERRY
         mJ4lStfqaFn1hUSJGTwVWOJJaBu/AVPjO3EkVi6eqUIYiDGA+q7XMz/o5uUjdqXteEcw
         dy6/pyena4uGAqv+Jj2YnRqSeHVcH4DiMfuJMBQNeSJ4pDwyhiP72du3AcfMVP27lA9g
         C98Q==
X-Forwarded-Encrypted: i=1; AKwUvByeZBLN6PEH3tPHcH5OKFTTx4OXh09LOYwlQSCqOAyfC1N23aRlBlFrJNE0XBkMIawaMRK7QSiYjJ9QHm6HzHU=@vger.kernel.org
X-Gm-Message-State: AFuF++nNpGOyGo0j1Z6ehkfJvBuWvkWDJWB+dblZkvD/qvWTHzbd1XAF
	mgWp8+KZHLyUDRC+SLhgisogqeA3Eu5y+CCWEKCu2LV+xzOgXywcjuzCNnCV/l0B
X-Gm-Gg: AYBFou3BcERyL4lRsIHrdF8HGAkOMUk6z6kGq3A3xc/kk/bAU0uHA1WJ/7sKZ4rw7Ea
	dBXhEgxFSzivUX7sxWU62LeUKeUhW2d8Fbq9XNlMwhBB0kSEi0+lC7bmkv2595mWsBsFzkALvfZ
	oIC7CUJomVFB4H1G6PFsSrpY8U3J1DZueAyuMp5OK2EGDOlxiqMjXbMgzmt1E0r/Scveypg05rn
	A8zk38A3wVZZ+sPdPWlwPyQ06I0jEzwJ3CH6qKBSfdCgvSvmHUtERmag7CrZ6kmGyQnqJXyNmce
	sOBIr2v4euO1M2LBsFEEjASnw+fdgsCyB93eCUml1PwHPCIFh+6HbAtq00tR3E60RSQ2dz6BsB6
	c6dApYA0dK4IQ373puhz3n0YjIH99Z10Nq3P+SUxgC+RX6Hy6aB6BBeMyFkTL46ksMGLwjFAB8m
	KvPcMIuPkdg0XQYvOI4i5j+C+BLuwB6Eg9li60DejePKlHkuHIIG+WO2RJ6nneVmKGsAfuVUQaw
	DoVXa8eiTPZILkpERz7QR1Db7l1
X-Received: by 2002:a17:903:1aab:b0:2da:f1b1:56c4 with SMTP id d9443c01a7336-2daf1b16445mr104380145ad.3.1788405244535;
        Wed, 02 Sep 2026 20:14:04 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe0e0d5bsm2824825ad.12.2026.09.02.20.13.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Sep 2026 20:14:04 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	stable@vger.kernel.org,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	Quanmin Yan <yanquanmin1@huawei.com>,
	Ravi Jonnalagadda <ravis.opensrc@gmail.com>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 0/4] mm/damon: fix misc bugs in kunit, quota goals and sysfs refresh_ms
Date: Thu,  3 Sep 2026 11:13:28 +0800
Message-ID: <20260903031345.82679-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902002725.108635-1-sj@kernel.org>
References: <20260902002725.108635-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SJ,

> Patch 1 fixes the DAMOS quota goals commit unit test to cover a
> mistakenly uncovered case.  Patches 2 and 3 fix the bugs in DAMOS PSI
> goal initialization and eligible_mem_bp online commit, respectively.
> Patch 4 fixes the bug in DAMON sysfs refresh_ms file handling.

I reviewed and tested the integrated four-patch series in mm-new:

  a20e38846efb..72dc8fdaae62

The integrated commits had stable patch-ids matching the posted patches.
DAMON KUnit passed 42/42 tests.  I also ran test-only eligible_mem_bp nid and
two-kdamond refresh-isolation regression cases; they passed 42/42 and 43/43
tests, respectively.  Both test-only changes were then removed and the
worktree returned clean at the unchanged series tip.

These were functional UML KUnit tests.  The fixes look good to me.

For the series:

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
Tested-by: Lian Wang <lianux.mm@gmail.com>

Thanks,
Lian
