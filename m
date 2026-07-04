Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73783263F5D
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Jul 2026 12:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783166700; cv=none; b=XV1NIvjtVxIBDunhQTQ6EvmudlyRzskIqaY5aLHj+rLUu6kiiq2A9ljYJIxsvKHB4NNMdHtxrHSwk/cmIUsQHspqrqAuiTAdBh+Tsu9YnEEvmGatjGhXBiHtltXbeLb+tgFjcynDqdEKv4NDRMeq4BEKT4/FmkUeTFgU0PF220s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783166700; c=relaxed/simple;
	bh=f4GTZyb84/4u70c8CMGYPFKG+uXGChxqsJo++uOjrJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AsbHHaqG/ugxPhZLkLBgz9DmXvEY5gYv++Ct4jFfw9RI+Wp5l1ApB+AljmKByUsaV8IgxiVP9Xixku6KoYbrI1XKqA8aOJImd5DulcSYOXRIFv32OjQhlBY+wVUIORNyuY56NRqYw+HZCEDvomRr7Vp3ViY++Zq7WE/au1Ib2G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwpixNBo; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwpixNBo"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc61541f8cso4775805ad.0
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Jul 2026 05:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783166699; x=1783771499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kDApiyhfQ7zB6Z95TfhqpMpei8zMQ8r0EAsOqioA/uY=;
        b=FwpixNBoj1VbGUd3ZF4wqB/zikGscFZzmbXDdkV7nMgmNGM57ZKVxd8ginsf+/7CLJ
         1uUnSNNTq1DO5/gYUW0IT7HRvPpz0hAvDQO9V5A52iOymGxGUpunz1rCZDN3Lkb5EZ17
         1M+j9sDy7s6MYdvc/ARJ34GQZaNoHH29v/BZVM60V28kUBlKGAqoLeY5PeJF4HcerV7S
         9XZc8AN58MkoGSG/RonEvnjknh97pOxCmempPf7xlZojkASw2kUl06RKmlx8aYGXVVvD
         Ra3ofw4D84abWqRPMNy7ajrq1fQUiTYOCdNU8Epk+w8Q2fGmWTy7f23t76sQsRwfLv9z
         wqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783166699; x=1783771499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDApiyhfQ7zB6Z95TfhqpMpei8zMQ8r0EAsOqioA/uY=;
        b=fM2vmNv2wzAl/x2ienv2kTEA6uYe1CJmLfpk6yCkiL9qi+nEo+kMGAY9q0rJULWVn+
         +0kj7q4e65tDWG7NAGubuIAF9ZIrqKAiAMpO/Y1QYVttLSW1ksKFn7dbuxyAOQUnQsLX
         X6vDC7rmrUl/XJQYfMs+TToflhOVsCy2hda/O4P0gFQZZEUQYT1DbAZNxrgHZc+4vK5A
         mXpbjCwatL93BIH6UmrGH+GSl5hE1Ba7AziO+3BlmdegAG4OwDoXglTX4jY/TDUMx94K
         gByRW0lbXKBfmMZckvWgtjWEaig9rZP+kzUEvgcBp1laFt9KJqyKHDO2/Sy3viPf0ex1
         OJrg==
X-Gm-Message-State: AOJu0YzSG4aOXO+83NtdKmCHOxTMrMvDtxylgdo8sKQmsLZkaxNBGCyx
	RCPX3B5939QCFbSXnAqDokY8s2q4aMRjye5WN12zbha5NAnNgFPxvPf256tfuuImp0U=
X-Gm-Gg: AfdE7cnp0lBylWajeyDdGmPRP1VdavDwbkWN3mkLyF7Y4kq7ea3uC+wdQL+nDVoFoc3
	WEqxwTWXu1uZT/C8LqMaA7sxT1IoHsf5qXCqhJqKv9xt9kwTrLj6TIBvvNY3UlQsBrTUzTnOSw6
	63C3Jc1VHQ0RmhcDslWjkG8CgeS0MJOxRleuB+Kl57FRJF43KRzobXkBTBhcnGPXhx4LN7MMsIT
	JHCRR4pqWNhk2U6ncCljwhq1ZBhPUkeYYuv1WhvQPzB6lfFQ4sUiuZz33hrGHnsBXWXyL2Li4Pp
	SIgh83R85+IqGCYvc+qnKh7itQg6wJJzGUAiAVwh6AFD6ZhR1EkZoT/2fPptAi42N9hGUcgcvgM
	tZSD/V/hF89TuU/K9Lz6NeaCqSY5lFRSVjG2UfWLLUgwnf5Sy/G/1GBITQgigoTUlQ7j+Ht2s9n
	t8ovmBpWDdJ1818qr4Rt1RLx4SWnh9agIgsPRLKA5dTT302TddAux5KSU5/g==
X-Received: by 2002:a17:90b:1e49:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-381120b2f0fmr9267108a91.6.1783166698601;
        Sat, 04 Jul 2026 05:04:58 -0700 (PDT)
Received: from fedora.mrout-thinkpadp16vgen1.punetw6.csb ([103.133.229.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm34504916eec.20.2026.07.04.05.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 05:04:58 -0700 (PDT)
From: Malaya Kumar Rout <malayarout91@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: mrout@redhat.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Malaya Kumar Rout <malayarout91@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Andrei Vagin <avagin@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Bhavik Sachdev <b.sachdev1904@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/statmount: Fix file descriptor leak in setup_namespace
Date: Sat,  4 Jul 2026 17:34:36 +0530
Message-ID: <20260704120437.99851-1-malayarout91@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In setup_namespace(), f_mountinfo is opened with fopen() at line 115
but is never closed. Multiple ksft_exit_fail_msg() calls exit the
program without closing this file descriptor, and the cleanup_namespace()
function registered with atexit() also doesn't close it.

Add fclose(f_mountinfo) in cleanup_namespace() to ensure the file
descriptor is properly closed on both normal and error exit paths,
since cleanup_namespace() is already registered as an atexit handler.

Signed-off-by: Malaya Kumar Rout <malayarout91@gmail.com>
---
 tools/testing/selftests/filesystems/statmount/statmount_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/filesystems/statmount/statmount_test.c b/tools/testing/selftests/filesystems/statmount/statmount_test.c
index 8dc018d47a93..7d9035c1815f 100644
--- a/tools/testing/selftests/filesystems/statmount/statmount_test.c
+++ b/tools/testing/selftests/filesystems/statmount/statmount_test.c
@@ -82,6 +82,9 @@ static void cleanup_namespace(void)
 {
 	int ret;
 
+	if (f_mountinfo)
+		fclose(f_mountinfo);
+
 	ret = fchdir(orig_root);
 	if (ret == -1)
 		ksft_perror("fchdir to original root");
-- 
2.54.0

