Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41EC332EC5
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 07:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704086; cv=none; b=V+b9maJbqpYZ+IcEhuN/BONi22nD6In8A1sGj0aKFTZW/2S/5glC1u+BWaGy2qfsem0ObS+wwapigghWDVO9TZfEhXXi52Ghi+7LZRZGaJSvLIUEbXWu1yVveOLdYuRT5ad4M36L8d7t8UcGfTOaU5Wq2l69FDYHTQSTI/aXMwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704086; c=relaxed/simple;
	bh=1UNB1RKFMSo6qfko9zyEtbWe/yak7KWieVMlEHu2QiY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dvLo4keLB/OX0GQzBNBPAQKfnpPdFZVlSClrIvlYxjbswuVM9D8yy4f73mJR8+bO59g0t1zy6dYKduoSos3Do7inMLMBsrJNKLDp2y6747keDy2Bbt5xfEUcBMyTFtkN7wgCsis5jX43nf1WmFgF8YxHQseH6vdcNYq9/KjgzgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nC4FO9i8; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nC4FO9i8"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484b9fb055so18840413b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 00:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784704084; x=1785308884; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQimPapuvRAwYCmspaYRT7TMwGGHh/w1ExyHkcAjVSg=;
        b=nC4FO9i8rGSNjyn0emdBrvQ3iSStslRrWXq3HQDgiQFKAKs6WXq2Xx8ppqzZ3sChBo
         zNBdiM/uI7S6u6SmKJxEp6loXb6zFkjOrwYzEKXlkBDrqt7MfZQwaSp8qdKNVmGEEsVA
         At9UccPrB2BGaRBGsMIwsAYtai9Pw0ZjAbsIWHm8V7zfXSoKCGQkdpX45AZQASV4W8s/
         uAKv7QyCoB2mfeuLusOxuVx5oF072RVN1GswJKjGuyaNHls9/gCx/LG2dKSmg+AjJjZb
         7rIn/vbvGZCs24qw7BkjDyGpltb40muNOy9Y3HL/3VgAU1mZrtPO57jIO4KMp66ma65H
         2Imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704084; x=1785308884;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQimPapuvRAwYCmspaYRT7TMwGGHh/w1ExyHkcAjVSg=;
        b=DKIfUemOMQkyDe27oGRBw9oRz710Lq/0nbDgqcii96GvTDpSmPnrQkeE0Qy083/zPM
         eFBVfheVwvus5NAEGiT3VrsWQpyFWXzZUXbWhZ+4Dvv+3ZvlXuZNyDRJ6zEgZE3YnN/1
         g7GVmcdgi/HuT1VFzZpns3n463B58KvpaYv4GFnqE9Ghqlz8IcmGPOf3N7+Zzjhw6fMA
         kQeFEZRdrmz80ZIq5lepvSUdOF3W7aKiK98oVG1/9bIHEI2C/Mzk9V3l75vvRDlK+YeY
         qSbVEIsmP4JJkcbAO1GrQZKieA9XVBjBdwl3v4MIHchol0+w9Qo3deYj574un/RepiyZ
         G41w==
X-Forwarded-Encrypted: i=1; AHgh+RoQyeYjdYcX/B/9Mi3T1WlUyj7nrg7yMHy7Dq4/nHMzcE0v0VT0d2daR5CMcDXN1bu6SbuuPneoVk/RNYzWo9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJv6TA4gijMfBzVqP1kIOwkW2s2AToQfDGODtz5Z/1ZwfOe06J
	GSYFM93MKlZ8DVOwrEIGf2pDyrHmt55nHo8oYVPNC5bfAxdZ76jJECo5vZpHIKWfvoE/hXDbXEL
	BcQ==
X-Received: from pfble18.prod.google.com ([2002:a05:6a00:4fd2:b0:848:41c3:4371])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e17:b0:848:76af:db34
 with SMTP id d2e1a72fcca58-84c2954ac33mr21233983b3a.76.1784704083713; Wed, 22
 Jul 2026 00:08:03 -0700 (PDT)
Date: Wed, 22 Jul 2026 07:08:01 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260722070801.2057634-1-wakel@google.com>
Subject: [PATCH] selftests: futex: Restore support checks for futex2 and priv_hash
From: Wake Liu <wakel@google.com>
To: shuah@kernel.org, tglx@kernel.org, mingo@redhat.com
Cc: cmllamas@google.com, andrealmeid@igalia.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	peterz@infradead.org, dvhart@infradead.org, dave@stgolabs.net, 
	Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

Older kernels may not support FUTEX2 syscalls or PR_FUTEX_HASH.
Removing these checks causes false failures when running the tests on
such kernels. Restore the checks so the tests can be gracefully
skipped when the features are not supported.

Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/futex/functional/futex_numa_mpol.c | 2 ++
 tools/testing/selftests/futex/functional/futex_priv_hash.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/futex/functional/futex_numa_mpol.c b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
index 78c0f7a59e17..d215acf88120 100644
--- a/tools/testing/selftests/futex/functional/futex_numa_mpol.c
+++ b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
@@ -103,6 +103,8 @@ static void __test_futex(void *futex_ptr, int err_value, unsigned int futex_flag
 			break;
 		}
 		if (ret < 0) {
+			if (errno == ENOSYS || (errno == EINVAL && (futex_flags & FUTEX2_NUMA)))
+				ksft_exit_skip("futex2 or FUTEX2_NUMA not supported by kernel\n");
 			ksft_exit_fail_msg("Failed futex2_wake(%d, 0x%x): %m\n",
 					   to_wake, futex_flags);
 		}
diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/tools/testing/selftests/futex/functional/futex_priv_hash.c
index e8079d7c65e8..27c3ea5ff3ed 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -145,6 +145,8 @@ TEST(priv_hash)
 	}
 	/* First thread, expect to be 0, not yet initialized */
 	ret = futex_hash_slots_get();
+	if (ret < 0 && errno == EINVAL)
+		ksft_exit_skip("PR_FUTEX_HASH not supported by kernel\n");
 	if (ret != 0)
 		ksft_exit_fail_msg("futex_hash_slots_get() failed: %d, %m\n", ret);
 
-- 
2.55.0.229.g6434b31f56-goog

