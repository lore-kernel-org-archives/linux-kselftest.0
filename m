Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0142E44C4EF
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 21:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784928110; cv=none; b=mYdiriKJ04Mi5CS14Ffxv0OLP2kdE+IE9LaQZzsvkJSd9ble+blDMHBuqebF140AmKxp6uruqIGQYW0OJsXJkT7PslBeFsqVr04f7k+Xz2t6DnzpEaF7vSCECHXfjMiRHLphzIGa4ICx7iUpbjlrwShOWZtAcccvmNDWQuwEc0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784928110; c=relaxed/simple;
	bh=NRtHEkVZJAVGq67dgJbG7XlxpkURYn25ZP++g1FdIE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fs/icyUKx4e4rGyrEE2f4CziFF+2GSB5P9R9cqcmQHNlLZWHZI/sAM+3fBVHXxEr7X+8rXlL9cfTwsEU/WDK/eDqe9QCH/MCWXPL6L/VtlYKyxZSuBJ5niYwrYh22cIHUz/2kj36HPBzaHKJlPmtjpJvf9I6sqeLMQF7HF2aiAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8n5NaaW; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8n5NaaW"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so940541b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 14:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784928108; x=1785532908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwbrRJxFtRMglJHsKStZHneRkjfPxcqBpbuMqDOPwOI=;
        b=Q8n5NaaWwcIMBjq4rUlizDWClldOofwauDxPQSgtmkkUBXGE0HsiTagy1Fww+54HQR
         B8jlJT0lUvRyEWCfc6YpenBH7dbXvCMHh0dwsy+uvGcNe6+qvjukG/WpVDeY72RZGMWA
         HCQV27/V9qx8KG0nkNgYMm4mU2EGi+aLR3uKZWrSWBHyebYUDnVzQRK1uyOGmx8xvSvc
         s/IfIn/tHo73qRCqYAWGnNMRTy60xi3Bj6MyuVbVpNkE3xWOX1EvsIVX/d3OHWCZQCGk
         Zq3Fzvn8IlNgg4QZaGMJ/rFjiobuzheOeom3qkf3Td6PkT+BPQJjzRcAx4QRkuI/BgRZ
         WLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784928108; x=1785532908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwbrRJxFtRMglJHsKStZHneRkjfPxcqBpbuMqDOPwOI=;
        b=cNc1CyihAqFJfzBZyUqeOu6KMfs3Vsx+dwYPsU6e8PvnesLEUjEaYp9KhuCg323JKx
         mj5rKns+YeeXMNypiUXt1o4P/6DRJibXxdhLtW1s3To9dYmjhIC7urVZRkHT2NhcYYP2
         rq4h59XJUqunF3YCMB33FlpYvDp5tnHEByNDxXuXjEEIB6aDWKYYm1wvwv20e67xmgPR
         qfz3PLGKUSmywb1u5Pht0iGpGk9nZSu6KLy05BmSyVLRPyAJIc5cknltlrsYCnsI5xNn
         JVrnyWTvodRYPzSuWAEwLoPxkpt/sqorwf6NDExxIrSlgYFLp+wjt00Mk3Nrfsobl4DW
         +m3w==
X-Forwarded-Encrypted: i=1; AHgh+RqVjPaAkc+C75exE1OKFEhdIz+SZHPeRsmj12v1BMy3dRLKdipdVDlnykFIzlbKXhfsB2u4VnAQLbMX8bGLSk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFunKP/qg7vogMTVTRxwe7hrpSoy5IGL9wDjDqRB7rQk3m78Q
	Pp5Uf+r48SlDsTaUd+mkP1XxJIUOSwMCnyF1gyDyb7lq7OYYJTdzP6a8
X-Gm-Gg: AR+sD13AjQKDpSxe8l7SS4vTTNx47bV7ui9IUfq24M2JKanaBq2qziIwM7Pf7s4gDer
	siWmUtOqeDmSudS1SGq8yW6ViciZCo7g8JLyWbo0HJVXn7ucAjczsUYfgREquWs61kgeDe9nWwi
	gfKsbf3NE0o1UfWkEk+dTZQ8+z7N/lVpSaZHqyrty7N1zmUZBGTV7tN3Qylbw6OYW/cTq+7bcfy
	8we+sfxwqFtIPQGQSaHITOQcNSiolVlnkuSgyrT+KhthQwmaQg2AqeFD745jZ8DUIcOkYuIww+l
	aqJejja4G8jWAC0e5X9R80WcWj8pBQJeu2LU+AwWVrALN9ibege1CdxB47ySGdGKO4MRlXicgeW
	HMvZ9It9iXNbToiwBhQL3jA6BqnVHtqLG2F97B4NWRj4ynJuytXM+9vDPU0LaytKdqJEZ8dzV
X-Received: by 2002:a05:6a00:8007:b0:848:40f5:ff5e with SMTP id d2e1a72fcca58-84e4e4283b9mr1491520b3a.37.1784928108422;
        Fri, 24 Jul 2026 14:21:48 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:8::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341d68asm411468b3a.46.2026.07.24.14.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 14:21:46 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Fri, 24 Jul 2026 14:21:16 -0700
Subject: [PATCH net-next v6 2/3] selftests/net: ncdevmem: add -b option to
 set rx-page-size on bind
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-tcpdm-large-niovs-v6-2-7975f62cdfbb@meta.com>
References: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
In-Reply-To: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
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
NETDEV_A_DMABUF_RX_PAGE_SIZE. When the value exceeds PAGE_SIZE,
udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
hugepage produces one naturally-aligned sg entry.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
---
 tools/testing/selftests/drivers/net/hw/ncdevmem.c | 36 +++++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
index d96e8a3b5a65..ffe8eb05fac0 100644
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
+static uint32_t rx_page_size;
 
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
+	if (rx_page_size > getpagesize())
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
+	if (rx_page_size)
+		netdev_bind_rx_req_set_rx_page_size(req, rx_page_size);
 
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
+				pr_err("invalid rx_page_size: %s", optarg);
+				return 1;
+			}
+			rx_page_size = val;
+			break;
+		}
 		case '?':
 			fprintf(stderr, "unknown option: %c\n", optopt);
 			break;

-- 
2.53.0-Meta

