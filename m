Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB12042A170;
	Tue,  4 Aug 2026 20:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.14
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876249; cv=fail; b=JQn8XSFjyMTXoZSyk23xq7b9+NKTCJKVqfv3HdfNoSB42WZGIcYT9RAfZL1+q+gObeQdC5foZWuHWJg0BwjkdByXnE9ZxUFYh4km++tBBMuSLovxkLwmgjR1mfUlBq6LJB45zGJ3XBj+05P6fRT3w2yThV/2/Hz1HjiTePyBk9I=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876249; c=relaxed/simple;
	bh=rJdkw1Mm+XQ0P2us59FEr7lTq/68WxP7eLyP2aCqSUc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XM8iyy0UZVZ2VjDfS9g/iCjlEpvLDX/EKT0FTB2ZqJWIB1y2xgdzR/ZCN1p5tnzp9hxrY2lyKr9GL4xOhzv7DAR2sTk4pcBUyXFPRWhkBIcol3/Q70PH2gPxGT6JaMB/N6NAzSXw1Sty1XIbYubHko+BnPmcRv7Ds/ocZ0PlvOM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YcUegbPF; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YcUegbPF; arc=fail smtp.client-ip=52.101.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YcUegbPF";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YcUegbPF"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ISrMs81AIMDRS20HfxMAg/toNBPmTw/s49hnOKSsQP+x6MYth22jYiRCLuwA54bhFSsMSwhgXtVdVaRFacVviQWwxK6U5chj/YcNnQDcChhwjN7WSmG+li6ymTf0vSnrtWXhTVGZzzAykSkHssfnJ2jPb+6S8T1/ltYMPU0osrwDMqfQONjMVQthF78UxmKwIIiJ2WaT0eaSR/Fn2dAUtZPbSI3Fnek5tuUDcQR9Aka2mRU6UMgNn53XPLLfvy+tW/hCqc71Xuk6QyW3/gexj5/whGUqE5XAQXWQh+TNNw3QUY/icRoSrMXi/a7YZ/H5lIv1GhbyoNMgtddcIoX6jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjtkzW7UPsM2lqyf2Oq0DNU9hj3vXk7j4Wib5mC+WgU=;
 b=LSfzzNa5sbd7JEXAqkwTxlIIYi8+Y0YovxHQFD2bBnByRNVA+mW0DbGZq28hl0AijmjX1jAaAGkX5Sq7KOtCQOSj2b3wobfLHYRHWIvF/8yQh8BL/dfIdwdqo6KYkdmjfk++PZ+F1rZYvts2Uyf6pWDNXH4GnmJ/QRm2YYmxkvifatcmm2TwbUMSZV0QkCHNci+IDzzxD5zH1d6ufbBOsm6zaskMCnrPj67FyZ6ailA6UlH59bzvR9MI90Zu/tYx3FGiRaBJpBm7okfDJIxjsgrR2pML12Jnshws2YTgR2C9/sxkdNOg2jzuDUOCFxpIZtodEubviNgDSXXxpD7fhw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=intel.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjtkzW7UPsM2lqyf2Oq0DNU9hj3vXk7j4Wib5mC+WgU=;
 b=YcUegbPFdTk8EdNteMYL5Ju0ayIcDPUMnxXFzRJ/7rkhINcErkome8jWdttv0rdg+yQUyKtLbz2xsR/gu0kWATaAAp5rW0wrZJ8d9i2fCJblhIdoVF7qfbwg7gHDs61yTIUTlc/+VGd3/coSrgmS3TIiS467rrykK61dzydzOek=
