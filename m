Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67C73B992C
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045024; cv=none; b=GT2JCzwa5jbyz6KWQLqjhntRH3YpsQ4/cMrPHo+arZG6ip9L+RLe8EE6DhTB2KuQUD5nNQef47AYz+dTwofhGc6o6FAftgAFI61L26MocEmDY3DuTWXWUkF81yOScPKdPecrQaOjRrAo2NqqxTPexMWunM/26XFrqDHaJL1cfX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045024; c=relaxed/simple;
	bh=gFGy71C2eoTN3BD7btjLcX7mhlzhINqXiE6srCYAltI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5f03dTPGC183spYrhBaSDv4BujseHkc/Wi5oEzemc8073RoSLWouYW9kSHGYFFvM9AlM4GAWo7ZNsC16uvOvBx1ot+34Hnu5HHaTHxAsmx5UKI0C3xKd/JY6PbrzV6RYC5e7tHc2DPi9SnF9O9etZX2nZVAXcXkmJ6PzlJhwz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8+gHB5w; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8+gHB5w"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-399213ef56cso3088802a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 05:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045023; x=1789649823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mRdG/Kt6hS/eZlSBVQMx/QTMGuDSPWApxK45jZ1fD0=;
        b=J8+gHB5wwAr6//E0BhOL11YFPxdzUJiarVII9E3aM9VU64ickEQigEnEZFVDgRfjnS
         EQCGiyP7CpG75IH0k+aqbtEwrlQLGa4t7Xp+NahfAa6ihKy6m5GWYd4OprDvFFVL/zmr
         VAA01Y8uEQPhGGjIUwfSGlIN3YUjZthzX2oi7QHJUWfXzrTpW8mODBhNCCpMlfApGsxe
         rdUuNPiLUVYgF+uwq3lZAdr3+PGGMymrbtKk6H7DT2AHYVM1+iK7NPzfyZ9dwuffeRos
         YilS2cwL91tKDRAztHVFNh3Nvb1PT8+ehULBAhSXnY/Eed24t0KJHuHxnEsnSK3L4/Aj
         xTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045023; x=1789649823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mRdG/Kt6hS/eZlSBVQMx/QTMGuDSPWApxK45jZ1fD0=;
        b=UmbRlLZ29gCZcieR6PIUnO1z5gERFKqGxmZ7hCKSvULmLVf0odpqn/Rv2i/jIZNOn6
         43mga8+niC9gsGdcqDgz3dhNTjjYlxL/dfbq4L5upz78Vu/Bl05dp2d5YdFOcE4mexNt
         mHIl+aAd4qRg1H5yIgCWBqmJVhKAZFzJ+zLN0TUyE3EFqaRImxeTfrhOfX1ZLkTq0fup
         QEubPc6Zu47NkWLl25ZGnlEb+xFRgtawufTJJi6KD3i4nkIet6w0OYsNOXMLjwzaWdwZ
         Tj4FaIyWLq665ncfhVCs5Ssmb0N5zDzsN+dZwJYpzRkBWtUM7VeUs7w/n47fR/lvAesC
         pR4w==
X-Forwarded-Encrypted: i=1; AKwUvBwTyHugGbB8XndP8OsXEaYTb1Eso37jKDh/6kO718p4KHBUes7NwmlCY34qd+ZqkovMdvAWuUnmtJDfvD67O3k=@vger.kernel.org
X-Gm-Message-State: AFuF++mEQRzDbuZx+i5uoQpqs6eyULHuZsnXTI0MJCYD1nTeCjnxKI10
	LEHvhH8dePTCaZIS2ci8DquUZaB0f6W4iUatiNHATj2yvQmNAnkbXhxt
X-Gm-Gg: AYBFou1dar3RPNc6Bc4FJYy0wWKkJck927FVisXKt9rVmApv25/Th+W712jjWACtDj9
	vktyZCBl8BqqVYZVxdNj6jSLeeIkbdABycrclyW3zTnvZpuK6pib5L/fn1W0stLmnbLTrengdpT
	vcc+tvcy4+NniWXsA0GFBcUMx+sU52dwTlYQg7RJ+tdqinhWhd9IR13nyoJpkabY7fQBaEcFvss
	v0zihfVGzpSlPLew0JassA3bzBVUUOm5W9IEZP8OMvSuydDWTq6+fCYtSajAvON8yYhde8kGKPz
	BPGHFO/7NL4AGo51Ht+nreAs7OWAEDdPPo+uqHNRufS4nCI/9beHLspgov8R1c13vUm1cC+w7Zj
	WAoTd+NnoNKpTeM3T8YHWVGhqvojCHsDSAO2oB+yZqpJtlMyTwDdSVvyptsGeeYGRoau3CP4brF
	kaFtv1imWww+nvOEnGTs3dpWNGqPCnepNePXCtU7iw/CahUTD1/5XGIaJpZQ==
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr60407420a91.25.1789045022916;
        Thu, 10 Sep 2026 05:57:02 -0700 (PDT)
Received: from fedora ([69.5.53.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e9014cbsm4800488a91.16.2026.09.10.05.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:57:02 -0700 (PDT)
From: Tianyi Chen <diannaaav@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joel Savitz <jsavitz@redhat.com>
Subject: [PATCH v3 RESEND 2/2] selftests/mm: Only prepare ptrace_scope when memfd_secret is selected
Date: Thu, 10 Sep 2026 20:56:45 +0800
Message-ID: <20260910125645.285866-3-diannaaav@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910125645.285866-1-diannaaav@gmail.com>
References: <20260910125645.285866-1-diannaaav@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyi Chen <hi@tychen.cc>

The memfd_secret setup clears ptrace_scope whenever its test binary is
executable, even when a different category was selected. run_test() filters
the test invocation, but it does not protect the preceding setup.

Check the category selection before entering the memfd_secret block so
running unrelated categories does not change ptrace_scope. Keep the
existing executable check and the behavior when memfd_secret is selected.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/selftests/mm/run_vmtests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 9e62ab4c6775..9bbef9410ccc 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -370,7 +370,7 @@ CATEGORY="process_madv" run_test ./process_madv
 
 CATEGORY="vma_merge" run_test ./merge
 
-if [ -x ./memfd_secret ]
+if test_selected "memfd_secret" && [ -x ./memfd_secret ]
 then
 if [ -f /proc/sys/kernel/yama/ptrace_scope ]; then
 	(echo 0 > /proc/sys/kernel/yama/ptrace_scope 2>&1) | tap_prefix
-- 
2.55.0

