Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C413F9294
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725483; cv=none; b=ZM3kS6WhrvY8nFhe2eBYspda9nBFVaCGq6dwJM3QQiTcqJfZpcxvt/DEBgnhEV08NHI6fuvmRixlpJyE9bb9vxkkZeMaN03W0b7tZrwPT7INM3dqOzurYWjUJRs8HoAP9iUs6l0TJMT66qI99xFlLZNRVyFCzbcZQlYM4+RkliI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725483; c=relaxed/simple;
	bh=tn6wJlpjZISGvOpBbSSmHynVckiSkF93YB8fHRf0Xag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjRMPGcSNk5975M1jc926hhsqrfTa4RtUDX9CMVE9Qr5TDHa9rWY77LdLJmXAeSkn8cL6G2IAzvUza+UbqtRGVbEc9u/R7CqR9f5irQZllx75or6w7GNUYvqUkL3/twwjnhX0vLPPcEaTEx8gYqt6+Y8vDX1oItdmFcUVT/rz1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQW6l7sZ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQW6l7sZ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8478fe07ebbso268023b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782725481; x=1783330281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFPmiZ4Mjv6BXhEHcS9Bb7V7+aPBk2CMtzf4Gc+B054=;
        b=qQW6l7sZxtbT6keh/A7OhO54//TcAI4QgGsgBKlAwtEa8ZlQUfM0C7jUzrQOF+8DyB
         YXvSGF2GSgC9RBCj7XrAASZyaSBh+bMA+/KT3nWTWaYYfAlebLLZAtQp7wi527yhPzrZ
         +5FhGT3dha8VRc6RfWHPCF40+sD0LUSv3E7+atJqEBGcPvaM+rNr6VzAQPmM/PPEACQT
         ZZ9zv9R3XtwUburNnNDeo3TjHYRJldG/vtnfwwW2LlQfY26ezI79rIg0Q3K52f9Jo82C
         CJSDVZhf3d33rft+LQsLsqbtEHlz5OO4Xyb+Smoe6JUtW092Xi2Ib+YKQnEM/sRr7ODU
         Dcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725481; x=1783330281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFPmiZ4Mjv6BXhEHcS9Bb7V7+aPBk2CMtzf4Gc+B054=;
        b=rPPa5jGjgKOMkA4+gM8Xe2+fotzdJnEmQ4sxLD1FQQsunmO/daBh4Kkxcb9StNmbnv
         8HzLNqNPwwXKxa4ttuZqMpIX/JAoCxCAhd5VbGbxuZT8HgXL5qaLa2KYpigVBQOV6u/O
         YhR3o3EO8ltNG+mCy5MyFGtlx01qDJwdx8CBEEJQ9nV7mTPZbbHPd2OOkdzDCjVU1Goo
         KH3PYoB0i0qqudGP+1x6P8F7bj8J21N14vcrh0l/5mERzU+Q2KpVRz53sDoRW6N/R8+e
         ZsElPBVFCvmXP7LyJA1K3CAUWmmoSKXVhOtiCZVPU811RB/onPlUPyXicVQ0Ujka+xmC
         Ncow==
X-Forwarded-Encrypted: i=1; AHgh+RptAp3ZSr6gh9Ta+j0ZyvW1hNSoXl/C7GpblLufkAc0K5u5xFo1dGOi49587ob+a82IJUSxST7bp7hd2DdU2EM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnBAE9EQlVFBheYxgFqyWQuELjSCPPtYrcq99DG8LWwjRLmO6n
	vMkbBSebiWrSfXWAQiJAIDZ5jUf666QJoaQyIm+RKevwFXmAX0EV35Py
X-Gm-Gg: AfdE7clWOhUG+jV2tCsIHYbLgjOvgrhc7Et8hZRbKxt7RsycmCd8yDxvKTTeS4841wz
	ItEdKgtcGWxFNEMjFHxqedNyHfRgJ1MvrIkjaooamghHRm/GYF8yEdH40OZhRj2uqrFGc2r6rKj
	VM+kw+hwJS5eViWOvycGR81uKlKM9Aa/2nbuneSfhRcxNBcDTiiTNC0sBRNPtENM0/jxokA9+bR
	h8L9vUwslSp1kPSwwrpxpY+kePk3rRIEbUlF/Y9ifLjrmGITuOThVgFBHtSfe2kJ/nxpmV35+l2
	DT7jeUj07i0iNfRKs/j6AcFn9fxrE8GFPPCw2zc05sOxa6348xcUD3uCbSm0IGkuesIc8Go8aIf
	VFt3F7Z6Tb/uFUDgabboHW+K3qnDVe2zqvu/hUa0jHHK7vSHJHv9Fcc56un+PNzfEWsn1T8vl+9
	zMqtim
X-Received: by 2002:a05:6a00:b53:b0:847:8bd0:1b96 with SMTP id d2e1a72fcca58-8478bd026dbmr1380804b3a.23.1782725481265;
        Mon, 29 Jun 2026 02:31:21 -0700 (PDT)
Received: from martin ([2405:9800:b862:14dc:12ff:e0ff:fecd:7ddc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb769sm11591198b3a.17.2026.06.29.02.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:31:20 -0700 (PDT)
From: Martin Weiss <martin.githubacc@gmail.com>
X-Google-Original-From: Martin Weiss <Martin.weiss2410@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Martin Weiss <Martin.weiss2410@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Andrei Vagin <avagin@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	Bhavik Sachdev <b.sachdev1904@gmail.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/4] selftests: filesystems: fix spelling mistake in statmount test
Date: Mon, 29 Jun 2026 16:30:52 +0700
Message-ID: <20260629093056.591498-2-Martin.weiss2410@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629093056.591498-1-Martin.weiss2410@gmail.com>
References: <20260629093056.591498-1-Martin.weiss2410@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Weiss <Martin.weiss2410@gmail.com>
---
 tools/testing/selftests/filesystems/statmount/statmount_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/statmount/statmount_test.c b/tools/testing/selftests/filesystems/statmount/statmount_test.c
index 8dc018d47a93..9d963e09e510 100644
--- a/tools/testing/selftests/filesystems/statmount/statmount_test.c
+++ b/tools/testing/selftests/filesystems/statmount/statmount_test.c
@@ -515,7 +515,7 @@ static void test_statmount_mnt_opts(void)
 		return;
 	}
 
-	ksft_test_result_fail("didnt't find mount entry\n");
+	ksft_test_result_fail("didn't find mount entry\n");
 	free(sm);
 	free(line);
 }
-- 
2.54.0

