Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793905753;
	b=CYkhpEjJorpJ8wgs95C4xjSMZvEXj8Hpzo4u04J3lF4rF+rfdraJJoozJDLH8gfFC77y
	 +Cv9Aqm62JX3gJ9FhZlTnqKki0ZO6XZLA+/RpVkX8OwTk7Tz4R3tzoVlwEsg6qYeo3nai
	 kyl2w2Z73Cw0Nh8XAn8zDDJcvaxX1m548DiEH5DURe47SAIvySQiLpbKs6wDI41plsoEy
	 GKyB305d4M6OdPvIG7KjFkZ/V1xUFOXsVijn+zsPDz5abDfoWNmAmAMawfGn3gkT1alY8
	 InsMaMvHd22iXOOTAOzyG2J5adCKk5EZxcvV+1U3ZgZ2iB8IBEbfQ8dgBk9E48NPJ1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905753;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=IMHvZVYq67S9ojkMiIZEHLdeJxq1HHwnR4NMsLB51Ys=;
	b=InP4xs2JAKgAonp6S7R15PbZcOLg+6fo3JNMcMIWaIEuhi4eYac5nS6UiTm7oJ9rRYn/
	 aubcEhhoC2qz15eZHx1EuaSuIDN/JZX4xInblP2au9sdhfvdapBKJmA1nMzFKHEuVoYRR
	 IaP2YuS8K0K9ZDw8AmyCdVMSWs2tGXCEynWkjsoqb7EnwgAeluTlofEgXsZAfZwYPwjFu
	 5HUPzXXdUWVNsRBfwsDJHQkNjp0aSYfpXAuJkhM0svo/ulZLrXr3I5AcUvl1oLG2o+u5K
	 Rr8eYHWWJXdeUi8SlXY9X1lxb5SvvPKYWWqEtzlnVLBKN9lBnyvsUE3nw0QAqCf5/Bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XI6fwf6C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC9606A31B;
	Thu,  5 Nov 2026 19:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17EC9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XI6fwf6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793905752; x=1825441752;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IMHvZVYq67S9ojkMiIZEHLdeJxq1HHwnR4NMsLB51Ys=;
  b=XI6fwf6CyQ2grSPG3+/0Naf595hN4srglmyaAKEh4pEvCDsFN5Nh3+B5
   QcaLiiYiQAW6KsjzP7W66PDb4A1Q1QgbBrA3tkhSTpIJudXPG+ni4zgMx
   HgJI1SwvpC6J4ZvNdaF7P4oIr96TUHAWrbgMGLwiIso5Pe4/2r19m6Bzu
   VdQkC9bgYP8KJ5NV7gkvRHvZBlXAoRxm5U6Uj/Z8V2CI+hnhx3SizkPh3
   YOxEXVMtl4QW6mrwI5eWNPn6+H2YXzFpyXSad6FN/Lx/HTZiTy9O675c2
   oCBFbVTwyLCfer0w7vsokF4SLT7UBZrATEUo5Icu2IQ4Drezclj8wk4dW
   A==;
