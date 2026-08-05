Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EBE238C36;
	Wed,  5 Aug 2026 23:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785970970; cv=fail; b=Qc/CsFIVnB2ohqobLa9DC86F6ZORbmiRY5lVDJHcC7PW5aFX01bU1pt0iW0mgjcBIitLPDuNXvTBp4xBqyhxglTgmvsxypnqhxU2WWbq2CN6/Tgb0EGqxm7w57nQpiPe41nCEAPiEpN8TefMFQopMn7Arle+3jXHxW+4hsycGjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785970970; c=relaxed/simple;
	bh=LMr4Q0W4bJ1pi1cGaD0CH7+Uhor+R8w1cNW2aOdtPwU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pH6kdeA9X+yZdsqRNLZRY67Ot8/xbKse2sFJ4/OBElFbdBTe2A4xLLBnCngumoifjSLZt6iaMTqRJAVzjKjoF6nRfQ6/1IWcCLPhvZ3697VVp2TM11DrA8VbFI0KYxw/DPeqD0sLlwI3SXfTfM/quwJr1zBmbo1+Z3tlxtcD5qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMRuPtPn; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMRuPtPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785970968; x=1817506968;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LMr4Q0W4bJ1pi1cGaD0CH7+Uhor+R8w1cNW2aOdtPwU=;
  b=lMRuPtPnpGQROMNbZeu6k6lJOaIrmp0Hw6X9mv26yugOreokYBfsy7YH
   7eC5cNa+1opI/ruMBV8r7NV0qD2H+KhdrPfRINCL1pBNirkdgozBQYaNH
   +8O3ZDLrFZnTVVeYQgsjRdui+h02phePlkhRr8LmMWx+w0k+0xkYkK0Kl
   LZNLTEik9ZrSG2rla0XcZYpyje+fmJeM4DaWz6DLoLWZqEC4sppuxsraC
   3r16uvEZ7O/vAR3yVgRNnOKVpvObi6aOV7XfSmDpx2D417/YjyOSZgvul
   JiTH74bFshaBxaCuGbSX4z40NN7hTvz/akPqrvCQuIa4Dnbtntch8rO41
   A==;
X-CSE-ConnectionGUID: WknTjvc/TQmLsWFlaP3a2A==
X-CSE-MsgGUID: X3Vk3MhFSsuXkd0qrub6vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86761536"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="86761536"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 16:01:50 -0700
X-CSE-ConnectionGUID: En+5pYkFTP2lY91rbxJ5pA==
X-CSE-MsgGUID: tr6mB/n9RO6jQG/vB8A35w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="267072407"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 15:37:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 15:37:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 15:37:45 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 15:37:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VyK0tGPL9lqt1a6N2zn43k26Si7dbXnwFwEPIZaH3/Yec5sXFti/JOBXJTfcf0Hnyaz6oQXq786gVa9+sgXGZM0BjzeFDKoQLXnHi5WhVuegrWoxP8Rk0+jVLkU4cpaIfxF2KDwBQI8b+5X6qLTlCxwjM1KO0CHM97DlrAyjW3gaiUqzCXQ0BakAGVYBFRvZffXbUTZik17Z7XoDXe5l8L0XQ2KM7G+gVh6pZbKCf3E9KYEud9D+ejdw0GmcQAIuavJRVo3yYWDy+StE4lv1z6RQoXmo9Wc0GxXiJLGV3k5St1yeIk/HwsCkn21anxsz7tI3KntfLPQ1wan36zrjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLcRDCi+0P0orvDHm0Tit+cn4c5OsHGsYIyW/cCwMaM=;
 b=LAyhGRWtcvfyWZjJGqGAPelCSlGaNVb4GC/6XXT/sfhO6jR3SOKTuBHAZs7wBf3Y8YGAVrwP+yv5Bkaf25W/7sSY3fDQdjvds5TAG2FzXdfWgQCgW4aTBTLmMAJZGeyJRpfeTEJr11MdQH2iuoyhK1wPOcI1yJQjDCgOgYwk5gzzzu5bYjCkQSsoxwvDjl5uEY9nLk6PjosWWsY3gtDAG8fw9WFttb1quwhZOGB5rqqXXG+4bMjU7IMkJxg++wE3KpYq9kqPtoNLVWvgYs7zh7/tDg3X7x67dw3KV0Upi73/lUn7gYTMaQWnEYW1EuTBkIqS2OyGb1PYpYBRcoqhdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 22:37:41 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 22:37:41 +0000
