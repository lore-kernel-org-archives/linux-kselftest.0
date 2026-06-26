Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C959A3C1F;
	Fri, 26 Jun 2026 03:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782444330; cv=fail; b=K7J4UJ7cFLEoGWSeoHbkCcDPQm86xluqzWm/dHWB7oXk2QRowHmNqqOAti6MU4o4F16+4PREiLpd8O5rZhqgSwL+gogBDSlChZp2W/r+Gf50V/tDf2hStRujDWFLvygUmwEmkhzG3+iBXvc8mre0Bfkx4l3EHM+C8t/aQA1xkss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782444330; c=relaxed/simple;
	bh=uFXwAXFKcEgoV1Qkq9DLW4rXBqK1+B++5uJobdyVRh0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jW7FSEX6dXghtXR24FgRveSzeAeCZHaqD6ksPBxrRu0ymVB9LcpTVErUXiOL9WVYgKRkFNfz4ctyuGKfxcuyO4/H4Z0esMTgrUoquMHtd+5u9WjEuZHbC+8pI1z1dXvuuFvjqLWrih57rdFv0i8KQVLsGrkuW/Q1c2fRa5rbjoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eU0IujvA; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eU0IujvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782444329; x=1813980329;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uFXwAXFKcEgoV1Qkq9DLW4rXBqK1+B++5uJobdyVRh0=;
  b=eU0IujvA0w+1iV8L+xoqWgtgMYaUB1g02r3+LrYYAzcdoG4CkQPCUufZ
   hf2BeU1lkEterklLVYrrHPryxIodbwAMCHfsho5ZsbR8mf4trZ8B7rS9C
   eMCZ2wTykT0uf8Nz2nEIv29haPkhWqgsyU0YYpaYSBGUS83volSb2LMWf
   V/7mssSrsEhgSF2wy7OEcXKhcppv0AlGxhHR6dVK+qYYoc8JwXpm7OqGj
   MdomqTAPdgvYAtTsiZkqQakmIPi6cEdEQDmdWwhhsUfv0hsUr7DEXt/+l
   nYn56bSNM6qeJbJJ9cXTo0+LAMXQXbeOnVks2Sr/dHaiPsRJPYjfv3XB1
   A==;
X-CSE-ConnectionGUID: aWG/WcXBTNynBmcIdrUlLQ==
X-CSE-MsgGUID: WiIWe90OS5641u3cYJ7yjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83008974"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="83008974"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 20:25:28 -0700
X-CSE-ConnectionGUID: zBlm/WeRT8eV7zqvKhD6Pg==
X-CSE-MsgGUID: j9UmIn+mSGeMnUBIky/pXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="250823497"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 20:25:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 20:25:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 20:25:27 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 20:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPe6FKu1rCPDL4RA3tQshwg1PYNhuo4TScEMdMyMx7/7Ea08ogSuFOtt/9qsGYvOEkPcmAHkjMl4WvypmITqh1i0AV91+BrlKU7WeAiTnS1x8iTzyXLQxRCWg/eGtHv/U1GhuA6/AWY62wMqgizhmD4Dbb722G37/C79zCsHCTP2oojxOE7jU6ypVRZtJ2kDjllIcEmWIHmws2zEEI3EHtEi+t0nY1M5PVbI/LEqJ+KTpq5R45NRjL/Szv3oObhOLyIEgoBHXcZEmcS/5r93/S/kKwXE80GlJ91TcFK1jANNsy7FO9qFPjubIKQF0GqmzvBVrRC8m9wqlIyVIQee2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPUfDSLhqtp8lYxc2nhWC7Xo17vlY7hw+CnDMN+c5F4=;
 b=jlMXKXQDPLfUAoa6ZDexjiOcqKQpCV2LktZ0JvymBmWHC7289qIw+igXqyov3SintAxC9Blp9F0ZuDg72OwgSux1JU4YFeVDq0DUzdDoO9dw/MCmTornN4oWeXwPXjvOaehFRbtsA+F/xqJkzk4dNGdeotGHKyKygNSlxNQRwCf48EjrJnNcSkcXz/tixlFDvjzn13MOV3LbXWaSioAyvcoXg+LB4ZrrNuLOpxx4OrcLRVBu59ci2p8BVthU2O+WDEIbaW4LWoOULiNPTdHlj9QYAYRL6iQyO0eRzQdNvTa12f2BTgs/jC4L/CcnStlBgdvPgcbF8ifZUr9OpbQX5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by LV4PR11MB9489.namprd11.prod.outlook.com (2603:10b6:408:2e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Fri, 26 Jun
 2026 03:25:25 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0139.018; Fri, 26 Jun 2026
 03:25:24 +0000
Message-ID: <5d76e776-82d3-4f02-8384-a890349ae96c@intel.com>
Date: Thu, 25 Jun 2026 20:25:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] selftests/resctrl: Skip L3_CAT when no exclusive
 cache portion exists
