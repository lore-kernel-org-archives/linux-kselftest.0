Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9F13DF01D
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 18:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774030125; cv=none; b=VHPA2Wx+Z3hjOiwy3YSU18aHmfMmF3CkgTwpSgHBICrJfR32s1nF4ms/2qFEVO2rNH5VNlVfTwmjLRPwGnQr6WenJRlizoChpzhMn1gBXHGjtYh96aYnKyrMW8jeTYT2VqpLOEgGap0JEhjOemVb0SopuNf03bPePZZfVzMjCO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774030125; c=relaxed/simple;
	bh=eQxUX+gzWlFkaXDdfeVXpeBJ0sPtMwm28h+c2N4MDbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CvEWQnrbjeqKkNr+8unmeGA8CKMty5CHwApgaASNHPpSxZLmdw9GRKRrh+A8kT7qscGyHcLuGkkPie99KzoycMTqPQTCzMQCBnIKPMiiVrC8u3Chmk1ZJiDq4OM1/IM0b+fu/JHPYGfjkpNeYaGX7Rk0SExoFm5BzbwMnzTyvRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMfcQs6N; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMfcQs6N"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a5ad7cc52so24823157b3.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 11:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774030122; x=1774634922; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+HxIcwAjT3BNXjqO4kOjoOrvW9GUI+JCw0ZolV134BA=;
        b=ZMfcQs6NCcX0MjYvyPXucuyoO6ikjNqC0HIuX2wvj3gUMK8gBnzNnkULeC+l8fe55T
         lN5dITPvosdwlPhGqi0ePi819CWvXIOVJK8VYS9xPTA9aXj8nnzLAjJjEaMx6K8W6j6a
         nd/IIuLZsx9s8rP2BGTHHNSSRQRhVMky32zmim9vHHSIOSUYWcoWIJYTvdFOUiauIfAB
         tUoO6Gz5IEMNKIeQ1xgeNQA+PwwX8BGtxfh1+58MYOmRl2/oDI5m7OaUcGtmfC7GbNGI
         v+W1JmadLQVesgjcoL7ccjDAg7McOfuI5bkRNBp4hRua8lA0oCTjzsyybTIeDdXJSb1b
         6Wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774030122; x=1774634922;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HxIcwAjT3BNXjqO4kOjoOrvW9GUI+JCw0ZolV134BA=;
        b=KSFO0yFUAgymmIj34O4JndCY5qw5VHiE8h2Xf5FC0x6czi4IrTmSc1u6WMNNv7bLNg
         L7JwntsFV0ZHA0k6oaRyItt/21R2WUiVaY+iJZbW+G321E6mD6YWe6K3svN8fTVJhJFE
         Op4dErzkevuiaswDurz9By37ACTa9s6efhfiJgg8TcCvM2dTO2Ea1fyDOkYEFD5/Ni5/
         hKcOeACR5qWSahF5OwiUoU4/YRitQousgxpX1yxrgS5j97kbGXjDf0XJKMLupzvxwEfH
         ir6gvOCpj0UegFX8GScGQtWLkLwXKTGh+1lodWR5wd1p3RFMNtq2YlkV/yMTkL7cK+N+
         5yxA==
X-Forwarded-Encrypted: i=1; AJvYcCXrf91V1UMHXQ1L5h8vO3+qzcXX6SMza4rxSTZIw2/xKjYxiAYEAZWhX/cZnhhXZpg8C7PPP3k7MnzD/QiuR8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOFcw0pgvo6wNC1piUImqMUSXNMe+QsGdiRPBhqYpKv/BOCCpd
	zZfea8vvYo1p6DGIub6T4N5FQJNTygEIOflvXrOaaW3fHKXQB8Mm17+f
X-Gm-Gg: ATEYQzyDyomYi6gT6M1F3xCu9g4c7j2sYJjJmDKT+8Tf612d6ZVv3tMm92Rpn1/Ydrl
	GiwtcxFNc6D+sXQEp0gP3GJcCKaI/NAAgXwKTa5jZybkvZt/foaqv3YE8ID8sBfdOI3oe9DsS64
	JHb2WRwKTXzWBl21qw+k/LlxuvUzOiG1Awe3QVN/yoNCD+arlLVMenSyAJTwQWHbMbw3Mc7mmwS
	EY/9K+p11dnqreKWP9U33CFdnDtFJhFHqIJB8GztSikJ756Ui8VmdDl0v7Tp2wqVjdN0arc/isf
	OpuO/yvJeMXBStcSdTvU5FgJDf7Gsvm3r8vKzH5VMVciU/w4iYUuzU9aT7ko3VT2blHpGv13Lbd
	9mJi1qHbOSpOJhZh0pZv+Xg/UIiQ6sJGVmJHJ25FooKxVTJnJ5qVT9gCO6pA3adSrwsbtLhZedO
	wiGhR8nOvK2TZiJHW4eBicsw==
X-Received: by 2002:a05:690c:385:b0:799:2b4c:1d49 with SMTP id 00721157ae682-79a90bc7e4amr37281837b3.36.1774030122081;
        Fri, 20 Mar 2026 11:08:42 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:71::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903a3473sm19822147b3.1.2026.03.20.11.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:08:41 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Fri, 20 Mar 2026 11:08:35 -0700
Subject: [PATCH net] selftests: drv-net: add missing tc config options for
 netkit tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-config-fixes-for-nk-tests-v1-1-1e20ec6ddc7e@meta.com>
X-B4-Tracking: v=1; b=H4sIACONvWkC/x3KQQrCMBAF0KsMf92BGGsDuYq40GZSB2EimSBC6
 d0F3/rtcOkqjkw7unzUtRkynSbC+rzbJqwFmRBDXMI5Bl6bVd246leca+tsLx7iw3mZS0qPdJl
 TqZgI7y7/hUxXmAzcjuMHBvtodHAAAAA=
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
base-commit: edab1ca5ec6fffecbf340e26956ce73e502901d5
change-id: 20260320-config-fixes-for-nk-tests-64d77b7547df

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

