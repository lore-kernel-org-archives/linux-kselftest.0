Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C0C4266A2
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 16:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194641; cv=none; b=ka0uT3zM6WfnScuj+kZkrd6XFMalXAIM8289oIn6sLumOhfRvWx0QVlBbB3bLzXcnOke+u6BRrPeOG8RjHADHFscF8MaOOFFBSHDq/3UO2CxBzCSBFI7tx75LLusRs090Znzkn/Y+P05AL0j+uIJ3rWunw5nlkl/yuyk++XEOB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194641; c=relaxed/simple;
	bh=fD+x36JGiSQJElOcmqkJr5GOdOQBqQNpcj0g8Gxi10s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kb02uMSrfJEUszReNb6QE4ggyumevDIa1dYXdisW24gSn+d8XgGLJdb86ADG5tkeTgxNULtMp3PaWYvWjlyr9N/Cw8xcNNHNU93vLAx7Gn6XIV58Qx18l+5Vd2ZVLODWips/vtk467M6EOPTySnGDZ1MxDFmtWoaPWG24e1AH+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxqDTPM4; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxqDTPM4"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-842307472d4so61208b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 09:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194639; x=1781799439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8aH/PnHGsQapYlnDIfPb1IzSgXvUuaowcmjYD6mOfs=;
        b=QxqDTPM4LrJln1hebD34F0qEWSfq+D8L1RUkju5KX2BYo9IMGPBAArt6DFI8BbOJSk
         hleWJWbweSmP23IkJVGtfVaKwTsZo/2PP1ABahyKxa7Wy+hIHki3nBTUIO934RCCjSH9
         3kGLX5eubKxlkvEDQiGMXKKYzuvt/VO9UPWL39o14W5yPMsz3EurbOM8RI5BhrBslY2S
         P654lFVBK+sd51fKrYq0yDG4earYxJLwhY+ntlzwVTxfmv8GbIp5ihk0aK8JXP2voxBR
         fvPC86dQbmfBoA5x+yPyFTaTL1Pfep7tWzAjQPebZ9jDeuG4TZ1JS42SZ7HTq49BlO1X
         qNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194639; x=1781799439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T8aH/PnHGsQapYlnDIfPb1IzSgXvUuaowcmjYD6mOfs=;
        b=b59eZxxjsqdkHjunbb7GMSWAndq8c4bSv2jGFemKRbJNc8JVynJJxFq2KVGLCy6WSV
         FD8sCb4I4I9NT1RrbB3+M7aTESoqd1F4gYI7oEV5ZBgZey7cnD59v2/AWT+X/XkhnR7q
         0Xv7WsOjrZW5Y3s8+3ur1dabdIDedod8nJ74R2Z4mWVXpERZjqgAU2nLTpTt0OdoVxyx
         FneYzzcHSicdiQj3BvMcAmITfc0t7Ve2y46nnXP0C1VePgKp3wsO0lHWxySmwqqR+Lp8
         wHhPdK68bR5671rEMS6ix0vihdZQoksiD5/e0OOAGm8y7gDvzhWV8ovqxWc4XFTBfMjR
         3Pjw==
X-Forwarded-Encrypted: i=1; AFNElJ9DAmcDrYeT0HH9Q6lXpModX3leYfC1MYedJlQtFzO/UpvAQN8njT+GZ3HPqbyCXPfaMHDdXIDEorDCf5qmPW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMhZ2UBogKnFImVSArSyB3E3ciwSId1++TBOQHL9k23Gg9Yt3N
	PHqW6Btmqwby3Kg3FjCaCS13QVZL7IUF8YSic+uct1KdOOehRCvNlUog
X-Gm-Gg: Acq92OEiNSokGhZcTTKcDYyx+2geYcBoMwZPXEQt7YaW/vWd34rfDQsnyD3dW4E+KYF
	FOHt/jIbITD3hp2QNlixWwCvvGcInqMqwbtJVRZSH8itWshwjND6wn8T1Flr0OIipB3POox4olV
	ZKsNw3/XywH5evTY+tQjEjdlEvwrt3WkPsnq+USH7qLpe+NsyUVPAOEzdUWnCvxFOfMUMRu5lRu
	qIqRRquBT0DzjZEHTaSD/UUuAuRX7qOG0GnaUWw5kYe9ph9b80GKQiStxfnf6SBsdWqSwgjVX3F
	uNGaiomiWy3k37FpXDFabHzrZRnRwI7ggIhQmv5RDlDAS49Rqzxy1eIaBSBScGJzGTXotEqnsb0
	YMb13UIzmNEKOYDrKeeYcS5DF5659KilQtPhPIb2GJHbU/L2BS/seNIN2yYc6vK7twoW+3dzz/+
	8thjcN6dts5C8Yuf30oYY=
X-Received: by 2002:a05:6a00:3a12:b0:83e:3050:d0b with SMTP id d2e1a72fcca58-843367a7702mr3874966b3a.1.1781194639376;
        Thu, 11 Jun 2026 09:17:19 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:45::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bf128bsm2656012b3a.27.2026.06.11.09.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:17:19 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Thu, 11 Jun 2026 08:28:44 -0700
Subject: [PATCH net-next v2 3/4] selftests/net: ncdevmem: add -b option to
 set rx-buf-size on bind
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-tcpdm-large-niovs-v2-3-ee2bf15e7523@meta.com>
References: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
In-Reply-To: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
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
index cd20024218cd..ed8642b68094 100644
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

