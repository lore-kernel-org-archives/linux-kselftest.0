Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9331238E5C5
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 18:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668642; cv=none; b=Z/TyQaP6VCQMuZyyxJ09h/2NQjUhpTya+PeeAlPu6t8w/+w/TM4mWocxZAuJkfyBzdoCmWFxVJZ8j6OElgs6WC3lzYD+KiZhB/v8WmCAFmBFvAMo2FchegfqUGM+4Ut7rCZcH90IC31Nesdqv8rTrf6dV8zW/oY9c6/EmvY9SfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668642; c=relaxed/simple;
	bh=kr+z+SDuUt1hcjAlDkjURs5lDqW6XfYcaxmQkcluc18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XyJWr1xsI4P804pgFePeBt4rww4epjEUNOt9UzvhIHGqWivadh2/9Ax6XlfwUAK+W87imTzXSiwKPC3bu+8GXn4RlTws1zMJYB06SgHBpYlvYbCOIZfxA6R0BWZX3L/kmElSKKlFpi46c1ild+qzjcozsaUh9ALDBGQbVp1ijnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jG/kxUiu; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jG/kxUiu"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb65437so954105a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 11:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668640; x=1790273440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uVaG3wnObeyDihPCO3OxQZpu9/0jLGD4D30QeEXjgQ=;
        b=jG/kxUiu+kHH6JE7fKoVZ3z5nMU25LtYr2UT8z/0MqyoUxe3ysrvJHB9A4kcSsZoVA
         t0PereHMYkHlsMz6ZYQzZ9RoJJBgJboVH28zixyfl8PlxBKm2v6t8nqMemxUtx1q8LpQ
         bxSPc4N2AHGUOHlFU9kr/jcGRQWn5FcGU0jTrAOOMyyjQpOnDXiOCfno0vqyPUkXMSjz
         NpuWxoZEpZiinS384SG1nhhuQduDttRRjcCEW/TSNVSI6aOCRqcVxsjfTMJx/0eTnpbP
         jxeoQrxAGy/FUpUrPy8BtkM4WG2UTu5nxC4k5HNuoqhTPSkrK2XmGZnOBN92V7+IU0lJ
         Felg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668640; x=1790273440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uVaG3wnObeyDihPCO3OxQZpu9/0jLGD4D30QeEXjgQ=;
        b=ANw/b2bCdQgT2nduqeXgBElMAiHR8KD4FePS1TUJ9fHl8KZUawNdjGNbeVpBEFqqUY
         0OHbbgbnkAMewFkObTmk6Rz12XE73AQ8xWMKBSsOGPzEqwVkfYQ01HY6OM8QXz1QeTYr
         HsPbpDvNun1jURXl9SR0c1aXMwS9za4Lcoay+4Kw5il34EPIAlbpBFb4m/xqGNySZTR9
         ELY0epRjTV/SWrxmwH+NoKWzTJxuNFlcPreQ+qM5sLqLGsMNm9UdfBTZeiAIbakkccHc
         bd+2++dOsIynTdy2JPNcRfkOkZ8YTs9/ypxAh0TNrpfoQUCmn0TAqkV1YpW8dRDirZyn
         F8/g==
X-Forwarded-Encrypted: i=1; AKwUvBzT0P9liiwl/gGtE0vsfMPfAdebb1KIyOMP8vzMG4FeAxjVmkUo8lDLCRlkJYRavRW3aWqOomudK3LahZw7Ypg=@vger.kernel.org
X-Gm-Message-State: AFuF++nDnA4bM5g4co/eZe6OuS/ycF5gVRQD4VK6LLD7aTI0KMGpz7vR
	LPJsLsGVsSe2+dGazpyf8PERU9fwnorpkVC6La+VDiIxkKshwiLRxMuG
X-Gm-Gg: AYBFou1DcyLyLbwEXmvjQkkCaKQ5g032OlwgU+hM8gwDVWU5mLITxHDlS4LblJngtJi
	B1xbuUWyw89ds7bZ7wPkXm2/AQyUKzMpFV5QZyGWfmahBHKv0bLHTMq73di9i3eCgFJdp/Gw+om
	HDnXEPuY3yMlq6rsAeEH/BmE5AHihK6Q+AVl/mUxIxZXPBeq133bQluBxYisZ1Z7AbnWImjW0wq
	sKUQmy8h6+Yf6Bx16q3xVWQvPUgBNf3dIab1uMp09lA6sSQhU6BXH6kZVAXGQoPVCvALWg1i36/
	h5xeawe45UHjv2/gDuttJlFWl5N6AQ/UKaGtn/Xrln5+WsY/UHd/mBKhGuXJxlL4iUtR8sXBu14
	vlbqH5SPExnwN2JBZYXJKH+bLNT5yzF60LJyVMpKdOGWtvHQSIpBhTSuzslDSQ6u5hlgdX4ANXT
	RfZ6nD7O+AICpVXjcLPdGZRoeCPcG0sSyEF/hR1QLoRiNb1ZZBE+BvjXzilj1fb3Cb5j3ZSqKPY
	Iq3PQmdlay3
X-Received: by 2002:a17:90b:2ecb:b0:39e:4154:130a with SMTP id 98e67ed59e1d1-39e54d8d5e3mr10862a91.10.1789668639710;
        Thu, 17 Sep 2026 11:10:39 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395cacce6sm15059432c88.1.2026.09.17.11.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:10:39 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: selftests: Drop the unsigned >= 0 assertions in test_write/test_read
Date: Thu, 17 Sep 2026 23:40:28 +0530
Message-ID: <20260917181028.288194-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_write() and test_read() both open with

	TEST_ASSERT(count >= 0, "Unexpected count, count: %li", count);

but @count is a size_t, so the condition is always true and the assertion
can never fire. Building the selftests with -Wextra says so:

  lib/io.c:51:27: warning: comparison of unsigned expression in '>= 0'
                  is always true [-Wtype-limits]
  lib/io.c:128:27: warning: comparison of unsigned expression in '>= 0'
                  is always true [-Wtype-limits]

@count has been a size_t since these helpers were added in commit
6089ae0bd5e1 ("kvm: selftests: add sync_regs_test"), so this has never
guarded anything; nothing regressed and there is no behavioural change.

Note also that the message the assertion would have printed is wrong: %li
takes a long, not a size_t. That has gone unnoticed precisely because the
assertion is unreachable, which is a fair summary of the value it adds.

Delete both. The comment above each one is about a count of zero being
legitimate, which remains true and is worth keeping.

Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 tools/testing/selftests/kvm/lib/io.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/io.c b/tools/testing/selftests/kvm/lib/io.c
index fedb2a741f0b..356586250595 100644
--- a/tools/testing/selftests/kvm/lib/io.c
+++ b/tools/testing/selftests/kvm/lib/io.c
@@ -48,7 +48,6 @@ ssize_t test_write(int fd, const void *buf, size_t count)
 	/* Note: Count of zero is allowed (see "RETURN VALUE" portion of
 	 * write(2) manpage for details.
 	 */
-	TEST_ASSERT(count >= 0, "Unexpected count, count: %li", count);
 
 	do {
 		rc = write(fd, ptr, num_left);
@@ -125,7 +124,6 @@ ssize_t test_read(int fd, void *buf, size_t count)
 	/* Note: Count of zero is allowed (see "If count is zero" portion of
 	 * read(2) manpage for details.
 	 */
-	TEST_ASSERT(count >= 0, "Unexpected count, count: %li", count);
 
 	do {
 		rc = read(fd, ptr, num_left);
-- 
2.54.0