To: Richard Cheng <icheng@nvidia.com>, <tony.luck@intel.com>,
	<shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<yu.c.chen@intel.com>, <fenghuay@nvidia.com>, <newtonl@nvidia.com>,
	<kristinc@nvidia.com>, <kaihengf@nvidia.com>, <kobak@nvidia.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20260529022352.8308-1-icheng@nvidia.com>
 <20260529022352.8308-2-icheng@nvidia.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260529022352.8308-2-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0119.namprd04.prod.outlook.com
 (2603:10b6:303:83::34) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|LV4PR11MB9489:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fdd66bd-1b6d-4171-d4ff-08ded3328fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|18002099003|22082099003|11063799006|5023799004|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 72Hbejv1dssV2/WeLhyvHDNI4vlivQ8mQVlGCJsfcX1V7drF1BTAf/HXIwwPjBXVKhAUNirYG2+wam+8kU7C8BvUfYhSpwyUiW/AK9jzefKXhGorwSik6oFD32somRS/cnv+q0WjkIjRUgZIbzoavU1048CWoVe3Btrw14Ggoe98DWpHRZ0Cspg09uatckUlZfqxYgjHnA4V0wz/FFzah8S7dikmfHPSNx0YAgoyM82JXk+cscF3/dfPMXEq5Vm1c+JwC3ikTBtwvTYn6ALf+6WJwKLpMNvZzTCY7RnNO9bHmQ5aojx7/woUkHKH8Pa/ynNF3oBri4C2lhaxXFwoj37DmS9KkElG5GD4I1eQYAPChO8m8ps9J7AFWbYGMXU72lf2HnHKnLTbdXkWsS/1P3/J0PSr/zHYz5F/4I9P6pR4unR3K8SwxjfViSv+ZJUnvq6NJ2j2ReTPG3FEKz6Q+n5wSB/uqVqCRX5iCxo5Krfg3nrFUzWoxwkoZuw/v1LO3+EjIAA54bhJ8exkNBFQ+V8Y49Ut0f9cHcCMTq1MMLeOm4qQlzdE8bDxJUA2WVTYuQ1qZfTKMGmsrITXNX3GinSvhiGhjdphE1Wc9hKaUcgLLsxH8iiwzM0e1mexZpP8gFZkv60/hYNRYu/gc5fNq6BEVhnMooqkJ12eswF+xtY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(11063799006)(5023799004)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkNURnJ4elNGcDU0dDgrRk5ZMEg1Y09IT1UzbU9UWFE3WUw2Uy9pd2VGS2pE?=
 =?utf-8?B?cXdLMW9rMkhPREw1RVdPN21mMGJxV3BzTkQ1N3FkZm00SS9KNTJFZW1sTHhB?=
 =?utf-8?B?ajBTeFBhSk1hOElRbnc4WW5xVTZVWUp2akpBdEJ5K1ZFbGJrWVdPRzdZNXhB?=
 =?utf-8?B?djN4N2RIaDJXUGozbUZ3dkVZTWpnVXhJL1NvZjFRV0lXMzFyTjQ1SUUzdGNM?=
 =?utf-8?B?NURabXRYMDVsNWUxTHd3YUtXMFd2aXhBNmtZYXhoTGkwanF4WUhSUXhWdzQ3?=
 =?utf-8?B?T3JNSFJsOHJFeUZxVGN5bldXeDFtbTJGd2lQRlN5dkQwWnh1eGo2U2ZZNmFT?=
 =?utf-8?B?cUpTS09nT0VtT2YzQlNUcnJGMENqeFdxZXNxZFNYcXdtSWJHbklMOEltS29R?=
 =?utf-8?B?K2lORUs2dDk0VEVRVkNBNXVteTgxd1o2WXFkVm52VGNqUlNTUGJWODlpVTJl?=
 =?utf-8?B?Z1pMSWVTSE5hZHQzWmsyTFZGcEx3bnUrdk1CSldNVk5rV05RbVdmaS9hY2VT?=
 =?utf-8?B?c2dTZno1TG1tWXZjYUtPTXJ0bzQraXdwRFpEaWM0L0R0dEpkZ1dEUmdHdjY1?=
 =?utf-8?B?WnNjMnVYMUN2RlF6dlh2bFNTMjVmUlMxeTd4ZmtwVVdMWXJTZjM0QXhUeHpm?=
 =?utf-8?B?OWFzWWhHVGZCMXc0b3phOGtVTE9wdHREYTVVSVA5c3liWEpMaUxhOEFxdlFu?=
 =?utf-8?B?RGdGUlgybC9HTjdnL3NpbWZqcWMwU3JqNTc3akZDR2lpU0tjekFuUXNUamxE?=
 =?utf-8?B?azBGc25VTDlmNmpBb1Y5aytBN1ZvZHBMcFB4RVVBTm1oOFhtejkzYVlWV0Jv?=
 =?utf-8?B?Z2plVlJVV3RjbE55Y1hIbUFGU3B6dllqUm1NZEpmRmxnSjhhbnVnYlZCdjRh?=
 =?utf-8?B?WkluaStodDhGTWhienM3bmJIY0haSHlHTVYzV2RwZEcyd0tDbmFZS2lRdVNo?=
 =?utf-8?B?YzBZSHNqb2tvYTFDVzBldXprSExkSWNZNFlwRTZjZEIzWlhQaUJXSkRwNDZJ?=
 =?utf-8?B?bkEyNDh4TVZ4SGl5U2hGRHJOZVp1bjJhb0dSZEkrdE9VcEVVWjlwVU9pSmhp?=
 =?utf-8?B?eERuNWpnMWlJNllmZVU3QmROQTc2dy9QWnhIT0V1SlFLZEhMc3V3bFdYeXFh?=
 =?utf-8?B?b3Y1S2FybTBIckNZKzk1K1NoVFk5UVhCMmV5NjR6M2JwdURRUzRnZjVNNUF1?=
 =?utf-8?B?bXptMDZZMmUrRnJXWlY4ZWNuaXZYY2FiaE9VYW5VVDV2MDgvL09vakFubmd0?=
 =?utf-8?B?M0hJbXZjdmdzYS85STkvbTVPcUtQRU1adjcyRlErU1BXYXNSZWF4YW5WWGJl?=
 =?utf-8?B?UzVMOE8zSHBJUlA3TDlLQm5lbThXVmFZRDNXaW5Sb2V2L0tzQ2V3S0M0TTdP?=
 =?utf-8?B?S0ZZN21uMU1oWktvRTM2cFJ6NFltc2NwKzJ4bDJuS2UyREZML1BSYTNTMFRq?=
 =?utf-8?B?d211UldLc2IvLzBONzhVK3ZtN3ZaRFI0S1o3dmJaQ1FmQ1Q4OElpUjNhYUpD?=
 =?utf-8?B?dVI1M0ZnSU1IOE9TbXF4RlQ2YjRzWUpjREIrMTl6OFdwSUJFRVNHOFRpRE9I?=
 =?utf-8?B?bjRyMFNkZVNFVGRMeHFtM3c1aFpRMGt4bUVOL1dWNjNHQnR4SlNSQzFzTDJm?=
 =?utf-8?B?YzN3ckZNa1dnaDZpVXgreHFkRmdMSWMzY2pjdllTRnlKT0d0SHdNcUE3M24r?=
 =?utf-8?B?eHFscWFoVGMwZjhzQWNJN0xaZW1QMktrcVFBaWEyQTQ2OWxkdFRia3RNYi9L?=
 =?utf-8?B?cnlHRXdVUzNkeEMyZGVNTnpWSGpaV2xWQnhIOFZMZjJqcUpmdDNlV0pRK3pV?=
 =?utf-8?B?T3B5a2dZZXFCMFlKZHFsWk5yQ0pWK1cyVTU3WURDeHNMTU83SXY5TEdOckd3?=
 =?utf-8?B?WEpTSVZQalFLVjNrWFBIQmdCRVNrbGttTjJKclRIQzJrVlZibDQ0dnBSbVVZ?=
 =?utf-8?B?QTF0R2htTGx1SVZnc0ptMUVscGVGTkNaWHVaWHFFMTUxeXRTL2hKTnMwVE5m?=
 =?utf-8?B?MnNkQmpkemhSTXRtUGZ6cWV6N0g5bWg5TGd1TlEySnZNeGduUEZwNEhOekZ1?=
 =?utf-8?B?SWZROUVlNmhGNktBNDdwTThjSlR6cFk1QnVUZ1lvdlI0RERxUlFNZXVscXVp?=
 =?utf-8?B?MXpKK0JkVFBjMUdQSjh6RFV5SGVlLytUQzhuK0VGVkhJNng5cTEyV1lYZjF0?=
 =?utf-8?B?UlV4aklVUmVab0htTmRxK0gzaFhjM0R4b0prdkpadzZKcER6QlhFd0cxR01t?=
 =?utf-8?B?OXkzVGFOWk5BN0xyd2pFeDNZLzJiSjVGaXlmaUtPdnpoS0c5b1NoWVVMb3lW?=
 =?utf-8?B?VUJsb0cycElReVR1WVVqZytyWWdTZXB0UFR0eXY1RFlRcy9pakxlak5tWFRV?=
 =?utf-8?Q?CY0G3bxKDfHc64p0=3D?=
