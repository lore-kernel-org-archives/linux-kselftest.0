Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34603233722;
	Wed, 22 Apr 2026 18:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776881498; cv=fail; b=nHtlcL7kGP7iBOt7ZSe1flIyuNKQzM9izhq4+Dp/DB2Fkmzo1N8qh/T+TjRSK7MLb9VPib5IQaXq9ZePG4+SWXSsES+/Inbb5xnL1S2+CrJQWRb3quzS/Nvme+XDaSQ6i0Q2U7Znm2QykGLDxS4JT6N02pEIKl+v9J7qEEKfcNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776881498; c=relaxed/simple;
	bh=ebn0r7BQ+ZIISsEa/Yox5fh5SAxfppNFbDZVJGYn0XY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HgYyCkjmplzxPU0g3CCKyJGC1HybmkXCa7YixmA7Wnjy3JcG+F2Lmmvdslbqds1jDZkT8lRjvZe4Qmc+DS/59noU/G/AqT9YTtRWFiOWhJ2yQ7rRePteMJVm8aCIAoH6fesxlAtSwd0PK4ELzkCLId3+Gi3q7GiWaKe4GPtSLKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnoiPbIO; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnoiPbIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776881497; x=1808417497;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ebn0r7BQ+ZIISsEa/Yox5fh5SAxfppNFbDZVJGYn0XY=;
  b=LnoiPbIOKG+HL9X3zGHsDNedqv/m2GmENGiSEdI7FceyAAbtHaRvw9qp
   czofQmZZAbwQnm5b1c2NBo3pOWJWMFGaDzyz8x6Clrzob2Ktd6lMydbo5
   pFfJv+kPWk+QtT46hNFvNhMjh3PYLOuR2DLUD8rhRLhXZSubwfn50oI4m
   M8hhmzeAmai02uuqKgJ2mJh5n4F7jA34MVQUNSueqpu+eEkWYa+l1GATu
   dl5eau/omFiTz4sBDJlVmujWQ+XnPxE6L1qmoePwu3hi+DsPoAWo5zHIZ
   JYkP512wdfZZE4pZl3IJ9tV/vWcvRTeKLixgPYZ8oIRwtTCA5lIzdUJYq
   w==;
X-CSE-ConnectionGUID: Reb0i2IqRpyBSsiMoKB63g==
X-CSE-MsgGUID: dNxbK9xzTE62XTwUgH3AYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="80431275"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="80431275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 11:11:36 -0700
X-CSE-ConnectionGUID: IHQLyF6qQ9ucSw9p1BA2uQ==
X-CSE-MsgGUID: 2Cztb06VSaKGq3C75RJDUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="255899627"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 11:11:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 11:11:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 11:11:36 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 11:11:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOZYoEC4OOJVrA1h5hji6b2xya5bo5hHn5ODQWkzOhAs2ROSteZzHturN9GX6yBEWoFdWOlIj3bLi6UJt0liPpuZY1v35XH8eSnBT1N0f/D3U7f0EweySsdBIHmxni0Frltx8hmMRtY6AX5T4ylDVNNIYyLUv+HW1Gtw2/aArA+f7tl96NLMylrisq7oMTLfa81kZa2drPHl0rTP6Idmba4S9WMxqikPNpxMrfiomaX36cxRyAKqI/oF3ML0poIDU5qsFkKctTOr5vJ3WCESKNFTg439nIvSKyu8aeDB6ZagNAWkFAjRTl+7rd/jWSwmjeG3BhxgWSfIAdC9s9o+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BSe0caTGBf1P7KHT9nFLIq4028bCpsRRWmKVufSIaE=;
 b=QyoN/4pYAaBZelFjmKEVsMaDmYgQfOUKecI9v86wWWYAm5ZyNvy5PszRHhGkB0ztPv6wa2Yy5MyFtU4efdQAPm6ZcYouqB/SwDt5jA54wNGcChhvgrlb5jEb1mCvlX1kK9woNveifJDQf2eZUxfLFDndBZJjClFtsYnth83nZ8X9Rl+5kVGYqnPbjgNMVZuCpnkBpeWf1TVK+HUWNBYN/t9+HLyecJQMfhnxgk3Jh2ngEH6TSaeM8W+YKqVDKe4hJ8RRK/1KLFa/Nixu5o+n03haPJ8gI5Yh/1Kuf8ceZ0gTA/1By/E/7LlWh0tRS0/nmxJT2/gOTnR+ZJ6XhQfDSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by SA0PR11MB7158.namprd11.prod.outlook.com (2603:10b6:806:24b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Wed, 22 Apr
 2026 18:11:29 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 18:11:29 +0000
Message-ID: <2e3c3288-4a82-4803-a0ad-5b931041a54c@intel.com>
Date: Wed, 22 Apr 2026 11:11:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] selftests/lam: Update LAM tag width and cleanup
 names
