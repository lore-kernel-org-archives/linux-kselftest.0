Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7436E23BD05;
	Tue,  4 Aug 2026 21:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785880799; cv=fail; b=eYnohB+7KuIqPaf0Ftflv8ylPAOSw+phZzb9TdVmfbEwa4ENteXTXITrtZQRlnt9UxUQI4gzh/ezGxt+YMP/tSusU3SicBULTyZiIEl2IWjSeXchu1wiKzAMvlmlXti+vTbfyRtV3R7AjObdITMmjKdkaDqZazrTwEyK7Zt8UXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785880799; c=relaxed/simple;
	bh=85bY5wJVu4TlW7Zp8TBYRIu6YLbA+ZaJ7aoKFOfWtWo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tvPyIqZTRyp2h9tmEHjfXEfxNjh2sjWizvKoYWCz/4OWNnllv7w+p8CJiB4YzzI+MzjWjiSlZ/WUqkIM1rlKcnofZj31bo1pENq5nwynGBYTkcm6fZ5DtLDghDtfWnm8IfNMkt+d0ReFDCypYGAb1TJsH9kyXoVSt+RRy314OP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tu4e/rWJ; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tu4e/rWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785880797; x=1817416797;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=85bY5wJVu4TlW7Zp8TBYRIu6YLbA+ZaJ7aoKFOfWtWo=;
  b=Tu4e/rWJcE4U2K5y/h6ZjONoIOJcb8NMVFQcba/0BOAM7UAnHaznaDfj
   pG232rUvYqGSPOBaRND+ZRdvO+umU/tf/R9YwxtrcGzSZcFvlzMqCeqFc
   1tAyk/2p0uBklX+Rs9R+9lbYtEKPV9qIoOmig8e2BOLBumhgBfQnZ87+X
   IHGb+OBicVx8bT9RFG4lJkraSiSzhn9PFlnGBPmds+7qCvLT6gcsjLcut
   TG/UCK8CKJIcppqBhbSTWxOiUtAzYSO8tQWcWUAkybQI94VhV2SzAFzm3
   8vCL//PA8QrrAdL/lb9FwPtRPBKQgJfqAbIRo9qMXGSu0NYmls1SiQi5N
   A==;
X-CSE-ConnectionGUID: WlFtcHwiQkGzwx3yPWYS3g==
X-CSE-MsgGUID: 4p6QYW+yT5i8wk6CjVzEtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86387793"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="86387793"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:59:56 -0700
X-CSE-ConnectionGUID: OS5FzK2VTYWQXRfE0pa7JA==
X-CSE-MsgGUID: AYL0TH2PSyiQw1/55RV1qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="259856151"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:59:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 14:59:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 14:59:54 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 14:59:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zk4arxU9VmA5r9hdQ2QwNBalJRV9uCwwzvbuC2Y3XoFq2KUFHgOQhjv4WlUcNOaocR6kCkXMWpcYKjs1ZDO0Z/wVqD97I9jfZRCbtI6sHu519VjKkyC4yi3gpn1sD/m1ko2YgPx/Nr3hHFtd9XDDh7Anb1h1bOb2VLbORsyL+A3YNjX4f1i+0202nx1pf/NhaiuiTP5XlXc1zff6Mlsa55EvxiOxb69uPSps8afTIXfgG0M1ejq/Mm/pg6aF1DqdejOqze/pniewn/BDA+BwFeoV8oWZouwyFRiKwDbnro4Ab8E2I9N/IuUrAuz3dy27iuiVeyuioSSYRuvyPTuVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85bY5wJVu4TlW7Zp8TBYRIu6YLbA+ZaJ7aoKFOfWtWo=;
 b=b29306QDElnwarNOo9E3kDcpzQYneMvv0yYC9YpS6oFCtHWrKe13wTE0M5AliOlYxdKiVVWpAy7Rk12SYX4o4INf3ws53nAmAZJMdpqTYe1OqWLhOvcEGAQrlAu5fg9QU+8JWyjHIl9yAyTPJYs9LdT0w2W+N631Ytb5tg0KCV9bdHC9JK6Ea2KySHjWjcOyZ89yMM/5v8aHrY84Pr/MSqevODf9rqXGUzIGV6YPJ+wCjmsdMH+tmtpnDd5WdUDSVYNz1UXVzB9ygRvH8kk70A5P5sMXvWpRRmN6akIoVw4ljyW/zKjZUaGvmdfwlNE45LdNouVHUsoHoc5BNeHrWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by PH7PR11MB7514.namprd11.prod.outlook.com (2603:10b6:510:276::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 21:59:47 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 21:59:47 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "x86@kernel.org" <x86@kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"pjw@kernel.org" <pjw@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"mingo@redhat.com" <mingo@redhat.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "shuah@kernel.org" <shuah@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "bill.roberts@arm.com"
	<bill.roberts@arm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 1/2] x86/shstk: support via prctl
