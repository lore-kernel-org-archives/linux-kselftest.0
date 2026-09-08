Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F35D5437F8
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887976; cv=none; b=N1c4z3SbYAjgHdWkUB3YzN3s+NwU+/lovc3QoYyrX/p5gIjDoBIGFphLMyTKLKMYUsvixy985g1CsFuqPWx6dF4bDNz2TRfjCx250YfHbutIKHc5DdV77qnvFS+FdS9JWYjCbzJD16EigBWi/vSCK4EflW7ALQ2TFRSx+fZeGI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887976; c=relaxed/simple;
	bh=f9Z1FJijA8EzJ5galWwOtkmdX0E+PiuwhQ6tFxw2D+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xk+DZe8fFP6R83VjxpgJeOA4cum02UAtDiUsQn2TazeGXdHwJ9gNsbk4t0450EuPfFLdSbg5VZRRxLt0pogJV+vTMKuE4fCGczqPC5VRDLz+Qyoc2ajx/26OAD+GWB1RjnivUoH7oSrM/UgLSmD5m5Cs3mpfH4RM6EXVTjVVQCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSFlzCPR; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSFlzCPR"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c08df8513so29750401cf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 10:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887974; x=1789492774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMrY744BXEZak8MUHT+RAZHl/UnRJ0zoUGP6YjdmxXw=;
        b=MSFlzCPRb+TdOvM2TrrY3PWwviJkVn3v0fea5QgBiFC3sxHqw+QR7rSF0nMKmyh7ot
         U3jjKGrMb2fAhYkOLonFAFEhfE7ULzoNGT6uIl/sQwqlmokg0Wn/dQonjHtsM+mgwApE
         kHJQiI7timQLwYZu3wJhF0Au2yvSVvwb3O9dOSv9ZzIZlrWBUxEGnA7fLRZh4bHGKmPY
         wbAawAdc0g/2HTEJ/IPVn1Il3rg33OlcFnNqF2RhAKJeADOKVB8X1R7crtg4wHL4NHPC
         aWt0gPHSPiF4bF1YUN+CWegavGAHediUQMz+nwc0z5LB5cIpyeTyStstDTJv02EVrbQ0
         P62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887974; x=1789492774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMrY744BXEZak8MUHT+RAZHl/UnRJ0zoUGP6YjdmxXw=;
        b=GBt30h9vDal1TRXE2yNZiOEu5dMgkz3sHLjEj3KpzG/Yufsog0O0OZpLjU4M9rt8c1
         Odo4K38HMmM4Pg5b2lJD1S1e0oksvxKigJe9hwSwfRE58b4hdVaWqeS5WLs7mke3bq/L
         YqiXo/+xNOWw4cy5LoCLxX9344L91le/AEW3rIUwK6afSPK/hE5uYHxqBmZcpl8lELnZ
         3id7yS6ovVD34+1fMKqm30zqlQUV5OvFkZwYaDeedMONv4ffTYFQWLMExXYSFcRoY36r
         WAgivZgpf12mk/TzUQ1kIYA04v0B1W1hd09yeyXY6sNyT1aFFeJXQk6+M44OSTRefwaN
         bpAA==
X-Forwarded-Encrypted: i=1; AKwUvBxT7icPGY2v3bgur7yG95mWnoMazEZkKSnxsMh7iVwFdlCoOOCcV3zmzqJUcG13IKK9iPj3gfxyLI4/ZOdBFgE=@vger.kernel.org
X-Gm-Message-State: AFuF++ky/ccrFnM1kG/oJ6oSWZXAld3SBRwWuOjPRZhmgoGKD5xK9hys
	BV6VxwGAOx+BkuXXrZLaeZyJwFQSGGfFP1hIu6uwipnM9f9SsdzRYsV0
X-Gm-Gg: AYBFou2Sla7muyhVpbMLzGNWgncd7B+GjotmVsEijpAcUj1Xr2lpTBMCAd49l/9I4Ea
	woNWL4uoHVPuKZOloZacZjGEduiYHkgfFzFny0/30TPI3E7Rn/vDvyZ5QEwJMYwwiO7vnGBu4wi
	wL2oSezzL92WzqVBb+tZt/krnON7LPMA56dypLWMeg5lMIrrwvCWY/4CqwwqsdtzEIrNH8h0UXU
	PtaRDf97H+tRCpsqgLxzAhjbIKaYNgb1VwWWbLewN2oFSlxo9nqN7IW0yCIpwsPPpXkV6j/5W9C
	qZZbQQGmwNajyYG4/oLw3tXIpBlC4wXoqtFOAJUxkWzbZSoMVml6AXXV1adt5m3zZYEwxcdP4HP
	bpkAQnqtq4EMD9Kf5/3/Sz0mElRMCQh0Afux8HxgxtKR8dDax/tfsb2nbhbKtwdlQCnJjgGcNNq
	+g1K9ioblCzLis0coxJfAoEMXSH/0yIHH6hJ0STPfnWXsriAYX8lrxObE=
X-Received: by 2002:ac8:5ccb:0:b0:528:38b1:b54c with SMTP id d75a77b69052e-530547d39bbmr379290841cf.2.1788887973659;
        Tue, 08 Sep 2026 10:19:33 -0700 (PDT)
Received: from houminxi ([104.167.197.198])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530541c94ddsm120081361cf.23.2026.09.08.10.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:19:33 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v3 4/4] selftests: openvswitch: suppress pylint complexity warnings
Date: Tue,  8 Sep 2026 13:18:59 -0400
Message-ID: <20260908171859.1967327-5-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908171859.1967327-1-houminxi@gmail.com>
References: <20260908171859.1967327-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The module-level disables cover complexity and structural warnings
that match how the tool is written (large netlink message classes
with long attribute tables) and are not worth restructuring a
selftest helper for.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 tools/testing/selftests/net/openvswitch/ovs-dpctl.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index dc88cb1b20c13..7ea0d52044011 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -1,6 +1,14 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 """OVS datapath control utility for kernel selftests."""
+# pylint: disable=invalid-name,too-many-lines
+# pylint: disable=too-many-ancestors,too-many-arguments
+# pylint: disable=too-many-positional-arguments,too-many-branches
+# pylint: disable=too-many-locals,too-many-statements
+# pylint: disable=too-many-return-statements,too-many-nested-blocks
+# pylint: disable=unused-argument,broad-exception-caught
+# pylint: disable=no-member,not-callable
+# pylint: disable=non-parent-init-called,super-init-not-called
 
 # Controls the openvswitch module.  Part of the kselftest suite, but
 # can be used for some diagnostic purpose as well.
-- 
2.55.0

