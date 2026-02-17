Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DFE372B22;
	Tue, 17 Feb 2026 17:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771350787; cv=fail; b=SUURNRC2taXfzVPOkjiO368koU+w6rapl8wBOeHrfgKUXC9LCQWA8nVIak3NG0kv+4rQQPoxDXBo0JJyVgpFLMomtIvqe3syfz6ZbruBvDYzzs9BePFFpco+NCum8iz43NNp1YUYOOxTUtp7lg/iKdsE61lXPwN0o+MXYJVKj14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771350787; c=relaxed/simple;
	bh=tnDXv0yGZO4zAo1+I3iVr0T36OLd3SBOTxbUxNAtIpw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HL3anQVFpaKGVbzRKilKUVe5d78WuvyGcdXFdV3vTamiwmogBpC1wg9SgiApOr+hn4bn8fU9SfUYq1+JQxjtPAUXTawd69UVd0J9O6aP2QWnM7kiSdsWLAUiRQaGVcEdcER5jTx1ufXhURAel+YGJ61MdjvTtt3bE3Ka5UDrin0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EN0PDq/1; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EN0PDq/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771350786; x=1802886786;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tnDXv0yGZO4zAo1+I3iVr0T36OLd3SBOTxbUxNAtIpw=;
  b=EN0PDq/1T7dyLB4JyKDtKyzf/gWtd0j1gevilJFUmFa6qDt1z7fQcGcn
   FB77FVL2GU/1TnEZalnQRExKjUCe8+w+7JW7Y5DpFoGtWWKeWuFoxY5IN
   xQZUeVzuVhKAw+Pv1GpDNSRVZa2UuXWY80lkklePiIeaT2ZQNswvWQbrG
   GVWPZs1sPQFr+DbOi9KZ80gGfuO0K1p3iL/k5YNaBULFOYxDKQUZKp3Iu
   7QTJfuTztD6dM2ny0PKvotBRSkOALJMuGVPWIsjjZq9njB3D9nN/snL//
   xu0lxKO/2cxsLZ302Ha0hpv/WdS8+w2F3pFMY5CWJ04i3k1nhfxcMJKLp
   Q==;
X-CSE-ConnectionGUID: XbdGWT2OShaKewrROYP0HA==
X-CSE-MsgGUID: 3ekcVZLXTcO0WSDYqiykAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72472313"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72472313"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 09:53:06 -0800
X-CSE-ConnectionGUID: Tbi0rX73QTq+kHFHnzTzyw==
X-CSE-MsgGUID: bdsmFNqgR9Go9s56YHksrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213194404"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 09:53:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 09:53:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 09:53:05 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 09:53:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSqp6H7lRRn985/qLZ2jJ+5gqc/58i6pt7Fbdm5cFR4TakKUkxWZlr334DomCmCakLd6VhXKX40vjpBMEQ+Vbm/CcbAcwaD1Mwe6IxqJBj5D4TOAy0ipZyeec7MRTtN+d05WyHQGTE1OEjIzG1eMr24G4DMFmsG0vN+WG8P5Syds6O5/yF9B0SGsk/SjP8Q5Lx2siLFo3Vv7sGlxMzw7JK1KvU0/R4mE6vzQsLvcTqRa8WoErGBs49BSm4Xxj6daXqZS2DSr9JZy29FP16gb7PTsRv5VLpYtNGIxnMYEKtwef5me2k2m3mDQ8fKtRmmWlCmPvgn+BmWKfniQp2yHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5UsKlOUto95kAsXIWm3UnWMaOJ3A2BbnEl3w0Jh3Z0=;
 b=EHOtDahImeE926cIfz2XevTPv66daP0ImRH0k3Qpqy7KOdluO7s/g54Pkky/F0muO6rLOtrUJGIalBNnPvA9LartdlaJ57blDB3VK4N0775hEduq/kRZ8yJyznyuz5yG6cvPlFC2gNRp+xyGX65J6XA9PgETn1u+64gJHnMwPnDRcC2xxUfAmhqpVkGoiqnOAvvUvwPS2xhffG8Q7M5Q6xf1n898mVV9L+LsO2ryabfAdRqKUQc+2JLk5DswNOse9NaXspD/EsHcQSIalRL3mWvDMC4zNtpSHZwbcjNvGyiQN34TzWPPtTwQrgtlqGxby1Iivn28v45HGvnxCCZ0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA1PR11MB8831.namprd11.prod.outlook.com (2603:10b6:208:597::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 17:53:02 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 17:53:02 +0000
Message-ID: <1f076261-55f7-4dc9-ac58-1ed39763b323@intel.com>
Date: Tue, 17 Feb 2026 09:52:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] kselftests/resctrl: set shareable_mask to zero if
 all bits are shared between software and hardware
