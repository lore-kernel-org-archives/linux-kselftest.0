Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8602C38E126
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469613; cv=none; b=U2LgsbVHxGaB80c5MLnvhqvvHe1wLEHs4r6yBccG2yupAsaHkqVUcypnZSbzL4LWJI5PapacR/8kDMG3Ev2SruZJzvWcxFZx+8nEF76rUdKUCBdg1ImJia+AmokWQtS6qqK2IxVFHioKFoj+zqRvvct4dlvv4aQBS6ulm6KUJ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469613; c=relaxed/simple;
	bh=Sq83sWgPxq753TMVkvw11SCU7d6BvqA9WAomtxNAP2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RxLP37YwgZIbk4zN3qHr364fZjlcrZh8yCBQB08KVwkyfsQZgB0HtAmw50WSCJXD2CSt8RdW5t6DBrmcIgFZdUmgsCrLQE43UGxsY3Cej/kBtuLcnpJ5bAv6bLTYOIVY9La0Pyc8NtK8KRFpcTWyARyvney5DFsD12EtELYAAc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYiraxQo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYiraxQo"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so22982165e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469610; x=1792074410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LM/aN7BQpimjltFN28wgfCpiPJLZsjHzgp0MSN+55g8=;
        b=OYiraxQokE341DYT5OUoGA03NSNylmPaHiGqEjPakYw+obWVKt+ffPiWwctFH0nW0J
         Zm2gJkoXjWaGmK8OIwS6b8Ilh2yh53KF/ZQsbrq7Lsjf6qxi1ozsBnsY6deDmqhKDOZ8
         /g851856LWbO60g4khd4AjTJhcd7z+xUlkNAbAh/ywla3hSOBCa8/+NVf4FCSh8ouB7w
         zHW4gQD/Kwzc5/y/LDVFRvMmJbXCUNWx3WWXQbAzlsM3bWyxJ/bvl5dr5XL9NNR5GKIa
         Z7p4bwt/l6xyK9cT2xv/gFpXqUT8tU/9wBohMKhheBQUREnh1LK+FZfBM4YbISqQ3Ov4
         zggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469610; x=1792074410;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LM/aN7BQpimjltFN28wgfCpiPJLZsjHzgp0MSN+55g8=;
        b=dSLO8Zt9Rru3ftHwVkwxjL2rcdUjzqfXGJoUFsIfhYsEmZ15ccKr1UOMq5ILbboBYo
         Ea0UWgQOnjYSBtI44npGzs9d6qnsvXX/HjQ7J0PnBfZ8yETuSD0p79BJ1hBkNagwdFC/
         aYfd7iB6zonD+nXid310VDMi5E/kpIIkm1qTyX4hr2q0cc8323lVegrMSFsWME88nk8l
         W+6O3A28PJ8LqCRf9oxyBb5iVbq6qElUpYC2d/JUhi4+dFbPZ7QfmyiviSioW1fFJvku
         1GNTvkSP4alAc7PJXBuxW8ZiwE3HNM0YC2oJL5fvkZgALCV+yP7qnIhiH5EOeQ/ixiBa
         nBTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRBlAKoPwD8EH8XSo57lzZAoqD6IRXvw2ZYKqT7ieIo7UyoFGGGvghrmKBL2K3wlM0QNcfUhO7izxl7KTfhmo=@vger.kernel.org
X-Gm-Message-State: AFuF++nvTeA3HNmRekIqhHQz5i3H8Ot3e/HlYWRuA7EDQKYPY9VyP2wC
	LnLPgnK5B9b31APxk0wUgOE/bW9LLXaLjMJ/tCAJwUp6jECt+BWRZDET
