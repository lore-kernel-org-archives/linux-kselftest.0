Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A082827453
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 00:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774310899; cv=none; b=B+o2oftgzzAuYuvhI/McYeEqIWkBb+buhmsMomLC6dOs+cDvEV94HkgXVXMmojqO++MhPg/Z2SJ204H8jyejIpbmno7pRWk/H5alnsKUIjesapef0/ifNqIb1r94GKXCI1+DZMsy2pg7UaiOGWPNcaWdyUecmv1HbX0A3OCjRzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774310899; c=relaxed/simple;
	bh=PoxhREItMiVwYnkEXKtVFcww/YwazBVr+OkJBMvEIww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ohmXRUEHqvu2QvqUwAFjAqlJlcfqGnNX+BSb1l4/87Xqt8HpX9FL+oCpCmEZBw15xxEQ6d1xWhza1fmoPfeu5SR4qL1DBoBlQ1K/udrUG8kK9BW2cHcSZ0cg0B6+FR1AVJfccZTyJ69Gi1TREHn+5d/6rbJ7QSzodbwdNmz1RyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwQoRUpz; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwQoRUpz"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64e9f9226a7so4245107d50.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774310897; x=1774915697; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LZxQqoLlmdcOW4F+vMCkFDwmluwovP2vTt1WDIDQAmY=;
        b=DwQoRUpzxl9jEwO6r1KjQ83UnvEgf4RUrkd5428wXXHynq0TuiOvF1GNbjy0p7lv4W
         wWK5EBcnaBo8r7THs2MBHeIshwPwBroyNIEdIrqV7LxGYDFoW3l2PmLGSRSQiwPyfl0I
         Ig6q2R797Pt+/uNwMvUbw6PaAll8GvIkM/7txdQp/82Qk2H+VuUciW1jgJHgqpXxRIYC
         r7vylF5/HgIXZFPQJTsaEYDVwh+upb10pW9RjTr6L7mNToDaXTbrG46XbpiCkEA6oFOc
         hTyjI4vPVR2Pj5p6S/fXmm/KGgtM6LPXaG4JKOFNmnzELxTFyhFbg3Ual3WZcR01RshD
         RWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774310897; x=1774915697;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZxQqoLlmdcOW4F+vMCkFDwmluwovP2vTt1WDIDQAmY=;
        b=ehsTWLu0QhB8itO0Nrnbl0QxEwk25mYJKzcgwrUresvLdpEeIVno2pZ65MYQcS5zeq
         +OTY4Z6ZQU6MaEm5gs7ibUxUJcK9xAuXEmAsy1wQE1LyE9jbVjoL/FPn+aT7UmhAoO6O
         5QIHHnqt94LPF9ZRMXYUGuGlKod6K9GgSbaQ0XwDDpbuJAIIbXuOWP0QrIKAxrSZKUdG
         iZ8e2A9ZqJWrarzVQXhNUycrRaRmC1i6qI39sBjo8C/QnNIwgQhdGSQg7be+NOz2JkE1
         trG1fTn2ZE37BmmbaQNO2D/XkI5bdo80QIZjNz7vv4aWC/bjTViNWd7/vnNvMTeZEm5S
         6BFA==
X-Forwarded-Encrypted: i=1; AJvYcCUV+yPcFZq1Ppf1M7RwPBOJXNuSmYPOrR22d77HgGLs+EBoJGah9qC9LYwMsdLX/nL2XOeL5QRTUPzdn/UoLNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOXmSUxNRaW8VskX3RBWsrf6ny0wJiz74ypHtfBhOtIHxbRlw8
	bnlaqBTU3a8IwLZJ2fjU8iXu0pzfBoP1jE8DaoHED/5gAx68E+e/4d5KEzwKsg==