Thread-Topic: [PATCH 1/2] x86/shstk: support via prctl
Thread-Index: AQHdH1qLic+v9tAIz0KjQXVrF57uc7aEfrSAgAghPQCAAAkbgIABlNSAgAAHZYCAAB/IAIAAFV0A
Date: Tue, 4 Aug 2026 21:59:47 +0000
Message-ID: <2844b9a7811fba20bbd33631035ef6854b58c598.camel@intel.com>
References: <20260714154740.140431-1-bill.roberts@arm.com>
	 <20260714154740.140431-2-bill.roberts@arm.com>
	 <33ac05a617a26b3d9c4a374d14a4f210bba0a991.camel@intel.com>
	 <51064f94-be8d-4901-845c-9f4a5e46a337@arm.com>
	 <ccdeeca8fe9c6d3e0378891953ba9249557fea2a.camel@intel.com>
	 <030bdb74-7938-49ab-809c-5fefae4316b1@arm.com>
	 <5ed7d0f5baa920bb8feefd64444939c33397bbb0.camel@intel.com>
	 <17d39558-14d4-484e-9395-29d4d20d5011@arm.com>
In-Reply-To: <17d39558-14d4-484e-9395-29d4d20d5011@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|PH7PR11MB7514:EE_
x-ms-office365-filtering-correlation-id: e7ca1ab4-fe4d-47d1-63d9-08def273b30f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|22082099003|18002099003|921020|38070700021|10067099003|6133799003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info: dqDCyUBAjdaPZtAbGIToIBngtqByY1U4ikTHlS/Q7Rdxs+1SyhIqZM20z6xTnmUfJ8FCRzUTKkgCLryZIAYK3Yb36pmUs/SjaFbzNfMJdlTBfUARMoeZfB7jHQwxPjD+muhG1RP21gMFp+1vb4aSlc8RJuyUWmevf18gRHitg5sU+41lFhk2+StOlMxNcNxTsA/T5jdlUe/XCaxR4dkYpm4Phjhh68RKwqZaGoH5ffxsXE+Sgl1fN4mOoGkkIiKsQsZNK3zShr25v1OC1oiyNEI93HjMkN+pTbdtVwlBNtp1ewfVL63Lu4HI0NOkCEdIU2hG/SXQrBFWVEooMz2cUAtm9jkpKcDAo0hwuyeqMV4XKDD5GpLAVI6NfRzZfh1W+DDVf7vI6jjoIvQO9JR1x2YmB38McMnGHvx30dV+CwEm04Yo3i7LbiIVv+F6lFECBLW6f0Pjjdrwzn1IvpbrYlxVdeOO+2OKcqfrkK7qZXVnjbOKF3JoZV/iT5G4v0IJPbEIKTQkt1D0SN1QOXaBnWAY9Yn/teHmgfaIGyeF7q5vZrsOt7eOdTsbgigT7Qj9hVFxjv5+MwfeW6txwRTh6XBpc12/X++LNA41LwiIaZq9RDjQNXco+SS3IKGfLemhPVLdPidz3N1l5i3bQY8arndIgBBe47TsOf0COmPGviM2TNT8Vi9E9wbAlLp4LXZAnYdouEwJFw3yTVdbx5uYlVPzOuFDfgoXcxHtr3fkHm8983jQF5lsFGSyY4ib0VAv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(921020)(38070700021)(10067099003)(6133799003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXhBMFdpeVJkQngrMmZGUUkrUWNNTmJIK2lTTXY4elhwNjNFRy80MHFiR0hv?=
 =?utf-8?B?RnlxbXJmYjQ3Zjd4VHA3VGFBUS90K2YvOGNXdHRUcllheWlGVE5rU2ZoRU1p?=
 =?utf-8?B?ME4xMXpoTlA3WVczMkpyU2tJd3pNVWZwSGNqZi8vVGNzT1llcURvZHFySEpD?=
 =?utf-8?B?UWpHaTA1VEw4bStraDkwRldtbFpHZ1FZZXlMUWJGZnVHTnphajRlM1dhVFEw?=
 =?utf-8?B?VTUrckhYQ09FMTRYaGVQZ1hmaW9NamVmSzVMVzVnSlVDT0k5aDZXVXEwZUp1?=
 =?utf-8?B?dXFGdzJZeVI3OVFvai8zOFRVRmlqTWIzT3RHZHJOZzRqTjJOY1NUYUcwY1Rk?=
 =?utf-8?B?SUsveXc3VGdYUXBUQXBKSExmUy81eis3ZFdjTHNCWE5ncGhIakx5cHYxQ2Mx?=
 =?utf-8?B?ekUwNWJRUGVhYTNRR0tGSXlaN1JDUlVhcTk0b0V4ZTFySW9QblI1aEtrZDBF?=
 =?utf-8?B?WWdaVlNWOHoranJHYmc3aDZod2c0NHBkYi9iM2l5LytzUHo4cFFOWmU4dEU4?=
 =?utf-8?B?a1gyMnh4d3NOeGlVQXBralRVYVczN1FqYmtZNVUzZEN3Nmszamt6K0twVmZl?=
 =?utf-8?B?SFZWd0lmMXNhalhhRkNwY2ZFY2tud1BkaTk4VjZvTk81QXhBN1k0b2l4NWE2?=
 =?utf-8?B?djhIbi9aVGVwa1hPOFVpbFQ0V1RZSDRFT0dyNFR4L25hWGxxa2Z1dnpNUnMr?=
 =?utf-8?B?ZmN6WTlWblMxYlFmWjZDRjFTR0YyekIvK01Sd2QxbzI3TkorYXZEZWd2QlJR?=
 =?utf-8?B?emRSbTJRNzBGMysrTjgyWnpNNnVKZGxybWJQNzFSSzRjWFo0eGJicUhpQmp4?=
 =?utf-8?B?WTdPVkx0YW8zZ1RIR281UGF1T3hXcm1RU3I0Y1pJNUUxcGU2WjhvMlVKcXps?=
 =?utf-8?B?WFlEeldyV01UWFlqOEFTZXgxWkN1d1RrUExpRjJCMGlOSTNNd2J3cks1OU40?=
 =?utf-8?B?UW5TQVg5NTQ4bHlDS2c2emZQd2piL2RkbUlTUWliUWpsbEpmdFlDcVJYT2VF?=
 =?utf-8?B?eEJzNm1vSjIyRExSQnc3VFV6WXlLRERidUl3ejVyaHQzTTFxdi9tSUIwMGVq?=
 =?utf-8?B?Z2dtZjBvdW1XdzRocVA2SjdDWUFCckt4ZnV3UW54Q0JjamMrekEzYVkzcFRj?=
 =?utf-8?B?WlRVaHpPa213QWprRW1VNFRIcHRTMVJtVUtYZFoxVnVmQXVmd2xZNjBkWXZK?=
 =?utf-8?B?QVdzM0I4ZEZ3NnZCQXBkNGJNWUZVNmRiZFdxRjQ2anhzVGtTcWtJU0U4NFlr?=
 =?utf-8?B?QkpxYkkxdTNKclYyQVo1andMMCtidUREeFh1K2dpNWxhUmovZGxnbFlCeE9G?=
 =?utf-8?B?c1hieTdhaHlvMTE3WUxEKzhQS3FpNnp5emN0d0pzUWs0SUFHbVc4SlFjV2pX?=
 =?utf-8?B?ZnFyYlJzOUp2MTZybG5udGhOYVN4UzhFTGFveW1MZjZMbzcrc045V0hUSmVp?=
 =?utf-8?B?M1lRUE1UdmNlV0lnYVRXOFRVVDBKRUllZFU4OGVJTWxaaXpUdVNzdmU1MWV4?=
 =?utf-8?B?UnN4ZlRtSVBQYW1rSFVkbGV3bXR2VWY2NE5OYjNoVUJMWEtvczdOUTJvNTJK?=
 =?utf-8?B?cU0wZWZOWE9OYmZmampSMzNOZGpzTTAwL2JPV1dCM3JjSVhmZHM1bVVNcXBD?=
 =?utf-8?B?YkJDVzZFdjhJbWkralRLQjZVdVFWbGVZK2ZHSk1IMDA5NzJFcE1KR0Robk8y?=
 =?utf-8?B?VlM3eE1UZjRMRUsvc25ZV1V4OHV1UjV3bHF5N0ZVVi9sUEF5eG1tVFh4MGdy?=
 =?utf-8?B?Sjk5TjJIbk9HOTZVa3FCMnd2clhjYXNFbU9od2wydXRIU0QwUldKZUdwS0VR?=
 =?utf-8?B?ajRFVjRzdDlkTmU4b3BkRTROTTh4aFpEVWZEWkFhUStvSU50eGE2RU1sNDhu?=
 =?utf-8?B?QVdGcVR5c282M0dQaC9UVFFEOEZRaU50UkRhWkE4UGFHRUZGcE0yNk81aXBB?=
 =?utf-8?B?MGV6anEwQzFqbVdwWXNzVGFuK0JMa2Yrb2lyVVA0WGl1bFh0ZEw1OXFTL1RW?=
 =?utf-8?B?S3ptMko1L2RCSzhHemtVWlhaYVRodWd6eTBHbHRMbXUyRUVVWHlkcWpDK1cy?=
 =?utf-8?B?UjdhN01haHpkazdtQldjUXVqck5DU1BnMzM4bjk3VHgxRDNjd3NpTXQwcUtt?=
 =?utf-8?B?dDdQd0gzdlF5MnZ3TXhZY2MxbEVtcjA4aGVNczFHek91TEQzMmFKaFg0Q0JI?=
 =?utf-8?B?TFJPbVRydms1V0lTa2pxaE1hYk1VeU1NN282ZzNHZzlYbTJrVW9GUWxOMHFY?=
 =?utf-8?B?TVlWMVNJa2E4Tk5MOGVKQWpSeURudGt4aC9PMkJleS9yV1o4ak9tUmE4cEhG?=
 =?utf-8?B?OVBFTkhLYnduV0tmOS9OZ2NXMmRBSm5TWU5pMHVVdm92R3VGUEg5NUZ0Q3RG?=
 =?utf-8?Q?2FEFvlKIqkXzvU+U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50A807AD39A1D2478D7FD9EBA9B66C72@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jxbrPGK3pVB+AREqLqBONMEZ0r0YQsNV9k7A1xReJsifTTtXCWq04N77194nfw4PjS4saZE8Vl3LS0Z4ONxVxnFNynJYVu5BS54pvm7eiJz4Q41w0oyH/oEk84Lto1yUaMMPUMn7QfVDb4s+WKnr5Gp/ea8CLNx2BzHPxLGZYbo/UtZSwCijklGwEZ7SiKO522HFv8YWDmIxxsjjKGPLTdnZuw3E5UedTGc3HKIMYNrrIuLonedajKTdA/cZrBgzfhs0I+cfLgL6c1NbPAz9eSKbMs76sUtXg4RT131uRIO9IaDjw/yTcsfkHRVXhwGDuIEgtzcQHm0siqmRQy2poQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ca1ab4-fe4d-47d1-63d9-08def273b30f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 21:59:47.2238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SRap/Zqj/3UkC3e5Gua3AM2LSzGXpliY+fX9NrAn9emaElyKTn+rNXMYdthyedeSHa7KgkY9GutBnrXEUhcTYEfUH9ROa6gvFAWdtljafb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7514
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTA4LTA0IGF0IDE1OjQzIC0wNTAwLCBCaWxsIFJvYmVydHMgd3JvdGU6DQo+
ID4gSUlSQyBDUklVIG5lZWRlZCB0byB1bmxvY2sgc2hhZG93IHN0YWNrIGR1cmluZyB0aGUgc2F2
ZS4gQmVjYXVzZSBpdCdzIHRyaWNrcw0KPiA+IGZvcg0KPiA+IHNhdmluZyB0aGUgcHJvY2VzcyBp
bnZvbHZlZCBtZXNzaW5nIHdpdGggdGhlIHN0YWNrLiBTbyBpdCBuZWVkcyB0byBiZSBhYmxlDQo+
ID4gdG8NCj4gPiB1bmxvY2sgYnV0ICpvbmx5KiB2aWEgcHRyYWNlLiBBcHBzIGNhbm5vdCBiZSBh
bGxvd2VkIHRvIHVubG9jayB0aGVtc2VsdmVzLg0KPiA+IEJlY2F1c2UsIHdlbGwsIG9idmlvdXNs
eS4uDQo+ID4gDQo+ID4gwqDCoCBBcyBNVVNMIGFuZA0KPiA+IG90aGVycyBnZXQgcGF0Y2hlcywg
aXQgd291bGQgYmUgbXVjaCBzaW1wbGVyIHRvIGhhdmUgb25lIGludGVyZmFjZSB0byBkbw0KPiA+
IHRoaXMgaW4sIGFuZCByaWdodCBub3cNCj4gPiB1bmxvY2sgaXMgdW51c2VkIChldmVuIGluIHRo
ZSB0ZXN0IHN1aXRlIDotcCkuDQo+ID4gSSB0aGluayBJIHJhaXNlZCB0aGlzIG9uIHRoZSBvdGhl
ciBhcmNoJ3MgQVBJcyBvcmlnaW5hbGx5LiB4ODYgd2VudCBmaXJzdCwNCj4gPiBhbmQgdGhlbiBs
YXRlciBhcm0vcmlzY3Ygd2FudGVkIGEgdW5pZmllZCBhcHByb2FjaCwgYnV0IGRpZG4ndCBzb2x2
ZSB0aGlzDQo+ID4gcHRyYWNlIHVubG9jayBwYXJ0LiBTbyB3ZSBkaWRuJ3Qgam9pbi4gQUZBSUNU
IHRoZSBzaXR1YXRpb24gaGFzbid0IGNoYW5nZWQuDQo+ID4gU28gSSdtIHdvcnJpZWQgaXQncyB0
b28gc29vbiB0byB1bmlmeS4gT3Igd2UgbWlnaHQgbmVlZCB0byBkbyBtdWx0aXBsZSBzdGVwcw0K
PiA+IG9mIHVuaWZpY2F0aW9ucy4NCj4gDQo+IEF0IHRoaXMgcG9pbnQsIHRoZSBvbmx5IHJlbWFp
bmluZyBzZW1hbnRpYyBkaWZmZXJlbmNlIGlzIHN1cHBvcnQgZm9yIA0KPiB1bmxvY2tpbmcgYSBs
b2NrZWQgc2hhZG93IHN0YWNrIGR1cmluZyBwdHJhY2UvQ1JJVSByZXN0b3JlLiBBcm02NCBhbmQg
UklTQy1WDQo+IGRvbid0IGN1cnJlbnRseSBleHBvc2UgYSBnZW5lcmljIHVubG9jayBvcGVyYXRp
b24gYmVjYXVzZSB0aGV5IHVzZSANCj4gYXJjaGl0ZWN0dXJlLXNwZWNpZmljIHB0cmFjZSBtZWNo
YW5pc21zIGZvciBzdGF0ZSByZXN0b3JhdGlvbi4gSWYgdGhvc2UNCj4gYXJjaGl0ZWN0dXJlcyBl
dmVudHVhbGx5IGNvbnZlcmdlIG9uIGEgY29tbW9uIHVubG9jayBtb2RlbCBmb3IgQ1JJVSwgSSB0
aGluaw0KPiBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIHVuaWZ5IHRoYXQgaW50ZXJmYWNlIGFzIHdl
bGwuIFVudGlsIHRoZW4sIEkgZG9uJ3QgdGhpbmsNCj4gdGhlIGxhY2sgb2YgYSBnZW5lcmljIHVu
bG9jayBzaG91bGQgcHJldmVudCB1bmlmeWluZyB0aGUgcGFydHMgb2YgdGhlIEFCSSB0aGF0DQo+
IGFscmVhZHkgaGF2ZSBlcXVpdmFsZW50IHNlbWFudGljcy4gRXNwZWNpYWxseSBjb25zaWRlcmlu
ZyBob3cgaXQgdW5pZmllcyB0aGUNCj4gbG9hZGVyL2xpYmMgc2lkZSBvZiB0aGUgaG91c2UuDQoN
ClRoZSBsb2NraW5nIG5lZWRzIHRvIGJlIGRvbmUgYWZ0ZXIgdGhlIGxpbmtlZCBEU09zIGFyZSBj
aGVja2VkIGZvciBzaGFkb3cgc3RhY2sNCmNvbXBhdGliaWxpdHkuDQoNCj4gDQo+ID4gwqDCoCBB
bHNvIGxvb2tpbmcgZm9yd2FyZCB0byB1bmRlcnN0YW5kaW5nIHRoZSBzZWN1cml0eSBtb2R1bGUg
cHJvYmxlbSANCj4gPiBzdGF0ZW1lbnTCoCBiZXR0ZXIuDQo+IA0KPiBSaWdodCBub3cgYWxsIHRo
ZSBjb250cm9scyBhcmUgb3B0IGluLCBhbmQgcmVxdWlyZXMgc3VwcG9ydCBpbiBnbGliYywgdmlh
DQo+IHBlciBhcmNoIHR1bmFibGUgZmxhZ3MgZm9yIGJvdGggZW5hYmxpbmcgYW5kIGxvY2tpbmcu
DQoNCng4NiBnbGliYyB3YXMgb3JpZ2luYWxseSBzdXBwb3NlZCB0byBoYXZlIHR3byBtb2RlcyBm
b3Igc2hhZG93IHN0YWNrLiBBIG5vcm1hbA0KbW9kZSBhbmQgYSBwZXJtaXNzaXZlIG1vZGUuIFRo
ZSBub3JtYWwgbW9kZSB3b3VsZCBmaXJzdCBjaGVjayBhbGwgdGhlIGxkZCBEU09zDQpmb3Igc2hh
ZG93IHN0YWNrIGNvbXBhdGliaWxpdHkuIElmIHRoZXkgYWxsIGhhdmUgc2hhZG93IHN0YWNrLCBp
dCBlbmFibGVzIHNoYWRvdw0Kc3RhY2sgYW5kIGRvZXMgdGhlIGxvY2sgb24gdGhlIG1haW4gdGhy
ZWFkLCB3aGljaCB0aGVuIGdldHMgaW5oZXJpdGVkIGJ5IGFsbCB0aGUNCmNoaWxkIHRhc2tzLiBJ
ZiBkbG9wZW4oKSBpcyBsYXRlciBtYWRlIHdpdGggYSBEU08gdGhhdCBkb2VzIG5vdCBzaGFkb3cg
c3RhY2ssDQp0aGUgZGxvcGVuKCkgY2FsbCBpcyBmYWlsZWQuDQoNCkluIHBlcm1pc3NpdmUgbW9k
ZSwgaXQgZGlkIHRoZSBlbmFibGVtZW50IGNoZWNrcyBsaWtlIHRoZSBub3JtYWwgbW9kZSwgZXhj
ZXB0IGl0DQpkaWQgbm90IGxvY2sgc2hhZG93IHN0YWNrLiBUaGVuIGlmIGRsb3BlbigpIGNhbGwg
d2FzIG1hZGUgd2l0aCBhIG5vbiBzdXBwb3J0aW5nDQpEU08sIGl0IHdvdWxkIGRpc2FibGUgc2hh
ZG93IHN0YWNrIG9uIHRoZSBjYWxsaW5nIHRocmVhZC4gVGhpcyBkaWRuJ3QgcmVhbGx5DQp3b3Jr
LCBiZWNhdXNlIHRoZSBvdGhlciB0aHJlYWRzIGluIHRoZSBhcHAgc3RpbGwgaGFkIHNoYWRvdyBz
dGFjayBlbmFibGVkLiBXaHkNCmRpZG4ndCBpdCBqdXN0IGRpc2FibGUgaXQgc2hhZG93IHN0YWNr
IGZvciB0aGUgZnVsbCBhcHA/IExvdHMgb2YgcmFjZXMgd2l0aCBhcHBzDQpkb2luZyBzaGFkb3cg
c3RhY2sgc3BlY2lmaWMgc3R1ZmYgd2hpbGUgdGhlIHN1cHBvcnQgZ2V0cyBkaXNhYmxlZCBvdXQg
ZnJvbSB1bmRlcg0KdGhlbS4NCg0KVG8gZml4IHBlcm1pc3NpdmUgbW9kZSwgdGhlcmUgd2FzIGEg
cHJvcG9zYWwgKEkgZG9uJ3Qga25vdyBpZiBpdCBldmVyIG1hZGUgaXQNCmludG8gZ2xpYmMpIHdo
ZXJlIHRoZSBzaGFkb3cgc3RhY2sgd291bGQgZ2V0IGRpc2FibGVkIG9uIHRoZSBmaXJzdCBkbG9w
ZW4oKSB0byBhDQpub24tY29tcGF0aWJsZSBzaGFkb3cgc3RhY2sgT1IgdGhlIGZpcnN0IHRocmVh
ZCB3YXMgc3Bhd25lZC4gVGhpcyB3YXMNCnF1ZXN0aW9uYWJsZSB0byBtZS4gQnV0IHRoZXJlIHdh
cyBhIGRlc2lyZSB0byBtaW5pbWl6ZSB0aGUgY29tcGF0aWJpbGl0eSBoaXQNCmZpcnN0IHNvIGl0
IGNvdWxkIGJlIGVuYWJsZWQgd2lkZWx5LiBUaGVuIHRpZ2h0ZW4gaXQgdXAgb3ZlciB0aW1lLg0K
DQpCdXQgaW4gYW55IGNhc2UsIGxvY2sgaXMgc3RpbGwgbmVlZGVkIGZvciB0aGUgbm9ybWFsIG1v
ZGUgcmlnaHQ/IFlvdSBuZWVkIHRvDQpkZWNpZGUgaW4gdGhlIGxvYWRlciB3aGV0aGVyIHlvdSB3
YW50IHRvIGhhdmUgc2hhZG93IHN0YWNrIGZvciB0aGUgYXBwLiBPciB3ZQ0KYXJlIHRhbGtpbmcg
YWJvdXQgYW5vdGhlciBtb2RlLCBsaWtlIGEgZm9yY2VkLW9uIG1vZGUgd2hlcmUgdGhlIGFwcCB3
aWxsIGRvDQpzb21ldGhpbmcgZWxzZSBpZiBpdCBmaW5kcyB0aGUgbGlua2VkIERTT3MgZG9uJ3Qg
c3VwcG9ydCBzaGFkb3cgc3RhY2suIExpa2UgZXhpdA0Kd2l0aCBhbiBlcnJvciBvciBzb21ldGhp
bmcuIEJ1dCBpZiB0aGF0J3MgdGhlIGNhc2UsIGl0J3MgYSBkZWNlbnQgYW1vdW50IG9mIG5ldw0K
c3R1ZmYgdG8gbWUsIHNvIHBsZWFzZSBleHBsYWluLg0KDQo+ICBUaGUgZ2xpYmMgZm9sa3MgYXJl
DQo+IHN0YXJ0aW5nIHRvIGJhbGsgYXQgdGhlIGFtb3VudCBvZiBmbGFncy4gQWRkaXRpb25hbGx5
LCBpdCB3b3VsZCBiZSBuaWNlIHRvDQo+IGhhdmUgTUFDIGNvbnRyb2xzIG9uIHRoZW0sIGFuZCB0
aGUgYmVzdCB3YXkgZm9yIHRoYXQgaXMgdmlhIExTTSBpbnRvDQo+IFNFIExpbnV4LiBOb3JtYWwg
YXBwbGljYXRpb25zIGNhbiBiZSBwbGFjZWQgaW4gYSBkb21haW4gd2hlcmUNCj4gdGhleSBjYW4g
bmV2ZXIgcmVtb3ZlIHByb3RlY3Rpb25zLCBhbmQgdGhpbmdzIGxpa2UgQ1JJVSB3aWxsIGhhdmUg
dGhlc2UgDQo+IGVsZXZhdGVkDQo+IHBlcm1zLCBpZiB0aGV5IGFyZSBldmVyIG5lZWRlZCwgc2lu
Y2UgcmlnaHQgbm93IHRoZXkgZ28gdGhyb3VnaCBhIA0KPiBkaWZmZXJlbnQgY2hhbm5lbC4NCg0K
VGhpcyBzb3VuZHMgbGlrZSBhIG5ldyBwYXJhZGlnbS4gSWYgd2UgaGF2ZSBlbm91Z2ggc2hhZG93
IHN0YWNrIHN1cHBvcnQgb3V0DQp0aGVyZSwgc2VlbXMgaW50ZXJlc3RpbmcgdG8gbWUuIEJ1dCBJ
IHdvdWxkIGxpa2UgdG8gaGVhciBtb3JlIGRldGFpbHMgYWJvdXQgaG93DQppdCB3b3Jrcy4gSSdt
IGp1c3Qgc3BlY3VsYXRpbmcgYWJvdmUuDQoNCj4gVGhlIExTTSBhY3R1YWxseSByZW1vdmVzIHRo
ZSBuZWVkIGZvciBsb2NrIGZsYWdzIGluIGVzc2VuY2UsIGJ1dCB5ZWFoIHdlIA0KPiBjYW4ndCBj
b3VudA0KPiBvbiB0aGF0LsKgDQoNCj8NCg0KDQo+IFRoZSBsb3JlIGlzIGhlcmU6IA0KPiBodHRw
czovL3NvdXJjZXdhcmUub3JnL3BpcGVybWFpbC9saWJjLWFscGhhLzIwMjUtRGVjZW1iZXIvMTcz
NjM2Lmh0bWwNCg0KVGhpcyBzZWVtcyB0byBiZSBhYm91dCBvdGhlciBzaGFkb3cgc3RhY2sga25v
YnMuIFN0YWNrIHNpemUsIGV0Yy4NCg0KPiANCj4gRm9yIHRoZSBmb2xsb3dpbmcgTFNNIHBpZWNl
LCB0aGVyZSBpcyBubyBoYXJkIGRlcGVuZGVuY3kgb24gdGhpcy4gSSBjYW4gDQo+IHB1dCB0aGUg
TFNNIGhvb2tzIGludG8gYXJjaF9wcmN0bCBmb3IgeDg2IGFuZCB0aGluZ3Mgd291bGQgd29yayBm
aW5lLCBpbiBmYWN0DQo+IHRoZXJlIGlzIG5vIGdldHRpbmcgYXJvdW5kIHRoYXQgb3IgdGhlIGFy
Y2hfcHJjdGwgaW50ZXJmYWNlIGZvciB4ODYgd291bGRuJ3QNCj4gZ2V0IHRoZSBMU00gcHJvdGVj
dGlvbnMuIEkgd2FudCB4ODYgdG8gZ2V0IHRoZSBMU00gcHJvdGVjdGlvbnMuIEkgYWxzbyB3YW50
IHRvDQo+IGNvYWxlc2NlIHdoYXQgd2UgY2FuIGFyb3VuZCB0aGUgYXJvdW5kIHRoZSBjdXJyZW50
IGdlbmVyaWMgaW50ZXJmYWNlcyBmb3INCj4gZ2xpYmMuIFdvcmsgY291bGQgYmUgZG9uZSB0aGVy
ZSB0byBzdGFydCBkcm9wcGluZyBhcmNoIHR1bmFibGVzIGFyb3VuZCB0aGlzIA0KPiB0b28uIEkg
YW0gc2l0dGluZyBvbiB0aGVzZSBwYXRjaGVzIHJpZ2h0IG5vdywgYmVjYXVzZSB0aGV5IGhhdmUg
YSBzb2Z0DQo+IGRlcGVuZGVuY3kgb24gY29uZmxpY3RzLg0KPiANCj4gPiA+IElsbCBzcGluIG91
dCBhIHYyIHdpdGggdGhlIGNvbW1lbnRzLCBidXQgdGhlIG9uZSB0aGluZyBsZWZ0IHRvIGJlDQo+
ID4gPiBhZGRyZXNzZWQsIGFmYWlrLCBpcyB0aGUgdGVzdGluZyBwYXRjaA0KPiA+ID4gZG8geW91
IHdhbnQgdGhhdD8gSSdsbCBkcm9wIGl0LCBidXQgSSB0aGluayB0aGF0J3MgYSBiYWQgYXBwcm9h
Y2guDQo+ID4gWWVhLCBJIGhlYXIgeW91ciBwb2ludC4gSXQgaXMgZ29vZCB0byB0ZXN0IG1vcmUs
IGJ1dCAjaW5jbHVkaW5nIGMgZmlsZXMgd2l0aA0KPiA+IHByZS1wcm9jZXNzb3Igc3dpdGNoZXMg
c2VlbXMgdG9vIGhhY2t5LiBJcyB0aGVyZSBhbnl0aGluZyB3ZSBjb3VsZCBkbyB0bw0KPiA+IG1h
a2UgaXQNCj4gPiBpbiBvbmUgYyBmaWxlPyBMaWtlIG5vdCB0aGUgdGVtcGxhdGVkIHRyaWNrcyB0
byBnZW5lcmF0ZSB0d28gdGVzdCBiaW5hcmllcz8NCj4gPiBGb3INCj4gPiBleGFtcGxlIGVtYmVk
IHRoZSBzd2l0Y2ggYmV0d2VlbiB0aGUgdHdvIEFQSXMgaW4gYSBtYWNyb3MgaW4gdGhlIHNpbmds
ZQ0KPiA+IGZpbGUuDQo+ID4gTGlrZSBzYXkgd2UgaGF2ZSBTSFNUS19FTkFCTEUoKS4gSW5zaWRl
IGl0IGRvZXMgZWl0aGVyIEFSQ0hfUFJDVEwoKSBvcg0KPiA+IHJlZ3VsYXIuDQo+ID4gVGhlbiBo
YXZlIGEgZ2xvYmFsIG9yIHNvbWV0aGluZyB0aGF0IHN3aXRjaGVzIGJldHdlZW4gdGhlIHR3byBi
ZWhhdmlvcnMuDQo+ID4gUHVsbA0KPiA+IG91dCB0aGUgcGFydHMgaW4gbWFpbigpIGludG8gc29t
ZXRoaW5nIHRoYXQgY291bGQgYmUgcnVuIHR3aWNlPw0KPiA+IA0KPiBBbnl0aGluZyBpcyBwb3Nz
aWJsZSwgYnV0IGlzIHRoZSBqdWljZSB3b3J0aCB0aGUgc3F1ZWV6ZSBoZXJlPyBUaGlzIA0KPiBh
cHByb2FjaCBpcyB1c2VkDQo+IGFscmVhZHkgaW4gdHJlZToNCj4gLSBicGYvcHJvZ3MvYXJlbmFf
aHRhYl9hc20uYw0KPiAtIGJwZi9wcm9ncy90ZXN0X2Nsc19yZWRpcmVjdF9zdWJwcm9ncy5jDQo+
IC0gYnBmL3Byb2dzL3Rlc3Rfc2tfYXNzaWduX2xpYmJwZi5jDQo+IC0ga3ZtL2xpYi9yYnRyZWUu
Yw0KPiAtIGt2bS9yc2VxX3Rlc3QuYw0KPiAtIGxpdmVwYXRjaC90ZXN0X21vZHVsZXMvdGVzdF9r
bHBfc3RhdGUzLmMNCj4gLSBwb3dlcnBjL3ZwaG4vdGVzdC12cGhuLmMNCg0KPiAtIHg4Ni90ZXN0
X3NoYWRvd19zdGFja19wcmN0bC5jDQoNClVoaC4uLiB0aGF0IGlzIHlvdXIgb3duIGNoYW5nZXMu
IDopDQoNCj4gDQo+IEkgYW0gZ2VuZXJhbGx5IGEgZmFuIG9mIGRvaW5nIHRoZSBzaW1wbGVzdCwg
bW9zdCBvYnZpb3VzIHRoaW5nIGZpcnN0IA0KPiB0aGF0IGZvbGxvd3MgZXhpc3RpbmcgY29udmVu
dGlvbnMNCj4gdW5sZXNzIGEgcmVhbGx5IGJpZyByZWFzb24gY2FuIGJlIG1hZGUgdG8gbm90IGRv
IGl0LiBJIGNhbiByZWZhY3RvciBpdCANCj4gaWYgaXQncyBhIHNob3cgc3RvcHBlciwgYnV0IElN
SE8NCj4gbm90IHdvcnRoIGl0IGhlcmUuIEJ1dCBpZiB5b3Ugd2FudCBpdCByZWZhY3RvcmVkLCBz
dXJlLg0KDQpXZSdsbCB3ZSBjYW4gbGVhdmUgaXQgdG8geDg2IG1haW50YWluZXJzIHRvIHdlaWdo
IGluIG9uIHRoZSBzdHlsZSB0aGluZy4gSSBkb24ndA0KbGlrZSBpdCwgYnV0IHdvbid0IHRocm93
IGEgZml0Lg0K
