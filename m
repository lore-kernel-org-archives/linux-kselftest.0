Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8FE4964F
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 12:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780058766; cv=none; b=T47Jhi1wRhwxe5q1Lqq8jILRwfHKXCsLUdWJb0fI1hVs6PFXnymV2PLi/2mkIefEIYKLC+0g4UtlIhEs/IEQdfHmr3fFaTVY0l6LIslkJcf1sbRK+qiF1aKVsmwLJb7c5eYa9UnHlFOtzfhYl3USU9y2ONkKkUZ6Efi8jkOxY68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780058766; c=relaxed/simple;
	bh=NSn5sR6O4Rt7B3/YqbAiK3fq+qyObIB738wGJZL72Vk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AVKhwAM5lKb7nlE3G1CuLwHZmj9aY/tvOoiKShbtZE21jO2LRUgkzeOSA2r+hog3NX9XMGLYT6QsOIhlSzL5GXjNrMBA+mOdN8QjGPxcEqFsAB08dlf2f8nlcG44pa/n+pJgjwBH9UvbhpxoestJCtuNwikAxfzfQCgEU8rQS8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HA/xLD7K; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HA/xLD7K"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e55b95ba13so7081035a34.3
        for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 05:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780058763; x=1780663563; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FOaj7kJy+BccHhWOj/+aUOc8E/TW5v19gnCmqaTZgac=;
        b=HA/xLD7Kwxrz+AgsGk+FAdm4QhMyYI5zcD0Pm8uvJNUOekol1Je9GOhQvij24ZIZHV
         nWireIuGELyORTSD5VCx8W6jE2hVHPLi2x3zxD9xP/Yv8Nnhb7Ywsyxb1RGb42xrgOQj
         AttW5+XFRYMmBAw+oLFQOm7mkMJnwZDTe5jIFd4y+KGi0MrdfBZpQfmXw4YUG4vAgaMU
         IorllKx5RhgUVMYTMmgLlupKRIWlNDY8Y+o0hzyhRaIwiTF6Uyddb29/AOXBNQtyDkr+
         nLgjsAdoS4m8BgCfNseudmmuu3VB8GZ9USOX2MR668Bua42WLQRVTVFwbwQx+uU+FEHq
         5UVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780058763; x=1780663563;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOaj7kJy+BccHhWOj/+aUOc8E/TW5v19gnCmqaTZgac=;
        b=m2L7AeGrLApJ9nMc3nDJu+OzP5ntV5NTadqAnYZpfXHt/6ArUEOR0ZLXyNFR9fnbq3
         2tHtmOwPqjJwvTLl5KbaGHRqnlC43dDy+NoamNOiV6+KBXflMsktO1QO4Ke6A+RJGQwf
         8NkqW5EBT8eeIsnU/bZtTHoQKdUc/9uCf4Q98GPdaeX0ZmCmaG/ku5juXxJGeWTY92B1
         24MqzN7R6/UwHAirXpAP9D6nV7k7IfEfbNfSdEimgAkaox030WzCv47N8fT7fTIgoXtR
         XYfMMgQQI7jxHKVSSUi1PwAHTyUGYQ+9HZPndMRrqpAj6QLgxLgKquMi7scEZ5HpCuE9
         9dwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v+iP2lrCm4k8fi8dDww3JA9NllwRPR1ArJb6gYnvw1o8N9VqG5W52aK2z3lOhbEoXhIH7MlgGJympkCrmfQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvI22Wq9lr1PzRCkVpI/MXr5aAaRJj9XHrEtmy5v3rk5Nu5BUE
	B2PAfffhj1W0BrgE0NB49hoGKCJmanA3tIL0smTgBNtEjTxP2daL+518
X-Gm-Gg: Acq92OG7k4eA7LqZ7RD4l5D4zdxCs/7dP97Fdk+AjeHdiPwZ4U0vDGmh4ivcoJhrKxm
	2oCB70WZmx+79Z/iRvswda/hRHTN7YC0MPw0D40aiRqa3MQkUG+/GfQlueHewqVOGykGWORvxTP
	NS2j7vNOaiAHz3dcLcH3lJEeqJ8EVdm3gu3SmOxiIw8EhdWzCC+xWL94haTE7yCCm1wrPq8ZZtM
	MLix4VDIZCuJUc8ltG0F9eutOXoL4q56wFUvXq+kYBGvNr1xorpRRdiajFJzNwCwSbw/qSBAk1c
	E6tS7XuBdULzVd//CFhvOcsYsPVN35a+WDPyLjUpFkcTE+OiO+xVsUqa+9/dZe3tDhN0hnjP1mS
	HlWXp2NphQOE+a76Lc6ZIEVToWj9+e4BvqlfmPJG2asNzK+nJsmvc2g2irYcb3S3Zxg5ySotuAj
	legFAEqm3UjZGLW0B4VLav18fCsZv0Qw==
