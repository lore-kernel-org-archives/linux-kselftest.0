Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7EC3BB9E1;
	Fri,  7 Aug 2026 22:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786140988; cv=none; b=tez2gME6G93k3fp5sNf1CCdQsBSzgcYi6pTHzQrWlWL+xAsd+Ete8thEDfeJfMLQYHDONPeLSXzT8iHRFInMi8bQrpb+38Ox4WjfD44JNqM+lbWw+/VBQmLfl5nJsPDgqaUmLNOOg6VK7LiO4oBBwEq7ZeGJd2InS6l1p6Q6tDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786140988; c=relaxed/simple;
	bh=XzdZgNj42FXdFPBBfkatrrkmMdcbF828JQBV4Z140Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VlrYyjhUzVgv+dyNm+stKDQ/mmEBLmmTCVK3RygB0UFGptNYlE8IJ6XMeTTfYjmAlt6rT+mkzlZaoE7k4vMAapuuxM6B5O4nyHFcOjIIh/PZd1OHerXWOtriIDS/g6JHOZTI6/JaPdNOVXgB1eODtp0TmFCdfCa8Mr11AVPf0SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcW2MqHp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcW2MqHp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74D51F000E9;
	Fri,  7 Aug 2026 22:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786140987;
	bh=H6viO78zkue0BwkFP2Ba4VC+7mxPN5fyGC+OMVryzlQ=;
	h=From:To:Cc:Subject:Date;
	b=XcW2MqHpLbieS5i2XDpM90JTbdeTSnc4XHgvK/nO0vh/h5lKF+lDYWP1SY6/VqywE
	 6XtpTtutaRjsU2fVAT/7mmtWL2D7B+YsGXiwliWDXW/Fvv+8C/mJ9n8zlozfMtdX2W
	 Olfmo7BigPWaWYH6vytB06gdOuKIIlP3dIq+RXCijZxZL0FpOeqz4v2JkbowRo03Yc
	 XaZ5Aj1HTK6OoYYUx9VEvTjMGbyPC+ih06jVvEzqadiBi0ppcGQAyKIDr9xkiVD76X
	 bsxoBH/fe1dtGRPcsuY17XqTJtBrngXjUCYjkTpNtJtVMOdBhAEDprqhKqYeMO73Ak
	 0iM59BQWgY7kA==
From: Jakub Kicinski <kuba@kernel.org>
To: david@ixit.cz
Cc: Jakub Kicinski <kuba@kernel.org>,
	bongsu.jeon@samsung.com,
	shuah@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH nfc] selftests/nci: increase t4t_tag_read timeout for debug kernels
Date: Fri,  7 Aug 2026 15:16:22 -0700
Message-ID: <20260807221622.1727540-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The t4t_tag_read test occasionally exceeds the default 30-second
TEST_TIMEOUT_DEFAULT, triggering flaky "Test terminated by timeout"
failures (~4% rate on slow CI systems with debug configs).

TBH this is potentially papering over a real issue. The test usually
takes 7sec to finish, with this fix it sometimes takes 37s. What
happens when it needs extra time I do not know. But the upshot is
that it used to flake 4% of the time in NIPA and now it passes
(200 clean runs). So unless someone has time to really dig into this,
let's silence it?

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: bongsu.jeon@samsung.com
CC: david@ixit.cz
CC: shuah@kernel.org
CC: oe-linux-nfc@lists.linux.dev
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/nci/nci_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index 312f84ee0444..77344227dd7f 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -836,7 +836,7 @@ int disconnect_tag(int nfc_sock, int virtual_fd)
 	return status;
 }
 
-TEST_F(NCI, t4t_tag_read)
+TEST_F_TIMEOUT(NCI, t4t_tag_read, 120)
 {
 	int nfc_sock;
 	int status;
-- 
2.55.0

