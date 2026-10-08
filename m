Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BEE3C3BFC;
	Thu,  8 Oct 2026 21:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493216; cv=fail; b=Riq/mA3kcqFFktJlM5r1xaz4OClIpg/56rhur30VU/mqc5Jcmu/VAzsekl7sewuxqkID6NfMIaXIsTyqi/06YsAZnxKuc/0TNJq9sJi+lp5qd9X4xVXRIlKCIIuZSsB8KsckHZRX3anfRb0u9Zyl0X8i8RvN6UAfgWETcEWLLwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493216; c=relaxed/simple;
	bh=0iwzpdGMZwEUsP1x1+U7PyitmyQvi2pI7fJTdN+AGNc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pEjWCO6UYX3VLZjPzMRTb/wv1hnvPql9kA2+JC/UkBkYSBQw56Ulw59lYNDoQb/Nn7xzjEanj71IhrUWZNuqo1T0O/ipm1nsXkpM0WRLEA1rJH4LPtomi0ZWKvCKQo+kRmSeJMWgz+Ni6Hpw5NueQGCduiX630qU9j5iOaVnBXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixAIcy99; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixAIcy99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791493215; x=1823029215;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0iwzpdGMZwEUsP1x1+U7PyitmyQvi2pI7fJTdN+AGNc=;
  b=ixAIcy990vQ7GDWJgF5LI4SmsAGOAxf0skuSEEnVaxuy7bTVlonuAVoL
   IJFo6C+fUfeyPmrXz0FZk/Zd4qmJ6TEIXKmBTtbCRZJFTfbnsPJSu300s
   QLve7y+IasjgQ90HQH7VMkdvUvIgzCjWpTA0m8vOUIhwz9uvR5N0vDkfl
   xKZ0Syv3uunwvBQod3bZqYBG/11aHeM6eddKco9wwBGyp4IgFQRGwtn9y
   epfSIy1dDzaZTmTgT74xAFqlBXK+9qJL4J69ZtjcVIe/4nmxQQye53/FB
   t173BdUCoXPRRbv7OwGrWom6MuN6EiJ6Y3qL0JannZ13g9IR/Dku1T1sh
   A==;
X-CSE-ConnectionGUID: 0IzWdAHSTQWbOmfkvgcdLg==
X-CSE-MsgGUID: u2OI0Bs/QiWsFa+OYDPf4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="298488"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="298488"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:00:13 -0700
X-CSE-ConnectionGUID: oG9uQSR8T1qi2rOYsN7dCg==
X-CSE-MsgGUID: EjlSXunJToaOGzhjmCt7eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="506576"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:00:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 14:00:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 14:00:12 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 14:00:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVz0Kdv4Snyigvb+RuCSwc8ucf8Cmql9q+TUXk2AMpe83MNqga5wPmZWl0Jv4EuoDI77taxKAxsgYLnaIlsF17iPSpcTFE6GM7dYMQUrenCbIFtWFOkktHJJ0sQ9+aUA9zvFRoeGmZ4u4S4GrTly5bpxi+XiJXldTIX6IkoN911pN464G82SFlawlUZ2fo7zqfiBL5pCx7Ef8sNE7/u1HqPm6wDmmPwFJU243YwLJxw9kE0thdR/1p3cNuYXvIJ9OiLTgQ2j8pwDC913dPAAjALJr0diB1BKMJwT9HcxvT0RLxwf/W0u3wWvEExjlUFschMa7RtzCc5zE01txjcklg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iwzpdGMZwEUsP1x1+U7PyitmyQvi2pI7fJTdN+AGNc=;
 b=LCzkAjQOZpm46sVKnRfscDmY5DebryO0IrdyANUfJ21FHE8r5lwgyPnIxCPDep5TSzFlOeIqI1dEzy/eUWLqm5JoFy+0oIdwetMn/SeOucLXLlsT2WPSL12WG0FJxqBA3+p3WL5iIgv5y8FnpRX3j7fTUvG0lzcUM4j11Np2fa33DcTEnRiwdDRWBj9uFzzYfLkRj8pDAiOpJepN7aVBu9yTFYiPEymqF1VQdQtl9gSrNoEh+lb+XZUKjk2cq7vwFj/tuv8dlTPXHhqaV1TbA9/7hDg5UuLay4sId4D2wndKGqJRA/KumxTSybucQ2TrCQZvKcBEH45aghsE+/E/eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by DS4PPFBF67129C1.namprd11.prod.outlook.com (2603:10b6:f:fc02::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 21:00:05 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:59:57 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "x86@kernel.org" <x86@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"ripatel@wii.dev" <ripatel@wii.dev>, "tglx@kernel.org" <tglx@kernel.org>,
	"bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>
CC: "hpa@zytor.com" <hpa@zytor.com>, "kees@kernel.org" <kees@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 1/3] x86/shstk: ban ia32 sigreturn when shadow stack is
 enabled
