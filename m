Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB633471263;
	Wed, 12 Aug 2026 17:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786555554; cv=fail; b=cufkCsnNK2JhuVlE+bobqajONDOuuSEr+hH7rI3YClHJ6jdPhHnImpo3uxArZf2Crg5qLeEo8pHJ5Dsoo1iMjsDWdRfhOoTLodUFlZY+0o5+IHDpcOsXOPzZ5xpQs/sp195Jsk1Izyaamh5vF5nWenSLSnakNbjd/50VDdMs8o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786555554; c=relaxed/simple;
	bh=M2G6fi+fIxi7W/a2dgAwWBMtvv7Kw4dXl4OKQA167So=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u0cp6kzxU/xH8oHd4k/pHlVWrGaBnb6+FgNMcosThpt5lVWJFgZjmtDahDMist3uP0Pcz1dNo03i1ggR5tSkYR2x3QrY3n0dMcjeSP37mM3VL6MvhQr0mIoB88LXwoG6CULnSkvdTA8L8+ZHNgKszq5PA3Eq0v85mUsB8mn+yT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXiWqirB; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXiWqirB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786555553; x=1818091553;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M2G6fi+fIxi7W/a2dgAwWBMtvv7Kw4dXl4OKQA167So=;
  b=jXiWqirBxsMi9yTnIKs8MZuRCKFu3V3Ibh0Fhcs6vbO+7++kVaBpHUrS
   bGvUa/pOFyMqQXA34eBykaRWXYsz7gp3Yedk76sLMT+D29p8lE+aPwTgq
   BXSz6GQy+eDcmSjMEtYcTSPSNhAheefvBIMta6J9YfmOmrse5cIrTAaqS
   D+Kz1FyBHx/Z8EGrefwVgpB5Qu6UOmUrJjSfI0shsgRKbH0+50MZAuFAI
   MeQQa/130SYg/IkJmF4OTBNZ/on6pdvkKapo+Kt0jROcdhk+6GSm81/wj
   arJzZKglg9zc1S4ZhK0WwlwKGT8YAdxwhNF/j1UqTwqlkY0ec678y+JpK
   w==;
