Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B216727CCF0
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572565; cv=none; b=eW+Xq1SbTtsXSUlSsVVF1iQZo5HfjyMkOdGV1tWjpN1ytCwGL6ekogGj8iondFwAGp6wXcaE0tXyz3HUAovwFS76+3v9mMATek0N20FRIzGuTNdf6uP+ObLRD+sdmT3Nz+m7R/qBwN3iYRq1IubU9v2SktSM6519KRruIoHemz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572565; c=relaxed/simple;
	bh=LfUiEUPfBZYN6FkeSaEgUWNG2ClgHgkt1O09UueoM8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G07ySpZ3IXagAujlhHAASDXY2rQ6yQVcecciQOaYto74dH72n2sDKE4ytXw/U6q4jwt/z7lDzG4QZdSv2AxlHLh7ABMeBztIh3f7QolEK7iRGvAhJx8g+wS0PAys7bBzP5EvEwaBNlRoP0eL8huVzGVD3uQRdheOGaduLjlZf5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YR80o3pO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YR80o3pO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso22049045e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775572562; x=1776177362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrFTuUdVbL8YUjWZ5ZEUaPVucQjwMCOkmEq7Dkm7NoA=;
        b=YR80o3pOKwErUU/XBxxnKef1XRpm3UeF7xSeoCjXYW1dWFbE5Z/KDxXPUSY4d0kfis
         b+mCFGrKjZu/8qeS6CPdDAykysXrZEENY1Suj0AVQq1jdHzwhf7lBeTRdjnAwMnzLLMD
         /03fvbDkNnyBOESmZsVRfTyJZpqWR20AIf9odRUwj4sN3/VkfAV350NTXTUFkUFRm3fe
         Bu6EON1PpF2+sgMkjp18bkrxfO2BO3anFVL3anZHQprJYUbhhFXv2xnk48A/UVDYsORI
         Gd+NuQQ/TxNxHGx0IZ6ns85AChdgeOx8UB1+9BmBWrkFLvxdi6skl6bjrhkc5v7yqWwT
         rGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775572562; x=1776177362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TrFTuUdVbL8YUjWZ5ZEUaPVucQjwMCOkmEq7Dkm7NoA=;
        b=WopPkViH3bhYI+cJqvx6cGy3Q8C0iohDoXQvhGNVv8gB1fct1kq0zgWIetE9dHm6Ld
         4tOHN0GmSoMaDSmda1XmDL4s/d2PLv8OkU2DRt6HrxlAs52YlqYEbcLjGRiIK/TRWqD7
         8oidiic2Ml3xZvc1wzOntYaCKdJI/+uOMaY4BTP6My5DIJb36JTamsF11iHV3WRPbeUx
         ovNdCJgoldr0eBedfqupMkJZwXZJvh7pJ+Mlqe60gM6KP1JeIqQiE27xj/zmLUJps8dV
         RH1C8atjscdWie5htvwgvulskxEYLu9yyMtem7obfe3pp1TQ/DlDPJNtI/T/lksCF2z+
         1yqQ==
X-Gm-Message-State: AOJu0YyFSUKhf4l1LW93fsm8vbaKhoAubLHVxZYHxX8y1FtezvNvSucc
	0QDkSpPmor7TTHSpSquTTQe2BgjOxHsXN0MASgKeg+U9Je9i23/0C3277tJONih/7Hsf0GaWNfI
	PC/7PZeY=
X-Gm-Gg: AeBDievaL1WWyOnN/48E3ckMCPSF3VN4JXHAN/o61EfrrLPtc2qrgH4l7RG6WoNY69a
	iT6DuAn3wGQUI1QtYOAbN86OeRXVKedafKiXkFTLWXNGwHb0XCROomg9xeywROR+nWDMmxXRd8p
	gVSge/zMJzqaOlgzoLxtoHXfibNWhTxjGHoACjPIkhDpkUtNhSUNU1UEQZbrpCZw2e01i9f9EPm
	zawE2YxjFNAvDm0rpXiMh2s2SYDHbKevmLJum4tKcLIHwrO46ib7Vb++tjxb0KpjwpSrVNSFWKG
	dSgdJX6CNUxeIhY6e69f7EDWEcIkOnAjakraMT3ApLFBlIqetdxXJw7cy2ByFmkYDV9roSbg4S8
	wHs+kjiuqbhqOd1QyAw0zFisfgtZd7xbpwH97mc2XabOfDO42didM3mNgepKohCyh7ie0XHuhHj
	SyMXqhnKOSW3sx
