Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013005.outbound.protection.outlook.com [40.93.196.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37861221FC6;
	Tue, 26 May 2026 02:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779763460; cv=fail; b=JCLXES7gh2W0nVWblxdN1DpfDKC8Ehq8UNJySikJS4T+3D8NkcPlNjs3zzVYa19aJphrGunRwSfJkcCCmAOsuJFBmrJ1tOwmKlMprYifSxENDOx5oDedbTY+7twmaX0JwLDqQQLk476u/DxZ1jeyy4UkCuSD7rNdKSsjiwSm1sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779763460; c=relaxed/simple;
	bh=RydjliiDD41AVZrefV7cTlbVHHbuc1vDhKggWGbBiac=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LKg/QJ2WGw9Bu0Teyto+nUYD56VvlVscDC5R+AdzyDMjMU0mFfbXUX1mxVo6JGHOFIPXltMzoej+B8YLPgDPHXm/vBWEieszIy4igsDkHOOvS4EN5z93rF/pOJRiYLlyQZu6Z7R4w/0UM7kgR1TmU775jxu2qblmZ3HuvvKWgJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ODopIGvc; arc=fail smtp.client-ip=40.93.196.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ODopIGvc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqFflEx2pOQoXoAg6wpJocjLqGY3B7ZKxgxTd9fOm1eUZH+KkBpMsF6d+dozxWfNbzKeGPZHfEyY4K1cYuMKqY29Mo8n9RVl1o1TnJWoD0j4qUm+9Y6+h5cTN3Cdw1P1f0f2U6OMRXJPybWe4PRzAM2l1OaG+stzpK1ywy6tq/oJr1D0OiB0uCEshafUqYPAXTkZeMiZ56nW6HBopE2a/TE5FYnoP5+3SD7A5GgbpfYpavHOZkoj6izVPYBfcCknTlOzFOCtp8kQz5VpltEnHYUw4p6B2SjdFJwoFORRDZxtqSjkaJpNPh+yhezZKwx4pY2ELZBuB3xzVXM/NWLpZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUzYl0pKKw9iWn1gtnqcrSb5dch6uWGdWZ1cg/kBt3E=;
 b=G8FAvJF6aq2I8JF/7x0FFrNfM3FG0Bb6KIy0kRXqVXBPYHC1C520o/2cqx5qHwYaFmoFQ2BvDsKi/14sjsAf/iRlz/GYF1cObykwJBcMDvYWbDWSXG9Zpkqt8CL4wfI3QYojgSBwq2hvLGwyWCoQSjEMB+Onwzb4lsIh4ro7vIovyHkhXJzzCEYwPDcl9wP86fSa4lhic+omDxYh0LCz1l4EcI9AWTZ3t3HnZitog780WiJ5yclKe2/1iTRYIkXZ4whd3K/Y5uiQvmdVrOBj8w6XdJY9WM/frtwdLkwqmQLnKVq3y0Jl2VwbFVFfCdjztMvDDaePal/KbyxBoowbnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUzYl0pKKw9iWn1gtnqcrSb5dch6uWGdWZ1cg/kBt3E=;
 b=ODopIGvc8kMe5cfSqHTf3CMtlTe+oHiI8oQCezLKo1SOTOhu4yIDNx6YczwQoRVr1uOm99078hUB8l+TQUbm5H6cHq3kOMU+9+NKXbA0rx/dtb2YwkjhMY6bgjzBMAQi3jbF16iLWoD+f/6W/1Q2n0hNChFcmuvEwYsMhW+ZouSwM4anGCP7szvbf/L8DpWcLCma3F/9vcAr0d51peZMaaBqOT2tDnMJay8ghWarJgujDNohvKmQVmTgt1mmfvNtQ/fqTSEeCiSdDbg0T/025q9xjnC3+BvKiEHWsQQ5QhacMA2Q3dDBLWJqhmcY1fc6WGIeUDzqB0JcxOxhtrn0UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by BL3PR12MB9052.namprd12.prod.outlook.com (2603:10b6:208:3bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Tue, 26 May
 2026 02:44:14 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:44:14 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com
Cc: reinette.chatre@intel.com,
	shuah@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fenghuay@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH] selftests/resctrl: Implement cl_flush() and sb() on aarch64
Date: Tue, 26 May 2026 10:44:05 +0800
Message-ID: <20260526024405.7979-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU0P306CA0001.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:17::14) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|BL3PR12MB9052:EE_
X-MS-Office365-Filtering-Correlation-Id: b301a069-54c1-46b6-63f0-08debad0ac8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|11063799006|6133799003|18002099003|3023799007|56012099003;
X-Microsoft-Antispam-Message-Info:
	T+Lo7fEOvKt0pdmyfeF35RdeVC2uYFXiOgwnBUxYENqFqDbMdYWNg+vDe/pru9JElp975nz3HJv6mfanQx8/kYXhGRPSqP5pp68xF+YrBp3ikn/5Pr1qt+5DNfzKdhoIQMGBmrb3UDDYfiZBhOMWDoS8y0yyWrH2hAay7g+QWVOW6tlfeNkVnlkiiM7iJoL5tv5IzbEhFcmKWdMN+52t3vVgSjFQiaHuiyjgmVfCXRYpfZ46FMq6JDtkff8t97y4wc8DFZ4Z7KoJ9/u/vnVf5Ya2Kj85fzKYs2DwB7aLfWAtTYUWah3YGQVEhmE9r5zMsELkyzcEJ+jq3xN9L1TMgK6AEvF0IjfjIbKlT+6Rg47EX5bwfZ5cCuUBld2fko6IR/neFP3xbcESXn6fRNMNB3iXjuTJPvM3AmvV6hqYVcAqOw7U/HeSflTV7N5et5seXQMYr1eUq8f+zswC9gSkP2G5Z1trY/iZsHTM9EiIjg0fhuPTCP6h6dZPvg77XkjsNHQYWgnwlomyFxnzSOIL5R6ifjbRko+92lBGqgBg+k8LlA5biR79tNzo0fKwx2OPGufJ6qFUzUUxK6apak3Q6YkGfX4UvL+WIiudj7iz4/O5qeh4QlK59b6+ewRmeSaNyIXKEbz+52hjjs6VmMc7KrpmnudQyG70QeOZfuwPe86WVp4iPGISPiUEFkhBXXsT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(6133799003)(18002099003)(3023799007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zQJ+NfNX9cNaZWqpAiCrzarus+kSB4yixL7O1l8zxWzU/L05QmKxKLQVnqBQ?=
 =?us-ascii?Q?Lanv2asSe0/oal3g0vRlqHc5HrokH96F45h2LcL08D//GPqJQeKi3idzJTgq?=
 =?us-ascii?Q?bNAgK3scl72EA5xq5fdXAh6aLvwRr04oykaYUt53gFZCeEOb3NXdc+pl25Av?=
 =?us-ascii?Q?yFogxeDmBcEalnpXgEC1/gBEUfzk64UEcyaJLK9XL51bvOJtrfdCevPBgwAQ?=
 =?us-ascii?Q?acjow8NQRvMMHWqe8z5afF1DeU2r1K78soUr4qpOQl5TXejMl+FFbgBLUf+D?=
 =?us-ascii?Q?FNWP3X4Hk1zSyj0yy4YZj/sHhy2OUlRx5GBcXaySsPIpgEArAAFhk4oHWqgt?=
 =?us-ascii?Q?l2RiK74mMeFOODncvRzMu8JNr+ZglpSfnxFuBFBuzI/AeEnDMF/RowEkaIWL?=
 =?us-ascii?Q?htCXQUDtNt7FBtPfGcLo0/dCR5/gK8VMdlsjUuUKE5zIGZmuNuiiJiCUCo7u?=
 =?us-ascii?Q?EM1MYVG1ivAMiPP3hAxcVd9potiRV+aeQpzdbbA0t8xPuKwlTL9MkuKyJ8lG?=
 =?us-ascii?Q?kQR6VcJrCTt6ucqKR2siwEdfyODiVr9fPwJkoGQSg6CZ8mIfIBgzFPzYIQ9T?=
 =?us-ascii?Q?U7IR5LGfNq9GiYJSOB5qYHXDabtLYqXzRfhtiuDtwqY2w8P1E1Oq6QqnvudO?=
 =?us-ascii?Q?g+/Z1T1DqcYj/A3ZzAZfHQTvaxYhg0brnv4DxvAk0D6XttJ1axnnOtQ4qUEo?=
 =?us-ascii?Q?NFTjANk/y4hu6p48amF19KHT1XDtYYcEH1KoKG71Qmw9EZiyCE0im6fusElW?=
 =?us-ascii?Q?RVXp+kR15YfI+CqPB5ZGXdbwa1PPXetSF8N98YExYmzrFef4gEtOk71Urgvw?=
 =?us-ascii?Q?L0SRwov4WyF7Lill8dbYxWJXf/Q053bGpW4Bp+Ecm0aD1XRddaMPD+pMBoBR?=
 =?us-ascii?Q?3PwcL7n0jlHsc9TLM3gabrdDQzd2+3uQJkso0dn1eJn0ymHrI3uDEO3UCkcH?=
 =?us-ascii?Q?lB4lC9amN4NibAU3SbqnH8PXkJW6llaujjE+Sg/lBI3BahJnnQF/+c+pYi6o?=
 =?us-ascii?Q?51xB6uI4u1qagkDavtc6lV4GWHiIeX7dXZDz41TSrSKBDNQSutOgOgH6NPTn?=
 =?us-ascii?Q?Ux/eJlKOIudVLwQdgvjUCzxac2HMhEMWD+D6Hf0G/Q2hzyY6Bzzw+P89HWh4?=
 =?us-ascii?Q?Q6pT4GWK02Q5JqhUQYnmgTpAoOBImDbsZ1DUoVim8B13uXeQndEVH/33BWnd?=
 =?us-ascii?Q?EqEPZ82i2obiRqrCzBpTqBJgmNb+Gdc7K21thVhP5SVaInU1FoUiJOUhCiyd?=
 =?us-ascii?Q?5WbmTSocFef8hZgtlgRsLICzG0k48L0r7d33hedk+mI2tSB8xLpDmJyNi63a?=
 =?us-ascii?Q?dbkg3dY5FbMdfbMy/V3NVuOBJckRhZXPQ+SuCS/OV4ZJ0tEJqi05WMOX9i6P?=
 =?us-ascii?Q?L54WrX/W3fDGXHdOqvWIIimWQxQ2kt4ES5A6X6SrTLAgaCIectFyf+vVHJIV?=
 =?us-ascii?Q?zRyEVtMUQrOvhY1FSG3dTlRKz7Zq1VAryfgvHOdbQshQozRHiRftLTJsSHyS?=
 =?us-ascii?Q?Y/8Nw34RSrCtiNTa0TsKB1an1I/aqCxx4DSTSSF1fXcMUa3Lak5eqYM2EmkE?=
 =?us-ascii?Q?zgcSDeOwaz1YAFFr0Ju3zT+fg0yA4FLBAzmUZWIExeUAlf7zXBXEE0ftcEfy?=
 =?us-ascii?Q?eEJkMcHkg9Geyudcg4+ZBACoiyDhhdiMieXV5sSYUbfYGcjtQKz1cQvJz4/r?=
 =?us-ascii?Q?jVzcBEv0etvJea92Ccn86V6h1pOW2TVNKNCaznDRrDfuvTu3076u4jVXaqgn?=
 =?us-ascii?Q?xNCa7KFoew=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b301a069-54c1-46b6-63f0-08debad0ac8d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:44:14.7806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qr9YvwobAEOZ2qvwY7EQGdyGLstJHGVVEC9RFkA2YiN/6HEnXix7nKhUdmKPqCAoDwJc4CofY7uY/hD2fJoSDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9052

cl_flush() and sb() only works for i386 and x86_64 in fill_buf.c, so on
aarch64 both compile to empty function. mem_flush() walks the buffer
calling no-op cl_flush() per cache line and finishes with a no-op sb(),
leaving any caller that expects a flushed buffer, e.g. CMT, L3_CAT
operating on unflushed state with no warning.

Add code block for aarch64 using the ARM equivalents
* "dc civac, %0" for cl_flush()
* "dsb sy" for sb()

Both are EL0-accessible on Linux aarch64.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/fill_buf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
index 19a01a52dc1a..a41d21e5a64e 100644
--- a/tools/testing/selftests/resctrl/fill_buf.c
+++ b/tools/testing/selftests/resctrl/fill_buf.c
@@ -27,6 +27,9 @@ static void sb(void)
 #if defined(__i386) || defined(__x86_64)
 	asm volatile("sfence\n\t"
 		     : : : "memory");
+#elif defined(__aarch64__)
+	asm volatile("dsb sy\n\t"
+		     : : : "memory");
 #endif
 }
 
@@ -35,6 +38,9 @@ static void cl_flush(void *p)
 #if defined(__i386) || defined(__x86_64)
 	asm volatile("clflush (%0)\n\t"
 		     : : "r"(p) : "memory");
+#elif defined(__aarch64__)
+	asm volatile("dc civac, %0\n\t"
+		     : : "r"(p) : "memory");
 #endif
 }
 
-- 
2.43.0

