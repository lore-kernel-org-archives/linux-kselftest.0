Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135783AA504;
	Thu, 23 Apr 2026 18:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776967687; cv=fail; b=b/CT1icOyW8oGTQYtFdBT0YX6z7hWynkLvO71Px02Rcvw4Yvo4/b4E0hAH70GWipc9a4kOVVQZmqB8ILWWcYbThcZDXaGph/nyG9wb5p+1A8vKi+VJqzc7ryRzTAykoVexmJ2lPiD5noaEVd+U0iuc01Betd19YIOQkTRn62v1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776967687; c=relaxed/simple;
	bh=tJ9ENt5asapnNvZz6N/8Gv5Nu3KadycOWkaWKECndDw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UACPsw+cOFkVAPqvvbTkOCiAdEHnO986Ff9Woazw8+qfhlt7Fcrz17r7yxkwabic2gOTEumCxqhQphwtoZxKkUDvvrLMd0C1OBzFZIwuVDs6cRP0i8o8RUAE8ZWNK4cjRnP2L96xlK3H7WminVn/zXChwRyP2mBe3O8rTTLYtpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wz7Pj9/d; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wz7Pj9/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776967687; x=1808503687;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tJ9ENt5asapnNvZz6N/8Gv5Nu3KadycOWkaWKECndDw=;
  b=Wz7Pj9/ds7yRf2yzsIOMh3fKwsBpYuU37Gk8b8lBqFJfRIahU8ZOtyls
   zpfhfoI0INirYZ4zWCwcrwUqVg460GV45/xGpDND0lcPIn8RZvNLy7SV1
   TiSrhXqpWMBoKNmwnL/dXu2Fw9Kgzpli8cZ1s4GGTtkwHNsRuhJYz5Rmy
   Pg7gBbdiH7F6JU9j2jf2BDcFuxNl4Dz8Y3VDJsQC0Ln7/2LVGqZ8dQbMq
   PsFOucrfr/jauJLXSh+pyLLZ5dzLq90Q6WQj31AHp0Vy0vblAVB/E0aNA
   kPSUyqTK1Vj9HUywyitUDiYbx/Ui+Myit8K9YnGK978A+956jbqc7fa6j
   w==;
X-CSE-ConnectionGUID: tuL7mcTrTTu0Nn09arCLuA==
X-CSE-MsgGUID: zrNndA7WR6uP7EJLQPs+Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81552626"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="81552626"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 11:08:05 -0700
X-CSE-ConnectionGUID: KdxzVOI3TCS4y8IZy2wn3g==
X-CSE-MsgGUID: VWs38GgDQ+ahXCaGBG5NXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="234512294"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 11:08:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 11:08:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 11:08:03 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 11:08:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrPBz7aNhlsY85Fhxaf6QJHbnp1xK2y6n3ganveww5RoekzFJbbq9IpCNl1o0L8Zak2P193yYxcE/Vidg6bOULORItSe6SWJKH9BeyvTE1CNeo00FHFuk1lbZN52ZHAcVJjXv5VMcE8WVfBjt42farOVFIl003LwlMnfIcOKHuqMnc5DLEHs4F1JMUi4PFhZhnPnD3z+0kccyTziZBYt2G1i25PdGO+TdkkkGj9nn5GYDvVcM5GLfk7pjf+2Cq0P4wKzUa2+bJiNRGws494jhrsGSnV+AqldmSOJLkQkuOlxKC3w17X+IQ4rvv5KCDGE+hPeczy042N9ujX4DbD1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ9ENt5asapnNvZz6N/8Gv5Nu3KadycOWkaWKECndDw=;
 b=MbH0nIyb2UjefKek+u4IR55bhaVFm/t7aGUklzNqOKbTJ9pOgsX75ag5RFGRlhcbXGiKLUvQtaD7mlOppGm4C623B79qSVoCdPXBr6ahMq8dDLKG2Iw+YZFmSNq0xfAQrM3tRb1vW2xvLHbtoJ2e8lldDFvrIdFYeurvSkW0/y5QCNrWoYAQfNY7sVOe2nqC7OS620tjYCliekZmn/S3NZsVYsZlwoKHKCQNiJE2qL860KP/SJ6fcnlVLxwqb1dWVamK0CjYzRMP+UFz9vmXawAulabwxvLyACLze4iL0qgKc3B2QNyIemluCtT/iQZuSsmYHLBsgDFqSrSDvGnG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 18:07:58 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65%6]) with mapi id 15.20.9846.016; Thu, 23 Apr 2026
 18:07:57 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>
