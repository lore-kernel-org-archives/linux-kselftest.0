Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554608;
	b=5O65M11tGtypp2yIxIQgjVTR7dmz7eM0pf61FJulzY0KohW7LEV/IjWDmluJhecXg4sd
	 D0Oy1rtg9ifksatVpq3Yn0GTh0l1hQ2YXB6bwWu1uodd+8f3UA6vXwfzkVyOU8HkcaPAS
	 nIKoGrLVzMCohsi4OfWqdiDiL1ufxU0/GsrzAkj0eYTqzMRhhcOLqCnMJIivxPgT8ig8w
	 gey6LwGsHvu18618D7cp36vEvbQ6o9Kj55Mea3XJgYD8FJE2FX2YgoY6zmRTJuIfiKdor
	 /zRsuY/mkWZ+XoW2kHFKGTao9oUd2EqQbWWNpV8W87lhAAtyL8dxV/yTkgvQ09MKQ9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554608;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NSvdMR5bdC0mD53YVwx+Xa6vtbAjmkknNO818XljrCU=;
	b=t0v5LlUY3/z+q7RZdkpTmkLmNGz3oTV0g14SG8ckFbmGihIXf1tFC4QlbWGdJ1iZ2mv7
	 egrIj4IHGpIyLoIxC3PLSITw8vAKxWVttfpz50EitcgkKCGYgYqcXrUYsIKt66TJ1/PkT
	 3FB5j5qoz2D/1PZC2GMjpz/85oVMHvbOlognmiJGGNe4zty1XjgWo3qLZ3574lbwhQsGX
	 m0nCRgzusx81dy3oCRhfl6yN7FikU4V2rFOkHXtVgzbHz3l2Xdj6wzsYgwUuGeCmoFgG1
	 KHrKGBNhHH9nsVa9/WQ55CbrYxOauUq4gMLSTQnyIZMZY0G6XzbM8UHZLG4aFOSbJ5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=sa4fun2s;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA71D606A31C;
	Fri, 13 Nov 2026 07:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA71D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=sa4fun2s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=sa4fun2sOSH1mEAmixHIQZ3KOXxE71AcK9LfQ+DselMOwOsz1OJE1Q3kZD0hsIkonXZWTGXJLwg2s
	 U7ZITf914PPDRlX+WwQkuwBO/0aX9o4V+ngMYfsl4ZR8G29jY5NZV+/j0RGDNgWXJsTpIirkB274It
	 YHjUiiphg+S72cME=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af6bae306e-b5e13;
	Fri, 13 Nov 2026 15:23:17 +0800 (CST)
X-RM-TRANSID:2ee66af6bae306e-b5e13
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from desktop-eb75daa8a6be458c-20260816004526035 (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af6bae3ab4-1c302;
	Fri, 13 Nov 2026 15:23:17 +0800 (CST)
X-RM-TRANSID:2ee76af6bae3ab4-1c302
From: zhangchujun <zhangchujun@cmss.chinamobile.com>
To: kees@kernel.org,
	shuah@kernel.org
Cc: akpm@linux-foundation.org,
	richard.weiyang@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	zhangchujun <zhangchujun@cmss.chinamobile.com>
Subject: [PATCH] selftests/exec: check malloc() return in execveat concat()
Date: Fri, 13 Nov 2026 15:23:12 +0800
Message-ID: <20261113072313.1723-1-zhangchujun@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

concat() strcpy()s into the buffer returned by malloc() without
checking it for NULL.  If the allocation fails, the helper
dereferences NULL and crashes the test.

Check the allocation and exit with a failure message via
ksft_exit_fail_msg(), which is how the file already reports
unrecoverable errors.

Signed-off-by: zhangchujun <zhangchujun@cmss.chinamobile.com>

diff --git a/tools/testing/selftests/exec/execveat.c b/tools/testing/selftests/exec/execveat.c
index d37c068ed5fe..b70844a7a13c 100644
--- a/tools/testing/selftests/exec/execveat.c
+++ b/tools/testing/selftests/exec/execveat.c
@@ -138,6 +138,8 @@ static char *concat(const char *left, const char *right)
 {
 	char *result = malloc(strlen(left) + strlen(right) + 1);
 
+	if (!result)
+		ksft_exit_fail_msg("malloc failed\n");
 	strcpy(result, left);
 	strcat(result, right);
 	return result;
-- 
2.50.1.windows.1



