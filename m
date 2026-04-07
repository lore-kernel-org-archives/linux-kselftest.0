Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82891379EE8;
	Tue,  7 Apr 2026 19:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591538; cv=fail; b=P1v7/tOLe7TKNVle8ps78RhUZnRoRyQmRbncTT7DTDndXc46HAnsyKYuoqDRRMWOAmVxQOQvZzRmiOAZn6T+u6fh80MSE6VUlHK5YxVewlFuz/K7hY0JkV5fJAfr7bNCfTHTdUG8RoUfGLseT7xbmc9hrYoIsuo+rvvPJ7uMH8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591538; c=relaxed/simple;
	bh=OnYtR6nksYlhh5p9rkz+IXiFYgjmSgYSThV1iXGskEg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JVposFSVfv6GwIpLVlnO8zl5FST9mXzIQ9N5eiyyWS9NPd3oRaJXtpw9GDlNMl1GJLp1dnDpfdvWiL9Z8CgNLuJe+tmPhD2FOs2LDmHXhPITgfl3/f+530f8WqMz06Rh3YxaI2EFPjyQ4Xu740JcPeHiPdrX8GdFzVirYjY+KEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g35jJBfj; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g35jJBfj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775591536; x=1807127536;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OnYtR6nksYlhh5p9rkz+IXiFYgjmSgYSThV1iXGskEg=;
  b=g35jJBfj5PlvlDXeqDYrlqoW7BmKv6//hGe0rvQP0bITPJsptIfAZO8Z
   3YWaWcY42foz7zxO8lQytFQ+IZYKM7aGe8rUukDfoRyVph8fDoiNLhVi9
   L3OlGph439XxOX35eX+vHrY2bwbSNQZH66ZlSrou24vWSwcSPOfQgK0ex
   VXaFPd/lRhAxmdTnb9+HNGOG0aUj4MEQOz/nRTb7Q6hZk1KXn+oUUzyPA
   p4gYnvhR/GbKW8CxllwllszXbjrLM2R/S5dwEs5Dgb8C5mxmU1TKme3G0
   Rug9D+R7oVey+xJcyCGzM7aOu5cRFM5Wd8LN0fhnOCtVLrTx6JCkQEkQ3
   A==;
X-CSE-ConnectionGUID: PqvuoAV2Tk610YLJ2ODCiw==
X-CSE-MsgGUID: Ph/+P/H0RPOuwE0BCaBgnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="88017560"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="88017560"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 12:52:16 -0700
X-CSE-ConnectionGUID: plf3/aMkSMWlsB7FYCV/7A==
X-CSE-MsgGUID: xfsnJTA+SNCtkx9DhB2G8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="227245333"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 12:52:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 12:52:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 12:52:14 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 12:52:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S179B/KSmigPvuH73tP7NsywkHE0n3EON1i4SSP4nsJvFnflXsdjPi9oKtUUmEwmEDWOH+34RTP3iy7LPq+hl/blw8HlN/LjrVJLJ3afeop+SraFSc9Ei5ocdu+c319ATtgcndXdvCpLoRCrgIlNEZkNJfSbb0QII4dNHLn8OrCUhiS22lQ/pxVEWSfxBaZFWO3KTbcWeSa2iTOaOdxRwFxtdC9Ud5dJgRKVsbFX8opjRA7vTpcctn3hi7ybC1gwJkv1HtahK+rIxl0xjR1KLlTqF7r8TdgVdBREOIkjsyR8NHQIzYjEtqv3PUuUe3BlLy+kFKu8N35P4J4mv/gGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXpP9QzkaM3bRtkztIoZoPjcda8UaDWn+cFNm/RKuiU=;
 b=UTDSlhiV+UPCnm+mZaKDjO40r3sfHIPDoA/bY5Ph9MOnUkHg9ZK6nXIOh9/wRVU6JvFLZ/HWD1ZEubminFxXaPZgaUchJUt+68PCMr0+Oz+CXWlfsZo9iV1KfnxqYpNxKgvMSazGEx+ko6MX2U+xTUn9JqIyMoUF/8nr9pUhVo6Lq08HAYdz2KswRpu1cFE2fdeekaAqOTm4Qo1IZ2YYQ2zT07iaEi5CCjdTffbvWZ0wAD48s/e7GKxjHiSt04vvcu52DqHPTmbccvJph8LVLnLIfqHC1njCa7n9I3sdRI8kAv43RDmXLJ752J+BbauulYfINWcm9utirao98eFBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by BL3PR11MB6531.namprd11.prod.outlook.com (2603:10b6:208:38e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 19:52:10 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 19:52:10 +0000
Message-ID: <9580a35f-afa4-41a6-b53c-1f16033cea7f@intel.com>
Date: Tue, 7 Apr 2026 12:52:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] x86/process: Shorten the default LAM tag width
Content-Language: en-US
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
CC: <x86@kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
	<houwenlong.hwl@antgroup.com>, <dave.hansen@linux.intel.com>,
	<ryan.roberts@arm.com>, <nick.desaulniers+lkml@gmail.com>, <bp@alien8.de>,
	<will@kernel.org>, <maciej.wieczor-retman@intel.com>, <david@kernel.org>,
	<nathan@kernel.org>, <justinstitt@google.com>, <seanjc@google.com>,
	<perry.yuan@amd.com>, <oleg@redhat.com>, <tglx@kernel.org>, <hpa@zytor.com>,
	<james.morse@arm.com>, <mingo@redhat.com>, <akpm@linux-foundation.org>,
	<jgross@suse.com>, <peterz@infradead.org>, <morbo@google.com>,
	<ilpo.jarvinen@linux.intel.com>, <xin@zytor.com>, <shuah@kernel.org>
