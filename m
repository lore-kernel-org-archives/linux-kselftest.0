Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793983240;
	b=U2E5BaBnC35utcU3qXq6Rk5dtSI+EFykbcO3SD75+mdI2hQFYuEBiaA49k20wjbKg+pE
	 RGTiA7TIlpd0S7Vyhi7+PkV9kYxtd6mVvVd7ZiCp3xAJp1Lj+zhMXdesKMDCEV6ivJ1cG
	 1nkN9a5rabIF2q39xL3Ug4XGZGi/9TpgzfFTQWX8fKHbbvadnE29YnOPiTusbgTNV1fRV
	 DWNymgRJcXq6iB9l0UanfZ3SJktZfKugmUYoIkzp6lqTjonP0196gP8Cle6prZmzBwrJQ
	 TrAzi9qMM1UVn7d2qo3BK5tnK2d6Un3kDsiB9ftygS5ua/x0zMX6ZqTuoXmMTlnlp6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983240;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Content-Type:Message-ID:Date:User-Agent:
	 From:Subject:To:CC:References:Content-Language:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=WxaJLdWqpZpIoP5oSEmpN3IHrMErAUfCzU+laUEa+10=;
	b=BRJ6E29O3834mm7im26E1dKkZt0J0n0iqsLGTdLDMQCxF4ti/SLxulQnC+ZfiMuoOH84
	 M2U5fMRKMAwQMtxY1sZQM/S3DRh8rImUFiaQlmEYJ+4Ud558BApthqGg3QnpLn5pVV09j
	 fUCCVqPfHRuSoX7y/UV4f3b4GIDPI6+3UQ0YarfCZaUwk+2SAQB3BbVTUMJUByr4IUwDQ
	 bs6UyosCyWF6C28klRxQzppZO6I/bDK40ESZ7pfTqljLerHUHeLGF9XGEHtZIh9S7ovuu
	 OgbN++eHD1t9h/AS6K8EbqM0gibvg3N2C+UeUIBrzruic1EdraMo9fZmPor8sLIZaUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iLBce0iM;
	arc=fail smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42408606A329;
	Fri,  6 Nov 2026 16:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42408606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iLBce0iM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793983239; x=1825519239;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:mime-version;
  bh=VjyjZbjXqg8mKsc1RfKoa5zE1BdQVSMd02Ddagzfm34=;
  b=iLBce0iMEIBE/IqNYngb5AyMk8vMwQg3MCOKy2NFvh6bNEF4JMGbZEeP
   HE9zcb34z62i3SRcAe3KzlpG99xoB/+xh8q8dCVhXB2Z2vsNUD1ZNNycG
   Rfj7kOakxFnRi++330VxOYD6BTjbMYEyhrhXHpmBM0trLC9ba1D/JYZJ/
   jbR7lzoic9djexeae34rdL1/1BJA6jQESfMCGbnP5VWw2PtCEIYqQhre0
   xcuSzLq0948God6f/hcY+nYSVOp+xSEOYgQC9GqVsFzGqBj7olKpOeUZt
   Wylo7Qnd+1yPoTPOvs6sAqHsWQ4znGyQgcwjXrKrYHyFfKoz8ZZvcmK4D
   w==;