CC: "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "justinstitt@google.com"
	<justinstitt@google.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "morbo@google.com" <morbo@google.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "xin@zytor.com" <xin@zytor.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "oleg@redhat.com" <oleg@redhat.com>,
	"hou, wenlong" <houwenlong.hwl@antgroup.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "m.wieczorretman@pm.me" <m.wieczorretman@pm.me>,
	"peterz@infradead.org" <peterz@infradead.org>, "tglx@kernel.org"
	<tglx@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "bp@alien8.de"
	<bp@alien8.de>, "ljs@kernel.org" <ljs@kernel.org>, "perry.yuan@amd.com"
	<perry.yuan@amd.com>, "jgross@suse.com" <jgross@suse.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "Mehta, Sohil"
	<sohil.mehta@intel.com>
Subject: Re: [PATCH v6 1/3] x86/process: Shorten the LAM tag width
Thread-Topic: [PATCH v6 1/3] x86/process: Shorten the LAM tag width
Thread-Index: AQHc0n4pnk/2QsZth0eNvZ4fq7IcYbXrYMEAgADrJ4CAAKdVgA==
Date: Thu, 23 Apr 2026 18:07:57 +0000
Message-ID: <9ef71635a84720f22290699d9f0606e1736b7638.camel@intel.com>
References: <cover.1775813245.git.m.wieczorretman@pm.me>
	 <79720f2640839b15f22e3618136b084cb376456b.1775813245.git.m.wieczorretman@pm.me>
	 <8bc4ff4b7491c6fea6e17583a6fa249961c08275.camel@intel.com>
	 <aemzYE5td11cWydN@wieczorr-mobl1.localdomain>
