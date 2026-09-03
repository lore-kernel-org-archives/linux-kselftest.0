Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610A14E56C0;
	Thu,  3 Sep 2026 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450408; cv=fail; b=MQsXi78e7hCATlfF8/bt0FwhnKV6+O2dBVBIvgNSHzHLsPYHbumk/ytIaU53XQbh4ptbzV1ivwC4eKrN2Q3F4n5P6wWfneBxlkeIhEhH0nXUsVR9p7Ds5i6F4QT2FBiAg6gwqBYfUrEfLJdv4nCmpezA5uAPz29JjAL5f1jC5+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450408; c=relaxed/simple;
	bh=5SwRQqUgNL4sdyYZ2m7kUh8FJ3ZyKfa2d3F8WvNOu6Y=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BlLYyE7Qn0Z82+hOVA1JeEReVZQPcgT87x+gmp1au4460mpCh7S7hrzjs3ydTwZVPIeotzF6Z3mo2fpPD0r3vMXWlVEmduwLpjxJM/LMPmEtvune8a9qvtcoGDad7AfDKPOYKbv5G1Eamga0DmF/TfophCrbcoXtTRV5KeLbu1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFEtFJlQ; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFEtFJlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788450407; x=1819986407;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5SwRQqUgNL4sdyYZ2m7kUh8FJ3ZyKfa2d3F8WvNOu6Y=;
  b=EFEtFJlQSMRlC6eqWMsMv7P81Z73F2ueOp3UdzySm0HciH9ZHAyrUAEi
   EcVRbFZRMRRb0Fl3AAw5kLUVYCRce+AUpt5GPUBF5SVWm0lXnzUO7P2qG
   FqGtEVE1XBeCLNYHCl3zbB7VyyznTbs+LHHgBcEHapHOrnxN6e+DUu4S+
   7xHwmnmBIzuqD8T1R69NIm4VslOLfjxCZaEn2Iiuoz8Ym4bkLU+xdgV0s
   pWliDpDsz3nVIKA2n8tVNqrUYiYh+aYADcKAfo8KsmWimgDmPENcPwunt
   UzGqtDzyye1sy4vSHp7wnxoN6N/Ne/5jalRBFF4rYcsHjtQaW+rFGGcNJ
   Q==;
X-CSE-ConnectionGUID: JxP/Afv6QN+I4hy03J4i/g==
X-CSE-MsgGUID: G/CmiDenSkCC8LiNWyrW7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88991386"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88991386"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:46:46 -0700
X-CSE-ConnectionGUID: 2CKmUskARMKl4PqzwSH0KA==
X-CSE-MsgGUID: V91VxnRqTqSr00GE9rXyeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293268082"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:46:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 08:46:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 08:46:46 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.69)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 08:46:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfBwAUuoIF80WC4lOHpirxgJmUKtMn1F6/gzCuYgREPkhPIyTVNHkdXsi1gPZEgFjT0P4hJiOrJSbeIshaMqs2JF+HeDX6qVIR8LBz3M7AxUmD3BxQODS0SjmOBLjJ9XMo76tH9embYrTddG9nScPUmGwNCoSYG2qUzLu6P1e9VXuPOBNWmR5WoTbNbVVMT/uzEMtj4wPRvERTctqahII2GEX0IjffnabwFJyLh6McwvNCb+HQCH0eSFqMyGZwTCAt8GH/Ctyw2EZJADlyMq1ZryL47HF/5mwDDz4aWviUNm69c+epoCK6Ly9/8qh7hGuSX6cFIYSMjUduq8P1WTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxDkxiJK/QeXuJHYSDNK6iclrFuAKVRs9r/jqz88BD8=;
 b=N5deBw2u6FJdTj4EhJO5Rm9hh/qlyrype8BZH6oRFeL/lCHENidss0TZJA6wdnfreksHJJRfeRg79wY97EbcdItWn8RBq02rsxaxqAG24WmMBm7mMWIxod6b1kyRO5TsBycD3gSmV14YFwi+amJRvaw6Q+huTwtg6jEpzZsjX03SBTweWcNDbRdqE/nqTF29OZEpLE8KzmDbLxk2lTnZ0CTERxGPnxzW4fajOHbdYiq+14Q+G1p3mhydNWiNd5vNrDBzI22z5gBVYgQLb7nM+KPgHSLVzzjgHunt+1/NWfu1CMJSchrYLOSQukrRNPs4PY5ap2lWhDLZMxbcNC05mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA1PR11MB9827.namprd11.prod.outlook.com (2603:10b6:806:4d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 15:46:42 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 15:46:42 +0000
Message-ID: <9181c643-4b6d-4a08-b0aa-4fd5099717b9@intel.com>
Date: Thu, 3 Sep 2026 08:46:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] selftests/resctrl: Add dynamic linked list
 management for IMC counters
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <zengheng4@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <prime.zeng@hisilicon.com>, <wangyushan12@huawei.com>,
	<xuwei5@huawei.com>, <wangzhou1@hisilicon.com>, <xiaqinxin@huawei.com>