X-Received: by 2002:a7b:c386:0:b0:488:a9c3:44a3 with SMTP id 5b1f17b1804b1-488a9c34679mr107798445e9.2.1775572562170;
        Tue, 07 Apr 2026 07:36:02 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cf1af62347sm9214409eec.22.2026.04.07.07.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:36:00 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 07 Apr 2026 11:35:47 -0300
Subject: [PATCH 3/3] selftests/namespaces: Skip efault tests when listns()
 is not available
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-selftests-namespaces_fixes-v1-3-59109909d88b@suse.com>
References: <20260407-selftests-namespaces_fixes-v1-0-59109909d88b@suse.com>
In-Reply-To: <20260407-selftests-namespaces_fixes-v1-0-59109909d88b@suse.com>
To: Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775572546; l=2530;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=LfUiEUPfBZYN6FkeSaEgUWNG2ClgHgkt1O09UueoM8Y=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCnn91ibS0jvgFf4QOePzCOblr0iqaJTaATUbCO8O0ujcw7hMQdYw6TzH3Upty3WM6TtFc0dSGs
 QTjEaFoGGOQk=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When listns() is not implemented the iterator child detects ENOSYS and
exits cleanly with status PIDFD_SKIP before the parent has a chance to
signal it.  The parent sends SIGKILL (which is a harmless no-op at that
point) and then calls waitpid(), obtaining a normal-exit status.  The
subsequent ASSERT_TRUE(WIFSIGNALED(status)) therefore fails, causing the
three EFAULT-focused tests to report FAIL rather than SKIP on kernels that
do not yet carry listns() support.

After collecting the iterator's exit status, check whether it exited with
PIDFD_SKIP and issue a SKIP verdict in that case, consistent with the
behaviour of every other listns test that already handles ENOSYS correctly.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 .../testing/selftests/namespaces/listns_efault_test.c  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/testing/selftests/namespaces/listns_efault_test.c b/tools/testing/selftests/namespaces/listns_efault_test.c
index ac3b208264f5..c20c6a812217 100644
--- a/tools/testing/selftests/namespaces/listns_efault_test.c
+++ b/tools/testing/selftests/namespaces/listns_efault_test.c
@@ -177,6 +177,12 @@ TEST(listns_partial_fault_with_ns_cleanup)
 	ASSERT_EQ(ret, iter_pid);
 	close(iter_pidfd);
 
+	/* If listns() is not supported the iterator exits cleanly via ENOSYS */
+	if (WIFEXITED(status) && WEXITSTATUS(status) == PIDFD_SKIP) {
+		munmap(map, page_size);
+		SKIP(return, "listns() not supported");
+	}
+
 	/* Should have been killed */
 	ASSERT_TRUE(WIFSIGNALED(status));
 	ASSERT_EQ(WTERMSIG(status), SIGKILL);
@@ -387,6 +393,12 @@ TEST(listns_late_fault_with_ns_cleanup)
 	ASSERT_EQ(ret, iter_pid);
 	close(iter_pidfd);
 
+	/* If listns() is not supported the iterator exits cleanly via ENOSYS */
+	if (WIFEXITED(status) && WEXITSTATUS(status) == PIDFD_SKIP) {
+		munmap(map, page_size);
+		SKIP(return, "listns() not supported");
+	}
+
 	/* Should have been killed */
 	ASSERT_TRUE(WIFSIGNALED(status));
 	ASSERT_EQ(WTERMSIG(status), SIGKILL);
@@ -523,6 +535,12 @@ TEST(listns_mnt_ns_cleanup_on_fault)
 	ASSERT_EQ(ret, iter_pid);
 	close(iter_pidfd);
 
+	/* If listns() is not supported the iterator exits cleanly via ENOSYS */
+	if (WIFEXITED(status) && WEXITSTATUS(status) == PIDFD_SKIP) {
+		munmap(map, page_size);
+		SKIP(return, "listns() not supported");
+	}
+
 	/* Should have been killed */
 	ASSERT_TRUE(WIFSIGNALED(status));
 	ASSERT_EQ(WTERMSIG(status), SIGKILL);

-- 
2.53.0

