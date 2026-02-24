Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012037.outbound.protection.outlook.com [52.101.43.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B50E37D11B;
	Tue, 24 Feb 2026 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771938443; cv=fail; b=bPD3xJx86yxGAL3tmyUUueRBalmMBjSbFcAmpcKJQyn937/GWqJ77ujQIe0Xv2tbvgeoW+SRcvBda0eJdCBmLTIqJrpW+qKn5xcPO2R2osmYRSlbsxLoypZTCYNNlB5GHn6dbyGouu/ZBS/E6KtJycjjU/nlvebG8ylTjGKQf4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771938443; c=relaxed/simple;
	bh=K/pjwKnExWGoIOA2m818lAbP7qC0ERYDL5CjRKrplKE=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=r7WBOi9KyXNYdXMPD/XXN+rXooQgQmO4I+gpUY3+EDtj+oez/F1vlIGPDpJAFF4mkkvrL7FEJ0gE3pRbFKUBzm1UYv8Zw6tnQhqSiKu86fb9jqXZ4G2oH74KrefNlNs/YjCg1uGyKZj46MSK/of1WLel1goXWfkbgTI7fCS2Nmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fFvhCizq; arc=fail smtp.client-ip=52.101.43.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fFvhCizq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrqnBoLTQ61m3T0O4zn55h8v7S36Sekib93C+AAeBsgWlPsXW+sRUigsV2yBkGrLSgs/07CACglroP6Sc0f1O4+bXrGUtOuQWTiySwKAyujIM6nyhwJe1A9aAf2O/FTJxyXemTkdP4p3FwdWjieYxEW6QwpUA1NPZVFcEHgugCh7Hrj15jBeZsDAMIZi9HqMLmTnhHY9L9pzgbiS8XoM1AVEqglCFJoILxQC1wewC1YcA2XmsEwr/3ioCeH/9lWpRgkofBICAgt4ohh36aNTKOA7emQPD15wpoQdCB3Ogzcmk+Q2fV5umLV7NqD+qq0ciakgs4jNQG8Uryr9Fy4uyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KskTb5x12ct3xJpcvt4Bif/9iH2BbHCOfEIcAdmQu0=;
 b=KvZFZT3K/N1ZM8NtNq1n8J1WZxQp7CP/+lhn+Uvr3G6rE6cHtC4UpAXSAmfJQNYnKhn/l7zO0lfmZut7Cj8wmhPJOmX4mkTezG+pOEJmjSRUTz+4uB8JpzEM4E4Ntsgp91zvNY/gFKCe1Tpg/7qINXdcLjo5sDRey21+2vDkMXA3I996nq67UOndwZoyqthZ07iKD1etZUi5i5lTZOWv9nNlM6HU4rnBCC9U0KOAA8iDLWrtIaHnUja2c67dz4qrxXnGM0/l6iIcPDjSh4OL/uBvF35HJRbF2cxaOCZMZuocmMmPMRdDUbMLgqYJov05DlM/R6If3nGiZD8MEEbuJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KskTb5x12ct3xJpcvt4Bif/9iH2BbHCOfEIcAdmQu0=;
 b=fFvhCizqaMlXcrgwg3C97FPkmdz1MPh/UuH5X1uOlVSiZHzAb9LqzFgMYoM3oA31pq1BS1Lzb6lFwkASM3QL/fqXWQubwgH0ZiENSBYFH0Tj7nRHJ1XeYeHGOvKJRXuJ2X38/tFHuhfFKl2DANv2GKj7EbVEVSHqL0+tAAs1a9Kv3As5Bvfnsq8uamCB9Qip1KZHM4iYZThD7/CPeziEURuTok5grRUYfmGwpxxp9Evi8dhtbgFHK3gn2Ghn3KSvCb9ceJdJw5xXg2jBfa9nWX9lbP60uvMBJ6f3NIYzGlDBaGbcQMq+j9Z/dS/Xe4K9WIVsvWjLw8vGERU8Pn6Uag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7927.namprd12.prod.outlook.com (2603:10b6:8:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:07:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 13:07:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 22:07:11 +0900
Message-Id: <DGN7R1LIMMXA.PAEGCW35B6EY@nvidia.com>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>
Cc: "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <davidgow@google.com>, "Rae Moar" <raemoar63@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Shuah
 Khan" <skhan@linuxfoundation.org>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <Qrs5fItWst004EC_jGHvnTB2s8QuVM9cnRKIhUuImhaSV8qhL9DmqifhAqLFPSEf1JYNS9J-1hWqvptIARahvQ==@protonmail.internalid> <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com> <871pia2wcp.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <871pia2wcp.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: TYWPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e9b9687-9e22-48a5-b014-08de73a5a2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0l3SWFBN2N4TzFabWVKMHZGMmk4UzEvM0E0Rld5Z0ViRzgrWWR3U2o3eE0w?=
 =?utf-8?B?LzBHK2RQWGgvbkZZQS9aMlNpVmI1TjE2Q3cxdzZtZy9QV05NWWJicVE5dWt4?=
 =?utf-8?B?dzcvWXJqV3h5MXhHYzRCMWdlamdNSXVOR080MzNlZWduOGJSUllQVERuZXVp?=
 =?utf-8?B?RmNJOTZrWGd4eWV0UGpJVTczRldyUy80R21ncU0yQ0FLK3VBQ25jQ2I3V0pp?=
 =?utf-8?B?aUdHVEQ4Vmg5QUY4akYyL2N0SHZrRFlFU3l2elRiQTBVZnFmRjFYcEEwVU1j?=
 =?utf-8?B?VVI0NHpaam1sdUhqVURNMXp2OG5MVGVsRGd3UENmRWY3QnlvZTdjVTdWMHg3?=
 =?utf-8?B?MExZWHVFMDIrTGFJODNVMzVsNDJIeS9BS0o0b2xVZTAxS2FqZjQyVkRqWTl5?=
 =?utf-8?B?NUJaeUUwS0dCQkh0Yi95N3BseTkzQzZ3MzlIMWlYLzJBNjNHZDlFK0p1cFlw?=
 =?utf-8?B?dGhYOFNhb1MwUmlZSU4veEd1V3hvS2p2OTRHMENMRmdTREN3bDF0QUY1ZkZG?=
 =?utf-8?B?L2R6K3BDeXRnZ3FKR0NiQkpldGNLZjdCOVhmN1NnWVNJYUtBcDFvckVkWjE3?=
 =?utf-8?B?MGhTWVVCZlRCd1J2UjE3TDNCZGdSa3dBYXJ6VkxQSnh2WkxyOVFNRWFSQ3VJ?=
 =?utf-8?B?VkJjRCtLV2dzUkRraXVialdNZHk4V3lKekdsemxoU2N0akhkMlU2d0w0R2dw?=
 =?utf-8?B?K0hPYm5XYWdpMnpoUlI1Z2w1WFRpNHdZbkgrb2orazRFaERXTkl5ZEYwcUtG?=
 =?utf-8?B?L1VhbXg4SnhKNDhwa2d6TklqT0l0T2E5TDZLaUdyN2dtTW03U0ZnMWI3WlZn?=
 =?utf-8?B?aHE1amFFME1aZFViU3kwS0JtbFdGcE8vdjV4QXIyMW14aU9rM0xVdVdJY3Fm?=
 =?utf-8?B?RzRXWlhHeHlFUDFwcUlPamFVL0ZhSXhYL0w3SkdJS2VjNVJ1SHloQ3Q2bi85?=
 =?utf-8?B?c2pQRUx0djZySTR3WTFkUDc5MEFTd09ZdEc4WnpIWFE2TEFNQnBOck1hTkg5?=
 =?utf-8?B?Q0RaL250VDlLWVpQS0F5emIwM2FiaXFHbXRaTFpnTnUzSEI5eVhDT1hZRjNS?=
 =?utf-8?B?cDNyK2FBQS9mbEVQR0JTVjRETkxxMTZNRDVWSzNwZVpkS3Y0TDJXRmlHMGl6?=
 =?utf-8?B?Q0tEVTJ6SFlTZ0x5UDR2a2xxU2VVZWpMWURHZ2RMZkpmd3czc3VtWVAzdmNn?=
 =?utf-8?B?YmpJQ1FEQmszTEdJOTBVWitXU1VzL0lxRkovcVo4eXQrMXBza3Z3SldBMnA0?=
 =?utf-8?B?NmFzeXNoNGEzdDhlbFQ3YTJNNmQ2RVI5RTJwL0JiMVhyUmtSMVYrcHBaNnQx?=
 =?utf-8?B?Q0FqMHFISWJvSEI3eTROV2JQUisvLzR2eU03elBQSU40WVFacXlnNUozWDc3?=
 =?utf-8?B?d0lLMXI3b0ZsaVNJVlVwUjRyL3R0WTBsUlY2WUhZbnR5OUNJT3VmbjdxaXcr?=
 =?utf-8?B?U2R6KzBGSDFucTRFY1JVZzVoTEZwQnBPc1F6WUhhcmtES1htM1Q3Sisxd0Fj?=
 =?utf-8?B?bFZSU3V3Q3hQdGpZV3pnNXZwMitSZVgvUVdUeFpXdEcrVndZaUNBa1plOFNT?=
 =?utf-8?B?WTZUS3RIeVNpOW1jT3M5OE0zWGcwbEVFeVllUTNWWXI2aUxHUFdtVkM5VlIw?=
 =?utf-8?B?S1I1RTRWUFFaZHVzYkRYYnROam1Sb0lHajNkNTgxYnA5MjdydjBxYnEyYTlU?=
 =?utf-8?B?RFhRRzJTcGlqS1B3NUVHdjVXZURwZG1sZnU3TFBTVVBLQXZZTlVwVE5BSThE?=
 =?utf-8?B?TVpON0h2YTV5VFZ3T24wSVg5YVZ2OUR5MElSdmRQUi9INnBLdm1uZk5sazRq?=
 =?utf-8?B?RjVRbVZtVG94dzdLUVlseFBqU0JyL0VhZVVZK1lyTloxSGM1elVIc0tGaDYz?=
 =?utf-8?B?cC9jeTdUSzBKTCtFdVlRZDR4R3FzWUFIRTRqVUxyYzFqV2d6T2JiRnhuSnpT?=
 =?utf-8?B?UFdmeWlWQmw2UFlQZ3IyMlZYL3lKQnE0bThKZW92WC9NSERkNFY4RUhWaUpS?=
 =?utf-8?B?T3NCUlMxNGx0VDhJemcva0lJcnNINy85aVE2dnZMQTJPZFd4VmJNcFlwZHds?=
 =?utf-8?B?NHgrMGJyRHg2QU11NzVNN2dVZDVOQ1piS1pJV3U1eXRXSU01bkZXcjN1Q1lp?=
 =?utf-8?Q?CbFc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFVJZW1aa1F1MlBEUENvRzIvKzJYMDlQbUhBamlOcDdtSXhBd1R3azZHWGpR?=
 =?utf-8?B?VE12M0JzeXV6MFRKSGpaSnhVcDVHOXhwOU1jNmtURnNGeDBjMlpwOWhSTksx?=
 =?utf-8?B?Q25XaGYvTktydmFMRHk5eFN3RlRpRFlRTkUwYnBsM3o0dWRqT1Z1RHZ6TzIz?=
 =?utf-8?B?TjNYY052Wk81eUJvek9FN0w4MFdKQXhjcVRKNEhSZDR2VVdkdnBqV2YvSnR2?=
 =?utf-8?B?VG1EeXNqaHRvWHhuakdEYTk1RWxsR0NLVkJLNEVhbVNtb2JkRE9sTGhubHcz?=
 =?utf-8?B?dDNHZ0g5MHExODEzdjNsUHl3OG4rZ3JoeGM5dkxUTVE2VlUrZ2pCd29GL3dF?=
 =?utf-8?B?eGRrd284NWlNWG5NVldIQnljYmNrUFh6ck1BSk5SOXRnNmJMc0FzNkR1TUNG?=
 =?utf-8?B?dUlFMXh2L2JQRmVnUXdZOEVwZm1ocWpLUXJUZE9Ub3Y5TGxkVmNLK25HQXYx?=
 =?utf-8?B?YzFMVTVMSUJGMzFiNERSS0JtV1YyeUliYnlucTVWWHpMVUVyeUJhNTlnUi9F?=
 =?utf-8?B?MWgzU0p4enlzMzlXdUJQWEtGWmpGc1I1QS9BVC90Smo4WS9tMnNVZlhMUE1m?=
 =?utf-8?B?SURlOVo5aTlscEk3MjUxcWVzNGt2WHRJYkpKQWhhUG9uTjBXTVluVGJCVElB?=
 =?utf-8?B?ajJ0OWlCV2U5K1k5ZUNYa05JS1BkL2xHL1Y5ay9jcEFDSE9pa05HcVJldnpI?=
 =?utf-8?B?dVR0U0JvTUFGaVpIUUM0V0RKVzV6WTY2ZlFzVGpEM3kyd1dReWN3c0VZbGtu?=
 =?utf-8?B?d1BaVTJCUkZnSTlxTzRNTWE5Y2lpTmxFZ3NEQS9DNlJFdXR6dUkyeGh1WFZU?=
 =?utf-8?B?WnIvRGVPL0xyRThzcXhTVWdrakhWUXhGZVFzMWZwUXY4UDFWN1pUMEw0Mnhl?=
 =?utf-8?B?V1BIL1dveXdzL3lBemZKWTdxMmlxNjcweWhDZUR3Sk40d0hYSmw1VnROQjVR?=
 =?utf-8?B?RWVSTllLc2RUUkNybitNZmJxRFlpTEFLZE83dkdreUttZmpheGhaRWhrTnVj?=
 =?utf-8?B?ajJrVm80SFhORkJYQi9aSmFUT1FZS0d1aGxWb2FFbWsvNWpMR0xuT2hoa2o1?=
 =?utf-8?B?a2p1dUFjR2c1ZTdseXdkbmpTeHRlM01lODBGUjFrYlpSM2hUUFRJM1RVSlk3?=
 =?utf-8?B?OGhJc3hBR3crS1B1VDFacjN0OTl1VkVqSUJQMThKbXhSTUQzSkNxRENKQndI?=
 =?utf-8?B?Um5YSWJYcUpMemxFcFVTVm5ER1B1clNDdzZUR1pTZEN2L09ydUIycy9FT3lL?=
 =?utf-8?B?MG9lVzlTVW55cjdnZGJtd1BxNUM0LzIzVmRjUkkzdmQ0R01VTEtEM3ZsNjN3?=
 =?utf-8?B?YnRWdks3MUlFcnMyQ09DZjc2aC9DeUVzOEt1TXFSSWRwUWFHNDNIUWhjbVJX?=
 =?utf-8?B?ZDdYSGV6V1hyRE1rWkVNeDhxVStlWXdWelFtek1WN2FMTlFqcjlSbVF5Q2hC?=
 =?utf-8?B?d2VXVXlKUXlkMFhHZE5WYk4zUDVjN0haSGpvUyt6alh0dkJ1K1M2WmhTc3p2?=
 =?utf-8?B?QzRLek11bkxmMmQzUjhmem5PYlp4Z3A0bU1aVVpDOTh5cnI2bkh2RGVnNm54?=
 =?utf-8?B?ckFVaE9oem9pV1FiUGdMaGVFb005b0hOOTZEV2dLWU1JWlFuNlMySlg3YXMw?=
 =?utf-8?B?cTloTWYwVDdSUGd6cmxwcDZHUGlDRU8zMEF0VEgxWWhOSjVxMnd1eXpad0w5?=
 =?utf-8?B?bGJCM294Q3pDejNETWpJcUF6bTVpS0o3Q1JpL2hVQTgvMGFPU01EWFB5dUU4?=
 =?utf-8?B?ZFl0bjc5VCtDYjlwTHM4UUswZWg1d0RnUmY4V2NmM2ZrZXZaay95dkJDZ2pN?=
 =?utf-8?B?SU5zR2ZRR3l3dWcrSGJ4SzRUV1BLL29oeVRabzhmUmwvL21veU40aHV4U3FX?=
 =?utf-8?B?RE9jWG8rZE91TWE3dVZVYzhiOUEyQjRTVitXckFNeGhxdkxvTjBCRUlTcXk2?=
 =?utf-8?B?U0FadGIzUW1WMExvbTRsdEZpeHl3QmtBdXd3ZE8rQWRKbnpIT0dnVklEUTky?=
 =?utf-8?B?UEFkRVVQdUxmRTU5V1liNW1CWDdKTEJ6cnFneGN5UUFiVzcxVG5OaHQ2eDFC?=
 =?utf-8?B?aEVNRWQ3OE4xMk9Wa2NSbzM3YlMvL2Z6UU40TnJGZTVmM0UzZzljMFJNNXVL?=
 =?utf-8?B?WkM3aE9vRExIV0xwTHB4Rkt2by9ObVQzdFc4bVJhNVErc25Ib25OdFF1cDVy?=
 =?utf-8?B?RlZVT2xSUkdaZFcyV1UwaUNXd3g4bVNsaTdPeTQrOGxQQ3RsTm5oZnludzBz?=
 =?utf-8?B?Mmdoby9jYnFLR3ZtVWppUHpsVGo0aFJDa0QwZWpJRDlmVWVNcDB4RUZvdDNX?=
 =?utf-8?B?SytTRm5STGpXb3Z0ZHNCWW16azI5ZGozVXQ5MjNYRGhLTi9nTWpKRzNvajk0?=
 =?utf-8?Q?h0ErnQQALQUWqPfX8hFkXmPfsaZWWcEr/ck1oAeKqBDM3?=
X-MS-Exchange-AntiSpam-MessageData-1: JRwGZOUmGpJNng==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9b9687-9e22-48a5-b014-08de73a5a2c2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:07:17.3099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ux3ynrg4f0um8+Zj+g4Wd6bUUgJMqYBVZJ5YJ24fEHwCW7NwF/Y7wqp+HnrT8LJcTIMoRPM3uD0uT5uu1L+obA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7927

On Tue Feb 24, 2026 at 8:51 PM JST, Andreas Hindborg wrote:
> "Alexandre Courbot" <acourbot@nvidia.com> writes:
>
>> If `CONFIG_PRINTK` is not set, then the following warnings are issued
>> during build:
>>
>>   warning: unused variable: `args`
>>     --> ../rust/kernel/kunit.rs:16:12
>>     |
>>   16 | pub fn err(args: fmt::Arguments<'_>) {
>>     |            ^^^^ help: if this is intentional, prefix it with an un=
derscore: `_args`
>>     |
>>     =3D note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on=
 by default
>>
>>   warning: unused variable: `args`
>>     --> ../rust/kernel/kunit.rs:32:13
>>     |
>>   32 | pub fn info(args: fmt::Arguments<'_>) {
>>     |             ^^^^ help: if this is intentional, prefix it with an u=
nderscore: `_args`
>>
>> Fix this by adding a no-op assignment using `args` when `CONFIG_PRINTK`
>> is not set.
>>
>> Fixes: a66d733da801 ("rust: support running Rust documentation tests as =
KUnit ones")
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> Changes in v2:
>> - Use a no-op assignment instead of the wider `#[allow(unused_variables)=
]`.
>> - Link to v1: https://patch.msgid.link/20260224-unused_var_err-v1-1-c51d=
805eceb5@nvidia.com
>> ---
>>  rust/kernel/kunit.rs | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
>> index f93f24a60bdd..a1edf7491579 100644
>> --- a/rust/kernel/kunit.rs
>> +++ b/rust/kernel/kunit.rs
>> @@ -14,6 +14,10 @@
>>  /// Public but hidden since it should only be used from KUnit generated=
 code.
>>  #[doc(hidden)]
>>  pub fn err(args: fmt::Arguments<'_>) {
>> +    // `args` is unused if `CONFIG_PRINTK` is not set - this avoids a b=
uild-time warning.
>> +    #[cfg(not(CONFIG_PRINTK))]
>> +    let _ =3D args;
>
> I think (didn't test) that you can use a conditional attribute [1] instea=
d:
>
>  pub fn err(
>      #[cfg_attr(not(CONFIG_PRINTK), expect(unused))]
>      args: fmt::Arguments<'_>
>  ) {

Yup, that works as well, and I think I like it better as it is more
localized. Alice, WDYT?
