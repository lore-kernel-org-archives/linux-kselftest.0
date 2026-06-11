Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D674A37C929
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 14:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781188558; cv=none; b=lNpu02JmR+HwUZOaSKB48Ic4japVzUrKU6ccbwKQrNhk148DMqScYEbWo0ltXNEePB695jrgZtKkTj+FN26aKSFFnSJjoiVpI0Fd2VvZC3htAehDdr4OiN/GK5ympPefzwGCuBTm5hgvmb3Y62+FEtNdHtR/jzUiiCsBLk24EeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781188558; c=relaxed/simple;
	bh=cc7gvvDiT72c4xsLt1IQkOJp4dHWqVA6t1zu4fXAsD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kPv4FxD6D22eDDfNSigvmcDJ2eDp9Gc88nK5A/yZiYtyNEeqkXKeqRCk4pvlEadTw0BeZUlgO8BHmeLIAytz+9V/6OtEQHCQoGY3DHGEhhjXzVcROILeHWmmSUnnnV2up4AzVgVPz3wrM7/7jX9I3IB6NcFBsKnGp1wLBQgzGKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmhaU33Z; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmhaU33Z"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-915e1354934so426362885a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 07:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781188552; x=1781793352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3H7ndcSaurKamHbk7vIJ+MAZhqUqvKgQHQrwkaKrcPQ=;
        b=QmhaU33Z/LCxlYNIIeVM8tkb2wtdViq8bJjZBB0seSF9ss2xskAZAh+utjnRvxPyf/
         KCz5DIi8jfSA6nulymBHDE445XNwZ26xnrOeLSY5vmW45htxxtXqN3xvvi1UwxBSenyz
         iHjnHEOdyiQlpXg54OHTKXYGH3AAvf27Gk3QmwERwr/UENB9kZgzhPLBc3EVxKL/O0R+
         B1sFiZORR01G9Ipv73A1TmEIwM0KqVcE/ubEB/puyFMHB5+vOFlhfQ9dHFuyaNRMMzTX
         hjMcAokh9fRpqZbtqxbZp1EUPfFFEnQcQbubgxZLbVPMDLQ9rvKZ2FTqBHw9zgwy5pcT
         zg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781188552; x=1781793352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3H7ndcSaurKamHbk7vIJ+MAZhqUqvKgQHQrwkaKrcPQ=;
        b=Nv5chEdGPSk1BaNbcA24DVyaSJsKzsUiwOeDiA5EErKcQANBleUL9h+EL7tiBUph2Y
         HyQoNG6YkEwtNK4/BL/f+gE+Hc+TJXC8a6p4zD0+b9naFgzoKoAgPlwiyry7qdlWOBuR
         3bst81LuxM7xEWS1H72fs1tSPKFbHnStBBLS2sfP2zawY23vVb8XKHhVrv7Q5QJnTJfl
         go1ZAopvUOpw7BuZEwEU6fIfDbRy0R9+xrJaYXvJneRYkwEOgmFti8J1QEdY++ayj7Pe
         mi3y2emkjB90PALg+iPYl5KLCuxQwDf8nvoPUBjhHc+Yp7RzOMjOj3+K0RHhWUgKHn35
         l9rA==
X-Forwarded-Encrypted: i=1; AFNElJ+kk2WFVQiBA7dGxk184MKX6kcszPBTHXgKh2dQHbLclVN8mJq+j5Qv+V/Li++pcvrcP5U9jIRF3zdkSXrbElY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5dxbkAtvAPMlfPD2kXCVX0i748flS14N3PMVEPqzNi6jPJAW0
	0MHyrW1jNryN8T3GdCWWtlgHaAcgY8UPQ6m9JAVDzTE+7ekCnBfogP4Y
X-Gm-Gg: Acq92OHUIGJS4Z/KY2Adn1lMNtz+nYuisw7vPpXRs9jqDvMut6ehg0zFM6+60GRjp1c
	aYBTypSdG648SJckA9F8CyAUKfZdz5bVObSY2mv1HzgSIa4HbTXj6vL2DbKX+i8k4+gExk2MNe5
	7m6yOLcMcr9+7jdDKe93jXmJYh+aXN+G9k4T3j0u4EE0oLX4UewFRj32hPxmGWD+J6i70hWhz95
	tCAN75/C7tUu+lFCkhiQOnRe0Sv+0scOziyxr9CoKCZJtb3bgV/NvVPgWkEEhgfAv12LEWJYv3+
	zkL6L2sit3hC3J+d8Ejg/dEw1tDl2wR2O5KW5oZykKO1NKWOeQ9XqyfNrgJSYKt4dRU3yLibZZ4
	N/45sYea/vEoCtBzAL3GnPNPmNSwgXkM7sl2XZYf+wwW08le6FvgzJfoE1WYQsfiyrsZjE6qjUd
	osUwJoVLenllSS/aHNUmKuAsVHFpLm8ms3eaf2Zc+H8ntxiSLFfg/N6+9SasSZzmJoH/HhoIYNZ
	k3yZNSGLCgR2Nhl+6my8V0crlyAqJTdn8z3
X-Received: by 2002:a05:620a:2886:b0:915:e12d:19d9 with SMTP id af79cd13be357-9160ad1d123mr474859185a.43.1781188552353;
        Thu, 11 Jun 2026 07:35:52 -0700 (PDT)
Received: from battery.lan (pool-138-88-31-60.washdc.fios.verizon.net. [138.88.31.60])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9160b02f86esm196416485a.35.2026.06.11.07.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:35:51 -0700 (PDT)
From: David Windsor <dwindsor@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	shuah@kernel.org
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Windsor <dwindsor@gmail.com>
Subject: [PATCH] selftests/bpf: Add test for sleepable lsm_cgroup rejection
Date: Thu, 11 Jun 2026 10:35:49 -0400
Message-ID: <20260611143549.703914-1-dwindsor@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Confirm the verifier rejects loading a sleepable BPF_LSM_CGROUP program,
as introduced in commit 5b038319be44 ("bpf: Reject sleepable
BPF_LSM_CGROUP programs at load time").

Signed-off-by: David Windsor <dwindsor@gmail.com>
---
 tools/testing/selftests/bpf/progs/verifier_lsm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_lsm.c b/tools/testing/selftests/bpf/progs/verifier_lsm.c
index 38e8e9176862..2f8103bfa14e 100644
--- a/tools/testing/selftests/bpf/progs/verifier_lsm.c
+++ b/tools/testing/selftests/bpf/progs/verifier_lsm.c
@@ -188,4 +188,13 @@ int BPF_PROG(null_check, struct file *file)
 	return 0;
 }
 
+SEC("lsm_cgroup/file_open")
+__description("sleepable lsm_cgroup program is rejected")
+__failure __msg("Program of this type cannot be sleepable")
+__flag(BPF_F_SLEEPABLE)
+int BPF_PROG(sleepable_lsm_cgroup)
+{
+	return 0;
+}
+
 char _license[] SEC("license") = "GPL";

base-commit: 30dee2c176e7954f63d1fa3e52d172f30beb9bfb
-- 
2.53.0

