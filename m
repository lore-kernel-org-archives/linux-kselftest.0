Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D52E3148A8
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 01:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772761880; cv=none; b=ikNR7rd4k6PHRWukByuf18Dpn4NuifJuWhDPkV583MXuxReXt5b5m4uqRenEHw2ZEBJcyOAxgR6+fzn0OJYUIgIK0cQaAzjsoNROD+hpKc0jPQ31HvCmLizz+xdv5mepjkmZJYoIWduZqroPaabH0maoMnqWgWFmqb+TYH9EFdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772761880; c=relaxed/simple;
	bh=tcNTyav7JClu5Wv8r77uDiVJ0pTc0RxQAj+RlqLjX8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/Eiripw6dZp7JyvQ5GwPInBB3oc9XjdKBn6NMCXevJnYGRQZ1omKZKjJfiwBDU1zBbL87SaNL6dS1ASl4YVDcptQUP6ecjbpbZ4MFWM94IcQNEdcOUazOT5SAP4zGplCEfksEWd+zvbsO6zEVHYuRwjudx7aSKA0G/GLkRSSa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPThMdEy; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPThMdEy"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-662f9aeb782so6602616eaf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 17:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772761874; x=1773366674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rjic6E4sYgoKxkNkNG8eG+bbyrYHUHzf7UJjTOVCQkA=;
        b=RPThMdEyfAVBnSwVFJTGy3QLWLwIbDfIo9KfPZGdF1Fxkknr0njOKrbgEV1bu78xsJ
         pih2eVbB7/fGnfraLdFOfyLgeR7hyz5ZJhN0n5t3i0j+P9ZP9K54QB2Gp0o5tFErG4kS
         e4KOpItv0UMMVqqKjxou6TpFvjZl6PFChhIBQAqSfHcQ1Pa8YstxxPnyz2iAQIH89Xkx
         cj4rZ1O1Xp7Tb0Vg5eN8QTdg5uLt59MYhkAHXRwQw58u3QmnH+LaTn/rvZJ0c66f9jiT
         uzHJaIY5aWSU5qCzOlJcrTXBzr93qtfPQqVLI5bNTFBHhZOjQOwgoAb4NpntbdRiASjz
         qxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772761874; x=1773366674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rjic6E4sYgoKxkNkNG8eG+bbyrYHUHzf7UJjTOVCQkA=;
        b=rmGSBR6fX1ypSkcohYggQoTaB0V9KuJdxlp/tgB1C7mRgS/f2GoImFvb0GVm/e1wyL
         RhkVopArm3ropjxq0VZsEByo80OLdcSNp2ujmqdKc3w3kEJZOP79oR9ZoIAonMjoJsHi
         6Oi9wqGSwO9tvWgikZ0zgn2MFogZZBXRc60mDue94jHPKbjYUM6WDrBsqBwj0BtBrzKj
         4CTjvBwEi3gS2QLDUwN2irTpaJhvQ/werx/7QeKsnsxr7gRJY3PqWB9CG7WilCJ9ioVm
         d87R+IFZInHg/pBeUX8h2bjAKs6hkHRsto3Fpc9/fzZ+fmjZufpUZ0hCxweC5b9pT8w7
         i+/A==
X-Forwarded-Encrypted: i=1; AJvYcCXhsA8yrgozPCUDDoATeFCuuD9Ju3cRbTZMMpus33t3pAonBDmcV23SHl0Bwo78m/JOdsDHpppy6StnjIkYr6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQuRYZSknhlQwEmmGBLMaJUO4c/x6LNzVtduE+h2F3Thsi2PjA
	rZrBux1gUvONnvxnIUnno9LREUzplOGgLd5RvJeK1rCE0FICZz9MFSSx