X-Received: by 2002:a05:6830:438d:b0:7e1:90a:97c2 with SMTP id 46e09a7af769-7e694e4bf8bmr1720403a34.23.1780058762922;
        Fri, 29 May 2026 05:46:02 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:1::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695bd9c9csm1381119a34.11.2026.05.29.05.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:46:02 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 29 May 2026 05:45:55 -0700
Subject: [PATCH net-next] selftests: drv-net: tso: add new tests for
 ip6tnl, ipip, and sit tunnels
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-tso-tunnels-v1-1-3771ee9eaaa9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIOKGWoC/x3MSwqAMAwA0atI1gZqRaVeRVz4STUgUZoqgnh3i
 8u3mHlAKTAptNkDgS5W3iWhyDOY1kEWQp6TwRpbm8o6jLpjPEVoUyz9UIzOm8Y4B6k4Anm+/1s
 HQhGF7gj9+37rKQKAZwAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

Add new tunnel test cases for ip6tnl, ipip, and sit. ip6tnl supports
ipv[46] as inner l3 header, and the other two tunnels only support a
single inner l3 type.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Example run:

  # Detected qstat for LSO wire-packets
  TAP version 13
  1..18
  ok 1 tso.ipv4
  # Testing with mangleid enabled
  ok 2 tso.vxlan4_ipv4
  ok 3 tso.vxlan4_ipv6
  # Testing with mangleid enabled
  ok 4 tso.vxlan_csum4_ipv4
  ok 5 tso.vxlan_csum4_ipv6
  # Testing with mangleid enabled
  ok 6 tso.gre4_ipv4
  ok 7 tso.gre4_ipv6
  ok 8 tso.ip4_ipv6
  # Testing with mangleid enabled
  ok 9 tso.ip4_ipv4
  ok 10 tso.ipv6
  # Testing with mangleid enabled
  ok 11 tso.vxlan6_ipv4
  ok 12 tso.vxlan6_ipv6
  # Testing with mangleid enabled
  ok 13 tso.vxlan_csum6_ipv4
  ok 14 tso.vxlan_csum6_ipv6
  # Testing with mangleid enabled
  ok 15 tso.gre6_ipv4
  ok 16 tso.gre6_ipv6
  ok 17 tso.ip6_ipv4
  ok 18 tso.ip6_ipv6
  # Totals: pass:18 fail:0 xfail:0 xpass:0 skip:0 error:0
---
 tools/testing/selftests/drivers/net/hw/config | 3 +++
 tools/testing/selftests/drivers/net/hw/tso.py | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/config b/tools/testing/selftests/drivers/net/hw/config
index 8c132ace2b8d..b9f406dd7282 100644
--- a/tools/testing/selftests/drivers/net/hw/config
+++ b/tools/testing/selftests/drivers/net/hw/config
@@ -10,10 +10,13 @@ CONFIG_INET_ESP_OFFLOAD=y
 CONFIG_IO_URING=y
 CONFIG_IPV6=y
 CONFIG_IPV6_GRE=y
+CONFIG_IPV6_SIT=y
+CONFIG_IPV6_TUNNEL=y
 CONFIG_NET_CLS_ACT=y
 CONFIG_NET_CLS_BPF=y
 CONFIG_NET_IPGRE=y
 CONFIG_NET_IPGRE_DEMUX=y
+CONFIG_NET_IPIP=y
 CONFIG_NETKIT=y
 CONFIG_NET_SCH_INGRESS=y
 CONFIG_UDMABUF=y
diff --git a/tools/testing/selftests/drivers/net/hw/tso.py b/tools/testing/selftests/drivers/net/hw/tso.py
index bb675e3dac88..1b789fea8929 100755
--- a/tools/testing/selftests/drivers/net/hw/tso.py
+++ b/tools/testing/selftests/drivers/net/hw/tso.py
@@ -239,6 +239,9 @@ def main() -> None:
             ("vxlan_csum", "", "tx-udp_tnl-csum-segmentation", ("vxlan", "id 100 dstport 4789 udpcsum", ("4", "6"))),
             ("gre",        "4", "tx-gre-segmentation",         ("gre",   "", ("4", "6"))),
             ("gre",        "6", "tx-gre-segmentation",         ("ip6gre","", ("4", "6"))),
+            ("ip",         "6", "tx-ipxip6-segmentation",      ("ip6tnl","mode any", ("4", "6"))),
+            ("ip",         "4", "tx-ipxip4-segmentation",      ("sit","", ("6", ))),
+            ("ip",         "4", "tx-ipxip4-segmentation",      ("ipip","", ("4", ))),
         )
 
         cases = []

---
base-commit: 8415598365503ced2e3d019491b0a2756c85c494
change-id: 20260529-tso-tunnels-3fa1b9f07099

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

