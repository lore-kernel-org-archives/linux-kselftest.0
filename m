Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54467352008;
	Fri, 21 Aug 2026 21:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787347403; cv=fail; b=OjV+/j6KQWBMaz3n1Z0yZduKZ1yxAxOWEnkzfBWrsVVVpEWy3juU+ZNt6m9HynOtFYj7bmw4YW0G2Fm7drqo4jNDVqWVajiEVtWhfsrNB8rlmLOvWLqaNPc0zhYPxsYGE5FlxlKxpbbvkhHG+/JOO/QJ9kRpqIKZTqJFIAF4lUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787347403; c=relaxed/simple;
	bh=YbLd6opDL46fXRrEBLe7JOvWId/N9PaRCSZwmpIj6cQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ClBKDcHFSamOh3+a/RqPjcTCJ6m3BSfw4ACn48ZSyX+tEUd0+zJxKMxw87eruRzVWaF7QriOfBmOrWHJF19SoXph6XeW7wMK6Ag5nskISFXEuksHvzEQjnYd9Ve4UXQ+G2r7NPKUr/xpqxMCSyOpen6tFQAs0bkrXFWRm3voR8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lumU3Grw; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lumU3Grw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787347401; x=1818883401;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YbLd6opDL46fXRrEBLe7JOvWId/N9PaRCSZwmpIj6cQ=;
  b=lumU3GrwuUjEoCXh4CSI56TeMcG2055LW3L2DEV4Eu3BK4dBdUbocFPJ
   ZsNqyO3p1WClx7TIziMVaZMxfCm6U4iGfGBzan919b0NU1gKFS/pPM+2t
   T3MgKGFKIttb+UuRie6+HiwpjsFZXdoG7XKJx8MfzXIwdvZh7jjnR45OR
   ukbLK0rdkIrYvDUlwUWwFPSsKDkYlPd4lidLa3ZTTLzveZqm9z8A3Ftzb
   iou6lhlSh5OS9V2Ud2eDYF00ZE79IlkJ9eDvpA9oruUqkmJrPqqyzx4mn
   TBunwbCmn4Uc6MygtU0hdPd3PFpIpQE4voe4awCH/Yav/mxBiwpRvJM6T
   A==;
X-CSE-ConnectionGUID: j6uAP36kT4i1f5v5qSJtSA==
X-CSE-MsgGUID: z/C1MIDVRjqsrWJPiz+2PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87019625"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87019625"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 14:23:20 -0700
X-CSE-ConnectionGUID: 6pYbNrwsTcSXBbz/pVBhlA==
X-CSE-MsgGUID: TzT9YJgdT/2YnYGigC8D2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="265156339"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 14:23:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 14:23:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 14:23:19 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 14:23:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvl6wBAWwVoVb90oPsD7idvMJ0uMnmoPRLA0IujsaSpB9XfeCzMQSqlbuGWJtkSlqdjvFTUl3eAJJwJpcTiP3qICH+vEcdlMs4VM87gULMjJCPNEsY+t6X0L0qEfW39diMj2X2glZ9JRGR/FeM/G5k+lJbqF0OHN1B4qvSfHsekN00uzGGKNhfXg8Dyf9BvefWim2yS8S8yTFpemPuBDjOqn7GA1MiahkWfSLREbSgIzHcByPZBJEAWBu4Q40g9gvKuW4G7dhSwf4XbAmvapGIlhiW//F3ktqch6W3Iulo28PX1FoWgLQNdXFOAoVjmECUg6Asp8vzNfkiviH72F+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PngAkD1lkscMQqrLYtVoca6NvuYReDTgc+Br/FKnNjY=;
 b=PzBoIxw6NWF53lM80ZM/fY3V47mOL5rbhVtrXDTkJY3aheZOUmWJ/X8HjHA28qkLzTFfmFa+JwZpaBgRB1Zu0NtE7IIt/eRsvuikSmr5CAHvs79XNJrWl5Svz2ie1MQRlg4rdLO0guWGrGGoesOZVEr30Gnyw3meLQFtpcI4P5qMyO9326hlHEAe4sBGfQ/gUVlU1DNjDhlpCp1lw/kCIKMQgZJ7WOa7U2xtqduhYlh57Aett1dQ9OKGuQja2/4rc+t6IvrnPneaiEq5hpCerqL1uZy13tTZBhb2gEY1G9Up/dNKavxhhaYm9jFC5SO5vPTrKe5Mzm9lPjrBG3qwaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA2PR11MB5147.namprd11.prod.outlook.com (2603:10b6:806:118::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 21:23:13 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 21:23:13 +0000
Message-ID: <0f77e477-936a-4208-b752-6b07b0feca08@intel.com>
Date: Fri, 21 Aug 2026 14:23:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] selftests/resctrl: Skip L3_CAT when no exclusive cache
 portion exists
