Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6E1374724
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 22:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700168; cv=none; b=EDCOVwFnlITjGz0e9haz7nXzu4a5LqTQmUFLLm/Vx/1zyKY3/M8t2kN/fggAOFyKgiYAPHMTzb65RSNsf22QJXZXs8j2RlqnwdgAKZoGuXzdyOQdhAvR5sFa1zQMtilNCz7bRsGkRyCX3fbu6Y6fOabQKSCr7NeSWw99KgmEy1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700168; c=relaxed/simple;
	bh=/P0d+nw6nfgOf/J+mWp3OvTpE+gexpCsKViZnKl4q1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YztKFaZ9GFgnuTw3S9sK3A8eMGF56yYutfW/rr7kln9hYXx28AR7WhQZGwlPvmAUETVGfWsQ+LQP58e0yGPDWgqGCDQXegzv+AP+o+XtoKdIPQ0tvf3DI1cCsjzYe0gyTqIKcgiv/ykkUzU5d05RTIdysVaSJxWzKp+tlROSQio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAqOjnGG; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAqOjnGG"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64ad79dfb6eso5658012d50.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 15:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773700163; x=1774304963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S96bHHsurulXmzp5TnD3Oxl/rMQZJqmo/NVotofYdL8=;
        b=QAqOjnGG0Jv2OURrXwx7PmcDsowNCIK0MRaxWCN6KFwiag+AaCAw1Cf5WGo8N33byL
         4s4eHKURikLcxJ9LFDzULH3YOfKLg3LGBAoiKTwrB3rBlBbl5GXU6xmOIjmZOHXozb/R
         JLWWf5uT+FoUNeLVgMYFl9VgllYkQKjIDJbACYNL+ct2der+FYRYI4+6ywMcusyEYyJT
         bb6t6TO41s/afoJveIB2x6db6mIqIDT6ouH0whvqw0h9gFGR5InF79IFV2veFr0RsHYY
         CKXaI1r7LX2d5VxV6xVSyncJgVZAVrBS1slXdF/vYWXInwUGoqD2GVHxzldNBAALQXUx
         IIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700163; x=1774304963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S96bHHsurulXmzp5TnD3Oxl/rMQZJqmo/NVotofYdL8=;
        b=QDAqF9s/JxEEsqJTZ8+Omz3VIrO+6+ER5xvV3BUFJxNx9cdjymY6m/f2LmJjYjhAJS
         2eGNQMM07HYjQHLC21xHHU4BSg5jU+iM9dZpHn3H3aqz+mjFngDxEPQY0ttRhxKGlXLc
         LlAmXnMLxE+RfKE7uEcFuVi/QZiwHgtNrjRiwaXVly5MLGjtPcVfxt73GbA1NF0mlS0D
         KtDwxeAskS05mxpZL/Ei4qbakB0HVvoyLivKOZyQdKhEFO+EyaTzuEI7/z8LK5gMP/Up
         WPji+NTnvHr3hVNZSF4A4n+gAugnHSl49ZX3iqvmyMiFnp3PsUm839AFvIvni/NYFrH0
         OklQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU5Zu8gEMmCKsE0zzLWcv1lg3qb/wACPFo8NoeP+dY0Vu2Ux27oZqhTy5o5QrDNaVRE1YWtsSWYun/EXzZLIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaZIw68ySR33Sp0Kp5yrxTtNOelV+Yt22V29jRF/8654TsZf9a
	if2P3DjMriTTMjKr9uHkTFK0ARsycJc6jy9w8zcIBwKamb4qoNopt/g1
X-Gm-Gg: ATEYQzxgaSs2BSXcgCzHdFLWtK0uvUODeVxtaDyyF12AUhpi7xlsOGr2rfSlt49M1F3
	Zp8F7iaWNUlDdYDT0gCo0BvEHaJ8gu4oAsJ1EJbsEXf2m8jjpGO+viTszC4AZkYxQ0C9LpetdOC
	cUQRsm9dGfxG55+dulb73VNCIOo832Z2w+otO5TJAXVxQXz03SaUMjycT8oB22cwhl6VDCjryJT
	ylbEsitQKp8J5lW2GHMCesLL/P1d9V0WMPFoIKYwVQP2DpvTTouDXyvDQM6Zb3c8G0Ur+2PWy+H
	VRT9c80VBUpuk5DtGTX4StiNgj/NQuEJiIXqCxaox99rNNidnaUnrdwPCkrTsfPEaEkY1+/7dYv
	C4YGsvQpqrn0gC5Nwcm7gLZaV4nYQYEK/aTTfKTH1Y1f5XfnOR95DAJB/uc9kHc5itfBdEvslvr
	/rp5sn8Ybvd3hFi83ApR++Mw==
X-Received: by 2002:a53:7404:0:b0:64c:97ae:2e75 with SMTP id 956f58d0204a3-64e6309ab39mr10701854d50.69.1773700163558;
        Mon, 16 Mar 2026 15:29:23 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:4a::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65a3bedcsm6286875d50.1.2026.03.16.15.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:29:23 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Mon, 16 Mar 2026 15:29:14 -0700
Subject: [PATCH net-next 3/6] selftests: drv-net: add skip-config flag to
 ncdevmem
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-3-b53c8cd72b23@meta.com>
References: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-0-b53c8cd72b23@meta.com>
In-Reply-To: <20260316-scratch-bobbyeshleman-tcp-dm-netkit5-v1-0-b53c8cd72b23@meta.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>, 
 Mina Almasry <almasrymina@google.com>, Wei Wang <weibunny@fb.com>, 
 David Wei <dw@davidwei.uk>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add a -n flag to ncdevmem that skips hardware configuration (header
split, RSS, flow steering). This is needed when ncdevmem is run inside a
netkit namespace where hardware configuration is managed externally by
the test harness.

When -n is set, ncdevmem skips configure_headersplit(), configure_rss(),
and configure_flow_steering(). The calling environment is expected to
perform this setup prior to invoking ncdevmem.

This is used in subsequent patches of this series that bring up netkit
devmem TX testing. ncdevmem will only have access to the netkit inside
the namespace, and not the physical device. Therefore, in those tests,
the test harness itself does the physical device setup.

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