X-CSE-ConnectionGUID: o1tBBfh3RSKfgILWopduHQ==
X-CSE-MsgGUID: OqAsawaFQRmKhl1pDowzxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2714825"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="diff'?txt'?scan'208";a="2714825"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 08:40:38 -0800
X-CSE-ConnectionGUID: GSJTU2nZQv+a/GpOtyV3qg==
X-CSE-MsgGUID: wYjJF7aoQ2G8TGRFMBiS3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="diff'?txt'?scan'208";a="7642596"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 08:40:39 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 08:40:37 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 08:40:37 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 08:40:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vU2d07MPBIoYX/B+ccKPxWeGWb7GDftuksmlSS1l3xemzZf4q3Rwt/6/fisdVJA+M885eFevuDnNd7UUvN7L9ZiQEzO5hVdrZkutA+PxKeO+MdcL6oRupi6JHvSV54ZOLM377H2ibybabYRDmXNnhziacEI5urQNhF0nb1qoGaiSZ9xOvfHxYnFX0UraaU3rng40jrhLMW1SHhXJ2GAn8N476wXpWYuxUAaZGhHr2HTI4glQFDHGP6w6H5Jroqp+V6VrywZkomhfMs27So11pG05iL6my5EqvwIcsoxHzomvwh8LOlTAXCDK9yQoLeXk+3DA1SKloSfuz/ZnbDNoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiGsrTdyHkBPVgAzGz+JpmiZljGal2uKPItYGhOUR68=;
 b=sKtEPHlRxfsPcIYrZlWxeL1BhZcJeccTmxwxA2wRd98ZOSFfOSA9iaNDp9zJBDzEUMBLC+9yN+RRfc798mnf6ydf6AnSShX1VV+iJ4gGuGn5SF9aAil3L9uzzKKFfw3OLaxRJwqmw2yRL6bzMRxPBPk0rRjVwVQ0Qz4G2xO7g1TtdqjTIZOp2Z9YHNopDzHM/DYAMwyj2g3q97WNZmjmDUmWBTZqnIT/7Srg5DkLoKL6hCgWkJ6c43RC0jmkxs2d1O8h4Om/lPfc5CBFLA86omr58qgnc1wmf3h6bi1mJ7YxDfsplBCe3Jg4UaU+p1szo2Dx3aPt0yJSK9UX8gLESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 SJ5PPF44E8B88DF.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::825) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 16:40:27 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 16:40:26 +0000
Content-Type: multipart/mixed;
	boundary="------------9IYMu7v40i0CaVVDcBcr3X4Q"
Message-ID: <ab483f3d-e036-452e-bf58-6c87e59ae3bb@intel.com>
Date: Fri, 6 Nov 2026 08:40:24 -0800
User-Agent: Mozilla Thunderbird
From: "Chang S. Bae" <chang.seok.bae@intel.com>
Subject: Re: [PATCH v4 2/2] selftests/x86/amx: Test dynamic fpstate cleanup
 across exec()
To: Guixiong Wei <weiguixiong@bytedance.com>, <x86@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H
 . Peter Anvin" <hpa@zytor.com>, "Chang S . Bae" <chang.seok.bae@intel.com>,
	Shuah Khan <shuah@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <cover.1793604327.git.weiguixiong@bytedance.com>
 <4f21cadf18325a5829a27a8cd7107240e8e92c7a.1793604327.git.weiguixiong@bytedance.com>
