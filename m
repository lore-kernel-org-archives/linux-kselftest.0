Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020124.outbound.protection.outlook.com [52.101.84.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E10267B89;
	Wed, 22 Jul 2026 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784725379; cv=fail; b=AQ2mcNRzCEn23WcQxRtTvWTCrewt48l6uO1vV2ijyNATP3sDDek1KC2c3CoVNJUOSSLqdYD9FpAvkxRrZ63F+z1v13nBNxEI23E4cCzQGU11KeaMOJedyGbrR3Ez30xoUO+F3vs8vnITzE+eNLbkCyohzNuNxP9cuFoNni7n1ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784725379; c=relaxed/simple;
	bh=FxKmxi9lNJh+VqJf1hp38Ekvn4YWgu43r/RBdwsFaQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MP9mG4m4+fEQOCF6E5FhlG9J0eqPc2N48d5Xe302CZQbYS4M7qBfM46rOTwcl7eM3DWP7CqAUU3kGhfIdOxv/3M1xnYYOVXIn8NE31id5NfPmVDRNMBN48AYW7aUydIUEBnaxMoOHAf5X61PkeBjNQuLnTfPw0wC5+gfryCjdeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=27MFB+Z5; arc=fail smtp.client-ip=52.101.84.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="27MFB+Z5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSyjlsTdk4vuxGpKCNeJ7tTU1WvaKcv7k8pj/K7pUax5sWQiIMVJWrK2csnXXhIfkv7upavb587Es5mKStZSE5FVBvdFsIU6Rl7iyp4EbujfQTeydhOrr4hpQg7Sk1gT0FDZukEsaujDx+bC5cwo+L0ZmZMXSW5e9SNxdIx1J0DdOOuYleG6N2cwQfcm+4SQxlL90ltkWDHvEHdS9PDzwibNcgrI8Jei1nwR4Xi+60+eGEZt02zElzBUqbH/a0KBPNIgVuAzppnHPVm9wYBzHCEqEZPaF2io+BMjjNaMkqs3N+nCWtnWoKVHDpEd+2iR/s8yvXEYEXvtVo8E/cu04w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0J5IHKnoxzT22zXq40jFrBV0xZ8YdvfKx3MQl6xHTeQ=;
 b=jFq8QB2sGNIn6rsPA0E4a71M/ppbhWpjgl23BEsraGyXXtkBOg62xLgdtfjPLF8vuc5ZJm/dwF1UaGziaMy2wIvkN1A3XsT7/H0qM6+sIdL/JBJXHm9/niMnqrQoVoIq5kwft64igJ+2swMas7WXQaUsvd1L02+J6uwWXJIq3XXIOLuq0mnC4Qbi+4SsyrF+FYkF41ZZXUICuqNqg495IWh640oND+SfzLN/Zgr8V5n21YrCL/L5C571OS8+wZ7wUmqIbtTPdRkTw0KxoKURNt5I9MzwMHLmRNOoLyZJImluG9TZzZG7WK8bFY93ZvTgFFhUA/kO7mHMXHXlGvf74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0J5IHKnoxzT22zXq40jFrBV0xZ8YdvfKx3MQl6xHTeQ=;
 b=27MFB+Z5amcbtGA2iYMsQZbRzXbYDULF+a6gPNeyXht9fYg2hJJ3OtcHbY2zA6XBl98TOOeSTCfCZFduHBC3C1vrYPm++f+4/cvIKLo6T5ScAsOdtSRbl42fmYDNcuvMU9X0IcQY4o1zXQ38oy0YBU4KmtoJHRW5Hal0P3ElPNlS/6/KuAAWeCzsymRZlGRvSaSM0WVIN0zQpRPLI5j6O+QJ3Mh1zFGnp1wC9HgS6N+YVatgsdJ9Xobkqxt0B93vXJtMv+dKx059ZDrKupJ6tdo/IDVaxc5rKDIQVEzZvxnO13VQho0Nx6wmRjo0ELunK53is6dwidEhTGgxqj6IGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:17c::14)
 by GV1P192MB1739.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:53::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 13:02:50 +0000
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3]) by AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3%7]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 13:02:50 +0000
From: Chris Gellermann <christian.gellermann@codasip.com>
To: christian.gellermann@codasip.com
Cc: akpm@linux-foundation.org,
	brauner@kernel.org,
	david@kernel.org,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: [PATCH v2 0/2] selftests: Add missing initalization of pointer passed to getline
