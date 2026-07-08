Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8483A16AC
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 22:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783551320; cv=none; b=bX5EXrBDmILNt2Ki6eiEgRlaOQjvT2dvbHmbZXAbs7ENNvEkrvBWDEBxqL2yydZ7A/9nCKTAbfxYGkIvoOcU4eH5u8Ai+Xy0dKulASbr1eMz9FtRXQdEDjBrfapKIw6GR4i6SyeAiuNvzqA7fsAXO9QqGCdwMLt4PCBJJ4UTJ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783551320; c=relaxed/simple;
	bh=V+zoXf55Dp0UPoFZsPQ0Q9eO5GxTO4HRWuclzYLxIPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwo9iiRKj6O5R3MSRURML+Osx0XOU5NdjFTZSp278aZN7ZaGvOk2jST6ZP/YRUL1ftnpvbYtBUjRYX6+H2alpvlFsIV4+3TC6M2H5RtBsi7/Sl/MRQEluTN4hK/aA90cymsS+DRoZrnu2XdlsjrTEeET2hvXcTUBzlzuNu8quW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OC4mQR/d; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OC4mQR/d"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-44ae14b4fd6so656065fac.2
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 15:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783551318; x=1784156118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ray7Z3XuEO/YKqK09zVWsq/dIoz2MTtQ1miE29pW1fU=;
        b=OC4mQR/dl+YVrJYZRIFQz+5x1ARgdDabqPwqtJsFeTP4wZOzYJPnKrnnUeTYKCyAsD
         YoY6G0gPqQS5IAWFynM3+57zqK0lM3hux9p1T28V/X3i70MjT9wjk5/ORQbAzK0A/4VR
         nrXvmZWXkmC1gbii0t9pc+3eZxFp92nRVlnThDzKwCLD7O0Xw3C+EWbtdWtay8es9FeG
         blglv86lPQtaJET2DjY54pJlj4Q0BIcboVpT6fGphqleTwQQUnQIeVnmSBEUKEX5HR0n
         dSy3OJg7umMdZET2qaqWoQhG4pgjYxGIbuzrlX9b/0GR43yzS3T6rO8f16w1fRolpqCF
         8OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783551318; x=1784156118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ray7Z3XuEO/YKqK09zVWsq/dIoz2MTtQ1miE29pW1fU=;
        b=TjqUl8MSt+67MMbA0f8PM72nKSySO4dpl5P72icJcbd4uXwOZ+Jc/dsowghaWL9hSs
         YLCVCHmmw42i3bqHhjhJXnusx050nAFMnwYYe+DFuaqxeh5vrFMeEKDgFhohi/Rz0HIw
         OfWdif44YA6LIyijNdJhOTslJ4dPLDENB8JXb71SwD6BqOfRc4LRkRXNbWQfzelOMoIO
         XKvksbhUB13783ms4zXj4GUysnnUKA85q3GJ890ghe3Wozttctv5LxRmjHY9GYX3PdXD
         E434ftUHXsK3RSYISDH1rnegPrZL9Dm0C1WIPzfQ6QLNPNdXGJ80iAvJ4eLR2s6ORxK4
         ySgA==
X-Forwarded-Encrypted: i=1; AHgh+RqCJwRlnGzduhzATDsw4lIVIzWWJxIkDVWai3TSEuUnJAwmszQCv9ckaaNhcB5K6kTbFItRMGpBTtFDOii4dkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBTyYN72kp7QgR/VYDIA60mQuYBuMqRM30NJ2odMoeh0Dm260J
	EHVtZPO6RgaiF4KX7A+RNISugORBroHSy2dpQy7I/GQe90w/rLS1jySg
X-Gm-Gg: AfdE7ckKB6KbRwvLvd3JuNSasODEWWScuRkYleaWt8406xLN7HdFLQEEX/m/ynP1rE4
	5pk5w5TKx3AMtIzPEkLL3BpcY9ZmNADUf6Av1xkSAb4Zxg/75J0dXxE1iQcC/a40vlhthckRtwg
	hAt/4v4KHq7yqoXAdTqpXlFtNzd2cc5RPOfdQdXIYibMogxQxjE7si3rckUPdsCjy62gxRZoBff
	8uky7+D4id2KvBMxseEfZYKtS8+4c+G8Rh+B1EvUFte2FMoV3/Of84fPIzURfrGcjvS56tCy6Ar
	1xVbJZJ+vM7QnMgkOsYqbcvQzF+lDqavStKSDPbksMzEIQVC5MoIa8cnwth8gMunb5/FDmTjQNG
	oXIpZWRg2NuMP9Sx8XgutJ2osVj8v37tO3BIyw39RFgJrDakNihnjc8hepe6ffEDaNjbGoQNGMi
	u+NEYNeKKQ
