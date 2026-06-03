Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010023.outbound.protection.outlook.com [52.101.85.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FCB40758E;
	Wed,  3 Jun 2026 21:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780522062; cv=fail; b=ufXN35gIuj6HsoW+j8ueVBbht1aGQFwijuJmtmoG7BKCdy36O7A3fWTgXTtoL9MEqFIYtpYA6HKTXRa3O5KJ8ee7Sgn3OsMGPCIw9wNv9jQ/80vE5VrgNd+NI7fnHFNRiBnSLAbxWNGLBw7g/QMfP7XBygUEAb4y5kxqr13xgX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780522062; c=relaxed/simple;
	bh=9B/KwBb99o9r/olvx4gcCE5fvq6vYXysUR7ce9qF8LU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bZkBUwZqJsfVOzF5SvN3L8X0tOLGSbDPvCJ2cjSXNzUWwL2jo7KL8Zgmbl/1TOSleq5ifueJXW1ZGCnNJEhWWsNrXt+irgeK1PvOLOSElkNIMmdEoPCOvYHUiHD+bkcIO64FBpk2/ct6H64bRo2yW63XMC8U72acb6P39tkCAXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bd5X3NJr; arc=fail smtp.client-ip=52.101.85.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bd5X3NJr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaU2HAdFYOwHs1FpolnIH2JaiQKMhodfxXkMUqBoW96v58iTMaCv/Tue4BDUMQ6mzhZKAfh4KiibIA2Sz3kOXMojOSSl1Lx8s1G7M6QT6AhUjrewdRCViHbN4sMvQ3iFbfopKYRr0BrBBO10FJOapq1VTRssc1Ll1/Q+DbDt2MJGEcTMyWyMluNZbqgRZcgGoCFhJ000MseiZWCGh6PjK33kzymxtJYOejelq1QOmBV2TBcufDhpm/R/fc6omJFQc/VPnldNpEdu91FPzTrWr4FhEEsy6doucX+R/r7vmvJGQ+SZ/bPIG8p7Kf+EULNCCt1llu/lRBE2Tc2AHkmg4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRrqe9cEovCzcz2iSeX7VotKclDVRcvvA5IM39CYRzo=;
 b=Yo/4CJSiPaqjyneKW0sVzBbXxcNibrygTBr7ZWcm2P+jT/sq4GL6bzD6aUXVIrKTxhpF1tl9vu3BgHHd7NR0ZJsrPHTODC6TIj8ot9wbjsd9gQbu2W0HRGNE8quaJf7UwELF8V8iO2yNiFMuMblGw5+UPBuO+9Y8pz7UuJdg6iGPrCw6AZQSB6Qxz7R2FHNvaFzCeF8QQcRfMENxGM75fhfJiCgYmd6bXKIuQZT8Lrrmkr4A9jKZW8KcG62/wbVBTcm987dKozvl4XNW6oKXcHExGX4xJJ9qkvxmAoZLPvIHHkjfAvHRCPHNHy68GpUlWaYWbcyzpcfVK4wkatWVSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRrqe9cEovCzcz2iSeX7VotKclDVRcvvA5IM39CYRzo=;
 b=bd5X3NJrZn3z4RJQlYGf+Vx1Fyj57na7sE7EegH8hIZK5GH6pmnRTDN+xnvAnWt8dhtmYere6lr7G3SizsEhSJ/kWRWNJHhPA6WcGAYGr3OBdqkPPffOGBMnrEzaZugJhG8zedEU82N8kn67Fbk8RgmGoCq4VrS9XeY5DWmLREuqmwtPU80Y9RJa9sOhDHcXh55D+8frNUcdFz2CH5pd5USrLwCv4JoacRIm353wuESJ/tTsVJbprOl+bUUQBsEStL4FeUYK6uhc25TAJKMiP9afX8rUGl25cCIGgNes0S2B5nhXUM1iaBX9F5mGFG3J3allqpcKmES3x6uJZxbM7Q==
Received: from CY3P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:fb::9) by
 SJ0PR12MB8615.namprd12.prod.outlook.com (2603:10b6:a03:484::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 21:27:37 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:930:fb:cafe::98) by CY3P220CA0007.outlook.office365.com
 (2603:10b6:930:fb::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 21:27:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 21:27:35 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Jun
 2026 14:27:20 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Jun
 2026 14:27:20 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 3 Jun 2026 14:27:19 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kevin
 Tian" <kevin.tian@intel.com>
CC: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	"Shuah Khan" <shuah@kernel.org>, Pranjal Shrivastava <praan@google.com>, Kees
 Cook <kees@kernel.org>, Yi Liu <yi.l.liu@intel.com>, Eric Auger
	<eric.auger@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
Subject: [PATCH v1 2/4] iommufd/selftest: Add invalidation entry_num and entry_len boundary tests
Date: Wed, 3 Jun 2026 14:26:54 -0700
Message-ID: <9ae78ed8e64afbb2f2df27d03466380061adf7d9.1780521606.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780521606.git.nicolinc@nvidia.com>
References: <cover.1780521606.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|SJ0PR12MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f94387-7810-40eb-bad2-08dec1b6ee21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|7416014|36860700016|56012099006|18002099003|22082099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	9lmOY4QGg1h3maNurBeMrZKyasWNEhBDLKse/gozkMmS+en1fd68PeJkqXjxsFWfNRoryZo1kENg9y3HMc9Pn7RVmRuyxz/Ho0dH9bJAKLgu+Pn/ciHjns4XknnqfeTgZCBpsYOGqJlAleqsfuBL5HyjhtKcIu71ODymWcgs8P2IuycIr9keovLHge6oRihpGjlma8TdeUxucMtH9427qb5JAyO6/byjmZE9KGv+aHgWelwcyYEuXscrNm8VXY9/8sMCLWTqHPpYZiouCatZonXTjQJltUnwPn/jSTckxpEZS+kZvsO+yvxYDCLS1SRPv+8KYVb5oa0UbtbPKlY8qVbd1vcKwscqzUBAmGixQF/e1YVUcNqshe9FF3WYgyD7idGI7DYBQh+5+1a5K9PDiDA5Bqh7bEPrRTlXSuzuyfDyV6angKW0Q3k9AJ7AsyIBdVAQl/2uEfaBXo8lRFwEXukdRlOA8zhJdCPvCfDs8GzNpWB/7YV3rRp1Obar4Wjf74USI2g1A9tmWLCeLBUO5G5hqDBJslCip731aK/6KiTud3xEoZSoufGytVxEtbxAX0jk0JiXq4W1IHI0U3vvaR9E5lL+M1cHOurxzbnpZjYhfOXQguDFkKlOKW6FPob7Ct277tZebz7gdz+rK3aTccoK2iipowGfybGtvxxE7/JQR/ggDPA8leD11LLF5QY/Kdka/tnIa02zhNE0Jy+h3JCGI9YNzZo62heFw0GzQw0=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(7416014)(36860700016)(56012099006)(18002099003)(22082099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2W8ORsJr7ia+Q57QxIuIESU08E3Tst3P4Kvja3AnzGNw/a1p7l7smXulM5hg/iI1DC/jHTKYRH78NNPEx61ydVk5HtRuBRFvCXjh0TgdXHpUZDN+7+FDMeRunuAPsypuaULy89jOzHWxClsi5rEC8ED7RABTwteT5pnuqw8BVWv8vyZNGmwNF+z6C0bJXXByAk1KjOITEoBdsoY2dl/klL0qhO1pftg1rmpQug7YALlqoxgG9hI79cRFhYJn3rOIrKeMsdjj29TN5AAI1CnuU2y8q+mPeg1Lc3IhDZ+lwewcte0zcGr7AzIrMUPwBCzx6eMamgT5g90o/TlKQyTLZUcZVe7iQunUK14xcnHU/YeE7hxcf+pqhLUEmLGDyNxSA9cJLwP2HlYINf4kNTfmVnICBBcydGgTRbCYHho2r0xxjHoPoN4j4RxlETqVoJhv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 21:27:35.5211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f94387-7810-40eb-bad2-08dec1b6ee21
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8615

Test that the cache invalidation ioctl rejects an oversized entry_len and
an oversized entry_num, covering the CPU soft-lockup paths the caps close.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 tools/testing/selftests/iommu/iommufd.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index d1fe5dbc2813e..653aa251f8122 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -556,6 +556,21 @@ TEST_F(iommufd_ioas, alloc_hwpt_nested)
 					 1, &num_inv);
 		assert(!num_inv);
 
+		/* Negative test: entry_len is bounded by PAGE_SIZE */
+		num_inv = 1;
+		test_err_hwpt_invalidate(EINVAL, nested_hwpt_id[0], inv_reqs,
+					 IOMMU_HWPT_INVALIDATE_DATA_SELFTEST,
+					 PAGE_SIZE + 1, &num_inv);
+		assert(!num_inv);
+
+		/* Negative test: entry_num is bounded */
+#define IOMMU_HWPT_INVALIDATE_ENTRY_NUM_MAX (1U << 19)
+		num_inv = IOMMU_HWPT_INVALIDATE_ENTRY_NUM_MAX + 1;
+		test_err_hwpt_invalidate(EINVAL, nested_hwpt_id[0], inv_reqs,
+					 IOMMU_HWPT_INVALIDATE_DATA_SELFTEST,
+					 sizeof(*inv_reqs), &num_inv);
+		assert(!num_inv);
+
 		/* Negative test: invalid flag is passed */
 		num_inv = 1;
 		inv_reqs[0].flags = 0xffffffff;
-- 
2.43.0

