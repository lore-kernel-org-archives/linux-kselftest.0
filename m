Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0DB345741;
	Wed, 21 Jan 2026 06:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768975461; cv=none; b=NYbKvcvH6AZjn1GZu0q2+fwAkgKZ0LiBCFQNkAV0nc+bqqokMPu/FMkBQe0CQarPaIHKB2XCJxgzDTj6HImGUu3KEzICMTREZ9QtpPD5oEuqcCYbf+TjFbriLpRHTFtxk60A39J/qcAnYPgMrsAMf8QhEC1einekivtey/jKIko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768975461; c=relaxed/simple;
	bh=HJa91ZxlEjJzZISYk7XQqUSOnn6k9suF/fM/JipaFwo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dIjix7fC8SL9OvhWL2Po29xXGhkdGpOLynriuttzmUbx+IR0uzIMc4bU6jaP/bN9Z/75um12H7/O5mgxFXaaHCdgOpk9d9EEh1j8OR9YTKe13rRaUCcKVcPWNbG77YwR84cFl5FMdWUt03BtvJWol0a7KJDDoJfaeNJsg6j613A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=j5UxYT/O; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="j5UxYT/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1768975436;
	bh=XdeFuN2Ra8L+JrB4eCiisPKVX7WL6L8SDPJtOS8Su0o=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=j5UxYT/Oe4cPW1x+F2aJzUoYFhHSDTXl+sw5i6z64phhlf2MME8o7khV4WjOdIp7O
	 Wl3zw0mtZjjbJDdA0cybZwuUamhgdTE6j6dR9obJWnnzpktqlCAHFkBX5m/USYKehf
	 uBsD2BbA/jbsJaII35EiE2H7boLdDHB4zr5XXZ68=
X-QQ-mid: zesmtpip3t1768975424tcc240ce3
X-QQ-Originating-IP: GU256iSu2Kttrgm3BPDt3PFiif9i2w7numKRrvjzzPQ=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 Jan 2026 14:03:35 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 885561702251252233
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
Subject: [PATCH] selftests/pidfd: Fix comment typo already covered by spelling.txt
Date: Wed, 21 Jan 2026 14:03:33 +0800
Message-Id: <20260121060333.4160937-1-chenziyu@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: ODNGLIKlOsf41mUzQlI6ARrZXLlBLVmzBTUfa7fIk2xDQZS54DADH+NG
	0iMSSm2oPbyH0oT+CeBlLTg8FDGWlhlE04upchvaFMH/5RMo3Llmt6S2qIs5vjjRlnW4PlP
	aHWI0usDczbVsEvfd/xXoipktU+QmO6C2pWx8P07paj1zPPQuHxO7fTmhJWjnrGVnNHqmC3
	KUSSj4wVgR++OZ28IfQAAdkt9lOxhGpdUBUI2p1cDCQpSZw8Qgu5YgcUxodjsa71TjN5VGr
	ukEa0Df9r0fYhMRScGMjyMcuoG26zSAZwKxDuWa+0z59G9bdrNdzmyhPnRuUrTRlRSXgzYW
	4bgKWO9jo138ZMfwn6SLM9eAJA8gSqYzavYDEMBm7D8NMhxwS6mJjjtFAkT5v8no+882UkQ
	hObac1GdLfG0kQfUxLivgTkKO/TSptO+GAJAVaaoikCNBML6kzwvJbPZPF6lRCDjtYtnKqN
	eH5d+5LEyMwuD6v47KArHb7DXw33bhYuTPADDw3RA3n+bs4P8XpC+gtcgR2OYldQ3w3dVeg
	qDj967fVQe/qPX18ezzyc4HA3j9b88NDxTlXfqu1ezZzlVQGVxwh/QOeAsXO09ks89tsuwe
	mREZeICteyrjttOQN4zhzk+k2hh37PiySKRAH/u8UwLe1PLrFlpYD5pwe7xD5aKuxRk11Sp
	+412kfVZc6mW+aQbbjhkLX2TgOks/DQcR/QsbMA6y4eWmbMi9WoumqEpEI1LyMJu6dJm54U
	/k8Z5ljFAkGxJ0gaAsZf49ryYCYc8sKp6K0gKkXNwaoLEyNqJ1eTjq05B4LH7vkR8m/26+C
	hNNWywh8Ebz5XYkLzJJEQwgQ0ATVYN7kSATQyuAs1aYGnHi/t9FH+jTMoo/Xhqur8pZEIvR
	fFoh1/tVdlG3Khdqyoo9ICRh+y+LwRzd/2QwZRTI0Y1VFMfe3SpIEYrBo8LodncwT/whH4j
	QDG/WUTWsvu60qm/iBbqPT8uDqIRQwy41NfVmAnODXbDQlJnbX7Q+gZAORW/XjSvc2UsT6e
	NNFTdwN0ST1nb+4VF0ZwNczaJrGl51fsWHSToGhZT89KMYzy6e5qFC+3jLqSXIdMY1Dzo2I
	UhO0uBSebNMYtZ0ttQZ/k7SKougcsLtOQ==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Fix a minor spelling issue in a comment in the pidfd info selftest.
This typo is already listed in scripts/spelling.txt, but fixing it
locally improves readability and avoids repeated reports.

No functional change intended.

Suggested-by: Cryolitia PukNgae <cryolitia@uniontech.com>
Signed-off-by: Ziyu Chen <chenziyu@uniontech.com>
---
 tools/testing/selftests/pidfd/pidfd_info_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/pidfd/pidfd_info_test.c b/tools/testing/selftests/pidfd/pidfd_info_test.c
index 6571e04acd88..be4eab64c4e1 100644
--- a/tools/testing/selftests/pidfd/pidfd_info_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_info_test.c
@@ -229,7 +229,7 @@ static void *pidfd_info_pause_thread(void *arg)
 
 	close(ipc_socket);
 
-	/* Sleep untill we're killed. */
+	/* Sleep until we'rekilled. */
 	pause();
 	return NULL;
 }
-- 
2.20.1

