Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F34A38F24F
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 12:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778674446; cv=none; b=TAq+AdLgJy97m8jHfuhsEW/drzrnE9ryLN986KRPiinLEnMbE1Tbg3lfCwAMH7jPmdLCONq5TPZqYGmZoIjQYOIKFt1ufnvTqXV4N4sIVEhG1lZhoEAAWUOp9Q/oi6va0r6zrZZQ7YNvUlwmVGwwHd96J5OBo8ZAwVf7+D04B0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778674446; c=relaxed/simple;
	bh=Jz+bXsVftai5v15pDprSSH96Ot4A8L6ynecxAQ5ymGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WH2k2ZkECw57NvcEOm4S/S1F+zbHypP9H7wUKsIzAcA5b/7C7DbwyMHtwtB+xn3ehmrURPh/4U+Vo1Y/NukqjBAQoGultIruHCYoFzcohi2GZIVkkwNufTiwakR8+gUf7zRe9m47WtkcoyiHZvKD2roIscE1pYzSkYaKy95f7so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7+gSeH0; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7+gSeH0"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dcd17e19b6so3790227a34.1
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 05:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778674444; x=1779279244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKna7861B81bSrMUMezEy1EFlgsYPylTedLt/tHntn0=;
        b=Y7+gSeH0Kz6IGmhPGMyryzobSFWSdP0P4wyBhIjKCsBKCn95V2zeIZa+fvoKEC5U9y
         E9Q8xILvBEji9f6EH7IheQAd2JoNJbXmg6cNDeAd3RCXdxruWJbaEC9AY6sQReJ8ugYV
         OHsSCYnhf0vDnT5ntyWHPHKvyfgIcYQQ70GyRlKTsgc72W88XTkbEX2+ikv05xhTLy3C
         jBzdBzOLnyGyBSICYhZeGn5xvSJq3YA/PR2qO5E74EMwBXqSRwWemMvI8dRoomaELHV2
         T5p+2DvbsDH6Tc3ys+dF/8JrvV/eJDC79+kBL3jcxuFdoZuIivl5rmMTDF+zJ8XZoABS
         G9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778674444; x=1779279244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aKna7861B81bSrMUMezEy1EFlgsYPylTedLt/tHntn0=;
        b=KDJtSSRzRdYaK25yZ6MSP6n+L9Sh7TrxiGU1Mq2aeqhYr5Ma9mMNP4KkOHfD4JdtU6
         /orkVA3Z22WHVFrClO2yCGG9aUskhx/+Nj6NITqt+33yBjjDIWEgvCFyw+dJDrIk0G/j
         buYVofueNOUbhi7NzNw1CJ9nNhY5vdRa7ecBpopr8cdHcsYbpYPsn6WARaSSmgSxins0
         7HpyGJIS1SuoCAZT0a0jsFFHuzGX12TwDKbq5af9HRtm1D5kJJuZ99Qerl3e61ezAMxN
         RJ+MqbB8gO6g/+UxEkd9VXSJtJBD3Zex5OZ8mjqUhc981sG70YiB3HBIAsf5Y3/6RUbm
         akzA==
X-Forwarded-Encrypted: i=1; AFNElJ8bdYt+6JNBw/CseickrZp8fnT09C8y94N09gXXorzJh4EcWwiGSr0N4jbgv64DSZeLF4zPsIeiaWAeznY22FM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0zK7baisvic9hZvaugUlU2WQ16rSvAUaSEnX/LxZ2N4LGlWHw
	pdqLVDMgbnwep528Ndb0sivpsqS5gl8sIk9esksTPmcJu3OSSFpi6aX8
X-Gm-Gg: Acq92OF/gpsvfkXMgDU7AifSMXNDAHy8+tOnr7NZO/hBCeVLxlF3rBB9d/qJk4dVyAe
	p6/JQrWDRk4Vi5/h5RbRzPeVDInPD8QXmNn52IMaEUihYoTngie6ybJeaL6QtUY0rt15xJYQ8aG
	nAy9E0IE3sTp3RhwkRbI6ZlaRk75ojcvwDXTIMcP6nIn1Kft1RKXrdxiPL6nsLZiLmVljd4rN3y
	jE26mSq7oyrPiZUxCLas09KebSYcOlevrPT3jyx0yUFhbzF1JBTDbim9TG1nYHlueVvfSGd2+kD
	z03pC7WKBr/8TXaMXdi5mnBuLyt+m7Si/vPYppYSW2KwS4cY4DKbmjFiebBfonMaMEVvRlM2PND
	lUOFhYCde+9fc6ho9h3m2VY5rbs5COUUFQmrXGM81K5rWxWe+CJOFTyj9c4alvLRCp57o9Dy8Ad
	aiKRQLEfpO/x/ee4o=
X-Received: by 2002:a05:6820:200b:b0:694:9bdb:596b with SMTP id 006d021491bc7-69b78d6e063mr1647900eaf.17.1778674443943;
        Wed, 13 May 2026 05:14:03 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4355736dbc0sm15189442fac.11.2026.05.13.05.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:14:03 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next 5/5] selftests: openvswitch: suppress pylint complexity warnings
Date: Wed, 13 May 2026 20:12:40 +0800
Message-ID: <20260513121240.2590767-6-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513121240.2590767-1-houminxi@gmail.com>
References: <20260513121240.2590767-1-houminxi@gmail.com>
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

After this patch, pylint reports 0 warnings (10.00/10).

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 tools/testing/selftests/net/openvswitch/ovs-dpctl.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 3683796ba2e2..bbc88e3cfc8a 100644
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
2.53.0