X-CSE-ConnectionGUID: Tk88JjqFTmiaCr27T/lErw==
X-CSE-MsgGUID: 5Zx8yMKBSaCRs2m/zFgwcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86997461"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="86997461"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 10:25:52 -0700
X-CSE-ConnectionGUID: zB/CNuE1SCS5SpO4nfvGIA==
X-CSE-MsgGUID: mSP2ii1rQGWoRolfdCbrYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="263750123"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 10:25:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 10:25:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 10:25:51 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 10:25:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3w+iglL6A9Z4AVLuAvA4drmHLeiHEuMrlvBAfgv4k1wKBQXHtBwIngm2AmdguhIGlczIjvZ8tXUVjPr6GSBTmaaYrJYskr9ceBcgY9Gqfdh1vOx3OClVrCOCQkKpu+yovR4F7DGyC2UYb0m5Evt4uazWW6ws1mD26LMz56480Dh9hkP/53rpjPWs+u4unDTFvzGVjcgFg3FGLSzB8XkGE/q/GuBnhY61uKxjNURknTXWlHpx0ehZkO3JtQLqIAsfyOpA/DBMkDpfAy7U8wFlBFgnXLNB72wvFWWtMW5Sq9S6HjqQluUEvQBG9PQlA5BW6UhS5DSyr4DDnCdDErTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbIIbD+VKAYW2+nAGbOdqZB/bZJDQAOBQ+lxii+q4hY=;
 b=Uou8F1IkUEv70e1RkQ+TgEOX0V32HE5JyU1Ro32i2xr3/Vg9G4Y70L/d8NtrXdbjzApvhLUgdioidpj+LJAHYf75UEnST/Wj1g0XLpZKtq/wj/37YsD6UBdhyIOPJYZE9iWGTqqIPmrlt+MgVqJt+rd/K5HAWQSk1OsT6AYYd1+UXgeoSOPsm1IL2wNEcfavPDJPmvuXbdVxHp51NYhN5B6ooa81gaJ5Z5KcqdDJi8FL3YzwM5DPr/pYg5XGZaeELyHgQ4N7fnoIO3ekcH5B6/lqJAikcUKEaNgmWkchUwCLyNQ+vnOb0ZJo1+D7QXBPOVH1rHvYdJp5G7ICXbYlDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CH3PR11MB8187.namprd11.prod.outlook.com (2603:10b6:610:160::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 17:25:48 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 17:25:48 +0000
Message-ID: <affc5417-7074-41af-a01c-923fc31f53bf@intel.com>
Date: Wed, 12 Aug 2026 10:25:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
To: Richard Cheng <icheng@nvidia.com>, <tony.luck@intel.com>, <x86@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <newtonl@nvidia.com>,
	<kristinc@nvidia.com>, <kobak@nvidia.com>, <kaihengf@nvidia.com>,
	<fenghuay@nvidia.com>, <ltrager@nvidia.com>
References: <20260722035943.32337-1-icheng@nvidia.com>
 <20260722035943.32337-3-icheng@nvidia.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260722035943.32337-3-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:303:8c::30) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CH3PR11MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: 42fe35a8-621f-42d0-57b4-08def896c01c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|7416014|6133799003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5/yAd0i0/xHS6vnumP0ZTY+Xgn+xLX2bKEtUYUZmJag7CNgMx1C2d/BIO0UMLKZjf1/kLfiOlCh68hfbwK4kaOvyZ18kD3MfLCnacd0c4vUSwc3qcIzf8mExca4RoJ/RDhFSDj6T/8ehiCuJfD04G9AbT3nUJAQDTR/D1AOdWFgl1n0fMbUjmV6aDO3GAuvPwk+kq+w/Uv8ZjA8c+y5vZb5/js0aaCMGA4y8VxJ/O0FsSIyTBqI7dtySXqJuvcN6nZ5mCdA77jpsVRWibg0AEbWCYTBWwB+8at97q/e2KDDFbuV4D+rMZ2pW5MSzCe0SOKj1kjCCz5AiW3Y8TBFdl9M5jKpFCIa0fdwR98ogRs+TARX/skOZNiJsPZZcfPaMFoO+DxgrtW+pDfdm6m80sKwY9qiOWhqXJZroEnkvHiUi2POvWWNEYzkpKQ1Q1I5KH+Q9S+488KJaOaEf0dQw32nFaOGQ7HTf03ZR4yrKoAM+n+7XUvd4aoue7UYKzoo0AHjDy8KMt60cEio7R+Sa5ggNTQp0eIkncE4emRIC01XrZKLr/KsxsKlhLW6H+6OdpvDyRQ4ySAt6B4yYtiyNOk+UKckbodEG6d720tXVfUBF5wv5CnhmTa1IYRQKRUWFohxnOQXtL/QZ0wCKw2PB+l/x9dFOd0MU7SDqRgmZNvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(7416014)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REU3Sm50S1hrOGFKV2k4Rk85REdIQlhncmhaMXhKNVNnZkV2SWZjK2ljbzlF?=
 =?utf-8?B?M2RxTDlyWHBWOVBNOGgwRTZwZGFMS3V6NCt2NUwzQTRsNm5YcHY0eEhsb0Ew?=
 =?utf-8?B?Y05nREVIRzBTeExDU1VqNmxLYXFKMXhpblI3ODdmNjY1alRlT0M4NnJ3Ni80?=
 =?utf-8?B?TmVScHlSNU4zV1BRMFhmSE42SUdtSHEwcFZ1d2NtcHhXYzUrdmx6NngwdTAw?=
 =?utf-8?B?RzZoOUdybjdRVVg1K1ZzYW01eVZFOCtUQlRYcit5dGpEUlV3UjBnRkFlNW94?=
 =?utf-8?B?U0YzUWxFWnRpRVpqbERERnJoOHE4WjdTd2xxN21LWUxpQnJ5NkhiUUJtWmF4?=
 =?utf-8?B?SDhPdXZvSUxtWFJNMzdPVXF2cHZNVEVRTXduUndQeHY5WERxM1BxSVMvbXor?=
 =?utf-8?B?UFZWUGhaNkVMWm5iV1VMZGtNanVwUzdrdGd6MTFIQ2lqRnpCLzN5TGNDalVX?=
 =?utf-8?B?UDh6RS9EK2FGNFhEVVVmMkk5ckhPQjVtZlJiUldlcHpKL0xYL0pQbXp4aEVG?=
 =?utf-8?B?NDNYUHI3YitZUXNVeFRoSWgrdjVtWUtmR2V3K3IrN3FuWWVQd1JDaU5jUldJ?=
 =?utf-8?B?YzhYUTROQnpCbktBR1c2NVJzV0FaN1gvU2Nqc2prUytnUDNmeWgwdVlvU2hV?=
 =?utf-8?B?dDY3VEdqUzl3UVhiclgyT2VqZit2Slc0aEk4bklSUnpBTmtFdjExcTllZmhD?=
 =?utf-8?B?d1BWakZtcXNHS05qTFNZNlVLUlZFY2lVSXpRdm40WmVMdGRKeVlCSXE4VTYx?=
 =?utf-8?B?d202SnY3WXNmV0hhOU15MmoybTUxRmxNNlZrang0UjgyYzBLa1phVmhpdXla?=
 =?utf-8?B?N1lFU1Q0U0hsMmswcU03TjRwc2JseUpBNDlkOStERFZPZXhEN1hOdnZjM2hD?=
 =?utf-8?B?YjhoMTlZSWVsWlp6SGxnLzBod3RQQVBRTHVkbEphQjUrK0xuVjkyQWVWOTZp?=
 =?utf-8?B?TFM3SUZydnZ5VktsNVRrdkh3RmZXSlFIeTJGUGdxbm83bEZ6QzZORllwdG9t?=
 =?utf-8?B?ekl4UHUvL3U0V3g5bERYYkRNOGVuT25kRmFzMUQ5ZUhOT0taODRRYUlzUVYz?=
 =?utf-8?B?a1VVSFFjNlhpK2wzdmxUWGVrbFgwQnFmQ2xaVlhyTXdVQnVqcDZySlFZbnZp?=
 =?utf-8?B?aDlVWU4vZWptTmYzT29LVUJsUUl5Wm1WWERUNVpJdjNDaDFxU25jYU5wajRu?=
 =?utf-8?B?dDJTekdXYTRJbFJpRUV3UEhOUVIrZ0hDYUJpZSs2WHh2bDY3QnZ1NFZtRzVx?=
 =?utf-8?B?VzBwNnV2d0NUdEhiOEV1ZFNCL2lHYU9WdjNoSC8vMlU4S1UyUHhGbmJ1TWZX?=
 =?utf-8?B?cFdQMXZIYktIbWE1NStlcUpOUVdtN3N6UERkTmlaZjlYUExGL05la001TVEv?=
 =?utf-8?B?eXozY0hMMkw2aUFNbGlIVHdTTmtDK05sTUpzaTVCT1Fkd0wvSXIwRzB5ZDJq?=
 =?utf-8?B?cGMrMEZtdEtJcHNlSmNwVG1wbEZtVW5Qd2FvUXh2VTN2aWJ6dmRkTGZFOURj?=
 =?utf-8?B?dHJxRE9yelhiTTFKdTlSUnRkS1hHZTJRR21BMGZ0MnBKbUNPOTlQUVc0MDls?=
 =?utf-8?B?VW1OZGdtVi9xQmN3UjR1TmlNNWpsWWxUV3l4T1hUY2RHUnBnYXlZb3JLMHB1?=
 =?utf-8?B?ZEFzb2VLRWRMSUFHQkRyQ2RlTXR1L2xhOXZUN0xXLzF6bnFuaTZJUGtaMFcr?=
 =?utf-8?B?eEQ5ZnR1V3FYQ1daM2JLMlorNUZwUm55em44UjBRdUh0dkd1Y1Y5STM2YjVl?=
 =?utf-8?B?c3JpdVpROW1sN1ZJTnVpNm43ODJPaXFVUktyNDRXYWQzaSt5SEsxcUhBVnRN?=
 =?utf-8?B?bGQvMVBwN1hSc0h2QjkxbmJ2UW1zVmtRd2hZb2RrVDlyWDBIdmFWUjBxbVFR?=
 =?utf-8?B?bzlqQmh3c2hnRFJZVzNFM05nbVU3L0N3ZTdiUm5NZGJKZGRZMVByMExPSmZP?=
 =?utf-8?B?WFBYUFFUcWN5RXp1SnhHNjdnV0VHZUlYQWczMkw3blIzWFdNZ25IVGhrSnpn?=
 =?utf-8?B?TnB5QXBqd0tvTjlJV0JMWkZReXZLNFJ0Ymt4bnF5bnlTazVrbVNYSkM1K01r?=
 =?utf-8?B?eEN1djdydTFtTzhzejlkWERZRm1scS85VnBydlNlYi9kb2YxamFkZlVjNm9U?=
 =?utf-8?B?MGZsb3RKV3NQT3NKVDAwYWhsMXRiTFZLSFA2VGlsanMyWHhaRmIwaDFNSkti?=
 =?utf-8?B?S2YvQnpaRWFhWWVlTVdBajkxNXRIZk1ySjc3RXJIRWJBM0JYK2JiMEZvOUdm?=
 =?utf-8?B?TDRFcElzalhualRzc25VMFVHdnZHcjNxNmIvQ3FjVGt6b1Yxdjl5T1p2cVov?=
 =?utf-8?B?M1NETDFLVWRTTUVaOFFSMU1OZE0zemhlQlB1ZW5jNkFhRCt6NmZFbS81Uy92?=
 =?utf-8?Q?DNbFsVf0atIRtZUY=3D?=