Content-Language: en-US
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, <peterz@infradead.org>,
	<ryan.roberts@arm.com>, <ilpo.jarvinen@linux.intel.com>,
	<maciej.wieczor-retman@intel.com>, <jgross@suse.com>, <morbo@google.com>,
	<mingo@redhat.com>, <ljs@kernel.org>, <nathan@kernel.org>,
	<shuah@kernel.org>, <akpm@linux-foundation.org>, <james.morse@arm.com>,
	<oleg@redhat.com>, <houwenlong.hwl@antgroup.com>, <xin@zytor.com>,
	<justinstitt@google.com>, <seanjc@google.com>, <hpa@zytor.com>,
	<perry.yuan@amd.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tglx@kernel.org>, <nick.desaulniers+lkml@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<llvm@lists.linux.dev>, <x86@kernel.org>
References: <cover.1775813245.git.m.wieczorretman@pm.me>
 <20687a8abed771847a4056e64aedbc073076d477.1775813245.git.m.wieczorretman@pm.me>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20687a8abed771847a4056e64aedbc073076d477.1775813245.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::18) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|SA0PR11MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 7828c244-5f9d-4710-2ace-08dea09a9390
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: KRefN0MMRsaizaXpTYozrD1cE9dWK2L0EE1TqiqXOvyt/wIZ3eczp4WW80/nqYrjjPYOpbNTh+xODIh7qj/4kLWguMkx37GwAYO8WHgrqrRyOklhzLmDg52z5Ws32FiQupu74/R2n7AOjiO9dBcRrw2l8aAvkP/7UTVVxWtVzGrbll52Vz1B/3V5ELKgocUAV8VPj29Mnytj7KYKavX6A4LI4KSXdoZlSiREcNY1Rs6YfpweZlxngF8PP7z1aiTJbEt61I6LExmQQOB9eVCEE3Ju/a92Qglnk1FhHZ4l8H16KL9JQ9sso2x1xqPXGWac6LGzDcEPdL9aljipRKhsvyqRloekPnjQFkS4Z6Fz/pdwKAev625tj0keHfqkvClPfCbYPzU/C3A3ou/glgmiI8srlygnS2a3MtI98xEqeyhqGG3b5JyG1UWPwgAWbs8xEvRuJCXljLDhDcXFB3aNxec2Y/3E4g0yF4xwTwiIOkoLeumNHTGDNQ+WR0aMsOnLpz3B72sf5JTbDboJVyqE06+vY8EELkOBzv61+pEYxzUUL5Wz5CLhfMp9lnqkrrSsi70tlSZAtATuAdbRtCmkzRvEfho6t+a5HHqF7e0gPw1YEL1YMgT3tXEU+ZG0TRdiIOd30rjVSPosqGImY/vCBLimQqLKfkKFPrnM3HQER9OnZgjdy1hePQO43wPDsTBmB6QI4oL2tDmjRYOP7cSO3PrsLWvL5sThvTxk+S40CZXNli/1CFYPP6lquOUH4HQXHN/cF2JarWfUrrKXc5SHrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUdHYnlETzhnMVU3UWlTRCtxNE05eE1SUVljS21rdFZndjVGNUIwdEhaNHM0?=
 =?utf-8?B?bnMrWktRdE5FWmQ3MHJsOGNTb2dJTUFDdmEvSnZ2aGcvSG9qUkFsOFJVVHdr?=
 =?utf-8?B?eitOUzhIQnNrMG92TVV5UkIySHpLNDkzZXhoY2lEL25OUUVKY0VXSUJiZHpo?=
 =?utf-8?B?VU5FTXpRa3VDTGhzWnFCY3NKWmE5SmtMZXJPSFR0alZCQWVoUWlNN3RCT0NK?=
 =?utf-8?B?WWVlUHpDSU5FQWdFb1ZxTTloRWVYQkJuTTNMNXh6LzJhcU9rRS9vVk51dDFW?=
 =?utf-8?B?WHJwT04vYWxLcnRsUm40RHVnZW9UUUp2em5VZG9qb1pkd1hHM1RUaVV1bU1m?=
 =?utf-8?B?VEcvb210allKeFVlcm5FeTNhOGhxWklBSnJUY2ZhcTdjZ2krTTRjRUJmOGx2?=
 =?utf-8?B?UkdlM2lDeGxnRnVEd1M4ekk0VGc0T3dNQmEvQzVSOTBid1d0YStJS0dLaDVj?=
 =?utf-8?B?RERSbkhXdmxzYlRxcmRLbExqNm9pU05qb3RQaDBhaWxyeTNDbU9rQ1NhZHVz?=
 =?utf-8?B?blBxeEtLVy9CWWxFTE1MbkRvY0VhcnhvRW5Ba2xGeG0reUpEMlRrZzVJUUlk?=
 =?utf-8?B?a1lmaEF1a3Z1VVRWcDJ2b0dETXV4bmFneHRqakhEVFdyMmM3UEtBQkJoUzRT?=
 =?utf-8?B?QTRCaFBxVTMrTVNWRkdFZThhQmlWdDBzYWd1WkNyRjhSdjN2S1p3L05UMWd6?=
 =?utf-8?B?azFyNjhJVERtTFNSbjJ5aDFkZUN4STVGV1lpK0ljc3RGcFdXK0ZxNG1SaDgv?=
 =?utf-8?B?OVRubVBaNno5RUNXNmI4OEFKczVvbk9nRmkwMTRXbzBrQTBWa3crbnpPMkcr?=
 =?utf-8?B?WXV0U3Q5MTk4Z0tkYTRHa05xYjFxVmlFZFlFSDM3YjMzL3JrQnI0SFZtMDNF?=
 =?utf-8?B?VTQ1SWNWQUorS3NlOVIxbUlYYVFIYzRzYXg2bElvVTFiRVFNMFNlYXQyWUZQ?=
 =?utf-8?B?b0hjTGZFR3VPQUxTUzd6a0FwNk8ydURrUWdmTXNSUDhoYVl6VDZZRjhHaG1C?=
 =?utf-8?B?UmNWbGV6dmpOcDVlYzJYTGo1OWRRRFF2VkY5N3J3aUNMcUY3L09BNXNiYmJW?=
 =?utf-8?B?dVprcjZTZzdNVlJyb280Y2RTeXJiejdDNkZiNlFhN0htVEFCQVQ0bkpEOUpY?=
 =?utf-8?B?dWYrU2hNNVRrQXhzdUdzRTdtUnJld1VNKzlFU042TUNKNmdtNmZCdEY2THlx?=
 =?utf-8?B?L3pZY0RoZmtOUXZTSVBPMHU5RlFyVlFJSlA3MEY5S0xkTnN4UGdKZk9JYmI1?=
 =?utf-8?B?aDdXRngvL2dpRFVaMmpkSkZFbmJwTnRGSnJ5WmhiSFp4cU1aSFZ1emRpUEI3?=
 =?utf-8?B?NWJGS3hJS1FpS21PNkdJUWZGUWlOSngxY1ZLNEVpd0hLVXA1YUg3TFJlc1ZX?=
 =?utf-8?B?UERVbWFEZjJ2dnFhSEduWjdISVNvS3U3OXBWQk5UcVBtZitsOGJVdDR3SFlG?=
 =?utf-8?B?cjVtR2Ftc3M1UlZKc2p3cG9sUCtrMEowa2orMlhURjVqVlJ5UXJQTHUzS0c4?=
 =?utf-8?B?dTdobTlmTEFzUEcvNExvZjYvRnV3TlhrYjc5S3h2OStXeDVERHpCTStRQUw2?=
 =?utf-8?B?OW9ueW11YlVtLzhvSFFwWitMNDZ3eW1RQXROb2Z5LzVwSS9GUUJQeUZRd3Zs?=
 =?utf-8?B?aWI1a0lOTHJpVjY2N1N1SkJpa29CUDZDbHpKeVhZNjV3UjFiSk00VUs1czMx?=
 =?utf-8?B?ZmlJSkJ5K3F2dHB2UVFZblhqYlYzWlU3aUdLR1R0NUgrb3NQV3hRR3hUY0Rv?=
 =?utf-8?B?QUlwY0tqRktsRUpxQVlEZDVtRW1QMjhPWk9KbGtOTi9EcWpJYUQ2NDVFZjg5?=
 =?utf-8?B?eXo3Z0tISC92QWRwWUttVS9PSzdkaFBLNlkyOTQycWMwNmEyemxiRk1kd050?=
 =?utf-8?B?WG1mcHNCTTl0ZlZFQlJyWGE4WnBMcndsMXYwQWpGbXM5WlRJVExDNmRkTHo2?=
 =?utf-8?B?MDVvRDgrV3ozWnhTWFUvTjRCc0RWcXBHeWcwdmEzMXBVVVVYdzlKWEM3Q3gx?=
 =?utf-8?B?RHlrNkN3Z2lCdVR6cFBpVHN3K2ZlYTlST3ltaUcxS1VPdnp2WXVVVWgwWFlM?=
 =?utf-8?B?ajN3V0NrRHRGM3MxSG51RTlFM2orWURQM1JGaXhEVU1vcHlRQVN3QyszRjNK?=
 =?utf-8?B?dTBxM0ZxWFErN0JEU3dSSGEwZWp5Y1plN1RXR0grTWpEZ2ZtNXJORWtPZThP?=
 =?utf-8?B?OURsYVBURUwwTDE0MkIxZlp5dUNaRnl6QWVPZXdkWVJZbFFNVkRpYTNZcS9y?=
 =?utf-8?B?Vk5wM3c1SVFLb2p0enVtWGo3VG5YWG9UREF3ZnNJL081aXcvbE52NnZOSGYy?=
 =?utf-8?B?aFdBWkN2cGZCc0pUTkl4Umt5bGxMdVVnZ0NUeTE2T2pSU2xFaDFNdz09?=
