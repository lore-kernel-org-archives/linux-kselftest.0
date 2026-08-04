Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFC03FD969;
	Tue,  4 Aug 2026 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785869382; cv=fail; b=B5fuCMQo8oteB2Lpdw+QWoHmcY3n4FDMThcmymALmVb/CK+pnw84Og3ZS9LQsp5JsRdAi6AyhW8sn445b1NCVTwdOV0vQ6mZdxIlDRI9V0Ky3K8wLObRm8OL0Ll0ZPMPVl2x4o+gahXwGhQszyumagKBkYCgRUjkHa5bsJBX8KQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785869382; c=relaxed/simple;
	bh=/jMBkeArtxTL1vlWEMbN1+6RW21f7W8IaUJVoryXu+c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tfMaKfNCc3iiUKTsTF8LkfCHvwkMw0mCgEU2H+vJY4CjBaDCDu722xuSxNgjQuYHgp6OpYYaucUcPE0B4K0ZVxhgaEkOk5/41aZ3f1jSQWi2hNYKk3OWL3ESCHMZVzBanIv7BKx9i8jlLNJpfYtjrk0Ub6uMngNHuDTJ8vvzu24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtezRbB3; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtezRbB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785869381; x=1817405381;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/jMBkeArtxTL1vlWEMbN1+6RW21f7W8IaUJVoryXu+c=;
  b=OtezRbB3P8c/vYJ4K1xGYXtdxuhyK+NTOPIa0rnaYEQE/6Nq9PrPekpf
   rDn5ILeMTSGFDqpLyqc05b+9TYvfq9W8iRjiQjYEmuQUks57RcCFIz0eG
   LzflJfobVqcK5H0+m7E+wJIw1KFJ5p/X1hXt5BKymt829Y8udMJCJmLkv
   H5lYXGrW86KNhtsBSspzzo28V2dypc7jYxICtjhF5BfJ3rJzP3hHpF5Y1
   Q/PSqevW//2VBZxk2VX10l2y5mj5eVRZzh7A+BbPgQ/tXeBIjdTcE5JCU
   B9g/O3T7Lw/7SnKzfzQjzSTiYqcqI2gl7lJcRrgEpSJ3qDTGddgCVnCBs
   w==;
X-CSE-ConnectionGUID: uOn7r0evT2CeULfxa9gMJA==
X-CSE-MsgGUID: AkvMC2p6SL29o4cAMCxHrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86508817"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="86508817"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 11:49:40 -0700
X-CSE-ConnectionGUID: XeVqQOdIQF+jniypG+7Eig==
X-CSE-MsgGUID: KMLJtqgBSrK2Pm0WlWu/zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="260321964"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 11:49:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 11:49:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 11:49:39 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 11:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mly1Eea6l0H4CfCYT4EFQHudnRPnAtTH38wGuo42kZg0nwqIJkpmWUJypeHlN3tRkEts+yfLNkTCR9gNb6U3QC410HFN4r7JR0/vFvUT2NgF045Nf98985mASV7jD4Xs+gGZzSXeH3an10KkzytmJ4NgEQuu2VRa9vooNlOW636GzxwcXVd0Mh8VRdGNjG+0AAGL8hOAfFfPThGjZwElH4Z1b/WVD+m6614jK11ska08PRNKtpgoez7PKTvJb459AwI+QEZxPxRdRif3joNBNFycpvFi/rLGOtbGsTFsxwX8cAzwq95z4cUhqKlsZi6bcm6QTa9lt+3N2Igoasu4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jMBkeArtxTL1vlWEMbN1+6RW21f7W8IaUJVoryXu+c=;
 b=PaJZqLvtuX/Iu7Za0ecCHZ34bFTV7D7pt+FkxNKRPZNsBjEPRJHLni/fWP233t4RWYMvmH9hh65GzOSk7n0DoC4jnv0Xf1qrtaiD1PyWsvpNk3gIwnsj2VPuffZVGom9VKerDj0KLEiygW94GLU0JBZPBoiRFo8FMGaDJ/ixq2ZytdskTNr1q7EHEpLPnr0c863XDwfTk8Q/ID6c/U5bgXDKxlh1C+OGcLOo0K08AgkmplUHTZJ47BH4aiPTxtIT6qTX8DzX9Q7VQYsEnqaBCGEkBp5TQPGeKV9PJ61MKJ2FsQTzpeMxnbyxZu8W6VTPiMbA320Pf1p/p+nhcVSkaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by IA3PR11MB8988.namprd11.prod.outlook.com (2603:10b6:208:57d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 4 Aug
 2026 18:49:35 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 18:49:35 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "tglx@kernel.org" <tglx@kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"pjw@kernel.org" <pjw@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"mingo@redhat.com" <mingo@redhat.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "shuah@kernel.org" <shuah@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "bill.roberts@arm.com"
	<bill.roberts@arm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "x86@kernel.org"
	<x86@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 1/2] x86/shstk: support via prctl
