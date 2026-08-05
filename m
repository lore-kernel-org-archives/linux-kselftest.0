Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D883CAE9B;
	Wed,  5 Aug 2026 22:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785968332; cv=fail; b=r3AEcbTB1zbpEYniI5DjtnppiUz1MtQ3eSwZcoOT4bBDMGr4eG/HUywvM+y8oTqGPTIDpsYOx7makxQkw4eh4yZeuML3HPC1Ud6K6LWsGhy3mOKaWNPT6Ny8smaxB6W3Sj0VU8CtDDA4xHFk5ryCgmr8rqSmS4jYt/EYSzJccm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785968332; c=relaxed/simple;
	bh=tMBLzhjlGvurwee5HTysWJQC202MkDoD8aV4UwuGGzE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aS98emqD9qsTqAge8xkTddrexmlwVA6bClGcZu9rOiZnNxi6QXiO3URBM9ao3gCtE4FtY9n0G4jKJPCztceRk0XAzTKUwBxYSd+mLIJtmcFG8ougsbxdD/OC4sG2WGT4FLJIIIktP0XSYPMCAAjDBWGAjca5gIoOoq6dew73fJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtrtDkqa; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtrtDkqa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785968330; x=1817504330;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tMBLzhjlGvurwee5HTysWJQC202MkDoD8aV4UwuGGzE=;
  b=OtrtDkqajYztvvcl4Vy64VIICUMf8eDJsbR08BPMzXNuOr/eKrklbhSv
   +iOGjQZtZJ2o7OOU4Cfe7s+MGnX6iAaGDfNlTfkNcSRawIEy0kaOTpNmm
   +39repcb8iz7beC776PALQ62X/wKzWwujys2urWdE8x9bAro5BncU51jZ
   6GzUdZwcmp8qqiyx8Qy5GzJhR9DYxN44nrtORC9yU395doBlBjF28WPZt
   /p2pAZ0a081FuXatCwQPHhFMIy37wYH0KuFgMssDiU//HAwRGB8lBLant
   3NZE6O6QY412jHF7BLR+LgjrWn8A51u0ZuQALzF1Vd4Fk3yNpirS2hdrU
   Q==;
X-CSE-ConnectionGUID: sMyrJB7oR6iTcqNgeRq6kg==
X-CSE-MsgGUID: LxRZSHaZRXymUoqZFmw+jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="112108361"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="112108361"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 15:18:49 -0700
X-CSE-ConnectionGUID: DvnZRwmITNaKbAfrzr/+aQ==
X-CSE-MsgGUID: kZnnvlZgSw6ZjQw+rXfowg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="261987938"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 15:18:49 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 15:18:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 15:18:48 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 15:18:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyZ2g1QvBGrlc8I+am5dZ+0IstHQxsWNORcB4SlkcQN6NBnJRLkWm4RZ+tbq90dZs2n6cyot/s0guol18sSH3QpjsdY8iRmJmSlVwdDu5n+wpCd15+Dl6DvM6YExuVKgRZRO+LEnTpsmq6LGoxjWP0GY6+P2xMj2KwnLW3ypzRT4Z28cl60ZboSz1/D9+p0QrR4bvreH0Gi/42zA9Npds9U7Q5xeFbkN2JTLakMCKbfe8NRwz7saPAVovrBYvbtizuhKoV7sSz04zv06LUfAZF6NTep82eeEAfdCD5cuZn10phJkQS4tTPORRC9qi/8ZZ80EMqyLxHIfUICzi3DZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwBdSMuJRdFvVx21BGuPTwok0FWCXeD/krvsAGUqIdM=;
 b=c09IY9eC6ovOYuduck1Kiq+6IT4u66scH26aCmdkNgpXDnWBz2bNHW4yMQfw5AzxX2bSK9Ss5oZiegNH4B90CxRwhfJ5RF34+rnuq35w79+HYMa18Hi6oF85bq3upX4oBRVryOKGFag5jjE4joQYlGY+rPlluGr0FToRu9EAEOUhcdY652NAF+AmvOuL4ouFS+hTxHZsWMQGKnYfuROjqJZdHpV4ND7sXXeoQu6NMb96giEwLeYNnZZKf7Gq9ow3VuoX1QoYdYyBzFBn/E6M19ZziTWMlvQ44ViIXnJ/7+xmiGLhUEkIMnJU9y26BptMgwy2rXUDv292NPQhznzudw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by SJ5PPFC15A51B16.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::851) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 22:18:45 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 22:18:44 +0000