X-Exchange-RoutingPolicyChecked: NVuuvgqFm6SDGzzBv7STJObEu/2xSOb0apKaKH8ZI1B987YqP0prOS/UVZ17Wv6mb6f0gXzXglh/zqqf+zha6xA7ylvp/jcsqZGCABLI5Ne8f+uG/KWWlqvwEF8rJtK78Wb2GCyNZpNPlMp1Kfe4PJViy1Gxl2O85ZUD1t1PQUbXDQiYBSsxkTFj/QsWvdbHKPqp5uzdXR7POwexIsgBig6x4AVwg8KglXpjFl3icuUIEmSVoB+H3vBT3HhPC1LGiMRJrHO9XE+HiwkZIBafyzTML9YPJnSMkpXQ1OgkzeBLEsNa1Ajs9y6s061t0EKkYx4PFakISpJj/gifoCiO3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fe35a8-621f-42d0-57b4-08def896c01c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 17:25:48.6784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXV39fuX8562sE8477/dAZwIqawqd9C9JSINWRJnbVsbsLPf1qGlFJIS9zEowOq8bvkCotTAeOP3EYTWBRSb3PuYQRsIT0M5kGvFysrfYwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8187
X-OriginatorOrg: intel.com

Hi Everybody,

Could the resctrl Arm folks please consider this patch?