Received: from AS4P190CA0022.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::14)
 by AS2PR08MB9836.eurprd08.prod.outlook.com (2603:10a6:20b:603::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 20:43:59 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::54) by AS4P190CA0022.outlook.office365.com
 (2603:10a6:20b:5d0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 20:43:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Tue, 4 Aug 2026 20:43:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smnX0wiQlrVFAme5z6uw759euV5cSBJxjnpTAjncqsGHfdp0Cc8WfmGGMUvP+QmW7jQSmZXw96qSbu2NSsowfmqOHZYK4m3vB7e5HCAleQvo/BLie6O3ueW6GUg/AYTGzXeoA2ZLx5wsYfl5MmSEC/PmtutJUAkxD4axgwuPBqglnEg0qvmk5h/3pNibDM2XGrZwoYGMn9mNsC6XWzLqF9W66kG3VRDitUFFUzv0Q6r7b2O8/F/NeEKUNtPkAwcSO1KExqEKQ2MDGkV2fMxZIkyQl1aCqkUcbZGZIQQ31MztOTxOgNFte79N8q1fijyxVYw6OEoJSxY9KBcp2pjriQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjtkzW7UPsM2lqyf2Oq0DNU9hj3vXk7j4Wib5mC+WgU=;
 b=wZUHs7yU4ritnuvfdu3ppJaG2qNLJwI8XPDjeZFMujScHV9IV+KrdEfMvTSNB7KJXyuCswhvm49TI22cmIANfhVage9piMyd5ydeXFRh8ApWoiJPr1dbS3fzCbhV2hvxu3HbMjNGozTi9eP2PsSq2DSmi105J1R1sZE5MpjQ4W9qg5Lsvi7ZXyBuymsire1UaQSMC/3uxCfHnKPmMHWybazlzYKwvuaO8razwhVVrRysJF0YLq2cJu14q1wOBjoKdVSHRw+1qxM9a9y6z12Of4ZJGF/JS8Z8wNg977KUDZZ9gtLzWH+9hHzkeGzvxcMGm9ZaoKpMFWoXAwNjv+VGTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjtkzW7UPsM2lqyf2Oq0DNU9hj3vXk7j4Wib5mC+WgU=;
 b=YcUegbPFdTk8EdNteMYL5Ju0ayIcDPUMnxXFzRJ/7rkhINcErkome8jWdttv0rdg+yQUyKtLbz2xsR/gu0kWATaAAp5rW0wrZJ8d9i2fCJblhIdoVF7qfbwg7gHDs61yTIUTlc/+VGd3/coSrgmS3TIiS467rrykK61dzydzOek=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com (2603:10a6:102:2e6::10)
 by VI0PR08MB10629.eurprd08.prod.outlook.com (2603:10a6:800:20b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 20:43:24 +0000
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc]) by PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 20:43:24 +0000
Message-ID: <17d39558-14d4-484e-9395-29d4d20d5011@arm.com>
Date: Tue, 4 Aug 2026 15:43:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/shstk: support via prctl
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "tglx@kernel.org" <tglx@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "bp@alien8.de" <bp@alien8.de>, "pjw@kernel.org" <pjw@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
 "x86@kernel.org" <x86@kernel.org>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
References: <20260714154740.140431-1-bill.roberts@arm.com>
 <20260714154740.140431-2-bill.roberts@arm.com>
 <33ac05a617a26b3d9c4a374d14a4f210bba0a991.camel@intel.com>
 <51064f94-be8d-4901-845c-9f4a5e46a337@arm.com>
 <ccdeeca8fe9c6d3e0378891953ba9249557fea2a.camel@intel.com>
 <030bdb74-7938-49ab-809c-5fefae4316b1@arm.com>
 <5ed7d0f5baa920bb8feefd64444939c33397bbb0.camel@intel.com>