In-Reply-To: <aemzYE5td11cWydN@wieczorr-mobl1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|IA1PR11MB7755:EE_
x-ms-office365-filtering-correlation-id: 86eb0a05-3901-4d83-6086-08dea1633fe5
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: LVxCUedfhD4Gy0/ttSvvaIyOincPd6ZGHM6imLaRyhvSVEeC2cu3UCuZN/ues61jxsk4pDVLJ/lXqDgdZmOaRgksXND7iF1qA1H5IeEZ5pG/0TSHNo3jX7n2Rv9Ea10IIma0omMXcGBMJOf45CrADp9LsgwqAJMjCmpS6uZSKRkl1e4ThksHI1bVK35FlcX5u6utcesVbMxI4bpnC9i0ND5WwZ0ZnnLDBe8LZmCoFVO7/SIY4lIGk8wy10DLHwdoy7/ctRF4aB0tyuh/k93CWeMhcH1oDrxZnKzcTJar/40uGoF8j/myvimIUO7rPOkTQhMFZRruUH2fe/OdL9RVxhCT5nF72zNykzk8DOUdeQR4AWcs9adaERM6qRXNqHG4e/aAFGapTJZP+4WHeOtBLhmT/AAUPZOjpCCJEN2EFQNstHcnuFEpCpVCDN1eF5iIv7fdyfb1jGnK/weaFif35TbMQHFdBID7ONKo7ok6XByncKAMZrdUXDG+2lIrVVByoEzpzvbaAx1b8XBdlA+Sq+tWXAKRs4fL2SnATcyd0/RGEIq9AROrlOCAl0kkeB8JXPwOPYlh+6lTC8I/7gMvPe/Xqi16+kTZWSnvG1lhtW/NYRaQh7SCYq+4ROa5TyVQt20aXq4XubUrowrSeljWb9OPyOKSUQbD/nuKscnMy/iJfnBbnBM1WEaTC4bDRbg2/D+zsvIOBVS3uFPhfarH4Y57VjSh+jrhA1Qs744xAm2EKt1dVukUq/3XqCefqgUmXNhmTqmaCFKqr6Oj1u9nfd/G1aSXl+WYkn4wu5GOaxc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzR4eXVRdEdyaDJXMGp6QVFvUk4rblI2Q014L0RvdllBY0xxNzlpUU0wbXZJ?=
 =?utf-8?B?NW13Y3FFd3dmeWFSR3A5eDRHNk5LUDludFNTM1I3M2dNQ0psWkpZMk9iM3lq?=
 =?utf-8?B?M09TQnVZKzhmcjA0dmNFTFZWbFRrSWNYbXFKcFdiak5WYXk4OWFoNTZHM3U4?=
 =?utf-8?B?Ykp4UnRlLzN4WkJoaDFZUWtCRCtwNU1ueFgwMUZha3dQVGpFSzhYOEltMVZO?=
 =?utf-8?B?V3dYVHp5WklmSWo3cEdMK0lMOGtWUFZxL2FPN0tyU3JWd1pnRFl4VE5GRWMx?=
 =?utf-8?B?WnJqWE52L3VMeW9pR3JBWjB5dHE1UFdYZGhqRUg2dHB0Y0NqNTRrcWNMQnZT?=
 =?utf-8?B?a29NVWlyL09BUWZIcTZPbDN0OXR4ZXh3dzEwR1FhSmpoaVpzNUZkVUlLa3Uy?=
 =?utf-8?B?elBQcWVua2JzSzdlUnhLbjcvTmczRVhCMitSaXFWYUY1ZUxxckdmazVTMllM?=
 =?utf-8?B?eWVnT1FrWFR6Q1FRNC8zd2xxb25GUUhjZGxvb2w1ODJ2c1V1YnFhSjhrTC9T?=
 =?utf-8?B?cmFmZ2Z3clJJTEZ0Yk5NSlZhU3Fic2s1NXhXN3FEQWFPTnFicTg3SndySXpZ?=
 =?utf-8?B?VjNHWi95Zm91UUpnSFdNeVJwL29ZYTVIUGZ1T3VaN3JtY0tLN0FXT3VaNi9q?=
 =?utf-8?B?aVRZSy8zTmNWajUyN1B1STJjZGF5dkpRTlgvaTloRGlPU0VtMTBZRE13SjZn?=
 =?utf-8?B?ZTFqK0xMYzJvejFIVzd2b3AydHNXQ3hxMGRJUmJGRWhDdExXTTlFS3JZV1F2?=
 =?utf-8?B?VTNDOFhpUUhEamp3VldpcGgwUlZEVWNqU05Ob2dIR3A3eTIzVk5pbGVJc01K?=
 =?utf-8?B?R3Y0M0luYjZmaU9KUXVjNTR1SXo0dXhDQnh6Wlk0MjVFVmdTZzBmNmxxUWRP?=
 =?utf-8?B?emxkT0NqRVVIb0Y2VnArQitMbzdhSWIvL3JRZzZMcHJvNVNZblhkRHU0STlZ?=
 =?utf-8?B?S1F2dlEyM2l2OWNOb2JFOGdmYVVPY3lLZFFOemE1RFdTTzkxQ1dJaWEzcklj?=
 =?utf-8?B?N2xycUVLTnZXYUpJM1RHUWpuRVREVnYvSm4yWlIreFRyZlNzdHlSMUQzcndh?=
 =?utf-8?B?ZlEwY1lVeVZobk1Cbko3TzhUYjU1eVVnTmVMQ2lrN0drL29ZTVhSbTZLYUdP?=
 =?utf-8?B?b2NUUERjbUV1S1JQVjNxU1YrREowVjZzUmduUmFiZ01pKzNFK3VGNUlRSUhH?=
 =?utf-8?B?ZjJoSzlBVnZkUnRCMk9TWGxKc3dyTzNDenlaVnVmaldVdHRFVlJzT2NiUStG?=
 =?utf-8?B?cGVLVlF5bm9LYk1XTVU4OHNQTExYTzFKbzRtcGwrcmo4ZXgxaUk5aXJPMTlM?=
 =?utf-8?B?YnNEVFVwcHdvL0dhLzB5eUxqdWR2M0h4NjkxbmtTMG13WkdnY2Rjb0RmMEZO?=
 =?utf-8?B?MUlEa3lEVk5uNnNRSk9BNTNIN3ZFbHRkZHRmd1lvcThHY01rZnRlY1l6UjZs?=
 =?utf-8?B?a3pHZkpRZmltU2cvWGdRRnJVbDIwUk1zUjRMbWtHVE1DbGJUVDhmNW1XdFY5?=
 =?utf-8?B?MVYzZ2cwcGRXSVAxVUE0Um0wS2h0UW1VSzZ3RVBPWHVJSmJsMk84SFNpR0N0?=
 =?utf-8?B?NUlZOXNlUU1DRSsyYmsrMmd2VDcrVURHN3R4U3VSNW1GV3JVS1I5VG9MQVNh?=
 =?utf-8?B?dHdWQlMzSmdNcHRTci9jK3BYcGJGOUErbmJjQnFwOThPbW5GaTlQblAyWE54?=
 =?utf-8?B?KzJDRlUwT09DYk1wczRzbS9TbTdCYW5ndFFyb2dLRUZESGRCWWFXWlRNZW02?=
 =?utf-8?B?cExRdHd6Z3FDUVNuS3huTElldGN3azJzUzNST1YwSTFHVzhKbWtwK1lSYXUx?=
 =?utf-8?B?cmZ3d2RSQnR4Q1U3MXYrT2l0Q255VXpyUVBMMEpIdFg4SjdFeHBzazFRZzNM?=
 =?utf-8?B?bkJqSmFBUnlQZ2twRHdQdW9SRnNYUDN0Z3B6QkI1RnhDVGR6Zm50Sk5UMHA3?=
 =?utf-8?B?b0lMVnhHRllFR0k4WE54NlJ6V2NKN2hoY290NVloakVEeHZXd2FxNWYrMFp2?=
 =?utf-8?B?Q2loNU1OQlM4SGVEZHFObzVENVBYdHN6OUd0bG1CWE10VkJUZHlrdktjSU1l?=
 =?utf-8?B?NHJFaTM3dmNtVldQNVNodWtSaThuaC9BWC8yR0pFUHBlK1RYcURiaXRYQkJi?=
 =?utf-8?B?a0cvVVZDaVhaVFNNekFpZXdmcFdnYXdkOWtpTjVERXhvSmRaenZ3QVRmOGF5?=
 =?utf-8?B?OTkzdkIwRUhROENXUWo4ZTUyaWxsdTVjZGRHOE1yNEVHc2UwN2VTNThheXkr?=
 =?utf-8?B?QWdGSGF4QWRiUk11dGc2OTlmakdtcGRvZU1uZ1Q1NnVHd1RDNXFGTW9pK3Q2?=
 =?utf-8?B?WXlJdTlhN2pmeldIMXZXRk9QeDZKQURVeStZNTN5cTVOWWRUVCthQ01LYVJN?=
 =?utf-8?Q?55+mbKApyA0/X8eU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5023E06BF7CFEB469F0D5315A1E569A1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CCayP0tJIpdged8UOQhEzHlCEyNLo0fwEubt68YV7CEQt2U/UQExUclxapL+fBmFen/ddsJL+XrPIvED7pt8BFKUv5MMKrj7xIUVegPG2kHYq0tchJX8AnamZhzGRoc4LJqdPwHELgIlQWlc+66M/z/UxxUL+tud1OiWI1NlNvJRsagkmynWpIPL28NidYQ0phxx0pp0e7tYNAa3u60SjBnluqliyCUY0WfsrwrIaZ3lukkhurXAB9s3TwMreOpTvIjM/cpqiCq1rhyuVA6Yrl/1K2jGPit4UB5XYUyFMhHGSJOj+B21Zjd99swFCqs+SLa3kVXqLjzXf4mBHh7U5Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86eb0a05-3901-4d83-6086-08dea1633fe5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 18:07:57.8807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cEQBmhOljm8pUPB25BiP+GNwueg/U7mjAE4l54ZrhAhmUOJi9rMS+RXnS3nvXhFXuIZKCa1InYDzeHqmJWHyrZ8WZ9aUcvEtYdgbIyqClUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7755
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTA0LTIzIGF0IDEwOjA5ICswMjAwLCBNYWNpZWogV2llY3pvci1SZXRtYW4g
d3JvdGU6DQo+IA0KPiA+IElmIHNvLCB0aGVuIHRoZXJlIHdpbGwgYmUgYSBkaWZmZXJlbmNlIGJl
dHdlZW4gdXNlcnNwYWNlIGFjY2Vzc2VzIHRvIGENCj4gPiBwb2ludGVyIGFuZCB0aGUga2VybmVs
J3MgaGFuZGxpbmcgb2YgYSB1c2VyIHBvaW50ZXIgKG1tYXAoKSwgZ3VwLCBldGMpLiBJDQo+ID4g
ZG9uJ3Qga25vdyB0aGF0IGl0IGlzIHVuc2FmZSwgYnV0IGhhdmUgeW91IHRob3VnaHQgdGhyb3Vn
aCB0aGUgaW1wbGljYXRpb25zPw0KPiA+IEJlc2lkZXMgdGhhdCB0aG91Z2ggaXQncyBhIHdlaXJk
IEFCSS4NCj4gDQoNCkZvciBMQU0gKGZvcmdldHRpbmcgYWJvdXQgY2hrdGFnIGZvciBhIHNlY29u
ZCksIEkgc2VlIHRocmVlIHRoaW5ncyB0aGF0IGFyZQ0KbGlua2VkIHRvZGF5Og0KMS4gV2hhdCBn
ZXRzIGNvbW11bmljYXRlZCB0byB1c2Vyc3BhY2UgYWJvdXQgd2hpY2ggYml0cyB3aWxsIGFjdHVh
bGx5IGJlIGlnbm9yZWQNCjIuIFdoYXQgYml0cyB0aGUgSFcgYWN0dWFsbHkgd2lsbCBpZ25vcmUu
DQozLiBXaGljaCBiaXRzIHRoYXQgdGhlIGtlcm5lbCB3aWxsIHN0cmlwIGluIGFsbCBvZiB0aGUg
cGxhY2VzIHdoZXJlIGl0IHByb2Nlc3Nlcw0KICAgdXNlcnNwYWNlIGFkZHJlc3Nlcy4NCg0KWWVh
LCBJIGd1ZXNzIEkgdGhpbmsgdGhleSBzaG91bGQgc3RheSBsaW5rZWQuDQoNCklmIDEgZG9lc24n
dCBtYXRjaCAyLCB1c2Vyc3BhY2Ugd2lsbCBoYXZlIHRyb3VibGUgdW5kZXJzdGFuZGluZyB3aGF0
IGlzIGdvaW5nDQpvbi4gR0RCLCBldGMgd2lsbCBub3QgYmUgYWJsZSB0byBtYWtlIHNlbnNlIG9m
IHRoaW5ncy4NCg0KSWYgMiBkb2Vzbid0IG1hdGNoIDMsIHRoYXQgaXMgd2hhdCBJIHdhcyBjYWxs
aW5nIHRoZSB3ZWlyZCBBQkkuIEkgZG9uJ3Qga25vdw0KYWJvdXQgc2VjdXJpdHkgaXNzdWVzLCBi
dXQgaXQgc2VlbXMgY29uZnVzaW5nIHRvIGtlZXAgdHJhY2sgb2YgYXQgbGVhc3QgdG9vLCBmb3IN
CnRoZSBwdXJwb3NlIG9mIG1ha2luZyBzdXJlIHRoZSB3cm9uZyBtZW1vcnkgZG9lc24ndCBnZXQg
YWNjZXNzZXMuDQoNCj4gRG8geW91IHRoaW5rIGxlYXZpbmcgdGhlIHVudGFnX21hc2sgYXMgaXQg
d2FzIChiaXRzIDYyOjU3KSB3aGlsZSBhZHZlcnRpc2luZw0KPiB0aGF0IDQgYml0cyBhcmUgYXZh
aWxhYmxlIHdvdWxkIGJlIGJldHRlcj8gVGhlIHVudGFnX21hc2sgd291bGQgYmUgbW9yZSBpbmxp
bmUNCj4gd2l0aCB3aGF0IHRoZSBoYXJkd2FyZSBpcyBkb2luZyBjdXJyZW50bHkgd2hpbGUgQUJJ
IHdvdWxkIHByb21pc2UgdG8gbG9uZyB0ZXJtDQo+IG9ubHkgc3RpY2sgYnkgdGhlIDQtYml0IHRh
Z3MuDQoNClNvbWUgcHJvcGVybHkgY29kZWQgdGhpbmcgdGhhdCBkb2VzIHRoaXM/DQoNCmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvcHJvY2Vzc182NC5jIGIvYXJjaC94ODYva2VybmVsL3By
b2Nlc3NfNjQuYw0KaW5kZXggMDhlNzJmNDI5ODcwMS4uYTAxZjkzNTg3MjM0OCAxMDA2NDQNCi0t
LSBhL2FyY2gveDg2L2tlcm5lbC9wcm9jZXNzXzY0LmMNCisrKyBiL2FyY2gveDg2L2tlcm5lbC9w
cm9jZXNzXzY0LmMNCkBAIC05NjUsNyArOTY1LDcgQEAgbG9uZyBkb19hcmNoX3ByY3RsXzY0KHN0
cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgaW50IG9wdGlvbiwNCnVuc2lnbmVkIGxvbmcgYXJnMikN
CiAgICAgICAgICAgICAgICBpZiAoIWNwdV9mZWF0dXJlX2VuYWJsZWQoWDg2X0ZFQVRVUkVfTEFN
KSkNCiAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBwdXRfdXNlcigwLCAodW5zaWduZWQg
bG9uZyBfX3VzZXIgKilhcmcyKTsNCiAgICAgICAgICAgICAgICBlbHNlDQotICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gcHV0X3VzZXIoTEFNX1U1N19CSVRTLCAodW5zaWduZWQgbG9uZyBf
X3VzZXINCiopYXJnMik7DQorICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcHV0X3VzZXIo
NCwgKHVuc2lnbmVkIGxvbmcgX191c2VyICopYXJnMik7DQogI2VuZGlmDQogICAgICAgIGNhc2Ug
QVJDSF9TSFNUS19FTkFCTEU6DQogICAgICAgIGNhc2UgQVJDSF9TSFNUS19ESVNBQkxFOg0KDQpJ
IHRoaW5rIGl0IG1lZXRzIG15IChzdWdnZXN0ZWQpIGdvYWxzIGFib3ZlLiBJdCBpcyB3ZWlyZCB0
byBoZWFyIHRoYXQgdGhlIG1heCBpcw0KNCwgYW5kIHRoZW4gYXNrIGZvciA0IGFuZCBnZXQgNi4g
QnV0IEkgZ3Vlc3MgaXQncyBub3QgZ29pbmcgdG8gYnJlYWsgYW55dGhpbmc/DQoNCg0K
