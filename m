Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD0737DEAD;
	Fri, 20 Mar 2026 17:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027389; cv=fail; b=gkKyEujbt1zusjm5A2J/+7QQVBsexJ+q2mSXyJ1fd7dWons4fNXnBrKEHII0OhvRNf2Ffnrc2YnRivEN4FvQnrx2G0K54TGbZvk9aqyitmrYp0cd/N6L5CEs6ZMqc39tb4ABUxZp8F9XCpxIcY24Hkq+fADgzZKqVjy9Tlu8hUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027389; c=relaxed/simple;
	bh=xbPU1tKriGCaKNrAM46ASOK1yuMuEsiP/QaTHu3c2J4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=etfuL+bpkixYiqL+5iFU65FxUoG5w2ratYvv0uJaj0tGR5L6DWZuUd4kdMOjiGFU/4UsWny8lnBBLhLNTaE1yfKMYZbOYWsG31lDT7X+tp9qUMKkQ1aZg2AU5Aj40uL/pXzXfwNpvipplgaRlTTTXt04mEHw1TdnFFJz01UqCf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHujoN/U; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHujoN/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774027388; x=1805563388;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xbPU1tKriGCaKNrAM46ASOK1yuMuEsiP/QaTHu3c2J4=;
  b=DHujoN/UCjPe5y5pmt7U7/bNXGL4eGKqWVv1WCq5q9oTf8iM+P+l3TaF
   /Q8yviQxIDgOMVyeo2OpAT3bHyFLxIe+/nQx3MLNj+4kzjc7alQI4F6Ir
   EBDoJVIyNi8p+6T4zvr+QgTAlPqad8aT4sdkrZpKbrtL4SlLwyseSqDaM
   nHExQaFqpcb6K7xHpajXICyaKNBIpY/R5c/8bpEV9IYSXtig76wiNsgMs
   QiTxVa/wA1nqwvWGEeF2Mi5Wk41iQnzwe/XXRV78OtjYjDCOhukv3VimK
   qzVNIrC/jAfQMRhvfNWpmOhMeLHkCEyOV60HVaqZtL4j46HUtS/3B6zb4
   A==;
X-CSE-ConnectionGUID: xvku5xHpSGidGp50oeE6xw==
X-CSE-MsgGUID: LWpo1VdrTlagv35K4XnVTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="78719947"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="78719947"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 10:23:07 -0700
X-CSE-ConnectionGUID: Nw2bWc3HQsyjsvnF0n4qFg==
X-CSE-MsgGUID: rTy3mVc1TtKQrnRgE93rcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223376875"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 10:23:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 10:23:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 10:23:06 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.18)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 10:23:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USidLU+tLqArPVcK+sPtG1rjlN+HCVbW1vbWbyT1mcyEH/eOE7Y7rinCwzwWz1rNs1MXvlUqEGgZLG6Am5xgwFKOzNjaRxT2LSGtNiH3cYSDhd05WKmiQMQ7BF+2fPahPk6eT4zKdtnfywq9xZte7fLh9oGtdZSfPI2R1vdB5DBtfmmF8YZGKTeHZ7GJPnCGD4PeU/qYw0CKhhzawuqh5E0kYqJdJN+mlKpKez7eRzLGL9ne7Na4Q9Y1/lXlcNG45Ajxbi/8bLkgwjsV6oCprgGJqa40xGcov9Ewb1NCI18GxPUYB6Tu+z1II2+uge1fx80Uk+VkJwA9haJy/kW9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbPU1tKriGCaKNrAM46ASOK1yuMuEsiP/QaTHu3c2J4=;
 b=lOvSZmkq2/r3rj6YXoSGbyvTx6V/9YpRMBp3Wqri7ybVJa9THcWWYujSRBuZ9UrtOLH7v1hdv8s47mvVMptEd+nXXPeRQ8sheUQr49rBhXzCx6FbAI+haXryuf0s0IqLo0gs7QB+7ww1upTYG06IetDNiZshv2kDH5fF91Va1EQLcI8lvgAEFacTddurxLdIkHegKh0ztFapgVzXMpgXS2nBEIq15R1qW7jTfNB9luPnRdS7X4xxYI2MeOT3zWt3wt3spi+6rqW98rac4Ph2/MWJNJll6tZ2g2/gkSxlkYvTvv4N3Weq5HCWhOV069sBmypIIAPDuLbvNpMNESjNrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Fri, 20 Mar
 2026 17:23:03 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65%6]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 17:23:02 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "aleksey.oladko@virtuozzo.com" <aleksey.oladko@virtuozzo.com>,
	"ptikhomirov@virtuozzo.com" <ptikhomirov@virtuozzo.com>