References: <cover.1775581451.git.m.wieczorretman@pm.me>
 <bf872c3f7591dc7580679e35b343b08534be2d5a.1775581451.git.m.wieczorretman@pm.me>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <bf872c3f7591dc7580679e35b343b08534be2d5a.1775581451.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0198.namprd05.prod.outlook.com
 (2603:10b6:a03:330::23) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|BL3PR11MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 29564d17-cb57-4cd4-a75c-08de94df281d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: vO5q3LdnZXF3bA1m8a7h2U8yw6iQRScaDBKrr2mCl/pizbX5/vm0niyefaCpuOG3qmyd1X3Teo9DjrBwkTeS/VmycmogcRnrYOjGlduzN1G9+JjYyjLDlzjuVnxlpTp2FPt7J2XG3z4p3/x4A9xnrM7T5R3wjDacA5IXgRd5fyu7P/NmOntWeAizQ0Sk4G6jTWx0Sm2yw4/kxt1G3sN/IVtaeV0+MEKZAt8s+bwgJQWKhXcXbUgZ/qx2So6G5IK3dDd9T1Q3kDDtGLgkBnkF8+gqtm2XL43kP7/odAdIU/nvCrba82kBok4hfdrObIatv3Dgc+wnB56iH3WsU4HJ7lCfCltarPFG23AkjchUOx+bL8/QzLZUKSulZ1JNogAP6g+lDte5TetCcZ2btVinRbP8/VNEpWiVUidJsTf6Lfbzs6QHe5NfV1VVooTPeKNvBvXU5UvemQ9LVkO9DLY1fT2NTR7/3RYn+UfRMppwnSYOIAw6YkM4ca8MWm5q5q/Pz1ijf+zjH5+vJyfsGyzTiYo5nKkoLOTTFGUWL9DpAF0PxjemadNOVik6jKHg1BK4zq8FSSEb3OHXuhA3uVW3/DXEPYBjKQ3Di+c78ROhYklDLEtoxaTPeTHQOlCEIncue/7GnI8QFw7wwlOr7NlfajtteGtoCOdPruamogvRCQ/VmKtVkim6TLARuPMf9p6nQHKWabIhYYI6h1xvvszzBDLbWNHCVFVoM0MvMj4Far4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2tpN0c4YVFmT2FpTTg2ai9QSFhVYnZTRDA2ckpwQVVYU1JFMFdyaURsSzdp?=
 =?utf-8?B?bTVmSHZLUDlaMGdqcmMxQTNLNmhQaXFKVlN5V1prSW9mYmlxeGJqcWxjRUV4?=
 =?utf-8?B?WEUvUG9LRm1CTWNNTTY5VTJaWXhlMDdQNCtQa3o5ZGtDUkxkdEk4MXcwZlV5?=
 =?utf-8?B?WDJaekJlVHAyVFpKbTdBeUNlRnRMN2hWZTd0TUY5TTNoYzZzUVI0aGFJZzU3?=
 =?utf-8?B?b2tDNFRoRm1RajYwTjBvcFJtU1RRSWhESFdJVEt1Q09USEFJdEFtamEzWk9a?=
 =?utf-8?B?R2xDOEpzczdyNWJ0ZVNuZUFEZGhKTVN3eC80TUo0MmFOQ1MvQXFCeG55dzJF?=
 =?utf-8?B?c1pKMmttTllESGRXYXE4TC9SbzZqbmtoSENxUXFRMFJFUm1rRXBBcTI1SVNM?=
 =?utf-8?B?OUJHeWs4K2F4NTZOZjllUDZnMmpUaVY1dEVTdTdBZldndnk2ZHlKK1A4Z2tO?=
 =?utf-8?B?YjFjV0dweDdwSVlIU1FqT3VBQnROY1MvRDVyYkpXdUM5M2V4NGh6NnBWRjUy?=
 =?utf-8?B?T1MvZjB6S1lkRkE0NVNuZ2hmM1FyQXdVaUVDTjh5WWFzWTBhZFNHaHVYSXRT?=
 =?utf-8?B?VTRHODNacXpiUi9LUUpQQ3BtQndKdWRuVG1sN2M5Q28yNnZzZUNwa0Q0UkNv?=
 =?utf-8?B?bnpjYk9YN0ZvZlhSc0JDdWNlaS9Iakczc0orb1BkMGZLUUsxdEFCSFFFWFpy?=
 =?utf-8?B?SEd2aEIrY2tCK0FuM0NRTFFFWGE3OVB5YmMwRE5NRTJ3azJ4cDlCS09mSkg2?=
 =?utf-8?B?TUlLRXRvb2N3L0hmYWFNSDB5aHhDR2ltRHRpZGZRQk9GampKbmZ1RjRETmFM?=
 =?utf-8?B?V2ViaVVIbW1nc295R3JFT2grWGdpcm5zaURCcDA1N3MzUklpSVVySlh3K0JU?=
 =?utf-8?B?YWpKNHFDTGJPSWRYejFCNnhqUElUUjhXRHc3cllCNjZjZXFRMDZqWGZkbVdn?=
 =?utf-8?B?Q0U3ZHd5ZzdvRGJqcjJMN2hiVVlvUXVFL1JlOGc2bGVTNEUzNlpKREF3cFBh?=
 =?utf-8?B?WFk1UTY2cnc4MUNVaklpWGxTMVg5R0xpNVRBbXIzaENKUXBlVm95dmlhVE9X?=
 =?utf-8?B?bTlObkkwZkFCdHRPY09WbFFud3ZhcTF6aXE4NWVCVFp5UkJhRWVjZkNlWE44?=
 =?utf-8?B?dDVPZHlVU1pzZVhldjVLWUNhVk1pV1dQMm5vSGpoenluYmpNUmliTDZ3M0Ro?=
 =?utf-8?B?TE5CTm5taUlhMDFkdXFCY2U5Ymhkdlo4WGZKcW1yWEdnOVYvTTFNamgxVGgr?=
 =?utf-8?B?TWV0cUZXNUxpWEJoT28rdFc1ZFZZNGhRblBUR09MeUZCWi9kT3kzRFZLeHdO?=
 =?utf-8?B?WWJDTXZGRU1VcmREeldtemFkWVVidzk0Vk03ejdHRnV0bFNKVlhzNzlTWTdt?=
 =?utf-8?B?aUFaelY2WXd1TWg0MnlJYU53VG5HOXdPamEyU0JDVzF5VnQydjJ4T01lWEVa?=
 =?utf-8?B?cll1eWRxSld5d0NILzFmMUtKWkIvK0xpYi91UUV5YjdIazJXTlVFY1QyVHJW?=
 =?utf-8?B?RnlxZjZIMHQ3VEJ1d0F0ekJqeDRReVYvU3NSSThESHZlSFdic1R5QzZoUVVH?=
 =?utf-8?B?NUtDV1AzZVhETkJvanJiZ3ZoWjdXNTcwb3dSd1NnclZGSjZiVDlTM2pXT1po?=
 =?utf-8?B?bDRvNFI3cTdkdHpWdnZoaWxDMDV5Mit2WFczdEppSm1kNVkyMmpYUDMybEov?=
 =?utf-8?B?VUQxV2Z3QkRVMkVpWTBWb0ZicEhyNHpsSW9ZSVVWWVduNEFzZFlNdmkxTWtr?=
 =?utf-8?B?cmxsaGR2WWJWT3BZWjF6RmFjejBkVmNxZ2RjaElZcklmU2tyUlVVelA1dlB2?=
 =?utf-8?B?bUtaWGlqUjVwK0xyejl0UlpzaWtGdzJ6YnhobDJmQnl6amI3VlVBSy9pbng4?=
 =?utf-8?B?TXdvemFxZXlTbnRNaklKcXo0bDBXT21SY2xuaFE1Qk9lYkxQZ2JkZXpHNTFh?=
 =?utf-8?B?Nys3aGZHODVmTDdVYjl1OGpLMmduRGl1azFiRmJNaDBuYVBRb2ZuVWk2VUFl?=
 =?utf-8?B?RTlDTlp6eW42QWViUUhBRi9yd2hzVXRkMFUvOVFVVmF4dFVDWjhGNllYM1FX?=
 =?utf-8?B?VjZsWXRaRHBGSjQzNlozdFUrZm83TExLUzEwWEY0U1JuR1BlUHRJWWRlcGVo?=
 =?utf-8?B?b1E0RmtObzFaNlFJb2pjM2RRU2poUEo1NU5KYWsrejJ5Rm9TNXZGR21HQWlV?=
 =?utf-8?B?RVZxaVduZTNpS3NEdDl5c2FnRXB6SHdwOVh0QXRpK1k3d3piUU1GbWs3YXNl?=
 =?utf-8?B?Zy94blNiVC83bjFSMmlITnVCNThtdEZIUFl4Vy9GMEZGdmVqQ2tTdG1TWjlP?=
 =?utf-8?B?RVlvK3I3RTdsL2FOMnRLa2JORjluZTkwYkZXSzFGQ3BmM0FuM1NBZz09?=
