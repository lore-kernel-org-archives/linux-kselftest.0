Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D6F1C3BF7
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 01:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773795883; cv=none; b=cy+MC2GwLkSjcpPfJbxs/TE+iP/fQAH0SdXVF4yW8Hjmit/4a2K2QNjHElb6+qEAZVLi9ybfNSPnvF7lHDl7joz+z850xZNOK63/R+kPhhej+3StIXZ0K2RfZrcXF8uttxTo9I7V8BjpJqOatplpHkDS9vjI7rRP/uBDuNOTGyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773795883; c=relaxed/simple;
	bh=THzzDNF8GpfxxtI/EItqwopxBXguI9PXFA2AmDPRreE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TadfHdw4Fum7dtixixCe3u7eH5uVjmhwJzDsc39h3c/PMJSYWewu84jTaaQGHQAUm3iGt65bu3QC7OdxDp8H9Vx6tNAo7wDXJ2GTZO/HZsp8gCsllA069/gyHEfSKS4tkDSrdTEgs1vyZ1zeS8KWDRGAIn4x+wfWwrQ1mcsy94U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--treapking.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G7g7KjGb; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--treapking.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G7g7KjGb"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2aad5fec175so304395375ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 18:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773795881; x=1774400681; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=citUlJS1cTHKzG0Mc8HWnWcaRo8SkwkYhwdVqJdujW0=;
        b=G7g7KjGbnWH43vL/CqCumIps8DTjJ8i0bJoLJXIZP+Nw2ZmjqL3uVMTMCRB/jjVPhU
         Uc/LQ9SkVGGWCva7G3lT04onzH7SQOHDOiXRBgHkj5yVMARE5sP2PfLK7gfYi14EC0aR
         xDZb5PJle2hB+LgzU9D7q9Mt14JAysnZA+Gec4JTIDsn1/QmYWU1PN9GU0lcvtTVQ1UJ
         GgM9AFxIK3BGXHAlVO7NUQeSY8nK4fE4OAdoesCF+9kXUuwZ5IE7oEKeqQfwbYqRllSi
         AssF/SbpKI58x4ld6luoRhRzT4z4+lT+FjDUI4LP+fURzk94QnzbzmGNfehT6rYru10Z
         pXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773795881; x=1774400681;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=citUlJS1cTHKzG0Mc8HWnWcaRo8SkwkYhwdVqJdujW0=;
        b=p4hqCqVpdUhR+NptJnOBmCqOAu2044fywQMVG3UPncmnZhLTp0iE7JdCCYOlM2nH0b
         +d/l1+qZqv6G6ULp5DnDCZylAN+oa8Ioqyj+bdmznUaIula2/5ylzzS7QDehUapZ//hF
         YDEOssbR1FyzLb5sygfQ03Lmomxr7x3kM1FBPQCYpf5TmKe+pdFUnK9uv2YIhHK+HqZa
         EwT67jIEAy7zbv2u59AepisdlqXOymr8Ig0amad0fPMF4LyYVsTPfJodU+p8jbz+WRZi
         wUT1Z6BWO3bGVdr1zK1rPDjUrz6HRKN9zNwM0Yvg5LhHR9uypDXO8OprbF3NUGbCr6Zg
         Zicg==
X-Forwarded-Encrypted: i=1; AJvYcCV89jJWOqJfrDFeSvgqMk+jujPtLGVOHP+TOgF5nHkc+6N3n0TVHIbB3iFt7vUnrjSPEBhwSN7pvhmU+d44yow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6eCwVGKet4qYlEZPsdylyovMrFY3uQ+V81PYBaT72mbSHIGNT
	Ko7VHgOAzpou8qYxNuYlPhYN6yk++0GxxD8blDdVn8JcwYblldqpkmDw/36mhF1SheiKFwzywjU
	ND34znN5ieRv3mJowow==
X-Received: from plhb12.prod.google.com ([2002:a17:903:228c:b0:2ae:4f41:cd11])
 (user=treapking job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e751:b0:2ae:cefd:18d6 with SMTP id d9443c01a7336-2b06e3244e9mr14740125ad.2.1773795880882;
 Tue, 17 Mar 2026 18:04:40 -0700 (PDT)
Date: Tue, 17 Mar 2026 18:01:17 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260318010325.2003395-1-treapking@google.com>
Subject: [PATCH net] selftests: drv-net: ping: Wait for carrier after toggling offloads
From: Pin-yen Lin <treapking@google.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Taehee Yoo <ap420073@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, Pin-yen Lin <treapking@google.com>
Content-Type: text/plain; charset="UTF-8"

Toggling checksum offload (or HW-GRO via feature dependencies) can cause
certain physical interfaces to undergo a reset or a temporary link-down
state. In the ping.py test, this leads to immediate test failures if the
ping is attempted before the carrier is restored.

This is observed when running the test with GVE driver when HW-GRO is
enabled. When checksum offload is toggled, HW-GRO is toggled as well
because of the feature dependency. This leads to an interface reset,
causing the subsequent ping to fail.

Add a sleep period after changing these features to allow the link to
stabilize.

Fixes: 75cc19c8ff89 ("selftests: drv-net: add xdp cases for ping.py")
Signed-off-by: Pin-yen Lin <treapking@google.com>

---

 tools/testing/selftests/drivers/net/ping.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/ping.py b/tools/testing/selftests/drivers/net/ping.py
index da3623c5e8a9..951cd99136c3 100755
--- a/tools/testing/selftests/drivers/net/ping.py
+++ b/tools/testing/selftests/drivers/net/ping.py
@@ -64,7 +64,10 @@ def _set_offload_checksum(cfg, netnl, on) -> None:
     try:
         ethtool(f" -K {cfg.ifname} rx {on} tx {on} ")
     except:
-        return
+        pass
+
+    if no_sleep != True:
+        time.sleep(10)
 
 def _set_xdp_generic_sb_on(cfg) -> None:
     prog = cfg.net_lib_dir / "xdp_dummy.bpf.o"
-- 
2.53.0.851.ga537e3e6e9-goog

base-commit: 64dcbde7f8f870a4f2d9daf24ffb06f9748b5dd3
branch: net-upstream
