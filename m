Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E324431F9BD
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 04:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756302; cv=none; b=VfVfJxh6pZqn/B7mqJ9I7KSoeGa9qaFdQsxlg7n0uCkW3r3rJug2hIRFffZ/WaJDiABWOfbZf79rxohQanxymUU2g7yEAEpkyLVhyOEc1CSyWQ79zm9hELeSmfbrAlmk8ALlrxhunLKQWTqlHAjgJ7WsrSQQsA5x0O6r+BK/sII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756302; c=relaxed/simple;
	bh=GXik8XMFxKlyNr0DJa0gcBwazjCkzO5/wY0cetFN0QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViQImQqwNrWUpTEGSWa4ShRhZSwpWARFJfIpCz0sTl1jYVocEGDxTP9U1wAljr2MP7Uz6APthcI8v+SWP/dYpdnNfE7VuGP3ex3DjD6752B8TfTmBJRh8AB8RDotLh7DXQDHx/QV5tn53WgYLK0Fitdj92t6RTertdxITt5TCVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UduKfR+1; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UduKfR+1"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso3927104a91.1
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 21:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756300; x=1789361100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnvU2vBpS7iNRhfGmKqIjpkiFHsnHeHr6qR8QCexTas=;
        b=UduKfR+1N4SjTzicVqtQ7dHRjtahTW1A0ApwsHPX2zyd3lfkI0jGvOTnxmzXvuP/G9
         mwlueZJw2W3YsaKBGi+U0RIAXIBIDitwU87vnlpWN54rq7tdpZr8MR2JwvO/ZmCTQIA1
         ewmQXm9C6aj7p1pi8JwyIszxmIfs57JUvyH25z5gtpEHVkVOT1uXS3Be4okQ+Pr2ApNO
         cbNYVvPX5bSDb03qd5BsuTBI9fts2WYvgwmeIFSF2IXkvfZqxJ57uKkpVZErWOMRre1y
         ciEredKNxmWXaMetxPSs46mMVrKpSEIPC0IWuIDQnuRgStupTxbtpkjOrMVGjhP6Bnyk
         pfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756300; x=1789361100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DnvU2vBpS7iNRhfGmKqIjpkiFHsnHeHr6qR8QCexTas=;
        b=cPAezqy5UZ1Y4ur1uiRPjP1DUrE9GlONQMd1QYLeEQPr3S6qcqUJQgk32kjzORGlPC
         Kief6odnMkNTadLC4m43YROUVHIaua9B8BknLDc7hBeiJbWmxfBeqcnTw7yBctkm2iBG
         5FXX/ye3hDX3q9osjsNnCa8T883+9nNR9a/JRXvtRRfE28chZ9dLy5hEvJIJtphuYxRj
         6LOyqXc6RtE+S+hoHwFNJIinCfj5C19JWilW98NTJSQUGsLVDuAW54K9O7PFsEGGULGr
         0p6oDVIc2zMGAmPMPf+H9blCZXCcIQfKYpBRZPZltqYta26mtny0f5CkYz88bBsTMZw9
         lmjg==
X-Forwarded-Encrypted: i=1; AKwUvBx34Rl7uAwQnb6JCkTnHDZXGJY6RiooGACWZBWAON5SwCgqqmPVdwiHZFbKdHrNtQIO4V8u0UfhsEwjtbsmOGo=@vger.kernel.org
X-Gm-Message-State: AFuF++kIurB7bQJC+VRiNYr6Udt786WwkfaPcPycZPehBA7ySwWjXdGv
	9nyYjs9zrDnF3DcTxarWlR++FOwTm+x3M9zGZAlSFY46HSFx9pUl6w0k
X-Gm-Gg: AYBFou3ihxHua54pq8S5s33MO/Mwft3Lv7u7d1jkKKl6IUrReQiVPTxsQSuC3fFzLD5
	4i2q37Tp+KsLc/ZhR3+XSSncKeNKpECOktvBrW6bx3Fs+2W1sGJjYCUN7lI+7fJeKUk7ua60Eis
	iuR0IA3J85MQKw0DaxJc/OqEsphDxgJePSWIIA+k3ldA1kSOtOr5t8mAlFltw5TkqLE/ha58SFf
	zpfV3iuodt1FLrV0HVap/FQbU6jqChwAY12pHdsQtXrAOJStvXiTX91uxUr9UDVX1JgXJDLHxD+
	2apqpUG+h8wGPzpNBwR+BQT4pHJO5z6QiuUU0LoYqFrbWPoFsTWNAUcwO9+9nuH0p4P2x5xMceb
	TrCAvkGkU4ZlgmjRL/GmIM3q6SBqkrQFkGIEMJ75phXDJ/+pSRK/ZNDW4m3aaVV4dSafE2Zko3J
	DomuwJ40UWyPn1VbVFOnOgY+OGfyJ6k3QkOgDh2ZpfG1X7aoRFwfDvn0BUjG0lssvzj5hGr4p7N
	pYvgVVK4fMn+A==
X-Received: by 2002:a17:90b:268f:b0:398:c3a3:dbd0 with SMTP id 98e67ed59e1d1-39b2612eb96mr32751634a91.8.1788756300129;
        Sun, 06 Sep 2026 21:45:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37823751eec.16.2026.09.06.21.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:44:59 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: kvm: fix typo in pauth.c comment
Date: Mon,  7 Sep 2026 10:14:34 +0530
Message-ID: <20260907044434.4682-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044434.4682-1-hemanth.selam@gmail.com>
References: <20260907044434.4682-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment reads "This code assumes that is is run from EL2".  The first
"is" is not a repetition, it should be "it".

v1 deleted the second "is" instead, which left the sentence without a
subject.  Fuad Tabba pointed out the correct reading.

Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm64/kvm/pauth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pauth.c b/arch/arm64/kvm/pauth.c
index d5eb3ae876be..bb6c42e78058 100644
--- a/arch/arm64/kvm/pauth.c
+++ b/arch/arm64/kvm/pauth.c
@@ -5,7 +5,7 @@
  *
  * Primitive PAuth emulation for ERETAA/ERETAB.
  *
- * This code assumes that is is run from EL2, and that it is part of
+ * This code assumes that it is run from EL2, and that it is part of
  * the emulation of ERETAx for a guest hypervisor. That's a lot of
  * baked-in assumptions and shortcuts.
  *
