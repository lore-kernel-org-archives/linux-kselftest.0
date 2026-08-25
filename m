Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A9A1B652E;
	Tue, 25 Aug 2026 09:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.25
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649907; cv=fail; b=NaDbXtgP3ZhAEdZofXZ4mI6MujhCRArCKIf/WRsDl4gWTIIoKghjeFvgtWlhsnqajOIaYyfKPCqGX6hqCXdh2O5Km6LG/vx21KGlbQtz8Xs5mh/gmM2oyKmEpoddwqQiadZsUSZcXoBeP8K6/LDvSv9iMACG/583vMlfqwV95oY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649907; c=relaxed/simple;
	bh=+JsVGB8EuAl295/0nWqEbhxODUn+mjZoalQdZ/pQJ+0=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WxGrxWCViW1xjqoeaJq3anx23v4Ze0o4M6TcC/bi119mAphw2RIxOuW974TvlfzU4OyZtqWrU+cRKblObz7D5eZrV2J+Y+VlIU5apZ9owontEURYThI32Y8+AYFdkZqx3zhriocW8xBUP88RKPgNuNWKBPLHkqkXcVULEDg7spw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GErrUJyy; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GErrUJyy; arc=fail smtp.client-ip=52.101.66.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GErrUJyy";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GErrUJyy"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rHMhSyhj56W6UR/yNa7qCfLJqZ+NRn820ao4cee4OnRviIon+myQ7N4c75Qg9RYUTglsNtB8lix9a19lJ0UTmnd2+h6oyQNKVyK1ft+hXvN2XNvgLIrrBgSkg/JIb1X9/Vh5xJE+/huH4sEezlY6rJ14hTfjuArO03GM7Ns9ZLb23EKlWL++zV7yuG2mNOoWVD2QdflGCaX/zR3ll+dXVCotxCLjI34CuHTVsLcdragR4rniU3ThDNjBb4OoxxTy3J71n3V0jN0s0PhMsn2tb8xvy7Kqy17PK5EFCr0O4pjfyV2QX9Hg3murZ3ZXVVoDc5MpDAaw6s9ZymjUQ+rkSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T39QJcvWEyr5PYEMOtIjhACpR0+1y9NJe1FfmYGoF3Q=;
 b=SErM0zP2CQkqBtwTK8lOFH7Q+IM2vrYcnqCJt7KmAW6nx7XmVSa08g8JETh+G8cXADwsOl6ANx7l14XsynAq+JbLggyTHypOlf/Xt2S0O1YjfhIC4YWqPjRjTBENtsLRaXKONpOCne/V6PNjM13U36jGkg95JXGh2J8Zy5IIp6LLxlohd+Z31wCnK1ARUwMfe5Dhj14XuTLLAu1pBnLPQfqfI7OXhXatfU/tkbUCMAdzTNaYUc2ODLt/yvCbKj6TB0PxMH31pGoNM3+LPcW6vegTz5Aagjx2XvesK739Xw86vJGTMI/rY1LlLoPW8LIH+/J84ZPu2SJufxVvHmSAEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kylinos.cn smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T39QJcvWEyr5PYEMOtIjhACpR0+1y9NJe1FfmYGoF3Q=;
 b=GErrUJyyzasIbzTNlVJxdXw9kx5dYMbfTIJwuo8FcUyOgjakNaCMQCMcGPUp5tMTnk1011qwi3VgVulwc73TjKLVBof2YSSMUKEy1o8Jsrv7TWKLZG48vGmlQcUA0HJeCaFrFvCQ4O/qNVfDkwE7EpTaAw1ySd3gzQrEzJkLOgo=
