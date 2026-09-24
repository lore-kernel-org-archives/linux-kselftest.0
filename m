Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5704E379B
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 21:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286875; cv=fail; b=Cgi3bubiZMZluAsWQrSlSQaKlvxk6v9+WOWNtTPHKJlYxnLsQWf2Uz2Jcgc2Gki2l3076kLjpQv6PEsA9kJ7JUKzuQWnMfNNJAEUEFJ9NUPYrPyKolmssN7rcs7iX0/+xvP8RvvxHaJMfj6TTr3t8G1Vf6VZCtXQVuAAVqx4wNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286875; c=relaxed/simple;
	bh=j/X57+2iexllK+on6QgGdJqsxzTH2Ljg63Uvx8mNKy8=;
	h=Message-ID:Date:From:Subject:To:CC:Content-Type:MIME-Version; b=mzQpz9HIlvdSlqCad1X8RxJfBcRV7QLL3eCEZ3W512ZNUpiWrEzLp2ZexOatgRVuJIHHE/Cg80JiBUFW+QKHEV6vTPH4RGxQuklb4CEdZa0t64RnItrMAgg5lOTNpBsQaHdQPwO7tHvophQy8PN7ELPArZytDJ7RdAkSn7CM6UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIvATu1P; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIvATu1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790286874; x=1821822874;
  h=message-id:date:from:subject:to:cc:
   content-transfer-encoding:mime-version;
  bh=j/X57+2iexllK+on6QgGdJqsxzTH2Ljg63Uvx8mNKy8=;
  b=NIvATu1PF2itJJrdJNxVlSDpPbWANaCmvmVwXo8lE11eA9MhquxSC5uy
   ycxNDOWlOQauvDWkFmMypF9W+S2Rue1OxJrLqlZ97W9CvABTSveCYZCXc
   Hi5rXkfD4vBixtKDTT50I7WnO4hNH7AeV0ZECLVRJ+yQhF9Y6Gra6Yr47
   9XwAZCaNzLkpc7uWt4Ib56XGYPamjYLnmm+zJINWdg53dCGoI0yzWTQdb
   8H1ELWzwocT72G8F4TPNtHKYqWrbhB+Or+9H2WhNizozri9qZqgqzA08v
   n6lu3XUfBnu9N5sspw/ic4/cShcZbS5hdbdGQI+rHhMI9ba6Kwb9Q5RQP
   g==;
