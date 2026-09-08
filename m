Received: from out-zbxj-a74.jellyfish.systems (out-zbxj-a74.jellyfish.systems [198.54.127.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D584CA798
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861374; cv=none; b=gvXCZwL4Y0i9dAGRLd2+f2sP03sNxWlwBFMZ7AlEu0VqDP3FFobbdXd0EIbz+9ESRd4exalW4nOoHi/BGnogtpn6iWd2Ioxs+/zy2KKSAC0aX+ds8WBAf8YTsQg/D2gOc5jWVOk+rlXuujRJUyMEJiTWv+zOsHg/08ZIbUDBPUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861374; c=relaxed/simple;
	bh=k9NzU2FAH++UiAuUO1LKUA/HieD6i5x4scnQ1gpM+Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPHP7vUlS5aAkdAPJ/vSL9bpTQIyU6kS+Vny+sC2WbScMoFjDTtFUVd7rdsYPYhCQT9rqdb2gWmeez2RizU3E4Uz/r54sSeztxcW17MFfBB+vXswz/gIFUhy35MzDL9W6IjU/ADnLiJlq6zINf4gBzDLta0eWwluBUj0XZEO22Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=R63crrGc; arc=none smtp.client-ip=198.54.127.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="R63crrGc"
Received: from fedora (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hfK7w4gBbz2xMb;
	Tue, 08 Sep 2026 09:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788861361;
	bh=QYyjaZaYZ0ulE8KGtDF0yY+jHdpZ4CwTPAi26ZHz6sA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R63crrGcCdkrcwXgLHdaG7kwwuC5O0uz1h6frkTokYuRe5xFYw6zJucYF/YYS/ftN
	 kzWyjwF4DfLa9Pfzp+w3I0AWRtAslwmkHOjfoyKtl4ZIRbyO92d13DXdJ4vAe61yD9
	 mLBg+AzvRQcuotLnRq0LYy9EH1xH005O4aqYZhTIEsCv2Z/HQQpxPLg+RdkHMu5dI8
	 fUgwEFBpSEpNkUdmLbRL6wned7RO5MYjU9IRDv1LWb78bWs78Bshzm+97QT8oatrx2
	 sbb4vs3pL14/jU+970eaH3l3iQ2+wzPq5SGAd7E41aXRVPTu/UAe95BrLpD1xEV5KM
	 PuaOFQ8EMFG6w==
From: Tianyi Chen <hi@tychen.cc>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jsavitz@redhat.com,
	hi@tychen.cc
Subject: [PATCH v2 2/2] selftests/mm: Only prepare ptrace_scope when memfd_secret is selected
Date: Tue,  8 Sep 2026 17:55:33 +0800
Message-ID: <178886112560.138404.8930658836608223518.mm-cli-v2-2@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <178886112560.138404.1278745290043112298.mm-cli-v2-0@tychen.cc>
References: <20260906135444.749144-1-hi@tychen.cc> <178886112560.138404.1278745290043112298.mm-cli-v2-0@tychen.cc>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

The memfd_secret setup clears ptrace_scope whenever its test binary is
executable, even when a different category was selected. run_test() filters
the test invocation, but it does not protect the preceding setup.

Check the category selection before entering the memfd_secret block so
running unrelated categories does not change ptrace_scope. Keep the
existing executable check and the behavior when memfd_secret is selected.

Assisted-by: Codex:GPT-6
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/selftests/mm/run_vmtests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 836c7454cba..9932df252f4 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -371,7 +371,7 @@ CATEGORY="process_madv" run_test ./process_madv
 
 CATEGORY="vma_merge" run_test ./merge
 
-if [ -x ./memfd_secret ]
+if test_selected "memfd_secret" && [ -x ./memfd_secret ]
 then
 if [ -f /proc/sys/kernel/yama/ptrace_scope ]; then
 	(echo 0 > /proc/sys/kernel/yama/ptrace_scope 2>&1) | tap_prefix
-- 
2.55.0

