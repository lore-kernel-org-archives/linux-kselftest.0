Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B7E395AEB
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469661; cv=none; b=Uq7m3QAPOOucs2khoQBzu9HsEjb5ui1xD1i5cpT+CqY7FQnyFftZgLSjvgyPFCUEUuCupwzj/KQkty8uY3RBqEx48CoqLndMRxGugthsBCGsVKI3YIibU8+vKxq9U1bbmIUdFqvhU4UfXduV0B5wwpGEq+8Y8tWucli3ou/aAF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469661; c=relaxed/simple;
	bh=iKkQeQlMycpf9iMeYIDxTMFKhkm0k4gvvGsiA/LaVio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CRL5fTivVT6kBYu3MnY5GJe/dBAi5unzXQXJJlevgG60i2bQlFLG/377Lu3FCHjnUnbGTtF2hTY4eqVkHpUqI1yy4Nfg4xUsVm3CGTWvWxbNc9kilI3VF+Zafk+WDHCKw8z5NMJpBsNQyXV0pWzAhVCYvFt/J8DA9gCN4eJPXwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VolJrv2D; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VolJrv2D"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so44660905e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469658; x=1792074458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sSg7ATSQQubxmgcmTMIuOrcHjExSpPhZ5BBe8FJg+Ps=;
        b=VolJrv2DAUnM+SUpkvGiXCm/BMhF763UnKJA15ea+gcsO+VaMoIBMiwdbx5qPRwLBb
         BVQUYzDe/vb0kHQrKTUr3tJ0X1kaFML7vYvJRZz+lS9L5qr6q3w6USFcIQh7jWgex3NY
         Bj6rj2mjvqlVXCYKCbVVhwvDZ+Os4fyFVgjrtU/sARLSfKD4go8tCY7iPpPsoOIrLxFy
         xOzbpyQ9bDvnJrPXLiZYHleu0ARlms1KWtufeh5/YIF6pPN7fV8UnWTAonDjz4a5rotj
         qNnANs0PGcL2k91xlTmMKjKGlzbyxuyp1NRblyoJEH4BN3xCyqoumuEMiIKZXH7Do4o7
         VykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469658; x=1792074458;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSg7ATSQQubxmgcmTMIuOrcHjExSpPhZ5BBe8FJg+Ps=;
        b=AguBYjp+9fBks1QtEuO2gQQrltJtpzC/VSsdKuFXFl94VsL7pSbWWRY+IJwxCblUOg
         B2jYCZ5h1PQ+hzKICMetjJz3a0ebedd3R0yPRmQr5iZtMpe3+RKHG1tVDhvpKNR1kim8
         xSrOrenHZJek398lr+FLjaWzVqT6EEGedl7MDH86JO7TczedCM/4Imw81GC8xNnTKLTE
         MsAhNMsPQLdjOH5shd9mXM+TJa8Fn6LwpKRgOHBS1TTQFtIZoUzw3EmN99ifluvjlHgF
         9v+Ey6Ga9TeyW8GR1J7bFQ4cB44xqaiMh5DXI8SigowqA93joDQChGv5POAkJzRiaCVs
         jiXw==
X-Forwarded-Encrypted: i=1; AKwUvByAS67Mgj9I1942DG2iQ1MlKDU3WyUNrsjV/lYnGc4php5F6IIVIWMKjyu6xG+PvgFoU9ZmqRFWK1H93IdhgzA=@vger.kernel.org
X-Gm-Message-State: AFuF++l3YKd/VaYCDqbjnFpZYDg47Kzvw2ZBUBYdf+t9sZ3aqhPr2OqR
	LNDbp7d7x59OSj1gEZ++bvCgdViJRPm1lcVVrJYI4ziLipXpzAel6mmI
X-Gm-Gg: AYBFou3Mt3pGkXOvXOn/KQlm5wdqIHlKE0Bjoe5N00FL3CnjfZm9iXgcWO3FJQI5+r0
	ne3a68Vqx0cwMNhnLFxvYOByrI0IdZRgziAX6uT23Lr61LnM/QiM21XImqjFG6LqK7JDfh0rijF
	mYehHXh6riLsL89Su90WnrXri852Mj9bO4OI98RizMU+oB4Zn6s2aUX7/YCnhJ+r8nLfmzdD0vM
	hkckoOwYJDwWsa+0GGolaIDTFvyURouw0LHnPb75rFYyCm4Fh3ZpmrJDWdQt11pBllJH7s2qP6P
	prUFUy2CpsHBGhIa4LrPFBBuUZNj4SeRAzMlNUlkqkb04UI7hzD0ZTq675mGCn1hAd6I1lZ+9oc
	RsOFcVY56llpSnwhpemSKNRQZL6K99qBhRoJpI/BpV2JKafl6Mi7f82m2otQHyDmkKFT8e8enHp
	yTC6Qmxdylpj3epiBJTFQbt5qOUY7XnLxpRNTInmOq2hyzCqBJxVDVkVjlu1b2wsPyNIJSCmlUj
	AHYAVXTJ+4HWqM3m4y/Dvk=
X-Received: by 2002:a05:600c:8b6e:b0:4a1:78da:d271 with SMTP id 5b1f17b1804b1-4a18064be59mr102776565e9.30.1791469658475;
        Thu, 08 Oct 2026 07:27:38 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843bd060sm92856175e9.14.2026.10.08.07.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:38 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/27] selftests/landlock: Use _exit() in the named_pipe_ioctl child
Date: Thu,  8 Oct 2026 16:25:50 +0200
Message-ID: <20261008142604.39107-23-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In the named_pipe_ioctl test, use _exit(2) like in other places.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 90f63af1d64d..ba3b39ad5882 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -4276,7 +4276,7 @@ TEST_F_FORK(layout1, named_pipe_ioctl)
 	if (child_pid == 0) {
 		fd = open(path, O_WRONLY);
 		close(fd);
-		exit(0);
+		_exit(0);
 	}
 
 	fd = open(path, O_RDONLY);
-- 
2.56.0