X-Exchange-RoutingPolicyChecked: Tx2xk1m0ou3RZ86sQ7EKwngGXA++5CB25cQjEII8FqzLyzoqKi7X9qAY31TKeonOqUnB2fzwmF5A4kaNVvfv5/8wR9S7grJkQ8VSJa82dSpA685b+Qip5OIoXuL1/bMAjbe4n9xb0T+NMVV7rV4M+iFy2cFoC0hT/HZs6DHInFcP4MB4AJrVxkoR2QzXa/JrP+J8ofTunYsL0k7oPyoRzyXiGWE0cYk49yXAuAd4uj81OKk8hAkUkLoR1hbLul49/RRZriSvd1TKIytSNm4Xbafmm1SmSLSuHIwAnMWJGsLWVfd0FiQD7hm+V0BPvLb2ggDT8CYkB5pD/AiGsNAVjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fdd66bd-1b6d-4171-d4ff-08ded3328fc9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 03:25:24.8792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KuE6ppfpPCpeRSe71oQT+43leGlYrvpFbPR+YF1YarcBt2f6acx7Kv4Fm/Kumb370ys/0vDXlxfSnKkGLCiwzoProXbM6TnPhwoEdpjxyn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9489
X-OriginatorOrg: intel.com

Hi Richard,