References: <20260801092429.533956-1-wuyifan50@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260801092429.533956-1-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::33) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA1PR11MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 073ea5f9-9cc4-494a-eca4-08df09d28cc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|10067099003|6133799003|11063799006|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: POilxMp5K2dQ9E87R0yW8lDthGr4QGeNUBr3u6ufCgN2FwUWzZnEiR+UVtm+fVnJFK9MSJcbO/5R1C+Z/+nXb/W1GzQri/+gk/0ansFULAR7S1aXa8sLTIX+xs6fpLun/SSoSP6JAKKccSFEtFhmqjcPCl1uX2UhvAA6Okk8670S6dYyY6s5tx729Jc+443YrVFiTRWt8UwIb1Hc0OLMYXOajfDE74kYfQ7+2S0b44tdBNs2g/rDYel5u2JVTtvKl6DJAhisEveXcq93wbPEGefk7CtEizXA0F7vkNUwuURHVwU9D5FRmMt/9BPDyp1QBmh3Ggzzi0GniLdNUnpuosE3Xag2FFKcWq4r8Mm5DfAyZTI2BkJblmrVL9Ma4kVZ3IHm2YNCDqZHApsJWA1PhHE+OkgP+K7QQaZaC+k2wSE8iIcST0bkpeanS/OclELz7RAI5vnMxYlADbGg37/yFVjCjA1gO8za+4tqkdmVPk9RfqerU6MMqfdUoduqSOeNqQUuIiGWSrllE79vhqVB6wVtOSpGb5WrPDj83Y1GXxY0JFTlJzjkUy9hRDOn7i6vBtra+YZQVMkVL0glYePmUICA9lJoXCmY5M0Iw1jijPbWXrqsFECkMe6/pf5YFqUPsYt8x0QQeVOdA2DIFnQcaJJqPHauLwkiTklnLWvoGshTtdeWknTNw0gPyWvyolDhOAOZpgw8uW8XjLlayiqzPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wjk1dkZlRHlRTFhteDZjVll6ZVcveFlqeHNuZndOeHQrb0J2RkFzUTN1SzVZ?=
 =?utf-8?B?Qm9ScjNkbUR6TTJvendYR2FDZVZsOWtLbFNWWWhvZ3hxbHAzdExudHJHYmVP?=
 =?utf-8?B?bkUvWlpPcFVLTldlTktWR0gxZ1pLZjM4cklkN1BTWWRCNmtybjFYRGZDZUVi?=
 =?utf-8?B?dFVDemRsYlZwMS81enZsUmM2REpSYXYyWlJRU1JjUWJvZnd2TTZ4V0RhNFdC?=
 =?utf-8?B?UXFOdVpvVlJUbXpjRXd1SW5yR3FFRzRITS9jTXNabnBNV2JnbmIxMG1JZFFG?=
 =?utf-8?B?TGsyOGIxWlFVUU1hL042bms2SytDdVFQakhqL2NuTko3cUdWZG8zUi9Rdlhn?=
 =?utf-8?B?SFFsaWlWaHkyMnVIdmNYRlVrWjk2OWljMTVKNXBNL3JpR3dzR1haL2dlV1g4?=
 =?utf-8?B?RHdKZE00NjVpWDJTcEZmM0I0QUZGL01SbkNKSU83elJ6anVyRlBJVksvYWI3?=
 =?utf-8?B?TUNoM1p0dForQXdMWWc5SG41VnQvY016a01RRENiZUxSUkd3cEtiSmtQbklU?=
 =?utf-8?B?Rkh1ZENPeS9xVFpwWDUvNm1zcElTMWhIeWNndGVDRDk0UmRxVUtMdHpMa05B?=
 =?utf-8?B?VGxEcW41RUhZTitEWEppOEpWSmpBTEovemRubXB2QjVSaHhZQ2hnaGRGTmUx?=
 =?utf-8?B?KzVRUDZyYjE3SWZQamJNR3FuQlVrQis0N08zY29hVmJ0d3dNc1BlYW1QYWNF?=
 =?utf-8?B?NC8waGJ3bUlFalQwUTZsQlJUeUZuc3pkRHdjLzBiSGNHeDdBZW5QUEpXWFJy?=
 =?utf-8?B?ZXVxNFNHSEZHNnNQOHJjUnhacWlRZDNqa1FjbHBHZWVCNFFMdnlUaEh4dGtX?=
 =?utf-8?B?ZFhIdnhUUkxEbC9saEQzdzhIWjFteUFFMXRDUS9lVm9KWDFBK0hsTm9CZDdu?=
 =?utf-8?B?TEFyZXMvNGlmb2RJTFFuRWV6TkkvaEZyMTR2N0tMV21CWVFWTFNYOUdIeHJO?=
 =?utf-8?B?SUlwZ0RRRGphNk5tN2cwUzdFVzQ4QkhVMk9RVTI5QTNTZkxrMm5ZT3RXNHU3?=
 =?utf-8?B?V2dsOFFiSXlZMXdWdStwZ0RFbk42SERuSXdzQ0JFWGdPTzRHOU80MkNYdEpa?=
 =?utf-8?B?ajdUc1AvNVNoemxTMEQwR1hNb1VaeGt0M00zcWRWRklxU1BIT2JrQ05hb3RM?=
 =?utf-8?B?eVhjSEpkK2lCdE5hd25JVU14c1RnaW5vc2JSQ1A2WVdBUWEwc1pIZmlwYU1m?=
 =?utf-8?B?QXcyZk9JeGRaTWRYQnVaQkxBd1lBV1JvU3hWRm1adWJFY0VJSnFhbnRyY0xj?=
 =?utf-8?B?dVBxbnZNTkhucyt6STU2UmtCeUxqKzNYYjQzUkorVWFwc1JBdXJQWjFGZnBa?=
 =?utf-8?B?d0hKT1diRzBzNmtZaGFPQ0Nlb3FTUWx3R3JFam9OTVZ1cDV0S3ZwRU1RcjBN?=
 =?utf-8?B?TjN5ZEJJZ2xiNHN1SkNiditZb2dvbUQ4M3JBUHhSRjZyZFVyelVYZHo0VHQz?=
 =?utf-8?B?b25sWGZseDZXeFJmRlQ0elpxekFBK2o0Y3c4WHlJRUp5bXFIQnBVbHIydUlv?=
 =?utf-8?B?QzhSYUVPKzNtL2IrWGhQM3RZZmJqZ3pOQmNsRDZJb3RDblJ1M2dpcFZTMDZX?=
 =?utf-8?B?WmFrVkNHOGtpMFFFM0FQQXlUaE1aaU82OE5ibERKRkNoS3F3RGFldGhuQnBO?=
 =?utf-8?B?bzA3b1VOM3hZZnhaeVRidDhEcDlZWEFMNlNzUnpHSXNNWFhoRkV1RllZdm55?=
 =?utf-8?B?WFViTE9DUWc0SXJ1Y1RhUkYwVW5xRkVaV2hKd1llQXRadGdPOFovMFkwS2FT?=
 =?utf-8?B?Z2llNjcvcVlWb0R5UmJYNkpyUmRtOWhzYi92OTd1eWtManhsanNUU0hHOC9l?=
 =?utf-8?B?YUhNZHp1U2p1c3NjZGlsNzJNZGI5VHNSek9HcTQrekNkKzk5QzhvdEx5VW5N?=
 =?utf-8?B?Y2xIdE1pajlGMFA3aEcyekgwbWNHODJhZTVBemEyVEN5ZkJaVXliUEJvVWha?=
 =?utf-8?B?cDVkZWVHODNpSDF1YTRDc3dwTFBHdDY5L09VbGlhL1g1YW1SWit5MVJYUmNm?=
 =?utf-8?B?YVJ0NytUclpOS2ZXZmxxZWdQVWRpSWxxdWd5VXFVZlpDems2cEgyNEpidWph?=
 =?utf-8?B?bjcxam1pREpNdjZXSFcrNFJWRE9xL0J4eXVGNC9OWmRnNTk0a3FKTFpWL2pY?=
 =?utf-8?B?T2dGN1hMNUxqUldzVkdhdDVxUHJqcW1xcWpqN1VncVhsYjZaL1BudWo2anFR?=
 =?utf-8?B?MmdsUjNRcmRqVnBNTW1Ma2RWS3UvSi9tYUV0V2JzQUp6UTdqNFcxbmFTVnNa?=
 =?utf-8?B?Y1NwRDI5ZU1KQXJqZzhha1BhbExqMWdzR3BVQ3lVWVFhSjB1VEhOYk1qWVMr?=
 =?utf-8?B?Z0Rpb1B2OEI0YkJobUJDNm1taytvY01EQXBROUplTDYxQS9kVEdaTWRrZlJx?=
 =?utf-8?Q?tghqr07IIMMMH4/Q=3D?=
