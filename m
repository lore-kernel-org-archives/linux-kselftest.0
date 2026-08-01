Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105852AD2E
	for <linux-kselftest@vger.kernel.org>; Sat,  1 Aug 2026 13:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785589943; cv=none; b=h1lU5fxOnz/Xel0iwoEBx+23LNrgDDOzq2Ia8cknmoB04Y1b9bi/B5FepPFJ/6l5EyIryvM5FwB7ejAg94LouNzGDYEvSArocaOPRKG3oZJlUdYHrmY9tnsMAiTe1FKkY0W+thDD1AWJfnk7I5uXiugwpOrqbHkVqrjZDoJXf0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785589943; c=relaxed/simple;
	bh=Jwhl61kBPcWHcrWGP9ed5EM5DNox3IfkjZYxA57+8Dw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=T9ygSh67miXFH4jaNrU391eHivhsVqHE9czb0IMiOcSQk6NafwkWQV7fb9nYP+RBPvUQaCI455q/GA1FM0mfXh73RlrSjwom8IjbYfyoBhnprZwM0ryu4RNE0fnRedofOizYOARedcwPjEt0iC1fxSZq9sOj2LUtEFD4EJ5u6GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dm0gRVGF; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dm0gRVGF"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d04908139bso25057205ad.2
        for <linux-kselftest@vger.kernel.org>; Sat, 01 Aug 2026 06:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785589941; x=1786194741; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6RppEaYP0Ab3EDNRnjLFTs8JBEizKeLue9DyTxW4168=;
        b=dm0gRVGFp5FeckQWXkwOxH0ZH7o4QZv2XURCzA10kXF6TgjjkDMERFDCOLvEZO3Lrt
         EpV72OseGqsXKsHKKd3cApLN3Ld58HDugEmFyoeK7xYwuta95DII676uoZSrV5K4n5Gx
         oJreTHkRihWFEhlG3xD6ON/6gpYbNDTcauJduA3PdRHEGwLMJqszvIrRqq4LtBR5d2/M
         MDBEqY0ndJUkFLCFTTvH/0fgZQQkiRQT+gNcqg/X6hXk2+0EqXUu6kY4d8+1QPWgP97A
         9g+mpSiR1L1oQ6v+4UcvEHViIihoZg8jHkVErOSx/CPJAS32V7Mht9OwUeF7Q/lmqy9i
         0UUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589941; x=1786194741;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RppEaYP0Ab3EDNRnjLFTs8JBEizKeLue9DyTxW4168=;
        b=pSlcE61RGpV4ygBhPvAPU8U1pmXyTav+nT5AzSYBeI4UT3Wnx0rpiGajQJoQVhiMhG
         BP4CmzSM8hbdeCK38c50NEMlFDZLQbnBvkjktSiSprMcoV+tAsPJIlDU14YXrIuJXCcO
         DXxzRkaflbpIn3DTGc3flyI3MKYZdONWtDMyrAykEYiQ7jVv9GVfyH/EaANQFZK4H328
         Y+iuBTFyxYOORouX46/0GisQMr5SC2alT40droXSW5+xLSAhEDTFgn4vFPvkqglxAgFX
         PtNtV96TNuBOVTgfD1QkylUrAmGIazGz5coO1TczKWm7iirS1BPY9S0HOKoeeRzhaPvI
         BgQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNlT1EoYDx0eUhlF6t3hsre8ksF18ulUJSJfu2I9rwEV/ErYrvh9AXvDJ+Kh0hUagkq+PfXfClrw+wJtLHomQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOZvq0eN1p3y+HGfIlW/7JrvidrXwj3tDlLcIaqSET5PgDznNO
	3+DRCK3DCunNYk+/H4LX7cFfU//Co2+OGUTYyht6EMYK6jNuZD6vxETT9ywvMjlvZe/KdiHld1X
	/EUbY9b8EajtRM4k0L3Ny8wVDsA==
X-Received: from dyff25.prod.google.com ([2002:a05:693c:8059:b0:313:d014:d248])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:37ce:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2d05221d3bbmr34491815ad.12.1785589941151;
 Sat, 01 Aug 2026 06:12:21 -0700 (PDT)
Date: Sat,  1 Aug 2026 13:11:52 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Message-ID: <20260801131220.1367229-1-almasrymina@google.com>
Subject: [PATCH net-next v1 1/2] selftests: drv-net: devmem: fix 5-tuple flow steering
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
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
-- 
2.55.0.571.g244d577d93-goog