Received: from DUZPR01CA0087.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::18) by AS2PR08MB9973.eurprd08.prod.outlook.com
 (2603:10a6:20b:641::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 09:24:50 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::8d) by DUZPR01CA0087.outlook.office365.com
 (2603:10a6:10:46a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 09:24:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Tue, 25 Aug 2026 09:24:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jb7QEhGQyWNCFdudWpRQOSYtk5QMTeKHdntKEO6UBw6OYmpgDZ7zNAx34EhIWt9OX5WA2QNXPOy1DLC9fKQLuK9/eqPlA1/n0wbxnrHjpABmwnITMER8nzPaAPQluA2ojqGVO0L495cOh5n620NhVTbtVyeWE2y7+0iPo+thjPRSyFYkcv/1woXOG0pmPn3sIbw8BXE8QKIyf+kCjbYQoPEKrWa5mJVgyOQOkVVHDpgVlCjImOBMh4WzQ70XLLwc8wbLJFuRbA88aL/dmp/jXNldm9ANNpuyKgv+tU8CUFxiM2JAgpVC3S3nH85O0omfT0VgEXN/qop46hKl3JtJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T39QJcvWEyr5PYEMOtIjhACpR0+1y9NJe1FfmYGoF3Q=;
 b=XzSj8K7HmhQXSUOiB7/oYUk5SH/+mZcubGiwyixTDoUQuSF66/c6mVfKMaogASNINOQYAsVSmfuYxx/FyEsMan5tvJFKx+7+51TsrxSiPAuR5nKw46gYO7R/JNq50aQg9t2V9bs7hPhr7eLUmBcPEaJKmuvvsreBqovVw0i1ebwlRjnPT4kUDlXemPfb8uMX2kK/D95Fq4qoq5LO4mQ1bi1n36Nmn+uNoWn/WviZ/pXEpQFIx4sOCnMWT0ORFzDOITS7RjL2Tei/gs/IcPqVihkfjeokN79iEGJC9uP2ovt3WSwQxoT2RDJKv8pn+c3Ipf++e5wgOJqhf5wZ0N9Zqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T39QJcvWEyr5PYEMOtIjhACpR0+1y9NJe1FfmYGoF3Q=;
 b=GErrUJyyzasIbzTNlVJxdXw9kx5dYMbfTIJwuo8FcUyOgjakNaCMQCMcGPUp5tMTnk1011qwi3VgVulwc73TjKLVBof2YSSMUKEy1o8Jsrv7TWKLZG48vGmlQcUA0HJeCaFrFvCQ4O/qNVfDkwE7EpTaAw1ySd3gzQrEzJkLOgo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by BR2PR08MB999884.eurprd08.prod.outlook.com (2603:10a6:2c8:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 09:24:15 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 09:24:15 +0000
Message-ID: <f7a206c7-8ff9-422c-85bc-6d10523563b2@arm.com>
Date: Tue, 25 Aug 2026 10:24:13 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, linux-mm@kvack.org, shuah@kernel.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, peterx@redhat.com,
 sarthak.sharma@arm.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Subject: Re: [PATCH v4 3/3] selftests/mm: restore enable_soft_offline in
 hugetlb-soft-offline
To: Song Hu <husong@kylinos.cn>
References: <20260825085756.63030-1-husong@kylinos.cn>
 <20260825085756.63030-4-husong@kylinos.cn>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@arm.com>
In-Reply-To: <20260825085756.63030-4-husong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0138.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::9) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3421:EE_|BR2PR08MB999884:EE_|DU2PEPF00028D05:EE_|AS2PR08MB9973:EE_
X-MS-Office365-Filtering-Correlation-Id: 962aed46-bf4c-4c25-5fcc-08df028ab596
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|10067099003|6133799003|11063799006|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info-Original:
 54EqoiQLSxAzeQ6OUbZ2DgWmt0SiW2EV4cR0SChPN4HcMqhH7yIhOLxwlGwO0Di+XDTo0yhWnE1lSwECo1Bm1XYFjaaWkpWZMAyPl1dTTkdlWUHMwnrzfrqAQrN1c/1RrO3aFjzUG0JnYcrWpNCnzSlAquaU7oYAOEHFhLUOJNukEUcpgyjrpC4ofAy95XGxbNoMlSI6RVHtRkmDAOEtz3I1Elp4C4PM3bIlTVUB6ozYxwVLzv9VHLur8CnywCl1X4RR7vbcQw7rSXuO2ETuEl1v5rlIkPfokRAgwSOS/qukfRwJmapCtgLP48PQl8eIQ4AOor6wIdxqBxp8pObRAvDY1O0A7S+6DwJia18Iiv+uih4GTJ75e5TgIoePHpZazvvBZJuSMSl5eITNhJG8t/dwsVFJ2TBcMAdJxNUKq2uL8+LpOI7tlVY7o3JBEnHPfBb0BKL7ZD8+EV1cx6dhRPKAYS79dYbscsSyq7t/ZHqCBUqcy84VBxrSN4euFVmTn/bCbaw50oatvh51W7dkYpzgCnwcOGBZ/llq+RvYnEfXPwvDW5SqMKRcod3hV0kRAGnlN3kGe7IFMxK9YE7p9oVZOPB9E1HVq10kZZSbK1OBU4bjwi6Yl90kATMxNgS3vdbg/IpD+4P30k+wgC+OmwsQMMRRrZQ6KNZR6OmIIMk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(6133799003)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 i/nZO8TUcWTPOYxC10xR6ykvQO4dmo30tRIL20fn+ED8jjNkT8BAewfqZ/rslTQ8mZOoXDMhHIeAXzp4UY/IhR6EnnO1YjspXWY5wqTk31JbxM1Glof7VASS8soTPQfheRnQz8QRojjEvzE/eqSCG/SfAQu1a28vjg+mzDdl3gq+tkwdKYHcmZMNGgKDzoZzcA/oCQ2S7EtuQ5qaiancnLVElz86kstxnlbSH5fUwcb1C6L5qBx/8lXL2EacIcFldn4NATyuRFXI+k4IcBhzcUHLTkzfu+Zd9K9sV1g1nGuE5OrkYN5+emYKBi9z6YEqr1G7Y8HKBBcOvmtVEUrqMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR08MB999884
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c37eb220-2f11-4042-be25-08df028aa1a6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|35042699022|1800799024|376014|7416014|14060799003|23010399003|11063799006|4143699003|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6izRdDy341QRDGrfOXRuOoMz6yOEGXWuoek14eLTo+KlyBvxeO94vrP9vkDVrFLP9ALGgosaqA3FtNgaRM9nS+Rew8S4lLy5CUzjOUHuYnLMqycgM7o7zqA8bvB0vOUlLktn6GWqWcXgkyjh4ueGWKNrZzTnCrFj28zs1xiMU0yhCnzDWaao6L+Ner5TprJ5ByQPUmrxIyv90+No8zkCbtJgbaYvNgduQMKokNmyIuZVW0luLjfYP8ZpniPc923RVpos1l9P5OQJpKI0VRFHVhq8zijaHSka+Zbuh+N33D0/rgRdUGEP1/6v3n5sgLtviZHeyP3F8d3NA4NUIj6XFEthrVVKajJHabMb1laa3UrVn2F2O+OVL8n0Wmg4CGJjp+PigMAKw20OHpPzIS3aWazmGZmyjMmCDoJYF+cahil/LffKg3i7PElQDMWOQZz4yqebJXsoqyrbo/HmQMow7EJ2HOklHx41JQtYpckfLft3gg6BF4ltUzKXNA8Wkak1z67ELA2uG4jygUECspwt/OlZTmN/RU8bpq7Mn1mpRRMxrgf8sqz+9BQeXOy8+dY4jx1piE/PrGJ5GF8KZylinxONEKogylZsGAxnLJxx1OOGjfmR62mtpGVaFXwa/Rnjw9gkvHOVH9CZT2ejqTfY4DNVBGUu1YTLkxsq5tAz7/RTCs47hq2tJfu3nUkpe8dmEiwKmAFRUqM5w3ZMEhyRwA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(35042699022)(1800799024)(376014)(7416014)(14060799003)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yCYNRlNqvcaQL+L7xe6YzsYl2CkLhI/CQVTMGeb9lIKrFcnx5KQeUzgtLiCsfVSW2t3CCndy4FrRd9em8Yi3B52cplAYQ5sW6nAaHChEKPKem/mUHfFNHwMzm5n3XTKl1EqDhjubmckUyK5S10ZfhywJhEMhPvsvL4uesjGW3WM7k3NBkhkxE9DCEpvGbZDAGdZP7s0Yq2k8O8P04e7vBvjFP+2V6FIvlpYOvavQ5gTeJEsqBYYGoid6Kao0XTG1paaZaHzRpOVdamWMgDdBPlkTChM8/PmQFyZROVq3pRqDUpUk3zZukEDDKygwHmBJZ5F+Xl3hm2k7DS+111rTBZ1eShAGM2CADZHynOlyJUDqhrF2nvemfW9LOrCk2pQxZbNYqLyKPhGr+HHRr4x/0qCsrTGfgP2Gf4RbVHclEsqJ0Si908jC9gaqqODMFJ8S
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 09:24:48.4188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 962aed46-bf4c-4c25-5fcc-08df028ab596
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9973

On 25/08/2026 9:57 am, Song Hu wrote:
> hugetlb-soft-offline toggles /proc/sys/vm/enable_soft_offline between 1
> and 0 (test_soft_offline_common(1) then (0)) and leaves it at 0 when it
> finishes, silently disabling soft offlining for the whole system after
> the run.
> 
> Save the original value before the test and restore it from an
> atexit() handler, as hugepage_restore_settings_atexit() in
> hugepage_settings.c already does.  Use read_num()/write_num() from
> vm_util instead of hand-rolled popen()/fopen() helpers.
> 
> The restore handler must not call write_num(): on failure it
> re-enters exit() through ksft_exit_fail_msg(), which is undefined
> behavior from inside an atexit handler.  A non-root run hits it
> directly - the restore write fails the same way the write that
> triggered the exit did.  Restore with plain open()/write(), best
> effort.
> 
> Signed-off-by: Song Hu <husong@kylinos.cn>
> 
> ---
> 
> Changes since v3: the restore handler no longer uses write_num(),
> whose failure path calls exit() from inside an atexit handler -
> undefined behavior on a non-root run.  Restore with plain
> open()/write(), best effort.
> 
>  .../selftests/mm/hugetlb-soft-offline.c       | 49 +++++++++++--------
>  1 file changed, 28 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/hugetlb-soft-offline.c b/tools/testing/selftests/mm/hugetlb-soft-offline.c
> index bc202e4ed2bd..4af9d3db7b5b 100644
> --- a/tools/testing/selftests/mm/hugetlb-soft-offline.c
> +++ b/tools/testing/selftests/mm/hugetlb-soft-offline.c
> @@ -11,6 +11,7 @@
>  
>  #define _GNU_SOURCE
>  #include <errno.h>
> +#include <fcntl.h>
>  #include <stdlib.h>
>  #include <stdio.h>
>  #include <string.h>
> @@ -23,6 +24,7 @@
>  #include <sys/types.h>
>  
>  #include "kselftest.h"
> +#include "vm_util.h"
>  #include "hugepage_settings.h"
>  
>  #ifndef MADV_SOFT_OFFLINE
> @@ -31,6 +33,8 @@
>  
>  #define EPREFIX " !!! "
>  
> +#define ENABLE_SOFT_OFFLINE_PATH "/proc/sys/vm/enable_soft_offline"
> +
>  static int do_soft_offline(int fd, size_t len, int expect_errno)
>  {
>  	char *filemap = NULL;
> @@ -77,26 +81,29 @@ static int do_soft_offline(int fd, size_t len, int expect_errno)
>  	return ret;
>  }
>  
> -static int set_enable_soft_offline(int value)
> -{
> -	char cmd[256] = {0};
> -	FILE *cmdfile = NULL;
> -
> -	if (value != 0 && value != 1)
> -		return -EINVAL;
> +static unsigned long orig_enable_soft_offline = -1UL;
>  
> -	sprintf(cmd, "echo %d > /proc/sys/vm/enable_soft_offline", value);
> -	cmdfile = popen(cmd, "r");
> +/*
> + * Runs from an atexit handler, so it must not call anything that
> + * exits on failure: write_num() would re-enter exit() through
> + * ksft_exit_fail_msg().
> + */
> +static void restore_enable_soft_offline(void)
> +{
> +	char buf[24];
> +	int fd, len;
>  
> -	if (cmdfile)
> -		ksft_print_msg("enable_soft_offline => %d\n", value);
> -	else {
> -		ksft_perror(EPREFIX "failed to set enable_soft_offline");
> -		return errno;
> -	}
> +	if (orig_enable_soft_offline == -1UL)
> +		return;
>  
> -	pclose(cmdfile);
> -	return 0;
> +	len = snprintf(buf, sizeof(buf), "%lu", orig_enable_soft_offline);
> +	fd = open(ENABLE_SOFT_OFFLINE_PATH, O_WRONLY);
> +	if (fd < 0)
> +		return;
> +	if (write(fd, buf, len) != len)
> +		ksft_print_msg("failed to restore enable_soft_offline: %s\n",
> +			       strerror(errno));
> +	close(fd);
>  }
Looks good.

Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>

>  
>  static int create_hugetlbfs_file(struct statfs *file_stat)
> @@ -145,10 +152,7 @@ static void test_soft_offline_common(int enable_soft_offline)
>  	hugepagesize_kb = file_stat.f_bsize / 1024;
>  	ksft_print_msg("Hugepagesize is %ldkB\n", hugepagesize_kb);
>  
> -	if (set_enable_soft_offline(enable_soft_offline) != 0) {
> -		close(fd);
> -		ksft_exit_fail_msg("Failed to set enable_soft_offline\n");
> -	}
> +	write_num(ENABLE_SOFT_OFFLINE_PATH, enable_soft_offline);
>  
>  	nr_hugepages_before = hugetlb_nr_default_pages();
>  
> @@ -192,6 +196,9 @@ int main(int argc, char **argv)
>  
>  	ksft_set_plan(2);
>  
> +	orig_enable_soft_offline = read_num(ENABLE_SOFT_OFFLINE_PATH);
> +	atexit(restore_enable_soft_offline);
> +
>  	test_soft_offline_common(1);
>  	test_soft_offline_common(0);
>  

-- 
Thanks,
Usama
