Received: from va-2-111.ptr.blmpb.com (va-2-111.ptr.blmpb.com [209.127.231.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A9C3B71C4
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 06:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439218; cv=none; b=hpSkyHFR0zG1GGrAtR7dsnXjMTC9MMe1a7Fujqv4sLOgQM6HzwTZjGPBRqRzbANG19Fu1cE9QM/yIOLo4KRnsvKQHJTxBEvO2xg/Nwyivelenzf4Zl4/j0Uc5+yKm9YhXjipt/15L6xmfkNr09gA6KmmLIYaXNs38Ug5BGVn8io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439218; c=relaxed/simple;
	bh=atopTEU82pKWj1hIlC0ATvjBX+nda9tdm3dbSc/Tkbk=;
	h=Cc:Mime-Version:From:Subject:Date:Message-Id:To:Content-Type; b=Flqe77/iCiZ7XogL9LOmm6zTlRRoeQqkAxqp1kZjUDXeam3lKC8bQigatwTnsplfIYHTiEQI8MGXpy00JowMy/Cek0UM78kIGszsJM26RXQwVqHjoZSj5kFWbWXQ1YruzGWlQobjtu4isjbeycrXK3lnZHwLiL11HZcwa3ffpXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Z8Q/SoiM; arc=none smtp.client-ip=209.127.231.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Z8Q/SoiM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791439205; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=IJJMdUiSpOAuCXacXIpmuvPEGQiEu8gSCHcioGm/R8A=;
 b=Z8Q/SoiMIR/bdVsaHkndDc5s8uJl8Kktv1koX/5Lb3hHJNTvXq0VOmjxcve38iDOmPMXmG
 pADjoHgkhGtQ7hJAWRTnmvw9SvTlEl29TZpcl/OrpPSdkVC4bJQOUa36qTEWHGqzANVBjz
 C+04tNFHXO07fxzxIbrCCU4s5D8t0wmPodwJkOFIy+2uhSNhMCtxuqH37xaml+gVRC8vBx
 mVrk1UBxn1UHLyz56bGWQdPUP1R+zvRoLmkEnc8jcbnIk5s6Psf61P3rFFtoGupWm8GETD
 qHju4e8S2VJC1U1xqQep6EfttS5cRpI+PVnWrH4UR4QXwA5vuYzpKb/ncvCggQ==
X-Original-From: Guixiong Wei <weiguixiong@bytedance.com>
Cc: "Guixiong Wei" <weiguixiong@bytedance.com>, 
	"Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, 
	"Borislav Petkov" <bp@alien8.de>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, 
	"Chang S . Bae" <chang.seok.bae@intel.com>, 
	"Shuah Khan" <shuah@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-kselftest@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: "Guixiong Wei" <weiguixiong@bytedance.com>
Subject: [PATCH v2 0/2] x86/fpu: Fix dynamic fpstate leak on exec()
Date: Thu,  8 Oct 2026 13:59:34 +0800
Message-Id: <cover.1791428412.git.weiguixiong@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.55.0
To: <x86@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26ac73163+9dfaf3+vger.kernel.org+weiguixiong@bytedance.com>

An exec() after using an XFD-controlled xfeature resets fpu->fpstate to
its embedded storage without freeing the dynamically allocated state.
Fix the leak in fpstate_reset() and add an AMX regression selftest.

The fix preserves the old pointer, installs and initializes the embedded
fpstate, and then frees the detached allocation. Since fpstate_reset()
now owns cleanup, fpu_clone() initializes dst_fpu->fpstate to NULL before
invoking it.

The selftest performs ten XTILEDATA request, XRSTOR and self-exec cycles
in the same task and checks the associated /proc/vmallocinfo entries.
It fails with 10 leaked allocations on the unfixed kernel and passes
with zero on the fixed kernel.

Changes since v1:
- Rename the fix and describe the memory leak explicitly.
- Move cleanup into fpstate_reset().
- Detach the old fpstate before freeing it.
- Initialize dst_fpu->fpstate to NULL before resetting it.
- Add the requested AMX regression selftest as a separate patch.

v1: https://lore.kernel.org/r/20260929151013.81562-2-weiguixiong@bytedance.com

Guixiong Wei (2):
  x86/fpu: Fix memory leak with dynamic fpstate and exec()
  selftests/x86/amx: Test dynamic fpstate cleanup across exec()

 arch/x86/include/asm/fpu/api.h    |   6 +-
 arch/x86/kernel/fpu/core.c        |   5 ++
 arch/x86/kernel/fpu/xstate.c      |  10 +--
 arch/x86/kernel/process.c         |   2 +-
 tools/testing/selftests/x86/amx.c | 144 +++++++++++++++++++++++++++++-
 5 files changed, 156 insertions(+), 11 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.50.1 (Apple Git-155)