X-Exchange-RoutingPolicyChecked: QAhqrFgVds7mRM8YbHdaMc9pw9bJ3g3YtqiiKCMnJ/yRSTlrKP4+oBZJAA/oJ0ZO5/YC7odzQ7K3Qz+kEegt/ZrkjLPa78chRLlOArZ6m3Xh6U7RUxtiPiXw2yzij4dNcWx9F6MkOQ28Yqzk537bxGbQRWABAkkYedBki1OyuJAbyyQ8uUgo/fx4aCVAtB7/SCZ+7SmoxAtooSWgVlxaP3W1hHfkZR3h02pjcyZCdqDwUyydstKXqyv1WTMwRhVwxXDtHnbg9GZktgPuqT+NAJeFL7AUgZ0pRDaVUxp21mROzW0qYDpFyxxDK/p0nUd/PvsifznA20q4/jC8XnxquQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7828c244-5f9d-4710-2ace-08dea09a9390
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 18:11:29.6603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnR0McL1fXCG8Ni3qOfHsu0ycerIXmBmgadPcW5XMjR21GmjXYe2pPNS3UikkJRtmEfEKTSHSpvbfWn69oa1Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7158
X-OriginatorOrg: intel.com

On 4/10/2026 2:55 AM, Maciej Wieczor-Retman wrote:
> diff --git a/tools/testing/selftests/x86/lam.c b/tools/testing/selftests/x86/lam.c
> index 1919fa6daec0..f14600e74d8c 100644
> --- a/tools/testing/selftests/x86/lam.c
> +++ b/tools/testing/selftests/x86/lam.c
> @@ -24,11 +24,15 @@
>  # error This test is 64-bit only
>  #endif
>  
> +#define GENMASK(h, l) (((~0UL) << (l)) & (~0UL >> (__BITS_PER_LONG - 1 - (h))))
> +


