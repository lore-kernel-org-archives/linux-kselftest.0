Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1230538655B
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 17:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371414; cv=none; b=O1/o5hwd4GoSczB2DnBXI7T7WTbW8CLjq+rldMmaIqPvu1zWT/bnNYNkQg11pMAu53hFQYrIS9q/g9el1cl63G99lKpQkYvJ3S3xtsAVEENHsrQoy3lKQaLEqVcLuWG4GTTjeZpFWgvwSrx6tX8rJr/ylquE4HiHewpQdE9WIjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371414; c=relaxed/simple;
	bh=AOKSnDP9CtAhuZxY1NyLmcZ9XK56/YQAFAYhf3QHJnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xev9oF1VZxIaSNRe7K5jrWXgeZuJwIFEuXIEqqcflZ+cCrcejMSjtKqPLnCmrzwhucT+hRIiFh6lJjkpffTnpu9pvsBlBQtzzkDBdxSo8Wuq5/0HXGkpa21ZMVZJZkyfMpRaDsK1BZA/TcYstzUI9jnbImUEl2TyVlzngXRm84o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0cittjY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0cittjY"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48442ea8f59so97199f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 10:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788371409; x=1788976209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHwrxD7gPXHTQiD45cH94X7t8jEBXhwWQNdUs9NRWSE=;
        b=Q0cittjYqakDW0KRWYruUS1B4E4SY43FvlAGbnP18pFIYpk9Aq5cNTsaupBH+phUD0
         ElBOiDgdhhVZzYwTaWol2zEzWlOr/Ty3lOT1rfnpgjyAL79xKAT3Iu6JLwTNdWu3oFF9
         wbKZaFkaNVq4ulllcifqrxB+9Ud/z0zlBG9juXaP46bOeEBOzYJjGIVjPao+OE5an1+V
         1abx+oR16n/q44UYwNf20AqPHMRobeAu66qmbdQDqiq1joYG25GlqEqu5t1aqWNZFMR5
         CoQHp0Milu/JJxQbmqpWRwfsOwP83MWrcx2n9iElFOk8p1JBA5LJJYkE7nd1vsSuQvpz
         aBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371409; x=1788976209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHwrxD7gPXHTQiD45cH94X7t8jEBXhwWQNdUs9NRWSE=;
        b=ch1TR45RIUhDiVn0aWrkaiC6Ygo+nWJGQ0JxGFgIJdMp5qkQeEvjW0BmeLgzaE27Sj
         OpeyQWgtAU/3mh/QqT7sMw4cNeUYP9RjVgyLz6RnHI64v+mbUu/QLPe4s+iLHO+I7hIs
         BmmvH3hdwaNSqC7pJIpuDxIy5qUAVEOnCgKbpWH5G0fSMHPFPC5z52ZiK0eH/ubsrTEJ
         vJjg8pxv3jJhoNdQyhs62Avcs7wfQjFoEib+4vj6p4JfO4l5GgTC6Hlac3hVGkTU8dWS
         lNCPM4FSCTYZo3Iq4QpXlrrk/6TSaPSUXTmdGPtucFg6L8ksFknAqHuKGUpSJoDvGH0f
         YovA==
X-Forwarded-Encrypted: i=1; AKwUvByXIvGxikIsxUAtEqcgfNbtTQIX/97fjA13yCNu9Z756c5NOkpMqylQck4zyKWsCxJy2Y0Xn0wN7X4PybvYBV4=@vger.kernel.org
X-Gm-Message-State: AFuF++lUcNWZjhInGxndfTh5SQqQAPuTmSbnFZoXq99ftS2kq7Y3kOzr
	l7hH1Vz6jWlTe8PpXzP8JuXCxNHjor3E7iTcIb8QMi/fjr9oNw9GfI+c
X-Gm-Gg: AYBFou18RVi9gW+EXjoerRZIyIi4jwFnKyRFI+4R8rzE8bnITTtIK++VoK7DQSn1K4P
	lmvawt4KNkZnGMb4wAlubxyj7EePcvAz/iuUO+LXZBtopg7thhGZbPG/2Lpg6FlB2mh/IwP25eO
	Y2l7rzxBAf1KhaIawjuwWxfEF7+YE6hkix+fn9m27J5XijAlcdGb1B8OSweMfT2v37kztAIZZt1
	I1ilu/jtNXknBn9EiDHE/ePMhUMt93NQGNpMPmdpeRrUdTVL0q1D3AxYmdRE9Rm6OtjmLNeqv/X
	pzW5yeLKambSM2FdQEOv52grthzhbmOYD1JiV1c0F5K8h4Acz/hmbndDM83OoNlSQyA2YHGzHkt
	hnVL1ZRnFBbgWvkJcWdGWJk+0lYJkM4tFWVw5kb7FN2djM3JFVWN/y0NZGwppCG34H3MjwsJW1h
	zcqI/Y41jZp89m1lankZgTZHZZNrMFKtwfBj6/EqIp5nhGljzkdgopb98bXBFh1qBySd/AsWQ=
X-Received: by 2002:a05:600c:19c8:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49cee5e8fe7mr19299725e9.6.1788371408631;
        Wed, 02 Sep 2026 10:50:08 -0700 (PDT)
Received: from fedora ([93.107.91.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e6115sm7883315e9.14.2026.09.02.10.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:50:08 -0700 (PDT)
From: Paul Dolan <paul.dolan.dev@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/clone3: tighten CLONE_CLEAR_SIGHAND conflict test
Date: Wed,  2 Sep 2026 18:49:39 +0100
Message-ID: <20260902174939.15135-1-paul.dolan.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CLONE_CLEAR_SIGHAND test intends to verify that
CLONE_CLEAR_SIGHAND and CLONE_SIGHAND are mutually exclusive. However,
CLONE_SIGHAND without CLONE_VM is independently invalid, so the test
input has another reason to fail with EINVAL.

Add CLONE_VM so that CLONE_SIGHAND is otherwise valid, and require
clone3() to fail with EINVAL. This ensures the test exercises the
intended flag conflict and does not accept an unrelated failure.

Fixes: de5287235631 ("tests: test CLONE_CLEAR_SIGHAND")
Signed-off-by: Paul Dolan <paul.dolan.dev@gmail.com>
---
 tools/testing/selftests/clone3/clone3_clear_sighand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/clone3/clone3_clear_sighand.c b/tools/testing/selftests/clone3/clone3_clear_sighand.c
index de0c9d62015d..0ad62b80ada2 100644
--- a/tools/testing/selftests/clone3/clone3_clear_sighand.c
+++ b/tools/testing/selftests/clone3/clone3_clear_sighand.c
@@ -50,12 +50,12 @@ static void test_clone3_clear_sighand(void)
 	 * Check that CLONE_CLEAR_SIGHAND and CLONE_SIGHAND are mutually
 	 * exclusive.
 	 */
-	args.flags |= CLONE_CLEAR_SIGHAND | CLONE_SIGHAND;
+	args.flags |= CLONE_VM | CLONE_CLEAR_SIGHAND | CLONE_SIGHAND;
 	args.exit_signal = SIGCHLD;
 	pid = sys_clone3(&args, sizeof(args));
-	if (pid > 0)
+	if (pid != -1 || errno != EINVAL)
 		ksft_exit_fail_msg(
-			"clone3(CLONE_CLEAR_SIGHAND | CLONE_SIGHAND) succeeded\n");
+			"clone3(CLONE_CLEAR_SIGHAND | CLONE_SIGHAND) did not fail with EINVAL\n");
 
 	act.sa_handler = nop_handler;
 	ret = sigemptyset(&act.sa_mask);
-- 
2.55.0