X-CSE-ConnectionGUID: WBy28H/nSF69ZhjbSmctLg==
X-CSE-MsgGUID: hSumXVLLQ7ycUQnQUZKftg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2595574"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2595574"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 11:09:11 -0800
X-CSE-ConnectionGUID: 4I8UMxPBT662PAs+Fu3OBg==
X-CSE-MsgGUID: +bA331hdRa+jmHq3TZbeaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7257091"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 11:09:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 11:09:10 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 11:09:10 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 11:09:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2ubqxnl6XGcQNp2DE7fRX6GkgFCzUCxqmyt2PC+sUcc9oKV0evkkALyg3AMi9Z2fG5emiY4ZKZ+DqSOvFyAZ0nYPUVK1ycGBczFMJWDGCtbf6IKsfl4rnDz6k4vVGU8q3xA95XNiA9YZZEHCLvGUKQT6p9I/d8Rzlvl4zufngxACDwTwdVM4L1ql9iVQ90z8NiMmuZrUior+6UIbZvwwdmgn6AFT04QE7Erj7MOACTuRNz6NBvTLgZqTyFGOzu6ur9QztYVfBHBE1j4IaLK1RzIMP6nFipWcVnuswZ2LEZ+hXt9vSW7jyKTXNUTydAb2+8W44YRw/Bc0pWZAk4WQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMHvZVYq67S9ojkMiIZEHLdeJxq1HHwnR4NMsLB51Ys=;
 b=nYonJPFvgU+8ajze687U5LWLbMX1VWiiyykpaC24IYtvx7XUZyiCXVMQwJokXibGcJ6WmMwuO2qmBOIoaxmvrqLOxPyR1kpbR24ea33iDrbF8VAudQD8xBch2YeXzgmZKqPo04B6KtVr39YXT5N3gdML5NZV7kiq9M/iNUgigte339bvqVoaoZoZNG44jn6PNsCLOy2U2CzK0R+LEVbc1+HXB68EnpegBqnMmPwYykDsLVhM+0NpsJMCHBlm1sq+oBTsL2RuXqX7V8kOWAi1m8cnQcC68yb7Au2aZi3b6rWWODrq4neF5VEzxlb6PeS+DbO8k6WLz+4RtpEcQPDjtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by SAVPR11MB9549.namprd11.prod.outlook.com
 (2603:10b6:806:4e9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 19:08:56 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 19:08:56 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "sashal@kernel.org" <sashal@kernel.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "tglx@kernel.org" <tglx@kernel.org>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "hpa@zytor.com" <hpa@zytor.com>, "shuah@kernel.org" <shuah@kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] selftests/x86: report a skip when shadow stack cannot be
 enabled
Thread-Topic: [PATCH] selftests/x86: report a skip when shadow stack cannot be
 enabled
