Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2A938A9DD;
	Tue, 10 Feb 2026 18:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749569; cv=none; b=Qtc+7Mpy2Ks+m3V/BRYOYSqKZmv3WiANsbjpyNlo0VQY5JwelnIT5cIWWOuHUnJsh/wm9H/Mf4mWx56yQlhv4fvQxnrxQUpwWzKZlV3eGK5YMx6QmH5Huq2kJpf/9kOnOrx5kO2kWeGTajR+O2gKsDfDKdUsluqhwbusoNRGJOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749569; c=relaxed/simple;
	bh=G7TXkrQJsk1JmPMjYZJFPIWS3m6sGwzCbf3vZhenM9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=esczLfiHx03/p+QT+iap1rRebM37nt9GaEADdrL+/qwS5baZaNuoMMXQrbA4O2LkYYtIEylzTL/CIcc0+H332G0u0BU1WAigOyQcfAlaJ/5VJUjL1qfIlNzdVumaJexanq8VBk1FTZDOdn5Qu9oqENfG/kKz3Ousky12kljaPGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=v0tZpxnE; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="v0tZpxnE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=FYs3poTOEENQZq14B3gNLG2kROdrcxGJuOJSja6n1fo=; b=v0tZpxnEUL94
	w77jAv7QyA+4AQFGqvljX10PVPXpntN5vFnqvEDrjLMFAG0IHiT+IwZMTJOwZi8Vmed7su5ozFx6I
	L9QGli5RbZhY40ach6ms7+Et9gfcmh8B8/1+CE3AeZG3nHsoHE0B30H2rqOZ317AuSBnvyyctUkaw
	qGNdhrKMpZBer+KvTlrKBH/qr2/ezz1lu2ibn0PkzL2+dIVAXNVU2t/y9qYLHduvG2564c0J76uHF
	rw4mSz4tYRUtcfblEV19CkmQmJ671JK2SgiHAcG5jiyM1oK3MYn2l/jSe3btX4hWFGo1GGGx5Pi3o
	N0UTbkq0+jHTrJduXUinjw==;
Received: from [130.117.225.5] (helo=dev004.aci.vzint.dev)
	by relay.virtuozzo.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aleksey.oladko@virtuozzo.com>)
	id 1vpsoV-00DI8a-2z;
	Tue, 10 Feb 2026 19:51:10 +0100
Received: from dev004.aci.vzint.dev (localhost [127.0.0.1])
	by dev004.aci.vzint.dev (8.16.1/8.16.1) with ESMTPS id 61AIpJMg480011
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 18:51:19 GMT
Received: (from root@localhost)
	by dev004.aci.vzint.dev (8.16.1/8.16.1/Submit) id 61AIpIiu480010;
	Tue, 10 Feb 2026 18:51:18 GMT
From: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
To: Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Subject: [PATCH] selftests: sched: drop unnecessary rpath from Makefile
Date: Tue, 10 Feb 2026 18:51:12 +0000
Message-ID: <20260210185112.480000-1-aleksey.oladko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sched kselftest Makefile adds -Wl,-rpath=./ to the linker flags.
This rpath is not required, as the test binaries do not rely on shared
libraries from the build directory.

Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
---
 tools/testing/selftests/sched/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/sched/Makefile b/tools/testing/selftests/sched/Makefile
index 099ee9213557..0e4581ded9d6 100644
--- a/tools/testing/selftests/sched/Makefile
+++ b/tools/testing/selftests/sched/Makefile
@@ -4,8 +4,7 @@ ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 CLANG_FLAGS += -no-integrated-as
 endif
 
-CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) -Wl,-rpath=./ \
-	  $(CLANG_FLAGS)
+CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) $(CLANG_FLAGS)
 LDLIBS += -lpthread
 
 TEST_GEN_FILES := cs_prctl_test
-- 
2.43.0

