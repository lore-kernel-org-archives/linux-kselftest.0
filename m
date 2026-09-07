Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5DC3F3260
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 06:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763307; cv=none; b=E19z7zTasa054feimviCUbaDDQG1sbaSCGrBjx0mVPMS/QmH0rOycWDtPsrkoD43KpVZXxoIkixpIRkQaC32oHLR557wf/5PoYB0KgffwFt31ZyAN3TAx4mAq5vWkMMJsJ+72p9G5y1y+say/zz/dEptBKrWiyjwWimIBuIo1Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763307; c=relaxed/simple;
	bh=HYQYm7Ol+ajDdBWB8eOE9bTzmYQUN/ysOtKPbk0gEOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EX8pDffeMN7EHHEo675RvpizbLilO8a3tTnpOh5TJbGe24p2qtnNFFxVbyYHavbzA0v5DD9ibP59f/Bw+//kwB5C/JsLT8j35KKPTratt/14HR374zYfECymQEK7qdeC+iILbl7hzHRVQByIE+yf5dGZRrJ6ipHJMNxmuJwcSgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCoMdSi3; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCoMdSi3"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so3222823a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 23:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763305; x=1789368105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zflL+q58grc4cagGW8mHiAFMNdUiRsMqNFtJfF7Dmyo=;
        b=XCoMdSi3c4YjOmIc/sur3cFNq1AvOqkdb+tGIpYoz74r0V1Z8RY9sR4YTs0dDd8WWo
         5y0Xk+/kCDlfF0T9KerCa7DzftYkq7EJO7RErTOU7v0clnI8TR23SMCrLKSVsxbbHXee
         /LqrAJTKxoolta6oUyvZUwoAWZ4VT9CDPuxhQOfiwPcsSR7t8ZtBblwqJVPNSZsFOLo7
         Zx6zuL5D/f+Wm5kHFe+LBy++U5iJ32SX6WUbDAoj+PhmOPR26RZcXI1JPMhkKyvXqrNw
         BYM5aH2rkcwiNTX/uxAsO76DJB0YzFMoEYNJMW02kTP82EEaV6Jl+XpZ5cQYUhBcKtb9
         HBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763305; x=1789368105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zflL+q58grc4cagGW8mHiAFMNdUiRsMqNFtJfF7Dmyo=;
        b=jr58Ygcz10FmdElDNZiiBx/5i0SdWvK1Syk/B2jCPoPPCtMylg9nAJLc6sPbMsnC8Q
         uUnShAFXd9ZuTAytYN3fN0hgqHPxqoznavy2iBggdzUtboTWexWaRilLSOktH1sFmXw4
         EdwaZiQjN/1Ary10gKPw8WyoninOsKrQwZvE3zi6qGKq/Pk+w1ojqp50XU2GrGWDNRIK
         75h+SO0618VlDUSL3CoLeuBrEMBvCN5hRQCPTL9zEkwoWouKC/4jt6bGfHdlJzLefSr1
         1eAHRfvwD2A0p3XJDpcZDMSKR1olqDRpMNwKEoa3/G+nrmyPcjRrH4/Ouz6YB2Apc608
         p/qA==
X-Gm-Message-State: AFuF++lJGguCf+NtK9oJm1z2SjCU08opRXknNDcDwUxUUDoNwWH38SM4
	n8DwTpkyaZpGZO+dQV6uS1oJRKdPTPbmEjvmo9+NwrYgpivogEa5U+om
X-Gm-Gg: AYBFou1h5ev2uY2WBxiA7BwXYLCDQDZvCLH+iecYKiFOJx3BHkX3Elvhe21Cam0iTeQ
	FoUZTJ3XOwm35LBl+JT91IA8XCGTWL/OAPaknl/P0QLBxeFUbg+TrrgXupTo/hsQm3nagq/fdYL
	IOz47cEp2UOWvLHwoMjvkjtiwg/8yZORsUOoDz9uGp75RP2x2LJS01ScTqt2Sg62H4jacj5jQSs
	811SuOJt0JdzgA2W6MJT9mpot1B6wtRbb8iW1RcTDTjrdJDRiwsgO2KNPJbb+u92SDjKEqi/usL
	1iEPU65yulj+WGUzCvLv4oM0nCEtaKgWZZ5jjQ1Tu4mhjO3znnRNCOTVYdRxngw+XCsE00pRO+y
	1+9VMfG3muyBYD56+zcOh7pr8dYCaxAcxz7yl7j1maDw6jqACJrva2RRc60h3acO6YvLLU2knun
	qxwbKyfG1uA2ojC+5s+kXKcsxOrA0+27MDCnyXrFdAsduVFiJb5v2JMT6luIy7icaIb9rXu8tv0
	ibXmJsvgrtxEQ==
X-Received: by 2002:a17:90b:2f87:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-39b260fe42amr31090592a91.5.1788763304914;
        Sun, 06 Sep 2026 23:41:44 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm22413038c88.0.2026.09.06.23.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:41:44 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	x86@kernel.org,
	Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Ming Lei <tom.leiming@gmail.com>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: [PATCH 0/2] selftests: fix typos and repeated words in comments
Date: Mon,  7 Sep 2026 12:11:36 +0530
Message-ID: <20260907064138.38689-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  selftests: fix typos in comments
  selftests: core: fix repeated word 'and' in comment

 tools/testing/selftests/amd-pstate/tbench.sh    | 4 ++--
 tools/testing/selftests/core/close_range_test.c | 2 +-
 tools/testing/selftests/proc/setns-dcache.c     | 2 +-
 tools/testing/selftests/proc/setns-sysvipc.c    | 2 +-
 tools/testing/selftests/resctrl/resctrlfs.c     | 6 +++---
 tools/testing/selftests/ublk/kublk.h            | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.48.1