X-Received: by 2002:a05:6871:340f:b0:448:40e0:69ad with SMTP id 586e51a60fabf-451636f2108mr2800514fac.8.1783551317698;
        Wed, 08 Jul 2026 15:55:17 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:70::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45191244618sm361726fac.4.2026.07.08.15.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 15:55:17 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 08 Jul 2026 15:55:05 -0700
Subject: [PATCH net-next v5 2/3] selftests/net: ncdevmem: add -b option to
 set rx-buf-size on bind
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-tcpdm-large-niovs-v5-2-34bf6fac941b@meta.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
In-Reply-To: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
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
 dw@davidwei.uk, Joe Damato <joe@dama.to>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add -b <bytes> to request a non-default niov size via
NETDEV_A_DMABUF_RX_BUF_SIZE. When the value exceeds PAGE_SIZE,
udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
hugepage produces one naturally-aligned sg entry.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
---
 tools/testing/selftests/drivers/net/hw/ncdevmem.c | 36 +++++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
index d96e8a3b5a65..a16e55af51ee 100644
--- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
+++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
@@ -40,6 +40,7 @@
 
 #include <linux/uio.h>
 #include <stdarg.h>
+#include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
@@ -61,6 +62,7 @@
 #include <sys/time.h>
 
 #include <linux/memfd.h>
+#include <sys/param.h>
 #include <linux/dma-buf.h>
 #include <linux/errqueue.h>
 #include <linux/udmabuf.h>
@@ -79,6 +81,7 @@
 #define PAGE_SHIFT 12
 #define TEST_PREFIX "ncdevmem"
 #define NUM_PAGES 16000
+#define MB(x) ((x) << 20)
 
 #ifndef MSG_SOCK_DEVMEM
 #define MSG_SOCK_DEVMEM 0x2000000
@@ -100,6 +103,7 @@ static unsigned int dmabuf_id;
 static uint32_t tx_dmabuf_id;
 static int waittime_ms = 500;
 static bool fail_on_linear;
+static uint32_t rx_buf_size;
 
 /* System state loaded by current_config_load() */
 #define MAX_FLOWS	8
@@ -142,6 +146,7 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
 {
 	struct udmabuf_create create;
 	struct memory_buffer *ctx;
+	unsigned int memfd_flags;
 	int ret;
 
 	ctx = malloc(sizeof(*ctx));
@@ -156,9 +161,14 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
 		goto err_free_ctx;
 	}
 
-	ctx->memfd = memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
+	memfd_flags = MFD_ALLOW_SEALING;
+	if (rx_buf_size > getpagesize())
+		memfd_flags |= MFD_HUGETLB | MFD_HUGE_2MB;
+
+	ctx->memfd = memfd_create("udmabuf-test", memfd_flags);
 	if (ctx->memfd < 0) {
-		pr_err("[skip,no-memfd]");
+		pr_err("[skip,no-memfd%s]",
+		       (memfd_flags & MFD_HUGETLB) ? " (need hugepages)" : "");
 		goto err_close_dev;
 	}
 
@@ -168,6 +178,11 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
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
@@ -699,6 +714,8 @@ static int bind_rx_queue(unsigned int ifindex, unsigned int dmabuf_fd,
 	netdev_bind_rx_req_set_ifindex(req, ifindex);
 	netdev_bind_rx_req_set_fd(req, dmabuf_fd);
 	__netdev_bind_rx_req_set_queues(req, queues, n_queue_index);
+	if (rx_buf_size)
+		netdev_bind_rx_req_set_rx_buf_size(req, rx_buf_size);
 
 	rsp = netdev_bind_rx(*ys, req);
 	if (!rsp) {
@@ -1411,7 +1428,7 @@ int main(int argc, char *argv[])
 	int is_server = 0, opt;
 	int ret, err = 1;
 
-	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:n")) != -1) {
+	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:nb:")) != -1) {
 		switch (opt) {
 		case 'L':
 			fail_on_linear = true;
@@ -1446,6 +1463,19 @@ int main(int argc, char *argv[])
 		case 'n':
 			skip_config = 1;
 			break;
+		case 'b': {
+			unsigned long val;
+
+			errno = 0;
+			val = strtoul(optarg, NULL, 0);
+			if ((val == ULONG_MAX && errno == ERANGE) ||
+			    val > UINT32_MAX) {
+				pr_err("invalid rx_buf_size: %s", optarg);
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

