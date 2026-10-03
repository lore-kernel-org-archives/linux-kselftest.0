Received: from cvsmtppost24.nm.naver.com (cvsmtppost24.nm.naver.com [114.111.35.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18BF1FF7C8
	for <linux-kselftest@vger.kernel.org>; Sat,  3 Oct 2026 02:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790994879; cv=none; b=n3GZVxcNXBYPU9tPdKS7h079Wp0Rewkyo07vM3Hl6y6GttcZo76ql9QzCTs+kA6h1k3s0qiUeHVH2m9cS2U3xD9HFobyjdHLI9Pwgqxh8hRb4SRWgkqZ5Igc6NRaUUfy+W2WFcsoaOwUtpKy8AcJoVMJivfpBFwIMQQBijhneV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790994879; c=relaxed/simple;
	bh=D9PsPk0gFlO9GPGaOGATZQ1D1CCazUzS3Cj41Y4mEF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gzndv4CspyVKtd4raYk36MMOwsUbmGQIlNlpJnCJLRDzAGcAWPHTFyDvCwowFOkJg9xpfha4vstGI7gaf+PH1qgFzizhd1E2Dxmc/79bZzKdvBpdeORA5emk3DC209J5p126yz3b5fPPi/VdtdJypQEe8b8BIK99/WEUg2ulu5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=vxv1fU+V; arc=none smtp.client-ip=114.111.35.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="vxv1fU+V"
Received: from cvsendbo030.nm ([10.112.20.49])
  by cvsmtppost24.nm.naver.com with ESMTP id 5aQgHx-kSeOj+n-gjsZPrg
  for <linux-kselftest@vger.kernel.org>;
  Sat, 03 Oct 2026 02:24:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1790994267; bh=D9PsPk0gFlO9GPGaOGATZQ1D1CCazUzS3Cj41Y4mEF4=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=vxv1fU+VzK7CdzB9+WGbCfeafTfUZpYsTitsHZlXQjXSTMcNEUwO3smYZ9gV9poY8
	 VfJENcyq09C0fau8WJhX+fGb4sZYhr27fUkbaWDAot/a654QVsE86+JQgxoY+lPOSb
	 HNL+cTIXr2DbAR43k5dogXW9q8ERLlqZwjAmd7G5k7YRqMgrxd7nFuVcUasd0mgVQD
	 mu00rpZW2vHKX6b76tX5YXcy0ba24R99jaZscDQrBahyXbh37vNQT1xFWOOFTmnzPv
	 tSIa9CeLzn/CHiAmwIpxns5/FLwT+ECOGYUf5OlZBw9PCgEHRaJcwJLk5m32bShVoQ
	 hfZclx3aBD/5g==
X-Session-ID: FHq34ZsPRCuc3hsR6l3now
X-Works-Send-Opt: Os+wpzGdjHmdKHFOMr39Ko3YKHmljAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: gdbraxglFqJZ+HmrFo2w+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp005.nm.naver.com with ESMTP id FHq34ZsPRCuc3hsR6l3now
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 03 Oct 2026 02:24:26 -0000
From: tjdqudcks0424@naver.com
To: brads@mainlining.org
Cc: akpm@linux-foundation.org,
	bsingharora@gmail.com,
	cyyzero16@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	xu.xin@linux.dev
Subject: Re: [PATCH v3 2/2] selftests: acct: test taskstats listener netns routing
Date: Sat,  3 Oct 2026 11:24:18 +0900
Message-ID: <20261003022418.1004081-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <98826F7B-9448-4585-89CA-55590AE29280@mainlining.org>
References: <20261002105614.195370-3-tjdqudcks0424@naver.com> <98826F7B-9448-4585-89CA-55590AE29280@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 성병찬 <tjdqudcks0424@naver.com>

Hi Bradley,

Thank you for testing the series and for the detailed feedback.

I reproduced the repeated-run problem and found that the test was rejecting
valid unsolicited exit notifications after the first one.  The kernel uses
an increasing per-CPU nlmsg_seq for these notifications; run 1 used sequence
zero, while later runs used nonzero sequences that receive_victim() silently
discarded.  The normal init_net listener therefore appeared silent for the
same userspace reason even though unicast succeeded.

The test now distinguishes matched, unmatched, expected-no-record, poll
timeout, deadline expiry, malformed, receive-error, socket-error, and
suspected-drop outcomes.  It reports receive counters and per-socket
/proc/net/netlink diagnostics, including Drops.  I also made registration,
victim exit, deregistration, close, and reap ordering explicit, added bounded
cooperative cleanup, and made closed-pipe cleanup SIGPIPE-safe.

I ran the same test binary 20 times back-to-back on one vulnerable boot.
Every run delivered the exact victim record to the colliding unprivileged
init_net socket instead of the child-netns registrar, while the normal
administrator and negative controls behaved as expected.  I then ran it 20
times back-to-back on each of two fixed boots; all 40 runs passed.  After
four induced failure modes, the post-failure recovery test passed 10/10.

I also repeated the validation on current mainline: the vulnerable kernel
reproduced 10/10, two fixed boots passed 20/20 each, and post-failure
recovery passed 10/10.

I added comments documenting the socket-private namespace lifetime and the
intentional all-CPU listener sweep during socket destruction.

I will send v4 as a separate series after allowing time for review.

Thanks,
Sung Byeongchan