X-Exchange-RoutingPolicyChecked: F8Iv4DO74qyCeSGNbRAc9V1JSfni3p1zCqlBWXHlkx7hCQ32ci6R2VioKO2hTMdjY7CxW+xBmfYBQ1QqGlzJuNAzPc9RU4j6Vb+UNm34BqM6//jpPNIqfVviLWGOvETNJtA8vRY9oPMVe7EKeqkrc+8fx1FXW20P9+4YoXWJhdCwXX90qzfwOcXsPSXqnug8tuBBLCmevqDy2EuaDZszsg0pDO5xcQQDzgniPn9QwKhJ6E3RqK75orfRtb37MNqqkRmz9600gw1LB8fUjrczvBVJJd4ohJz4q3p353ewjEkPejy/EYVnPeECIgaMVnFmQ85gA7RkM5S43OQAkJt6HA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 073ea5f9-9cc4-494a-eca4-08df09d28cc6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:46:42.1730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GM00m5kw+718upvoCMGPcBafs9syf3FsjpIQlRcqrLWdXxCaUPz+rnswa6pOBVShYqUTLM7PyiiFXdLmlzRwZFhlFFhk9K1C811oW1epxZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9827
X-OriginatorOrg: intel.com

Hi Shuah,

Could you please consider this series for inclusion into kselftest's "next"?

