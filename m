Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6101FECAB
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 01:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770858115; cv=none; b=UX2K2FFXLh67nwOPIgtHlNf+c13GhpRMveurtqG51gtSXXhDbwaizNFicsPZ04RMVahbDgO4PGCmtVWg/+z0VnvzpsUH08hdE2uFYtYwGqgHMbdybic9iqnA4ydln4sE3JW+RZLcHIKMmJ2JAimpkCmKcbe7O/J1QvszoOq+5Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770858115; c=relaxed/simple;
	bh=5sBl97i+inRS8PFAXGy2J3iA+JTLwGT6khnA0yINGz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hswTuRhTJ91Lb5CCFeWW0YFs087htUUWxgDm8yYhgMeX4whYW3/ulOFoSwS/kpeU4DV/3yDz4M9KtfdGcoLk+4Mi1dABYnQcN5GTUuNlPzZYpEiNzZgKCLE/ahJghMrxLg3jjqHEFe4cI2JUe8kcRWNTjW/IduWwedKwrRICcDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPwvH9bh; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPwvH9bh"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64aedd812baso2751261d50.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 17:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770858112; x=1771462912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7H7SmwrPwDgMoAqOWKw9ZmCtrgHBYE/GNb30EsZTC2I=;
        b=WPwvH9bh3wW+CzErInz2IZrqECwVTK6EopC/48V1Vhgv1CldpbgqZsiD+Vgrlouvuv
         tEFFGjbkz1uEsXvUrqa6acbZanU/vA9l0cFs8sYtWziF6qtxXHrGOEKZOKOjzf4omqcI
         CgMfq9NC0Y1xozlPdtkfAxhs8OxIuWbISwZQmRFIJblajO1UrLiD7GIw4o40B73ZGeOL
         ZD//45MKleAKrMhk401zPE9buJZySS6n+FAK3U5rFe6uyx7L1TleklXa5khhRUY1iP18
         FouyMzDQZA/u4CkqdexRF1aom9rXo6A98gKmakON19mmEVjqgLevSXH6XyZKcuFwVdqJ
         +UmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770858112; x=1771462912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7H7SmwrPwDgMoAqOWKw9ZmCtrgHBYE/GNb30EsZTC2I=;
        b=poFNkW5k0E8nKIiUnDOVkGgRBJs61gx4KLWoKtvBGcEGb99iT2I8+PNR0eNO6RMSh3
         T6I1fkfU1CtnAP/c/Js9pID6RhMVFX9040A7N2osvSQZGtvVXuc9uutB5i/FJXpRiOgY
         p3imeFEPq4XNCqaPx0cX0dO6YQl67/WvtO34zdOoeoAHzJRZGPU0EVwHkl2myFTtAqbA
         MB7uxzv5HybQjJjCw5iC6Mw1H0Q0wrF01+exhEFTpMNm8IOH9j8M+ZZH6aUXwoQkRKIl
         j0s1/IHK4x+AubLSiivRywdi9h4kp8RTSlPH0D5UqFjEHVxNmdWkLHlTfwsmYbnQQqpF
         lcnw==
X-Forwarded-Encrypted: i=1; AJvYcCUNuStjVFmYIg957DJRRfsFu2iQtf2ZzZcXGzwAUK4V5nGk9K4rKOF8dPa1eKTKHw7yV2Zupj9UQeC8a+LCn24=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjjsDygPOnSQaOnABN3zg1f360fWVNNGd6ChrvB76CAc4/zfm+
	9tQ1j5ng3MPq8pEBQGipyWU+cEY5QK+mdgMcYKb7zkgIhY3blXFZyGv7
X-Gm-Gg: AZuq6aJ5u212Z7aHFfhj+p6Q8n8eD/RtR81NBRw1FD3tOeYOShV6d+drxK0OHMqo9RQ
	deTyqv17ek7mfq+Xh7aE3A7okvMLP/yLfxai4ubNJZRclvd8/ldjRIhQ/x8dVAGelVBUvuXsBfU
	0zytL1F78+OExaEkS9vy+X7r1I6TpmeSLZcLzDeFFgHbwbhwj5YqE7V28CS2z4vmeNMp05RcD02
	Bgo34WIM4Okp0P8ZuV5HjPNyv5pwvyOEqlL1t4Qf505nK9WwiS/h9pXi8gW9PrTpVejr2xWN+pQ
	LXs/xGDVwFr7RMQhYc45QSb9r+wNrttmZZ5pwn8XOY9c2IpDVjFixiXzE0i2I0EqeUDA3kFK+v4
	3XL3oXKaDpE7e3yRm/m24LlyMGZBAGEMdRhTBDnfVCsra+52VMfvHkmhdo365Wwvd5kQxq3JJyv
	fv0hCUJR6YO7m3uOUcTVsfyg==