Message-ID: <c906f41b-c9b9-4724-b752-769b2a24008c@intel.com>
Date: Wed, 5 Aug 2026 15:37:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] selftests/resctrl: Add L3_BIT_USAGE to check
 bit_usage tracks allocation
To: Richard Cheng <icheng@nvidia.com>, Tony Luck <tony.luck@intel.com>,
	<shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<fenghuay@nvidia.com>, <newtonl@nvidia.com>, <kristinc@nvidia.com>,
	<kaihengf@nvidia.com>, <kobak@nvidia.com>, <sdonthineni@nvidia.com>
References: <20260608110641.44457-1-icheng@nvidia.com>
 <20260608110641.44457-4-icheng@nvidia.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260608110641.44457-4-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0232.namprd04.prod.outlook.com
 (2603:10b6:303:87::27) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|MN0PR11MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b58dacd-8c0a-49e7-3bb6-08def3422921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006|5023799004|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: E+RUOXzARPEk7q3dRorb1KoT2bVZAVQYZ1uu7qwC9u9NNB/CEAroNf7cKfwf4NDREFV1OoesAvOumqXJIDmlHv4d/ckwKisl3rqP99IHW1HxHRfMgNQLcZ4zMWaJKNoEsgow0ZoNadJoQMWf2G793L1C6cY1ZGf1EH0421DL2hqQgbI+L/04B2we+8uX4Sorl8LN1G4qh4+vxCmMaFY/XsGlpVvX81p14IW9Oyk12V/L/hKkHo7jl5Tm7ky/zklRvHrXUnsKdRgY9b1bS1vsp+8DEUxMbBfkcw3J4YcuV3K1gP8Owm9qeaQFz3+cM3nCtvugmRjKCW2Q8MAa+13KtfTzQErBgvOQrwiB82KRuPu60btSKQGmBAw2Nj4MYl+wR8+zbom3U6LQ6z6SSBcJM7AGrV9+TtTpreCFgEHf02hS4lk1WeuqdMn48lf+bBp52kqTojfAsnBxX1wjo40tvo0UJ+Q3LGuAqx+/4uBk2gGFUZIIb9ybFV3taTyCJhSmIRaiAi4ofgQK0UWiEs9FpENKz1T/59+XZfyuOuuVlFvxdPs3gfhwrc5QUyJtBhqjvHeuwtb3Ywa43zxf7wqc83oITseqiSbh5fD/IYx59WV/qQzD9kiu6IvHAgiwNdocUo2XZbwP4ZAJOGLJZaTT9AXyYmMvwp3g2+b8O6bQsxc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(5023799004)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU9EQnFYZ2dNU0hLbWR0YW1WVWhoNVo4VXlxMzVBN2tpSVg5UDVMNVFhRUU5?=
 =?utf-8?B?LzMxTlVDRG9sRFhyVFg0dTUvRXJLYzdiejE0bkpVd3RyNjV3VUlERlk4Snhp?=
 =?utf-8?B?bWxJS251SVUxSlJ5R2JsUWcwQ0ZDbEwrUEN2Y0wvMkFjKzlsMEFEellaRXJl?=
 =?utf-8?B?elV2eFY2b210TnBYSktIZGFUdExidGNRbzZ4d3ZZaGV1UGMxbFhaNXZvRU92?=
 =?utf-8?B?MVRIRnZqWXRERDRZZzZWY0E0SXlsMk9UZm0yR0dkcWpvSEVKNTd1Q25pV25J?=
 =?utf-8?B?SE1QdUU5YjAwVnRVY29GU1YvRFlMcVByb1NBNTBqSlpPdWxuRityTENKTWtk?=
 =?utf-8?B?eUlSWmdqT0tjTXNNbER3ZEk3YTI1eEt0WU82dGRsQmp5U0N5RGIrQWwxRTU2?=
 =?utf-8?B?TXBnenNCVUkxZlNvdnZ5Y0FuWXdualFRU3E1SkxQU0NZR3Q3WXVOeU9BRHFZ?=
 =?utf-8?B?VGRxZzMwVHR3M0xCMUVnYU0xVCtNWmQ5SmNmbHFkNFFRZGl4RG5DL2ZORWow?=
 =?utf-8?B?VEkrdWpRSEJjQWUvWUtPY2s4V2cvWUsyMzV1ZWxiMW5CYUpXbWVEVXd3YlUx?=
 =?utf-8?B?UTFmSS9IS09mQ3NyemQwbE1ESEZ4RlIyYm9kbW43QU5xaEVFMnBBOURNalhH?=
 =?utf-8?B?OEIvbVJlSWgycHViRUs0WFhFMmc0TGZmbWJrckJMVGlsNS9NeHhkWFlnU010?=
 =?utf-8?B?SktZYjBZUU9VTWhPTGRnRDRjMXh1ZFBST1praEpSSEl3SHhhZHo1a3dVRFVN?=
 =?utf-8?B?UmpyaDdHOGdJU2hnem9GUno4MmRjRzVUK3BoMlJTcjFtaWRUaDFiT0V6UWxp?=
 =?utf-8?B?Vms1c2s5dTA5ZGVvRHNlYVFhVk8wM1NGbEp0NndEYUpEeUkvM0FJemp1M0V3?=
 =?utf-8?B?YXlycmhXZUFoWFo0VFRaZ0x2VXlRd0pWSXV0WUhvQzk0eVJZQVZTbk02QTJE?=
 =?utf-8?B?UWROaHdUVU9NOW9vZkNQWVkxWVRmdE5FOU9IQXNKK05nRVBydFhicGdUZFAy?=
 =?utf-8?B?VlFBK1oxOUZRWSt1U1VTdGgrS0xnUWNxdTlCVEZyY1I4Sml0ZGE0emVOZGFr?=
 =?utf-8?B?NEtHOUZBNGZxTTQzZWFsS1dSTTBzekRPSHRWS0NraHpUK3Nvb1FuK2dDRTRo?=
 =?utf-8?B?czFSSUcxZjg3ZU85OU1MOGhRWjN1TFcrNVVpTldLOVd6ZWp1TDNLRmIwUW5E?=
 =?utf-8?B?V2U0akxPVzN6MUxReXo1ajNTTHdLRThFWmtDWEsyQ241TmtZK2g3cXo0KzFw?=
 =?utf-8?B?d3dPMlZSenhVb3ZUZnNYMVZEaFRnQ0FFS2VSNWdCdVVXclNtYVBnakIwSzhE?=
 =?utf-8?B?NEVoNGVaUjY1V0FKMVVrb3B5MTVEc2FBbTExdmpERkN0aTg3ZlJrTm1NVEVB?=
 =?utf-8?B?OURqU2JoQVV1QzlTSEZpWWQ5dTJtclM0eDE2N0lPTVgxQ2ZUaEFRc25RVDZo?=
 =?utf-8?B?Q2prOUp4R1Y0ckRjQ1NaZjVsTmF4MHFTZHdTNlUvYzQ0MG5RcnFGY3VvWGZT?=
 =?utf-8?B?Q1FlVnRpbGhDWmFHNHZ6azhFUk5ycmRPTVJRaWxPWjRWbFNIRTlScllIK3VO?=
 =?utf-8?B?TTZTTm9UUXg2NXZjaEhiQ2V2Tjh5VmpBZ1E0dFRuWGtwOTBUZkhUMks3eVpO?=
 =?utf-8?B?Ti8xOG1nVlFuZzNuVlZPcktsQ2RzczVqNUZ6dW5rV1plai9NMEt6bGlRYXls?=
 =?utf-8?B?NGQrbnNFSXpwVlkzUGhLVFJybERQcXQ0QUI2d0lWMVhObktGU3MvekhiMkc3?=
 =?utf-8?B?NW5sYkxmQWJTZUxDYVZzMU45MVJkOGlDakNnVDVoV0hPd0NEbU1xZzdnbHo4?=
 =?utf-8?B?cGFCRCtERHpyZlNmYU1BSUhsZzRaUzE0Zk1VZ2hjUWNxaDQ4NE1aNDdwbVpG?=
 =?utf-8?B?bGVnalZCOXRWMWxzbjhaK1VSRUx1WlEzajUyL09LbFExY0FlQjZFVjJINlpq?=
 =?utf-8?B?ZzJZME5JMElrMXo4M0laQ0NTenhJMURZZS9RQjU3eXpEVzM3QTU1akhuRmVH?=
 =?utf-8?B?dVRNbVd5a0dodXRvM0FNbkJYZ2lYbDE1SzBOV0h6L0hXSXBpY3ZiMW1ZNEQy?=
 =?utf-8?B?KzJTOFFKRjhLaVZtTGdOS3FESDd1NHpOUWNEWjJmMC9Wb2xULzNzQUJYUzMz?=
 =?utf-8?B?TUkreHFmamlsNnJLZmZNQXVSN05SVE9tNWlGbW0xZVo3OXFDTG56VHMwMExa?=
 =?utf-8?B?d3FZL3kvcFRKNWVVSTA3UmZZRDBmaHlsVGY4OExsNGxsVmNKM3JjQml1VGJl?=
 =?utf-8?B?RUE4K1VVY3NCOUdQTFA1WWhhalVqNGM4Uk1LUVRCNFA5UE55dUowRWh3WXgv?=
 =?utf-8?B?UjFOOUNNTXU5OEVQTHM1dXcyNnRoMUJVaG54Um51NmZLVHhCSHRXdHhaNlFy?=
 =?utf-8?Q?hK63ucY9guWs9SZM=3D?=
