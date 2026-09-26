Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537A154706B
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 01:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384908; cv=none; b=t52t+pEQE6PQh+zBCzjGcQpMmZJxvIVDCFYcThJunNUiRTTY/CJNmV7hI4SreYlzSlAduepOVGbUGX/k/Oxs5PosyV7Z0CEqw2ARRnKUEBfM61yld6LLmPUR/BY8J8XpWWMYeVCp7nvW9FLC73ozXy6joGw3T3VPFT03OPnTh7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384908; c=relaxed/simple;
	bh=ClXBs/ZC8nypYmLskEITrtBd0icyBriOb/izKBF2yOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSElvU0RCgbWG30FqmhRWlV8xb9enH+p8doHhnSYtKJ3forppbL0VkHfPiwornJY0kks/MXhGkqWCqikuZQTP9SdeQf5AQwiee0mOyS+03n8COrsE/olXXzpF5Zrm5EiWAnjMbE9HVp7JdI/NXj42Qy69SzdVsMry0oo+2Heb4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmBMYQmM; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmBMYQmM"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso743072a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 18:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384907; x=1790989707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCkD0NEbpweweLPyYmTDv9COC7AncTDYJNFGXpSt24U=;
        b=LmBMYQmMCmg3APyQ/FIhlurbho3w4grAVupATAr0GE9npeefp+SJ5BqB6+mrCbuqfT
         r6yl65T11XrUhrvS3RD95K3TnSFsYsLNDi6wbxNsMfUTbsYnU0LWpWZqts0QrQ7+SJij
         xFa2mntzE98WCG+g7kZMLuE+UmsOMIUyIik7u/ixawAzB7y43iTXerxZsQPe8dqCm4l5
         kS2f9C4MVkZhzbnbmF9b5czg9hW4VxcpjdTfzI9E7HmTlst3mBMNgvZyIK7p2h5tWXYq
         D9YPfAWT9+vPGyBJjER/x+s/flthujgqoYh42Q80pucF1XqrRFROsLu93mDUse0ysWDj
         3Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384907; x=1790989707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nCkD0NEbpweweLPyYmTDv9COC7AncTDYJNFGXpSt24U=;
        b=kbgYe40bNRtRzxV3A7g4BFj05WWiXHJ/tECqwVBBhoWvZbcCoCDF48kJI5SByqRdq+
         bYFWxJUXIq4CFx+9tCh0889rOhDpVyKaYr2Rks9RdCV84oj3c1cN6yMvqkQh+3s0K8aC
         UZt/Slqr/j+7L55K+9pn1kzcEpuNcryiNKYj+uFV1t/4Kh01K41iCL8BUAPxXFbsT30q
         BfmVLnYPNYNXqQjJm7m3zQkxJQueTSQJwgHYh60/+5STKEr2X7GLxu3OhdbOfM5fpr3R
         WYx1Kc+KFul6ZohfebA+d8Wafikf5ctZeNRkGVQpfJX3m2pNqQNRczXliNlIb3uqpz//
         GiIA==
X-Forwarded-Encrypted: i=1; AKwUvBxbhwZLFAlZOa/2N2G6AOPgDXT/tBCKL89qOpXVSfoXe+X3GCImVs6RZUpK9MyQ6sFtTcjuvIx/qWxWLncPtEg=@vger.kernel.org
X-Gm-Message-State: AFuF++l4lDsEH0tOGEQA46YQUyZL3YbHxN14lqLw9xBnNTvNMt4KRrw7
	JaPB3P9IbbcTRlI4Ac8eCuy/yFSV3JZyU9y+WApq35gH/ZIJXeDHvA83
X-Gm-Gg: AYBFou0dKP2gHRMUF09AWCI1vKHlZ8x3yZjSujjqHhdt1xvRXprEr6JVB5ifZ/89/4s
	n3aSUC3gim/QJf6sYLHGhivQca4EZtU9YJZucksnsNsXM2W1o0/tMq7xPWwL5eLw3addVUIqVYc
	Zacw5FKnupI9ULiwjRkzjQoesgK1QDyYReO5nEJJObQ6BTLc8c9a0RrWLj5UF+CXqUpZdA2jEsm
	8CMcNdxR22DGNBKQK9AdmrN/ofYed+eNaNoVYyGtoc/kfTTvw/J4BmyV0UfpcIia+rjxP/Rx2l9
	A5ppgz7cVQiQ2AT4vxYFi9CIEiU7ud1Z1iNebVy+YYZIIJHexrW0R3TZ5qS4CPKNxwGHr09Z5ic
	YnW35LzQHV+MhsgKzpVOgQz6bq1Q9FN2IYaUzJh3hKtESQ8AIDn5ywvVlyp7giNSVx35wKAiw2I
	xwqDEUtuso2lOsePytbHwx2Cm/my16vaEA1gzXBDA9d6/0OSknwh+a1NFcDuGv2PVEvMmka3aF6
	AQ2oWEZZ9Qg7tOhRztjIrbl+k6jaEQQn6eIM5uRBNMbg14ix+jje3l2RiMcQn5v+N9RgxqeujgF
	aiLkbhVgUV3uyAprXC2cR+QcKbIWU6TIou7xK4j+PAnNeFgAO6FYQuUjUCCx7w==