Thread-Index: AQHdbNIsmx0qyW/3YUawWVAG6Z4GRLcf2JCA
Date: Thu, 5 Nov 2026 19:08:56 +0000
Message-ID: <4bc04525a02fd3fbc39b010acba59c4ac53c01b0.camel@intel.com>
References: <20261105030245.1241500-1-sashal@kernel.org>
In-Reply-To: <20261105030245.1241500-1-sashal@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|SAVPR11MB9549:EE_
x-ms-office365-filtering-correlation-id: 538bc771-d14e-4ef4-83ef-08df3b703d6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|18002099003|22082099003|38070700021|56012099006|11063799006|261026140227099003|10067099003|261028144727099003|261022105027099003|261009223027099003|261026121527099003;
x-microsoft-antispam-message-info: za2as1fpXw4QnFXCW4TNhTft+SZrDce2AmIlQgOVuyPbvqttmCyRLmvfjSmD+6XcF4TBlNWEglGsF99LBccA43odgJgMqkRd3KoM+UiN4jYqTdJ67ylMtnjvKgjnHS/akrZD0YooSQDRGnJaq5D0AA4vZM3UFTg/bcVWfkKoHSajJbeSQ3IdQ+Xs7h2IIlAPuGqLbM2FtbFvnAC1rVJxt/jbQQqDjyJ2b16db/FnFPN6XuJlC9TCv+DOta3T7cqlD/0vmFvc4rTb45/ODRAHZPa8FivoDDwCmStiQojSrPFXGuglHn95tj7ogcec7gdtJMPPLDHwDA0MMD9DbsTOCpVumUC3ODq4/yENsVbAqoQOTU56eZrXhBvzaKk7WHy7DHCKbjFRwnqXFA1U/XUK430fDwVm2NeQEPdzHXCMVbtuwEHgBiMZzacT66M+QtBSkeTRYhurxnIrQJWcBQDima0uIsxsKmmGtKVr9+XzZyEccSs7nmeehlgF007/BYKFTPk/5RT8zK0JxBSCIl5kDuOz0N3U+t9Ugx/3epYvs/QMkNU22zr/vf9vPOqk3vzLjttnyB/AJemqRpMnaAT9CjYZRzSzuw8dIS+FGFIl9l7e/sqq/gsZSV5nd+n6evlXpoSFKFU+7CrNetUiCGoPeU+JWJovDENFMvLsJRse1YwPDtoLm9m9SeSq/cyLgcuuHZfORQkNsKZ7H0MhpgZZFYW5HhbirXPZTLCC9cQQuMs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(261026140227099003)(10067099003)(261028144727099003)(261022105027099003)(261009223027099003)(261026121527099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlIyNGpaNnZuUDFHekVkbjgya3Y1RUthQXNheWh2bjZEUlUwbGRmaVVrRGtk?=
 =?utf-8?B?MTBNMEVPc3dvenBpWTd0bytVekJOcHY2V3VQa01hS2FRblpYa2hmTlk4Vy9m?=
 =?utf-8?B?aFBmWFpvQVBIOEc4SytXcFFKUWVCRWF2bmJxUVlyay9Xbng4MGU1c1NJTDdU?=
 =?utf-8?B?a3k2cTluNXl1N3lvTmFndGN0VjNJY3FkMzZJSmpYTjl6MW1BQkMwZGhvdjdH?=
 =?utf-8?B?NXdWUFBrOHdVNjlucDFzM2o4aU9tQ01iSzZtN0RTdUNjSURaVUFTVGJWalRk?=
 =?utf-8?B?dkR4MVhWTDllRnJwR1MrWjExMThnR1BJRElqK05IZEFKNS82YlYrUWRaSEZY?=
 =?utf-8?B?Y25qV0JiSG5qNENmWTBPblJwZjBYT0huajl6bjFEUUpXcU10T2xCYUFNVTBJ?=
 =?utf-8?B?OTRMUGcxQlNaTzJZcEVoZ2NVcWQxU3JRSlN6R0pzQUw0VWJEODZwdVNHTFZs?=
 =?utf-8?B?bzNPZ2xvb2xucEYvOElzanpoQVU2aStrVWdGVnlOOGJqNTBjSU9oRnJ3NmpG?=
 =?utf-8?B?S1Y3RG11dzdKVndaNlRXTkY3Y2VudGVnbVZaMWNEU0VrZ0laRWpzQXE1NmFK?=
 =?utf-8?B?aGZmc2FnK2VpNHFPSmVrUkZOcWdiZk5ESnZHUDNmcVJ2SjA5T1pHVDZQbGpq?=
 =?utf-8?B?dE5xVEo4Nlh6MjZQdFBqUTBLSmRPeEtuSmVqRjVJZDlxTVRNd0ViTEpEb1JC?=
 =?utf-8?B?U1Z4MG5uQ1BrSnRwYlhpMGFDSFNCYTNBTzhxeE5oeTlBV1lTdzFZMytFQXRT?=
 =?utf-8?B?UXV4enc0QWl1T3pJQmxzbzNFM0l3R3dIRXdweXE1WGRoeTJPWHcwYnJ3UHp6?=
 =?utf-8?B?VG9yM2tWT2twUHZyYTVzRU9xTHJ4bE5iWEFaQml6cDloL1R3UlN3Wi90UENJ?=
 =?utf-8?B?N3R4YmtaYnFwVUo3SmRlSUUxU1o0WTVoUlpNYkErUVFHeVdISnhjMDlwVkdM?=
 =?utf-8?B?UTNiU1VOMVJKWTdNaktDWmc5dHljcnZLdG16YjBQWmpmV2thczZVUnAvMG1Z?=
 =?utf-8?B?UG5VK1Iva2RTemRBZEJrR3NhWDFnRkx4UFBFMHhadGFYQVAyRnlZUytpdFd5?=
 =?utf-8?B?cG4vUEE3OE9QR0lqYkNYUnc4VTBYWlZaOURHd2tOenJSWnVGQkxvWjhCdjMz?=
 =?utf-8?B?dDFLdjZ4U3d5blFnVnRQWVErMzYrS09MTnVwVEFHdnZ3bVpxcHM5SWYyNXNR?=
 =?utf-8?B?SkFVZjNiL3FiRkxIN0ZFTkpwajlkK0orWDB5MUlGR1VxWjVrYlVnalVRL0gv?=
 =?utf-8?B?ZE1aS0V6eFgxcTBRNnBiU0IydFhjdXhnSTNQeXNSNWk0Z3FPQ3oyNWtFVW1R?=
 =?utf-8?B?Rk02VDkxUFZrWGhsTE1DZ0R1d3hnN3B3dElTc1FrSlE4MHR5N1FrdHl4bm1Q?=
 =?utf-8?B?MFVpWjJXMjkwNzlFVDFXbmFhUCthVnJiZHBrYWRYbEZuKy95YVFmdnYxVEhL?=
 =?utf-8?B?RVRuNmt3b3ZqWU4wQko3SHZ0Q3AvQUZmY29YK3ZqdmthcVIzcGxEUUpZT3hP?=
 =?utf-8?B?eXBOUS91d2NSLzlyWjVTbTVweXloVW1vZHZSQTI2SUc4MkdneUpxV1VNWVhk?=
 =?utf-8?B?VjRsZ3hoM3p5T1FzT1ZIY1MxcHNKMVZJMmZOV2x0a0o2ak44MlZKWWNoNWV4?=
 =?utf-8?B?ejRydDlqSjFDV25QM0Y4UE9KMFZ3RXBCaUdmVnJ0MmJ6RU5Ha1FMaEo1TitM?=
 =?utf-8?B?RnkyUXh1ZXJNUkpIdGxESm9ENjUxSWdKUWZHcTV4MFpwS0lwMlJqRnBRTjhE?=
 =?utf-8?B?NlV4N010OXYyRmFtdW15cm43SUMvRk5aZ3g0UEZwOEtzOVNhQkdqMldRcHJN?=
 =?utf-8?B?MmtDUG9Qc2tia3ZPOVh0b1IrOXQ0N3N1NzZEZmxBN09GMmUxUi9zKzZJd0Na?=
 =?utf-8?B?U0VlUHdSMjRrQ0dncE5GNWdaNmxTT0hVUW1aVFdVUFM1a09FcENSTklSQVgy?=
 =?utf-8?B?L2tkMkk1TGoxQ3NUdDkwdms4TTBHa3hSWmpxRDI4ZnlmeCtqdk8zZE5nWWNq?=
 =?utf-8?B?N0s0Zk1zTUdBMDhQaEhhZmF5QWJsVGluU3A5c0dOMmNpS050aDN4eDBteHA0?=
 =?utf-8?B?ZUQvMEpOemZ6WXdhNGsvZktXWnhBaFhjaXpLRzFOenp2ZGZxa3ZIbG1JcUZS?=
 =?utf-8?B?VzhyV0NvWWd3RW9wVEozTVowM0QzN2VMRTNKZVVkdmdMZTlPd0tIVUdEYlFq?=
 =?utf-8?B?dWxNdGhaN3Y2VVJ6OXBiZUY0ejNEdUJUOGZlclhaQ0ZwMFdRejBQTXBTUnBQ?=
 =?utf-8?B?czBYM0RxcFArcVB3NFJla2pEU1F0RVA2RGZERGFKblBhRGEvVnMrMUlBVG9S?=
 =?utf-8?B?cmhMWjIza2VEZU1kR1NkYWdRczBKQkJGdlFJZFZEVUNLbWt1MXVoa0llajBk?=
 =?utf-8?Q?KRcbV+sKTKsLqFpY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <547B15953EFAA247AC50A985E50DDF2B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pVC0C2B3h9XmeLryVQWcz376ad1OvYuHYy06cY61nhG8LlReVa4AtVXBfEmqyJfksQQ0voqUgsJTesGX0r9VRedYN+oMnaCeL0YMdqi9NUOf4WGrxhmaEpYn3ktdmVZKAYbNIVXE+fKGaigsgQSll5d2Y8OoTugpb2jhEKOQ+n0gEczSCSiddSm5x433PJv8S2aSjAtUQybtMAqMH3hlb6RNEBjPE66uLZMpcogrwGRX49V0de1r/ucUA0xGnplugs8IPJz6j0bueDI4yBgiAkj50qBeoLGcBiFkCUWKLl2Fz3/ma29ovS7tMDh3bfFrbGYRic1BCVd6CfjTxThpvw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 538bc771-d14e-4ef4-83ef-08df3b703d6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 19:08:56.2238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9/fB3ZAg0SuDwtPEVCKEMH/hXyJBiwG6uHWZtMzu9YSVcRzpV86E0VpUxAaKLWAX31ly5JLenV35PAh+lk5r8jdAaHZS2LOe9R2fqJUA/JM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR11MB9549
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTExLTA0IGF0IDIyOjAyIC0wNTAwLCBTYXNoYSBMZXZpbiB3cm90ZToNCj4g
dGVzdF9zaGFkb3dfc3RhY2sgcHJpbnRzICJbU0tJUF0gQ291bGQgbm90IGVuYWJsZSBTaGFkb3cg
c3RhY2siIHdoZW4NCj4gQVJDSF9TSFNUS19FTkFCTEUgZmFpbHMsIGFzIGl0IGRvZXMgb24gQ1BV
cyB3aXRob3V0IHNoYWRvdyBzdGFjayBzdXBwb3J0DQo+IGFuZCBvbiBrZXJuZWxzIGJ1aWx0IHdp
dGhvdXQgQ09ORklHX1g4Nl9VU0VSX1NIQURPV19TVEFDSywgYnV0IHRoZW4gZXhpdHMNCj4gd2l0
aCAxLCBzbyB0aGUga3NlbGZ0ZXN0IHJ1bm5lciByZXBvcnRzIGEgZmFpbHVyZS4NCj4gDQo+IEV4
aXQgd2l0aCBLU0ZUX1NLSVAgaW5zdGVhZC4NCj4gDQo+IEZpeGVzOiA4MWYzMDMzN2VmNGYgKCJz
ZWxmdGVzdHMveDg2OiBBZGQgc2hhZG93IHN0YWNrIHRlc3QiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBT
YXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiBGb3VuZCB3aXRoIEtlcm5l
bENJJ3MgeDg2IGJ1aWxkcywgd2hpY2ggbGVhdmUNCj4gQ09ORklHX1g4Nl9VU0VSX1NIQURPV19T
VEFDSyB1bnNldC4gVGVzdGVkIG9uIGFuIEFNRCBFUFlDIDk2NTVQIHdpdGgNCj4gS2VybmVsQ0kn
cyB4ODZfNjQgYnVpbGQgb2YgbmV4dC0yMDI2MTEwNDogdGhlIHRlc3Qgbm93IGV4aXRzIHdpdGgg
NA0KPiBpbnN0ZWFkIG9mIDEuDQoNClJldmlld2VkLWJ5OiBSaWNrIEVkZ2Vjb21iZSA8cmljay5w
LmVkZ2Vjb21iZUBpbnRlbC5jb20+DQoNClRoZXJlIGFyZSBzb21lIG90aGVyIHRoaW5ncyBsYWJl
bGVkIFNLSVAgaW4gdGhlIHNhbWUgZnVuY3Rpb24uIEJ1dCB0aGV5IHNob3VsZA0KcHJvYmFibHkg
YWN0dWFsbHkgYmUgRkFJTCwgc28gdGhlIG9uZSB1cGRhdGUgZG9uZSBpbiB0aGlzIHBhdGNoIHNl
ZW1zDQphcHByb3ByaWF0ZS4NCg==