To: Richard Cheng <icheng@nvidia.com>, <tony.luck@intel.com>,
	<x86@kernel.org>, <fenghuay@nvidia.com>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <newtonl@nvidia.com>,
	<kristinc@nvidia.com>, <kobak@nvidia.com>, <kaihengf@nvidia.com>,
	<ltrager@nvidia.com>, <yu.c.chen@intel.com>, <ilpo.jarvinen@linux.intel.com>
References: <20260821003908.12977-1-icheng@nvidia.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260821003908.12977-1-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::34) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA2PR11MB5147:EE_
X-MS-Office365-Filtering-Correlation-Id: b90ee340-5fa2-4381-fb9e-08deffca6863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 5pPxeKEGcvf8q7l8Sts/ULX+R/m1wqba375gd/UCH1V+S0/oOIbDB1Npki9AZusvPxmu4Iuny3SPkKSr6OKDDhrLOigOEc6kcJzq5ZyPDRyOLsMl7LXzwDWuOybotnlq/LjFZK59n3w8f/16WDl6+fTaZoOqCLUGB3zxT58JkpN4BjzAijFE0jL4RRrbwnNB2w6NuzazhrqJGJUBcAJFfuhQ9b1Ey97UGYw/P68wBzD+nzVqt3qw3px5Nkr3aQzaz2obEcvrHUVIJrPnvJAp64ijf2i06OHfY4/ZcSxMERrAgV7pUuF381EX/zxrz4iMwQNRQW2q3u8PJwfzhjAVOpem1p03RZ+AvI8gcN9w+/bvUA4u7BmBsTETY6AE+7tpQ7ldtX3rlTShB05/b3b3jeLCCbI9vAACrkyQR/4xyNZGXlXsix9ZcvLnrLi41FnhkaQs+0yZG7tyXHpbz41Vk36Hp8JZC1HZBvWSb//G/7r30jeFq+7u2kIFEK5ytWOjB9Y6+dDW8vPwXnN69I8YmjaDQfFlW7EBhpO0VkoccHiaXgJ99eLkwH0TQfgZ9Xx6hbWiTUEsQXHcG/LHD3pUbiRAmY8V6dRgnZMNMqRHYbvrcU9oGUk90dsVK+5uzkt36xR/oV6rR5LQc9o0L382AQAerxaT70SFhc3KNn/JEB4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THNmMzhDWThYaHN1T2JsaDc1YzlDV3hBMGlDdW9wVStYM055Zko1VUgxSXpZ?=
 =?utf-8?B?eVVPS3VUbzcwcGp5N1AvbzVCR1pXeHVRUzl4NmVNT1pFUVlPb3RnanVMSFox?=
 =?utf-8?B?enRJbSt4NTV2NENucXRKdFFhVU1hbFJ5VEZ0dTg0WkZ3Zm5qZStGdWRVVGRu?=
 =?utf-8?B?bXFFWnNYT1dxMW92Qnc2eUxsT2dRTm9FU2dFYnIwekxMTzF3WUgvQ0k3NXNv?=
 =?utf-8?B?NkZSaExyUXNPUmNCS0pIMTRpMXhXVTlXRytnTThqOTF2RzlpUFRueUUxcnFx?=
 =?utf-8?B?ZjlDNW9FdG1hSUU1WU9ENEF6b09vS1dhK2RHbFA3UmRHRDQ2aDVhTmVlZURF?=
 =?utf-8?B?K2RzYkQ1TzEvSTJ4WFJnOHNtZFJaODFqNFRXKzBwTmdWeFViQ3RqU3Y0YTJQ?=
 =?utf-8?B?UkNsZTdrUlFEcDJJVExxbU1Vd2N5eGlFbGVnc3p5eWttYVlTNGhuc1ZrUE9o?=
 =?utf-8?B?Rm1jNkp3UFB4YkxoaTV6OUhrVGZZYzJ3dkI2ajdOUHFqTkx6MmlGeFNKNXhP?=
 =?utf-8?B?ZWlMNStVaklaQk5kYWUvazIxTmlBTVE2NzE5TTZCYzc0WEZUZFRhajEzcUVs?=
 =?utf-8?B?UGdWaTFWOXB0WjhhMFpTUlZPOEQxcitrTlRycGdsa25GQ1U0RXYweG1FWWY1?=
 =?utf-8?B?dmVCM05haTVSS0h5UDVRZUM3M2ppRG5qNTdjOWFkQUIvclE3TTNMcEtxZkpK?=
 =?utf-8?B?Yit2UVZNTUh5VDh0dktzNE5JK1htMWhEMDdvUmlWK3IrL05YcDc2S3d0Tk9G?=
 =?utf-8?B?ZS9XMnp5K2lEK24rR2FMM2Z6QjQ2bk9vWWlZeXZyY2U3Y0grQW5acHhZN1lk?=
 =?utf-8?B?SUtKYUVmNlUwVWZJclpUZ040bzVLS1QxTG13Y3JwWGlQVldOdUplM2ZSWXNn?=
 =?utf-8?B?VXc2U3IzdTNibk85TFNNaThPUkc2bFJ3b2phMERGTW9xakVQL1NQSTFGZ1VG?=
 =?utf-8?B?NHBoOEc1aVFxeGcyN3AvTVBoaDd4UWtraGgySTJ4a1d4MGpaa29XUHZVZlM0?=
 =?utf-8?B?dXpJc0QrWUFFeEIwVFZteFF2bnhaSjdHbEh1RHJObzlBNlBLK0tlM2Q0SG1L?=
 =?utf-8?B?Wk13bm9Ic0FnNS9lQVhDWVovYk5WV0VJdmFuTldPME1aOWcxN1dRTzBMa3NH?=
 =?utf-8?B?N2VyeVJ5amt6UDVBeFhkaGdLSGlsYVk1enVXejBQL2d6MGVvMDVKS2VGdlFO?=
 =?utf-8?B?MWZkNFFxcEo2eTYwQmpmZ1BQaGtPMjdkdTFnakxacWtxM1I4cDJIQmc2aThp?=
 =?utf-8?B?eU9KeTZsWUEyK0F6UlI0UHZkb0RueHJ4ZUx4WUg1NHcrcENhQzdoVkd4Qk8x?=
 =?utf-8?B?T3B4c0lZcXgyZER4c1lqSGJ2RnJTUVZiUzNGSE9IWDI4YzcwRE5EcExhY0pv?=
 =?utf-8?B?cjY5ZlZXS0RVdW9aamorNHdPajZqNmx0MjcvTGNJeExwTmZQT1VuNk5FRm1h?=
 =?utf-8?B?YzJqci8rQ1BVOEhMU3FrcUw5RlhvK2l1TXZTaTJ0bHNLNEFmeHR2amsxVFNV?=
 =?utf-8?B?RTBjdlhxamduK2dkakV5YnRQOWV6SXoyQ2N6cUQ4eFNMaHY4cTE4YU5vSDFB?=
 =?utf-8?B?UXh1SUNLVXZGM2lHdWpoUHRHN1NVWEdMVHlycmxBelpvaE5LRkkvWE1vSks2?=
 =?utf-8?B?TURybnlQa1VRTkN2MXQxKytnS2IvTGpRYVVHVjZ0N080dUdvZDgzVUpiVlZH?=
 =?utf-8?B?V25WYXVlRElTdnRjUXVEWUIyRnZ5bElObUlzL1Y3TUlraW51US90K3VkNWZh?=
 =?utf-8?B?QjNnazQ3MVBNcGYrd2Mzb2swcW9uYXUxaXFpS3ZCNVd4YnJnUVgwTHlnKzN4?=
 =?utf-8?B?UWJ1R3NZNzArd0gyMmR3UkRvY0lLVmNiSzJIeStiaktEcUNHU25zdmVTdUxi?=
 =?utf-8?B?QS84V1oxWlgvdVRRWU9SNmlQajhuRUtQRUhXYXBNUmV6Ynptc3VRTVpHZnRh?=
 =?utf-8?B?L0tGVm5LWll4R2FDQndYOVJRSlQvZml0bUxKdlpHS0t2Sm8rYmE5WStGVTBR?=
 =?utf-8?B?aFpjbzRoaE1WaUxoODJMNFJ6ZUJDL0Q2b2hrMHJJVWlrdElKWlFQTTNDNjdP?=
 =?utf-8?B?M040QmkvZGJDVytOV0UvSnVrM0k2WnhZb05Wc1FMZ08vc3FzNGZOUEdJVkwx?=
 =?utf-8?B?eUQ3eTd2SytlK3kzUVRBZDYzWlpaMjJhNVh5aVdtcnM4VHdqbmdYQVpZV2E2?=
 =?utf-8?B?a045WlFwK2k1SzlQWmpPQlpsZXFLaVBYZUMrQTlJdGxQb0lRbGlVRk9RSXd3?=
 =?utf-8?B?eDA4QU41R0FhdktQM2x3dmNlamFBaGNPcDN4SjRJUXFMc0oyWVJpa1RRRXV0?=
 =?utf-8?B?YnRlTFVGWnVudm5XRzE4VFRjYWVJMFUwTWp4a0xwSC94NW54bTJGVS9wYk9t?=
 =?utf-8?Q?6omfc/oO+mAS+1oM=3D?=
