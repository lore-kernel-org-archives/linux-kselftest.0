Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A471A683D;
	Sat, 11 Apr 2026 00:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775866923; cv=none; b=nvzCO5Xgcgqdpam3S8xnZcxiuk7X7Z+L2QgEENOmEkszsxKMUAEGcF1tfRiGYz01yo/KQW9kLsRTiaLK7uH+OY/FpEcvst08wn4fSVLitwzoKpiNrUxl0xrzCpUacuIxx+VAie5bzAz5UJKeG+3zZUFa2qK0gbJrIRcYRqLpiNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775866923; c=relaxed/simple;
	bh=kBiuAJsRleCAE2nQwc802BH6Pka0Eyd4qplz/R/dloQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=at1g1fIluSPlhSdzCMPpLR5FhotHkZd2M17w7oYnlGQKO5CY+2o7pFG6jzDayVsrRQSlm8e7Y/Kopn4bNJvuVKSJzS5vLGEhxW720hYCNqAbfxHM1pwnEWUH1rFvckTK+pZzPwaS0sm5QR7K3kO9Y8RZ//uGn3qYkoMOtVeggkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avzeDsWb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avzeDsWb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEDBCC19421;
	Sat, 11 Apr 2026 00:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775866923;
	bh=kBiuAJsRleCAE2nQwc802BH6Pka0Eyd4qplz/R/dloQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=avzeDsWbKMIlIj8DvJuHnH9XjqAKJtIGdak9Bn+h27yxmse4cmnu1tTqEIXxq7wYb
	 dpKuiX/5HPam4Jb2FJu1TqPCpJito4as02is2S82+4AQjk78N/hwU/ApcG3t4cUifQ
	 loo9ZEqIT5MLmNGhGcbcygvWYZRiYESEKHgbYndk1TCB3JmuJoZQh7Xe2BJIYGr1CK
	 nO+zMw+5D+pcGWP2Ffm3yTjBq1Ek4GJgtFMqOkA1IKn8MjeFpwlqMUjTzo/R4heqEU
	 5Z7JUVE6PrNcEa9ts+1/lrwGlN/kk/QVshfvzlX2WVYxWferX33d8lvBIis1grNpO7
	 yRbAdr7SadxCg==
From: SeongJae Park <sj@kernel.org>
To: Cao Ruichuang <create0818@163.com>
Cc: SeongJae Park <sj@kernel.org>,
	rppt@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: mm: skip charge_reserved_hugetlb without killall
Date: Fri, 10 Apr 2026 17:21:55 -0700
Message-ID: <20260411002155.91521-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260410044139.67480-1-create0818@163.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 10 Apr 2026 12:41:39 +0800 Cao Ruichuang <create0818@163.com> wrote:

> charge_reserved_hugetlb.sh tears down background writers with
> killall from psmisc. Minimal Ubuntu images do not always provide
> that tool, so the selftest fails in cleanup for an environment reason
> rather than for the hugetlb behavior it is trying to cover.
> 
> Skip the test when killall is unavailable, similar to the existing
> root check, so these environments report the dependency clearly
> instead of failing the test.
> 
> Signed-off-by: Cao Ruichuang <create0818@163.com>

Reviewed-by: SeongJae Park <sj@kernel.org>

> ---
> v2:
> - replace the PID tracking approach with a simple skip when killall is
>   unavailable
> - follow Mike Rapoport's review suggestion

I was actually thinking if PID tracking approach is better reading this
chagelog.  But simple skipping also makes sense to me.

Btw, adding a link to the previous version [1] would be nice.

[1] https://docs.kernel.org/process/submitting-patches.html#commentary


Thanks,
SJ

[...]
