Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D2247279F;
	Wed, 21 Jan 2026 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988656; cv=none; b=R2dMcNrLSOX5e4f2S/51jRNullFORU/nNDSdZyHtQuIpeBevALF6x4LYNLnQ6w9DafumYc/XFkVKvygN+KsUjPT7SAwW2bTaF8RyeaYlpZNQc7xBFy98h6r+XYMrWu63UCUEdTtvMoz2awQMHwc9gtlbX+dfpMnbOK8ZjfR7ezA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988656; c=relaxed/simple;
	bh=/Ko1MEbL4in5eafLEIerrfrqj7NSl5x79bqeHWYNV2M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DWo9Fr9wZvymV5hDd3oXG1U5Tbw7wVRtZIYk36I493QkB2nhguzvUbHRynOPukLWjGJiVd74HazysBYHe3JlHg39gTFnuBfjYE4jpnRZLb50k5lU8G9cMpBkAEDIuAKaDSrvdyOprzEwJ75UjMt1Bs3fe51uJGB7F4iHDpxy9W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=l8bKpqVi; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="l8bKpqVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1768988632;
	bh=Vfl4Nk5MAvdFB0rXkQ3szIBwX8h/vi9QfKN6nqzjaGo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=l8bKpqViozD7PTX4+Pzx521LkDx7RcdL20uCo0MdCDPDjIsUyhFvLaPPzGN+zyaBP
	 JNAOPjXy0WJguDTsw0/VFQ1Q9MqQUGiS1vQ/rFe0tUAD0yNC8hoaGLlo8f5MbMhCCU
	 NUy3xgNARTVdPeBPQy8LT3wMC1mOUUqy1xgRvy7Q=
X-QQ-mid: zesmtpip2t1768988622taf9377fd
X-QQ-Originating-IP: cgtnSARtFgvidQBOU8XTXJWoHHZcMmje5KihYkD2p2c=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 Jan 2026 17:42:15 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14099089218759742070
EX-QQ-RecipientCnt: 9
From: Ziyu Chen <chenziyu@uniontech.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	kernel@uniontech.com,
	Ziyu Chen <chenziyu@uniontech.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: [PATCH v2] selftests/pidfd: fix typo in comment
Date: Wed, 21 Jan 2026 17:41:47 +0800
Message-Id: <20260121094147.4187337-1-chenziyu@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260121060333.4160937-1-chenziyu@uniontech.com>
References: <20260121060333.4160937-1-chenziyu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: N/FaA1O/0SfpeJ6NwZJiw0DRHh92b5ENeGJm2bYDL7xv6oMocHHOaJm3
	m9M7nLMcKMyt2YXPq8uN7sajQv9RZsTdxqYq7+stp765H4JXAZSv0e3KyGGLAeW+idRdAQg
	bLQkujBzW+EIX7BZKA5VLwk/CedFxPmbzsrzkaCclDoF2l4/9gjoY/aXnuF5MKeLttL7ITH
	UKa5rYqroYczuUeMz5npHzulGpPbSQ8BKpIMrGC9+Ybm3pnRcjQF+VXnYFgkckwupC2UwL5
	qxXLGMoQi/MJmAvemvwjq2hFJHUgspGdXxvZ8hKCvgVDct/oZMGN3ZF5YW5HNxsHISOlInp
	fcn/boDwU7xHGDoVZ+N9oIIZ46VAsGpDO5PL39mf/S+i7oRd6jN6xNMHR7gUm59oqBmxtGT
	fAJJMwO9m28OD5v2d3bX78yFPjN11ng95zH98k8eZM8UZxx1dN6klhLIeeGvn7S9BesiwHI
	rmF5ldlyzlKj9gRcFlkxkwEes3Zx0n+JvggCr4finoYtVbCy9mGcvVlpP2p20H9+qEn1TUJ
	zRjU21cv+Frn1yvi5NCYk/6JVcmGNhXPB5ZEuBsAkk0ilsliLXmQArBLE4dt9eUujx4sosE
	rKnHtfOQ+a7W4G/7viZFMSGXd0lZxXkcWYVtdgN9Mb1Y+BMP7P3dJpGsVwjdZxZBkcRgXJy
	hLsqst3rkYkE/8ovAkCkST4DeRr72GVYbVCGTUKdJPhv+xOv38On8smfbyogSZqenyDZetI
	m6rN58Mi9wB0DLUi5sGW/nZc2Zqn+/D2yJrm83ROucFB+jPEIh/UZlNLURPAGZwkek1a2xc
	qeEUBZY+uIa5PQqtQJV+WLpz5rgkQTKW7jZVr/O+Lgs3J9u4qF4zA9sCflsnfqBBYIRjFfK
	deiOAA7FfZniVh/bepMamxH8pGrchbPCnTX1vyQG0GaMb02zFtCxjsG3NPA4n6bnjLsTPEp
	/Jt1g/NkiUOc4ab7IrMkD+4bh3+2DTEYaYpdQz7mTjR44WZ+UmMtMzqdM4y1Yz078RWbycc
	nsQMbpCWxd8O1tj46+hULHygSBsn8b4GLynUpKQFOQK95w9McvkMEIhIE+2LDf8i6BX/4sO
	v8/jf/2Dwe9ORDmjYo0KHpO8jW1vWzzN4MzjwmqjWBFsIltvA4kxca8auLuuBTVSLpVgmFc
	cojlQfOeeg33WJc=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Fix the typo "untill" → "until" in a comment in pidfd_info_test.c.

This typo is already listed in scripts/spelling.txt by commit
66b47b4a9dad ("checkpatch: look for common misspellings").

Suggested-by: Cryolitia PukNgae <cryolitia@uniontech.com>
Signed-off-by: Ziyu Chen <chenziyu@uniontech.com>
---
v2:
- Fix unintended whitespace removal in the comment ("we're killed").
 tools/testing/selftests/pidfd/pidfd_info_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/pidfd/pidfd_info_test.c b/tools/testing/selftests/pidfd/pidfd_info_test.c
index 6571e04acd88..8bed951e06a0 100644
--- a/tools/testing/selftests/pidfd/pidfd_info_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_info_test.c
@@ -229,7 +229,7 @@ static void *pidfd_info_pause_thread(void *arg)
 
 	close(ipc_socket);
 
-	/* Sleep untill we're killed. */
+	/* Sleep until we're killed. */
 	pause();
 	return NULL;
 }
-- 
2.20.1