Thank you very much.

Reinette

On 7/21/26 8:59 PM, Richard Cheng wrote:
> cl_flush() and sb() compile to empty functions on aarch64, making
> mem_flush() a silent no-op and leaving CMT/CAT tests operating on
> unflushed state.
> 
> Add "dsb sy" for sb(), ARM requires a DSB whose access type covers both
> loads and stores.
> 
> For cl_flush(), "dc civac" only reaches the Point of Coherency, on
> ARM MPAM systems the SLC lies past the PoC and may be a NOP on coherent
> platforms. Instead, dirty each cacheline with a store so that
> mem_flush's full-buffer sweep evicts lines from the SLC via LRU
> pressure.
> 
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
> Changes since v3:
>   - cl_flush(): replace "dc civac" with a dirty store. dc civac only
>     cleans to the Point of Coherency, so it does not reach the SLC
>     where MPAM cache portions are enforced. Rely on LRU eviction from
>     mem_flush()'s full-buffer sweep instead.
> 
>  tools/testing/selftests/resctrl/fill_buf.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
> index b9fa7968cd6e..eae0262fe265 100644
> --- a/tools/testing/selftests/resctrl/fill_buf.c
> +++ b/tools/testing/selftests/resctrl/fill_buf.c
> @@ -27,6 +27,9 @@ static void sb(void)
>  #if defined(__i386) || defined(__x86_64)
>  	asm volatile("sfence\n\t"
>  		     : : : "memory");
> +#elif defined(__aarch64__)
> +	asm volatile("dsb sy\n\t"
> +		     : : : "memory");
>  #endif
>  }
>  
> @@ -35,6 +38,14 @@ static void cl_flush(void *p)
>  #if defined(__i386) || defined(__x86_64)
>  	asm volatile("clflush (%0)\n\t"
>  		     : : "r"(p) : "memory");
> +#elif defined(__aarch64__)
> +	/*
> +	 * Dirty the cache line with a store. As mem_flush() sweeps
> +	 * the full test buffer (sized larger than the SLC), cache pressure
> +	 * evicts lines from the SLC via LRU replacement.
> +	 */
> +	asm volatile("strb wzr, [%0]\n\t"
> +		     : : "r"(p) : "memory");
>  #endif
>  }
>  

