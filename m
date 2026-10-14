Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CF84CE695
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 11:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978536; cv=none; b=f35+XwDuRc3V31aFb41WUnkGaM0ZIu7x327x8pe+J66hVvqgtrt34UTvZEWJBHAUX2cB4ldDoXNMF4uvUs4OPtjjrFhbYlzArOxAmQ61+mB8dg2fRXnxXlP33Gczzq4v2tqqc/NVd69ZRxQ6I1B8Ar7xWgc7Nnup1Va+3h2pYSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978536; c=relaxed/simple;
	bh=B1BhwiUQ+2SbiJJEjS1Q2I5bIuXz3H0WSmOK6XPLouA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TVt8xoPYZHEjoeu6Ds3i2O+qNnFgfsDGcrcw4pVIVGgLEtGmsaKYnHXXZH06jvkBwfVb4FVsIRQUXDFG0HIoZmwzjhM6feLsmuPJPRsb1vkDV7OmE5k/XHdJr+vAfHQwSLJrz6ShMspCxLjaWpwiewyiDQGD2B2tFo8+VxUT1qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkO6vnHL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkO6vnHL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e82462a3f1so4887975ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 04:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791978526; x=1792583326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGZ7lXpMwGCCG5sKGnDsUSjI7naLKPxMxGZfTR/Ppl0=;
        b=WkO6vnHLG8rh8axtsSiZ6Zpi8d4xPyZwiRb+wvEFD1+Z7+GkDLnDkjHb00XlwnK53K
         00GYkM93cCWcp3BUmU+OaEu3F5ZNeszi36X8r0A2KXYxM6YXYyjgI1CPqX+5/nHtB87A
         e9ejM1IGkSZD1rBPRGEuVi82VsiEBu3qowdMr4Nr+lO6eVwm4MzYn9v0tWpS3lzBl5gD
         o8ihNLi0JdgRwmr63tV99BEM77TF5VwOZF6lx40pYDfanmwkkV6O9yfXGqNN1eAJBZTB
         nMexuEI5zThzMkFm7hsX3h7AOSwJHlvaH76UGgKYw0LKtTD9/qAVRBEYPsE3w4BbLzBx
         cEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978526; x=1792583326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGZ7lXpMwGCCG5sKGnDsUSjI7naLKPxMxGZfTR/Ppl0=;
        b=kmW9i5CCQOBq+v8dM6hA4L+aC2RCT2W4KDOnPRYLlVxr3RQpAEUlJ9jWTnGaoCeM9h
         bxyl22yGctXCJJ9G4vpfGQw7Au6L+KvujUwTpot3aZ2jBaDXyKqB6Ltaos7X6lsi+E+A
         h6CZGH6DzPxGR6xz5IrzHsFVYxMcXzaclV78VHIBUOcT8TWvUNOaEvZlnk5AfBoDNXJV
         fRl8S8a2xQESka9pNSOc2If9YzCUNwDFQFp7uq7jni0zY7EZrccnVlz7Mpq38RUbsNy4
         yZwEaWKREqar22oQlreWCGKeezDwhaKzWNaMN8V9T9AeKW6uoX5RlwQ9Cqz52b1XhWz+
         E7Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxSCbYQWQ9GGq7gQ554ePD6W59pLlUDUzi+uxomQu2Mo2Bil0KL/kIK/kbjl2vvwZH2RrKXrqfIXbJXyfVA4gg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKpqkqgBSVnp5etTk9sJRIFGgMUSEkI+YIKhBCduP78CwYiLXB
	2Q7IVfW3aXSVqCyeBHLgcWgZGqddxWIZPw5+A4kHucZWCyjqdsovHaGM
X-Gm-Gg: AYBFou3TDZdHiwKhvXVv71by/ADXjeV+yVSoku4I2LyJMi/QBx/nPvC3lGFHvvBVKbp
	Bb3uoDAk7REHztHa5gl2Itk0y0pczYlswbCwoDGgChx5/5XjKko1xFYBu4QVLenwIMKiPKSxI+A
	myVUpgB28QkfcRN4c6EwVN45DMHYp4rdDh3tIY8RuI7eZrckyQhNSSfi4DzP1zO34GqVikXbUU8
	pMpEeEPFHMk6pkP8xRZIqZig/FiCQho9wERtf6+lPMhcB38VHeLHUMFU9zxZYHkWxi+JxtPR0fp
	AbByTsZx5T5zwE6NaIb0tov/isequNeVswMAxNeCxSo4i0zA+0KOJYdkpxck0FWkNTiumX6f9xT
	1NuLk3deeZl9qdMPlDjNtS8Lw4wdj5kN91ZC8fVGutfE+ZU6SwqNkqjQEHXK/pL7IR/2OvzxhL+
	NLL4MEOZ5L1IfW0aWb6duw5FfTALxZNdzR8F2uOPVM/p+Fg7cpfYwVKS5tRMR/KWGdTB3oZTCCI
	xVP03EA
X-Received: by 2002:a17:903:46c8:b0:2e5:6158:b9c1 with SMTP id d9443c01a7336-2e842cfcf11mr131739435ad.47.1791978525818;
        Wed, 14 Oct 2026 04:48:45 -0700 (PDT)
Received: from localhost ([182.216.53.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422da9b1sm68643175ad.66.2026.10.14.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:48:45 -0700 (PDT)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/ftrace: Avoid unlink error on first run
Date: Wed, 14 Oct 2026 20:48:25 +0900
Message-ID: <20261014114839.6258-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the first run, ftracetest tries to unlink a symlink that does not
exist.
Use rm -f to avoid the "No such file or directory" error.

Fixes: 7dc1e125f07a ("ftrace/selftests: Add softlink to latest log directory")
Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
---
 tools/testing/selftests/ftrace/ftracetest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
index 246d7e1d015c..95804610e079 100755
--- a/tools/testing/selftests/ftrace/ftracetest
+++ b/tools/testing/selftests/ftrace/ftracetest
@@ -243,7 +243,7 @@ else
   mkdir -p $LOG_DIR || errexit "Failed to make a log directory: $LOG_DIR"
   date > $LOG_FILE
   if [ "x-$LINK_PTR" != "x-" ]; then
-    unlink $LINK_PTR
+    rm -f $LINK_PTR
     ln -fs $LOG_DATE $LINK_PTR
   fi
 fi
-- 
2.43.0

