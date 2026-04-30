Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE235426684
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555708; cv=none; b=WuFfv2tQMhhkRhLQ2LNAtpAisJAyJ4YBjWsFK+J17ymnM+DBi9qMaYAMEaPI2BhXGoOXxwFsaQ3qtQNyEbBDTxUajIWQeFHoCxOmIG8+K4L9R1hrERNehOCgPyAjEM3Z9lrLF7LuyZu+tkYulgEic4OQKaxVrlfdSCbVI01+oGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555708; c=relaxed/simple;
	bh=dMTfBCWjd9C0Mkh/fV3Up94vE9QmfdGahx/8pgg2eUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CFbk4dnqDcs6xctXBcaih5WZHUkZg8Ut59yGS8OIz+3WjnXUEm2gxCTdAWsRYTjRAwM6VhQNpSnpFq0EXphIhXF8PUYGVk8ODC7lD53OZaVdTiME95lF/0h+Z5R6kc9SQG2E9Nyx+cEiNRaVyT4QWxxeiONPPZdvUvTE4pSUrDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMF3hyn2; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMF3hyn2"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7b6ae2ea4a1so8846837b3.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 06:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777555707; x=1778160507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8jma2vIWpRhduHXFrOOjuW5x1NS6leEbUAYpZKRvsM=;
        b=BMF3hyn2+x/5EkKvXMatF5nSQsIuE7w66UuGjuOHEW03q9znO41yZnJD4YBjhKOHiM
         vlC3gYmt6NE4jutmLJ17cjJW0C9eCC6Xv79ELoGK0Uckn/2H0jFa8IkYEPFm9Ut9bbHi
         3j6BeW+H1ZHdXNRaE11Cf5cSEuvozNPFO7jLcfJuL7rgavIbZxN9Ve+1IKhliOGmx6Tn
         m9Huc4SoWff74fHoGtdY9RdKlOizioAP6MGIBWgW1fXScQI0cFwO4fNpkF85KMNa9kLE
         SWlxfEpfxT+LwujMZIRjId+y2R0y57cQ5GrBWxapcrOQZj4GgbiN87trFTZlrPHr7g0q
         lUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555707; x=1778160507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q8jma2vIWpRhduHXFrOOjuW5x1NS6leEbUAYpZKRvsM=;
        b=c1tXNFTThBeV8f+FgTD/eX9Zyq11zOC4d+JkGOP0UyUbwohrSo8TbOlTo+2lHEm3gj
         KoVBlSUH2vus8hcW1HPfRg7PM55Nvi8xusXTQ1Cl/HXbSFh9qKK74gMouyv/2LjFVWYe
         xoA+IeomfyquaJswGthpbWSh6XkHFjCgNcNxJ74IeknXhPCdqZ8bfitHUIFTcvb8mm3n
         xJV4/QdL31U6MMPaX9udxZCwznv6ffzFFhtAi6GCZ6w/c65QIBzXsTeM2GfteCNTNHRi
         eqbFjrxbyivjpAr9ry7fL4Vwhv+WjpkRdD4IGu0locwUbfGaz+hd5QzwCxal0O+LXYUr
         t5IQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NvKqTgW9HHVJDOqy2GWDpJVeIVqUwemfUiDXVfPQso2kRKyQDmRy5wlNNuYdI4WJza/GpYzzq/ptotClFNsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYObL6vuXy5QzYkGBiMehTfPlBpF9pYH9IzKUth+dA1SH7Nlft
	syPRJB6t5BAiU4Fh54n57J/0CcX4VuaCQn2Bs1KHQ+CURbHF/Vg0etLA
X-Gm-Gg: AeBDieum7DfvtZH72Oyi9Y/0YvS1YzmVgFUwrIQ5lXppThnK1KEHpk8WJfbN8tQGY5/
	spy3EcxxtP4ru0JZj/ptqctG4sN4qs5TDMVBtJI6/nK4bQvog6z4rySkjUpX09zTz5vlxH9nDoJ
	MuR2C6j60MvbXoSGjTIkp3ocUDHy4k3INg2oUId5xUcfMS8fBZLY1uqvSGPKlPGSy4ZGS1U0EAk
	4n/kCBzuzkPqHjjDfHxwaflEZiORNsOiG5XPIVTDGFHZ54Scrm8/KBJOTRRFQM8eBLH3MgEusLu
	pkliLLoBynaPNYXkJWtvFDiFDpJT/c5SYMNn8RVkNwZgfTcopYQshrP7knsZfWZDsXuAGDo5sL2
	g+m8rlh8hw50aceb4nB6Zuqgi4itL9Bu8q7lhIg3fdF8c+HuLMLMbfKwRPonn2+GKEfr+0D+kC3
	ZLOzKH+JE2gXkoimrXLcNnZW+0nzHjjG2sUOzMHqyf1Sofd/Tcoe++xWDETafALDJZwV9xJQaQR
	uYR47IqG2ZJHDaDn/RQboo6mRZ2Pc5Nnm/d0w==
X-Received: by 2002:a05:690c:c50d:b0:7b2:2382:e309 with SMTP id 00721157ae682-7bd52963da2mr32039197b3.33.1777555706671;
        Thu, 30 Apr 2026 06:28:26 -0700 (PDT)
Received: from willemb.c.googlers.com.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd54b332fcsm8592957b3.16.2026.04.30.06.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:28:25 -0700 (PDT)
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
Subject: [PATCH net-next v6 1/3] selftests: net: py: support cmd verifying expected failure
Date: Thu, 30 Apr 2026 09:28:04 -0400
Message-ID: <20260430132820.1944517-2-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260430132820.1944517-1-willemdebruijn.kernel@gmail.com>
References: <20260430132820.1944517-1-willemdebruijn.kernel@gmail.com>
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

