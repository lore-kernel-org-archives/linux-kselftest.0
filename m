Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95373FDBEB
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 18:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778868510; cv=none; b=Jah0yMTLzQJhQ9up74m7WHvcPS0iwgm7gIwF1GV0D/XpT9468j1frfRqUkqnEhbTBvtkxdRj49tkn3oZ6fWrLME31LMqOFFc899ocDRUTgKx65bFFv7a5ySmvoY+bQnQbXqRtASaPS8JkIATF63IyDe/dEUuikpxszMDHjbxhu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778868510; c=relaxed/simple;
	bh=uZ7ygsnr96oe6CK9wJ9zGBwa1AUV6F/q7+OBvaywCn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WNgePW5Ia/ITkWBhZzBPwvW9OD4GnuoAmOmSN2jlxY94QOgDXcwFiTqQC3/wIFhV6jjx5N3xkAHiZxsjkf5Hmplqwi1cHq54rSDAauKDPjGLpYKTqBQcMLvvHJTTtkDLDLkd8Todhw2o77ZrZoON6sjH0cwZlP0avvXoESXkuKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0iYix8s; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0iYix8s"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b936331786dso3963966b.3
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 11:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778868507; x=1779473307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=la+O/bFtpnyaY0c5pxjy6SLIjk1Ilk22rZ0fIeKn2mA=;
        b=U0iYix8s4BlXPNZghhnrG2fXfB2g4UqzAjTJFPYT82FOcQ5WbjPVrMPQKmb1L9SjrK
         EO4omDBZ9OdpRa+vNTJfqWl1UXepKYlPSxTOJxeswmSu732E/5yzPGWzEfk2frDFmHVk
         p+C15GIfwSJcNevKfX+lUcUUzZkGWcQbfsfUeNNag0mom4c80kxLIIob/O5/twwQArpj
         J2ez2w9Kqh5PqYhcP22X0A9YX9+pWAK2gbat9rrFdbGgGqFR2gH9fyd7LNqBxwEix36H
         vnGo7CiMYVfgwKcOdWnJLxvxs4Gwg8UQRX6Ic06KonTylMPsFMpHf3T0vqJAD42DMMeA
         V2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778868507; x=1779473307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=la+O/bFtpnyaY0c5pxjy6SLIjk1Ilk22rZ0fIeKn2mA=;
        b=OSV8RgcSRSrRL2q91w92alp7zODvkrTNYDtHd+pMIuCZdCpXdtPEEO5Lp9Mx8KLUzY
         sMaaHWdAva3WjzSd6apwoR+ao8JtVK7manNZNE0Maqq2yUxAKF79rLcbrvoUOPye3O9a
         x+xnWbvt5g1nGHF900XBjTOOqyHLnRZGN9YvmUUjRsgleqbcEC+kv1O+7r5r+hAqOp2q
         gqcq52sXbooWIpo8l3NXhEM44Zt1C4PrM0Ia1if5zlxWPxSeF/+67RPqarzCdFHZQuY6
         RYTd6SzCw3+BlMRIDL9mldZmcXhpl+jXx33IqfB6CpDElDZIteG95LkqcPxdqxuMh+vL
         9pxg==
X-Forwarded-Encrypted: i=1; AFNElJ+DAJDxp6TY8ifi4I84y315w5hKX8HUoR7zRQNKAQi15MA8B5ITezjoXdFJphKF4udax8JIYZEMfMGfBdL71pE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx+GOcLgQhsTvi+Ab09Arf0wIhYGwtdVaN4zu28E/oW5RSFYXq
	CKlOGiBq6JrfG3uGJ+QHY1eClRhghYI89uU9dyXzOxZds34JmvGfZzy3
X-Gm-Gg: Acq92OEGYUmCwp0Iyx5UbYBWB03Xla3FqY7ZRibDvDPQA+S+kjMUGlqNyiIYAfwvSwQ
	26EneVLHCkANtMr33THDQYjePEs3w2M2zVx74wtY/erQ6jXetotSBg9UcyBGl/dvUWb5reZ26VI
	eLPEXL+8IEPiBdZnrcYYPCrjK5ZAhhmaVShGYyPjgCq2NrbvD6+vNGWQzDDtwxBeVcpUBBfZLzn
	ES8EG8mP6BQShPHqO2AUU62KZL/yuGP70yqjRAVPAE5jxrPMsatldIrForEhodkzSxgVPUEKFLy
	n1IBJRuAFRoloscIHHemnNb41xf5ICvfXuFsKpnwHdsVnQBf9hKRUJbEtVeElUpIK9NWnrIDENH
	me2rast8JuGKOoEnDBGhnpE4mwt5RiMBSX1mikdhRZJzmAUIppm3jRnynq/GrgiJiNdRWrYlo/A
	1K8NQw8F8EG/aD9QcQUJrhmAtOZ1LhsIBy
