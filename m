Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBF1379ECC;
	Tue,  7 Apr 2026 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775597446; cv=fail; b=K2gSSPpCUejZ0098NqeHcwdSNwS5G1JV7L6qS4phZ263DDW9fssUffQtTxJOq81Yv7QOW4oSBTMLqXPo2oTMVVsaCyLHp2Jr2NIKMJBgHNvgr5ybOkPjrZbVTgyIYuwMTcpIK4KgLcOC34J+eJXU/DvblvLgBt4K4Uhl+VGMUvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775597446; c=relaxed/simple;
	bh=4U0v6lYf5yf4KqyR1qWYK4yXZEtXFrm3Y1yViLBQKl4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lwpb3JNfsefUkttwlmzMPUGZ8zJDA212IoWTKT2165FvxxuLux7WFzrae+shYU6cjf6q/fGijp+jp5JoWMSESgX4v01EIdm3hu6jxEpYd1bXCQPyzV0b3zHhyCk7BMTHyvQXftcistcao+F3Rj1JpTaJvn6pEQgx6esQAWwvbjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpxQqy7v; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpxQqy7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775597444; x=1807133444;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4U0v6lYf5yf4KqyR1qWYK4yXZEtXFrm3Y1yViLBQKl4=;
  b=cpxQqy7v+N9V3gxkgTpnPGmYpFpUdo3jQX+smM3sS+l+LyKQf3SnMCYS
   rhwMALZQdgUi3D5sgbcBxXiZrWmQtLEg8mV/jopnlD93R2Kp1EVrBYaM8
   j9EdmICSORjHIcTZ/UlTKUQBopa1IYNg6df1tpXk+5ExbVv4Zw3j9DbuK
   yRO7ExtFdDS7uBPvj08z4ZO+OgIteNgeWWUF6T4npAxzJtfPPmdxwqpWg
   up0sqLdBSEVT0DOB3TdLrOKRIGCvsNDwfM2/aXM/NSifx34iu3MD57Ix4
   Xi3q+flxJUANAkPErjpSK/8EbW5BobgM0FuJg0EhlMzp2kOI5qGaTxwo2
   g==;
