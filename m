Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55C32DEA6B
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 00:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940886; cv=none; b=riV+/e9B/it80vDQfgNH5PqeQz9SADxrJIiN3yeyzuFxhHrmt9cXJ+LcJ+T5mtf9KJz0KHwKE7/X8KOy7Rg4gRjLAZataJu+7vvFo79XCze6eA0SkFIt1oMowBKGkW0XhMpGUEDOAY9zb+ibY+mctJJ9kzPkAV+fPsjJ8GSHv5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940886; c=relaxed/simple;
	bh=PfZ9xMHw6YVTqz7Mn9CLexmMOq9qX3qQOU0tAn/sFjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CcvnGWnliNsYLbWosvpcCpI+XgQaO6yZAX9idZxYQbRYxY9zEAEqJyietxbwJSJmETHujMec5h28PNcnS0qgs66Hh4D0Ogiog56ZNlfBw/kkqPn32TATciNO/oYG3CS9Ua2YMoTv0oSluPUSKeKEr+0+LIXuLYWg4wFmSmzynhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfnTRsEC; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfnTRsEC"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50d880e6fbbso53498111cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 17:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777940882; x=1778545682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iic/TyuRCm/AuLebHAyrx4jlilsGhca+q3E++rpbwwU=;
        b=FfnTRsECXQsZjqTDJe2PyPDXAzWa8Ktvhv0FACbeXjfKUNGhvFaxm7FS90gObR614J
         +Bd0WXKF0p9jzn6UADs3iNsGt5l8X4OBHVrMBuVsuvPo/rgHv1Bsjl9W2i6vbOleooSl
         fJWuS79i6dziv2u6+3nJo8DRHrsxSpd9ENpxG3sy8lBFWuIug2bdtx/JH92uZuBc68Pg
         VGj5/vjHbxDA3jZP5r1punyrsIrcZUACm9l7c4Kxo/HUhM19zUI0WSaeIT76GxNTn6Gz
         uvb3Yt5b18Pagz0glQvfqKCUBjWZD66ZMlvyoOzZh24sTHKpB/pj9G9ygw9MBuqCWUaz
         8ZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940882; x=1778545682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iic/TyuRCm/AuLebHAyrx4jlilsGhca+q3E++rpbwwU=;
        b=nWrWD2qDlgembjNhN430OT0xt5qCSVyemi3m0wslFcndhHVD4wR6uEEiHpAkGyQesl
         gtYoJmlo7JFk2LYFGdOR8LBuu1JKzWzNuXDx+1NOgrcjaNhcHzWPoT01dCtKsq/oCXHC
         vqgdsvSXTqnwt6mGwQ0UrLI0wjj5TjAuiz5clDH8m8cZd2+q+b8tc1FxYayo2lomFSj3
         Tvp0ryfoxyElW7gILKhOLtNH1Ox0+dnBO/nGGILw1W3b4ITB6gYDf9IsYd5GiSPQNkyd
         1onEkeJuIl0oWQOm3aITKasM3hShLQU8U2feJqgnLscIx1yQ28M5BLqOVmSHjXW5csGb
         87rw==
X-Forwarded-Encrypted: i=1; AFNElJ9pDI4wL9/Me/0aeqbpmVghwzFcfoZ/6DSW3fIxRq8fnqZJYHaiRqm6HCEoyIDWdOxrP7+ErY6p20zl1z00gf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW5RumcmiaHq7gHz0xhN+Klusq0C4iEImd4S9QJamIgWJt8Hhp
	dZdq08msZVOlK9H89LuRi0noEv1eS5bJl/G3hoO8i7OUAemSEDrqf7XM
X-Gm-Gg: AeBDieuDB5vPe2/fiftxniBuSyjQIjOitMnfKfXrlW0ZttJfyFMJSs9BJAZI4Iu+nO5
	uvJ7JlT/+O4JQ8vZBTbvfGwtP0Njzgrf/JrCjGJgAsKO1u97o4qQcwMm/COQmf8j/vEM7c9wMG9
	P8bBFvQRUEz/mFvy/IWYNyUn9xZrc64LKqA/pDUzkr/wGlQIlsIALiT8VI73kt7YVwB5Wp9vxh9
	/WKzkfMskWX+BNs9fOtuQMVp++seID+mdEwB42CGqh2V0mzeDOZZdJxsIJlZI/eo3QXP1wU38do
	8w383W68Km7szYStAvohepviioxdQn6T6+PoE/FDRNHA3jx4lSJExHa+4oCI5Tp6s455IxIaJVR
	yBEHy1Ya1Os9a7yjevRd5aWV1NM+hDXQbqVVyT90FrcMpV2eKptL4JSOrLVNf8pJOUQHa+KB3As
	DXWjSNOWiZS0hzGrUwv8SeS881veogHsKJ
X-Received: by 2002:ac8:5ac3:0:b0:50f:340f:ff35 with SMTP id d75a77b69052e-51305357ffdmr24064071cf.26.1777940882452;
        Mon, 04 May 2026 17:28:02 -0700 (PDT)