Message-ID: <5836583e-baa8-454b-903f-d7364a346165@intel.com>
Date: Wed, 5 Aug 2026 15:18:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] selftests/resctrl: Add L3_CAT_OCCUP test to verify
 CAT bounds occupancy
To: Richard Cheng <icheng@nvidia.com>, <tony.luck@intel.co>,
	<shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<fenghuay@nvidia.com>, <newtonl@nvidia.com>, <kristinc@nvidia.com>,
	<kaihengf@nvidia.com>, <kobak@nvidia.com>, <sdonthineni@nvidia.com>
References: <20260608110641.44457-1-icheng@nvidia.com>
 <20260608110641.44457-2-icheng@nvidia.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260608110641.44457-2-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::9) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|SJ5PPFC15A51B16:EE_
X-MS-Office365-Filtering-Correlation-Id: 792f7df9-b7c2-460a-dbb9-08def33f830e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|18002099003|22082099003|11063799006|4143699003|3023799007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: VoH1xtVdMW4Nc0jclJJqeXxonTT6XJ7SJb5AAPJA2IczFp8tRZzF00jPCg6H7ylt+A2m8eG+CMusV2krLyIn/BmlESWoJdww5aJIzstcyWHe02kITtHG3oTsiezzX2ATcSiIEp8IbaeSyB3T5TZl6GZC8PKfZdPF5dc3OkQbFvq3YN1vmYad/jxPgrqxgX+LjkDG9Xmtgs993iR+IJcuUvyOPmeSqSJ39tElfdKWdmcuap9AuJlaT6ovMnh/0h/b6Q+mVyDKigBnbnbPQZg71NXfQqbtBpz2faffE/dUoqO5PE+w3dOVB2rJYjCDC6qM7lcAsBrQL3yq0BSQafexFXcMGf8KK+0zHycFmYRRdSAMMO9xofTuRcipkyCsC0NJAmsc/Yp8dw49CesYqfwcxtMd67x4aRq9LHAj2NMNLmwxeAlSxgtVNjzocFV3Bs3phibxTlGGahnzyGV3fpFO2IfR0pdvOahwcG5RkxnIvg3OUiDxYWjBsjth0zyblPD1kwLgVDHuipSZgJLzxktZ/Ea1ltKdmrweR8cy5DK/ev/qYylovDPE8dyH8jbL986MeU7KrzbgBly+Nse0bKTQJakhwsqSmbVro0UmKqR9x+UbgEgdSdTKkU5XsliHRzdyrcrFBRrLZUg4sceOmIfyKJDN7tQqyYdUYsWW2In12gA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(3023799007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWROdVpObEpWbkVQS3h0azUyWklESDRxeU42UmNtNEJkS0RmcTYvMW4vRlZL?=
 =?utf-8?B?V1JPMlUwOXgrODN3M1ZBU0tldmhXQTFEVGJQRTZFY28rYjNRNnZDUnJDUFA4?=
 =?utf-8?B?ditOZktuY1hNazdWQ0dITjM1MlpCVnI0ZnU2aytrdnNDbFFQNVMzeDhnT3JH?=
 =?utf-8?B?WWVYejhFKy92Z2N5RXR4RVhPOTlOd3g1VTNjRlMrV01zdENud254b2NpRk5o?=
 =?utf-8?B?cUFBdk5RbktJeGJKU3FvUHFRSjl4eXRXN25Kdmt0RlpKY1Q5ZmIrdzBNYmdB?=
 =?utf-8?B?cXcxN0poUzB0dWtjdWYyTXpwZ0d3SDFGQ21qWlk5NzUxWTV1UDRsckVtVlpP?=
 =?utf-8?B?STZUbk8wMGZHcTBCdURaQkJTYkhmR1BkbWlHbm9DR0Fwd2htZW8vZUJUcGls?=
 =?utf-8?B?MnFxRGVRWXlncVRKc3lTcWJ3R2lMWVVoZ2toeXVCY2dBalRBQUJXSVZOMkxC?=
 =?utf-8?B?c1E1cmZaWnNRNU1LK2U3TlVXTzg5WFV1VU5MZnlaanFFdDlLVlhSQmVTSDlX?=
 =?utf-8?B?ajg1Ymw1QnIxdU4zRGRxZ2x6N3pnQXI1a0hObFNCNkZQeldadzNJL3c1SzRR?=
 =?utf-8?B?bU05QXNYdGtoM1dibTA3aHl1MWhVZkdUWjBQajkvT0FEZDRoYVNrZGZ0QXN3?=
 =?utf-8?B?NzlDTG83amx3WVpPRmtDZ3RyUENzajM2ZG5iMUFzQnQrSXRlZ0JKNkhtdi9B?=
 =?utf-8?B?OXYxbGxaajNnTXl5SGI0QUttOXpGbFc1Tkk5Uktrc0J2YzJzMkprWmt5RWtp?=
 =?utf-8?B?aFlyUDFoQjFrK1FlazFWM3o5MUxCQy9TYmM0SzBFV240MlJPa0djVVJ6a3ZH?=
 =?utf-8?B?Q0ptTTVySEY3Q2NIcU41MTdTWXB1WUF2NFZta1YxTkl0SmZqZFRpb2RJYnNK?=
 =?utf-8?B?dXFnN0ZrNHVnc0tFTHZyVWJyWmJpUXJFcUxsUDFuNngzTytRWCtzU0VOSnJ3?=
 =?utf-8?B?M0xmeURnU1F5dkpQSFdxWkszaXFKZUZvcUpmVGxoaDR0RENEK0cxWnA2c2N3?=
 =?utf-8?B?Q1FrbnRYR3QxVlVEU2ZnK1VVZEVJWGQ1Tk9rT1NJOFNPSU12Z212MEQwM01Q?=
 =?utf-8?B?WGYwWk0rekhGSFo3eVBDcHhWZEFGWWYwT2xrejhyd2t4c29YMXZRZzlxL1Er?=
 =?utf-8?B?R2RCNUVYc3U4L0hLZVRVb3B0Zi8xN0ROeFdkRUpFWk1YS1JRVGR0TkROd2NT?=
 =?utf-8?B?MTdYbWpLR29Ucm9ScFh6dnJnZE5BR2RTd2k3UnpBTVkrd0VSTXVFZ3JGdkJV?=
 =?utf-8?B?UWZKVVZ0SCtack16amhnSXAwNi9JL1BxL01BVUVXNGNrMlZDclFsaFNEZFN2?=
 =?utf-8?B?WjNQRkhrdW5UajNnalkveEtwZ0kwcld5VjZXbWtzTmVTTnZ1ZnpUaU52K01V?=
 =?utf-8?B?cnd5aGNiWE85eWUvaU8vbExQYmg2REU5Z3U2WVdXbFBDY1EvSnp4azlzU1F4?=
 =?utf-8?B?L2s0dE5NcFdBZ0h5dDhIMmZzQ21MQ2hlZDNFRVZyRGs2M1NKV1J0QkcxYnhw?=
 =?utf-8?B?SEZKNW15dmY5dytIZmlVYzlnc2diV1h3aWJDR2dIVzNGZ2M2WXlTelAwMkRy?=
 =?utf-8?B?dHAxM1ZUdVJhdUpqMTNRMWt6N0pjRkYyV2RFbm5UZVRpUmdYN2lWTytoa3dL?=
 =?utf-8?B?cmEzTXFyUnAzZXZLaHRhWjI2YUNQeHZmL3Budk81eXRqWStNdTUzTW0waWZp?=
 =?utf-8?B?MGhZNGFMZ1FKa3ZDUTYya25OUnhmL3grU2hyaEZ1dml2OU93dTVkZkU3d2ty?=
 =?utf-8?B?cURmanhEVHp6TVlDMy80cFk1cjVVZUFVbHdvS0czOEF3L21FczVraTFxVDg5?=
 =?utf-8?B?ajNJV1E5dnpHZUdESFRUaVB4Vy9BNFFQQzVhTjFCd25vTjd3UktaM2JrQ0Nj?=
 =?utf-8?B?cG9nYmwvWGhXZU1zOVJJcmJ5VmVIalhwM3QzdGdaSjRzamdSZ2c4UmtBV2o4?=
 =?utf-8?B?aS9UNEYzQU1YVjVsMWUxWFc5akd3UkZ0MkFkWFhZT0lRZUpXSVR4RVlBYlFB?=
 =?utf-8?B?bzdwR2pJVGROakt2Z2VPZGtXZE1WcXJBd3BYYXZMazFmRnpzeUhSNlVtOHM5?=
 =?utf-8?B?bDgxaWVrNVJ3a2J1WmNHSERjbmI2d0VwNUtWR3pZUTZOOWRFWWlvZGVDSmpx?=
 =?utf-8?B?QkYxajBQOGF5L3g1S0dRYS9rY1VsUm03ekZGM2E5UmZuUXd0a01nUzZNUlY2?=
 =?utf-8?B?ZkorTG5tWUZOemJsMjdjUVRncFlBbVpGTkwrbGs5d0dlOFVjVTlEMHN4SDVq?=
 =?utf-8?B?UFNicGlKRzluaHZOUnNGL1hEQk5uMHdpRmV0OXI5eGNTNEVydldWeGpDbkE3?=
 =?utf-8?B?Nkk4Z1FvSFhnYVQ4ZEY4MWl1Z2JqdlV6eUg0ZDZhR1hkejdYNk0zbmpoVEZZ?=
 =?utf-8?Q?0wDdIYmMdpIY+K/w=3D?=
X-Exchange-RoutingPolicyChecked: nHfmy0rVQ7Erapay7KzxMXz1QGLQGZ8k82VrxtDMd/F47YgUQ+u3m01BWF/iDTwIcovGh2H2U1JNObqZEAbW6kufE/k38hCoQjXAHhopwoLJAsNLELwXf2A+n+V9K5rj6beI92UMTdhvdxpy7UJ5HDo4nTjHwHe5qDV6xYh7VajJdSHS+JDMFq6z4flbCUjYjKHV4r24PjlDFTs2HBzJLAqnzOaXlFMaXrBUd5TKBgm+DHWzV/jhYNkljlH8uu8IUEqZgDWiwfB799LLBXqi3i7usRYFzyE+WXSlrfFt6VFZlnKmNBir40ORJ3/ZInh5NO215ei0lP93TCfbMxmp2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 792f7df9-b7c2-460a-dbb9-08def33f830e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 22:18:44.2463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofWppUVoehhUnvzo04U86SRe7zSrdcUxzBQo1wboqGff9XOwLiwl78PC4EDBIrSTbYWsL4wrVSngdYvhjDo24Xctp9hE72ySHrI44ZQnsvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC15A51B16
X-OriginatorOrg: intel.com

Hi Richard,

On 6/8/26 4:06 AM, Richard Cheng wrote:
> L3_CAT needs a CPU-exclusive cache portion, so it's skipped when MPAM
> reports every CBM bit as shareable, leaving L3 allocation untested. CMT
> only checks occupancy accuracy, not that a CBM actually limits it.

hmmm ... CMT test ensures that the LLC occupancy is within a % of the size
of the cache allocation. To me this implies that it indeed tests that
the CBM limits the allocation, no?

> 
> L3_CAT_OCCUP gives a group a small CBM, run a workload spanning the
> whole cache, and check every occupancy sample stays within the
> allocation. An unenforced CBM would instead let occupancy grow to the
> full cache.
> 
> Move CON_MON_LCC_OCCUP_PATH to resctrl.h to share it with CMT.
> 
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
>  tools/testing/selftests/resctrl/cat_test.c    | 201 ++++++++++++++++++
>  tools/testing/selftests/resctrl/cmt_test.c    |   3 -
>  tools/testing/selftests/resctrl/resctrl.h     |   4 +
>  .../testing/selftests/resctrl/resctrl_tests.c |   1 +
>  4 files changed, 206 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index f00b622c1460..16a947f1ed16 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -402,3 +402,204 @@ struct resctrl_test l2_noncont_cat_test = {
>  	.feature_check = noncont_cat_feature_check,
>  	.run_test = noncont_cat_run_test,
>  };
> +
> +/*
> + * L3_CAT_OCCUP - Verify that a CAT allocation bounds cache occupancy.
> + *
> + * Unlike L3_CAT (which measures interference between groups and needs an
> + * exclusive cache portion), this test gives a control group a strict subset

Please let comment just refer to what this test does. These comments are unlikely
to be updated if L3_CAT ever changes.

> + * of the CBM, then runs a benchmark whose buffer spans the *whole* cache -
> + * i.e. much larger than the allocation. With CAT enforced, the group can
> + * only keep its allocated portion resident, so llc_occupancy settles near
> + * the allocation size. Without enforcement occupancy would instead climb
> + * towards the full cache. This works even when all CBM bits are shareable
> + * (where L3_CAT is skipped).

hmmm ... these statements state as fact what really depends on system load and
interference that this test make no attempt to avoid.

> + */
> +#define CAT_OCCUP_RESULT_FILE		"result_cat_occup"
> +#define CAT_OCCUP_NUM_OF_RUNS		5
> +
> +static int cat_occup_cpu;
> +
> +static int cat_occup_init(const struct resctrl_val_param *param, int domain_id)

Please take a look at recent resctrl selftest changes that provides more
data to the init() that will avoid the cat_occup_cpu global.
Even so, why not just use cmt_init() that reduces interference from rest of
system to improve chances of workload's cache occupancy to match its
cache allocation?

> +{
> +	char schemata[64];
> +
> +	sprintf(llc_occup_path, CON_MON_LCC_OCCUP_PATH, RESCTRL_PATH,
> +		param->ctrlgrp, domain_id);
> +
> +	/*
> +	 * Confine the benchmark to the allocated portion *before* it starts
> +	 * filling (resctrl_val() calls init() before forking the benchmark),
> +	 * so occupancy reflects the restricted CBM from the first sample.
> +	 */
> +	snprintf(schemata, sizeof(schemata), "%lx", param->mask);
> +
> +	return write_schemata(param->ctrlgrp, schemata, cat_occup_cpu, "L3");
> +}
> +
> +static int cat_occup_setup(const struct resctrl_test *test,
> +			   const struct user_params *uparams,
> +			   struct resctrl_val_param *p)
> +{
> +	if (p->num_of_runs >= CAT_OCCUP_NUM_OF_RUNS)
> +		return END_OF_TESTS;
> +
> +	p->num_of_runs++;
> +
> +	return 0;
> +}

cmt_setup()?

> +
> +static int cat_occup_measure(const struct user_params *uparams,
> +			     struct resctrl_val_param *param, pid_t bm_pid)
> +{
> +	sleep(1);
> +	return measure_llc_resctrl(param->filename, bm_pid);
> +}


cmt_measure()?

This test has a lot in common with the existing CMT test since it 
duplicates cmt_setup(), cmt_measure(), and cmt_feature_check(). From what I 
can tell it can use cmt_init() also. Could the implementation be simplified
by instead considering it a CMT test, move code to cmt_test.c, and avoid
all this duplication?

> +
> +static int cat_occup_check_results(struct resctrl_val_param *param,
> +				   size_t alloc_span, size_t cache_size,
> +				   int no_of_bits)
> +{
> +	char *token_array[8], temp[512];
> +	unsigned long occu, max_occu = 0, ceiling, floor;

Please follow kernel coding style (throughout this series) by, in this example,
using reverse-fir tree ordering.

> +	int runs = 0;
> +	int fail = 0;
> +	FILE *fp;
> +
> +	/*
> +	 * Check every sample, not an average: CAT is a hard limit, so a single

hmmm ... "is a hard limit" does not match what the code does

> +	 * sample above the allocation is a real violation that an average
> +	 * could mask.
> +	 */
> +	ceiling = alloc_span + (cache_size - alloc_span) / 2;
> +	floor = alloc_span / 2;
> +
> +	ksft_print_msg("Checking for pass/fail\n");
> +	fp = fopen(param->filename, "r");
> +	if (!fp) {
> +		ksft_perror("Error in opening file");
> +
> +		return -1;
> +	}
> +
> +	while (fgets(temp, sizeof(temp), fp)) {
> +		char *token = strtok(temp, ":\t");
> +		int fields = 0;
> +
> +		while (token) {
> +			token_array[fields++] = token;
> +			token = strtok(NULL, ":\t");
> +		}
> +
> +		/* Field 3 is the resctrl-reported llc_occupancy value. */
> +		occu = strtoul(token_array[3], NULL, 0);
> +		runs++;
> +
> +		if (occu > max_occu)
> +			max_occu = occu;
> +
> +		if (occu > ceiling) {
> +			ksft_print_msg("Fail: run %d occupancy %lu exceeds ceiling %lu\n",
> +				       runs, occu, ceiling);
> +			fail = 1;

KSFT_FAIL is available to avoid using magic numbers.

> +		}
> +	}
> +	fclose(fp);
> +
> +	if (!runs) {
> +		ksft_print_msg("No occupancy samples collected\n");
> +		return -1;
> +	}
> +
> +	if (max_occu < floor) {
> +		ksft_print_msg("Fail: peak occupancy %lu never reached floor %lu\n",
> +			       max_occu, floor);

I think this test should be dropped. We cannot control the environments in which
the tests are run and legitimate interference may cause this test to fail without
it meaning that there is a bug in resctrl. 


> +		fail = 1;
> +	}
> +
> +	ksft_print_msg("%s CAT confines occupancy to the allocated %d-bit portion\n",
> +		       fail ? "Fail:" : "Pass:", no_of_bits);
> +	ksft_print_msg("occupancy=%lu alloc=%zu full=%zu ceiling=%lu floor=%lu\n",
> +		       max_occu, alloc_span, cache_size, ceiling, floor);
> +
> +	return fail;
> +}
> +
> +static void cat_occup_test_cleanup(void)
> +{
> +	remove(CAT_OCCUP_RESULT_FILE);
> +}
> +
> +static int cat_occup_run_test(const struct resctrl_test *test,
> +			      const struct user_params *uparams)
> +{
> +	struct fill_buf_param fill_buf = {};
> +	unsigned long cache_total_size = 0;
> +	unsigned long full_mask;
> +	int count_of_bits;
> +	size_t alloc_span;
> +	int n, ret;
> +
> +	ret = get_full_cbm(test->resource, &full_mask);
> +	if (ret)
> +		return ret;
> +
> +	ret = get_cache_size(uparams->cpu, test->resource, &cache_total_size);
> +	if (ret)
> +		return ret;
> +	ksft_print_msg("Cache size :%lu\n", cache_total_size);
> +
> +	count_of_bits = count_bits(full_mask);
> +
> +	/*
> +	 * Allocate a strict subset of the cache so the benchmark buffer
> +	 * is larger than the allocation and CAT has something to enforce.
> +	 */
> +	n = uparams->bits ? : count_of_bits / 2;
> +	if (n < 1 || n >= count_of_bits) {
> +		ksft_print_msg("Invalid number of CBM bits %d, expected 1 to %d\n",
> +			       n, count_of_bits - 1);
> +		return -1;
> +	}
> +
> +	struct resctrl_val_param param = {
> +		.ctrlgrp	= "c1",
> +		.filename	= CAT_OCCUP_RESULT_FILE,
> +		.mask		= ~(full_mask << n) & full_mask,
> +		.num_of_runs	= 0,
> +		.init		= cat_occup_init,
> +		.setup		= cat_occup_setup,
> +		.measure	= cat_occup_measure,
> +	};
> +
> +	alloc_span = cache_portion_size(cache_total_size, param.mask, full_mask);
> +
> +	/* Benchmark buffer spans the full cache: larger than the allocation. */
> +	fill_buf.buf_size = cache_total_size;
> +	fill_buf.memflush = uparams->fill_buf ? uparams->fill_buf->memflush : true;
> +	param.fill_buf = &fill_buf;

This prevents usage of user provided benchmark. Please compare with cmt_run_test()
initialization. You can find more details about how the workload and parameters are
communicated in e958c21e2ede ("selftests/resctrl: Make benchmark parameter passing robust")

> +	cat_occup_cpu = uparams->cpu;
> +
> +	remove(param.filename);
> +
> +	ret = resctrl_val(test, uparams, &param);
> +	if (ret)
> +		return ret;
> +
> +	return cat_occup_check_results(&param, alloc_span, cache_total_size, n);
> +}

Fundamentally this looks like a duplicate of cmt_run_test()? Only differences I see
is the size of the buffer and how the test results are checked for pass/fail. Looking
at the pass/fail I do not see a big difference with what the CMT test tests. I do not
see what value this tests add beyond what the CMT test already provides.


> +
> +static bool cat_occup_feature_check(const struct resctrl_test *test)
> +{
> +	return test_resource_feature_check(test) &&
> +	       resctrl_mon_feature_exists("L3_MON", "llc_occupancy");
> +}
> +
> +struct resctrl_test l3_cat_occup_test = {
> +	.name = "L3_CAT_OCCUP",
> +	.group = "CAT",
> +	.resource = "L3",
> +	.feature_check = cat_occup_feature_check,
> +	.run_test = cat_occup_run_test,
> +	.cleanup = cat_occup_test_cleanup,
> +};
> diff --git a/tools/testing/selftests/resctrl/cmt_test.c b/tools/testing/selftests/resctrl/cmt_test.c
> index d09e693dc739..ef51daa8061a 100644
> --- a/tools/testing/selftests/resctrl/cmt_test.c
> +++ b/tools/testing/selftests/resctrl/cmt_test.c
> @@ -16,9 +16,6 @@
>  #define MAX_DIFF		2000000
>  #define MAX_DIFF_PERCENT	15
>  
> -#define CON_MON_LCC_OCCUP_PATH		\
> -	"%s/%s/mon_data/mon_L3_%02d/llc_occupancy"
> -
>  static int cmt_init(const struct resctrl_val_param *param, int domain_id)
>  {
>  	sprintf(llc_occup_path, CON_MON_LCC_OCCUP_PATH, RESCTRL_PATH,
> diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
> index afe635b6e48d..ce3abf0bdac2 100644
> --- a/tools/testing/selftests/resctrl/resctrl.h
> +++ b/tools/testing/selftests/resctrl/resctrl.h
> @@ -31,6 +31,9 @@
>  #define PHYS_ID_PATH		"/sys/devices/system/cpu/cpu"
>  #define INFO_PATH		"/sys/fs/resctrl/info"
>  
> +#define CON_MON_LCC_OCCUP_PATH		\
> +	"%s/%s/mon_data/mon_L3_%02d/llc_occupancy"
> +
>  /*
>   * CPU vendor IDs
>   *
> @@ -244,6 +247,7 @@ extern struct resctrl_test mbm_test;
>  extern struct resctrl_test mba_test;
>  extern struct resctrl_test cmt_test;
>  extern struct resctrl_test l3_cat_test;
> +extern struct resctrl_test l3_cat_occup_test;
>  extern struct resctrl_test l3_noncont_cat_test;
>  extern struct resctrl_test l2_noncont_cat_test;
>  
> diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
> index dbcd5eea9fbc..324a60818aa1 100644
> --- a/tools/testing/selftests/resctrl/resctrl_tests.c
> +++ b/tools/testing/selftests/resctrl/resctrl_tests.c
> @@ -19,6 +19,7 @@ static struct resctrl_test *resctrl_tests[] = {
>  	&mba_test,
>  	&cmt_test,
>  	&l3_cat_test,
> +	&l3_cat_occup_test,
>  	&l3_noncont_cat_test,
>  	&l2_noncont_cat_test,
>  };

Reinette