X-Exchange-RoutingPolicyChecked: gD2LhKg2LkXSS/LvJmX6h1UH4jCxx4HXrFXxkp2noTqwPF1UrRt9rTGwjs+dscBb+IacCOXa4BHNsaoQxZOLnz8ifn5qCdDxwPwBKWqZSv87qjXZjDe1qlpn1PluWfMiwXvtKiMocxrVKQbjXBqolm+n4cOb51UuVZDZO1JO9nVBIh4msIZ0XOikDoG48oJwwI4yh2f1qqhCx40q5yHtxkupcNKS4bG6mak/DUyWVfRU2h5/sh3ZaAS7/2blZlD72VSwZaS1rQN29SxfOqsFa03yzuQFh8K8D3dw+yxe4xU7esklncMUTI7SUbCSceQ/etfTX3yISFyz0UeyLG/eCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 29564d17-cb57-4cd4-a75c-08de94df281d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 19:52:10.6607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqJyxi2TbSr7SUNFZCxMhmc5j2qhrx/RXx5PZmrGqhyiLMsYTjIwjgp4rRUtRgNFepxddAbqpsDq/oUHFvLujA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6531
X-OriginatorOrg: intel.com

On 4/7/2026 10:45 AM, Maciej Wieczor-Retman wrote:

> diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
> index 08e72f429870..1a0e96835bbc 100644
> --- a/arch/x86/kernel/process_64.c
> +++ b/arch/x86/kernel/process_64.c
> @@ -797,7 +797,7 @@ static long prctl_map_vdso(const struct vdso_image *image, unsigned long addr)
>  
>  #ifdef CONFIG_ADDRESS_MASKING
>  
> -#define LAM_U57_BITS 6
> +#define LAM_DEFAULT_BITS	4
>  

As Dave mentioned earlier, the default wording makes it seem like this
can be configured. But that isn't true anymore, right?

How about naming this as LAM_TAG_BITS to match ARCH_GET_MAX_TAG_BITS?

>  static void enable_lam_func(void *__mm)
>  {
> @@ -814,7 +814,7 @@ static void enable_lam_func(void *__mm)
>  static void mm_enable_lam(struct mm_struct *mm)
>  {
>  	mm->context.lam_cr3_mask = X86_CR3_LAM_U57;
> -	mm->context.untag_mask =  ~GENMASK(62, 57);
> +	mm->context.untag_mask =  ~GENMASK(57 + LAM_DEFAULT_BITS - 1, 57);
>  

Also, would it be useful to calculate the LAM mask as a #define because
it might need to be reused later or copied over to the selftest (as in
patch 3)?


