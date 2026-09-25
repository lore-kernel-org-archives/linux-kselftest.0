Received: from out-2uec-a123.jellyfish.systems (out-2uec-a123.jellyfish.systems [63.250.43.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199684C6536
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 18:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359609; cv=none; b=jsR/oHh9L1EArmgdZNbGl8RjbVQAZXBpUoBARLSda9q40eC6rI0lP7yCTn3cAbg1LntUB0p90zyB+xOzSiDVoOWB1sRRbk7A6oA75uGJaBJnzpJRa42J5N570dSGVSxNv2XeNkvR6RSXQJnojnKZuQ7zutyqXnTmUx5EUUQXWA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359609; c=relaxed/simple;
	bh=ymgShMe8JjE49tDt3/53i+PPVMEinp17pSyo2+BnjRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mcEWmopXeJr5jp7qltdGEM3HMFbho5bPglHgJQjvVe6H3qWELWbRTbFKbcFmVJQL/oFgQlomlBWpUoKhM2qUSVnS/8Acr+2tDwaqZP97Yw7M2KTApmRRrBKqIwO7IxnBr6qMh7fv0QzXJ30pt/OgaWUwTp95tWavG/66uxAeztU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=E5qgvoZL; arc=none smtp.client-ip=63.250.43.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="E5qgvoZL"
Received: from 192.168.50.46 (unknown [114.92.81.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hrymT6X6Dz2xDd;
	Fri, 25 Sep 2026 17:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1790358363;
	bh=ymgShMe8JjE49tDt3/53i+PPVMEinp17pSyo2+BnjRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E5qgvoZLwc4ltJMaQGlmPRSfztoc4kWz2mAFMUczm0hdSzPFx4KqBrp3JusQZKGgJ
	 10Yjvg64tvjAzfueZvq4TpefqZSPfyIMJW/1a9pY4brPaIG6hcE73Np2H74dTKkrVx
	 MW3kprjVsRM2OfJK4ioriJsqjQDlhiPwNpYINFMn0fPPihlDGzpWreq3Um38nE8q7l
	 o2jEgZGjnHsX2XmE9JyySq3ohuzmO1mESIM9nKIIOWAisOyOrGz3w7k0JdiZw6Z2BO
	 mcDmfM9LJUFliFKrvS/5vaSEYzwYfjGKyvN7CWqW+uJLp3ufX4JHqq2rdgVJGrE2O0
	 Bt6FDcwacXxag==
From: Tianyi Chen <hi@tychen.cc>
To: Quentin Monnet <qmo@kernel.org>, bpf@vger.kernel.org
Cc: andrii@kernel.org, eddyz87@gmail.com, ihor.solodrai@linux.dev,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v7 1/2] bpftool: Add recursive map dumping
Date: Sat, 26 Sep 2026 02:46:00 +0900
Message-ID: <179035836017.2029588.7852183060719250433@tychen.cc>
In-Reply-To: <6ed88738-4e3b-407c-90c2-bf7717f3e653@kernel.org>
References: <20260924161434.95116-1-hi@tychen.cc>
 <20260924161434.95116-2-hi@tychen.cc>
 <6ed88738-4e3b-407c-90c2-bf7717f3e653@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Envelope-From: hi@tychen.cc

Hi Quentin,

> Can we align it with what most other subcommands in bpftool do, please?

Done in v8: REQ_ARGS() and map_parse_fds() now handle MAP first, followed
by a loop over the remaining keywords. Misplacing recursive now reports
the MAP parser's error, and repeated recursive keywords are accepted.
Trailing-argument errors go through exit_close to release the selected
map FDs before freeing the array.

All 13 subtests pass, including the revised argument checks. A syscall
trace also confirms that both FDs selected by name are closed on error.

v8 is a new thread:
https://lore.kernel.org/r/20260925174402.2028649-1-hi@tychen.cc

I also checked v7's CI failure: it is test_verifier's invalid call insn1
on s390x (expected R0 !read_ok, got JIT doesn't support callx). The
for-next_test run has the same failure, while all 13 recursive-dump
subtests passed on s390x:
https://github.com/kernel-patches/bpf/actions/runs/36028683139/job/1077369230=
87
https://github.com/kernel-patches/bpf/actions/runs/36029092386/job/1077370328=
90

Thanks,
Tianyi