Did you run into any problem when including linux/bits.h? It would be
preferable to avoid redefining generic macros. I see the GENMASK defines
in tools/include/linux/bits.h and include/uapi/linux/bits.h.

If you are running into issues with the x86 selftests header includes,
the uapi one should be safe to use.

You probably just need:
#define GENMASK(h, l)		__GENMASK(h, l)


>  /* LAM modes, these definitions were copied from kernel code */
>  #define LAM_NONE                0
> -#define LAM_U57_BITS            6
> +#define LAM_TAG_BITS		4
> +#define LAM_LS_BIT		57
> +#define LAM_MS_BIT		(LAM_LS_BIT + LAM_TAG_BITS - 1) /* 60 */
> +#define LAM_UNTAG_MASK		~GENMASK(LAM_MS_BIT, LAM_LS_BIT)
>  

Same comment as patch 1:
#define LAM_UNTAG_MASK		~GENMASK(60, 57)


> -#define LAM_U57_MASK            (0x3fULL << 57)
>  /* arch prctl for LAM */
>  #define ARCH_GET_UNTAG_MASK     0x4001
>  #define ARCH_ENABLE_TAGGED_ADDR 0x4002
> @@ -51,8 +55,8 @@
>  #define GET_USER_KERNEL         3

The rest of the patch looks fine.

With the above addressed,

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

