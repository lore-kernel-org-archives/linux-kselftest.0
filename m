Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED922C326F
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 20:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321011; cv=none; b=crFNmDdceAaBRc56ElG48lIICghoSJAYXzZ1d9LJgIg+qJmhnnXMeujsMN9Vh1yX0OnWCkst+4bkaUKPiOORN2oXXLpxbzQ8R8xaYk1Xt9ClXOMeQ/eC2+zPrhlQAbTANx/BF2bIGs0VE+/i8mFw0yu+3NHcgp+QQ6NHiyG6VBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321011; c=relaxed/simple;
	bh=dMTfBCWjd9C0Mkh/fV3Up94vE9QmfdGahx/8pgg2eUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOEuckjktaWNfKRAyosWXQWF15jp8fKX0DZr/Jd3grK6lidGehys7YFFEs8B8N33v0W1+U89qQcwIjjmVdAAtyDHWxGdV/yVK4q/eO4rydoKs0cswFmD+iAQ9Wdtuc+7/U1gIi50vEI2jvak1CSaMB2vxSBtHNVNkVkTJ1U4c68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrGj8vOH; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrGj8vOH"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7b6ae2ea4a1so105776107b3.2
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 13:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777321009; x=1777925809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8jma2vIWpRhduHXFrOOjuW5x1NS6leEbUAYpZKRvsM=;
        b=FrGj8vOHfFd8kn9CrQnnl7kHBerwcKdQrOA7zwWKsoUsIZxAwHqL/S57hKJQGBKMt3
         l1LF1akcGEmpBTp4vkqkkJ5yjzbJsOAvmW8NrJq3CSGoHGzWjpibUeupCjWRwnQ5MSO/
         su+mWsIiIn1bMOVuAKvvf2SJ/C5LzSS/SbJXyBqi5Q0qOWegXfiTzWbw+iB3qVRUKXOC
         6ldr1eDX610ShLpc7ShMQBov9SGltyPt5HJg68wn2761VM65UnRz9Mjwp6leEToxX4sr
         son+rOtQpiuPz6P/sC+dVr8x+utQT1r4uN54lphrZvrptRP6roa4lNpzaYdX+l2zz1dV
         Udfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777321009; x=1777925809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q8jma2vIWpRhduHXFrOOjuW5x1NS6leEbUAYpZKRvsM=;
        b=aJWLcXqJRgZ+pTQ+FWvladSTh/keeqIwblYNiFJx5pobNuLrJN6hw5XQsO54Go/0TX
         5ryn20RvQjDT0bx8nrfx55B1ibDM2HVNCan7m1O5T0mP8ORbP6hkppKB5jdopjv2L2Ir
         Xzo0aDWw0KzQjS9pFvopzCmG5gJKpz96LVnPN9y/++IOjF8Wm+3ucCdlKI0Z11g1U3FB
         TklEcMgSnaLCpznOS2fbDxLc2R5ROYzZZhkrLgn37lagFxtTjOMj9dZpsiE4LFV/Hq4O
         2C/xibhbklyb9p4DUyu5mAKXpK2O4fmt0SklaQoBC82hAuOWUn5lp7de40vPYjb7yNyG
         ye9g==
X-Forwarded-Encrypted: i=1; AFNElJ/MqbRzaBzBMNjwD9n2vjdMWgcwtc9IRyK2XiWhQkDDSAYLpiuGI6uShfcgmBqineNmaQkpRi56JIYYDrqGUqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ1zVn+5qhJS6nXtxiw9FbEH2qJ0+qYiABxYDQWTSf8/8uUy95
	QoCP949eis5OXLXO8M+s4TUCVLzPkHgpaDJV3GjE0fLpXs4LQgbpVwLE
X-Gm-Gg: AeBDietzCAzaEb0FKU20bR3/f1fI16kN/n0bU0mubNn0fC1E5upNyes3+Wmv89dE4AO
	4EL933GnicNuhS0DizJlJqrUMgDGrcWfNUiMWhCZ2nQUuX4cYJ4tx8wCZUvET6hb2e1E95dkh/o
	mKarLn2aEagsjlaezJbI0mkZfV6scq54GIs/k/cgLvoI+8gyVJtEL6KbQ1Oe8hug8iy9KzTMdeg
	DDZIUsXaE/Gx1qOeWWeEmYSP+ynPvBHWSXRnnvNo2ilHe+puM5cG/6DQ286FK367+ysEzMDNXGw
	X8Udk5zeA0XikeHQPWhuK5W7vSiRVAv9EKdzqgigA6IisSr/0cy9NDDzo//rKR30FAa8JJscf6Z
	9FcZViqdqg5+o44XGA3hsSYpKSaPAAHpuVRe9+lAF5XGTYqULuZsbT1yX1qFBQdNn/MoXgWG+dp
	IDmwJQYDEEG0KrHelsfORkdGp82uUrp2C0bYycyqz+07ZChP+O+cNWwzX2i+jF0nIqA568VAG5s
	jlJpFXMu0W5y7HzZqLRJ64Pw0X86P6zq9tzog==
X-Received: by 2002:a05:690c:c508:b0:7ba:ef98:9719 with SMTP id 00721157ae682-7bcf5222840mr737527b3.10.1777321008878;
        Mon, 27 Apr 2026 13:16:48 -0700 (PDT)
Received: from willemb.c.googlers.com.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e6149sm1753387b3.11.2026.04.27.13.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:16:48 -0700 (PDT)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v5 1/3] selftests: net: py: support cmd verifying expected failure
Date: Mon, 27 Apr 2026 16:14:33 -0400
Message-ID: <20260427201640.294694-2-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260427201640.294694-1-willemdebruijn.kernel@gmail.com>
References: <20260427201640.294694-1-willemdebruijn.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Willem de Bruijn <willemb@google.com>

Support negative tests, where cmd raises an exception if the command
succeeded.

Existing fail values are

- True:            Pass if returncode == 0, raise Exception otherwise
- False:           Pass unconditionally
- None:            True iff not terminated explicitly

Introduce a variant of True that inverses the condition:

- 'verify_failed': Pass if returncode != 0, raise Exception otherwise

We cannot reuse False for this, because existing tests rely on current
behavior to pass unconditionally.

Only suppress regular test failure. Python subprocess may set a
negative return code on process crash or timeout. Those are not
anticipated failures.

Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 tools/testing/selftests/net/lib/py/utils.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
index 6c44a3d2bbf7..ef31c0ba47fc 100644
--- a/tools/testing/selftests/net/lib/py/utils.py
+++ b/tools/testing/selftests/net/lib/py/utils.py
@@ -111,10 +111,14 @@ class cmd:
 
         stdout, stderr = self._process_terminate(terminate=terminate,
                                                  timeout=timeout)
-        if self.proc.returncode != 0 and fail:
+
+        if (self.proc.returncode != 0 and fail and
+            (self.proc.returncode < 0 or fail != 'verify_failed')):
             if len(stderr) > 0 and stderr[-1] == "\n":
                 stderr = stderr[:-1]
             raise CmdExitFailure("Command failed", self)
+        elif self.proc.returncode == 0 and fail == 'verify_failed':
+            raise CmdExitFailure("Command succeeded while should fail", self)
 
     def __repr__(self):
         def str_fmt(name, s):
-- 
2.54.0.545.g6539524ca2-goog