X-CSE-ConnectionGUID: TTm9qvBkRO2Z3RIlQJX8Iw==
X-CSE-MsgGUID: DqwmxfQrSEK5PYHUVuZgnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76536601"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="76536601"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 14:30:43 -0700
X-CSE-ConnectionGUID: Zp8cy0WcQoq8RWkQBz3fug==
X-CSE-MsgGUID: Z0x93XdmTZOU6HmoI2yQmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="227442927"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 14:30:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 14:30:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 14:30:41 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 14:30:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ajbc4WcUxDYCbzAv+TV47/dkqQAPxLpDavzv4vqKEkf0sRD7amCHXekjCwXYRJgroZ9ApeJQyV68RXWnQOxfC9VJLskPzhUhhwKlInNNZsbDaU1g6u5CEm5X01E6u1uU+asJ8++vJLW/W5+pU4BS1ozp8GjurAMZ7jyHYRr9b1Ae4ZTotOc3/xBF30CWYY0Kar0Qnl6XW3r0CdZ7WFnuAICuy5M8Xz6SaAqYtsjbBGVYhyIR0Lhe43FONcBOVLq0hhu+UJ8hVUdLiyEJDvbLb3b8ROBe3/NoLE4q9VzjwIaC2Z4ViQcUomy7mUMFCy2vYO3RgTsfzVQwtVm2SS9L6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khegRmXzIKHbaNj4rDqHDXiXoQkQ2TSXNFhsVKhIDvU=;
 b=oNRs0Degkdq3hskTaQ0Y7iMZqrMQaiJn2tM1yse2Rc5+rf9ZlTqYRm8J4yXW3UmvyF/ItBVJmfZ1ix/lhbjBOe6klWOWIiBJp3WUYmRTnw/1z3sCrllMvJDt+By2G/L+bJMtjCbaTGS6LNmm3QEnmnKBZm1P8/525kSFDJtsPA2E+TA4Vi+yADvHpAHXEgO9HU4jhTzJ1sjS8zs4hmh3ICM3qlLqX5FVtq/MKP3ElTy8DNTZHyKS52roetcriJCZmct65oErTKW0rzWcHLSgB5b83Hk8OG5qqhi6fuVDVeBB+juX5IlICL+Yvb4QYuVekVcy7jCKOae+FmV4wlqW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by MN0PR11MB6232.namprd11.prod.outlook.com (2603:10b6:208:3c3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Tue, 7 Apr
 2026 21:30:36 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 21:30:36 +0000
Message-ID: <85358f27-1666-421e-83b2-fb403b109c91@intel.com>
Date: Tue, 7 Apr 2026 14:30:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] x86/process: Shorten the default LAM tag width
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
 <9580a35f-afa4-41a6-b53c-1f16033cea7f@intel.com>
 <adVoW4c3RhtfLy5b@wieczorr-mobl1.localdomain>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <adVoW4c3RhtfLy5b@wieczorr-mobl1.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|MN0PR11MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f874ad-ae7c-476d-69cd-08de94ece832
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003|18092099006;
X-Microsoft-Antispam-Message-Info: /M8EKtQn3eHYphOjITwO15ermndQ1LpZzsBN2lqCbfjY1oX+sAsy7iS6roNCeGwsqZvvmNQPRdKTxLX62/2ocGJ1mYjGxa/mRLR5uFINtE7TjOIuK3lnxStHKvGAKjVLbO6x426+KYXNnmBNj3GSFz6ynn2Bley+o4+bs9W4B2fyY0qehibFZKS1U4ICnn/o5jTgzixadzAUvs9vo3SC+PC+1ZSr3YI8FIhJ1aHpNzvZCsoULjA6JRIAvkvMTXj8+3rWDSj8+yQ2Bc2srlIT2Ne9jYIGoV85BWCU+EjEDVXZLlCSA8Dh36L115xrpfcm/Okxdh676xVY9w8jWTHqrP7PZLRkabxBN0Dw4zyMY40G492ZUOfhmQh2SRbyw0I2ofjBoYTxiFO5ouCfOKiTbjzWcpH/SB77jBwCwTOh/TBsv69LQGusJG4pp53n/htuPQwdRIFCRPLhD9BL9tFA0XuGCpBKhEGN7990uiZgBVwrSD/dmFge19IWQPRTSaQDoH3zqZyg63M0k0jpjvOsAPJKXTTlDrfHEpGlHVlzwrMf/f7J+etrAgUs/WFDF9bFQGK2oKx4xbGRW02tKm8LHmYEG5KfChkQfb/WFWPNEtpjr4dhkJxvyRxPhzUEQtvUcinIDgov7gLCcSzR3s7oRNt56IJzOisCS7T03fXv0vnBGQmUS+8wh2EZjyP8LYdPvrShUok838f3JKkkU6dCOxGLLqKp2jmB0c92MlO+pxc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003)(18092099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3l1WmY5NitlSGxENnRqU0ZrWUpYWVZnenNlMEsyQmJLNkpsZWEvOTVGREdI?=
 =?utf-8?B?QnJSTXdBdncxVS9MckpJeFJRYytCcGtTRjVwNG51LzVZWm01cHdGNUM3RWlL?=
 =?utf-8?B?QlEvQ1lVaW8wZVlnS3NoSWFhSE1uMUplcG9yc1J4YXV0Q2pWVkY1T2Z2Mjlj?=
 =?utf-8?B?ZkNmOW8vQUY4dUFQZGwwLzJlckdScWJVbHFyTFV4ODVieVRLaUVhTENDemVH?=
 =?utf-8?B?dmtCZmNnSklqeXE3WkVjTERqb29SL3hhdHo5Z1NaaWQ3MVBEMHQwZ0Z0UEdK?=
 =?utf-8?B?b2xBMDNWNmd5bWdHOVJ1cXRwNkJsNDlSVTFoTE9BcFMyUVB1VVF2Nzh3ZHZt?=
 =?utf-8?B?eU56WWhXS1dtb3MyUkt4cnh1eG53OERWODM1UFNqNXU1cTE1eXE1ayt1VnN5?=
 =?utf-8?B?SlQ5bjduUW9UOHJZSHJoWFc0L2thNUpVb0pDc09JVGp3b1A2NEFRQWxKZ3Qr?=
 =?utf-8?B?a3Y4blVjd2NtSEIzZEpIdHU1V2JKR3U0eVRqclR6S2huMWlPRGJ5OXZZSUZB?=
 =?utf-8?B?SXplZFFzaFNpdjlrRHJTWXBaNUc3S1FmNGswcmVTbEw2YXRodC9ENTJ6OFB5?=
 =?utf-8?B?TjFSOVJiWlVHL1hSakJSaHBPSnUvaDlNKytQS2FoTGFIL0RScWtqNEF4bFEy?=
 =?utf-8?B?ZXpJQk5MZkJvYi9GWDgxMk8wUW9XdmY4dUtYSnV4YmFlOWlyZG04MWNjclpz?=
 =?utf-8?B?WW9WaCtyajcwYWxDd2Q0NGxnRVpTMklKSGhBNWtuSlJxTzFjMEd4MVBTdW1i?=
 =?utf-8?B?QlNBbCsrMHY3aDZLWWxoaE5ZbjVsSWJMV2xudUR2b0tIOEtpei9KK1ZveGpp?=
 =?utf-8?B?MXlIVFhmRDIrYUMzUVlvWWhzQ2hCdW5oWi91VC8wS25zRDQvUUZHaFl5bk1z?=
 =?utf-8?B?ZHFmU3M2YUpSeXZkWWEvMDRKMy95Y1VkZ3RjbVA2K2RVSjZDdnRwRm40SzJq?=
 =?utf-8?B?VS85N0VWekVrdzkyaDhEMTZ0Y2c2TE80bzEyMm5BSnlBS2lkNDNkYTl5bTNs?=
 =?utf-8?B?ZGQxbXd5M2dYcFJDUWQzYVpHY3FEUVJheHVnVFdHSERYRkhLY0V5Z0hxZ1p2?=
 =?utf-8?B?Y3lQVHU3N2dCZEM0VWJPaVNOSjdCNVlHS1lCYlJpaXFKQlk2SnlLVGJaZnVF?=
 =?utf-8?B?V3ZUWXVSWFE2Z1lSb1pjYkViZGpWVmFQSjl4N0Fld2tBZVBQZ3NsdDJFcFlz?=
 =?utf-8?B?YnV1QXliMXg5c1A4MitnZU4xQXA5ejR3azRZYmNlelZibkZNUmc3M3RHS2U5?=
 =?utf-8?B?YTZCTnd1RlAvbmxlSDk4Ry9Od1JQSWdjendGMkFwS1E4ZitmRGlPUHdwYmJ3?=
 =?utf-8?B?WHZaNk5QWkowRTlMYk50S1VmQnhKZ3ZKWUsxQWMzNWtjWG9TMForMmdidnB4?=
 =?utf-8?B?RmJVcVZnNDU2M1RTbWgzaHZvRjRLYkE5SFM2Yk9VVVRjV3FUY2xBbjRnZ0Zw?=
 =?utf-8?B?c0o2aTlIRmhYMExJRnV6NjNISHN0c3lEWGNjT1lyQlZLRFVXaDlSbVp6Y1Rk?=
 =?utf-8?B?Zkc5eTFnVW5MTU5ZWGdPMHZhL0VXRnpXK29wbUsyZ3R0SFlFZWRKZmVydWcr?=
 =?utf-8?B?a3p2S1Y5NStXT3NJYkJlTFU5SUhmb3NRT0RtZGNMbFRJYk1ZSlZjWGJQVEFk?=
 =?utf-8?B?UU9IcE53amFWTUd5REdzeVRjZ3EvdDhDV3hqRFBoV3BRR0hVS3RtdzIvR2lW?=
 =?utf-8?B?VmJjVFFQZ1p4RE4wR0xNYlZNQU5ST0VPRXlMMkdqSGFNWjR6MG9FWnZKT3B0?=
 =?utf-8?B?NVhwWmNSYy9DdnJBWjVWNndtOXB0SnVEWWtCL3FXbXZIVmdta2Y1TXJpakRo?=
 =?utf-8?B?N2E3YTFFRFBxTFY4RWxiMlE2T1ZyYjVxNk9uY25zR084Vzd2YkN1Wk9hR282?=
 =?utf-8?B?VXZaT0VoaExSYi8vUVkrM2NXL2JGc3A4VDVpOTFobzVlTkNGZS9neHVWRmpQ?=
 =?utf-8?B?Wm1Rejdmckw4MHBEWmFuaUdUT1BVVVhmRnBuMmQwMlZ6TFIyV3ZDZlNxendU?=
 =?utf-8?B?Qml5b1diSFNEN0g5Tkxvcit3cnRrZFRXVVU3VDBBU0VuWGpSOFVRZitza0gr?=
 =?utf-8?B?VndGTkc4RmhWd3NKaUUxM0FGdXgwNStaQVpTT3ZLdFJMTlVYSVJCR29UT21Z?=
 =?utf-8?B?akRCOXZzK29QWS9UYnNZZmJ4ZE9zVkRlQkNEK1IweHJnMlJpV3JvZC9NRFFy?=
 =?utf-8?B?RWs5ZFlyckJYVEpzWndqcTBTWDBvYzB1cHFVTGZabVNFcWF4UklRMWhFTFo1?=
 =?utf-8?B?Y1I3RlhpTEFLQ0RPcW4rVDNXTWpWSTZUV1R2eDdCRmJHL0pCbmw2M0RGNHdB?=
 =?utf-8?B?dHczaW1ZM2tXQTBKNjBmc2VFdWFYL0ZQYVV6amNkU0xWNUhsZk1xZz09?=
X-Exchange-RoutingPolicyChecked: CqytW0xNi7pkYmesLW+rnTVlGkzSEvNTFRlsjh7SChX7+smV7gf43TetllA1lezeRcIrTha7EWGEiS8yAn/FOaMjbjVSdTwvvP2kToW1l2R5dyUwiIgB2luUxAX5uDQP6b5zJ+Buc+CvJzQR4XNfEFdlyIrqLl3WaHN4eYQMdcDikG6GwtNrnAZOU/MeKpujFUT+82ueHqicdxk4OVi5nQ5x3rB/Gf+1UJP3rk4wHEpDH3lWYMMCj0FaYKqy4Yy5oh8ZcNfOK9lxuBCkq16qu/jCLJYlqWFZWKjDGsw0J+qbc7BxsY6iGrlb8378CC4DX51Mv1/Lb7zR187wk3X6rw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f874ad-ae7c-476d-69cd-08de94ece832
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 21:30:36.3008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JeGw0F7i45IpGTaLOUBORHi+kJ5Qn5Zndkw+djznD00YOyKp6QD29sm2e6/QrQkIDx2YiDB40DfRtgrrLwy/Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6232
X-OriginatorOrg: intel.com

On 4/7/2026 1:31 PM, Maciej Wieczor-Retman wrote:
> On 2026-04-07 at 12:52:07 -0700, Sohil Mehta wrote:

>>> +	mm->context.untag_mask =  ~GENMASK(57 + LAM_DEFAULT_BITS - 1, 57);
>>>
>>
>> Also, would it be useful to calculate the LAM mask as a #define because
>> it might need to be reused later or copied over to the selftest (as in
>> patch 3)?
> 
> I think as it's only used during this initialization here it's not very useful
> to give it a separate #define. And if it's only for selftest purposes it's
> probably not worth it to export it to userspace.
> 

Oh, I didn't mean export to userspace. I just meant having these two
defined together in arch/x86/kernel/process_64.c mainly for readability.
It makes copying the define over to the selftest easier. The names also
match ARCH_GET_MAX_TAG_BITS and ARCH_GET_UNTAG_MASK.

#define LAM_TAG_BITS	4
#define LAM_UNTAG_MASK	(~GENMASK(57 + LAM_TAG_BITS - 1, 57))

To me, it makes the resulting code significantly more readable. I am
suggesting it because you are already touching these lines in patch 1
and 3. I'll leave it up to your/maintainer's preference, but personally
I like the below result:

diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 1a0e96835bbc..745e16bde227 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -797,7 +797,8 @@ static long prctl_map_vdso(const struct vdso_image
*image, unsigned long addr)

 #ifdef CONFIG_ADDRESS_MASKING

-#define LAM_DEFAULT_BITS	4
+#define LAM_TAG_BITS		4
+#define LAM_UNTAG_MASK		(~GENMASK(57 + LAM_TAG_BITS - 1, 57))

 static void enable_lam_func(void *__mm)
 {
@@ -814,7 +815,7 @@ static void enable_lam_func(void *__mm)
 static void mm_enable_lam(struct mm_struct *mm)
 {
 	mm->context.lam_cr3_mask = X86_CR3_LAM_U57;
-	mm->context.untag_mask =  ~GENMASK(57 + LAM_DEFAULT_BITS - 1, 57);
+	mm->context.untag_mask = LAM_UNTAG_MASK;

 	/*
 	 * Even though the process must still be single-threaded at this
@@ -850,7 +851,7 @@ static int prctl_enable_tagged_addr(struct mm_struct
*mm, unsigned long nr_bits)
 		return -EBUSY;
 	}

-	if (!nr_bits || nr_bits > LAM_DEFAULT_BITS) {
+	if (!nr_bits || nr_bits > LAM_TAG_BITS) {
 		mmap_write_unlock(mm);
 		return -EINVAL;
 	}
@@ -965,7 +966,7 @@ long do_arch_prctl_64(struct task_struct *task, int
option, unsigned long arg2)
 		if (!cpu_feature_enabled(X86_FEATURE_LAM))
 			return put_user(0, (unsigned long __user *)arg2);
 		else
-			return put_user(LAM_DEFAULT_BITS, (unsigned long __user *)arg2);
+			return put_user(LAM_TAG_BITS, (unsigned long __user *)arg2);
 #endif
 	case ARCH_SHSTK_ENABLE:
 	case ARCH_SHSTK_DISABLE:
diff --git a/tools/testing/selftests/x86/lam.c
b/tools/testing/selftests/x86/lam.c
index d27f947ea694..4e514cae27f2 100644
--- a/tools/testing/selftests/x86/lam.c
+++ b/tools/testing/selftests/x86/lam.c
@@ -17,6 +17,7 @@
 #include <sched.h>

 #include <sys/uio.h>
+#include <linux/bits.h>
 #include <linux/io_uring.h>
 #include "kselftest.h"

@@ -26,9 +27,9 @@

 /* LAM modes, these definitions were copied from kernel code */
 #define LAM_NONE                0
-#define LAM_BITS                4
+#define LAM_TAG_BITS		4
+#define LAM_UNTAG_MASK		(~GENMASK(57 + LAM_TAG_BITS - 1, 57))

-#define LAM_MASK                (0xfULL << 57)
 /* arch prctl for LAM */
 #define ARCH_GET_UNTAG_MASK     0x4001
 #define ARCH_ENABLE_TAGGED_ADDR 0x4002
@@ -175,7 +176,7 @@ static int set_lam(unsigned long lam)
 	int ret = 0;
 	uint64_t ptr = 0;

-	if (lam != LAM_BITS && lam != LAM_NONE)
+	if (lam != LAM_TAG_BITS && lam != LAM_NONE)
 		return -1;

 	/* Skip check return */
@@ -185,8 +186,8 @@ static int set_lam(unsigned long lam)
 	syscall(SYS_arch_prctl, ARCH_GET_UNTAG_MASK, &ptr);

 	/* Check mask returned is expected */
-	if (lam == LAM_BITS)
-		ret = (ptr != ~(LAM_MASK));
+	if (lam == LAM_TAG_BITS)
+		ret = (ptr != LAM_UNTAG_MASK);
 	else if (lam == LAM_NONE)
 		ret = (ptr != -1ULL);

@@ -204,8 +205,8 @@ static unsigned long get_default_tag_bits(void)
 		perror("Fork failed.");
 	} else if (pid == 0) {
 		/* Set LAM mode in child process */
-		if (set_lam(LAM_BITS) == 0)
-			lam = LAM_BITS;
+		if (set_lam(LAM_TAG_BITS) == 0)
+			lam = LAM_TAG_BITS;
 		else
 			lam = LAM_NONE;
 		exit(lam);
@@ -230,8 +231,8 @@ static int get_lam(void)
 		return -1;

 	/* Check mask returned is expected */
-	if (ptr == ~(LAM_MASK))
-		ret = LAM_BITS;
+	if (ptr == LAM_UNTAG_MASK)
+		ret = LAM_TAG_BITS;
 	else if (ptr == -1ULL)
 		ret = LAM_NONE;

@@ -247,10 +248,10 @@ static uint64_t set_metadata(uint64_t src,
unsigned long lam)
 	srand(time(NULL));

 	switch (lam) {
-	case LAM_BITS: /* Set metadata in bits 62:57 */
+	case LAM_TAG_BITS: /* Set metadata in bits 60:57 */
 		/* Get a random non-zero value as metadata */
-		metadata = (rand() % ((1UL << LAM_BITS) - 1) + 1) << 57;
-		metadata |= (src & ~(LAM_MASK));
+		metadata = (rand() % ((1UL << LAM_TAG_BITS) - 1) + 1) << 57;
+		metadata |= (src & LAM_UNTAG_MASK);
 		break;
 	default:
 		metadata = src;
@@ -291,7 +292,7 @@ int handle_max_bits(struct testcases *test)
 	unsigned long bits = 0;

 	if (exp_bits != LAM_NONE)
-		exp_bits = LAM_BITS;
+		exp_bits = LAM_TAG_BITS;

 	/* Get LAM max tag bits */
 	if (syscall(SYS_arch_prctl, ARCH_GET_MAX_TAG_BITS, &bits) == -1)
@@ -719,8 +720,8 @@ int do_uring(unsigned long lam)
 			uint64_t addr = ((uint64_t)fi->iovecs[i].iov_base);

 			switch (lam) {
-			case LAM_BITS: /* Clear bits 60:57 */
-				addr = (addr & ~(LAM_MASK));
+			case LAM_TAG_BITS: /* Clear bits 60:57 */
+				addr = (addr & LAM_UNTAG_MASK);
 				break;
 			}
 			free((void *)addr);
@@ -937,14 +938,14 @@ static void run_test(struct testcases *test, int
count)
 static struct testcases uring_cases[] = {
 	{
 		.later = 0,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = handle_uring,
 		.msg = "URING: LAM. Dereferencing pointer with metadata\n",
 	},
 	{
 		.later = 1,
 		.expected = 1,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = handle_uring,
 		.msg = "URING:[Negative] Disable LAM. Dereferencing pointer with
metadata.\n",
 	},
@@ -953,14 +954,14 @@ static struct testcases uring_cases[] = {
 static struct testcases malloc_cases[] = {
 	{
 		.later = 0,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = handle_malloc,
 		.msg = "MALLOC: LAM. Dereferencing pointer with metadata\n",
 	},
 	{
 		.later = 1,
 		.expected = 2,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = handle_malloc,
 		.msg = "MALLOC:[Negative] Disable LAM. Dereferencing pointer with
metadata.\n",
 	},
@@ -976,41 +977,41 @@ static struct testcases bits_cases[] = {
 static struct testcases syscall_cases[] = {
 	{
 		.later = 0,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = handle_syscall,
 		.msg = "SYSCALL: LAM. syscall with metadata\n",
 	},
 	{
 		.later = 1,
 		.expected = 1,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = handle_syscall,
 		.msg = "SYSCALL:[Negative] Disable LAM. Dereferencing pointer with
metadata.\n",
 	},
 	{
 		.later = GET_USER_USER,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = get_user_syscall,
 		.msg = "GET_USER: get_user() and pass a properly tagged user pointer.\n",
 	},
 	{
 		.later = GET_USER_KERNEL_TOP,
 		.expected = 1,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = get_user_syscall,
 		.msg = "GET_USER:[Negative] get_user() with a kernel pointer and the
top bit cleared.\n",
 	},
 	{
 		.later = GET_USER_KERNEL_BOT,
 		.expected = 1,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = get_user_syscall,
 		.msg = "GET_USER:[Negative] get_user() with a kernel pointer and the
bottom sign-extension bit cleared.\n",
 	},
 	{
 		.later = GET_USER_KERNEL,
 		.expected = 1,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = get_user_syscall,
 		.msg = "GET_USER:[Negative] get_user() and pass a kernel pointer.\n",
 	},
@@ -1020,7 +1021,7 @@ static struct testcases mmap_cases[] = {
 	{
 		.later = 1,
 		.expected = 0,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.addr = HIGH_ADDR,
 		.test_func = handle_mmap,
 		.msg = "MMAP: First mmap high address, then set LAM.\n",
@@ -1028,7 +1029,7 @@ static struct testcases mmap_cases[] = {
 	{
 		.later = 0,
 		.expected = 0,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.addr = HIGH_ADDR,
 		.test_func = handle_mmap,
 		.msg = "MMAP: First LAM, then High address.\n",
@@ -1036,7 +1037,7 @@ static struct testcases mmap_cases[] = {
 	{
 		.later = 0,
 		.expected = 0,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.addr = LOW_ADDR,
 		.test_func = handle_mmap,
 		.msg = "MMAP: First LAM, then Low address.\n",
@@ -1046,32 +1047,32 @@ static struct testcases mmap_cases[] = {
 static struct testcases inheritance_cases[] = {
 	{
 		.expected = 0,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = handle_inheritance,
 		.msg = "FORK: LAM, child process should get LAM mode same as parent\n",
 	},
 	{
 		.expected = 0,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = handle_thread,
 		.msg = "THREAD: LAM, child thread should get LAM mode same as parent\n",
 	},
 	{
 		.expected = 1,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = handle_thread_enable,
 		.msg = "THREAD: [NEGATIVE] Enable LAM in child.\n",
 	},
 	{
 		.expected = 1,
 		.later = 1,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = handle_thread,
 		.msg = "THREAD: [NEGATIVE] Enable LAM in parent after thread created.\n",
 	},
 	{
 		.expected = 0,
-		.lam = LAM_BITS,
+		.lam = LAM_TAG_BITS,
 		.test_func = handle_execve,
 		.msg = "EXECVE: LAM, child process should get disabled LAM mode\n",
 	},
@@ -1224,7 +1225,7 @@ int handle_pasid(struct testcases *test)
 		if (tmp & 0x1) {
 			/* run set lam mode*/
 			if ((runed & 0x1) == 0)	{
-				err = set_lam(LAM_BITS);
+				err = set_lam(LAM_TAG_BITS);
 				runed = runed | 0x1;
 			} else
 				err = 1;