Date: Wed, 22 Jul 2026 15:02:44 +0200
Message-ID: <20260722130246.2135563-1-christian.gellermann@codasip.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526113848.530105-1-christian.gellermann@codasip.com>
References: <20260526113848.530105-1-christian.gellermann@codasip.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIVP296CA0012.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::16) To AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:17c::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P192MB0787:EE_|GV1P192MB1739:EE_
X-MS-Office365-Filtering-Correlation-Id: 91895238-013c-4478-7b79-08dee7f1891e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|10070799003|6133799003|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	aZyX2/ev+RZ2lnHqmqddivzQ5J0Db2WroTVSW2Ar60SmUutEcHsxCSulslKZWk+FmGPqOG5aJxn5beuEugIQ9T/JY8yP6StXh2CtSnPZnULBoZjddZYEKSCmeHRfzAozzXFMjZ4iGAuB2s/JoeUxEmGCVnaPwXWKiVrsLL+Gfs2MBHGezyzqr5Dqx/4qDiwbCw7h7aV32dzNMWOmvbn4k1gMlHyXa9hygZlke7DbWWKReSohyGI6G6/tkK3WLiCkiUt9kcElA7+hXnk9l1wGsrcMe+xbgi+HRtbpGMYO6lhN1UleY7nIQXxuUTB8qxlnigcdlGd4A3SWgXySRzs6f1L0juEM/wfGxeJCIH9lcbbflkS4cG6gYUpnu8FmqqLqf71BwBaYYVL/n9G5/j1S3iQ77uMXIpwRwqwI/FZnPXMi6wdXRm60yY0q7LcKeV2aPreKNPJ7OkteY9AY9CntSAZQFeOzAoOlw986UXOSq9v4YJ1kaEAMA5PJvGoizLWvdxxZAVfjPSn38aLYnCXoYCE6Gwbn++ieowYqsEL7qotQhFTmrEaHS+GbF2M1tBmo//yF5zyklU0TgfBdY2k3IiShG2shdWQINAaZgdnzkQB3Ncwn4M39k5NsB0eWlRJ4qTeS/OWUy17rNuIqXIWigdZDb5nUdqoJK7rGPTO6tc0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P192MB0787.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(10070799003)(6133799003)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EjhVtLxqkiX7HrYFbTfFh7QwYHKzrHMIo01Z10C28vb9+cAgUDSqa9I9UmP6?=
 =?us-ascii?Q?sqSMt/Yhyqeq+Gp/z2AmBOJo7bULi4Dfb+EH3Jzmbsz/X8N/VUcg96IZDllf?=
 =?us-ascii?Q?ja1tEO4WVyHGEEtJbn0LrygVuvAwgVjAltBVjzETJmUcrxCF6q18fKqGn7hO?=
 =?us-ascii?Q?kLgl4AanOAqr9C9RAYKXrp0a1Apci4PvobESp/FoPnTV+bU7ebW11Ve9cvt/?=
 =?us-ascii?Q?5776ZV7ACI08wQWsVgb1GKquv+UYO2tkCUzqjElnxmT6wDiPGNAZOeP/EBwn?=
 =?us-ascii?Q?jPu2j20Wp4ADwhHORchwJ80U7HIUbVt9xnaM5YnCDTnlik7ctdDa5PNFOq5K?=
 =?us-ascii?Q?rCPWp05tBBOEmSh85GyYpogl0QFcXy2Iy6b2oEnYGiRoZPv3s+KO3NVg2UKU?=
 =?us-ascii?Q?Z5kp4XbVVCYqzksiMdZB913m/3Wud1DkMFvUOZhJgYnLLSlcR7eggT00KvtN?=
 =?us-ascii?Q?kNOtKm0RcCLCQ37dkzDH1MQR7c3vEDwkQdNDKE0bmvHc3BIGtW6pP3+YBN3d?=
 =?us-ascii?Q?mtYXv58XsSiQkNFndG2ZerWMLm4KWA+ObNUwmefiswLWfVqAhnxSvvguiaUA?=
 =?us-ascii?Q?NMFA313Ii60hSrMHBfAZ/1XTbkyFANpvwJ1wvn3roJ6M8c6DvQ5mYmNrMjJC?=
 =?us-ascii?Q?mdRXMSwmRsAyMc4SnhHeWBXpdRpzpaeewsUVm0te9dHVYOfnp1JQL0gUnMmM?=
 =?us-ascii?Q?pYmjvngP6qe5GGcQvTKk0J/c5oueSAnJSQ2URerhPtSkVCMtJq/b8dfsS0vv?=
 =?us-ascii?Q?1PYlQAt039S4uLuciwjTXsShEm0LivaQC3OWOrwkyR0/yCxDtl9Ii9hijTGt?=
 =?us-ascii?Q?mSg9qQ+7p4dqMw+zefHaj9tJvJHd+WTpSLwKNM5ilxpziDAh45k/5VVcS9Ih?=
 =?us-ascii?Q?Ib1Ai7wBjB3E7iib60kWC8TNREupGqs0UjrAe/+WtQc0Fk6HgZhCAksGRS6l?=
 =?us-ascii?Q?eGn2MU9NOfi1VCzdJep5dfoGRJ9HW2DUNt49/rt51UTwxZTL1DbASHZL7+aG?=
 =?us-ascii?Q?Pndwr4Wh/v7dMJ0QF7al79oa5PhY+rD3NwWdQ88mHQLRS87naciBvedBgQY9?=
 =?us-ascii?Q?U73ARfQJ/6kQomnAlalv52ppwwxX5ds93Pd8w+7xRqOcOzQmwSGA9x8kGI/S?=
 =?us-ascii?Q?iXRpUd/PKHBVeX9jErnPpy4GFBUu55+TslOwxJ0dX9Zb3yA7ssuUMdWRqy+I?=
 =?us-ascii?Q?Q4UArgB1ntPYtY9bshqYs1rP2XmZL/h5oBGOqu6ibzCRlJvf11lWCaHutcYA?=
 =?us-ascii?Q?gvkwTzklRbVe7KpVPjom0DRvqddswXOinvuDRvn4+nlHdOa4fXngB1OPA7xi?=
 =?us-ascii?Q?qP2HzZcEXSZpTjwk9dJkzgvH/HXqEpWGtKgSG/myE1Eb37t6Hzayrh4gmHSc?=
 =?us-ascii?Q?x3VWNj7Qsqx1rGBkM3Fe62SHcEzMsqtyJyJi1T0hWqqaxG+hwPInGZX2zfoR?=
 =?us-ascii?Q?Mgx6ThmJNZ8T1olxAuKm76Y9pd0ke3tS6azRY4owJnBpKsqKlB76yyrPwaTY?=
 =?us-ascii?Q?Z5FKonMrtU/YJlbWxZ4DtZjaSNTN3LTASW6lOqPE4ZdXEG87ddGA9H35U0j6?=
 =?us-ascii?Q?jfbj9tpYCaIQgdqH+9otKNKN3LAzDkBd++6QB53hXx/i7yzlSAZoIghrG3uI?=
 =?us-ascii?Q?J2i3Tft//m1Tr5PAsTVsU/bXgRrd9sEtJA2oU9f8Prb4ckTO5tCxO6L7m1Ci?=
 =?us-ascii?Q?QC70AeONNim/+VGWlTu6wtAAt/x9x/tlQbYxFRpYdwRFYPkBeQVsiPIWu2OC?=
 =?us-ascii?Q?ArojD3Y+Mt2Srx0kv3bfNq5qVLz88jmlznOmBspXTgOfDlA3K6xrJf9EYqco?=
X-MS-Exchange-AntiSpam-MessageData-1: 6D/tvbTlcuK1Sr/mbSvaqmDcJsFyFq4gYcs=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91895238-013c-4478-7b79-08dee7f1891e
X-MS-Exchange-CrossTenant-AuthSource: AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 13:02:50.7911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIohbuT69Dmi2VmllI24ul3DfPH7IwHSLDa9Jx3hX3dqvxcxaFxarz6iQr3AJWWtBUsUQOcRUdRbzJ4EA+IJzU0rbKnTdJwgtCL2mCxpuqJ/uHU1myiRcwn/0pfcen0O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB1739

Hi there,

just a gentle ping on these patches. It has received an acked-by from David
Hildenbrand (arm) and a reviewed-by from Lorenzo Stoakes.

I'm resending the patches as reply to this cover letter to clean up the previous situation.

Let me know if it needs any further change.

Best,
Chris

Chris Gellermann (2):
  selftests/clone3: Fix wild pointer access of getline due to missing
    init
  selftests/mm: Fix potential wild pointer access of getline due to
    missing init

 tools/testing/selftests/clone3/clone3_set_tid.c | 2 +-
 tools/testing/selftests/mm/mlock-random-test.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.47.3