X-Received: by 2002:a17:90b:39a6:b0:3a0:c0f0:9a96 with SMTP id 98e67ed59e1d1-3a0c0f0ab36mr2504067a91.62.1790384906461;
        Fri, 25 Sep 2026 18:08:26 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99dcd78sm7026970a91.15.2026.09.25.18.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:08:25 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id DFEC716C9C98; Sat, 26 Sep 2026 10:08:24 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	david@kernel.org,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	ljs@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Cc: geert@linux-m68k.org,
	daniel@thingy.jp,
	Hajime Tazaki <thehajime@gmail.com>
Subject: [PATCH v3 2/3] selftests: run tests on nommu architecture
Date: Sat, 26 Sep 2026 10:08:18 +0900
Message-ID: <20260926010819.604346-3-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926010819.604346-1-thehajime@gmail.com>
References: <20260926010819.604346-1-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Architectures lacks MMU doesn't support fork(2) syscall and only
vfork(2) is available with limitations.  Thus, we cannot run kselftest
on nommu architecture as is.

This commit addresses this issue with the following changes:

- on test run stage, avoid calling timeout command when NOMMU=1 variable
  added to environmental variable, since timeout command uses fork
  syscall which nommu platform doesn't support.
- describe the difference of nommu tests in the document.

So command line to build/execute tests for nommu should be like below:

 $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=nommu
 $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=nommu
 $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p \
   -c nommu

Cc: Shuah Khan <shuah@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Brendan Jackman <brendan.jackman@linux.dev>
Cc: Hangbin Liu <liuhangbin@gmail.com>
Cc: "Ricardo B. Marliere" <rbm@suse.com>
Cc: linux-kselftest@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org
Closes: https://sashiko.dev/#/patchset/20260813063401.1786548-1-thehajime%40gmail.com
Signed-off-by: Hajime Tazaki <thehajime@gmail.com>

--

v2 => v3
- remove unnecessary modification
- new target is moved from TARGETS=mm/nommu to TARGETS=nommu
- rename CONFIG_NOMMU to NOMMU to avoid confusion to kernel config

rfc => v2
- reformat ktap header, reported by Sashiko review
- https://lore.kernel.org/linux-mm/20260825015945.141739-2-thehajime@gmail.com/

rfc: https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/
---
 Documentation/dev-tools/kselftest.rst       | 14 ++++++++++++++
 tools/testing/selftests/kselftest/runner.sh |  6 +++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 64c0ec7428a2..c35b819947b7 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -230,6 +230,20 @@ section::
 
 .. _tar's auto-compress: https://www.gnu.org/software/tar/manual/html_node/gzip.html#auto_002dcompress
 
+Build and test on nommu target
+==============================
+
+If you (cross-)build kselftests for nommu targets, or run tests on nommu targets, use
+``NOMMU=1`` as a make variable/environment setting to tell build system to do the additional
+checks.  These nommu targets may differ in several ways, such as not supporting fork(2) or
+using musl or another libc.  Set this variable to apply the necessary build and test adjustments.
+
+::
+
+  $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=nommu  # <= build-only
+  $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=nommu
+  $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p -c nommu
+
 Contributing new tests
 ======================
 
diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 8fc1018d6fec..95b5ebb8bbb9 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -38,8 +38,12 @@ tap_prefix()
 
 tap_timeout()
 {
+	# nommu doesn't support timeout command (missing fork(2))
+	if [ "$NOMMU" = "1" ] ; then
+		echo "timeout isn't supported for NOMMU"
+		$1
 	# Make sure tests will time out if utility is available.
-	if [ -x /usr/bin/timeout ] ; then
+	elif [ -x /usr/bin/timeout ] ; then
 		/usr/bin/timeout --foreground "$kselftest_timeout" \
 			/usr/bin/timeout "$kselftest_timeout" $1
 	else
-- 
2.43.0

