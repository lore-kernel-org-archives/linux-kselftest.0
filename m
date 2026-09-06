Received: from out-2z4y-a149.jellyfish.systems (out-2z4y-a149.jellyfish.systems [198.54.127.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8191C5B21A
	for <linux-kselftest@vger.kernel.org>; Sun,  6 Sep 2026 13:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788702921; cv=none; b=lIBpRlXQuWSEIkCmPONfxiLEeKH/M1CAdFcw13+ubJIjkjoTh73joDSUT1yISZWtyZGGxizjnMIo1XfSsLMKt+N/+Z6oS2TJTAiG+Jr7TY8IfeUsAL66JKewyNvVJOJROgJRe3OuOpsrqeYvI7or0iH2pwZgzupu2Wf5O+xGECk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788702921; c=relaxed/simple;
	bh=SyfwgLgNUrQ9kHyz2X1jy/vY9gOc6JlLxw6yzV19Le0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jh8SDCh4E/rfej0PRexWNSbWPkYM4t2d7CSo+TLqZ79vxIv14G99hsXfDZ9kClY+3kCxK8f0u0TwvQB8nPlCG6jJI/Hk2BBJlQMn+p8QeCV9p3JwinmPPIAApt2Gi3HdusAxbUaZr9GuzEx24dq4b4DF187gmfGzHY8IsWoitfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=k+nC8v9x; arc=none smtp.client-ip=198.54.127.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="k+nC8v9x"
Received: from fedora (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hdBXW3m5Lz8sXQ;
	Sun, 06 Sep 2026 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788702894;
	bh=Rdk1razVM4wzn8BYFk67V58kT1IZF+tiqXFv5msdJgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k+nC8v9xOCXuaxIACm5N2ea5tjPWOcyhsH/oWRcrxtfjOoADlBUKIuVFjLD4QNArL
	 khGdE484U8oj7VgnrYKk7v0Hbf2fb7ynvhVB1XOmdwpwqPdB8iMLQAy9bO3VXoP7su
	 l+HuOk+0uokc3WvgH5K0+i5JLGz6YmUVsNSIGobMbSyySAlj/MvonfXoiB5jbx09f4
	 8udyRITBcATAGCp2De26lgs1aSFvDjDLg5OjZ9f0xfN/yMILtukR3f8S5JKKQfX/Fr
	 v9X133n9AAOiPRv4GzB2Z1Be60WgN1eO5jcTqtIE2+dA1kLAqvaWONcYrDbzOECpPL
	 PqKG9AJZ7mqPw==
From: Tianyi Chen <hi@tychen.cc>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Tianyi Chen <hi@tychen.cc>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joel Savitz <jsavitz@redhat.com>
Subject: [PATCH RESEND] selftests/mm: Exit on invalid command-line options
Date: Sun,  6 Sep 2026 21:54:39 +0800
Message-ID: <20260906135444.749144-1-hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ZTYJZT7Q8UU4.KPP9BUAAJVQO1@mailcore-89d674988-v7w7p>
References: <ZTYJZT7Q8UU4.KPP9BUAAJVQO1@mailcore-89d674988-v7w7p>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

getopts reports unknown options and missing option arguments, but
run_vmtests.sh ignores its error result and continues running tests.
For example, passing -z or omitting the argument to -t can run the
default test selection instead of rejecting the command.

Exit with failure when getopts reports an error, before any tests or
their setup run. Keep the diagnostic provided by getopts.

Verified that -z, -t and -t mmap -z exit with status 1, while -h still
exits with status 0. The mmap category's three test programs pass in
a VM running the kernel built from the same source tree.

Fixes: 85463321e726 ("selftests/vm: enable running select groups of tests")
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
Resending because the webmail editor damaged the whitespace in the
previous submission. The code change is unchanged.

 tools/testing/selftests/mm/run_vmtests.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d09f9f6a384..189927f87e6 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -110,6 +110,7 @@ while getopts "aht:nd" OPT; do
 		"t") VM_SELFTEST_ITEMS=${OPTARG} ;;
 		"n") TAP_PREFIX= ;;
 		"d") RUN_DESTRUCTIVE=true ;;
+		"?") exit 1 ;;
 	esac
 done
 shift $((OPTIND -1))
-- 
2.55.0