Thank you very much

Reinette

On 8/1/26 2:24 AM, Yifan Wu wrote:
> Hi all,
> 
> This patch series introduces dynamic linked list management for IMC
> counters, enabling the tests to use all available counters detected by
> hardware instead of a fixed upper limit, without the need for array
> bounds checking.
> 
> This series is based on Reinette's patch series aimed at fixing the
> resctrl tests, available at:
> https://lore.kernel.org/lkml/cover.1775266384.git.reinette.chatre@intel.com/
> 
> Changes in v4:
> - Fix the style under Reinette's review and add Reviewed-by tags.
> 
> Changes in v3:
> - Rename functions and update comments.
> - Split the patches into incremental changes.
> - Explicitly release memory after failing to parse the imc config.
> 
> Changes in v2:
> - Fix code style and variable names.
> - Integrate linked list initialization and cleanup into patch 1.
> - Split the conversion from arrays to linked list across the remaining
>   patches.
> - Remove the IMC count and the global imcs variable.
> 
> v3: https://lore.kernel.org/all/20260522090540.444554-1-wuyifan50@huawei.com/
> v2: https://lore.kernel.org/all/20260410093352.3988125-1-wuyifan50@huawei.com/
> v1: https://lore.kernel.org/all/20260324125034.1509177-1-wuyifan50@huawei.com/
> 
> Yifan Wu (3):
>   selftests/resctrl: Introduce linked list management for IMC counters
>   selftests/resctrl: Replace counter index references with pointers
>   selftests/resctrl: Enable dynamic management of IMC counters via
>     linked list
> 
>  tools/testing/selftests/resctrl/mba_test.c    |   1 +
>  tools/testing/selftests/resctrl/mbm_test.c    |   1 +
>  tools/testing/selftests/resctrl/resctrl.h     |   2 +
>  tools/testing/selftests/resctrl/resctrl_val.c | 169 +++++++++---------
>  4 files changed, 92 insertions(+), 81 deletions(-)
> 