Received: from localhost ([2a03:2880:f800:1f::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040ba8967sm107237721cf.29.2026.05.04.17.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:28:02 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Mon, 04 May 2026 17:27:50 -0700
Subject: [PATCH net-next v2 3/6] selftests: drv-net: ncdevmem: add -n flag
 to skip NIC configuration
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-tcp-dm-netkit-v2-3-56d52ac72fd4@meta.com>
References: <20260504-tcp-dm-netkit-v2-0-56d52ac72fd4@meta.com>
In-Reply-To: <20260504-tcp-dm-netkit-v2-0-56d52ac72fd4@meta.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Michael Chan <michael.chan@broadcom.com>, 
 Pavan Chebbi <pavan.chebbi@broadcom.com>, 
 Joshua Washington <joshwash@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add a -n (skip_config) flag that causes ncdevmem to skip NIC
configuration when operating as an RX server. When -n is passed,
ncdevmem skips configuring header split, RSS, and flow steering, as well
as their teardown on exit.

This allows ksft tests to pre-configure the NIC in the host namespace
before launching ncdevmem in the guest namespace. This is needed for
netkit devmem tests where the test harness namespace has direct access
to the NIC and the ncdevmem namespace does not.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/drivers/net/hw/ncdevmem.c | 58 +++++++++++++----------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
index e098d6534c3c..d96e8a3b5a65 100644
--- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
+++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
@@ -93,6 +93,7 @@ static char *port;
 static size_t do_validation;
 static int start_queue = -1;
 static int num_queues = -1;
+static int skip_config;
 static char *ifname;
 static unsigned int ifindex;
 static unsigned int dmabuf_id;
@@ -828,7 +829,7 @@ static struct netdev_queue_id *create_queues(void)
 
 static int do_server(struct memory_buffer *mem)
 {
-	struct ethtool_rings_get_rsp *ring_config;
+	struct ethtool_rings_get_rsp *ring_config = NULL;
 	char ctrl_data[sizeof(int) * 20000];
 	size_t non_page_aligned_frags = 0;
 	struct sockaddr_in6 client_addr;
@@ -851,27 +852,29 @@ static int do_server(struct memory_buffer *mem)
 		return -1;
 	}
 
-	ring_config = get_ring_config();
-	if (!ring_config) {
-		pr_err("Failed to get current ring configuration");
-		return -1;
-	}
+	if (!skip_config) {
+		ring_config = get_ring_config();
+		if (!ring_config) {
+			pr_err("Failed to get current ring configuration");
+			return -1;
+		}
 
-	if (configure_headersplit(ring_config, 1)) {
-		pr_err("Failed to enable TCP header split");
-		goto err_free_ring_config;
-	}
+		if (configure_headersplit(ring_config, 1)) {
+			pr_err("Failed to enable TCP header split");
+			goto err_free_ring_config;
+		}
 
-	/* Configure RSS to divert all traffic from our devmem queues */
-	if (configure_rss()) {
-		pr_err("Failed to configure rss");
-		goto err_reset_headersplit;
-	}
+		/* Configure RSS to divert all traffic from our devmem queues */
+		if (configure_rss()) {
+			pr_err("Failed to configure rss");
+			goto err_reset_headersplit;
+		}
 
-	/* Flow steer our devmem flows to start_queue */
-	if (configure_flow_steering(&server_sin)) {
-		pr_err("Failed to configure flow steering");
-		goto err_reset_rss;
+		/* Flow steer our devmem flows to start_queue */
+		if (configure_flow_steering(&server_sin)) {
+			pr_err("Failed to configure flow steering");
+			goto err_reset_rss;
+		}
 	}
 
 	if (bind_rx_queue(ifindex, mem->fd, create_queues(), num_queues, &ys)) {
@@ -1052,13 +1055,17 @@ static int do_server(struct memory_buffer *mem)
 err_unbind:
 	ynl_sock_destroy(ys);
 err_reset_flow_steering:
-	reset_flow_steering();
+	if (!skip_config)
+		reset_flow_steering();
 err_reset_rss:
-	reset_rss();
+	if (!skip_config)
+		reset_rss();
 err_reset_headersplit:
-	restore_ring_config(ring_config);
+	if (!skip_config)
+		restore_ring_config(ring_config);
 err_free_ring_config:
-	ethtool_rings_get_rsp_free(ring_config);
+	if (!skip_config)
+		ethtool_rings_get_rsp_free(ring_config);
 	return err;
 }
 
@@ -1404,7 +1411,7 @@ int main(int argc, char *argv[])
 	int is_server = 0, opt;
 	int ret, err = 1;
 
-	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:")) != -1) {
+	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:n")) != -1) {
 		switch (opt) {
 		case 'L':
 			fail_on_linear = true;
@@ -1436,6 +1443,9 @@ int main(int argc, char *argv[])
 		case 'z':
 			max_chunk = atoi(optarg);
 			break;
+		case 'n':
+			skip_config = 1;
+			break;
 		case '?':
 			fprintf(stderr, "unknown option: %c\n", optopt);
 			break;

-- 
2.52.0