X-Gm-Gg: AYBFou0UZWroYpBFzp46MN2zRYYNeFL7mo3Rh6yu7Cq66+WewIHd3idbqDrJhAb2Nq7
	n6+sezzrV/ZnI+qflNASTQOES6I5Ztvbe6oOpun7J91ARbkf2sM6hcCZIdVXs8iD7Oyl4PwPWud
	FN7sqlv4hxGC5+5FgCnFwMdT6xXUYyY7OHn6o3DlxaLrffl6hb4VMjIvEArw6IpkU2hMhMD4VE6
	ooQucBdqXPD9uOBFQ35E4siTVPXo3nQMX+TU3AceS/GTwvEBlghcGr0UXSHGsEkSsLAg/YBgTnd
	BkjM4mYnVGXWunysruYZnCX1ckxwwrVmZ2ma9Fo5z/gN+F5xOozDOyM/jFnuxwurMKIe0dvB6Ay
	6B+Twj9CBC6+3HP/dMOpzcJ9bVIJZkZxyrB5/oll8m7NrgJbA59jTSlwkvOZVaeqLRgeUB0yNnV
	P4cBnpcDCHAMRaAx9jahzb4QFs+NO3J3jjeWG06INaABoGJljWgcVDReE6CbFz7r0PH6gehAFDD
	ooLASDfF95SiZhpwnVQvaU=
X-Received: by 2002:a05:600c:8208:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4a1800d3dcfmr104088285e9.4.1791469609477;
        Thu, 08 Oct 2026 07:26:49 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842a16b2sm82106035e9.3.2026.10.08.07.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:26:48 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/27] selftests/landlock: Propagate EXPECT failures from forked children
Date: Thu,  8 Oct 2026 16:25:31 +0200
Message-ID: <20261008142604.39107-4-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A failed ASSERT in a forked child calls abort(), so the parent sees
the child die from a signal and the test fails.  A failed EXPECT only
sets _metadata->exit_code, and a child that exits with a fixed status
of 0 hides that failure from the parent.  The child in
trace_fown.deny_scope_fown has this problem.

Exit with _metadata->exit_code in that child.  Do the same in the
audit.log_subdomains_off_fork children.  They only use ASSERT for now,
but this keeps them correct when a check becomes an EXPECT.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit_test.c         | 4 ++--
 tools/testing/selftests/landlock/scoped_signal_test.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/landlock/audit_test.c b/tools/testing/selftests/landlock/audit_test.c
index 4bea8c880a4d..502a0825d877 100644
--- a/tools/testing/selftests/landlock/audit_test.c
+++ b/tools/testing/selftests/landlock/audit_test.c
@@ -314,7 +314,7 @@ TEST_F(audit, log_subdomains_off_fork)
 		ASSERT_EQ(0, landlock_restrict_self(ruleset_fd, 0));
 		ASSERT_EQ(-1, kill(getppid(), 0));
 		ASSERT_EQ(EPERM, errno);
-		_exit(0);
+		_exit(_metadata->exit_code);
 		return;
 	}
 
@@ -347,7 +347,7 @@ TEST_F(audit, log_subdomains_off_fork)
 		ASSERT_EQ(0, landlock_restrict_self(ruleset_fd, 0));
 		ASSERT_EQ(-1, kill(getppid(), 0));
 		ASSERT_EQ(EPERM, errno);
-		_exit(0);
+		_exit(_metadata->exit_code);
 		return;
 	}
 
diff --git a/tools/testing/selftests/landlock/scoped_signal_test.c b/tools/testing/selftests/landlock/scoped_signal_test.c
index 259cdcc8aa5c..47307dd2e242 100644
--- a/tools/testing/selftests/landlock/scoped_signal_test.c
+++ b/tools/testing/selftests/landlock/scoped_signal_test.c
@@ -1090,7 +1090,7 @@ TEST_F(trace_fown, deny_scope_fown)
 		ASSERT_EQ(1, write(pipe_child[1], ".", 1));
 		EXPECT_EQ(0, close(pipe_child[1]));
 
-		_exit(0);
+		_exit(_metadata->exit_code);
 		return;
 	}
 	EXPECT_EQ(0, close(pipe_parent[0]));
-- 
2.56.0