X-Exchange-RoutingPolicyChecked: HNQGJzRy2UZFFhAHevS3IUIozAahaamIVRW5XcmAOhpsRlTEx5KTDVZU1EJs/vhSAa0bTjJR485iqayqqur9psyzip+KO5nmh6hNh+hZtyYstdwZ0B8KJtocVQSYjDRZI4u8K8cOCyJWBxkuP9mrw+q/Cwzk/hkXJYTVgMXKG02ZqY87DCa1InRSXoL6cKTy2KH/pnCG6Ad9wEoOsyMarcrkDPovOWGwAU15eJ6JRMX4S7SZuKCCkj1wk9JFnRLi5pePp/MXfi/9HM+UVt4SLtUNMceqZkCM4OBOr3kQEKLP2IYelB+8Zxikf7cGwLqVdQxUsysitqLjU0HR6Mid7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: b90ee340-5fa2-4381-fb9e-08deffca6863
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 21:23:13.5214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: voh68IB19KW7ZoFhDzlrPOWSUUdJrDTjlLvhJg61AG9Up4chp+RuFAKcbc4IwFZahG9yueSjQETkr54tjXNR8Ix3/sFOuMwKj699IH2vvmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5147
X-OriginatorOrg: intel.com

Hi Richard,

On 8/20/26 5:39 PM, Richard Cheng wrote:
> L3_CAT requires an exclusive cache portion to test cache allocation.
> This means that the cache portion used by the test can't overlap with
> cache portions into which other agents may allocate.
> 
> Some platforms legitimately report every cache portion as shareable,
> leaving no exclusive cache portion for the test and causing L3_CAT to
> fail.
> 
> Skip the L3_CAT when the platform has no exclusive cache portion that
> the test can use.
> 
> Tested-by: Chen Yu <yu.c.chen@intel.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---

Thank you very much.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
