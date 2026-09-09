Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926313A254D;
	Wed,  9 Sep 2026 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980325; cv=fail; b=fKwZgC6jk9zhjXoEyNbw5pBL6W1o8iJa0LgdqVxQ9ljX1eIH8goyfQOQ+GySFzFPUDQOCZPsY/UVQBUw0aI7zPz0TW18fkQdu3KDGLfPDXLkAzTtizg1ZQIUSjWmcKwyslUtyi5CY5ETi4SX8rV1FzgBG4ghpayIqv/wWt/jkPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980325; c=relaxed/simple;
	bh=bPiE3Bo1+4JL8M4+Jv2anduzmdf0flMOFRez+vDo+tk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DS4JAKRooR2tcLU4r5k8Hvu18OooMSHTXOK4Uqx3fYw4KlXB9FqkD0SMScbP8fjAGbvLheN3C9Vo9CqR2AX62iwmnKu2DkvJ7NZQiIBH5Bkp4kCWV4/PD8jj6jngGM4/S6KyomUSbG0eUpM3Q2FFZyGpBuTmAFdDNlffFKZ3dLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btj7EOhJ; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btj7EOhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788980324; x=1820516324;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bPiE3Bo1+4JL8M4+Jv2anduzmdf0flMOFRez+vDo+tk=;
  b=btj7EOhJEafjlhpY2qM5r28zu4s4K6li/ccFlQ3I9qQQihpfDZfl4z27
   OXN1hjAW0/trvm06Ejor4T+49+ZK0jT1WUuUuOgJjX1rkKSOG1C0FrnSP
   1Hpf7M2lAxylgR/HclUIwmFwyVohRtfCfCz4TR745qHSkjFMOOcU/xGW7
   iueaoRNz7V30kXToD981bOwadAbO2JKrJI3xe+1U0qkhMwbd4ntZiGbPv
   D3iCOviSZ/+ImJKrIHhL8tR30McQVuD+I3o4xjMZfEXkZvEbO4rIB3ZNr
   dXvFAE55JABiBRxKXmBEf894Hz5G+dgWaurf8PJnZsY7dh2C7yHu/9l7b
   g==;