To: Shaopeng Tan <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <james.morse@arm.com>, <shuah@kernel.org>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
 <20260123044034.141247-5-tan.shaopeng@fujitsu.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260123044034.141247-5-tan.shaopeng@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0303.namprd04.prod.outlook.com
 (2603:10b6:303:82::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA1PR11MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c768a9-6904-4328-dc13-08de6e4d653f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWVRL281dTlleFYwZVFNR2F1Rmp1ZHRKZy8zNC9GczJmcGM0UlluWStlV2NF?=
 =?utf-8?B?Sy9DMzE5T0tkU3k2K2gwSVRRWmFpVXJ5WHU3M0lHODRmQjZ3QkZpRGF1S3lI?=
 =?utf-8?B?Sjl6UWVtcFpkWlhNRTBLNTRlVW5iQjFqS1c3MDcwSWNxUkRsdDdrd1d5TTE5?=
 =?utf-8?B?YWNjOHRYTU5tRnBUd1BUUEV6Q2pUZWs0M1FpU243ZnQvdUIyNS9yVlQyZmpQ?=
 =?utf-8?B?dDFTMnFYcGNvTDhaZ2YvYXJ0NTlTcmpKZWxQYmZ5c1lqNis4NzFlcXBaZGtz?=
 =?utf-8?B?NXZvRWtGd3ZoaHFvUkhIL2E4blUzb1VrcTUrMWFzYlpkUUI4ZHVjS2pxMXlB?=
 =?utf-8?B?WllXR1hNUytSeE1FK1RNemsyUTdGbDJLV0tQWEw0SnZxMDNsUzJwNkx6WUZp?=
 =?utf-8?B?U2RDQzhCY0hrMHNDdWJIOSs3MC9XMDA2RzAvaWVXaWZjNi82VWJjNDUzWXVn?=
 =?utf-8?B?R0FBV1VCZjNHQ1phR3oxUWFyWFMwZXR1bVh1MFhnQUh2SEZIY2NoYlBsSU9X?=
 =?utf-8?B?R2NaWUlEeE9rVG1ZSTFLaDc2aHUybGlJNUdyekJXL1p4SU0rbnRndGYxTnlx?=
 =?utf-8?B?bmRiYVFBVHN6bjNkSUVXVGgzNWEzR1o2RXlUZ2s4RHg2TVZZYnV1YUhNWWF2?=
 =?utf-8?B?aFNxM21sVXZwWWlGdUF0TTBaUkpzYnJ3L0l4dWJrZ1h6cHF2c3lZb282eWZu?=
 =?utf-8?B?cVZuYkh1MnBWcHI2YXlHUHBKcVZ0b0dmeEk3Q2pwUHoxKzBjbzFmczhMMFkz?=
 =?utf-8?B?SlNkWE8rWGNNemxscWtMUHVzL0E3ZTd1U3QvZWsxRFE3d1RJVzViUU0yY2pu?=
 =?utf-8?B?OXA3VjVIcU13YTJIR0RPRkMzQldzdmlwL2xzSjFaeWgvNFJOVURydjR4M3Y3?=
 =?utf-8?B?Y3l5RXpHU1NvUTVoY3FvTmlUckNvNE5GZVBsZmJ5VUE2bWFvd3NZZEtMQm9F?=
 =?utf-8?B?KytWaFhMU3d0OGR2UEUvemUrVmppVXRSU1dpNVZrMlVpYitsTEZMVkJBbXZj?=
 =?utf-8?B?NElzUjRMMmxXUkVjM3JtWXZQdTVKSHRwNHV0SHRFalp5Ry92Vzd4b2ZzZGli?=
 =?utf-8?B?VHorVEhKZGtlc09iS1poaGg2eHcrOXBicjFXRUxVMi9oZmxuVVRPRUpUTTVl?=
 =?utf-8?B?SFVrdWxaaVFqdjRHQ1NDQUlUZVYraG00UGxZSklqNCtKNXFUc3FHMkZwWTVP?=
 =?utf-8?B?NG9pbThOcW9KQkNrV202RUZ3V1l5RjEvb21MUTFaVXFWOERCZWJzYWJ5V0w4?=
 =?utf-8?B?ekhJOWhscGVnVjlXRlVGL3E0MW5BUG5tbDdCL2NIczE1blJuTlI2cjdBdGpu?=
 =?utf-8?B?cE5IWWJoYmp2TXMrK2FYanpCWllnOEhESlhSeGFRZC9MRjl0alJOVHp2dnpS?=
 =?utf-8?B?RTNXeTZKSldrVlNnZmpHZ2R5ZlhLN01lY3VQSWpUaGcxcmZ6ZUZxMmJVM2Ev?=
 =?utf-8?B?bGxJbUVJWGhvakExY3d3RVRIUUU4aTZyRWxnby9IRmowOHl3eEIzSFdrd205?=
 =?utf-8?B?KzB4TjhxdkpDdkduQWl5MFRVOUE2NDhzMEd3SGY5U1hiNGNrZkdHelhkUmFD?=
 =?utf-8?B?OXUzT2tRUnZmNVJMNTE5UUpWUk5lamJLL0RLMU1DUnBPRjhMMUg3OFE2WE1H?=
 =?utf-8?B?Vnh5Wjh3VWlDTEFZbWdyL3BMSURzTXAwSzFXVnh6dE85ZS9GOU1TWGJMSU5W?=
 =?utf-8?B?SFB2UmdhOUxmUDZCaHlUM0NWQ0RqOURBOFBpZGZCR1RuTmgxM2lJc0ZoNnE3?=
 =?utf-8?B?ZysxTU1OSFNlbUlCWnRBQ0o4SFJ5L08yZ3VPcHZtOXVKdE1VWXlEbWJSdlJ0?=
 =?utf-8?B?VEpTcUoxNHluNnZHUkdCM3Z5Wm5MK2lkMm1MVUN3M2ZwWk9xUERnaDBHWVo3?=
 =?utf-8?B?TnpHRnQrN2xSQ2hXVXc1TjdBYjQ2Rlo1SldpQ1ZwN242YjlYRmRveHhjUmJU?=
 =?utf-8?B?S2JJOUlLSkovajVmMjBzakxIUHVpMkhkdE1oa05mZUlaSXJJZmxiSHdpNWdQ?=
 =?utf-8?B?dU02dXc1MzJpb3JKSGVEdXVzQmxpanROVnRMZm9KKzhDTmVtejYyUXpjTDd6?=
 =?utf-8?B?WW1INzVNN2ltTGFzMHpCYUJDTEtaTStqMWplMTRvOHNBMURlWTFmM2FJUzcy?=
 =?utf-8?Q?tnHg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmJMcUJSOEkxdk8xZTBiOUN5d3hicU1ueWExbk9pRThxY0hJa0FoU2dZNmRY?=
 =?utf-8?B?TldHSlFETVRta2pSQ3E3L2NyY0gvM29Od3lLQWVVaXRWT25HZkZUck91YVNv?=
 =?utf-8?B?VldKNHhFRXNsU1NibXZ3SjJMZmhNZ3JxWUZmMFk4RE1vLzVFOEY3Q1dmS0tN?=
 =?utf-8?B?TW5ITU0ycHVyZHdNS2htZDRUTURobXBmVlYvanN1K1FqNmlOMGI4bGVEUzdp?=
 =?utf-8?B?QnJoOWJGczZkTmtZTWZMSmgwSWdVN0ZPaEZKNGlTU3NVVDRxQWEvS0U4cGcx?=
 =?utf-8?B?MzNDc1JJYk9kNlZOZ3hVMWd2YlNlYVNGNVNMUFBZTXA1ODZLUHFlZDJmSUN2?=
 =?utf-8?B?bk9ha2s5Nm5XbzRVdnJwbG0zTDcwOTh4Q2ZGUDg5ZHpRbERKeVlHSlJVQVho?=
 =?utf-8?B?eXZLbjNtUkdML0NRYVcxc050dmJsK3lmenRXckxZOTNVSkZEY3JwVUlTdE05?=
 =?utf-8?B?RnJkZ3VZTmI5Uzd0Y1ZENEUwTjJJZ2FLMlNtQmtmc0dzRlc2dU1wZ3RwSmtS?=
 =?utf-8?B?NXNxTUJqT1VxVFAwQWQ5aDlTZi8rY2Ura2ZBOXRyaHN2OFBSdkI0dGgzaG5s?=
 =?utf-8?B?MDlnVTJESi9yc093NEZoY3lZR1RrZ0tob1NtRTY0QXJHOUNheXNWeXlHa1Vq?=
 =?utf-8?B?djZsdlNDMnBFamFUZjZld2p4dVVuOGQzeDRYMkd3ZE9FVktpU3JEaW9Odk9B?=
 =?utf-8?B?ZmFzcVBkQUNsOElaT0lSZXBkdm1iSldSbEVOSWE0aXNjc0NibkViWlFaeEhQ?=
 =?utf-8?B?K1hTdmkvZHJNVTBsMFpGOE9hRXdQOGhvV0JWOGlyYkl1Tm53ZGx3MTVOTGpk?=
 =?utf-8?B?VUJMeHJmdDIzNnJtNkMrQ1hiRUFiZnhXTmRGVi9BNEhLcmIyUTh1bmdGSE13?=
 =?utf-8?B?bmJLbGNPS2VrbEV2T3pQaXkyUmdvNkl6RUhzTlFqdXQ3ZTZDSmp3M3ppTWVY?=
 =?utf-8?B?VWI4bzUxTkpNYzliellSbkVWR0pOQVZiSC85MENQNTFsR3hQbGVERlhmeG5G?=
 =?utf-8?B?cDhFa29MWmdWeTBDZzZrN3c2bjhxR0RIN3ZTK21EWm5CQ3hxc3d5aE0xZ1Fu?=
 =?utf-8?B?bmU2L2NjUFlvZlgxTEFNS3BwalBqYWV1RzRKNmNmTGZiYjBucjhlcDVldmRG?=
 =?utf-8?B?bm1hSDZ0bjlXaDAzY2d1MCswYU9JQ0UwSWt5NUttNHlNc0IrMkFDbzFoYzFu?=
 =?utf-8?B?ZkxhbVU5cE1zMHg1ZEpCWUJ2azFmcXNBcDlBd0FnbGkzTUNmNFYwaFdTdnlx?=
 =?utf-8?B?SE1VRENQWW5ocmd1K1lBMHVPRy8vbXM5cEpxOFo0YkZTYzNNUzl2cTlxZXFk?=
 =?utf-8?B?bjB5RFFHWWtkM1htdnhGMDhzbjRUdy9EWm40ZmdsYjVGOGplalpaV1ZNT1NI?=
 =?utf-8?B?RjFwVTlWL2FCYnhqZUV2RzF3K281MnZ5RzB6WGNlNGVHRE1QUHRSVTBGNkJD?=
 =?utf-8?B?Zzd4V3ZPQy9YbWZnQXRxcGErVFZQeFZaQmdhZTFxS1F6TTUyMU5ZRVdIK0J3?=
 =?utf-8?B?bE5EUjBKVm1IMXJwMlNYYTBRc2ZMQmU3M3RlKzQ4cWNSLzBoWjgzaldyczcy?=
 =?utf-8?B?NXk4ZWgycUZpYzVhS2JDZ2JVak1oVWhaSXZ5N2xYRUNka1F5Y1JsKy9KalFU?=
 =?utf-8?B?bDRzellYVjZ4S0NsWWtndTRqTmp6QWpPOGk1ZEh2QWZtRHVZeEVZdmJTQStT?=
 =?utf-8?B?K3F4cWl2ZTBIeFFpbXdMdTNvcW1XMkdJL0ZKeG5kamR6QlJRclZ6ZzNQN05Q?=
 =?utf-8?B?MEpNYmg4YlpTR1lEK1hQbHlRSEx2R3p0bFB2blhlWG5CZmFzZ0hUYmFSaU12?=
 =?utf-8?B?MWpTeXFjQ2Q0MHZyQllMNnE2ZEJITG9GNHcxNnFJR1ZhcnZqS3N5Tk9udWEr?=
 =?utf-8?B?WXlxWTErM0ljSTF1cWhyZkx4WE1FUGpIWjFRYzRYOEQ1VnNzZEpYZHZPVnpq?=
 =?utf-8?B?aEMwNWorU2NUaG1Fa1pOVTBIcG9IcXhvUm5QVGcyQkpLdXcrS1Z1dk1PSm51?=
 =?utf-8?B?T1B4NUM2cDM5bWxGZ01aeEJ4aUFQeGk0SWw4SWJWVnB3R1lkbHZjK0owUzR5?=
 =?utf-8?B?SFhsWTBRbXpNNHFVcFRPRk96bkI0L1RFeGQ4V081U1pReVF2S1lTZmEwamFt?=
 =?utf-8?B?QmNlMmdQR3hPdXdxTUJMdjJzR1YrWXJCTFdXak5kZUpBN1RwLzBYZXVvWnNR?=
 =?utf-8?B?VGdkTXdNeXdJUy8rcWVpc0xaeHJZZjM5UThxNU5kUjJHRXVWUHJDMmRYZVhr?=
 =?utf-8?B?eWtoaTFFQnk4YW1nZ21ubkNKSFNDNStSWlkwblVzbnR3WDAyNGhOb1NJa1Z3?=
 =?utf-8?B?djBDY0VGWE54c0p5Nmw5N1FPWlZITHRyaWFJNGVxSzJoY3VnUEh6a1hMMEZN?=
 =?utf-8?Q?7+7UK0rO2oZPuERo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c768a9-6904-4328-dc13-08de6e4d653f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 17:53:02.4282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYPzkRWjfxNRRDsNNr6LMGRHbOnn0WL8SVkGxcq8j1pUjOS8u9ZaQAJqncQ+yrWArxEDjQ6N3/X0akYzP+o7pdgh+SQY8djqWtmmiOcwTrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8831
X-OriginatorOrg: intel.com

Hi Shaopeng,

On 1/22/26 8:40 PM, Shaopeng Tan wrote:
> When all bits are shared between software and hardware, CAT test can not run.
> 
> In the case of MPAM driver, even if all bits are shared between
> hardware and software, they can be used as if software-exclusive.

How can "software-exclusive" be guaranteed in a run of the CAT test? If some
hardware happens to allocate into the cache while the CAT test runs then the
test is more likely to fail without there actually being a problem with 
resctrl.

> 
> To enable CAT, if all bits are shared between hardware and software,
> set shareable_mask to zero.

Please let this architecture specific addition only apply to MPAM accompanied
by a comment. 

Reinette

