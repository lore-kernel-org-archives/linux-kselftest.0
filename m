Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792675633;
	b=ojP4ZuaD9ayTVzeYb63y0cy1dL1QjSfvDTprZYaymVnxpaiFCO1sKNn6aTb7FbbeuL8j
	 9893vBVqbl4Ee10EHSi3V5TLusDyvFSD0w4r+t0XtV+C1pivYBfhL6LPCX2mf3bDBdkKQ
	 47mDYIKOIy6JFasi9ObkqzLb45to3OjeM8jTiHfuFFrrwOMnpiHsEGx59c5M/hJZhJSsJ
	 PfeAHxhoKpBK24Ml0hvIs7bgZBK2HbQ2O+FxQDWPW5vvAcxS863efEWpVnUFgspAnoCMc
	 8pUxZxSh5WyJAzGGGZkkIBIhKTdnE2DQCRQxEPR6nvzv3xsBQAe2MVQri9yI+HwcWLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675633;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=73YyZGly7ASr8brV1cBmGBabXmownquEbwWFwdWAZJU=;
	b=MhJ+p8RMPcluoi8ZCNwX/Yz/U27mw463CRZIRq1WH/lbIGpVLgGy0lKXYMTLBUUFH52M
	 RTtDEEpBa1e/d/hB0I3xt5ty9VaC9zUizwYV6cHY/C2pPK+TRg/XDp+5q5rtgfNTyhFLN
	 WLGW+NMvKvu3mBa++sMusaKXGTQZeDCB/F98Wi9LAfcEPKMM3Zp98/dQTBGZt2Kfi513e
	 ju5t7v4B7wo8+ltKVCFlCOAz4YvCDIqCW1vZWAnaCG4gEdbfQTMozlpP+5qyjF1nOy6Gw
	 f4yW4NUKyAZQseAif/dQv8LncT2c996K40mO6uRmfTE0fnLelt+BBN8n7N/5pK1HddQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eu7QwaYr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.37
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010037.outbound.protection.outlook.com [52.101.193.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D410606A323;
	Thu, 22 Oct 2026 13:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D410606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eu7QwaYr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFubQ6S8/F2DagyYY7I7CQyXiPy/49505xnK+4H0czcVSNspXZurYfzgZbzoU50FsDwXSFEd8ilbvfwkRmzrXsFD1K/uASaU8N1ZmgJ8oEfBpTPBSjtvY6bnO8U3Pa1qA8CEWFJJmA4bnGx1puqlVRahWQRsyikO1BL0Tyh2Ij9J6dEyD+iCb4EhX0P/LvYHZPbnuB0GoS2DuMQVc93041ZRs+UVk58wXj2dBvI88nYaRS1nhu1WWGFyWVQl3LDQM0h5ORJ5dZR1d1cfM2PRZke3PQSVS8CuwgtMKscYs1vlhgFSd7nfhjdZF7zbBhcxargsnZXfQ+QY2oMa6pe4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73YyZGly7ASr8brV1cBmGBabXmownquEbwWFwdWAZJU=;
 b=i/A4QATJun0JMdNcS56lViKaVlopHpAHTDTiiLQgGgytOYq3HAYLKsg9sMEfU5iUxWtuhGwqwc1qiJqnWY09aAplIUimJ2Lt9Dee20MTrxBJBfXLBjg1fSeh/VfTJEh9+P7hUDjB6KUWR/YcM0dgQQLGD8sXaC4HbR+n6RFUpjzNSlbGsJNI6EGamjVDb2PVnm0yv7buOufAu0bdS/I69TJj9ENQ1hgQO3xsyWo6rPn8+rWXj5x3T49AI9NLT4bemexIfOy9YPn/EbQmLXyDE4BkyatUp0mxVIS5Wpn1Mliuh5aDSFWxX9zsqVpCeoSYyKP+7mQiFar9g3DmIbCvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73YyZGly7ASr8brV1cBmGBabXmownquEbwWFwdWAZJU=;
 b=eu7QwaYrrHyeomFMo4lVC4OSL7eW8PO5I2/KeRY5g0CBA+/1Zlf9Lo+IntCYJrnMO3E4i17qckqtIIHNPxhsguPhLfn8Ph/sdy3beT6d21jZ8ZzIfp7klbTF2531pdDLQLXvyu9a9PuNFKl9dmNiwG1q4coWWRI600KwNeYKL/0=
Received: from DS7P222CA0024.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::13) by
 IA0PR12MB8983.namprd12.prod.outlook.com (2603:10b6:208:490::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 13:27:07 +0000
Received: from DM3PEPF000265B9.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::53) by DS7P222CA0024.outlook.office365.com
 (2603:10b6:8:2e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 13:27:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265B9.mail.protection.outlook.com (10.167.23.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 13:27:07 +0000
Received: from tapi.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 08:27:03 -0500
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <babu.moger@amd.com>,
	<fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH v5 5/5] selftests/resctrl: Enable MBM and MBA tests on AMD
Date: Thu, 22 Oct 2026 13:25:16 +0000
Message-ID: <20261022132517.46805-6-swapnil.sapkal@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022132517.46805-1-swapnil.sapkal@amd.com>
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B9:EE_|IA0PR12MB8983:EE_
X-MS-Office365-Filtering-Correlation-Id: 77642495-980f-413e-8568-08df30402bab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|7416014|36860700016|376014|6133799003|10067099003|18002099003|22082099003|261021121427099003|3023799007|261021123027099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	XdnzvtHJdRDAeBglzBeZrmuJUq86YYDezQzLPgcjvPS0BkI7V+NEpSm2W6Wi3xH283EUOc+gjwSwEawYRMzhOb3mfLTjtIS5i1b+RrfBMHv5L59Ay0gKIIL2H4bh3VlZ9J2VFruybLzn6OmH535FNA3AmHnoIUVoVTYXNMeyJ+oleYm7loG8t1FICPB1XamkfTu9MrLzIuSSElKLHtDTGLVWuXh1lBKxrEeKubNpabcg5jq7ZdLuVuvM1K9qhgaBRzE5tulfUpyI2Dwox7TaMZPVt3ddsm5zXN/HuIwMjzQkT7rik9PRhPhUHzUDHDF/rTrc20t0XHgh56vBHFaobXX/CqB9DDSQb34yEDKB4hc2PkV9mp/mgLZ62HWAvbFRUX1WGkxypCypOK0wWxTKLn0PD8cO39IpgZWYYipgA8jZ11O5gbV0xTbhrCZoAurAh1hCAmKfOnobya8/9AAT/iCKv4sIFP3wqwsj39nNl4+96x/Xu3GUnb9RGRNS+4/PIszkbEGMk6ifZS4FxWqtso4u97By+wOVppVszMXBG/KaPoW1GxnZ5fMCNnhwAxQgEQrPgR6MxOT59cQzKPDTxqmLmtblCkhoiedaoj8DaxQjE/dcWgdkbYSSiiKNVfDNiUbjwbBJu9l/1SuLVD5xII3ZEs+ltN+x34cz/ijB6KZzNzESp0Szm9+U8q6mE/kfDlPyu0mP9D+594SfUdKGQQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(7416014)(36860700016)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(261021121427099003)(3023799007)(261021123027099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DJ0pOJBshyCM1mO6iHYvoo7/tzG90fH7/bQh02nEynBtwvAmWbXcpadJpnhEBXYAgmZ6XO1WvgTVuo5XSdjTsIhx8bmXfIzS8ouL2x6Ob52iLAX6jKOXOcJzjmDHRUowuIvdKnQ6EgvRlZzrWfziH4RJBP201L01VwD4yzMz4dEuNSF5UJ34V9+GavhaVLAQblDOvtBKlxddgWqD+ZUd4K0p5en8+L25Beyak77oSiUDI2OF/fRRs8k7vF1BBtYH9uMZ2Hwo5UQU3MlJq8FRBTdFGnOom9mjFwahBm/l7+1bAJbsVuVKE9JYN1XKyID6mTGTCycHiYDcKf/1S6ZZrCwx7i89SjYtYLMrwa6jHSMSfCbQUz6coI9iQTNnoNozjyUkrY74Z1vWyvy3UsepPxhaDkaQPfIvjW8OT7ip7B2hPww1JxNbXWaNPcHRSkdI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 13:27:07.7816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77642495-980f-413e-8568-08df30402bab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265B9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8983

From: Babu Moger <babu.moger@amd.com>

Now that the UMC (Unified Memory Controller) perf events can be used to
validate the resctrl memory bandwidth numbers on AMD, extend the
vendor_specific gate of the MBM and MBA tests to also cover AMD so that
they run on AMD in addition to Intel.

The tests stay restricted to Intel and AMD: enumerate_mcs()
only knows about the iMC and UMC counters, so keeping the gate (rather
than making the tests universal) leaves other vendors skipped instead of
failing.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Babu Moger <babu.moger@amd.com>
Co-developed-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
---

    v4->v5:
    - Rebased onto kselftest/next; updated the changelog reference from
      num_of_mem_controllers() to enumerate_mcs().

    v3->v4:
    - Rebased onto v7.2-rc7.
    - Extend the vendor_specific gate to ARCH_INTEL | ARCH_AMD instead of
      removing it, so unsupported vendors are skipped rather than reported
      as a failure.

 tools/testing/selftests/resctrl/mba_test.c | 2 +-
 tools/testing/selftests/resctrl/mbm_test.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index 947735e26099..95250cfa5cd8 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -272,7 +272,7 @@ static bool mba_feature_check(const struct resctrl_test *test)
 struct resctrl_test mba_test = {
 	.name = "MBA",
 	.resource = "MB",
-	.vendor_specific = ARCH_INTEL,
+	.vendor_specific = ARCH_INTEL | ARCH_AMD,
 	.feature_check = mba_feature_check,
 	.run_test = mba_run_test,
 	.cleanup = mba_test_cleanup,
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
index e24c6237a22f..b2c5fd0ab8e3 100644
--- a/tools/testing/selftests/resctrl/mbm_test.c
+++ b/tools/testing/selftests/resctrl/mbm_test.c
@@ -178,7 +178,7 @@ static bool mbm_feature_check(const struct resctrl_test *test)
 struct resctrl_test mbm_test = {
 	.name = "MBM",
 	.resource = "MB",
-	.vendor_specific = ARCH_INTEL,
+	.vendor_specific = ARCH_INTEL | ARCH_AMD,
 	.feature_check = mbm_feature_check,
 	.run_test = mbm_run_test,
 	.cleanup = mbm_test_cleanup,
-- 
2.43.0

