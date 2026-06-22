Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C9639A04D;
	Mon, 22 Jun 2026 09:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120018; cv=none; b=EJPsverNUUAqJzGqq9Eu96mejkUPsgaOqHVMIpDdCp5/YT+ZLEVY0yiqkF8FldlJZKqYG4GLII2W2Mg/m5CnY3OdmmSEwDpabtIsewSmrjSdL3Jc7YXFNIzFnXcWIcYiPcdht1WIvLv1QQzKxrA0NEi04xgF1o/6A0zMHbQVcRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120018; c=relaxed/simple;
	bh=jJ4dPiOt0VnW+1/y5QpkX2tVW+trXodIRZaAJVuBLUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=nXns+sWWvihgmC0bGDoAxwqiYD+ukqr7RWBczLpQpQNXGP3NSlC2Sf2w8jUiAUuadwSgcVvsXhdGxtqTwypOXeDM4ZSZnNSOPjXVoPiDoyxXRE8LrY3ugKzz9ZkXp5fzhMZbwUki5C53Q/MkQetyUKqe5ajeIdt4DiuU8rqwQyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9FE741A02E0;
	Mon, 22 Jun 2026 11:20:06 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 723511A02F4;
	Mon, 22 Jun 2026 11:20:06 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2FB201800086;
	Mon, 22 Jun 2026 17:20:04 +0800 (+08)
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
Subject: [PATCH net-next 2/6] uapi: pkt_cls: add TCA_ID_FRER action identifier
Date: Mon, 22 Jun 2026 17:21:14 +0800
Message-Id: <20260622092118.6846-3-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260622092118.6846-1-xiaoliang.yang_1@nxp.com>
References: <20260622092118.6846-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

Register TCA_ID_FRER in the global tc action ID enum so that the FRER
tc action can be identified uniquely among all tc actions.

Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 include/uapi/linux/pkt_cls.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/pkt_cls.h b/include/uapi/linux/pkt_cls.h
index 28d94b11d1aa..9b87f0455110 100644
--- a/include/uapi/linux/pkt_cls.h
+++ b/include/uapi/linux/pkt_cls.h
@@ -139,6 +139,7 @@ enum tca_id {
 	TCA_ID_MPLS,
 	TCA_ID_CT,
 	TCA_ID_GATE,
+	TCA_ID_FRER,
 	/* other actions go here */
 	__TCA_ID_MAX = 255
 };
-- 
2.17.1