CC: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"hpa@zytor.com" <hpa@zytor.com>, "shuah@kernel.org" <shuah@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>
Subject: Re: [PATCH] selftests: x86: test_shadow_stack: return KSFT_SKIP when
 test is skipped
Thread-Topic: [PATCH] selftests: x86: test_shadow_stack: return KSFT_SKIP when
 test is skipped
Thread-Index: AQHct77YujKQvqesrE2L06NTnMibgbW2IB2AgAEO4ICAAH3tgA==
Date: Fri, 20 Mar 2026 17:23:02 +0000
Message-ID: <242ac7e2587f510436d68dccf2877e03e311a75e.camel@intel.com>
References: <20260301014733.454260-1-aleksey.oladko@virtuozzo.com>
	 <d3932934-3dd0-4296-8ac1-f06b818624f7@virtuozzo.com>
	 <5a977040caae42e41e3fab53efdfdb9201b67e3f.camel@intel.com>
	 <3205f6e7-bf02-4fb4-ab03-278447c17f70@virtuozzo.com>
In-Reply-To: <3205f6e7-bf02-4fb4-ab03-278447c17f70@virtuozzo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CH3PR11MB7794:EE_
x-ms-office365-filtering-correlation-id: b6de866e-e7c8-4972-8ee6-08de86a55772
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: ErolyOF/Nqgy5fd4XdJ9DFyVYAQKg7QF/mcGUhDUQ7d0yuZZMiyDRLXqqJgN0aZixV63n5bYh2Nqjn6WEVq9ijffenyI3Z7zppy9Y0+7P7R2nqqr3qHZeuIPazcVYlVE8pL4k9fYevxTlqRhn5cyHpYWLPCgW/59yDUtZFRdTl5YzXqEe8gi6+8PO0mdraEXnrwKVZ8p7IWIEpaiIS1sId5CXmuS/8UZK1cvKLHdZYEMcT9kyFJmo/tUcbV24TzheAhdJeL9OHHLE9tYKOqXZb1qMlMdc4XOzvc22GyM7c/uOJJiIMEaRWHX4GSxDLzF1Sc5+dbWdL4ONhYSgDoJZ6y+YdxTbaYTWJCTm/37J/nb9Nx76omN1tQeApwhahXzXat01wsRAQ5XeGhf97oo/CdDk7HPLPRKCQaLihvFG+7E5VTTmcjJM2wa+0jODzGUGGf5dJnEir4dvDxsSOjm7AOXqxkJh3tljB+KbaVQ1B3xVfPcDgcjNOtEiOabvpcczrHNlLqSQoeksZqJJkA4Ucs0gH0Qqx5dW2lmPMTLqcgTI3GeS20ZZlzpdFRTlEE+WL3/15JdHeAVsZWVHvTksMnhtDa6WhyHJjSNctg8QjgZFRtSFtIUUkieeJUqWSo2/7+jmaJJZ47jFWAR8ofDpxvWdDJeWOvQFTcDJeau/aOb/CgIFvLc0MFaWijFfQP5uI54QB3kQ5yIZvwr22NUSMf5DSaN9VepTi6uHEx4qSyHcLjY32J63ZZYtluEpIQI19EpXrOreEo+f0XFmZ8Lj6q0GnAdAbjIUWAaw6BvpC8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGY0d2ZvTVdEb3Irem5SMkhSbnFIdFFFS3IyWTNieDNoWExYMzBRWXdqM3hX?=
 =?utf-8?B?Q1YwYjZ0Z0FCa0tsYXV3QW9IS3RtU0ZYTjlpYkRjN0NHbGgvRWRTNm5RbGp1?=
 =?utf-8?B?Y1I1eTg1blc2dzVwNEl4ZFlmN21ndkNuRVBIdWpoUVNKTjVXcXN0WGJGVHdh?=
 =?utf-8?B?dXZHNDlROHN1djlkcTdGNitxMUx4dk1pVVRidGxWSWZEOUZER1dreDZpWVg0?=
 =?utf-8?B?eXgzOHBwdjhlMGdPWWNtc1cxcXRrekxOSEVNc3hBYXduWnFiMHNzNFptZEVM?=
 =?utf-8?B?L0F2SzBEMFBBYzc3WFBVNk9EWVRmd1F0OG9EUjBqSVNhZldqQWJOcE91anpV?=
 =?utf-8?B?c2toRUthOHZxcUZWT1A1TUt3cTdwZkxtYVFHUm5vZ2VlZ0l3dUZGK0ljNXJm?=
 =?utf-8?B?a1k2NUF1MW5YQnB6aWFUTE12Q3FiZFA3eU5jaEhsQS95aUd6ZHczRWo1RGNw?=
 =?utf-8?B?R0NrUjA4NWlrTlZVOHl6VW9yLzBQeEVrVlBvQmEzZzk0QStPb3VFT0lLV2Uz?=
 =?utf-8?B?RmZWOXZ5TlVkV1A5Wm1EcXhlUVRxaE5FUlFXaDR1UU4xdElSQkVvMXAxU3Ir?=
 =?utf-8?B?YVdubFhEODhyUWhpaC9uMEZua3AzeGtEdlJubnRTMjFReEpwRkY5K1duSXVZ?=
 =?utf-8?B?V0cvZWJnYnlJdGswZnRlbG9jaHJtRUlhMitoVStreVZlc0JUU0VRWWNob1BY?=
 =?utf-8?B?VGN5Z29STDFFdCtTQUNFM1BGUlora3Ewa1dFcGJIQkh3aFpaZ3JVdnYvTkF3?=
 =?utf-8?B?OXhFLzlydWxHZ3RRNys4SDQ3bEhEeFA1cGgwUEp0b0ZuK1BQa1gyMWszMGxo?=
 =?utf-8?B?WHFjVnZmcG9KUksvcmN6Q3kwZ1dMNjltYmZ1UGI1QUd4VUg3czZNNEFPazMx?=
 =?utf-8?B?NnhHcHdlRG12eXdPa0hkK2haQkNGRGorOEJjdVNYOHJ3cjhYdmU5clRlY1U2?=
 =?utf-8?B?bkpiY1RRMVY0RkZCSk82WHc1V2k0VndVOUh5eUFiSDhvMVE1ejRXVWNaRUdS?=
 =?utf-8?B?dFkwSzA0MjFGcWFxUDFTSktWVENidEozRTFMbnA5emJXdWIxOWw5RGdzM0ho?=
 =?utf-8?B?b1VBMWVtZ21GWEYrY3RjQTgwV3kvejJKT1JiWHM3YlU3ZThqQmNEVGsraU11?=
 =?utf-8?B?ZE9vc2ZpeVhBcmxiRFhpdXFwZCtDQy93bldhRnQ1dnpZWTFwODk2OFI3T0gr?=
 =?utf-8?B?M0t1U1FXZmpHSkpCYlZxQnU0aWZQalJFaXBaNC9oYjRPVklYU255RUFnbVdR?=
 =?utf-8?B?TjBrLzBUNmpzMjNRUHNaMU5SUDRMK3JEZlBTUkNCSm9nbXZoWkZzNldFd2tC?=
 =?utf-8?B?MHJpNlhramZqMEozb1gxVXNYQnRqWGxRY0dYYnJRSk5XZWxGc3J3eUZ1Tkx0?=
 =?utf-8?B?SlJQbXZOL3MzU2V1dEpBdU95Nk82dlE3N3ZPWHBacjBBc0hoYXFzemJjdFln?=
 =?utf-8?B?UG9uNzcyd3FGdzlPTEc3ZyszbHFYWmxpc3J0RVEvaDBnTnV3aCtqNnlLTHo4?=
 =?utf-8?B?c242dCtjMGNJd1orTHB4TWJWaTNjN3I3SUgxU2t0Q2lzNHJiVmxhK3I0c2JM?=
 =?utf-8?B?bnA2SFArUmhSL0trVXBhR01hQ040bWpSSUp6YWIzaVNEUHVTaUVTZDFNL2My?=
 =?utf-8?B?Vks5bi93ZVNDTnM2WUZOREdGTWJXTU5ERkNxU2k0ekoveDB2a1NIaE55d0x5?=
 =?utf-8?B?RjhQNzVIOEp5bDUvY3FUUlJqVVVaemwycDJNbXQwLzZUcFZFeER4Q2lNZFZ1?=
 =?utf-8?B?TGdTNm5IWnR3TXBONncxMkVBYmRzUmNBWS9NL3dQNDlNRE52Tm1sc1hJUFpB?=
 =?utf-8?B?ZndxcVFSTHNTYTd2TDlRa1BTT3lVOEtVSUlKMjhvelFML1FiZmtXVzlvWFdB?=
 =?utf-8?B?aXZmSlBSayt6MnlqYnRRQzB0TU85dW54c3JqVUZWaVJmWUZ4VE1EejBnODVS?=
 =?utf-8?B?RmkrNEkyeWZEYVlFb1JlcWptZEVPZ21UdHN1WmUvWjFpeWplMGJHbENsOTMr?=
 =?utf-8?B?Z3p2Qk54QnlaNUl3S1EzT291bmVTdHl1TjBhcGRUaFN1TlZ4MGtBUlhmdVRn?=
 =?utf-8?B?NS9kS3FnTVlRZEtxckRQWmhmajIzUFRnQnFoZ0ZCM09zVFNPU1ZaSGcwZHhr?=
 =?utf-8?B?bmRYVUNBRUR3MS9OYkdwWHJBQVdZeTlNMG41ejBWT2Q5TVh0dENVbVZEdXdu?=
 =?utf-8?B?dVUyU3p5cVJHTDhpYVNYL21aVFVPb0VFT3p0NzdlVmRHMXVVdmlkWnd2cjRD?=
 =?utf-8?B?aE1uRlhXNWRoaWZrcTI4QlhRMzdxZEN5Ui9hNG9aODIwZWFVZnlvVUNja0tF?=
 =?utf-8?B?YXlXcXhaeExraFduWVY0dDI2N1JPaCs4eHNheTFpU3RDd1NmaFYrRGk1eTZQ?=
 =?utf-8?Q?JjP4Ki5j1h4VDJfE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23628CB340550848A3800438918B53BC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wSN+mHfIMfoQvaOYSIVNf7Czl1LSmRSBi7shlgIKcHbW/c1T3h1LQCE9yU2PhnCHWt90t3+PXOqCR3wpLDKfmT1aSdgAYXyUQskmEgXqZICK5Fr1KpTiaWNgKSHyomv6GGwAhvfKyN+vGc7f8gTmQbNPVeSl2x5OtTxWYYA9nS6FR/Bf1pNnVM1I1a033kjO5N5QjwVOESQLprtTk0FfjQipo9xDFf6csMfGmUe2nCdQkpvPBhKQtYwViqsBs6omcB54VYiQ1aFqZyVxnYuG7vz9rAuOJvg3SBJ8zQJKy8Xq8geyxvUXyjdbXWCtHyJ5ebT+z6KhxIbBd9ra/aEWvw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6de866e-e7c8-4972-8ee6-08de86a55772
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 17:23:02.7170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hyLyknQ75o6Iy73ZVvHFOq+Qhp3OQbdD7YWfze742MkjWLZrXe7Z55hWzZ4R09wR1ya6q40+6MhT1lQrLoYTJssv/ZQ9Qnkpw6gyyvVXQrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI2LTAzLTIwIGF0IDEwOjUyICswMTAwLCBQYXZlbCBUaWtob21pcm92IHdyb3Rl
Ogo+IMKgwqDCoMKgwqDCoMKgIGlmIChBUkNIX1BSQ1RMKEFSQ0hfU0hTVEtfRU5BQkxFLCBBUkNI
X1NIU1RLX1NIU1RLKSkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByaW50Zigi
W1NLSVBdXHRDb3VsZCBub3QgcmUtZW5hYmxlIFNoYWRvdyBzdGFja1xuIik7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpbnRmKCJbRkFJTF1cdENvdWxkIG5vdCByZS1lbmFibGUg
U2hhZG93IHN0YWNrXG4iKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IDE7Cj4gwqDCoMKgwqDCoMKgwqAgfQo+IMKgCj4gwqDCoMKgwqDCoMKgwqAgaWYgKEFSQ0hfUFJD
VEwoQVJDSF9TSFNUS19FTkFCTEUsIEFSQ0hfU0hTVEtfV1JTUykpIHsKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwcmludGYoIltTS0lQXVx0Q291bGQgbm90IGVuYWJsZSBXUlNTXG4i
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmludGYoIltGQUlMXVx0Q291bGQg
bm90IGVuYWJsZSBXUlNTXG4iKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
ID0gMTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4gwqDCoMKg
wqDCoMKgwqAgfQo+IEBAIC0xMDU3LDYgKzEwNjEsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hh
ciAqYXJndltdKQo+IMKgwqDCoMKgwqDCoMKgIGlmICh0ZXN0X3B0cmFjZSgpKSB7Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IDE7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHByaW50ZigiW0ZBSUxdXHRwdHJhY2UgdGVzdFxuIik7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4gwqDCoMKgwqDCoMKgwqAgfQoKU2VlbXMgZmlu
ZS4gVGhlIHJlc3Qgb2YgdGhlIHRlc3QgY291bGQgY29udGludWUsIGJ1dCBpdCdzIHByb2JhYmx5
IGJldHRlciB0bwpoYXZlIGV2ZXJ5dGhpbmcgbWF0Y2guIFRoaXMgd2hvbGUgZnVuY3Rpb24gY291
bGQgYmUgY2xlYW5lZCB1cCBhY3R1YWxseSwgdG8gYmUKbW9yZSB1bmRlcnN0YW5kYWJsZSBhbmQg
Y2xlYW5lciwgc28gZG9uJ3Qgd2FudCB0byBkaWcgYW55IGZ1cnRoZXIuCgo+IMKgCj4gwqDCoMKg
wqDCoMKgwqAgaWYgKHRlc3RfMzJiaXQoKSkgewoKVGhlIHJlc3QgbG9va3MgZ29vZCwgdGhhbmtz
IQo=
