Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E21483803
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 16:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787156275; cv=none; b=h3GPB4CftbJoHITCbysnXaE67jEWH75bXC6lF5zp1wFaR+EBOBAOvwGf6a6ZGcNIjXDlJ8RZCFqUgvX6b9X9DWXs0WJS0u+dK9JmM0x0y5LLaRtPGNq5OrZTwiHmLrtzpfcTeYKAQ3YQ1+8kmiRNM0SiMxHnCL8HkSrnL4OmPac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787156275; c=relaxed/simple;
	bh=OZf549FkxxPX+i+QG2ASg8HqZabXQmWI4HZ/faJlp4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ec41tf0Zyw5JGiODJ2MJfw2me7JmchVndYRDESh3OiV9zu1PQuIuDMkRAWaajfSMuPkoq2oSybhOky+YzYf3hhweinnl82wgh9qN4ewTIEM0h2akvJ4LU4zseq3lMkwvCwCFV++8lqxc5xqugtM5ira5Oq2TnMc1PQilhx2wA0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgOnAlvp; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgOnAlvp"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d5cad1a6baso10439595ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 09:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787156273; x=1787761073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mj4zN9ORZ2PeadgzkcCELtPYWY9u+BqffVguOSrtUbc=;
        b=qgOnAlvpv3cRJULLhFqVVb9ij8o5yVp2wk/hcdUG7fdfkDJAhKhisI7tjMMLC1BgrX
         KINow4OEv3eboblaEg2h8cAidnippWeb/t2eKns+XQqezyFOdntxzChmaNyKv377YOjs
         qgCuLpcSL4bQSYqwxCtW2oPkMXsZo9flDcpf0Wfj9Z6CWbt2R8tY+vovkKMZnddamoFq
         KNtKB+s9EhBa92h1djVh48HGSAyoQXpdG18FctWA+yBptAMt8FU1b/LLBNDoB9DadwlW
         6rET2Js8i/BkkqDBYHC8vWi9Fkh1vQE9msqv4wsxCSn5xCBln/7TpGI23KCvPBLDSKe3
         tfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787156273; x=1787761073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mj4zN9ORZ2PeadgzkcCELtPYWY9u+BqffVguOSrtUbc=;
        b=m2aJNfzS4+kTKcbbO6bZ1pZhAI6Mg6Qf80vQJhZE7sZVITqXQh255chXLnjYb7vUHm
         jzzU+QaGljN1xdiecsBYL4ti+C8lUfcbJjFNrADCkAwPMbzF4SAP07gyFlnYbHXE9ewm
         QbBX6tmuVjXoJWwFzER0+zWHxH34vOySQzoYpMpHXOhIVGe1w4wIthVLnVVD4CkJzlrv
         WXML30wkz098lQ1ctHRBfZEoc4T935kURhSwH/tffH3RBm73vBU+Ly9zcSN0zYvyS2VI
         j9hEu23GA6aHpGRVO3Xa29nIAC+qNjR+6diUbqiIyqn5BuWzI6OFuQOHGKoRG+Iazo/W
         isZg==
X-Forwarded-Encrypted: i=1; AHgh+RrI4jzbxlXCtmn6/vg315vjdMnP5X8Ede5DuRWtZj5P6BOKBOdelCNV3zVGyPRcfsQTH4JqvCvJKmrqgIAtL7M=@vger.kernel.org
X-Gm-Message-State: AFuF++lJaYdoxFZbJtBUIiWhsUkzo5lU36TGUslDLVYr+Q/OcIXpfSnt
	ncVTqFEVpS37NnNJdE/OwHcyiy6tNzA2hDJFBDbw2wI7qHFT2poON2447cDZNKGD
X-Gm-Gg: AR+sD13CuZS+iWbhF4GeJO/tKj75vEJmKBwmHQawT66IH0mdPUv+pruPENandOdaCIp
	pXPj760niSeJkBc6hlZ4rySJo+JBDfKDAOckZelSHe6fAmifnn34Sw73BxNt4eSNvF5f51rRBVj
	/nQMeCeX3E52K6jYDFp6QCpjNPDwrCCU83tAgMTwVQVLXa7ia5Lm+oYYuW8VZcENSs0Pn3wKUSP
	3Co1Ym1/4ZIxFFHJXdwc0XyplJ4Bm2KeRSJYW3zRtnLxnuVd91cZqn+vrRT3FMJZCJ1ekcuLmhS
	OFnsa82Spiqxa8U4ZLqgxGe0vAQrZ77malSCeO/058kNv1SssEyWyl7/MVwILxbpgKbUAnDq/XX
	VtUyzx2Dc4sHQL9VZbR/9JHN9/6XbW16XZqDFC+hA4qp+DkE7gS+ip7ewzVqNDQowfEfX3WJFqQ
	TfGrk8jPQ8Wox981H8qSneUlkLCoS+F0gFnE+BTMuDHoJJ2pzE2n3U72aeNrCBZFbeGSsIBjrgP
	8V0mjTq0hE=
X-Received: by 2002:a17:902:c948:b0:2cc:9179:335 with SMTP id d9443c01a7336-2d60198022dmr94325525ad.8.1787156272868;
        Wed, 19 Aug 2026 09:17:52 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm15794202eec.8.2026.08.19.09.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 09:17:52 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: brauner@kernel.org,
	shuah@kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH] selftests/filesystems: Add .gitignore for fscontext_ns_test
Date: Wed, 19 Aug 2026 16:17:38 +0000
Message-ID: <20260819161738.3517-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fscontext_ns_test is listed in TEST_GEN_PROGS and is built in the
fscontext_ns directory, but the directory has no .gitignore. The binary
is thus left untracked by git after being compiled.

git status lists:

  Untracked files:
    (use "git add <file>..." to include in what will be committed)
	  tools/testing/selftests/filesystems/fscontext_ns/fscontext_ns_test

Every test directory must include a .gitignore which contains all the
generated objects, as per the documentation and convention.

Add .gitignore to ignore fscontext_ns_test.

Fixes: d64ba78b749a ("selftests/filesystems: test completing a context from another user namespace")
Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 tools/testing/selftests/filesystems/fscontext_ns/.gitignore | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 tools/testing/selftests/filesystems/fscontext_ns/.gitignore

diff --git a/tools/testing/selftests/filesystems/fscontext_ns/.gitignore b/tools/testing/selftests/filesystems/fscontext_ns/.gitignore
new file mode 100644
index 000000000000..a632905257a3
--- /dev/null
+++ b/tools/testing/selftests/filesystems/fscontext_ns/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+fscontext_ns_test

base-commit: 0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
-- 
2.54.0