Content-Language: en-US
From: Bill Roberts <bill.roberts@arm.com>
In-Reply-To: <5ed7d0f5baa920bb8feefd64444939c33397bbb0.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0049.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::26) To PAWPR08MB9829.eurprd08.prod.outlook.com
 (2603:10a6:102:2e6::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB9829:EE_|VI0PR08MB10629:EE_|DB1PEPF000509F4:EE_|AS2PR08MB9836:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e266a8-63e3-49c1-0a01-08def2691be9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|10067099003|921020|18002099003|22082099003|6133799003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info-Original:
 hyWcZmBwH8lkCpukm0sbcLhqXi5uF9rkw999WY2WrCbIuM4LlRPZp37nhe720cn8faffyXr8DLwStMfsJtECch17lIRpeAEC+Wa+U5JlQ0RxNzvpoehNOEotPXBJu00tMTxVWHD7D96RAWvVYRH1EYlJb/hzMqoaXADGpv5baOyVc2Q0rXYi4T9B2TrDHi5GBUJdBEUqsBrJgxiBxx1zO20I4VbtG9B5DIXXIyZS+AoQQj3wTuEGsayZe5RbmA4xJeBuPF9hZQmUWAPV6Er++DGyJ8As4VcDDEVukV1/l8xGxW0aOQjSLMT3Yq1orO1GjV0ZAiZZwaTmKwEpf6wNCGD4ckUguyGRPOEAoFOtuxSIU4XgyQRSgC/NAYqz9TedXindHBjkopKU2CsNzo+g6FKdP55NEJMrv8FmwgHLDgnbch9E4gkFWb0W7Of/vk/h75fIF3ffP1vwvYryepH77RMgsP9r0alx1VzFkfJrn6hy3b57uzby/usrh9vMW2htPGnofFz1nRQdN4Ym8n8qaSWrGU6BHzqnIaKylTmDNx8aXYbTVfDk5vRO4vIfO1ISWTWi+diOqxUvk5L1FqvMR3evrzwXXbRXLs0lA0Ya8ckt2F1v6wTfdYdvdsgnIwHyipVNNm8eHEpno3VvHEjWV22DffJlG6zrXtWmAcPufHqnsa88SIGwN/KZ00fXz1YIonii6zPGG1yB5dlzPQbNFg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9829.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(10067099003)(921020)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 hS2QmtaQz6wjRDZJi/BUaghjXKyg+QD/HesRMfceoj0QN5s7QmJSJlYdGlmT+0sak+V1f6HdDLGmZmiGBnQa8ckMc2GfbgNbF6wfE3qa0IV/t/BD6tFRnGOLN/6+XbU7mWv4cdrOIlBzm6S4nstzG0bmaVeOgUXopjDfNKU0NOaxU1A99HP+G16druhmPzfT9AwkhMEwfyQY1fZlp1NfhAh6QcR7viCc0U2/Sm09lSnfyUrc29cmkU6koB2V42gju9pVj9GtKh2npuBtzcoeNQi722HIBi2l9sIWG6CzjjjK5ewqg7zsklbdjOFthFH85c5zKVibdAq6SIDRyCsOWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10629
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a55d7f31-451a-41f9-e3dd-08def2690732
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|35042699022|7416014|36860700016|376014|23010399003|13003099007|921020|6133799003|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	9j9xd9K+SM9a0ucDftXCegVEPyWl7KoZ2e+fhJ5CEHMyLeHRRx5i/ly3064Cr0kkU18HdC8waf2ELzOsQRAuzviJEX69QicRMzsvvDQ3IuNcacRFEGC4Kx+ncD+jp83ypZh0Yd5p16011WhWg+QyN0lVwZoj+yM8SDe0okdIGqAxUwcTD0S+uKI/8O2QzPDbaI2eAEHE9NkwGKtlYfU/k0x9pOrGaper/pvVLJFdTLn1UuwT7jiWtG3p4TIBFKpbpH+Y3J5Cq/vankmr/wl45er5hO5gAvDgzYrecJk8cJRxS1+jvXP/ADzUuKzN6/tQefXj3DQyb+JxOwhDVSW/mPMAnshRvrAQplUsNi6YhWGhNEi55GeZx2gSpIIAfeGR9udFnZr56LIZ/pod/H5zregbGEUr1QYtKA05hVbTyA/ahyA1u5tLR+HLLtKoGR/D6mbfxS+v/+JYVad/2XkViO7ejqacvjWsJSpDr/k8mDBhgqLZAkIGJK9ngOQO3rE0vQJXDkIye/VnAoJgmT5k7bsjJRBCEIj475W4BOUONerIbBzG2c1arcCrfqIn4DcxwFRcirK1vNj1k2PsAdDXc0AgV40OY626VPU3Z2pFsPxSUNj7MP38AsslmKkWeQJ4kTpRy47GHZXL2i47zmKIqWXeI8zetNnZWyLfBVti8nmmo6hqpRWXnf9pUH8RLQ4TOMqWaOs0/Ua8c0RSZ4oOi2HE+XkXG0aghjCEKY4ZswZV+DWM3eE0JBizSm/rt/0y
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(7416014)(36860700016)(376014)(23010399003)(13003099007)(921020)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ekY0GqLWeLpMHg3kgStRL8sMsO1FvmmPjSRUethrUEoVOseUgX/XJfXHm24wdda11yGz2kTORSWfVlo+u0YI05d0syoOzMEfdueZnCiKfxzKfhn3bJJS7vbJfR9prqZTUEiZnhAxUL6M624BHkFKciBpr0oNrc0fnuJuqvr0lI3GOvexDC/BdANey5d6yxKUCSyyIvypRas0vb8a6oEJihNgxVnepb7RteGOhZU5hHozVrcBBIMW2ZM6GqnuLWyhc8R7qNl3noGHMfPfIyywrh+chkAuRDPNsuC9+mzdZKmC3Q6844UQf4FgIdBcNZW8ZSpMuKE/ysXZShpRYTqNoKYVa1+mEUvv7uxlpPLvIhxQOrUoQ17sXPoQMT1fc0nCGVF2Nb5AH5ryQOk9JB72MSJAfB6ktbtRE6/EZx13fzB6l845LtJ+UzJfQzjcuEsQ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 20:43:58.5863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e266a8-63e3-49c1-0a01-08def2691be9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9836

On 8/4/26 1:49 PM, Edgecombe, Rick P wrote:
> On Tue, 2026-08-04 at 13:23 -0500, Bill Roberts wrote:
>> When they add unlock to the generic interface, then that will be the
>> time to rectify that. Just looking
>> through patches and stuff, I think that side is still in flight, eg
>> https://lkml.org/lkml/2026/4/3/1651.
> This looks like it is about clearing lock bits after exec. What I am talking
> about is "PTRACE_ARCH_PRCTL". It's a special ptrace capability that only can
> poke at arch_prtcl and not regular prctl.
Ahh, Ok thanks for clarifying that.
>> It also looks like the model is slightly different, in that there is a
>> window when all of this should be
>> handled, and then locked permanently. I know on our side of the house,
>> locking isn't really being
>> used yet. But that's criu, right now, the main things I would like to
>> coalesce is libc's.
>>
> IIRC CRIU needed to unlock shadow stack during the save. Because it's tricks for
> saving the process involved messing with the stack. So it needs to be able to
> unlock but *only* via ptrace. Apps cannot be allowed to unlock themselves.
> Because, well, obviously..
>
>   As MUSL and
> others get patches, it would be much simpler to have one interface to do
> this in, and right now
> unlock is unused (even in the test suite :-p).
> I think I raised this on the other arch's APIs originally. x86 went first, and
> then later arm/riscv wanted a unified approach, but didn't solve this ptrace
> unlock part. So we didn't join. AFAICT the situation hasn't changed. So I'm
> worried it's too soon to unify. Or we might need to do multiple steps of
> unifications.

At this point, the only remaining semantic difference is support for 
unlocking
a locked shadow stack during ptrace/CRIU restore. Arm64 and RISC-V don't
currently expose a generic unlock operation because they use 
architecture-specific
ptrace mechanisms for state restoration. If those architectures 
eventually converge
on a common unlock model for CRIU, I think it would make sense to unify that
interface as well. Until then, I don't think the lack of a generic 
unlock should prevent
unifying the parts of the ABI that already have equivalent semantics. 
Especially
considering how it unifies the loader/libc side of the house.

>   Also looking forward to understanding the security module problem 
> statement  better.

Right now all the controls are opt in, and requires support in glibc, via
per arch tunable flags for both enabling and locking. The glibc folks are
starting to balk at the amount of flags. Additionally, it would be nice to
have MAC controls on them, and the best way for that is via LSM into
SE Linux. Normal applications can be placed in a domain where
they can never remove protections, and things like CRIU will have these 
elevated
perms, if they are ever needed, since right now they go through a 
different channel.
The LSM actually removes the need for lock flags in essence, but yeah we 
can't count
on that. The lore is here: 
https://sourceware.org/pipermail/libc-alpha/2025-December/173636.html

For the following LSM piece, there is no hard dependency on this. I can 
put the LSM hooks into arch_prctl
for x86 and things would work fine, in fact there is no getting around 
that or the arch_prctl
interface for x86 wouldn't get the LSM protections. I want x86 to get 
the LSM protections. I
also want to coalesce what we can around the around the current generic 
interfaces for glibc.
Work could be done there to start dropping arch tunables around this 
too. I am sitting on these
patches right now, because they have a soft dependency on conflicts.

>> Ill spin out a v2 with the comments, but the one thing left to be
>> addressed, afaik, is the testing patch
>> do you want that? I'll drop it, but I think that's a bad approach.
> Yea, I hear your point. It is good to test more, but #including c files with
> pre-processor switches seems too hacky. Is there anything we could do to make it
> in one c file? Like not the templated tricks to generate two test binaries? For
> example embed the switch between the two APIs in a macros in the single file.
> Like say we have SHSTK_ENABLE(). Inside it does either ARCH_PRCTL() or regular.
> Then have a global or something that switches between the two behaviors. Pull
> out the parts in main() into something that could be run twice?
>
Anything is possible, but is the juice worth the squeeze here? This 
approach is used
already in tree:
- bpf/progs/arena_htab_asm.c
- bpf/progs/test_cls_redirect_subprogs.c
- bpf/progs/test_sk_assign_libbpf.c
- kvm/lib/rbtree.c
- kvm/rseq_test.c
- livepatch/test_modules/test_klp_state3.c
- powerpc/vphn/test-vphn.c
- x86/test_shadow_stack_prctl.c

I am generally a fan of doing the simplest, most obvious thing first 
that follows existing conventions
unless a really big reason can be made to not do it. I can refactor it 
if it's a show stopper, but IMHO
not worth it here. But if you want it refactored, sure.

