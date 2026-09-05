Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7441F453A4B
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 10:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788604878; cv=none; b=jiV71MnXLsXvJSc+LP7QxyO70t7q7LBbLK2ZeSl27kSUqIEv3OPMJABtk5IwF96gFvgRyjdmPCVH5ml11l3L/QR2WA/ABX+gFknhmB7BoW+dtMe1eATuu6GwBEDiivAugwZMx5tnD/5HyTXdfWnjDL0VCPrlQeU6uQOBiFXVOyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788604878; c=relaxed/simple;
	bh=3H7DWsjdB2t1XmW+qQclm6nGtSHSe5mjsU+kx9BBsDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kj+QSTJcyoma/cG+aDziL5gNYAeaKI+24I+XbggVjouX1/qp7T8R+p4PFJm01RPvZrO6yru9W7V5oL3NHNeLMIO8ce4NCpydqv9OhCWpDgBNe4/VF53B3f5laa6y5ADFCwCFOKb88zO7OsjkeryWBvYxLLb+WvnoXcbPdL4M/pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ox+SKv45; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ox+SKv45"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so1336225a12.3
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 03:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788604867; x=1789209667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9d1us5ou1/R6dn+w5YFLXgBK3EMQL/jKg3S7fI7Edk4=;
        b=Ox+SKv45BlaCEgLEb11cuz3fFHPGcjrNp5+W59jn0QCLx7ScN0xBi8gARYNmidb9iM
         YSIfySIz3j8o9LU6RWKcKs3/YcIYecNaE4l0Cb09pykqNr92+mUEQOpUpZg5ynlQZuM2
         lILrZbOqaiKyIUsyPx3OJ8Ynq9S8LcfwjQUrprSadJjI+m3nSNPEO7tHOAFTHYeLzuCI
         t1aSYao4Md0PGLXYGXaVSN88rheZJDNtQh6PT1YhzKU2x3B3gxMoy9me7jmSskVquWn5
         BRsvb1avRdwlV1RMXMbCsB34cv7F4ETuhDFVXeFSyRDGhclxkZAZn5/udKBzxEQb8/fc
         WkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788604867; x=1789209667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9d1us5ou1/R6dn+w5YFLXgBK3EMQL/jKg3S7fI7Edk4=;
        b=ptD+GtGGKp7FNH97omJb2zCrV2qDgF3AUwvojX9Zoj+p1LUmElixQsUcVwTiVEv03B
         6t9bkQ0hYc7kN2814OCxJG71FdAJPVjlpisSZcOA5EYiij/alH6nDIRJM+wGOeWKjir1
         plyJY9pOp1+FJt3k7m7FOww7Mu+tISSNXyO8yfpfaO2OM1Axe+1n77cQV1PGO1k1kymD
         zDfEPcCPSuPGg74hlC2horGb7hR4adn7Uuc3dsBnidbUDzccoU9F6g111VmC1Uz2sXR3
         +8vG1BrTkvSH/tSMpqqvGYSSoh8sELS7OCN24co3RL+KvNuSnuhw/OSu3iK4BqFW7o8h
         +mAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlbiosSTQ5UQnGIrmVPeEE9xZbpwMlauDQSY+1Rf1hKYj6XTntxPJ9KQpJ2wVbBDg4RURPg/b28BaaeFKVuAw=@vger.kernel.org
X-Gm-Message-State: AFuF++mHV0qw9VZ+tDkMkpryJ+TmilszpzY1FWvguxv6ZqRoo3QiS6wb
	uEuGx1lvQL0K62FHIVuL5HX8nWVbi35giOQL2wBTDNPTnw2CnIzGr4/q
X-Gm-Gg: AYBFou2g+iadCV7191Oi/pJZyn+WuIJyYgoMyY2gIxzYDWXSeF6dxTbenOrsqD+bLjH
	w8oq1xN+yqBIvxSEw8fimIbA1o6d0gC7duH5eauSt2Sc/j2CwnKveYyLrrojtxtXs4E104UsgoI
	pWZD04M6/8MzXIywQJkRMnOiFlhoojl6EsADfTIg2TOj0p7a79m1pDbdQMdDAdX6SpAquoKumc4
	5kOQNUkwzd4TgJF5GTtI4nDbf5rw0RUI8dr8zNfc4BUqZ4N8X7+Fshqe7xLkvfNbRdCwc4JE03e
	ulIggM6Ej8evOi0ETNI2y4Zuxu6Dp965tQVpMoAYFFgvu460aBrxtsTe0wG6y4YasotC6ET8NSg
	FcBJwfgCASZaVyD895NFlAemTdAiB9rEl08v2YBwuH5y1PNIxCEnCBWJjYYBT2uPy15iJ6it+t/
	WStaaiLnUpj3409HWIZBTKsuMpuOgOPOPrePiBMdOXeLjZFcVDl8Ossg==
X-Received: by 2002:a17:90b:2b8b:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-39b26272f0fmr18850197a91.15.1788604866501;
        Sat, 05 Sep 2026 03:41:06 -0700 (PDT)
Received: from houminxi ([154.197.57.228])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm13559776eec.19.2026.09.05.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 03:41:05 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	dev@openvswitch.org,
	echaudro@redhat.com,
	edumazet@google.com,
	i.maximets@ovn.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	horms@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH 4/4] selftests: openvswitch: suppress pylint complexity warnings
Date: Sat,  5 Sep 2026 06:40:26 -0400
Message-ID: <20260905104026.3776396-5-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905104026.3776396-1-houminxi@gmail.com>
References: <20260905104026.3776396-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add file-level pylint:disable comments for warnings caused by
pyroute2 framework constraints that cannot be fixed without
restructuring the netlink attribute hierarchy.

After this patch, pylint reports 9.93/10 with 10 remaining
C0301 line-too-long warnings (81-89 columns) on f-string
constructions that match the surrounding style.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
base-commit: 9eab111e765729e93087ff86a2ec9b2ae42d0fa5
 tools/testing/selftests/net/openvswitch/ovs-dpctl.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 5b29aeb4b50e..5948471ffe63 100644
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

