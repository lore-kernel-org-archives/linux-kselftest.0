Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248333546C1
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 22:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818863; cv=none; b=UX+YhNoyXLpogqpLQVo/6ZElo1BnEcL6l4CQxYKO5Mv6QyaZCUIOSTygFAs3bzcNYS5JZzQNfdz9FGrXOBCYrF85Voi4X4uWh/iLXdYE96u9YTqS1PkYytxD/KzYXXnKah34G0PaRJBNvqqbJRzMQ6+T7gjnStM1t4pPS7NPFiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818863; c=relaxed/simple;
	bh=K1O9/EWYo1lBKzj/LHkCxfQs/NTsRAdAcHbTyTiHha4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DMqbBOQ3eBjnuztwQiHQ4ZxOlDN1mX95l1MY80dz+DriX2vTAMkDRTMe4uRgzjk6ruIbZblEAsR66nlvQtSM/dtgXNLdWxmTFPJdOpZcUUdZJzRbfytDKz8BKW0w3PiF+zGWoLYV3ImTgsj6CWfivH7Pi72lSgPYLHfoN4Ur7nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSjZn79s; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSjZn79s"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90cbff85fa9so47702156d6.2
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 15:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818861; x=1789423661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zjx2cSG0Y440hHpGOz4TpM8YmWgHPJ46e1ZgRB1OX70=;
        b=RSjZn79sGCsqZi/pYF9+u7sA9BXaUN0KAsdDefYfPmdCg6ad2/Ghh1lDnooWB2rwLv
         1w/O23VxixFJibKag1v7uwA0UBr4F1jgQSXmplPY6hdfNwOwiMKNYqW42xLqLfD56eVX
         Qe0rYTCaqOh2ZkKbtlyCsMUb6OGeu4PVTU+tIt90FOHTe09HLhKpC487TGyuFhnGdF/U
         yk0O8VDi20PKwUo9QgqFOIZVqOGyvsFEKXfGOanv81yN6N3ghB1y8a5L0Iusrp8bDk7E
         Iaa43/I0T6RGYxq1FrDhROoHeoZeBwKDgie1bzeupdxTg9HjEJ9gVhLknK5kN2gceFdW
         DfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818861; x=1789423661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjx2cSG0Y440hHpGOz4TpM8YmWgHPJ46e1ZgRB1OX70=;
        b=cWFryxEyTEUKBHBzL8xL6I+SegRzFg/c6XyIojKJcEZEAt8XS8lY0pKag5oi4otkYK
         uyGlBBIt4mBsQv5XJuozaZ4Yzln1RVSCTLb9j1h7nHb2WzQlYbuFLaNFJRPIhhmvVibJ
         Zrnu+ctTsJ7DoqjIFidKKVrr0n/mi9rCwIXmWCvMCekP62We4IoYGkwOSy+8ehCUfY5y
         WhsfaDtxOq853wEYHjmncA8lSa7mPtPX7+RlGzlwTF+BprATkbdtmlpL2YW2ftba+w7E
         GbGRfdERrKxTu4fROgnDis2AFYbpXKOL3EaSIXRLggRJ71C8I6+pws1F6pNhlhGnf7O5
         fGmA==
X-Forwarded-Encrypted: i=1; AKwUvBxma4yCanRFhIY7mM8scIEimS3ghrpeBQbkMHNQnX5DANcoglm5/rxknQ18Q6s4KUTVP+Gxq6NQ2RCsKECpvsk=@vger.kernel.org
X-Gm-Message-State: AFuF++mza9oqF/Qo/bqok4XjI6ABm7ldfPDo9YxF0k0SGl9nmhJiCVx4
	nj+oLTEOYlehLTKBPbdKXweOHIIxGRdFoXzAZ/MgqhPzakbM3fP9UXiU
X-Gm-Gg: AYBFou3d6Mdminknbvs81gExEFQIHaO0ShGxILYqH6Ee90DhBRoqKgP2kUkpOb2uqwc
	eydkBUptkpMNq8eKdRMkpq675R49B4lqpq/o1Dv+lU8CgEcRoJ4IoJTK0446kgmJAZgl1qLb/s0
	cpgAguHjFBIy+wKp82EKcP7NVpES0K6/fA2Gz330Y0BHezD0/5pPNBWg1MRm6nUGcrKa+gJ5M6C
	jy7Q4IalLszFb9z2wAS/vYBqnGLucJxMc62NZ7mDoSm59swIAiD0dVAtH6RIGOdr/mg8sz4kfzY
	OGhe4CKw4nU9H67/+NjKvviRRPZ+PKANJVXglaCJ6F9AKXwiL8ek1fbyFany6eKo0x6GX866vd3
	k2Ivp94uHqycSsy9OgJsrXBaTaj2n+Vc/qLMTP781B0KvHyNXRzFsgJ5ACg1aNYyWHcA/sunKDk
	Jf1m+EX5J1hffV8tTyWwxtMvU3/7pV9ZGGEYesYadOO0GdO8ZZSwT2/Os+e7p3+gt+KemmT0ZCt
	qQtMasda7Yb508hgtjHoDM/X4BlYWELr5kVQEE9t+FnGLmQGh50BccDqgmeNfqZdrI1JQQwWnXW
X-Received: by 2002:a05:620a:3725:b0:937:3aae:1385 with SMTP id af79cd13be357-939803241c0mr2320238285a.11.1788818860917;
        Mon, 07 Sep 2026 15:07:40 -0700 (PDT)
Received: from philip-ThinkPad-E16-Gen-2.localdomain ([73.8.4.60])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b0493142sm244506085a.13.2026.09.07.15.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:07:40 -0700 (PDT)
From: Philip Popko <ppopko03@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Akhilesh Patil <akhilesh@ee.iitb.ac.in>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philip Popko <ppopko03@gmail.com>
Subject: [PATCH] selftests/watchdog: remove stale WDIOC_GETTEMP TODO
Date: Mon,  7 Sep 2026 18:05:56 -0400
Message-ID: <20260907220556.53041-1-ppopko03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coverage for WDIOC_GETTEMP is already implemented, but file still
contains a TODO claiming that coverage still needs to be added.

Remove the stale TODO.

Signed-off-by: Philip Popko <ppopko03@gmail.com>
---
 tools/testing/selftests/watchdog/watchdog-test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
index 4f09c5db0c7f..74a581250829 100644
--- a/tools/testing/selftests/watchdog/watchdog-test.c
+++ b/tools/testing/selftests/watchdog/watchdog-test.c
@@ -5,8 +5,6 @@
 * - Tests Magic Close - CONFIG_WATCHDOG_NOWAYOUT
 * - Could be tested against softdog driver on systems that
 *   don't have watchdog hardware.
-* - TODO:
-* - Enhance test to add coverage for WDIOC_GETTEMP.
 *
 * Reference: Documentation/watchdog/watchdog-api.rst
  */
-- 
2.53.0