On 5/28/26 7:23 PM, Richard Cheng wrote:
> L3_CAT measures cache isolation, which requires at least one cache bit
> that is not shared with non-CPU agents, i.e. cbm_mask & ~shareable_bits
> must be non-zero. On MPAM, shareable_bits == cbm_mask is a legitimate
> state, so there are situations in which no bit can be reported as
> exclusive.

To make problem clear, please append "... causing the L3_CAT test to fail."

> 
> Previously get_mask_no_shareable() was invoked inside cat_run_test()

Written in past tense is confusing since it describes current behavior.

> and silently returned -1, which surfaced as a test failure on arm64
> MPAM systems.
> 
> Implement cat_feature_check() to perform the same check at feature-check
> time. It prints a diagnostic and returns false so the test case is
> skipped instead of failing.

The second and third paragraph describes a lot of detail that is clear from
the patch. I think these two paragraphs can just be replaced with something
brief like:
	Skip, don't fail, the L3_CAT test when the platform does not have any
	cache portions that the test can use.
	

> 
> Tested-by: Chen Yu <yu.c.chen@intel.com>
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  tools/testing/selftests/resctrl/cat_test.c | 23 +++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index f00b622c1460..dc414e55ae94 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -378,11 +378,32 @@ static bool noncont_cat_feature_check(const struct resctrl_test *test)
>  	return resource_info_file_exists(test->resource, "sparse_masks");
>  }
>  
> +static bool cat_feature_check(const struct resctrl_test *test)
> +{
> +	unsigned long mask;
> +
> +	if (!test_resource_feature_check(test))
> +		return false;
> +
> +	/*
> +	 * The CAT isolation measurement needs a cache portion that no
> +	 * other agent shares. On MPAM the kernel may legitimately report

This does not seem to be unique to MPAM (https://lore.kernel.org/lkml/c9bee1ad-10f8-4e69-8d90-609cdd72580e@intel.com/)
Perhaps "On MPAM the kernel may" -> "Some platforms may"?

> +	 * all bits as shareable; skip the test if that is the case.
> +	 */
> +	if (get_mask_no_shareable(test->resource, &mask)) {
> +		ksft_print_msg("All %s bits are shareable; cannot measure CAT isolation\n",
> +			       test->resource);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  struct resctrl_test l3_cat_test = {
>  	.name = "L3_CAT",
>  	.group = "CAT",
>  	.resource = "L3",
> -	.feature_check = test_resource_feature_check,
> +	.feature_check = cat_feature_check,
>  	.run_test = cat_run_test,
>  	.cleanup = cat_test_cleanup,
>  };

Patch looks good to me, thank you.

Reinette
