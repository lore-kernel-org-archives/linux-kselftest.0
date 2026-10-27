Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072710;
	b=nJIWVYknFd78c6zo7df6qDqlk0+zwGpgr7X4jkrykMf+rh7ytuqJ3zgTOJxQO+Z9QdS7
	 GbMDvEn5QXBzs8jTVKaKVPK+KfsEauq0qS5zVp64gltENX6KD0eGpL8NUec1cTlwx6mWQ
	 g0ytl7AsOoUQDikzIwxZXXB/cEtDmqQ0uBmf/2iXCT1Mw6JSi8FugeHJr2iwB55q+CChd
	 EOJaNQWjOEam6XPKYVqjDBSJj3G1TGCtZeWGa+uGhMCeRvK8U7Ml11pNH+ScTfj93ns3c
	 nNcQOBUX97+zmFDAsJqoV90izjUpfhnZZ+5HnX4qljvGyv/evbBYaB7eQ9wTTMi9Vew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072710;
	h=DMARC-Filter:DKIM-Signature:To:X-Mailer:From:Subject:
	 Content-Transfer-Encoding:X-Original-From:Message-Id:References:Cc:
	 Date:Mime-Version:In-Reply-To:X-Lms-Return-Path:Content-Type;
	bh=IU6VHGahaQUjfrcJ3t0CrfGoXgu1vrAKIBCseES6bf8=;
	b=jXc2XzJNdgbf3MtH6ou8urSXcBhxKy9/yK5uQr2rJQ4BlgV63MJkYcexVT6+bk8+eFvN
	 L5D8mQkWqn1WSWSL0pPjApxvlOCOf8ZyR1AIPXIKOumpFjRBwnvAXOM4LgDIHuYa+3+0r
	 h+8AQI+vA4a6HXE7//y5yuChs2ad+lS5lfg51uxF+NDJ2IS0JAGq/fHQYU7bl1VHFbNup
	 VWgi3a/sFRRVp+HKDV2ZS4ioOlyeQeoEHHW0xVn2j27Ob8NUjOyHUFzLPr/S5ytjqU9ZM
	 ISaATTu9IlvpHTDtvfUcdWjpefrmdpaQs2liLbZPsoQR4w3kNTfcGsMvz2J4Bbo09VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=o0EYgtPm;
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E91606A32E
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 03:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E91606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=o0EYgtPm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793072704; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=IU6VHGahaQUjfrcJ3t0CrfGoXgu1vrAKIBCseES6bf8=;
 b=o0EYgtPmZ2vBDaT37nfX3AU6Pjhb5TrwyDy0catKkqLZ6u/P0ezTz2ZbQSoP30JmbwuIow
 RV2xsGTDUifGGYttmFB8qQj5xFVXGjJAQ8PfJclkv6vf6sbjCeiYdnMGBS4PEocXYe7LAe
 8onj/1QrGdqegnW4ymuUxfLnFoUZwNPu+yee1Ebd7cS4n/FTcOOFBQyWngdJ3lyphMvGhm
 WWYRrt9XH0uzHs7ZESOQvQctbidjNicCbJZtSC0a4cRax1sVEFRAPLnyGv6Jk7nfZXt/NK
 g495xkt7/4VERgXDwD8Px/uioyQ3YxJPU0jC0kngp4iI2AEXNdlO4+ixn3wtrQ==
To: <x86@kernel.org>
X-Mailer: git-send-email 2.55.0
From: "Guixiong Wei" <weiguixiong@bytedance.com>
Subject: [PATCH v3 1/2] x86/fpu: Fix memory leak with dynamic fpstate and exec()
Content-Transfer-Encoding: 7bit
X-Original-From: Guixiong Wei <weiguixiong@bytedance.com>
Message-Id: <f6c7690f8288ad9e95996e0cb37fc4c385df9ee1.1793072271.git.weiguixiong@bytedance.com>
References: <cover.1793072271.git.weiguixiong@bytedance.com>
Cc: <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>, 
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, 
	<chang.seok.bae@intel.com>, <shuah@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, 
	<stable@vger.kernel.org>, "Guixiong Wei" <weiguixiong@bytedance.com>
Date: Tue, 27 Oct 2026 11:44:29 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <cover.1793072271.git.weiguixiong@bytedance.com>
X-Lms-Return-Path: <lba+26ae01e3d+2b6cf8+vger.kernel.org+weiguixiong@bytedance.com>
Content-Type: text/plain; charset=UTF-8

Using an XFD-controlled xfeature can allocate a larger fpstate. On
exec(), fpstate_reset() replaces fpu->fpstate with the embedded buffer
without freeing the dynamic allocation. Once the pointer is overwritten,
the allocation cannot be freed on task exit.

Free dynamic state at the start of fpstate_reset(). In fpu_clone(),
clear the pointer copied from the parent before resetting the child's
state, so the parent's allocation is not freed.

Fixes: 500afbf645a0 ("x86/fpu/xstate: Add fpstate_realloc()/free()")
Cc: stable@vger.kernel.org
Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
---
 arch/x86/kernel/fpu/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index d1aeecd57f5ed..dbe6696fdf8cf 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -594,6 +594,9 @@ static void __fpstate_reset(struct fpstate *fpstate)
 
 void fpstate_reset(struct fpu *fpu)
 {
+	/* Free dynamic fpstate (if any) before resetting pointer: */
+	fpstate_free(fpu);
+
 	/* Set the fpstate pointer to the default fpstate */
 	fpu->fpstate = &fpu->__fpstate;
 	__fpstate_reset(fpu->fpstate);
@@ -670,6 +673,8 @@ int fpu_clone(struct task_struct *dst, u64 clone_flags, bool minimal,
 	/* The new task's FPU state cannot be valid in the hardware. */
 	dst_fpu->last_cpu = -1;
 
+	/* Break the link to the other FPU's fpstate: */
+	dst_fpu->fpstate = NULL;
 	fpstate_reset(dst_fpu);
 
 	if (!cpu_feature_enabled(X86_FEATURE_FPU))
-- 
2.55.0