X-Exchange-RoutingPolicyChecked: WbhfB7lo5ZGxG24r3psIGsvm6uj9x6iEoAUuXpTS8Zyaur9wUquLzCRCsaThu4aR0Joxu78aPhUttROcUck2dTWBCYmIFaj5PUbAQhGqpLiSzo4Ll83oYOdNj++KXJ4RRV5bcirmKnmgihmg56r2X16mPotjZq/FjBo3JIcxBNegPHZLh1qflrngsrW+uPO0q1tclVPyq0fkUazyayrH2i/028D4JpKp9CilylnBoIOxzgOLwYFx2FkzqC8q9+pu+72JmS6tIbQKvCHK2YiTw8wCM1D+1jYue7sOwWid6XFHzXwSzpPNMhzsmH6c2zBkqBWmSVp1ah5GPw4I/lB1pg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b58dacd-8c0a-49e7-3bb6-08def3422921
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 22:37:41.8194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aei1ImBACrXoYosGmyIw/ZEaaNUn3noAUhy+irNRjqxHD99f4u46Nn20KlUJvJVwuPZBIM/MHm7Y4qqCDNzc5M/rDYc8eb0gUCt4CtBlBQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6207
X-OriginatorOrg: intel.com

Hi Richard,

Thank you very much for creating this test.