X-CSE-ConnectionGUID: Gd+vZ9LsRrWIej/FVE5R2Q==
X-CSE-MsgGUID: WbtYMGneS5K0O3siwkzU/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89450571"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89450571"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 11:58:43 -0700
X-CSE-ConnectionGUID: J0wBwa/lRzytSPw+KBZt6A==
X-CSE-MsgGUID: fETA57/XRGmo6wQW0Ly5HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="275545336"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 11:58:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 11:58:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 11:58:42 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 11:58:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gW/fgCaZIL2rINIq5gNFBg1HBLlmUCm0Kx8/CxBUd2j/9z+xQ7YBTyJqphUvh0uqgEx3OssV86QyfA9rH3pRR6APCpA0ID9jTDGMdW2ZPZ+Dd3d8kaVOUgJa/bD+699Ko3hCqJyOsukUzS0AO7ubDTDiaevX4C/0fp+AxCEZ2itxOmaQb3Wex0XO8VjK3ypKMhVoC7ubeaDVgPkD+wLEQGjpe6xQrC/mi7ZGz8l77ceXZ+1xW24jG5MVyRmU1JJkyRFU+LErFGQ0fApHqSsT8Zx7Pa3t1GPtPu+/Xk93l7dySc3TgsDHpVnz3ca/mfFcTVScapavZI6XiFjmZuFEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPiE3Bo1+4JL8M4+Jv2anduzmdf0flMOFRez+vDo+tk=;
 b=O4GIIlqpBX5/n72FbqV2ToRyVv5XTVvYj16t+q2S7FQcBuebKGziRxxjV2yFLE+Epcifjp1Rg9wLol9QdbfQ5fMk14ARzuC66W56G2jZ+uNyY8nFulYk5rCTQlAS4/4pv+rf6y2RxblAsFGMBF1rRP0M2Fd29TtmSyXTT7qYOhT2MCXmN1bhMqON1aMU6hluxh+KxQwpTePer9lDPWCAEbltevK/T6Jv4mPksJ8e4u3+bF9kWKSCyOT3FDruEd3y8+gr/EnitVk+NU/9D0UCYREhOPpct24Rk7K1BJ4dlLHonb7s7ABLL8Nwn6OuiAbZ5rdk0G7ps0zTd5V1BbJDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by LVUPR11MB9591.namprd11.prod.outlook.com (2603:10b6:408:3a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 18:58:40 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 18:58:39 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "shuah@kernel.org" <shuah@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "x86@kernel.org" <x86@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "bill.roberts@arm.com"
	<bill.roberts@arm.com>, "hpa@zytor.com" <hpa@zytor.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
Thread-Topic: [PATCH v2 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
Thread-Index: AQHdDkSBUGol+sBZJ0SdmNdWGtyvjray3AkAgBQerICAAAM0gA==
Date: Wed, 9 Sep 2026 18:58:39 +0000
Message-ID: <f8d9230068c9456fdf38ee0c3db34ec18008258a.camel@intel.com>
References: <20260707191136.1732277-1-bill.roberts@arm.com>
	 <20260707191136.1732277-2-bill.roberts@arm.com>
	 <440cdd41a203589b31e287378de146e18e620176.camel@intel.com>
	 <855fe434-c663-470f-8303-a84e7617c0f2@arm.com>
In-Reply-To: <855fe434-c663-470f-8303-a84e7617c0f2@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|LVUPR11MB9591:EE_
x-ms-office365-filtering-correlation-id: 29d0e200-670a-4703-6b7a-08df0ea45c75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|38070700021|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: u17YGLOIQyfwOaXc1KI7zt6I+JzwtK3kE7jZclw0qSPq/Z+cg2/q1mMD+Du5C8GMtnJ2ly43rxlD+luhlSwawDOs0Y43TwgPsalPUCLQgzh4YxSA49d9AW8QSE/KMP4z9iyIBBwUKexRkTYL9I2HVPt7MJkXyeyR84jOnDh7QXFg/d5N9n+WaKtA2uWp2puyv2CSE1CAyQxyHW5G1dB5vmfhtV4umnrD5fwyc1v87eTYVdpc4nHfZNNWjMKQgbk4mnyo1EJ55R4LEX7yguLSxcP+d2ADVj6DQvR5BK11+KU/T2f6VVUKll0lopvxN/X/ls5EzGyRVgEz2WpCpiXGsIobf79u0LynZQ7e9bax9hyi7RjEY05f0iAgbjwDY2lyQx1wQ1Qs9CP4mFCgFVuJKf9YgPUr0iqi2S5WbvDUkD4+Eowxn2lzo8LXlfunRXY1T1Sud2C5R0Swd1ro3G0kIYHr2w0QvKcrLi2PL0h8RMKtDmtfRnk3uJwp7fWqZ1cmktFiw9bkictAsffjtZY1pPYIEtjFbZNUFnVu0x45UpuVUKBha+xUOEIs7o0Xery3FYHHx2fleSzBHl0X14lYIkYCMhXfXnUH9FKha45hOrkwSqBY6TJ+sXmWvB5zQmsgOa5BT0N4ie3cYhIhjiul1P+Qd6LC6bKKiofD4YJozMtcvg84FWDyPXs4Py6ZJemxCS08IJsYO74mXD6uQwWoiyhML/gxvrCMpnMITyScw80=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(38070700021)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVBnckptWW53TkN4Ui9sSW1tVjFNeCt2ZG5IWU04QzhZZDFoSDJWRFAzRGhv?=
 =?utf-8?B?TzBWKzllR0FxdWlSR1VSY1dSZjVjZ2VtcUdkdjhPN05zdk9jeGJnQ2EyQkh3?=
 =?utf-8?B?SUVyYjNtS0NGKzVQSVFzL28wRldrWTB2cmZLQ3Z5V0YwMFV6ODNsWkUydHhp?=
 =?utf-8?B?Tm9OVTBqV3UrTTRtTFBzZkwxUE9YeWFrd3hsRXJjLzhUVW1IY2dRdG44bk00?=
 =?utf-8?B?a2FQcDJrMEI4OG11S3NEaFgzYTBCalVaSnY1YTZ3RGVuV2YrM0NteUxNeCtJ?=
 =?utf-8?B?T2F5QkdteEdLanluRThGZFZRNzlJMzJJNDlSbDN1dkE5R05FbWZUZ2NsNkQw?=
 =?utf-8?B?R1BnWTlqa0F0dDhiT0E5MVlCNTkzdE5KMmJPd2dZcmljc0hDMTBMYXZhOU5Q?=
 =?utf-8?B?RFNXVGNBdGdaWm82MHdFYmQ3dDVtem9HQm1adUhLRlRkenJVdUltMTAxZTZM?=
 =?utf-8?B?eFVjd0hvWmdzaVI1RDV1dVcxT1QvYWdWWE1SWm52NGxRSDZFdldFMXh5Q0lE?=
 =?utf-8?B?Q2lvRFEzTDZoS3RLdlRtKytoVjB2bTVFZjY4d0NwV1BZUjJFZE9MSEdEeVFB?=
 =?utf-8?B?NFJYY3VTb3MwR1ZlSkZnU1lmL1Q5K2RabDdPam1pcExCamNyYjhHU3B0eXR0?=
 =?utf-8?B?M0NsYVBwbU54VngxSHRUTVB5cnNYdzBJWVpXWlAxWXJ3US9odFBveU5iRVFX?=
 =?utf-8?B?ZUU5K0lnNTVnOE02dGRHaVdrSVRUMituVUdOdkl5RHk3WmtlS3VRRUR0TTla?=
 =?utf-8?B?R1djS1VHcTV4amw1TVFIbHY5QllxWW9scndtRDcrM0psMHlWWGpGT3d6SC9U?=
 =?utf-8?B?WE41cVJET0Q0TE1YTmFLY1N0eWlxdllvQ3NiMCtrY1lUNDNGd3VtOTdSTXRh?=
 =?utf-8?B?dytoVmRmVnVCQ2Q2eFllU3NmTFdDZHFuTWEwM0NHZHBCRmllOTdtTTBSR2I5?=
 =?utf-8?B?aVdGVGgzVitpUmVXcnlxc2kwZFByU3IxZkxka21ud0N5bzZkSklUdVdJT0Ro?=
 =?utf-8?B?aHBnYk4yb1FWMHFQbWdmaU9YWG9uU2paMXc1aGV3NnVoallVVit1eVZnWmx4?=
 =?utf-8?B?eVZsc1NGQUIwM2hQK1lhTDJPSE55L1B2Vm1EK2o1V3FVTXhvL1VHc29TY3Mz?=
 =?utf-8?B?T0NxSHVzQ2V2Sk0xZGVVWWlLdVFBWFFjNE92OS9XMUFJZGJ4bit3eHEzcWZ1?=
 =?utf-8?B?MFRLY0xKNFN4a3NDdFJpN2FVT2dVOFhKNUFYb25xWXVVQXNPM2dQbjR4KzF5?=
 =?utf-8?B?Q0RDMmZGaWhlM2lNNlRBTlY2Z0g1TFRLcUgrM0JrUkZPTzNLYzJ6WStMRWFj?=
 =?utf-8?B?Q29iUi8wM2hvYTkxc3B3ZWxjTnkyZXJNZFpmOG54ZkxwY3J1TGFtK1ZoU1V5?=
 =?utf-8?B?RVhwT0JjQlhUelNLcVBFVWJMRGE3Y01lT29UVEg2NTZNNHI1YVdqTXNuNmo3?=
 =?utf-8?B?ZElKc2hvSmNkYU15ZHgwekZ3WHZEL0w3TS9PbzNHR1BtRmJFMzljeE50a3ZF?=
 =?utf-8?B?bVY3Qi83ZVdxL0R3U0xwaDBnbVU0S3ZpUXVETHk1NmdwOFBFNXA1bytFTjJ1?=
 =?utf-8?B?NG1jUTRpVDVON04wcURUM2hhbDQ2L3p2OG1PTjFHVUs3NkhXT3pGbXVsRXp2?=
 =?utf-8?B?bThaM3BtMGxIVWlBVmFORjNNeU8yOHk2V3hzOFFYQTd4YklSWmdlWWJMOTQv?=
 =?utf-8?B?bXd2dnY2c2xrdVYzaFBKV1FLK3RhcUZtd2lFTythYU1xd01aRGg5MVBkeU10?=
 =?utf-8?B?M2M5VHdOemxybXkxS3NsT0YvSGtCMWpYR1FjMmdqaEFMcm9CckhINy95d1Ez?=
 =?utf-8?B?Vjk4NE02NVdJZlhPZGhJMDJpQlZSd2JIN0dEdFZJZEZnbnBzVEpndEEwV3k1?=
 =?utf-8?B?UDRNeEN0d2dVZUhzRzQwQk9UZ3F2UmpQOUFkS2tTbGxvV0FBVFRyTWFOZjFG?=
 =?utf-8?B?SjFpZVk1elJpZnRhMEpLRUZmVVQ3MGRRWVM3R0Q2SFp5ZlVZQWFFd0p2L1pR?=
 =?utf-8?B?KzJsUzRkNHJ2NjBvcHF0NSsvcS9yK1A3ZE5rY0daUkJFY1ZoOGVTemJzVXo0?=
 =?utf-8?B?S1h0bys0NGhZNGJvUFVURjRjUU5jQThsaHhUU2dEa0xWeW04amZLSHpIYm1w?=
 =?utf-8?B?QnByWHpISGRUV0YvWmJoendaOG16UGtya1lRQ0twNlgvNVV6NW5sTkUwNWVz?=
 =?utf-8?B?RXlNSWQ5V3E4V01pa0tEZ1g2bEEwZGZ5MmE0QzFCUjJaaXNWcWJ1b3FPQkJn?=
 =?utf-8?B?Vy9LMSs0ajN0NWRkT1gvWVlDdjJnRGtnSjZzTkdqMWYraVUwNjZJelJhUlp3?=
 =?utf-8?B?WHNQZ29WeWd2Ty9iTFA4Z3IybHlzVmkva1lZVWlCTjBqVlBwcU40SDFnUzZ5?=
 =?utf-8?Q?5YqjfGnsGwar0aJ8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B173C0B19C2764695985FB223A9E916@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 5iF6Mua/WKegAIyVtno5VFEeQyNBsPOube2xA7Mq9sNZ+TylqpreRUBOLmYY89M8LWBcIxDo4V8yD4FPrbgua5ABbNteG2+2FE/avIeoqawtoVYAN66rpbhcq9Q7sEa8wMa3FhW+G3uzBjpDowClSDpXLnc8mkLSY/2JLz+HQh6NJAJIDylrKlbhoYKUck2ZmqOY2y8/S2qbMZqpnnz/DGxMoFv3BF1MXNTVzMtnlW6XBH8kLsZbTGNHs+mZI2qDokm3tMcSN38OZYYaJEnVO3Xc5cYoRBGtlAWlb3tdayNmnjrrQgmImM0FNjYbTIRi29VRel343t5o1eUQB1XRVw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d0e200-670a-4703-6b7a-08df0ea45c75
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 18:58:39.7944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pkdEskSWLD2R/R+70RlhAEevGz4JSCVz0vbGsNtpP/5ZZAIyLc4mAhGvXJuk4xLqsjy3Lq2McyttpmcdeHxLW1WzupAYu8QuVqOyorkQaSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9591
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTA5LTA5IGF0IDEzOjQ3IC0wNTAwLCBCaWxsIFJvYmVydHMgd3JvdGU6DQo+
IFJpY2sNCg0KSSByZXBsaWVkLiBJcyB0aGVyZSBzb21ldGhpbmcgZWxzZSB5b3UgbmVlZD8NCg==
