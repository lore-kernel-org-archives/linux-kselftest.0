Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45007340A62
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 13:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770731647; cv=none; b=JqIXsZ4koC3crWdC2yf9Xvp0GVJ/6k1x75CttWYVVoTC18HfZ+2C7d07rLto7SkbWtvUHmEzHJtX8xtzRM/FRbWI5fpsdkAnmltKs7icCJa7lCITW2wZ69fiJ1V7/anWxhK1uZa6x0VgoZ3SozQsPLXTtXQM2uFQW72bzpgQgss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770731647; c=relaxed/simple;
	bh=48INu6i1vXT0SP2V6eXa8OheecMZ+eqEsZn99K/dkpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BcELPFawyc6LnS7LUtG9134TqjaEiCT3ro7cPq3EiVXLz+33TIhQQNeNx9xTjflaLos3KlCE2tih8fbau96NUfUomghGgFyiO2qyeGQmaqiHfAZtUQcQPpJPU5HEtRCtfUhMuC2F4o9O5rFc3HONaVLyxoqQCrdRoMcb0oLQV/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQ4Kcvw2; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQ4Kcvw2"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-354c825dc77so596036a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 05:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770731645; x=1771336445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1j/tIh/MZYSfdIpB/1XoIEBSzjfDVOmdxRG8wPNAmbM=;
        b=mQ4Kcvw2nCGc1Pc3rstTvhjKhvskNN7vMBSARxCwN++sAbEWh4isKQQB2z69x+dNpF
         WES5ePLWpxT4WX8Ah+MQns3JW3HhXolSYDbrzJ8laDR5aGzmv1NoOrsS41+1OnvhCQAv
         9NLD2o6g5fSt6H4YCuDI3WG8MZt4zmnHjN9x2eW6P0rcN0R+Y0f9LLj6zLri8cxTM469
         tKgmBbq/aai9hpFNOrgcW9MWn5C0nn06G4ZHmhoT0HLUMSK0jhiHQjus0ngtb+iTSsJB
         hKMaA2KqynVIdGpeS1vIkJvw5DAOadmGk5hxfUokrc1X5PDLDaSv8hC6KatFvfQT5dSJ
         2WTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770731645; x=1771336445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1j/tIh/MZYSfdIpB/1XoIEBSzjfDVOmdxRG8wPNAmbM=;
        b=aiD79drOuhqw23Jhzi30CYdIsQ4Q3FURDE2s5n/PEC69aE2g4MOR/83gwhLADQ97jv
         17dHRu08B9XEv9Qa3kg02B6nMgd/8vwNL6VHZl+i7L+/OvtOMFt0MpohveR706hKBCnE
         SySlNyemvgHtfmY/0SJ78F50N4twJsD73BEnxEKvDeMs4FMa3IIRD2thi2GGwnjXN2Kr
         F8OuwhwWNcuA6vmPmDJGJ7fJBWK6o4UPhS9lyf2qHsUwYDbYAOayZQ/JftYCawAcHx6H
         nEj0eI0RT+zYtzFybP40pUm6DaV+hMoMesoKfTj0jcZPFwwqqriodFmQLqfJrPAD//UW
         mQHA==
X-Gm-Message-State: AOJu0Yyh8mYakJjkEQW8r6WJEN8+3CugKIrZgSo/0eyWK9jKOI1RiC3t
	dSoSOH1mb1S5gwb1+RRfwoNg/7ErO+cZZn/Tb8rUatge24oN50aOjEB8
X-Gm-Gg: AZuq6aKmeGFeiw0XAhK0BCA72D7rREsKwCgMu7iwbf2LfgC5e60deeDYqH+hy6/7nnC
	PgSXkCkPI0VPOO5H/8kEsjeszf2TK/LD6XTxZ/98X/P6Tvy/3/9c3GQVBkJU9IcljDkyNOxza6t
	6fQItjGitJVmREloE5V/tRUpR8uJFXkXQlorjiKT3IUrC9PAUzig1xYgFL+zxyG3mqnWTVinqE9
	FirnIPKMWyOtpXapQt1ocZRCNIE+5w3dFj+xABm2NwMQn983Dbf70olygSCmVEVlKMUo9tvAAYp
	d9J6qGg9EXrn2PihJYe4Bl2lk0d0LEBkck7Q5e/xJhAayZitrbnOr6AGXXTa/I+zA24MFv77hXt
	2bE8c1G1+KelDb+/OFbvci5jfgpgcwzmAy85Bm1Kbary0aMLuC+1xqp7+nTizCUISv4q+NI796P
	onS6SA3wYbBxj+tiVCarxVPryAGfJ9LMfFk99vntUEPDPHMIE012kD+5N5Yg==
X-Received: by 2002:a17:90b:3505:b0:34c:7182:cf9d with SMTP id 98e67ed59e1d1-354b3e4b3edmr9029077a91.25.1770731645447;
        Tue, 10 Feb 2026 05:54:05 -0800 (PST)
Received: from neogulmanpassingby.local.lan ([219.248.48.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e50d3dsm2799763a91.2.2026.02.10.05.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 05:54:04 -0800 (PST)
From: UYeol Jo <jouyeol8739@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	richard.weiyang@gmail.com,
	akpm@linux-foundation.org,
	sef1548@gmail.com,
	UYeol Jo <jouyeol8739@gmail.com>
Subject: [PATCH v2] selftests/ipc: skip msgque test when MSG_COPY is unsupported
Date: Tue, 10 Feb 2026 22:53:59 +0900
Message-ID: <20260210135359.178636-1-jouyeol8739@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msgque kselftest uses msgrcv(..., MSG_COPY) to copy messages. When the
kernel is built without CONFIG_CHECKPOINT_RESTORE, prepare_copy() is
stubbed out and msgrcv() returns -ENOSYS. The test currently reports this
as a failure even though it is simply a missing feature/configuration.

Skip the test when msgrcv() fails with ENOSYS.

Signed-off-by: UYeol Jo <jouyeol8739@gmail.com>
---
v2:
 - Clarify in commit message why MSG_COPY returns -ENOSYS without
   CONFIG_CHECKPOINT_RESTORE (prepare_copy() stub).

 tools/testing/selftests/ipc/msgque.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/ipc/msgque.c b/tools/testing/selftests/ipc/msgque.c
index e107379d185c..82f73cdae120 100644
--- a/tools/testing/selftests/ipc/msgque.c
+++ b/tools/testing/selftests/ipc/msgque.c
@@ -161,6 +161,9 @@ int dump_queue(struct msgque_data *msgque)
 		ret = msgrcv(msgque->msq_id, &msgque->messages[i].mtype,
 				MAX_MSG_SIZE, i, IPC_NOWAIT | MSG_COPY);
 		if (ret < 0) {
+			if (errno == ENOSYS)
+				ksft_exit_skip("MSG_COPY not supported\n");
+
 			ksft_test_result_fail("Failed to copy IPC message: %m (%d)\n", errno);
 			return -errno;
 		}
-- 
2.43.0