X-CSE-ConnectionGUID: C5j3zmJZRxKicazqHfzWjA==
X-CSE-MsgGUID: J2Picw87QXCtQSkA+J8w2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89936094"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="89936094"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:54:33 -0700
X-CSE-ConnectionGUID: TbqxjiCOSj6KUIxv6QQ0Yg==
X-CSE-MsgGUID: AOgXWQiBSyChdTtoPksNVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272742104"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:54:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 14:54:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 14:54:32 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 14:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHOw+R4gikkOg/8S8nDFIG+Wgx5CEIY+aohQ20XHf7pgVXSUsWaRQ2MB6n3JnKx3+ZncQqnyvRDjmVMZPSdTMBfU/vtbdDx7GI71AsjN0zrDfZqyxZY5z6DrZ+yln+mWnbA7klV6w6rkiW4dykP1+p0snDSOyO40VUJJsK1/LY5S/c0S8Zz4wStf8unhZMIJ3CZQ861+q5vvdmqLjh12pCI3q8NIvF1SKkZyIkt9yZ4uvRPSZMgzkD5SvJVjrfN+NHxLr4W79jjzCDB9nE29NPRIVedAo7kJ/fFnqdAWHJ9r5FjT5PXttQWknxxT8YfsPyYqQCr0yGp3lUXpCizLGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Evs9dyNpwItvl4bdHgYrP+EmMuS37KoACM7rgLdevME=;
 b=f8NzX2xev5Uvxkcn6ofXwCr6nknXhkeeUw1o0wi9A/Gw9MTP+6zNzkFyk0mJVQjcl4h7PMYglAxZBoo6pDpBozMQKDX6aX/4wuhu+DZDjkt91KUoEvtFGgrLyk73Z0N5SzLhKyIGR/A0N1993DQMgHJWSce58ew0BJnLm5Jc9kTi5vGaIEhU152gtDAgrX0RCEcGxIOndHVIO1njK9If380PAfYjEdGE+3lTT3RAZndtBCkUulhryYyBm9Lbkko5z/WQiGkc2CgGQ/4LuN0yY10xiyBNUHjfhoHvASRlrMyYsdRcX3wqvyD5aPJYuFAlzx82v56PdpunqCALgS+RCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by LV3PR11MB8555.namprd11.prod.outlook.com (2603:10b6:408:1b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 21:54:29 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 21:54:29 +0000
Message-ID: <92c35a79-1c8c-4543-8fa0-0ab78b05faae@intel.com>
Date: Thu, 24 Sep 2026 14:54:28 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
Subject: resctrl selftest patches ready for kselftest "next"
To: Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::11) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|LV3PR11MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: 2decfdef-a1a2-4f30-c435-08df1a86688b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: rVPgAm3OQlWH4NwCeNKdmTyUyT6yH/BXPWun9/8wq2CzvfaQOJqKiRQRX4/0zq3IK3NPNvZ6v06LLRf6hh8LjcVDE9lzLCrx31lUTWYDTEUWJ4Lo1bvOBuPMJQeR6NoK+9ESeLeo5tcWop+uJfx7lcPOxCp82azFmktcEVYM4TMt7Vko3/qyGw5bENwvm1rv5jS2BGTzj67tTJzJjdtddM+zw0oQysP1xfMJAowpAKHpevDo9pKVkDxgL3d3aTa2O6lBuQF19rXBNOmygiQk9KuXbuc+BPf7FhRbJFrOtHOGd2ULoQfHw+lmmc/A6hB5H0ROrm4D2VrUYpf1nai++n6NVrbPJBPF8zQEybNZvQBdHYIdrp7/KyghIWPf8+z55nSTwZscyzzbg4uv38z+CgYWvEA8vQcVvHXYCYLkHSekDmXKhMPcH7r8edFc8Zg9gqfsb5MSnfFzlFzQqhLOsz6VhbFI4JfEVlzvx8k69m1U/uPY6qN04+5z4yWFxzXiotYpWxYCDE2AjR+LwAPyP9yuav2FBo9Tfm+54u0f1WMdlDoWx6QlyTv92t6DZgcaEq0TphF1czJnAzLxl1cZH8pAfSrLq3W+YiAs/miT+DbHSgEnkoJXbJ7/BuDSKGHfZY28LzC3pc9mp/W4PlvXvXe+FvgXq4UOtJzmAotY/NM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVZzVlRHSU5odXZvaDU1TG1MMnBrUXgxL2l5Sy9VWUlEVWtoSjVCbU1yU2o5?=
 =?utf-8?B?M0w5OE1xdzA4VjJOaXZzR3czMTVNcjFsWkt6OCsrcGpoUjJlczg3THBWZ2dl?=
 =?utf-8?B?WWF5OTYvRFhFUEFwam1UcHUxZEhJbkNLYWVwc0E5SGE3ZWdkeTc0N3VtSUVY?=
 =?utf-8?B?YjhvN0RoREI1RW9MYkFpL2QzS0VITmhlTlRpeXpuSXVtM0JnMWkwY0R3MmVD?=
 =?utf-8?B?VjF1TFZiUklMbjVURFNZSUJyOEUvTmpnbzBQQTJVTzN4Y014R0lmMEFhQ2NF?=
 =?utf-8?B?aUZpcmZMZ055SXFOSks2YXpNZVZORzNVYzlqT2hPeFRGU2NSdXFQZVBxM0Y4?=
 =?utf-8?B?Q1NEYTV0RUxkMnU4TDc5NVE0UlV1VEVFanh1ZTZoaXRPQnVpK1Z1SFVnQnEw?=
 =?utf-8?B?dnVjVklJNWh2eXdpVHlpaWYxWUZNWFpKL3lWYmVENGg2UWV3UUxQRG5yL2Z6?=
 =?utf-8?B?VFpLemlxSTJDdks5V2E1VHBqKzd2NG9OR3RkV2hiQnQ2OVBqbzBXdit6ZzVU?=
 =?utf-8?B?YjFFWDEwbWVLTTdkb3B0aklaZDlTL3ZTNWZhZm9iR05ubGs1eUw1VnZaYXZ1?=
 =?utf-8?B?aVpvWmQ0VUpKaHMzSTdOR3VUSkViOTBFbld2Sjl2azNzdmgyYW94cGI4TW9s?=
 =?utf-8?B?V3hORjhzWlF4dmZrU0pXWFpQazF4YTY0bi9NK0tac3NXRVVXTEhlc2E2MEhO?=
 =?utf-8?B?eTl6V3Fac3N4aUQyUVNhSWZzVlF3WFlyczA4VVhkb1N0L0hQZnpyK2JQM2ts?=
 =?utf-8?B?TW4rdWxmRDJsbGRJODlGdWYwbmdHbURRcXFKOHBJMDgvcnJxWmJuU0VPWEw1?=
 =?utf-8?B?OEswUUgxZnVSbXVPRm1vZ2phRWRFMXVqaGdOV0trZzJXWmxmY1h2UGRGaTI3?=
 =?utf-8?B?eEpGbDNYYW9maDJlN3hTdmZXRUxFNGJqd3hTVXY5K1VWdWRUUStFVUM0dFlO?=
 =?utf-8?B?YUJkT3UrNlhRRjJkZXIwLzc2OFpKMDU3b1N5bFJocy9QZ1lkV0Z1SGFJdHBN?=
 =?utf-8?B?UmRiQWVhSmZJTTEvK2Z4YjBGRkN2SkZ5ZVA5amhrWmRiQVhvUnhaZEkwbE9O?=
 =?utf-8?B?am8vV3ozd2FlNGZad3p1ZXdvL1RFY3pQcjVHaGJUQVJSVUVla250bzZDSGQw?=
 =?utf-8?B?bUplWU1YTFNKSXZnNlV5K05XaTVuOStkY1ZPRFRRTnA0YUNkV0ZPd3VVNTB1?=
 =?utf-8?B?bW5rYkEzYitQYnRlTmVJd05uQzMyVHN1Q2VSMFRudTNnT2xRcndOOER3TU5w?=
 =?utf-8?B?QmZ6TXdGR01UQ0R5NHUxZWlvTzF1NkFReVhCM05DbFJrVXNhdnNvWlBoSEcr?=
 =?utf-8?B?ZzU0L3VOYkMrblhLVk0vNndBWC9LQ2Vhem9udS9JY0hVb2ZtMXI4YWxLb3Bl?=
 =?utf-8?B?am5Dc3hHcXNnbmwxekFhVEVXRkwvckNycmNCZXBSYmdVeDBOb1VacDJINkd4?=
 =?utf-8?B?RzNWNFVWcUJBNytSVkJQMEJZNFEwRGhYaTRTMlQwNFlKZU1ULzh2cFgzWjBB?=
 =?utf-8?B?VHAwelF0T2VBbTQ2d0NXOEVtTU1HbzdQczQyN3N6Y0UxM2thYStWQzFSS3hs?=
 =?utf-8?B?LzBCM1oyVlhVd0l3L213Tlp2K1ZnWndwWDhwMGE3WHpQaHBoZTVkQmdrNWFB?=
 =?utf-8?B?c2tzMUY5aTNFWjVEN0Vzc3pLbzZnSS8wQmlJUzBkbEhmTnc4N3pSNDBId09O?=
 =?utf-8?B?cXVBbTlQNTJwc2hHWnNNVnFqS3J5c1JOOGg1SXN2bXdUY29nTWhHWU9PYXBW?=
 =?utf-8?B?cHV4T00xZCtOc2NSdW5Gcm9KZVl0RUtVTXBhZ3BZeUlIb21SaGNFTURucERT?=
 =?utf-8?B?VWhxaGIrZDBKd2NZM3p0cXE4N1pZTDVCVU9LcU1VYi9IR1FpUlpBZ0RNcUc0?=
 =?utf-8?B?WU9neW5sNThJUlJBdWpjTnRHancxa2hxNVNwbFhMcGp6VCtBRVd0Znp6U3M5?=
 =?utf-8?B?WklPb3gxZjRzZlFhVmdZalB1ZHB6elpzY1VwYVpWVnhoalYrb0d0Y3JDQ2Mv?=
 =?utf-8?B?eXBKQkRGTnBsVzA2WWFXbnhvd0hESWRiNmhFN2Zqa3ZZbGxEWmQ5MVlXelVo?=
 =?utf-8?B?QmQzb0JhOTYzeTRSYktKSWo4NDNsMWxRZGVwUzNkTTJ0UlJCNmFPeUlRZjJF?=
 =?utf-8?B?dS9RaUFNc3RpdkJ6R2dNL2lWT21iMnpUVW5LTENuUDN5RzhPcXh5MFFFeitj?=
 =?utf-8?B?bkJtRC8xc0gwY1R0WHU0TjQzRW16emxoZyt4NlBqcHVNWGtPdWJEOW84Qkov?=
 =?utf-8?B?WXVZcGJORnZ1ZjM3MjBYeElpTVFaYnhTaVV5aG5tZVphL2JvdEs0RnNSaklG?=
 =?utf-8?B?bXJIZ1lpL3liTVVnMUl0R0UvVVQzY0NZNyt3QklHNUIwbnlKV0wxT2RGcnAv?=
 =?utf-8?Q?HF/ZAufKPDEyFZxY=3D?=