On 6/8/26 4:06 AM, Richard Cheng wrote:
> info/L3/bit_usage annotates every cache portion as used by software ('X
> or 'S') or not ('H' or '0'). Nothing in the suite checks it's reported
> correctly.
> 
> Implement L3_BIT_USAGE to set the root group's CBM to a few masks and
> confirm that, for every portion, bit_usage marks it software-used
> exactly when it is in the CBM. With only the root group present this
> must track the mask bit-for-bit.
> 
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
>  tools/testing/selftests/resctrl/cat_test.c    | 153 ++++++++++++++++++
>  tools/testing/selftests/resctrl/resctrl.h     |   1 +
>  .../testing/selftests/resctrl/resctrl_tests.c |   1 +
>  3 files changed, 155 insertions(+)
> 
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index d236988916d9..62af8ac98109 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -682,3 +682,156 @@ struct resctrl_test l3_cat_validate_test = {
>  	.feature_check = test_resource_feature_check,
>  	.run_test = cat_validate_run_test,
>  };
> +
> +/*
> + * L3_BIT_USAGE - Verify info/L3/bit_usage reflects the allocation.
> + *
> + * bit_usage annotates each cache portion: 'X'/'S' mean a portion is used by
> + * software, 'H'/'0' mean it is not. With only the root group present, a
> + * portion is software-used exactly when it is in the root CBM, so bit_usage
> + * must track the CBM bit-for-bit.
> + */
> +#define BIT_USAGE_LEN	256
> +
> +static bool bit_usage_sw_used(char c)