X-Received: by 2002:a17:906:6185:b0:bd0:6dbe:22b1 with SMTP id a640c23a62f3a-bd5177ec5dfmr278321866b.12.1778868506983;
        Fri, 15 May 2026 11:08:26 -0700 (PDT)
Received: from pc-oliwiera ([2a02:2a40:4bf0:bd00:6130:de6:bb7:addf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1bc9sm263471566b.9.2026.05.15.11.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 11:08:26 -0700 (PDT)
From: Oli R <sigmatwojastara@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display hardware),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display hardware),
	freedreno@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display hardware),
	linux-kernel@vger.kernel.org (open list),
	linux-crypto@vger.kernel.org (open list:AMD CRYPTOGRAPHIC COPROCESSOR (CCP) DRIVER - DB...),
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Oli R <sigmatwojastara@gmail.com>
Subject: [PATCH] treewide: replace /usr/bin/python3 shebangs with env python3
Date: Fri, 15 May 2026 20:07:59 +0200
Message-ID: <20260515180806.246914-1-sigmatwojastara@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use /usr/bin/env python3 instead of hardcoded interpreter paths
to improve portability across environments where python3 is not
installed in /usr/bin.

No functional changes intended.

Signed-off-by: Oli R <sigmatwojastara@gmail.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py                     | 2 +-
 scripts/macro_checker.py                                        | 2 +-
 tools/crypto/ccp/dbc.py                                         | 2 +-
 tools/crypto/ccp/dbc_cli.py                                     | 2 +-
 tools/crypto/ccp/test_dbc.py                                    | 2 +-
 tools/perf/tests/shell/lib/perf_json_output_lint.py             | 2 +-
 .../selftests/devices/probe/test_discoverable_devices.py        | 2 +-
 tools/testing/selftests/rseq/rseq-slice-hist.py                 | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 2acad951f1e2..10316f517a7d 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 #
 # Copyright © 2019-2024 Google, Inc.
 #
diff --git a/scripts/macro_checker.py b/scripts/macro_checker.py
index ba550982e98f..7dbb114a57d5 100755
--- a/scripts/macro_checker.py
+++ b/scripts/macro_checker.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 # Author: Julian Sun <sunjunchao2870@gmail.com>
 
diff --git a/tools/crypto/ccp/dbc.py b/tools/crypto/ccp/dbc.py
index 2b91415b1940..cd56a63aa8ce 100644
--- a/tools/crypto/ccp/dbc.py
+++ b/tools/crypto/ccp/dbc.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 
 import ctypes
diff --git a/tools/crypto/ccp/dbc_cli.py b/tools/crypto/ccp/dbc_cli.py
index bf52233fd038..bfe34f01e619 100755
--- a/tools/crypto/ccp/dbc_cli.py
+++ b/tools/crypto/ccp/dbc_cli.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 import argparse
 import binascii
diff --git a/tools/crypto/ccp/test_dbc.py b/tools/crypto/ccp/test_dbc.py
index bb0e671be96d..0ee3da6c6be7 100755
--- a/tools/crypto/ccp/test_dbc.py
+++ b/tools/crypto/ccp/test_dbc.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 import unittest
 import os
diff --git a/tools/perf/tests/shell/lib/perf_json_output_lint.py b/tools/perf/tests/shell/lib/perf_json_output_lint.py
index dafbde56cc76..dccafd507bb7 100644
--- a/tools/perf/tests/shell/lib/perf_json_output_lint.py
+++ b/tools/perf/tests/shell/lib/perf_json_output_lint.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
 # Basic sanity check of perf JSON output as specified in the man page.
 
diff --git a/tools/testing/selftests/devices/probe/test_discoverable_devices.py b/tools/testing/selftests/devices/probe/test_discoverable_devices.py
index d7a2bb91c807..72a94bbfbc7b 100755
--- a/tools/testing/selftests/devices/probe/test_discoverable_devices.py
+++ b/tools/testing/selftests/devices/probe/test_discoverable_devices.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 #
 # Copyright (c) 2023 Collabora Ltd
diff --git a/tools/testing/selftests/rseq/rseq-slice-hist.py b/tools/testing/selftests/rseq/rseq-slice-hist.py
index b7933eeaefb9..2c43b2e2bf0d 100644
--- a/tools/testing/selftests/rseq/rseq-slice-hist.py
+++ b/tools/testing/selftests/rseq/rseq-slice-hist.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 
 #
 # trace-cmd record -e hrtimer_start -e hrtimer_cancel -e hrtimer_expire_entry -- $cmd
-- 
2.54.0

