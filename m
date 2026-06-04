Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22ED225403
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 00:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780533791; cv=none; b=gjyMgtU1w+qnC+0tn/ZsiZzrYpfzSuHzkVk2tfvMFzvCH+RYoZJ2ESlZ2ih0cZHIzM2e9VZAJGZ+teh0DM0WaHGhc84gr1TxgWSJuSlCIfJDkkh4K50bIWYlVZyyQivZEgAaLpgIZ9R+1sY0Su3KPk8TOdQRLUvWshhMo+VwkVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780533791; c=relaxed/simple;
	bh=9z1OHN5xpF/fsVsqPXa5vg6ICHYQvZOvBI/HAuTjNNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2YWybpOt8QXMsgFdSzo88ZFuHMCb/tFi8F2nRwTr483uUdATnWHYwgdDCmecSO61j7p8e+YSHWWK2pTbzUNgL3309+u2MGAbbigeIzqOR5q2ecmX6ID3mkQpecD5Z1viLp2z1LDJBHpVMmlq0z4P/OjmlqJzgLgxKHP6+w8Czg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRfxb9rR; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRfxb9rR"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c858b5de728so101510a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 17:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780533789; x=1781138589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPElRdLQqSlIpSLm9S4Z23ki+7V6eQuSW40WuLFvr5g=;
        b=lRfxb9rR1o+usdbf/PVBC2mqE5SHI0wM7Mu6ehZ/CbF5H9rIZzwwLDgGXqQ28YUFux
         +hOblwPz+t4xDvdFUViqs3Paxxn4L9zSt/ZN+tr1nfVe/65l+jry1yBpWll9iStsds0I
         coPFml+dvATeqEqSDjJmGBlso739dP+koHLgiBSroxDid5uZ6oGWfp83RFDpEuxGIGBV
         cyOhxEarJuqzOT+KNo/J4vuDZAon6gGRpgbtHfjoCkox4zCsJtgEPeFvG8LedL8MaZTS
         vupNs5MT20IT9SmlRH7BhZM3oyoUAiaLcI4OkHQrppT91Qc15MrQfGVm46DsbFO0RIDu
         wPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780533789; x=1781138589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xPElRdLQqSlIpSLm9S4Z23ki+7V6eQuSW40WuLFvr5g=;
        b=QjDu2GzGp2hNuXqIz24f6dtBO504QPEkNul+iaP+tCwXhhYa5zkhzvLg6KLPC72oUY
         uMj1i2yiYzNoIKco3B2UIpfrAkDfSiGxz9OZZffO0yq3OdXiMIZ82jzFa9LOXtOR+BDU
         5KPIlyaoCO/3qdw5hjE6CBDgJQzqUSWVmFfVMBl9xDy6JU39ySewIsyea8bh2VU6dA64
         ZXsvZpmHqtrVOj74zdXE8FLcLFjTIz06csxRdXbYFfD13OIG/Cg02vRdP2XqXKR+Ksl+
         i7dMyfj6n/dydCSoehhx7vgs8gWb8lEQdoBLwZV+aAvM+4WzSd1dfGfjGF8g2UKKZqOD
         Q8GQ==
X-Forwarded-Encrypted: i=1; AFNElJ/975bR039XdH5yPB/J2P4PaEjDlS1LC9mJfiF7O8kFlZx6p8F+qIoyt0aShtqvMtnryojumDsyABHpgqzeKag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz64LUipAcrTh7h6BLRg3CmbljCCnV2XQzcGGJWcIORpoXkP+5y
	5J7vtEWBT7hsWHZ5XQ9oHngE592ehYo5NUkcL1aCwG4YbQqmvDE136Qv
X-Gm-Gg: Acq92OE3RHKoY+7Rsv2sJN2eqRe1enf60MRdKDLpD6yLSgeYNN4ooJX2fBipj3+bgJr
	eWiVWWTUN+Im3QhuEy9l0MD7bVw0UjiMBH58xCv6l3rXMnHC9IKleRErasW6cJRS2G41fdSymff
	7c0xzW8R57eIZ87t5Vx85JuZQjdKNnP0ohreo/m2OJVBGzKdQWOczdFW9gCl0BFRGA97HzsPFHr
	WjXAt8Kw+k2DcHjFRykRw1mk6U1SK72MvTS9ozv9bD1+++9oSG6vGnUzPNdtA8fThbkUSrIPUC8
	6D0q0wFP/NbEdi3vCX5Xpn038gFTElGB8zpG6gek5vpToGNQYehaGTlyMgOU5O164LwaCTcAHfp
	b8Kgtl1wi7m+b5cN/OTMvPVXMHwjVcnc8/+6V2NSmO1oLSxD1mg03cutZE0ZjrDwNv3SJjX/gmu
	MpnX02ywG/PHvz1o3QEmmFBKdvDfsc8Q==
X-Received: by 2002:a05:6300:67ca:b0:39f:3ca8:a331 with SMTP id adf61e73a8af0-3b4974cc6d4mr6579788637.16.1780533789092;
        Wed, 03 Jun 2026 17:43:09 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:59::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04a0e9sm2879012a12.13.2026.06.03.17.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:43:08 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 03 Jun 2026 17:43:00 -0700
Subject: [PATCH net-next 3/4] selftests/net: ncdevmem: add -b option to set
 rx-buf-size on bind
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-tcpdm-large-niovs-v1-3-f37a4ac6726c@meta.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
In-Reply-To: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net, 
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com, 
 dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add -b <bytes> to request a non-default niov size via
