Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F9A4915B5;
	Fri, 25 Sep 2026 13:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344120; cv=none; b=BGuzQo+OX2MgPJ+1/lRmbuC1X6LDUN8G2BnmTJto8T9cyGTvHVG4GUZW6CwC0Vz9dBBYB/T5yRNPBrNOXGwA/Kmbrb87bOCF8sBIhoOCPPcRuw4bzUjcSzeqNGvmUeo/DuFeF3kmkjUFnJfkRrfW9aDy3apFDshYlcPo2ZSDyRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344120; c=relaxed/simple;
	bh=VpTzcg2CAowEAKC6QwbmS04SNdAc+E7hNh9mZSzzr+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bb721Fatt0igZ08b1IJh8zX2ip70XladLXTiOLPshdUuJHsrA+/SJZmE7PHwycRdni4qVsL7Js8J1gC7ytUIYqaQVOKW6r3y8ym1S9FgMS5uuWdwTwS8QvYJc44OBbDWtwKLOHTp9US3KaXG1WibF2F1JHsjr5fC6Db4AktQkWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=KjCol5h8; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="KjCol5h8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=fb7VtPGWCwR8bWkcfSX45T5sIzVRnMt4UbiMnUfo+10=; b=KjCol5h8+fjn
	ce5B0iuxm2zf9/802ie35zgar9Kv8wAcpmD4U6WE12tEieB5TZshtB0Hd2b6vDEWYBzZYAo3bxEis
	wgeBLgjv3MJFydfCgq7p0Eks29gdAsOAuRdNT4dq6R7h4hwu/UxPF/smpofezKqRO5a57ct+hfr3/
	z/RnAaNFFQ/Rz2hDb0YVxuZatzQuTNv+BYO6y7SQkdYzefEBOc+eaXKBkdWacODuNGXX03+S6py7U
	S4sqzQCeKVtw/YV6mr6AlWfEt++lF/T0WZ+SM/yIYiEFmiJL9mI4f0llcwUx8dCcHdSwtdI1s6Pm+
	1Zi/+7RGTE0HOboCmt8cFA==;
Received: from ch-vpn.virtuozzo.com ([130.117.225.6] helo=LekKit-T14)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <eva.kurchatova@virtuozzo.com>)
	id 1xA6F2-008j6E-2A;
	Fri, 25 Sep 2026 15:48:33 +0200
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: move_mount_set_group: build the test as a test program
Date: Fri, 25 Sep 2026 16:48:16 +0300
Message-ID: <20260925134831.3641048-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

move_mount_set_group_test is listed in TEST_GEN_FILES, which lib.mk
builds and installs but does not add to the list of tests to run, so the
binary ships and nothing ever runs it. Move it to TEST_GEN_PROGS.

The test passes where it is run, so nothing else is needed to make it
useful.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 tools/testing/selftests/move_mount_set_group/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/move_mount_set_group/Makefile b/tools/testing/selftests/move_mount_set_group/Makefile
index 94235846b6f9..d54ff4787520 100644
--- a/tools/testing/selftests/move_mount_set_group/Makefile
+++ b/tools/testing/selftests/move_mount_set_group/Makefile
@@ -2,6 +2,6 @@
 # Makefile for mount selftests.
 CFLAGS = -g $(KHDR_INCLUDES) -Wall -O2
 
-TEST_GEN_FILES += move_mount_set_group_test
+TEST_GEN_PROGS += move_mount_set_group_test
 
 include ../lib.mk
-- 
2.55.0

