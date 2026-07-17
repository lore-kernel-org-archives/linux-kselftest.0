Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9D33E7BBC;
	Fri, 17 Jul 2026 09:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282124; cv=none; b=hoKDtLeXKHKTKDa6yeRP0YiAe7JNMf3T8Au/Hz+0OpbfqGY+cP5DJq4Oa3lkDGb/e97p8D/qXVJL6Wnn+F37INYthf8KFVWvz1nFIJ0UGAnBgyIFSvDtgOK290YDydmOAgT7UyVwMCzBlw67NHacToV2s94D2HbO1mAYP+PgwWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282124; c=relaxed/simple;
	bh=jJ4dPiOt0VnW+1/y5QpkX2tVW+trXodIRZaAJVuBLUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=BZMg72PbfXlqjZ0I965w9m4VrVT7I4SJn70zxQbA1sHc9YaQL0ssjWNWpfpjLD3r2cdvxiKaFviRPymylYwS4A4vvyaG731mDA0jtMBYYKuXkyBkYudMCvwGpxWBm2fK3x2eEWu66d0qT/fdEHELtDfmNj00S1bMqZicS2U55Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4C0D0200205;
	Fri, 17 Jul 2026 11:55:21 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 155A02001EB;
	Fri, 17 Jul 2026 11:55:21 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id CBF2E1800229;
	Fri, 17 Jul 2026 17:55:18 +0800 (+08)
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
Date: Fri, 17 Jul 2026 17:55:45 +0800
Message-Id: <20260717095549.10565-3-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260717095549.10565-1-xiaoliang.yang_1@nxp.com>
References: <20260717095549.10565-1-xiaoliang.yang_1@nxp.com>
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