X-Received: by 2002:a05:690e:14c7:b0:64a:db39:f002 with SMTP id 956f58d0204a3-64c080bf02fmr436658d50.0.1770858111903;
        Wed, 11 Feb 2026 17:01:51 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:45::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64afc98833bsm3543989d50.17.2026.02.11.17.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 17:01:51 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 11 Feb 2026 17:00:44 -0800
Subject: [PATCH net 4/4] selftests: drv-net: add HDS payload sweep test for
 devmem TCP
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-fbnic-tcp-hds-fixes-v1-4-55d050e6f606@meta.com>
References: <20260211-fbnic-tcp-hds-fixes-v1-0-55d050e6f606@meta.com>
In-Reply-To: <20260211-fbnic-tcp-hds-fixes-v1-0-55d050e6f606@meta.com>
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Mohsin Bashir <mohsin.bashr@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add check_rx_hds test that verifies header/data split works across
payload sizes. The test sweeps payload sizes from 1 byte to 8KB, if any
data propagates up to userspace as SCM_DEVMEM_LINEAR, then the test
fails. This shows that regardless of payload size, ncdevmem's
configuration of hds-thresh to 0 is respected.

Add -L (--fail-on-linear) flag to ncdevmem that causes the receiver to
fail if any SCM_DEVMEM_LINEAR cmsg is received.

Use socat option for fixed block sizing and tcp nodelay to disable
nagle's algo to avoid buffering.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/drivers/net/hw/devmem.py  | 19 ++++++++++++++++++-
 tools/testing/selftests/drivers/net/hw/ncdevmem.c | 11 ++++++++++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem.py b/tools/testing/selftests/drivers/net/hw/devmem.py
index 45c2d49d55b6..ee863e90d1e0 100755
--- a/tools/testing/selftests/drivers/net/hw/devmem.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem.py
@@ -63,12 +63,29 @@ def check_tx_chunks(cfg) -> None:
     ksft_eq(socat.stdout.strip(), "hello\nworld")
 
 
+def check_rx_hds(cfg) -> None:
+    """Test HDS splitting across payload sizes."""
+    require_devmem(cfg)
+
+    for size in [1, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192]:
+        port = rand_port()
+        listen_cmd = f"{cfg.bin_local} -L -l -f {cfg.ifname} -s {cfg.addr} -p {port}"
+
+        with bkg(listen_cmd, exit_wait=True) as ncdevmem:
+            wait_port_listen(port)
+            cmd(f"dd if=/dev/zero bs={size} count=1 2>/dev/null | " +
+                f"socat -b {size} -u - TCP{cfg.addr_ipver}:{cfg.baddr}:{port},nodelay",
+                host=cfg.remote, shell=True)
+
+        ksft_eq(ncdevmem.ret, 0, f"HDS failed for payload size {size}")
+
+
 def main() -> None:
     with NetDrvEpEnv(__file__) as cfg:
         cfg.bin_local = path.abspath(path.dirname(__file__) + "/ncdevmem")
         cfg.bin_remote = cfg.remote.deploy(cfg.bin_local)
 
-        ksft_run([check_rx, check_tx, check_tx_chunks],
+        ksft_run([check_rx, check_tx, check_tx_chunks, check_rx_hds],
                  args=(cfg, ))
     ksft_exit()
 
diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
index 3288ed04ce08..adc89591c834 100644
--- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
+++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
@@ -97,6 +97,7 @@ static unsigned int ifindex;
 static unsigned int dmabuf_id;
 static uint32_t tx_dmabuf_id;
 static int waittime_ms = 500;
+static bool fail_on_linear;
 
 /* System state loaded by current_config_load() */
 #define MAX_FLOWS	8
@@ -974,6 +975,11 @@ static int do_server(struct memory_buffer *mem)
 					"SCM_DEVMEM_LINEAR. dmabuf_cmsg->frag_size=%u\n",
 					dmabuf_cmsg->frag_size);
 
+				if (fail_on_linear) {
+					pr_err("received SCM_DEVMEM_LINEAR but --fail-on-linear (-L) set");
+					goto err_close_client;
+				}
+
 				continue;
 			}
 
@@ -1397,8 +1403,11 @@ int main(int argc, char *argv[])
 	int is_server = 0, opt;
 	int ret, err = 1;
 
-	while ((opt = getopt(argc, argv, "ls:c:p:v:q:t:f:z:")) != -1) {
+	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:")) != -1) {
 		switch (opt) {
+		case 'L':
+			fail_on_linear = true;
+			break;
 		case 'l':
 			is_server = 1;
 			break;

-- 
2.47.3

