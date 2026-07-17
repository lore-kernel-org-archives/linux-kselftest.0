Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE4D3E3C5A;
	Fri, 17 Jul 2026 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282122; cv=none; b=DqK3vRJLlnkgBN/DopT9DOtp5kVK8kiEfrhGeOHYE6PITdTZ096vjWoBlW0CbH2CD2jnQAqZtVit2fWqOGrwxERYPWo83eJCOQa8Q+kC+9KUo0u9kwb0dmnTQze1MGt2uvD8sDrZ6b2GfBIQDjcO0XSMatBUViasF2TLIoVIhbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282122; c=relaxed/simple;
	bh=DDeODc45ZxenPhxOiIhZ5Kw72EyW//h/t+rD62y0OqE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=XtbYDtgEpgT3H9gCb34xsFiR1JGmoafF78Rq2nVhziSJdC9yzMx7wkfRAZj6UqEGg8mksJUNVXlcZGIlU0qTDwocZwVWQnVocec3Z8VF4ZYcwFFO7oKUXr9JhVuWUlX9j/BYfocxDmANpEZ4PUj4JfqsqM6Y8ThB8qAppXex2MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 720C81A0206;
	Fri, 17 Jul 2026 11:55:19 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3A2391A01CE;
	Fri, 17 Jul 2026 11:55:19 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id F0E3618000B5;
	Fri, 17 Jul 2026 17:55:16 +0800 (+08)
From: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
To: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	horms@kernel.org,
	shuah@kernel.org,
	vladimir.oltean@nxp.com,
	vinicius.gomes@intel.com,
	fejes@inf.elte.hu,
	xiaoliang.yang_1@nxp.com
Subject: [PATCH net-next 1/6] uapi: if_ether: add ETH_P_RTAG for IEEE 802.1CB R-TAG
Date: Fri, 17 Jul 2026 17:55:44 +0800
Message-Id: <20260717095549.10565-2-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260717095549.10565-1-xiaoliang.yang_1@nxp.com>
References: <20260717095549.10565-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The IEEE 802.1CB-2017 standard defines the Redundancy Tag (R-TAG) with
EtherType 0xF1C1. Add ETH_P_RTAG to the kernel's EtherType definitions
so that it can be used by tc classifiers (e.g. cls_flower) and the FRER
tc action for stream identification on the ingress path.

Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 include/uapi/linux/if_ether.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/if_ether.h b/include/uapi/linux/if_ether.h
index fb5efc8e06cc..2d909078cde1 100644
--- a/include/uapi/linux/if_ether.h
+++ b/include/uapi/linux/if_ether.h
@@ -122,6 +122,7 @@
 #define ETH_P_DSA_8021Q	0xDADB		/* Fake VLAN Header for DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_DSA_A5PSW	0xE001		/* A5PSW Tag Value [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_IFE	0xED3E		/* ForCES inter-FE LFB type */
+#define ETH_P_RTAG	0xF1C1		/* Redundancy Tag (IEEE 802.1CB) */
 #define ETH_P_AF_IUCV   0xFBFB		/* IBM af_iucv [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_NXP_NETC  0xFD3A		/* NXP NETC DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
 
-- 
2.17.1

