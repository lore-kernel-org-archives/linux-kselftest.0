Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1880E282F0C
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 00:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457979; cv=none; b=OEi50qBCSVBjPLqMcjQeoP3Pja11X2sPjG+flEa+eZFsCV73MFQBjc1bHEzzasQJUb6fRoz2CXzhiqkR/zbndybfATdrZuj/gGyvL7TL/HmZ4lJxJWSPmM/c5G+loDffQAsBatFY+60n9GCmt2xNCY2jR3W+I+aUctKkTEvCQmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457979; c=relaxed/simple;
	bh=tz3MX6RgSvTY4qZxc5WPPga+j7i90nNZ8gjHJTr0Cok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1ETTnhKEz/SSKTbdOw2M4Ob0MeWh4FgdeBzSNC8c0j3kWPopTwEU3dH+mVQKZPPcQ5ML9qh95HucElwHUDsouYjm6q0DFhqhdKidJGJV5ZeABr5g4o8NM8L38+9wznHtzXgYqiXe8IsGRE4VqJxKXp4UuPhf7AtAcbpYxCq3k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qyqwx3sD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qyqwx3sD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ce98cb8165so2719505ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 17:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785457972; x=1786062772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQn73DnaYnP2eIm20VaPqmI6rB049cGwP1GfXwnXLN0=;
        b=Qyqwx3sDUcas8hPDOeViEqNCsqPYW+m5UpXqwCEsCxz2bLj8r1145iVmNS5PWZmrxN
         F4DTlyE/3E5l/QyzcBgyMYPweG1Z7nnp7TlMFkEmgP0q8jNmEclWAM1KvfBec3XauyZd
         DjISJN4YszCBVmB9pGl36RFb+kkZjHeG2dEtpP3t5EMiAxEOAbKt8RwKFuiAa02Xf/3l
         CFG6Lm4a8mziBzP1umPb8og5jJuls2mX/oLmdMn2yM5STVwTkRQ8XXLyu4eh00rTDHS7
         9xyk10KWjaK2lAZnQly9fzrbRvlM2LvuCVAe71LDhZ5hUDnEprIQO7CeMtWKAdIG6+sU
         yQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785457972; x=1786062772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQn73DnaYnP2eIm20VaPqmI6rB049cGwP1GfXwnXLN0=;
        b=PH4bbmPdB+yGF5rWJCI2Yxt+O3VFrxVivjQ2fX9PyPhiKjNCS6Yj1RBHxtB5qfz2WS
         if8SlLNtq6lOxg3bGs/SKdo7icPuLbFidexCOJIy+w1FrnDqBVCvSTDLcYGGA6wVRVGd
         oOnDBVvLhPvQVrYaniDcpLZYzMr9ZXXBi/vE+cgBe3UrEsvqo24E/F20TS8JQIHCimE3
         c8RM/5iKQ+33h0eEg3yRbdMjO63QdTUEBtcsAFFgJVrkqCZTkB6DCoFz6fVWsyxxtAgf
         v0caOL73yYscu7B7unHK4Ko+7ePzp5Gt20Umb3vCuO9xy2t+NgbfQYr8NvQOXO2wnp+g
         KnTg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/xm+4zmQ17huQ3gup4RrbZQfKkUz43l53mLu+1x+GmdBUFQMFVRicyT3aTtET73KuAEJvinyWaIcTifDYH7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8WJcG4U3cJoqjHZCuBS6HEmKvNaUcFwZSfjtzWd7QoytQKF3g
	O/ZI5JXfWik2vcbvipwffGUn04XqdZr2axFp2denSeCHZ2Oc1YilgU2g
X-Gm-Gg: AR+sD12crtdPi3ee+eVq2EsBkENVE2ulMgqGMVUPrq59IYgOteXfS6rkezJR5yh4/aa
	QrYfV3fTHspaMGdfgrvp7lfHHi/2f4dIPYYp1lRH3PxJCFre9VyCJ5rVg+CdMxeage0XymN/BZ7
	jSqtanOX0STxfR1YvX5Bkv5CLV8nkaI2jXyJiT8qDhCmLVE4KHsbEcRPFr4N0f4HEdgVOK/3aZa
	NrLv0prXxlgs+++7/ra239Ztf486f9/EKRLlysbb+Eczn+AUooahK2RW2CmNIXL8CK1h5HB3S8e
	/9H9Oqra1eidq8nSyRzA1GaxEYaI/oTyxvR4/dfRH3fgKTQ/7sd7kO3GLoWpgIPdynMkNb3JQRV
	boc/Q5Xymyt/iSM/XNMaT27MzGsOreu71NsRObZzuCMEUPBL5qBP4nk1jTQ3BvanzpxtIe3vtAt
	wUgYgg74mpE9h2KFD6vI4v+mi0KJLkra6Bjqlf2xifOH0EJ+8MLgnrMForeA==
X-Received: by 2002:a17:903:2406:b0:2cc:db7a:251 with SMTP id d9443c01a7336-2d03e040e56mr19629885ad.2.1785457972277;
        Thu, 30 Jul 2026 17:32:52 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:54::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc6d87sm32755215ad.38.2026.07.30.17.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:32:50 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Thu, 30 Jul 2026 17:32:11 -0700
Subject: [PATCH net-next v7 2/3] selftests/net: ncdevmem: add -b option to
 set rx-page-size on bind
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-tcpdm-large-niovs-v7-2-033d580a619d@meta.com>
References: <20260730-tcpdm-large-niovs-v7-0-033d580a619d@meta.com>
In-Reply-To: <20260730-tcpdm-large-niovs-v7-0-033d580a619d@meta.com>
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

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/drivers/net/hw/ncdevmem.c | 36 +++++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
index ffe1d5c1fa4e..918e3b51f3b8 100644
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