Thread-Topic: [PATCH 1/3] x86/shstk: ban ia32 sigreturn when shadow stack is
 enabled
Thread-Index: AQHdV2H/JX9B3LcQ60+tcfWPj/4EOLb0IS6A
Date: Thu, 8 Oct 2026 20:59:57 +0000
Message-ID: <e1a26ac75c39673d043b2860f848827fecbcb843.camel@intel.com>
References: <20261008201610.1003569-1-ripatel@wii.dev>
	 <20261008201610.1003569-2-ripatel@wii.dev>
In-Reply-To: <20261008201610.1003569-2-ripatel@wii.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|DS4PPFBF67129C1:EE_
x-ms-office365-filtering-correlation-id: e3404fa8-606e-4f7d-474b-08df257f1c84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|23010399003|376014|38070700021|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: MTpz3+8a3oTbbPqGoQRgeJEbIWFMJ1DhTkjqhkIP8TULUHFnT5Zd4Y6TDIRviC+Ma9BjwAJCkehe2Bf/+kfLiSUNM9zuH5VoK3ulnlKxngsE3FcxMWNwC0bfKOClmsY8d7a32akc7ZQs+E2sfrDKoLevtjzYduqT2bkSqLQQpWTCY7O5SCMhB9ycCsIf/CyXA1+Zq5Rrz5ZpyzDs5RCBN0bwG+t4BOQHN2DnwKoH/NCIFJi1sHsf+kXBKM+YYXGB8Z+52019gWDejxx0veU4HW/cWJKmRBUAAp0hhxgWJRUkmgzRFdNe15yzv+ahwJw9J5UTCRxt6+Eq9ICjEcUq8EbtRYPs1fZqLegBysZ2BZEf/XZYXZ8Zev6GWdKV8uI5p6rlBhjfpZVsuQoMYPv2p6zVMxAkXew2s0CIK6mr1WRS2aV2cfsZSfp6WjjVrcDopXD2ItI9498Ptc9RvOWETaPQoxqMxXgsJg3O1ThgHCt/Nm6XkI2cbBnbCU++HDSP+Ip+yYk3sUt9rd1S0vEvXp1EEJw96wAsv7D7+6hah8Rz0aPNoFVAFN031aAdh3uaKgdUHNb461hn+PQMCvt46THNVi3qRnBs+ywphn9NytWf6ffiPOpZZWBZldl7EndHox1c5hk7gIqNeSAbfbuN10Yj5XO+mg0OqjwNTx3eeUlUNpYY30RDOO+io4U3Z6wN1IweSekqW2USRrw75mfR5PxmiNIygjGOsWNWZEnj3Ls=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(23010399003)(376014)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0NNK0JSdk9ZTEt2WDNhcFdSQVVVS2pGWUhPUDQ5VkM2K1k1enprWG1QZkRE?=
 =?utf-8?B?ZVhwaE9KN205OXVGOHROZytWTVlpSmZiUTMzeWVCYm14cmQ3aXFQSWJ2cFl1?=
 =?utf-8?B?RFBNaVRmTnI4N3luZGQ0RHQ0VkphR1E2RklucjZxMHEreXBablpnWE52WE91?=
 =?utf-8?B?RnluL3ZFL25sZG43Ky9naVJXSEsrOTA0eFlGdGZaU2JwSUN2TXFmaUJHdXZQ?=
 =?utf-8?B?QTViTVpwaEhWdmxwQndsR1RNMXMzN1J0TVQyTU1QVzU2anM3MkMwaHFRRENq?=
 =?utf-8?B?UGlPUGFNeVZUMzFHMDUrazE5emxrMFYrZmkzbkdiQXlkSWE5eTVyTFBmWmg0?=
 =?utf-8?B?MXR0WE8yMloxMUQyM3NCNGVPQ0ZYMlZQQ1lYN05ETzBtOUo1dmZXS3JndGk4?=
 =?utf-8?B?aVNZbWUxUndPT3ZoQnVIM3hvOEFwMWtXS0FnbU54L2lmNEhndVg4a0M5bGxp?=
 =?utf-8?B?bktaOHB1ZUpxalYvSy9yZG1oRnN1ekFPY1oveW04Zzk0ZjZKMU9RWDhrSG42?=
 =?utf-8?B?MEVLRkd0bE5qNXpLZGpiWkRNalBQcFpDbjQ2bEJVUENxSlJ6dDNoME5Nd2Q2?=
 =?utf-8?B?RzRJYmt6ZUFtb2tZR2huY2FkeFc0YnJURXhyeG1adHNyUDFSU1Q1TUtSTTVW?=
 =?utf-8?B?YWNETUhrRitjV05uNFJhdXh1TjZrY2ZBTHI2REJvYW9yRUdxRjR1c0pMWDZY?=
 =?utf-8?B?QUhHK1I2TTRFTGplazRqVVJlWmpsSzhxUUp1WDJuK3paYW1UME9kTVRPRzI3?=
 =?utf-8?B?NW5FNUZrMTQ3VnA1YzEwVTd1dnpvY3RaMFp2WlZTTzIzK2xKQ3YzL05PWGQ3?=
 =?utf-8?B?SWFWSFlyakVPbjZ5YjlsK0RERThLdDdpVEZQRnZqNFdCekI4VWl2dXpiN2Jv?=
 =?utf-8?B?YXNwN1ZYbk0vQnFtRmhsQ0JlRUE1VVRqaXA3OHp6SWhmQ05jZUlVUEJzYWc5?=
 =?utf-8?B?dzllRHA4WUh4RzBtN0dTYStVLzREd3crNUV1Sys0TiszL1l4V1l3cWd1QWxV?=
 =?utf-8?B?QUZvakRuUGV1b0Z2UGx4RktoT1R4ZEpyRnVJMG9iVUQ2dnFSOENnSWc0TUx3?=
 =?utf-8?B?SkxmcGRiZTNvU3FMbUllcG1DUzZjMXVYNjQ0cGZKTG8vTFYvY3NWWUxBUmJu?=
 =?utf-8?B?ZXV5MkJmRXZOVVRCV0I0UE9uNFhzNi8xeDdNZ0ZFOFR1ZFhmSjlveFQzaUpC?=
 =?utf-8?B?a2ZOZ21KcnRXSHVjeHduUUdHUUk5dW9rSkZTcmZoL1VFRWtXb2c1N2RUZW5v?=
 =?utf-8?B?bWVLT3lRdUlnelRweTd2Ri9IaHlpMGUwSXRLMFJWUE9kb2ZYcnhjbFlGWldw?=
 =?utf-8?B?UnFpaTdJZEJlenRkZU83andtUzI1VVlsSGJvSElSMkdPRUhmc1FkQUhOcVIy?=
 =?utf-8?B?WWJwTFF6VDkvc0xVd2NsOHNOS3F6Yko3cE5XQm5yNExyRDRwV1BSWFdzNkVz?=
 =?utf-8?B?bndQRDUyTnliWFlsSmtvUStINzhaMkpZNzVxZmRVcWg1MEtLK1F5VThxR3Zl?=
 =?utf-8?B?c3JRYmFPOE5yaHBpM3hhamVIYW9IdHJZejRLN0NROHZDZEhBT0Z1NnVUQzJQ?=
 =?utf-8?B?aGJ5dS9CY3N2UEprWmkwYkhJbklEL2ZCNHM0L2gxNlJlanU3Lyt4TU9QM3I5?=
 =?utf-8?B?N3FGdDNqN1paS29OTk9DWWhicVFybzcycFhkQmQrNVZVS3QxUy9EOTJZRHUz?=
 =?utf-8?B?T2U3S3kydU1HaHBNSStzbzZ5enR2ZlpDZFpZVTd6SllFeFJjYmVtK3JXNzRu?=
 =?utf-8?B?YzBaNDlGM3ZJTXkxUjVTdmtzRkU1ZDZtdTRQQjh3VW13QTNpUUFvTnQ5VUJF?=
 =?utf-8?B?MlB4SXFsNVlmaG8rSlBlQ29wZE9NTW8zb1Z1ZDNBUUdDR3JoVFkzMXQzQmU3?=
 =?utf-8?B?bkJ4Vmc1cXQ0ZllmSURoSXFmd3RhZS9JM2hDeitTVW8zZ3V6c3FaY0RmVjUv?=
 =?utf-8?B?bUkwcmRBdHpYdTJlTldQZnFKRlY0d1RvVHJEVWpraWhGNWRFK3VTNG1kOHZr?=
 =?utf-8?B?SzloVk52eVZqRGNKdk5kdTJPZjZGM2FYQ3dUYkl2dFhGNjVpZm5rc1Z6UXdk?=
 =?utf-8?B?QU5Tb09QWjdCNnl5SWxzUkIzZDBpbnRDOE1ldkNvZ2FiVTBtQVhJTFBTOVpT?=
 =?utf-8?B?WXBpa2tUV244cVZUVCt5c05hS3hiaVhwT0owellsRG5GejJsdGtudGRXankw?=
 =?utf-8?B?VFJFRDNaVUhSeHM4ZVFkbTNOZlJZbUpwQUdvSEpFdjdqZlpCbW5qd21GTjJ3?=
 =?utf-8?B?MUFIQWFBalBjenBqNzFaRTFXRkNHeE02RlJKeDcyZU9PK2pqQXd2dTQzOW5z?=
 =?utf-8?B?UVdQY05OY2JFYUpUVHMvKzRCKzRRbEkvTUhXVDlxbk5yclhBb0cxQ0R2UHhB?=
 =?utf-8?Q?O3ajpjYBsmgKpvA0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12235A5A0C470B4096B91218D05D97E5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zrxduRbo5PytCjZwCUbtWHClFtdZAhlgcvLNMm024+AdjDeHunmYA3RZoOce4lKnFwOdNp2kyqIs6ZVQTKgbaGzO0uQHkRvEWDHF+wRGVeRqSN+jLclvD+/QWtpHusFDDEsqwRMXFZma+1psVerVN3IGskBw4kZnthvk7Z9R7k1xz53l9aDv1VA2/mdGj7kHmK9W1V3ocd9NAHc+vAzmysOz92Qz7pzSflPMU6zekCD9+iWSw3wHLCDagcYJV9cUNLatUHPKLvPz5OYjXXZD2Tdb+lIAKIL92eIB5cS0ZEzXf/q++0d4gzAF8afnbp+9Vnn3/btZ5D/EFChcKkUUnQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3404fa8-606e-4f7d-474b-08df257f1c84
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 20:59:57.9253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LxtN7mEl07takKMAtNPoOxo3OzUzOc4TJvl/AdAbybpxtWSptlfvIehtyR3rtU5arQF9I491jXNb/Gqxs2/wS/kJMUFfni0Ts5DMw6f7p1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFBF67129C1
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDIwOjE2ICswMDAwLCBSaWNoYXJkIFBhdGVsIHdyb3RlOg0K
PiBXaGVuIHJldHVybmluZyBmcm9tIGEgc2lnbmFsIHZpYSB4MzIgb3IgeDY0IHJ0X3NpZ3JldHVy
biwgdGhlDQo+IHNoYWRvdy1zdGFjay1yZXN0b3JlIHRva2VuIGlzIHZhbGlkYXRlZCwgYnV0IGlh
MzIgKHJ0XylzaWdyZXR1cm4NCj4gZG8gbm90IGNhbGwgcmVzdG9yZV9zaWduYWxfc2hhZG93X3N0
YWNrKCkuDQo+IA0KPiBXaXRoIElBMzJfRU1VTEFUSU9OLCAnaW50ICQweDgwJyBhbGxvd3MgaWEz
MiBzaWdyZXR1cm4gaW4gNjQtYml0DQo+IG1vZGUsIHdoaWNoIGNvdWxkIGRlZmVhdCBzaWdyZXR1
cm4gcHJvdGVjdGlvbi4NCj4gDQo+IFJlZnVzZSBpYTMyIHNpZ3JldHVybiBieSBmb3JjaW5nIGEg
U0lHU0VHViBpbnN0ZWFkLg0KDQpIb3cgY2FuIGl0IGRlZmVhdCBwcm90ZWN0aW9uPyBJZiBkb2Vz
bid0IHByb2Nlc3MgdGhlIHNoYWRvdyBzdGFjayBzaWdmcmFtZSBhdA0KYWxsLCBsZWF2aW5nIHRo
ZSBTU1Agd2hlcmUgZXZlciBpdCB3YXMgb3JpZ2luYWxseS4gV2hhdCBhbSBJIG1pc3Npbmc/DQo=