X-Gm-Gg: ATEYQzxN0iV74x7UJ6Bf6PNVwqKZ+beXzUpAQAwLiV9GGJNaR5pPvRjGEQxYf7vwcMx
	miJqgkeiUag0Zm/c3mZYCBtvnvD/nzSW6dRbAocJu7bJ+vOKSRjwvB6VKEC4Ywd3LjjmnLj8B98
	LgYwrl91YRV7npJ8QAUJQx1Rhu/UHlkcoaLDmPRYzUiTzLyqrSCtmRQaUCt0bBajnyiS7yhUNUe
	BrwoQWLjlKZ22m8VTVKiuythPWHj6uh/xF1VVN6Ch7cyzaujKgkzcJMti4tXQDOyjt/pCxppGcN
	Iw+Fq0wqdXZRLsmI9WR/aKc9lhuOM+I/WpwGI8oOK2M4NMErP+YvoJLdq/D/SUtZg1YS8op2Z/D
	VoFKe06JGOdBJx6hfQBC7jdRgIRBkjYB4RSZuZ3ZpywJ0uIKe5H/MgXg9OkAgz+ezI8zBEKaASf
	t2UQ56biIl5CXqcf/DXoTadg==
X-Received: by 2002:a53:acc8:0:20b0:645:443d:10a2 with SMTP id 956f58d0204a3-64eaa6de975mr11313981d50.26.1774310896621;
        Mon, 23 Mar 2026 17:08:16 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:50::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64eabe7e34esm6912892d50.10.2026.03.23.17.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:08:16 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Mon, 23 Mar 2026 17:08:10 -0700
Subject: [PATCH net-next v2] selftests: drv-net: add missing tc config
 options for netkit tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-config-fixes-for-nk-tests-v2-1-6c505d83e52d@meta.com>
X-B4-Tracking: v=1; b=H4sIAOrVwWkC/42NQQrDIBAAvyJ7zha1aQRP/UfJIdU1WUq1uBJSQ
 v5eyAt6nmFmB6HKJODVDpVWFi4ZvLKdgrBMeSbkCF6B1XbQV6sxlJx4xsQbCaZSMb+wkTTBoY/
 OPd2tdzFBp+BT6bTAqwdkaphpazB2ChaWVur3nK7m5H/0V4MGDVlNYYgxOLq/qU2XUN4wHsfxA
 41u3gjLAAAA
X-Change-ID: 20260320-config-fixes-for-nk-tests-64d77b7547df
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 David Wei <dw@davidwei.uk>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

The NetDrvContEnv env context uses tc clsact qdiscs and BPF tc filters
for traffic redirection, but the kernel config options are missing from
the selftests config.

Without them, the tc qdisc installation trips on:

  CMD: tc qdisc add dev enp1s0 clsact
    EXIT: 2
    STDERR: Error: Specified qdisc kind is unknown.

  net.lib.py.utils.CmdExitFailure: Command failed

Add CONFIG_NET_CLS_ACT and CONFIG_NET_SCH_INGRESS to enable these tc
options.

Fixes: 3f74d5bb807e ("selftests/net: Add env for container based tests")
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v2:
- change tag to net-next
- Link to v1: https://lore.kernel.org/r/20260320-config-fixes-for-nk-tests-v1-1-1e20ec6ddc7e@meta.com
---
 tools/testing/selftests/drivers/net/hw/config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/config b/tools/testing/selftests/drivers/net/hw/config
index 235c0a1cd21e..dd50cb8a7911 100644
--- a/tools/testing/selftests/drivers/net/hw/config
+++ b/tools/testing/selftests/drivers/net/hw/config
@@ -6,9 +6,11 @@ CONFIG_FUNCTION_ERROR_INJECTION=y
 CONFIG_IO_URING=y
 CONFIG_IPV6=y
 CONFIG_IPV6_GRE=y
+CONFIG_NET_CLS_ACT=y
 CONFIG_NET_CLS_BPF=y
 CONFIG_NET_IPGRE=y
 CONFIG_NET_IPGRE_DEMUX=y
 CONFIG_NETKIT=y
+CONFIG_NET_SCH_INGRESS=y
 CONFIG_UDMABUF=y
 CONFIG_VXLAN=y

---
base-commit: fb78a629b4f0eb399b413f6c093a3da177b3a4eb
change-id: 20260320-config-fixes-for-nk-tests-64d77b7547df

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

