Received: from mail-108-mta66.mxroute.com (mail-108-mta66.mxroute.com [136.175.108.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D153B47EE
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 20:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490927; cv=none; b=kLNpmDG46j39QHRWK/pAPDJUgOnt6uoniFl3yenm0qnNgSUWhXlErVMVdYD9Vyg3BFw2R5pxUiybvBp83/3TgziffA4+P77k8YvP56rvxHgUhpfHUnF3m7nlLV0r9RbYKEbTNJBe71OSui/kvzxdJAfgDgVlwWbCoewFzXR8EqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490927; c=relaxed/simple;
	bh=1eghTlfDKC16Bb1T42wJ77PJTwDbvYWMjw94O1uYU84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ki9SlN307fo/IaOf/iVMLEPj/8vCwhSCGauIFF1mEkvQwyiZN95HH5mUOP8I2PE0fqHozhO42XivkpXGhGUbn5pPIeXcSTPz/CqmEonu9IhUJhyfYAJX5CxAUv1CbAjwRc0BmdmMqGRFsSGl9YeAyofq2TdEaxhgditW8iUU/HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=bd9+ow95; arc=none smtp.client-ip=136.175.108.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="bd9+ow95"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta66.mxroute.com (ZoneMTA) with ESMTPSA id 1a11d29545d00028b2.00a
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 08 Oct 2026 20:16:50 +0000
X-Zone-Loop: 422398f9c1000f9ad772ad4fb6f273425dd48a37fc0c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:
	From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=cKkOV3NctPJKvnb56+QurQBgeJeGLOz2lBSE0kPT9N0=; b=b
	d9+ow95KIrukW9M1aCi850ChKTZRamIQUeVn/nyBDWrKAxlA2USZARRBBFoNzL6xZkpDZ42/mDbX/
	/nWvNQMwEHxJOxLt/NWFboTX52iegqNTFqJ1ti2GcahVUWu/Ix5Nu1by3WkjcmAG/0OfI0dN6UvmV
	TMYtONLc7R/g5j09T+T6ahAt/t8ayOZ8REPr/fgB/zBchTFWC96HWjzON4HXl6uSKKwbsRIscoMFO
	B5FRXIBZ/NCjifQJ8wuvo8Rt/vyRifeAAZPtzj9UpvEwNExPiZHpZjDDzBJjiRmgSs04QhwzD/0cn
	uKGdL3/ssIPdzlokCOJfJHd7FjPiYQbDg==;
From: Richard Patel <ripatel@wii.dev>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Richard Patel <ripatel@wii.dev>
Subject: [PATCH 0/3] x86/shstk: ban ia32 sigreturn
Date: Thu,  8 Oct 2026 20:16:07 +0000
Message-ID: <20261008201610.1003569-1-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: ripatel@wii.dev

User shadow stacks protect only the x64 and x32 rt_sigreturn syscalls.
Calling ia32 rt_sigreturn, which lacks return address validation, is
still possible via `int $0x80`. The bypass also requires the executable
is mapped into low 32-bit address space. (This scenario is basically
impossible to occur in the wild, but it's probably worth fixing
nonetheless.)

Since user shadow stacks explicitly only support 64-bit mode, the
simplest fix is to fault attempts to do 32-bit rt_sigreturn.

Richard Patel (3):
  x86/shstk: ban ia32 sigreturn when shadow stack is enabled
  selftests/x86: test shadow stack sigreturn protection
  selftests/x86: skip shstk tests where perf_event_open() fails

 arch/x86/kernel/signal_32.c                   |   4 +
 .../testing/selftests/x86/test_shadow_stack.c | 120 +++++++++++++++++-
 2 files changed, 122 insertions(+), 2 deletions(-)

--
2.52.0