X-Gm-Gg: ATEYQzz4G4F27Ki9r0Yv+zrsfZXeh/acYWpN5NL4lQvZb0e3bLf5DtZSTUw6c26zUSY
	7oyb1l6c/vXS+mxoDjdeTZSsYT0bssfZG25k16AlwbPLtDWucYI7Z6gNVUaZgh0gIbReiJNnTsY
	pcm5y9PPWTGp8LOG8JZeK2qMravVNrDN1rX7e8odRYWpQOj8Sr1/qJRk1Zdtc6HlMOye3ChsDe3
	i9pwBjhGu8K/uNjndS7zDL/ePHh78/KPOhwrq8tXKcfPo6T+Atc93kYdR/F56GQrFyUxDNzKLC4
	4D8H0TT9LURN1JqpMnKB6wnnEbbKXWvanIGw/e4e4NA/sVO5rS3ojSUNPrVqkK6nd6+nyzi6OzT
	RMuCon5r5RSEtEQEjwz+Cqk4Ib2D4kEJ12wnnIv5jPz+ABiN3PeSwCt2PNJndA9MwsNPdfsv4Av
	AC0gefhjMguufnwa8I1anq8kqBTSASnTlZTQMfRGSMipQGkBOe
X-Received: by 2002:a05:6820:3103:b0:663:11b2:d61d with SMTP id 006d021491bc7-67b9bca1e01mr428086eaf.25.1772761874446;
        Thu, 05 Mar 2026 17:51:14 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-67b9cc1a627sm115245eaf.6.2026.03.05.17.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 17:51:13 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH 7/7] dyndbg-test: test keyword !value negation
Date: Thu,  5 Mar 2026 18:50:10 -0700
Message-ID: <20260306015022.1940986-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306015022.1940986-1-jim.cromie@gmail.com>
References: <20260306015022.1940986-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 .../dynamic_debug/dyndbg_selftest.sh          | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 09937dca3056..5c35d7cc5ecf 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -350,12 +350,47 @@ function test_mod_submod {
     ifrmmod test_dynamic_debug
 }
 
+function test_negated_keywords {
+    echo -e "${GREEN}# TEST_NEGATED_KEYWORDS ${NC}"
+
+    # Test 1: Disable negated subset from enabled set
+    # Enables all 6 in init/main.c, then pulses ONLY those that are NOT run_init_process (the 2 blacklist sites) OFF.
+    ddcmd =_
+    ddcmd file init/main.c +p
+    check_match_ct 'init/main.c:.*=p' 6 -r
+    ddcmd file init/main.c func !run_init_process -p
+    # Result: 6 - 2 = 4 sites (run_init_process) remain enabled.
+    check_match_ct 'init/main.c:.*=p' 4 -r
+    check_match_ct 'run_init_process' 4 -r
+
+    # Test 2: Enable negated subset from clean slate
+    # Negation !run_init_process should match the 2 blacklist sites.
+    ddcmd =_
+    ddcmd file init/main.c func !run_init_process +p
+    # Verify exactly 2 sites enabled
+    check_match_ct 'init/main.c:.*=p' 2 -r
+    check_match_ct 'initcall_blacklist[[:space:]]' 1 -r
+    check_match_ct 'initcall_blacklisted[[:space:]]' 1 -r
+
+    # Test 3: Enable negated subset with wildcard
+    # Negation !run_init_* should match the same 2 blacklist sites.
+    ddcmd =_
+    ddcmd file init/main.c func !run_init_* +p
+    # Verify exactly 2 sites enabled
+    check_match_ct 'init/main.c:.*=p' 2 -r
+    check_match_ct 'initcall_blacklist[[:space:]]' 1 -r
+    check_match_ct 'initcall_blacklisted[[:space:]]' 1 -r
+
+    ddcmd =_
+}
+
 tests_list=(
     basic_tests
     # these require test_dynamic_debug*.ko
     comma_terminator_tests
     test_percent_splitting
     test_mod_submod
+    test_negated_keywords
 )
 
 # Run tests
-- 
2.53.0