NETDEV_A_DMABUF_RX_BUF_SIZE. When the value exceeds PAGE_SIZE,
udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
hugepage produces one naturally-aligned sg entry.

Reject values > 2 MB up front: MFD_HUGETLB + udmabuf can only guarantee
2 MB per sg entry (one hugepage), so a larger rx_buf_size would fail the
per-sg length/alignment check.

Add CONFIG_HUGETLBFS=y to drivers/net/hw/config so the new path is
reachable in the CI kernels built for these tests.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/drivers/net/hw/config     |  1 +
 tools/testing/selftests/drivers/net/hw/ncdevmem.c | 49 +++++++++++++++++++++--
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/config b/tools/testing/selftests/drivers/net/hw/config
index b9f406dd7282..388721bee553 100644
--- a/tools/testing/selftests/drivers/net/hw/config
+++ b/tools/testing/selftests/drivers/net/hw/config
@@ -3,6 +3,7 @@ CONFIG_FAIL_FUNCTION=y
 CONFIG_FAULT_INJECTION=y
 CONFIG_FAULT_INJECTION_DEBUG_FS=y
 CONFIG_FUNCTION_ERROR_INJECTION=y
+CONFIG_HUGETLBFS=y
 CONFIG_INET6_ESP=y
 CONFIG_INET6_ESP_OFFLOAD=y
 CONFIG_INET_ESP=y
diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
index d96e8a3b5a65..325c128191e2 100644
--- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
+++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
@@ -61,6 +61,7 @@
 #include <sys/time.h>
 
 #include <linux/memfd.h>
+#include <sys/param.h>
 #include <linux/dma-buf.h>
 #include <linux/errqueue.h>
 #include <linux/udmabuf.h>
@@ -79,6 +80,7 @@
 #define PAGE_SHIFT 12
 #define TEST_PREFIX "ncdevmem"
 #define NUM_PAGES 16000
+#define MB(x) ((x) << 20)
 
 #ifndef MSG_SOCK_DEVMEM
 #define MSG_SOCK_DEVMEM 0x2000000
@@ -100,6 +102,7 @@ static unsigned int dmabuf_id;
 static uint32_t tx_dmabuf_id;
 static int waittime_ms = 500;
 static bool fail_on_linear;
+static uint32_t rx_buf_size;
 
 /* System state loaded by current_config_load() */
 #define MAX_FLOWS	8
@@ -142,6 +145,7 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
 {
 	struct udmabuf_create create;
 	struct memory_buffer *ctx;
+	unsigned int memfd_flags;
 	int ret;
 
 	ctx = malloc(sizeof(*ctx));
@@ -156,9 +160,14 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
 		goto err_free_ctx;
 	}
 
-	ctx->memfd = memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
+	memfd_flags = MFD_ALLOW_SEALING;
+	if (rx_buf_size > (uint32_t)getpagesize())
+		memfd_flags |= MFD_HUGETLB | MFD_HUGE_2MB;
+
+	ctx->memfd = memfd_create("udmabuf-test", memfd_flags);
 	if (ctx->memfd < 0) {
-		pr_err("[skip,no-memfd]");
+		pr_err("[skip,no-memfd%s]",
+		       (memfd_flags & MFD_HUGETLB) ? " (need hugepages)" : "");
 		goto err_close_dev;
 	}
 
@@ -168,6 +177,11 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
 		goto err_close_memfd;
 	}
 
+	if (memfd_flags & MFD_HUGETLB) {
+		size = roundup(size, MB(2));
+		ctx->size = size;
+	}
+
 	ret = ftruncate(ctx->memfd, size);
 	if (ret == -1) {
 		pr_err("[FAIL,memfd-truncate]");
@@ -699,6 +713,8 @@ static int bind_rx_queue(unsigned int ifindex, unsigned int dmabuf_fd,
 	netdev_bind_rx_req_set_ifindex(req, ifindex);
 	netdev_bind_rx_req_set_fd(req, dmabuf_fd);
 	__netdev_bind_rx_req_set_queues(req, queues, n_queue_index);
+	if (rx_buf_size)
+		netdev_bind_rx_req_set_rx_buf_size(req, rx_buf_size);
 
 	rsp = netdev_bind_rx(*ys, req);
 	if (!rsp) {
@@ -1411,7 +1427,7 @@ int main(int argc, char *argv[])
 	int is_server = 0, opt;
 	int ret, err = 1;
 
-	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:n")) != -1) {
+	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:nb:")) != -1) {
 		switch (opt) {
 		case 'L':
 			fail_on_linear = true;
@@ -1446,6 +1462,33 @@ int main(int argc, char *argv[])
 		case 'n':
 			skip_config = 1;
 			break;
+		case 'b': {
+			char *endp;
+			unsigned long val;
+
+			errno = 0;
+			val = strtoul(optarg, &endp, 0);
+			if (errno || endp == optarg || *endp || val == 0 ||
+			    val > UINT32_MAX) {
+				pr_err("invalid rx_buf_size: %s", optarg);
+				return 1;
+			}
+			if (val & (val - 1)) {
+				pr_err("rx_buf_size must be a power of 2");
+				return 1;
+			}
+			if (val < (unsigned long)getpagesize()) {
+				pr_err("rx_buf_size must be >= PAGE_SIZE (%d)",
+				       getpagesize());
+				return 1;
+			}
+			if (val > MB(2)) {
+				pr_err("rx_buf_size > 2 MB not supported");
+				return 1;
+			}
+			rx_buf_size = val;
+			break;
+		}
 		case '?':
 			fprintf(stderr, "unknown option: %c\n", optopt);
 			break;

-- 
2.53.0-Meta