There is a bit of redundancy here with the multiple appearances of "use".
How about "bit_sw_used()" or "bit_used_by_sw()" or ...?

> +{
> +	return c == 'X' || c == 'S';
> +}
> +
> +static bool bit_usage_not_used(char c)

(same comment about multiple "use" appearances)

> +{
> +	return c == 'H' || c == '0';
> +}
> +
> +static int bit_usage_for_domain(const char *resource, int domain_id,
> +				char *out, size_t len)
> +{
> +	char path[1024], raw[BIT_USAGE_LEN], *tok, *save;
> +	FILE *fp;
> +
> +	snprintf(path, sizeof(path), "%s/%s/bit_usage", INFO_PATH, resource);
> +	fp = fopen(path, "r");
> +	if (!fp) {
> +		ksft_perror("Error opening bit_usage");
> +		return -1;
> +	}
> +	if (!fgets(raw, sizeof(raw), fp)) {
> +		ksft_perror("Error reading bit_usage");
> +		fclose(fp);
> +		return -1;
> +	}
> +	fclose(fp);
> +
> +	/* bit_usage is "id=chars;id=chars;..."; return the chars for domain_id. */
> +	for (tok = strtok_r(raw, ";\n", &save); tok; tok = strtok_r(NULL, ";\n", &save)) {
> +		char *eq = strchr(tok, '=');
> +
> +		if (!eq)
> +			continue;
> +		*eq = '\0';

Above looks like a re-implementation of strtok?

> +		if (atoi(tok) == domain_id) {
> +			snprintf(out, len, "%s", eq + 1);
> +			return 0;
> +		}
> +	}
> +
> +	ksft_print_msg("No bit_usage entry for domain %d\n", domain_id);
> +	return -1;
> +}
> +
> +static int bit_usage_check_mask(const struct resctrl_test *test, int cpu,
> +				int domain_id, unsigned long mask,
> +				int count_of_bits)
> +{
> +	char schemata[64], usage[BIT_USAGE_LEN];
> +	int i, ret;
> +
> +	snprintf(schemata, sizeof(schemata), "%lx", mask);
> +	ret = write_schemata("", schemata, cpu, test->resource);
> +	if (ret) {
> +		ksft_print_msg("Failed to set CBM 0x%lx\n", mask);
> +		return ret;
> +	}
> +
> +	ret = bit_usage_for_domain(test->resource, domain_id, usage, sizeof(usage));
> +	if (ret)
> +		return ret;
> +
> +	if (strlen(usage) != count_of_bits) {
> +		ksft_print_msg("bit_usage \"%s\" has %zu chars, expected %d\n",
> +			       usage, strlen(usage), count_of_bits);
> +		return 1;
> +	}
> +
> +	/* bit_usage prints the highest portion first, so usage[0] is bit N-1. */
> +	for (i = 0; i < count_of_bits; i++) {
> +		int bit = count_of_bits - 1 - i;
> +		bool in_cbm = (mask >> bit) & 1;
> +		char c = usage[i];
> +
> +		if (!bit_usage_sw_used(c) && !bit_usage_not_used(c)) {

Could this be simplified (by avoiding double negative) to 
		if (bit_usage_sw_used(c) && bit_usage_not_used(c)) ?

> +			ksft_print_msg("Unexpected bit_usage char '%c' for CBM 0x%lx\n",

I think "Conflicting" instead of  "Unexpected" would be more specific about what
the issue is.

> +				       c, mask);
> +			return 1;
> +		}
> +		if (in_cbm != bit_usage_sw_used(c)) {
> +			ksft_print_msg("CBM 0x%lx portion %d shows '%c', %s allocation\n",
> +				       mask, bit, c, in_cbm ? "in" : "not in");
> +			return 1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int bit_usage_run_test(const struct resctrl_test *test,
> +			      const struct user_params *uparams)
> +{
> +	unsigned long full_mask, masks[3];
> +	char schemata[64];
> +	int count_of_bits, domain_id, i, ret;

(reverse fir)

> +
> +	ret = get_full_cbm(test->resource, &full_mask);
> +	if (ret)
> +		return ret;
> +
> +	ret = get_domain_id(test->resource, uparams->cpu, &domain_id);
> +	if (ret < 0)
> +		return ret;

Since this function does not use domain ID, could this be simplified by letting
bit_usage_check_mask() determine the domain ID itself?

> +
> +	count_of_bits = count_bits(full_mask);
> +
> +	masks[0] = full_mask;					/* every portion */
> +	masks[1] = create_bit_mask(0, count_of_bits / 2);	/* low half */
> +	masks[2] = full_mask & ~masks[1];			/* high half */

Please do not use tail comments. Instead move comments above the line they
apply to.

> +
> +	for (i = 0; i < 3; i++) {
> +		ret = bit_usage_check_mask(test, uparams->cpu, domain_id,
> +					   masks[i], count_of_bits);
> +		if (ret)
> +			break;
> +	}
> +
> +	/* Restore the root group to the full CBM. */
> +	snprintf(schemata, sizeof(schemata), "%lx", full_mask);
> +	write_schemata("", schemata, uparams->cpu, test->resource);

It is not necessary to restore the state - resctrl fs is unmounted after every test.

> +
> +	if (!ret)
> +		ksft_print_msg("Pass: bit_usage reflects the allocation\n");
> +
> +	return ret;
> +}
> +
> +static bool bit_usage_feature_check(const struct resctrl_test *test)
> +{
> +	return test_resource_feature_check(test) &&
> +	       resource_info_file_exists(test->resource, "bit_usage");
> +}
> +
> +struct resctrl_test l3_bit_usage_test = {
> +	.name = "L3_BIT_USAGE",
> +	.group = "CAT",
> +	.resource = "L3",
> +	.feature_check = bit_usage_feature_check,
> +	.run_test = bit_usage_run_test,
> +};
> diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
> index e2e3cf7833bc..270af2b26ba7 100644
> --- a/tools/testing/selftests/resctrl/resctrl.h
> +++ b/tools/testing/selftests/resctrl/resctrl.h
> @@ -249,6 +249,7 @@ extern struct resctrl_test cmt_test;
>  extern struct resctrl_test l3_cat_test;
>  extern struct resctrl_test l3_cat_occup_test;
>  extern struct resctrl_test l3_cat_validate_test;
> +extern struct resctrl_test l3_bit_usage_test;
>  extern struct resctrl_test l3_noncont_cat_test;
>  extern struct resctrl_test l2_noncont_cat_test;
>  
> diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
> index 66739e96f33c..e622928a2d7d 100644
> --- a/tools/testing/selftests/resctrl/resctrl_tests.c
> +++ b/tools/testing/selftests/resctrl/resctrl_tests.c
> @@ -21,6 +21,7 @@ static struct resctrl_test *resctrl_tests[] = {
>  	&l3_cat_test,
>  	&l3_cat_occup_test,
>  	&l3_cat_validate_test,
> +	&l3_bit_usage_test,
>  	&l3_noncont_cat_test,
>  	&l2_noncont_cat_test,
>  };

Reinette
