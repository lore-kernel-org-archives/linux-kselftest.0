Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F143D8132
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 02:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031067; cv=none; b=mczqw0AcMpc7kSewPMXcXQhAXRm0gAjsrJt3GShDlNbF8eLhYJS3rW4+beknEGN6Hnuojx9GN2pPl/LFWvzIroFL8bsx2m4mtKPsNYfUpx2Q6g+I3LTDCboRlMpcwf976uStFhoGAiTw/qgSGmhb27NsX3VrgID/btaV0nh4lAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031067; c=relaxed/simple;
	bh=KFkTlUboSzZbF/mPRaunuRcT5moLJ30RQFGCjhzRoJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j6KLsN96veNEKi2eL8dkNGiitvh5qbWVm59vjKiat6sZ3qR27AykakisPYoEuxaCAy42AxufVqBEPvwe8elNQLd54gQirJVlHwbMPqhyxniSoUVYTnz8sbjDnZUVPZxOfAHQ/FrUSGb/2TwSRaRs9/13k73locLTf/gnnur2/P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTY+Tn0I; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTY+Tn0I"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso2621756a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 19:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792031065; x=1792635865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RiRTtTPlWRafdFL0/1n5rOtzrGPreou1ymHMTLM9OmY=;
        b=cTY+Tn0Iz8z7D1fixzWeQW1MCKI3cAHOXvrvzFiKiIEmEj2GDpED2qeOHVkMe68Cp7
         6qoG+g3DHpqiWcg6y9j2Jp5bChz5bmdo3NALvTqvCfUanDaHVhlv3Gk1RKNZ7lB+uJxj
         qaIanFC43DGuhqvuz9ilFm7VucZd/DS3L1cHAmzXWsr+vVouulVfYRvmZ5MUbnx34WYK
         pHa9kLm+kF6OBd0/w8JDJNumez9F8R4k7eZjJZM+xjl42pgeui7HKJGJMcY27KvLH+cM
         FZLEqPY1InI+w3gw/jFWcX0Fka5qGHt7BqnICCZXKQEC5MW6teQerBgqEWPSMMhIAikf
         zPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031065; x=1792635865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RiRTtTPlWRafdFL0/1n5rOtzrGPreou1ymHMTLM9OmY=;
        b=sAnHyxnCzTdOMDEXYiOFnNMhVxvSw7NKCC5QyZbD6uxBtlo9wFRgVutN/zfHt4Mn0t
         A9RxG/ltBCnIwYrlgTawB/QOfBKPU3pVO+0MmORchRu7djxZD0CzjtkKRa3yOmnXjxVv
         tW2MhHDYVyR+2gatOCV73UeWZOQcVhG0tjWJX91ttJzSkrVwxoEmilLSuQekxiGWiInh
         aG3QS2OqyPNch7UlTVOBY40c5JHfTg2Rqfsm/Y/ZBwQubDwD9b1bJ+eV+zAbJrVGiLlA
         VEi/UxJdHzoMkqqvdVyEhpLyO0EaE/XTogny7oHGypMl/K25Rv4Sp9Yu4FtnzotqDBpX
         5JWg==
X-Forwarded-Encrypted: i=1; AKwUvByk3mi1qUD9XYuJG8eT00rYtVCvTUXjBWpUACp6QUqdBo+HjAOkfmz2pOL3w0L5t1RbDy5kHMt5gK0IUBt2USE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJahQKPEJ3VVqdhStV+iRNXO69bERqRtyxUJOHu4SCQsy0lRFsc
	oRYjAUy53xDQu2CfzYr7ReDRl8dHssJ6ScgDAAt6zNO/v9exyHbMOf1I
X-Gm-Gg: AYBFou28GtSJ6jgY+YmRlIgft7LVMVARa0gpNVoreKaQanm9LKxJz1hLqE31Jtjpruy
	8EFPJuEyPRaOjI8tHjakxaSuQNaLPdSNJIx+gaNTt4RWZH1C5njvmwK4rF787V5w8TPNYMOxA7X
	MQg949nKPrNtjXkk4IH0k7lndY6+8iKVT3WBA/etYXfDJPjMnj/Hsdt2L08tf8hM7w0Ss7wSsNp
	/EdVFCvow0lErNTx/UZf0tfi70lL7ldWarx4kWq1dhc6GlAbEGaZ9PGIY2o5SrkVLCQzEi/W2FM
	9FSE4vu4UldFDCIosRY+AxMF/tgs0NfCyX76+QH84UBJz0xV9jrCePuPwzYbm6I6GGg/BsBbuPr
	VvSqSOFKgaHMCn0GVDKMZuL2rtkZyOcynBQbjChOusSVVma0PPCygP1P3/RxXnL+cDgMQw1EFYV
	YBZ4GhCykOBD5kx5C6kpQwOsMIS5kPIkm28G7r0SQg8OBdIAlWckTuS5YVwTgmf7AAkmUN
X-Received: by 2002:a17:90a:4ca2:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3ab70412990mr9429218a91.41.1792031065580;
        Wed, 14 Oct 2026 19:24:25 -0700 (PDT)
Received: from localhost ([211.249.71.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e7311sm1944388a91.4.2026.10.14.19.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:24:25 -0700 (PDT)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/ftrace: Add nice dependency
Date: Thu, 15 Oct 2026 11:23:39 +0900
Message-ID: <20261015022416.43534-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tests use nice but do not list it as a requirement.
Add nice to the requirements so the tests are unresolved, not failed,
when it is not available.

Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
---
 .../test.d/trigger/inter-event/trigger-onchange-action-hist.tc  | 2 +-
 .../test.d/trigger/inter-event/trigger-snapshot-action-hist.tc  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onchange-action-hist.tc b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onchange-action-hist.tc
index 55ab0270e5f7..04e6db2a734d 100644
--- a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onchange-action-hist.tc
+++ b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onchange-action-hist.tc
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 # description: event trigger - test inter-event histogram trigger onchange action
-# requires: set_event "onchange(var)":README ping:program
+# requires: set_event "onchange(var)":README ping:program nice:program
 # flags: instance
 
 fail() { #msg
diff --git a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-snapshot-action-hist.tc b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-snapshot-action-hist.tc
index 9eb37c2fa417..64bb0dca7e3b 100644
--- a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-snapshot-action-hist.tc
+++ b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-snapshot-action-hist.tc
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 # description: event trigger - test inter-event histogram trigger snapshot action
-# requires: set_event snapshot events/sched/sched_process_fork/hist "onchange(var)":README "snapshot()":README ping:program
+# requires: set_event snapshot events/sched/sched_process_fork/hist "onchange(var)":README "snapshot()":README ping:program nice:program
 # flags: instance
 
 fail() { #msg
-- 
2.43.0