Content-Language: en-US
In-Reply-To: <4f21cadf18325a5829a27a8cd7107240e8e92c7a.1793604327.git.weiguixiong@bytedance.com>
X-ClientProxiedBy: SJ0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::8) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|SJ5PPF44E8B88DF:EE_
X-MS-Office365-Filtering-Correlation-Id: b302825f-e2dc-43ff-b141-08df3c24a8ff
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|7416014|6049299003|1800799024|18002099003|22082099003|6133799003|10067099003|4053099003|4143699003|11063799006|261102123227099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: foKHXqdWaD9eLJ07OKusR2FRjjFc2jNVw+8Qq36olQ6xlivtuM+dYxcBM+dqa3oU6lWZJjgaM/10G4LO7SLdl+yy1URZemVv2wIwNuweHENYXEiCUqfqfnAK2KLL8baLGKv3V3NoTEhLKSJ0otZWn5rfI9hZpnR7bjjTR/hCwMUJn0IRhBbaDZipYiavwFlyhFon0leUUw0nFYW1VsPMBj26ZQtZ79elewEUtxtlvg3XStohavWGoWWaea6cm5NC/5BUnosPIk53jRjeI87uZVrpWVW3x4OyoXASGcRYBtmk7PE5to72SnxcDkhRxJO+9sEPNXyzZM0gYn9M1VPd+f6YuQ7s/LsppNji5mWT+A1gzDDwiQXkf0igJCahFQOAqydH52gnjKA/9p97kPRqC49ap+Sb3u8DH/KtndvKYQfssFAD8kd+rH0pO/OQi3wY8xEh0BsIxbi2q0wj1YCOs8lShmBOGekfhWqLy6tEUG1dEztB3zLq35Gpt8GtfJ++QATbdoSyxuPTlDUD5fnnVELh3IPfzIPB9zUkCoU/Ceh6o5eLIQNsVcbPIwMz6kEfg5Nb4fZn/9mv/OdJOKPHRH25XeRXuCpDutb7ao/pdHR7o4ioW7XHcnr3PcgA4CVuBC5b4uraKCsPpuoPOHsyNMAQbd9OETqT1JKHIgJNUlg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(6049299003)(1800799024)(18002099003)(22082099003)(6133799003)(10067099003)(4053099003)(4143699003)(11063799006)(261102123227099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGpTdHdPbnBHMTM3RHVlQjdTYlNJUW8wVE14UEZaSTBaeXd1MkhCMWMzVU9M?=
 =?utf-8?B?bExWRDVPS2dKMlNoc05aZ0E5anY2L2o1YjZuYzI0blFHUnYwY2NxWkYxUDNt?=
 =?utf-8?B?Y2V0S2ExVVNJeTU2Tmhqck5rSW5KbEhMMHJuMkhtQ2FIcDc4clBHdHZzTnV2?=
 =?utf-8?B?OStGME9tdG1UbXVHOENMV2gvZm91bzBFMEM3QTdyUWZRZUZ0NCt5T3U1WGNF?=
 =?utf-8?B?UEJMYnBXK1pPMGRhbzloT0d3RGtQTFJJVitpa1VsdUg4cVl6NkxjUGdiRzMw?=
 =?utf-8?B?eVdPZUdtanRMQm1oT1FKQ1g2NW5YcWw0QTF6WnhpYXZvUEQrYWZzNzE4LzFq?=
 =?utf-8?B?U2o3ZGxNd0JGVGY0UVUzcTJhcDRJT2o0ZzJLQXZ1azhCSHJNcU5CVzNBRUFo?=
 =?utf-8?B?SWRVNVdwWmVONjdDSXlYMWY0OTdqN2ZvUjl0Tjc5bzEwZXFzTHhXSitXeVYv?=
 =?utf-8?B?dldzN1FDV050Zit3VmNsTkVabG56REY1b3NYajZ6ZjF5dWF1OTdwSFpLT3pN?=
 =?utf-8?B?N2lLYStOeHcrZWEzbjYxbi9PNUhOS1RlcXdvbDFqM2NoeTNZN1ZkZGhIeVV0?=
 =?utf-8?B?M202ZStDMHFTVVVRVjIzK0MrWkxuZE56WlJoOWV6bkhYa0g4Uy9RSEc2ZWJ2?=
 =?utf-8?B?Q3VhaHEySG5FdkxlR0dYR0tHbUp5bGp1ZTRORHFiZmdIL0JoOGFPcGh6Y01j?=
 =?utf-8?B?V0NYY0ZvdjdBWFdmaTNOVjhldkdLYm0xeVlkTTV6N2IwU2ZXRDUzdnFoT1Fl?=
 =?utf-8?B?YThYQlpPTnZ1N1E2MlVkUjJxLzJ4N2U2c0JTaGdvRXhKaHBCVUl2SEJIVytk?=
 =?utf-8?B?S0xyVU9QaU1neG1SdTJpNURISUd3Zjc0SmFRZTBNVThJTEt2QjdoTGV3WEpZ?=
 =?utf-8?B?OGhiRjVEcmx2SDZZaXNCb2lyNXBJTjVBalZVWFFQZE1QVDlRN2UrelRSc2dJ?=
 =?utf-8?B?c2JiTE9kUUZWOVp1STArM2d2NEJjTVRPb3ZsUWxyZkdFVDVCK2czN21Ydm85?=
 =?utf-8?B?Zytub0orbFVZZnhzM2VEdHpSWlR6c3QrcDA4K1l1VkFGUkNqQWhPZ0J1Nndm?=
 =?utf-8?B?M2c4Z2h2cWVtcm1iSHpIblVjL2c2bFplNmYxNEJSNHRDSjkrMWttcThpRFBR?=
 =?utf-8?B?WVkrQ2hjbUtxWk9NZzVEMkFmU1l3MTBsQ0RDTmNFbUFwQitFOGtaNjJ2T2Vh?=
 =?utf-8?B?KytKRVhiTDBUSmtJZW9PV1lYYzllT25hckM4SVlVZDhaOFhUY0tzSDJRNTBp?=
 =?utf-8?B?Zk1sUURXSmFyTVVBRUIyU3YzVnZZMitubHdkUi9rcTlwOUp0Sjg4RkQ0TUZk?=
 =?utf-8?B?bFBtVEhvQlFLS2ZvOWI2Ry9GWlNlT3FUTGtnRnR4NDRQdnVGaWRrS2o4cUE1?=
 =?utf-8?B?WHl4T0ptalFzN2tNa0pva3RJRUwrUXZ2YmRXb0x1WkVPMVBaV2ZaYVNHMHlT?=
 =?utf-8?B?MWF3V0cyUllWcmc2YUJRUlVsd2VvLzIwMVdsV0UxZFhZbmprVVpBd25iUkIx?=
 =?utf-8?B?blNWcndJeXN0dHBYRmJsUU5XUktURzdmZ0ZUd1J5YUx0NDBwc05ienJiZmIz?=
 =?utf-8?B?WDdPZnl5dVdxZVFSd2ZXZmVMOFk2eTBKSkF0cnB0a0JyY3pzWFZOQ2FwcE1h?=
 =?utf-8?B?VXVzcXpKTE11MmdJWDRhUTVpdEdTMExPQ1FLNGpJdk1zTHVqUDQ2RHVVZkdM?=
 =?utf-8?B?NUtOaldrdEo5c2RVOVpYZFduRGdCMDBwWUVoL3ZsaHZpY3RwRzN3dmhaUGtD?=
 =?utf-8?B?SU9MQ3Y1YVRrQjI3eEZjbWtaM0Z5L2VVYWxaTHhLckFVSmVvQmc3bHp6OXZ0?=
 =?utf-8?B?S0swTnBleXBIZkhlQUhuUVFZWlJyNm5objlNR01DUVZQbVN0MEh1NVkwQ2lV?=
 =?utf-8?B?czZzWHowQUV1QmVaZnhMcGp1MlVrNDlzTW9QMjBnRFA4VFlNWkRUajY4VDQ1?=
 =?utf-8?B?ZG0ycjhpVk41NXRyTVVaR2s0Tm9RUlE1VDVWcE03di95RW1KS1FqTStwM1RJ?=
 =?utf-8?B?b0dCNTEzWE5nOEtLeUxOdU04L0p1VFpBNUxndm9jbFRkR3VBcE9vSlQvK1Q0?=
 =?utf-8?B?dFhrWHIxdUNlY3VSNlhyUUhqdkhWSjkrK1JvWi9zK3VsOU1CQm14U3lmWUI2?=
 =?utf-8?B?dGFCSUxvQWFUSUdZZHdzUzdlc0xFN0xZdFYwTDIzRDdXMjZYN200V29HNG02?=
 =?utf-8?B?L2JWeFZiY3ZQZFMzYXQwMWVKWHRPZUg1TFhOUU5CUGszNlE5WGdwYkhSUU9C?=
 =?utf-8?B?NkZTa3VOcUVmR3BZaFEvUWNiYzl0TUZuUmVTRWJnT2tlV3NsTG1ka3NmU0RD?=
 =?utf-8?B?N1J4Y0svVHZFL3Nub1lkYVk3UHhSeVdPZnF6TEJkWk01U0hsZmcrUT09?=
X-Exchange-RoutingPolicyChecked: MRmMuzfLbIXVUIMJqqr/NBSYQgzBtCm15chLilsDfRZ7bCbDojxXBVwPQbFyKvghM8nF93jYIWjQeS7YIpUxMTZcw07ntTZSpbODqt5I0xpUQcxLkTSGgZbs7+1wMAnReTdImxuwTKuxoGa6gtrJuHh/OiEAE6Bqzop1VB+AY65x5DVzd6QQpvQj1/PIs7jgyGeJy9OUnS91mI4CUToHmh+po+8nq6S0OMMnsunEB8tRXdFGaMANsAftGAcsqBPw+yZYpYfNHP7moaNBfS8amOHclcoUlj/CTBjlCXwpYTEh/20CVZX1T2LbOivoGcBPg8Ow9pDl0o2P07Ar/KFV2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: b302825f-e2dc-43ff-b141-08df3c24a8ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:40:26.6406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiObdCy9i58ugtqg5yD+68ABUHIUotg3Tjdz02dmXLDzAkYWeMV3BjudLCCXFJNanUrEDyd2BIi4iSV7RKv7UA+3iz/T4rarPfQOi5c6ttI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF44E8B88DF
X-OriginatorOrg: intel.com

--------------9IYMu7v40i0CaVVDcBcr3X4Q
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 02:30, Guixiong Wei wrote:
> ---
>   tools/testing/selftests/x86/amx.c | 251 +++++++++++++++++++++++++++++-
>   1 file changed, 249 insertions(+), 2 deletions(-)
> 

The code looks an overkill to me. I also considered using kmemleak, but 
this vmallocinfo looks to be efficient.

The other way would be adding a script on top of a small change to amx.c 
file. See the attachment.

Can you please try running this on your side and see if it works?

PS: I sent this yesterday but it didn't go through. I switched *.sh to 
*.txt in the attachment.

Thanks,
Chang
--------------9IYMu7v40i0CaVVDcBcr3X4Q
Content-Type: text/plain; charset="UTF-8"; name="amx_exec.txt"
Content-Disposition: attachment; filename="amx_exec.txt"
Content-Transfer-Encoding: base64

IyEvdXNyL2Jpbi9lbnYgYmFzaAoKTlVNX0lURVJBVElPTj0xMAoKaWYgWyAiJEVVSUQiIC1uZSAw
IF07IHRoZW4KICAgIGVjaG8gIkVycm9yOiBQbGVhc2UgcnVuIGFzIHJvb3QgKHN1ZG8pIHRvIGFj
Y2VzcyAvcHJvYy92bWFsbG9jaW5mby4iCiAgICBleGl0IDEKZmkKClRNUF9CRUZPUkU9JChta3Rl
bXApClRNUF9BRlRFUj0kKG1rdGVtcCkKCiMgRnVuY3Rpb24gdG8gcGFyc2UgYW5kIGFnZ3JlZ2F0
ZSB2bWFsbG9jaW5mbyBieSBjYWxsZXIvbW9kdWxlCnBhcnNlX3ZtYWxsb2MoKSB7CiAgICAjIFR5
cGljYWwgZm9ybWF0OiAweGZmZmZjOTAwMDAwMDAwMDAtMHhmZmZmYzkwMDAwMDAyMDAwICAgIDgx
OTIgcGNwdV9hbGxvY19hbGxvYysweDNiLzB4MjQwIHZtYWxsb2MKICAgICMgV2UgYWdncmVnYXRl
IHRoZSBzaXplIChjb2x1bW4gMikgZ3JvdXBlZCBieSB0aGUgY2FsbGVyIGZ1bmN0aW9uIChjb2x1
bW4gMykKICAgIGF3ayAnCiAgICB7CiAgICAgICAgIyBSZW1vdmUgb2Zmc2V0IGRldGFpbHMgbGlr
ZSArMHgzYi8weDI0MCB0byBncm91cCBieSBiYXNlIGZ1bmN0aW9uIG5hbWUKICAgICAgICBzcGxp
dCgkMywgY2FsbGVyLCAiKyIpCiAgICAgICAgIyBLZWVwIHRyYWNrIG9mIGNhbGxlciB0eXBlIGlm
IHByZXNlbnQgKGUuZy4gdm1hbGxvYywgaW9yZW1hcCkKICAgICAgICB0eXBlID0gJDQgPyAiICgi
ICQ0ICIpIiA6ICIiCiAgICAgICAga2V5ID0gY2FsbGVyWzFdIHR5cGUKICAgICAgICBzdW1ba2V5
XSArPSAkMgogICAgfQogICAgRU5EIHsKICAgICAgICBmb3IgKGsgaW4gc3VtKSB7CiAgICAgICAg
ICAgIHByaW50IGsgIiwiIHN1bVtrXQogICAgICAgIH0KICAgIH0nIC9wcm9jL3ZtYWxsb2NpbmZv
Cn0KCnBhcnNlX3ZtYWxsb2MgPiAiJFRNUF9CRUZPUkUiCi4vYW14XzY0IC0tZXhlYy10ZXN0ICRO
VU1fSVRFUkFUSU9OCnBhcnNlX3ZtYWxsb2MgPiAiJFRNUF9BRlRFUiIKCgojIEpvaW4gYm90aCBm
aWxlcyBvbiB0aGUgY2FsbGVyIG5hbWUgYW5kIGNvbXB1dGUgdGhlIGRpZmZlcmVuY2VzCkxFQUtF
RD0kKGF3ayAtRiwgJwpOUiA9PSBGTlIgewogICAgYmVmb3JlWyQxXSA9ICQyCiAgICBuZXh0Cn0K
ewogICAgYWZ0ZXJbJDFdID0gJDIKICAgIGRpZmYgPSAkMiAtIGJlZm9yZVskMV0KICAgIGlmICgk
MSB+IC9fX3hmZF9lbmFibGVfZmVhdHVyZS8gJiYgZGlmZiA+IDEwMjQqNCozKiROVU1fSVRFUkFU
SU9OKSB7CiAgICAgICAgZm91bmQ9MQogICAgICAgICNwcmludCAiJS00MHMgJSsxNWRcbiIsICQx
LCBkaWZmCiAgICB9CiAgICBkZWxldGUgYmVmb3JlWyQxXSAjIE1hcmsgYXMgcHJvY2Vzc2VkCn0g
RU5EIHsKICAgIHByaW50IGZvdW5kKzAKfScgIiRUTVBfQkVGT1JFIiAiJFRNUF9BRlRFUiIpCgpp
ZiBbICIkTEVBS0VEIiA9PSAiMSIgXTsgdGhlbgogICAgZWNobyAiW0ZBSUxdIG1lbW9yeSBsZWFr
IgplbHNlCiAgICBlY2hvICJbT0tdIG5vIG1lbW9yeSBsZWFrIgpmaQoKcm0gLWYgIiRUTVBfQkVG
T1JFIiAiJFRNUF9BRlRFUiIK

--------------9IYMu7v40i0CaVVDcBcr3X4Q
Content-Type: text/x-patch; charset="UTF-8"; name="temp.diff"
Content-Disposition: attachment; filename="temp.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni9hbXguYyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3g4Ni9hbXguYwppbmRleCA0MDc2OWMxNmRlMWIuLjU4YmJlYWMzYTAy
MyAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMveDg2L2FteC5jCisrKyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni9hbXguYwpAQCAtNSw2ICs1LDcgQEAKICNpbmNsdWRl
IDxlcnJuby5oPgogI2luY2x1ZGUgPHNldGptcC5oPgogI2luY2x1ZGUgPHN0ZGlvLmg+CisjaW5j
bHVkZSA8c3RkbGliLmg+CiAjaW5jbHVkZSA8c3RyaW5nLmg+CiAjaW5jbHVkZSA8c3RkYm9vbC5o
PgogI2luY2x1ZGUgPHVuaXN0ZC5oPgpAQCAtMzAsNiArMzEsOSBAQAogI2RlZmluZSBYRkVBVFVS
RV9NQVNLX1hUSUxFREFUQQkoMSA8PCBYRkVBVFVSRV9YVElMRURBVEEpCiAjZGVmaW5lIFhGRUFU
VVJFX01BU0tfWFRJTEUJKFhGRUFUVVJFX01BU0tfWFRJTEVDRkcgfCBYRkVBVFVSRV9NQVNLX1hU
SUxFREFUQSkKIAorI2RlZmluZSBFWEVDX1RFU1RfQVJHCQkiLS1leGVjLXRlc3QiCisjZGVmaW5l
IEVYRUNfVEVTVF9DSElMRF9BUkcJIi0tZXhlYy10ZXN0LWNoaWxkIgorCiBzdHJ1Y3QgeHN0YXRl
X2luZm8geHRpbGVkYXRhOwogCiAvKiBUaGUgaGVscGVycyBmb3IgbWFuYWdpbmcgWFNBVkUgYnVm
ZmVyIGFuZCB0aWxlIHN0YXRlczogKi8KQEAgLTQ3OCwxMSArNDgyLDQ0IEBAIHN0YXRpYyB2b2lk
IHRlc3RfZm9yayh2b2lkKQogCV9leGl0KDApOwogfQogCi1pbnQgbWFpbih2b2lkKQorc3RhdGlj
IGludCB0ZXN0X2V4ZWMoaW50IGFyZ2MsIGNoYXIgKiphcmd2KQoreworCWludCBpLCB0aW1lcyA9
IGF0b2koYXJndlsyXSk7CisKKwlyZXFfeHRpbGVkYXRhX3Blcm0oKTsKKworCWZvciAoaSA9IDA7
IGkgPCB0aW1lczsgaSsrKSB7CisJCXBpZF90IGNoaWxkOworCQlpbnQgc3RhdHVzOworCisJCWNo
aWxkID0gZm9yaygpOworCQlpZiAoY2hpbGQgPCAwKQorCQkJZmF0YWxfZXJyb3IoImZvcmsiKTsK
KwkJaWYgKCFjaGlsZCkgeworCQkJY2hhciAqYXJnc1tdID0ge2FyZ3ZbMF0sIEVYRUNfVEVTVF9D
SElMRF9BUkcsIE5VTEx9OworCisJCQlpZiAoIWxvYWRfcmFuZF90aWxlZGF0YShzdGFzaGVkX3hz
YXZlKSkKKwkJCQlmYXRhbF9lcnJvcigiZmFpbGVkIHRvIGxvYWQgdGlsZWRhdGEiKTsKKworCQkJ
ZXhlY3YoYXJnc1swXSwgYXJncyk7CisJCQlmYXRhbF9lcnJvcigiZXhlYyIpOworCQl9CisKKwkJ
aWYgKHdhaXRwaWQoY2hpbGQsICZzdGF0dXMsIDApICE9IGNoaWxkKQorCQkJZmF0YWxfZXJyb3Io
IndhaXRwaWQiKTsKKwl9CisKKwlyZXR1cm4gMDsKK30KKworaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKiphcmd2KQogewogCXVuc2lnbmVkIGxvbmcgZmVhdHVyZXM7CiAJbG9uZyByYzsKIAorCWlm
IChhcmdjID09IDIgJiYgIXN0cmNtcChhcmd2WzFdLCBFWEVDX1RFU1RfQ0hJTERfQVJHKSkKKwkJ
CXJldHVybiAwOworCiAJcmMgPSBzeXNjYWxsKFNZU19hcmNoX3ByY3RsLCBBUkNIX0dFVF9YQ09N
UF9TVVBQLCAmZmVhdHVyZXMpOwogCWlmIChyYyB8fCAoZmVhdHVyZXMgJiBYRkVBVFVSRV9NQVNL
X1hUSUxFKSAhPSBYRkVBVFVSRV9NQVNLX1hUSUxFKSB7CiAJCWtzZnRfcHJpbnRfbXNnKCJubyBB
TVggc3VwcG9ydFxuIik7CkBAIC00OTYsNiArNTMzLDEwIEBAIGludCBtYWluKHZvaWQpCiAJfQog
CiAJaW5pdF9zdGFzaGVkX3hzYXZlKCk7CisKKwlpZiAoYXJnYyA9PSAzICYmICFzdHJjbXAoYXJn
dlsxXSwgRVhFQ19URVNUX0FSRykpCisJCXJldHVybiB0ZXN0X2V4ZWMoYXJnYywgYXJndik7CisK
IAlzZXRoYW5kbGVyKFNJR0lMTCwgaGFuZGxlX25vcGVybSwgMCk7CiAKIAl0ZXN0X2R5bmFtaWNf
c3RhdGUoKTsK

--------------9IYMu7v40i0CaVVDcBcr3X4Q--