Thread-Topic: [PATCH 1/2] x86/shstk: support via prctl
Thread-Index: AQHdH1qLic+v9tAIz0KjQXVrF57uc7aEfrSAgAghPQCAAAkbgIABlNSAgAAHZYA=
Date: Tue, 4 Aug 2026 18:49:34 +0000
Message-ID: <5ed7d0f5baa920bb8feefd64444939c33397bbb0.camel@intel.com>
References: <20260714154740.140431-1-bill.roberts@arm.com>
	 <20260714154740.140431-2-bill.roberts@arm.com>
	 <33ac05a617a26b3d9c4a374d14a4f210bba0a991.camel@intel.com>
	 <51064f94-be8d-4901-845c-9f4a5e46a337@arm.com>
	 <ccdeeca8fe9c6d3e0378891953ba9249557fea2a.camel@intel.com>
	 <030bdb74-7938-49ab-809c-5fefae4316b1@arm.com>
In-Reply-To: <030bdb74-7938-49ab-809c-5fefae4316b1@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|IA3PR11MB8988:EE_
x-ms-office365-filtering-correlation-id: 2717a112-8aef-46d1-fc10-08def25920cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|921020|6133799003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: HsFQ+Ojsu1JdayKj9ZFlD+EPWxOpl76NXdbEWkezms7UKhJrOY5dEtP4mJiuwoRBlsaEx5/Z6CrkzN+poPYCPybej0gUW/CuG/ZWWSHA1lT9PFVJwd0C0VCqEN8LOpgop7TL4Xyaucjr/H8OFixRlIjmphDHbLxizhSlc+rhWdlJ1bVgjYuzxNeYE4Pi366FBIRHKUAmg8vgPnEpraAAPCP22jmZxsmycRgVnmB5hVl6t3g1TbKMIYi/Olqoh83DdaFTykfym/L8WJqCtgnofYz2OHkKihCUsp4icAdC+OA9/EMvhgfcaTtS++9qfkMrAvIxnZbt3D70+TIjwpMyy8cigXcLt/1BLUX6x6A4xXdM/zelh4Qsjba7zUHUM9CE/RQM2osMDLShzVL0om4LidFHVrnFY5UdN9s2q6jHbCMy4buzhwQVTrfSA9+wagD6oo/oxuEDf6Sz8OFD3GJrU2W5BQKuwemtpVVZQYAsjnXn9psvBZihMvyGQEIBHw0KkJ4gnhs8Ri2hn7pjlfjOxPJZInDvT4XYOKEwA4OmM5dD9/nWX9e7of7vTOeE4asyvylKWPyQJU4n1IxR7QvhUPkcznF7g78qX7n89Xs2mhHTvon1DVML4gPqXtWIsZb1oPr2rnzxMXgefy00XaDYVbVXATHGjGfD7xVnz65+Qj7LnVzEMJI0QdMDpQnhgBkeugDKJV5BZd40K4C2Dxu27OyggNtkljuWKAuPhn8f0L/Qf4w6/91a4FvGzKt2mob9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(921020)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emZFQzdGN3IrbGpoZys1WnBxOGRiVVpYLzVZYWtjOTByMVZTWll1cy91dU5D?=
 =?utf-8?B?K2JFRmVyVkhiS2FrRlpONmgvVTNkNXF2TEtvN3JjUnErQnhyY0tHYnJGMHcw?=
 =?utf-8?B?ckQ3NitaUVc2ekRob3M0V3hHWHZROFoxdytRSGVrQTduam5hcUJicURvamhr?=
 =?utf-8?B?b05vc24zV1l0NTYxZmhMTkNoMGF6bG9DcmdCWTk5QU9sWDdnN0Z4MXZoZWFL?=
 =?utf-8?B?Y2lWQm5WS0RYcVo2RXc3SHMwUUd0dXJKa3pnNDdDcmlpaHk2K2d3ZnZLYit2?=
 =?utf-8?B?OENJaXN3KzMwcXlRL3pvMllSZFRTUUZWMzNrTkl6bVJpTHBCZWN3Tmd0bWh0?=
 =?utf-8?B?LzlicUhXa0cwN09Zd203TnI5U0tOUVJUSjY1ZkNzaC9WU3JsYjg2NEVyMjAr?=
 =?utf-8?B?alVrYWVZelpPSTB4YkUrbldJcGlQNTJneVB1YnBvb0VFTXBFMmo2M0dqM1l3?=
 =?utf-8?B?ejBrb3ZOR3ZESzg5YTl0UGJNcG5IODI4MFJzQlpvRXdnUy9SZWpaNDdsSklI?=
 =?utf-8?B?S2w1dWpVSDRoUkhYMkFTR3V1UnhSRUVGSDZtdC9HamxnYTdXZ0oweTZLYU8y?=
 =?utf-8?B?dzFpUGgzOGwyanFVRHNnRUpueG1md2dOSFR0SGo3cFBYaU54cU8wZlBHbTJU?=
 =?utf-8?B?eWY0YmVnWjFUeEVXZ0FLeE9kSnJFNkdhenNveFB3ZnFnaklCRk1sYnlsekQr?=
 =?utf-8?B?UHMrNjkxcFprNWJTWG5WR1lva0dobEUza3FtV295RXFRNGxJak5IeUNiMVQx?=
 =?utf-8?B?TEtSOTRHdUwxSEZoeTd4WmMrRzJUV0FEc1dWZVJnS2p6UDRxMVFWdkZUc0do?=
 =?utf-8?B?Z0IwY1BSZE91azU4cXZJaTlxV0ZuclMxejlzVThVVkV1WjhSUkcwMU8xNThW?=
 =?utf-8?B?OENUZmg1QUloVTdKcklYZFROUGFGSUpoYTlRQlp0TnlEY2poMEZmdG1LWkFy?=
 =?utf-8?B?bGxLampoZFRHQUVYUVdGQldMQjhvNzhJRFphUnp4d0NYbEhWMHZ4RW55Wmgz?=
 =?utf-8?B?bS9TQnZXbC95Qmh4eWpMZG8rUXZPeGFSbmE4b1ZON2JEVVR3VXpUa0Z4cDlJ?=
 =?utf-8?B?d3ZYa3l2bktYWmtyUzVhU01SWTdnTDhNL0VkcUViZkVDSC8zbHhvSUJuS0s1?=
 =?utf-8?B?QzFHdFRNa2tQT05PZVlEc1BzclhYTmlVQTNVd0hnT3VVSzQxaE80dEZLRVdI?=
 =?utf-8?B?cmpRVXhlV25Icm8rcFkyUzh0V1RENDlvMlRSeEZBVy9Wb1ZBNXhtT2xiVVZ1?=
 =?utf-8?B?V2c2Wkk5UlcrK05SQmhyd3Z4ak1rQmkxZEVheWVoUWMvYjcrNURlM0hUMGQ4?=
 =?utf-8?B?OWlsL2NQSVM1MWxZeWd1bk5YV0ZxSFZHWUxPaTg5bGdOZG5JdytqL2NrWDFl?=
 =?utf-8?B?MjR3Wm1SdU11NHJWU0ltOENJSUxUazZpUTJPL1VGS3Vxcmh2ZDBYbEhxbWZW?=
 =?utf-8?B?OE5lMGJlN1V6RzlBQ0U2UzBiV0hsL25YbGx1ZlpkVlZPLzYxRk14bDQxRFEx?=
 =?utf-8?B?Rk1GNmJNS25RU0JQMFhkYlloVW4raFJKa0F3VUtNaTUrWGVFUmVLbmluUjY3?=
 =?utf-8?B?S1lvTEN5c0FyNi8wVTN5Y2JLSkpLc29NOGVhM0ZNaVg5WmNDc2VzV3RUS3pR?=
 =?utf-8?B?cElsNmtvRlBaR2VDMEpiYU5uSyttVjVNakw4K1Q2MG1kZWlwaXZqZnN1T2ZJ?=
 =?utf-8?B?YWZPS2VIN05pS3NFY2lVVHlObDQxUGJyKzFyWmtYcHV2UG5PT2FLeENPalF6?=
 =?utf-8?B?cENudWV4VStwVnozTnBlYmlCaUc3RGdNWmJtbjZIVW5aWWdqL2RrcWFKR1E5?=
 =?utf-8?B?VW9CYnhuY0pHdFZJUUkrTkFnS3dZRndHdFR4cVNwZW82VXZsbS9UNGNSWGR5?=
 =?utf-8?B?SXA4WWRkaFIvbVpBYTY0Q1BrbFBtaCtUQmpXWlVsd3crVitsa095N2ZaQmRH?=
 =?utf-8?B?L3FPcTJ0cHExaTFzWjZvaTIreHFLcW1DRDBsalVYWDRiNTdYL2dkSTRSRk0z?=
 =?utf-8?B?ZFdmRTdMR2VIajFsb1Q4UGJ0YkZHWVMxbWh0elNvUVBNaEcyNVdPdWtzUlVq?=
 =?utf-8?B?MXVNRk5zbTJ5N0RVWC8vdnJmU2tPTlNDdkFCWjdVSW1rTUJiZTQ0eHVZSk9o?=
 =?utf-8?B?LzZaUnZPSWtlbmgyWDc3ZnBkVkE4dVZBdENyK09vV3JnQmQ5NkttcWMxd2E0?=
 =?utf-8?B?cDJRZEtiYVY5OWFScDV2YUNCOVRuYnU5YUR3OVhLK085TGRrWWdoUnhVR2Zn?=
 =?utf-8?B?cGQ4YXdod3VaZUlZRWxnRE5lK0g2QW42MjlPZkRIT1NGcDJvYnRjZVJiVjh0?=
 =?utf-8?B?b2pHMCt4aFdlWGYwUE9IUjZhR0VzbXVWYyt1K2dFd2FJaWZ0cXJvQ1pHSGR4?=
 =?utf-8?Q?YeRonpyUVimLvl6o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5A1B2CAEDB03047BF0BB54F23AB5452@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rCYaUL/oGs3PMGyHH6ck/qzqaIMJgKJSWFRTtpfVvW8LR/FYvGtPPqdwLkWKDcBeaWnvZm8ccNLgfs4t6BhpP0sKAZat8fWDJeXyxRmvHHRnxkp/QemdxWsdjktc0SpcgtARwCyhx++n8Smo97KeHnbuOWfaLJXcXwJqCqAUpV2vPYJYXziviW0fwENarTDYSWilRy/n+jn5EcKr6ChvwzLnbt6pTY7fztCNvwDhtgLVsFdpETAFiqtUUFURUl0+4TQ1J73yHEZLrQw197Ar0RDy/8Z7tB3yT5cYm8FfdEIrVEuH1CDPux+6vqH3NLIz06TdzfI/Cxo2RJi6LsYEpA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2717a112-8aef-46d1-fc10-08def25920cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 18:49:34.8964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: di5d7sr0aN11GmZVliLpqAqMXhd8yIJb+faoN1CTS1lpU8VKKE70eW1tJTxmXXlpj9So5o6xTNzSW6TRvXb24iu2q1Ow+Eq43N3w18wES4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8988
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTA4LTA0IGF0IDEzOjIzIC0wNTAwLCBCaWxsIFJvYmVydHMgd3JvdGU6DQo+
IFdoZW4gdGhleSBhZGQgdW5sb2NrIHRvIHRoZSBnZW5lcmljIGludGVyZmFjZSwgdGhlbiB0aGF0
IHdpbGwgYmUgdGhlIA0KPiB0aW1lIHRvIHJlY3RpZnkgdGhhdC4gSnVzdCBsb29raW5nDQo+IHRo
cm91Z2ggcGF0Y2hlcyBhbmQgc3R1ZmYsIEkgdGhpbmsgdGhhdCBzaWRlIGlzIHN0aWxsIGluIGZs
aWdodCwgZWcgDQo+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDI2LzQvMy8xNjUxLg0KDQpUaGlz
IGxvb2tzIGxpa2UgaXQgaXMgYWJvdXQgY2xlYXJpbmcgbG9jayBiaXRzIGFmdGVyIGV4ZWMuIFdo
YXQgSSBhbSB0YWxraW5nDQphYm91dCBpcyAiUFRSQUNFX0FSQ0hfUFJDVEwiLiBJdCdzIGEgc3Bl
Y2lhbCBwdHJhY2UgY2FwYWJpbGl0eSB0aGF0IG9ubHkgY2FuDQpwb2tlIGF0IGFyY2hfcHJ0Y2wg
YW5kIG5vdCByZWd1bGFyIHByY3RsLg0KDQo+IEl0IGFsc28gbG9va3MgbGlrZSB0aGUgbW9kZWwg
aXMgc2xpZ2h0bHkgZGlmZmVyZW50LCBpbiB0aGF0IHRoZXJlIGlzIGEgDQo+IHdpbmRvdyB3aGVu
IGFsbCBvZiB0aGlzIHNob3VsZCBiZQ0KPiBoYW5kbGVkLCBhbmQgdGhlbiBsb2NrZWQgcGVybWFu
ZW50bHkuIEkga25vdyBvbiBvdXIgc2lkZSBvZiB0aGUgaG91c2UsIA0KPiBsb2NraW5nIGlzbid0
IHJlYWxseSBiZWluZw0KPiB1c2VkIHlldC4gQnV0IHRoYXQncyBjcml1LCByaWdodCBub3csIHRo
ZSBtYWluIHRoaW5ncyBJIHdvdWxkIGxpa2UgdG8gDQo+IGNvYWxlc2NlIGlzIGxpYmMncy4NCj4g
DQoNCklJUkMgQ1JJVSBuZWVkZWQgdG8gdW5sb2NrIHNoYWRvdyBzdGFjayBkdXJpbmcgdGhlIHNh
dmUuIEJlY2F1c2UgaXQncyB0cmlja3MgZm9yDQpzYXZpbmcgdGhlIHByb2Nlc3MgaW52b2x2ZWQg
bWVzc2luZyB3aXRoIHRoZSBzdGFjay4gU28gaXQgbmVlZHMgdG8gYmUgYWJsZSB0bw0KdW5sb2Nr
IGJ1dCAqb25seSogdmlhIHB0cmFjZS4gQXBwcyBjYW5ub3QgYmUgYWxsb3dlZCB0byB1bmxvY2sg
dGhlbXNlbHZlcy4NCkJlY2F1c2UsIHdlbGwsIG9idmlvdXNseS4uDQoNCg0KPiAgQXMgTVVTTCBh
bmQNCj4gb3RoZXJzIGdldCBwYXRjaGVzLCBpdCB3b3VsZCBiZSBtdWNoIHNpbXBsZXIgdG8gaGF2
ZSBvbmUgaW50ZXJmYWNlIHRvIGRvIA0KPiB0aGlzIGluLCBhbmQgcmlnaHQgbm93DQo+IHVubG9j
ayBpcyB1bnVzZWQgKGV2ZW4gaW4gdGhlIHRlc3Qgc3VpdGUgOi1wKS4NCg0KSSB0aGluayBJIHJh
aXNlZCB0aGlzIG9uIHRoZSBvdGhlciBhcmNoJ3MgQVBJcyBvcmlnaW5hbGx5LiB4ODYgd2VudCBm
aXJzdCwgYW5kDQp0aGVuIGxhdGVyIGFybS9yaXNjdiB3YW50ZWQgYSB1bmlmaWVkIGFwcHJvYWNo
LCBidXQgZGlkbid0IHNvbHZlIHRoaXMgcHRyYWNlDQp1bmxvY2sgcGFydC4gU28gd2UgZGlkbid0
IGpvaW4uIEFGQUlDVCB0aGUgc2l0dWF0aW9uIGhhc24ndCBjaGFuZ2VkLiBTbyBJJ20NCndvcnJp
ZWQgaXQncyB0b28gc29vbiB0byB1bmlmeS4gT3Igd2UgbWlnaHQgbmVlZCB0byBkbyBtdWx0aXBs
ZSBzdGVwcyBvZg0KdW5pZmljYXRpb25zLg0KDQpBbHNvIGxvb2tpbmcgZm9yd2FyZCB0byB1bmRl
cnN0YW5kaW5nIHRoZSBzZWN1cml0eSBtb2R1bGUgcHJvYmxlbSBzdGF0ZW1lbnQNCmJldHRlci4N
Cg0KPiANCj4gSWxsIHNwaW4gb3V0IGEgdjIgd2l0aCB0aGUgY29tbWVudHMsIGJ1dCB0aGUgb25l
IHRoaW5nIGxlZnQgdG8gYmUgDQo+IGFkZHJlc3NlZCwgYWZhaWssIGlzIHRoZSB0ZXN0aW5nIHBh
dGNoDQo+IGRvIHlvdSB3YW50IHRoYXQ/IEknbGwgZHJvcCBpdCwgYnV0IEkgdGhpbmsgdGhhdCdz
IGEgYmFkIGFwcHJvYWNoLg0KDQpZZWEsIEkgaGVhciB5b3VyIHBvaW50LiBJdCBpcyBnb29kIHRv
IHRlc3QgbW9yZSwgYnV0ICNpbmNsdWRpbmcgYyBmaWxlcyB3aXRoDQpwcmUtcHJvY2Vzc29yIHN3
aXRjaGVzIHNlZW1zIHRvbyBoYWNreS4gSXMgdGhlcmUgYW55dGhpbmcgd2UgY291bGQgZG8gdG8g
bWFrZSBpdA0KaW4gb25lIGMgZmlsZT8gTGlrZSBub3QgdGhlIHRlbXBsYXRlZCB0cmlja3MgdG8g
Z2VuZXJhdGUgdHdvIHRlc3QgYmluYXJpZXM/IEZvcg0KZXhhbXBsZSBlbWJlZCB0aGUgc3dpdGNo
IGJldHdlZW4gdGhlIHR3byBBUElzIGluIGEgbWFjcm9zIGluIHRoZSBzaW5nbGUgZmlsZS4NCkxp
a2Ugc2F5IHdlIGhhdmUgU0hTVEtfRU5BQkxFKCkuIEluc2lkZSBpdCBkb2VzIGVpdGhlciBBUkNI
X1BSQ1RMKCkgb3IgcmVndWxhci4NClRoZW4gaGF2ZSBhIGdsb2JhbCBvciBzb21ldGhpbmcgdGhh
dCBzd2l0Y2hlcyBiZXR3ZWVuIHRoZSB0d28gYmVoYXZpb3JzLiBQdWxsDQpvdXQgdGhlIHBhcnRz
IGluIG1haW4oKSBpbnRvIHNvbWV0aGluZyB0aGF0IGNvdWxkIGJlIHJ1biB0d2ljZT8NCg==
