Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072701;
	b=bVnsiFInAwP8JxO8FmFJDgPQakeZFMwZUAGj5gqls623GYYgYw4vZQ0ZuaW7i3qCOL4o
	 GOU1QL59XQsvMDdqKKBx4liH52+OCobWfAwvEpgchfwa5L47PKJ6Xzd57Vh7IJGOdAMi3
	 Mxw+iJFTPN8Z18+5RnYQuDD9VC30YACfqTZFLbkWk7nHhefYIjwT+anxIVfaI/aimSfWn
	 cIfAUErul0MV98EvaYaVj2axWitU3NKhEyVQS+HJ9JBuY388jXswz3xOgGrWqTrleYerL
	 MRyLD18v2nKd3qHZU2STwOpGvl0sXL1YKbKGCQ34nFQArjSAch2imkKXHx+fIx3S/7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072701;
	h=DMARC-Filter:DKIM-Signature:To:Subject:Message-Id:X-Mailer:From:Cc:
	 Date:Mime-Version:X-Original-From:Content-Transfer-Encoding:
	 Content-Type:X-Lms-Return-Path;
	bh=ULr9bgQ6yFnrOUoUUAJX9WlVlG9/9n0WdEkZqyzIDlU=;
	b=NkGS09atxu0Swtg7k2WU6SVV04gYHS0aoBw4omYlkCPzQK/1VzMKdP7fYSN0rj796cU4
	 5vNNGcEp5yH46PUDwIkD5nuqm9v0R58EExPW9PoIQMjZAuXQgGEr3HKTPKsQRwg8Nhw6y
	 NxVsBbICyH9ei8wOzG4IFOnjMzcGD9Ryh6UhJicVBz0B4Ildhs2PZUF7QRqcX3JwCBuMr
	 g48M4pojr/jLtNQP4vEMd35rzoN4Zynpd9rozR7HWUODZxs88+A8SFYT40kU/QGfpMxrk
	 SDJcfl9mwP7ZCWdcSEeuHmMJBeIQcdKsyTAfKSVEa8HbeuVbCe/diUnu8WASVJdhQ8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=G5X6RFgY;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F77606A31B
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 03:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F77606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=G5X6RFgY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793072689; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ULr9bgQ6yFnrOUoUUAJX9WlVlG9/9n0WdEkZqyzIDlU=;
 b=G5X6RFgYys8sHCve15qtWmiByr09G/qIaVrk4ZegEXxI+AO9FZqJdCEvdAxDxROb1sXII1
 8tUTcaZGTBOr2jmTBR7LFd9y1+ysnAyl1WOvpgtVYRzaVy0oTN71DEaH07WWN/T3ioPE2s
 dcWpbwB3uwEGpOfKhZ3y9ZlSGwCPIpzKIhz0DFD70Oefa/vPdZat2HDUL+UBI/iEczaLNC
 woHf+dibHCzeiIwmZ1k4cWvQVBw20+DAcVhYwfwmv+OFWM4a9sT1p8tCoQetU3oj18NPoh
 JhtKwzLxbFSlRLIPdM0mvYhzpBuq7R5kjODmCtfkoLuYmrh8b5vzuTvn/hUmKw==
To: <x86@kernel.org>
Subject: [PATCH v3 0/2] x86/fpu: Fix dynamic fpstate leak on exec()
Message-Id: <cover.1793072271.git.weiguixiong@bytedance.com>
X-Mailer: git-send-email 2.55.0
From: "Guixiong Wei" <weiguixiong@bytedance.com>
Cc: <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>, 
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, 
	<chang.seok.bae@intel.com>, <shuah@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, 
	<stable@vger.kernel.org>, "Guixiong Wei" <weiguixiong@bytedance.com>
Date: Tue, 27 Oct 2026 11:44:28 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: Guixiong Wei <weiguixiong@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26ae01e2f+3ac4c8+vger.kernel.org+weiguixiong@bytedance.com>

An exec() after using an XFD-controlled xfeature leaks the dynamically
allocated fpstate. Fix the cleanup in fpstate_reset() and add an AMX
regression selftest.

The selftest reports FAIL on an unfixed kernel (verified 10/10 FAILs
on 7.1.3 with the leak reproducer present) and OK with the fix applied.

Changes since v2:
- Free dynamic state at the start of fpstate_reset(), keeping the
  fpstate_free() interface unchanged. Clear the inherited fpstate
  pointer in fpu_clone() before resetting it.
- Replace nested self-exec with a parent fork()/exec() loop.
- Add a pipe-synchronised pre-flight check that confirms the dynamic
  allocation is observable via /proc/vmallocinfo before measuring the
  post-exec() delta. Without that gate "no new entries" is ambiguous
  between "freed" and "never observed" and would silently PASS on
  kernels where the allocation is not reachable. /proc/vmallocinfo is
  the only user-visible signal for a leaked post-exec() fpstate (it
  has no task scope once the task is gone).
- Compare the set of allocation start addresses in /proc/vmallocinfo
  before and after the loop; addresses present only in the "after"
  snapshot count as new allocations that outlived their task. This
  compares allocation identity directly, so unrelated vmalloc churn
  elsewhere does not change the result. SKIP if any matching entry's
  address is hidden (kptr_restrict) because the diff can no longer
  distinguish allocations.
- Report leak failures without preventing subsequent subtests from
  running, and simplify the commit messages.

v2: https://lore.kernel.org/r/cover.1791428412.git.weiguixiong@bytedance.com
v1: https://lore.kernel.org/r/20260929151013.81562-2-weiguixiong@bytedance.com

Guixiong Wei (2):
  x86/fpu: Fix memory leak with dynamic fpstate and exec()
  selftests/x86/amx: Test dynamic fpstate cleanup across exec()

 arch/x86/kernel/fpu/core.c        |   5 +
 tools/testing/selftests/x86/amx.c | 251 +++++++++++++++++++++++++++++-
 2 files changed, 254 insertions(+), 2 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0
