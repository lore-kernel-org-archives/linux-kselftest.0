Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52641DED5C
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 18:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005405; cv=none; b=XbP/U9PxEIH4mIObyb5AErwZ6zFsmHZCDAOK1yvU+PNVWq7dbnSd/wiIw1g9jB2XV/lxX+TAnjLYhcK6jvlR1QEUsIViDtjSqVBXIz19T9uIAY/py9AWCH5Av+4aQ+xp6OKDDl4CyKi0B/U4XfyHeY2uXqnlfyyyQr+CnPW6fE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005405; c=relaxed/simple;
	bh=3idjY7q8VZaKR5zK5Erme2evT7lSxrnzywEyJMy9X2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X5hf3IEg5iKWBrXopBRUDDVTHT0PynxWi59Yhv0Gr2Ekldpanx8MZCuNIUa1YFswxmG7dEcdn0A7XRPfarpSPIZjfAeOd7xUYpmWlmRv8I30RTUx8S9nDxJxSAtxEQULxYfcLmY90my42TYbeBILrCsS8+WXJ9WGZEwsa9A/6II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDtHU8cP; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDtHU8cP"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82faf871346so3496237b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 11:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005403; x=1778610203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWTJjKGnCUFekx/y0zBWtgZOF85zFt7y6+neh4e6+dU=;
        b=EDtHU8cPcRi2CX1OBmOZzMaCBtW8Nu484q+1OEfNxrGOo3rFnVckTyra3SjyxvNJ/2
         ZyJYwO/ikcSe8Dmmnjd7UdfQHAoCDMpR5tAWMdBdfx452RCeDSc7N+qbKnj0jwXSb2CL
         KbI2NbcXRTBD3/AaIMcsGy2poFww6xNJlpkFMMUC4f4NcVtP+8hxwOoJ0AF/16ZLogZd
         iBM4IfRlxj/6uyv9tYViBgktTps2052e8oEPnqnjM/XngiacPRzW6su86jM4qCKxn23Y
         +8qFPP+NVvKy3qshcl2rDHcO+MQkblDJqeK3fkzq0Lp7tt5QdUOPexcnZyG+c136fmlC
         T9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005403; x=1778610203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWTJjKGnCUFekx/y0zBWtgZOF85zFt7y6+neh4e6+dU=;
        b=f+ssLIyV2GygeWBEwJDkMnYITf3WHuSJ5rHzrFocmg+2OXhax8BnaQy9XKWOqaAbMU
         yppSnCawvXY0/Y5KZBLtMh94aSCZ3pqgoilEkkBPFHI3CZNHm+CfITEugu7RaLHUPktH
         cnYNpSZrwQrceAT3dbY7hXTiNywvTzRoD86cv8k3HhwXxyKLuQOH0PHFYu+jTDQcieje
         bbOF+1str7rwhEe8RflKw6LgULNbJ2rTnDbF7SMmim4s43+t4y13nfxTe+8g3WArObcp
         aLsxcs7C7dowOCd1rFzGywfrJ0GtNlEZyYw5pHf5WxaBfB2WoQmZDPGnvScyuLkfiaoU
         A6Tw==
X-Forwarded-Encrypted: i=1; AFNElJ90kRor+GyPipnBYPkD3pUR/ycWIocz3Nd1XtCwL76eI3t+XC4Uu8jDQwldGT6kGHqQ6u4vPhYImWPBdo/S0ao=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRYtMgbLiSTxsokl6eEA6MOA6g8fSwPIXpkLvAtvpWDrqLJTKD
	3tcB2e1dU0fOTFQrW9djPD3OdVqPYAKD/+vqLhyRoxX19jDip8rORsKg
X-Gm-Gg: AeBDiesLE/qIFgeYxAC38EFprkSlgK9aRBcoFSymb/jjyJpbzdQ3gfAcIvnpXjJQnkp
	54iLfz1B9UIxlDpDph4bCH6d9ZFvAoAehxo2jzQIwqteJ2jT933IapNoO+dKxWLkmbbfUHO7TaU
	pq5UMrPmaRHmrZtXCw5OcCWPpi1dOm/2zNFhrkhaozo5ZRHLlOaYrh1Df75YV+DOSOnmMmGfd9n
	T1mbFFswhfefpsz1vo1JGMdzq3sUhsHBcsFI94YSbJCYUxE7lAC5PJtbOp/yK6VCXFGCmMMQf5s
	Z8E/q+d38makqh8JeTtnQo9xy6rdUPy+0CZBDWywHYVkkWD3sw3kMrR6DRMqqylIgE4j/XmqwoM
	9ZkuIDkPjhOh+Z27HepYlqDIaTnmb0tqRNBX4PJJk4i/C/rqDIJl+tLCA2cUWtoyPQ13/VUgn9+
	opitT7jnRwk39T6iPc0BBFcJkpK1+PQnw2nCmiFN5WO8ttCpIJcQmfdNFID/w=
X-Received: by 2002:a05:6a00:1822:b0:82f:3ecc:c42f with SMTP id d2e1a72fcca58-839246caa8amr4509989b3a.40.1778005403184;
        Tue, 05 May 2026 11:23:23 -0700 (PDT)
Received: from mo-Inspiron-5559.. ([2001:fb1:d8:b0d8:5f5a:b3a6:e7fc:e897])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965646254sm3081784b3a.10.2026.05.05.11.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:23:22 -0700 (PDT)
From: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
To: shuah@kernel.org
Cc: broonie@kernel.org,
	skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	woradorn.laon@gmail.com
Subject: [PATCH] kselftest: fix doc for ksft_test_result_report()
Date: Wed,  6 May 2026 01:22:13 +0700
Message-ID: <20260505182213.22924-1-woradorn.laon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix documentation to reference ksft_test_result_report() instead of
ksft_test_result().

Signed-off-by: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
---
 tools/testing/selftests/kselftest.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 6d809f08ab7b..b50a8478d4d3 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -346,9 +346,9 @@ void ksft_test_result_code(int exit_code, const char *test_name,
 }
 
 /**
- * ksft_test_result() - Report test success based on truth of condition
+ * ksft_test_result_report() - Report test result based on a kselftest exit code
  *
- * @condition: if true, report test success, otherwise failure.
+ * @result: a kselftest exit code
  */
 #define ksft_test_result_report(result, fmt, ...) do {		\
 	switch (result) {					\
-- 
2.43.0

