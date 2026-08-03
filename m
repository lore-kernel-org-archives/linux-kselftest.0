Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD4342EEBE
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 18:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781149; cv=none; b=frdh4lQXyHLTHaWlNnMhy/4s0rSnGClnCt+3y8WyqRoLtraCd/IdnM8D/NXsDPI274zxldwqeSA9pa0S0oWJxkW5fR7IFWr4WDuTanXng5Yh1eemxFf8rJ6fxFXEwONBtRHExmmgt+eS98lCVgH0YafQZEW9mM9+kHQw61x4cRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781149; c=relaxed/simple;
	bh=raK8shwkaaPHW/yd1zlOipdRHT+xg/2FiiC1Ujgc/1Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HZcDaLuwxGohcSbLQFvzofXmqJFtX6L/0tx1b9nd8DlUALM3PObehdn+OUpNPwvUrdcQ8K28xDGlPL+PAnJPbrLYwOp7pLmQ1eunZ62UhtcBMJk2iqEIlfpBm4quRRrOQ3HBTyTJGJNW6rpqnw2WJAm08l/CKWwf9otzbRHMMHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XvrpeKja; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XvrpeKja"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso4570397a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 11:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785781146; x=1786385946; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rk/ZaDQXy7W4s45i7JxVik8cU26Hiqezbm85GUMkrUE=;
        b=XvrpeKja4dlHOifxkpg75R+YwQAlFbi0lZyooTSxjB6P1jNPpUX1GJiC/PQPvlD6nE
         fmFTpG7SA9scpfMftnxb3Gxq9IyElsqWVyRO2lyJ30GdsNCE5EdGXqJmF/9gAOXKAvEV
         szw07OCG0ebd2IDOC+5dZTUboupPFIN1aa0eZ6wKoPg0hurieoPLEyz21PJ+7yEz/KLG
         gVYYlM4vpUpu7xWsi4anYAUqUrNGSrML9KoJw8MzOfseeExLMLLo2uEJpTBFY2mWwOzu
         +QpBVCiJYHCRFWGKubcrzSQkAbMdcUksYtpk74y8GHh0Figvb+40VBgT4ZIRklawqxaJ
         BPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785781146; x=1786385946;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rk/ZaDQXy7W4s45i7JxVik8cU26Hiqezbm85GUMkrUE=;
        b=K21pgQrbq9ypqKhqmnDbmNerZMcgKm5MXZmN+eoJDMVRJZH2fdBBUOm4NGNRCjQyyg
         +zKvEsn5Sbj4He4guHjPBMPfxswpdEKKE+xhrA0oYsRTkq4BQB6F1t0xRNOUCjnHcJr1
         XeNFdGLWVCRDbYbMLSzp7BmaWo2IVWeRtwuM5ed2tzK6XOoS25YD4Crh13W3tWygK8PU
         J3Xo8fHx3Kd86LeccSgPawU7aJmBDwPPH88Mwk4JupHGLA+ONC9XPpv7i7MvL4bIT+pW
         QdmuBu9aojrBeEkWWBt7bWNbIk/OtBcOCBWJcCcPCs/4TbVFM1SYyl4nNP43BxkpfGJH
         qmFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrP0hVu6RJZYHsxUJFPOSUrCX3Dw0rcBc4aE40l2j59yvtMfkZlZExzYlgL7BraIc/7TswB+R0rt6DKNLJ499Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5bHso8uLg5ll5fUogVh9n1xqlEZ2I8GitNtxVpCUZ7brReA+c
	7oOoWoaZ/R1eR3F53JkpSYgv1mp7rNE2HeY3wkX66Sn51hh0t32qqCiMYQ4mo5YBYNTL7NCt1mA
	i+WolZqT36bovZlFdfRuL5md0aQ==
X-Received: from dycnn12.prod.google.com ([2002:a05:7301:140c:b0:311:6a48:9c0f])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7d0c:b0:3bb:2200:f67b with SMTP id adf61e73a8af0-3c92a8139e7mr11604873637.40.1785781146359;
 Mon, 03 Aug 2026 11:19:06 -0700 (PDT)
Date: Mon,  3 Aug 2026 18:18:25 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Message-ID: <20260803181852.491437-1-almasrymina@google.com>
Subject: [PATCH net-next v2 1/2] selftests: drv-net: devmem: fix 5-tuple flow steering
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"

When configuring traffic for the devmem tests, 5-tuple flow steering may
be required if the environment does not provide network namespaces.
Pass the correct remote address parameter and fall back to 5-tuple flow
steering if netns is not available.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 tools/testing/selftests/drivers/net/hw/devmem_lib.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem_lib.py b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
index 0921ff03eb81c..3ede6fd426929 100644
--- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
@@ -111,7 +111,7 @@ def ncdevmem_tx(cfg, port, chunk_size=0):
     else:
         ifname = cfg.ifname
         addr = cfg.remote_addr
-        extras = []
+        extras = [f"-c {cfg.addr}"]
 
     if chunk_size:
         extras.append(f"-z {chunk_size}")
@@ -212,7 +212,7 @@ def run_rx_hds(cfg):
         port = rand_port()
 
         listen_cmd = ncdevmem_rx(cfg, port, verify=False,
-                                 fail_on_linear=True)
+                                 fail_on_linear=True, flow_steer=not hasattr(cfg, 'netns'))
         socat = socat_send(cfg, port, buf_size=size)
 
         with bkg(listen_cmd, exit_wait=True, ns=netns) as ncdevmem:

base-commit: 69963a0678a347d57c4ac8b16939dba216eb95ce
-- 
2.55.0.571.g244d577d93-goog