X-Exchange-RoutingPolicyChecked: tOXGWrwMSajXnwrz4OGr31DUK/IThjs1+F/IdE7W6FfA3PfjTD7Fx7ln7TmCEp5yf7OcHbC7jrQHSdx/fAhaS05ds4kbC4nPfvBC0Wc1hsjpQL1RQoKuCHWzmQW2y0wT+92eSNK3QHxs1dTFCNJgFBgZY0iQSFUlu1zjxEml5IFuSIRw4gMAuaKn8Sm7De/dlezJ/AlJ3QlI0PcfWk9twSN99JAiwI9V+64zS9Vc/rnaVLtQgdA5GDJkAKTLcRglLP2mfcVtiydAqvIZpdLK/4BQ90do9os5uHbkxfoJke8U9PFda0eKnjMJptG/cCBfRgWuxwuTllHPVEc102X3HA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2decfdef-a1a2-4f30-c435-08df1a86688b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 21:54:29.3544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzMaja7HrXvQQQGcZ9mwqrvSAZC/vtLbRGs0ZLIM8ytJtNItd10VNxnMsDgwBs3CNW9B9xHMogCFQ830JNdKT3tCJrUq1J7uSdxrr2th1eU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8555
X-OriginatorOrg: intel.com

Hi Shuah,

There are a couple of resctrl selftest patches that are ready for inclusion:

"selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists"
	https://lore.kernel.org/lkml/20260821003908.12977-1-icheng@nvidia.com/

"selftests/resctrl: Add dynamic linked list management for IMC counters"
	https://lore.kernel.org/lkml/20260801092429.533956-1-wuyifan50@huawei.com/

Is there perhaps still time for them to be considered for inclusion into kselftest's
"next" with the goal to be merged during the next merge window?

Thank you very much.

Reinette

