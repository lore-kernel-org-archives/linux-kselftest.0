Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD6C138490;
	Thu, 23 Apr 2026 09:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937165; cv=fail; b=rUUlIuuhJN3gOyNzHAy74YVGlijePiDhVaIgXv00WMpcnbXfHkwGHR2bPaJtfCtt7mKaQVsWym+f3+rQ2E1qFUs/62YGpoxoRThIZGeEbmmLu06XF3Yn9LjSbFhZqbsa7bpihEJMX25hUq1L29FYRKwBGqyvNGV+9LfhzP5z1R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937165; c=relaxed/simple;
	bh=5TRPiDqdtYTx/7xa1eaBFU++uVDFjhJ7xtxIoni+WE4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RIFugGFWz2BAy+8FsbXuDA9ZjeP9nxHgKqtVlM0kJoVRUOZi7zdcSP+Q3SDfOnEXWDeRzgbZ5kOmW/h9Sppm2Hv+G9AsPAIj4z3Leukebw19W34GcewvR4dm3klYq8sL4RnKm4Kwlbzi1pU8lEDZXHS2aPYCjsJyadCUc65UnR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtVx+kag; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtVx+kag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776937162; x=1808473162;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5TRPiDqdtYTx/7xa1eaBFU++uVDFjhJ7xtxIoni+WE4=;
  b=EtVx+kagIoRGXSibLR/uKG1kuDOuOLmdGpwFA5E4k3EPrliZCF2b8GTF
   e1FNA+ziKo4s8gSAz9yiJKsFcdvl0lzz1nGu6Xal3BscMMXqXRH2uGivZ
   P6Hl136Cu0ZusO/IMqGXHCjv8lIrP7uMrPdBZknuwGieIwmo+zmjPWsen
   x6Vg1xEYhXyDlXtL3xbomvTaS5x1iS9QnzyRubwIwBW3R0+Ns4jX1XZcB
   ctikbaq64QPjRbyJsgfzcozloPRrLiV8dTLvfI7gneh0KQO2n1Xz9iYPK
   1TPX+Zg3Kp3Ve0H1Gp/OV8XYozAWUJ8xpkTtbKE5T9uJFV7LdDLzMgZ6e
   w==;
X-CSE-ConnectionGUID: cNZIAu5NSOSQ8JPplyqC2A==
X-CSE-MsgGUID: KVr05ojbR7GSFeggSrlQQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="89290349"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="89290349"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 02:39:19 -0700
X-CSE-ConnectionGUID: 3iWkItwCS5yyVfC8ERuCIQ==
X-CSE-MsgGUID: huyBPNqpR36lHKawFqrsHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="236600618"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 02:39:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 02:39:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 02:39:18 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 02:39:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhWfBWhmNFYcOQn7eTLFctHiSFOarKK9aD4SBdS+tPKtnHH1ZdyA8cb3QaiD0ChpiwrUYxxHS66U/wXXvjzKxRQr3rCELJvFtcV3z0EGgCSk6GBkG47hqQtD1Ud+OAymhmlgAIsjhHDxXDycWj/p42+mH3QBqokW8i1v318F2pMcYE7qOCz9CDEAGqwffxj26Vh5XvWzJg8aAf3/d17iN9ME/LpaRto/p/v0y6wNKkkmvs5dRU6krTdpEOMTW43O7gqVtEoKO/UVeGCU8MusRMVVFTgkWROXZJxXIdlHsUimvMnPD9HAU1vFQfjSpJEwsEM8u1Fcn3AT3AoJ7fI66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QN5/k3moXuchLyLD/4xD4eoKY49yyIBL3SacUOzGGfo=;
 b=UertL0NjU7qshUITatSORBxByaZ3vV9wezFjVm6CGDN2FCCGmW6tXCnkjk7BGGf55qaDn0hwptoF80sVmSP5xHw6gUG1J7iASUtTj6NceLRwWUoXHgAAedSaOkJrtSRmR9Y7rXFEWpIbdR/7TJXkkkzlpUHVf+bPPaXLYRepQHjq4sjo+LiO/60UuGy91DKspyr1Wk6AGMpRrFNehdKOY5bYRkrNzNnmBFv4ckm5McD/JO8xzBf44c7RFoGRE3B7Uh2ryoolqAxSEg2LI8fFfTPEwRsgCtweAVH1IATf0XA2JoKkDWo4VA+iSY0RuTvd93FdpLdfMtNK545EPFftmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by MW4PR11MB6786.namprd11.prod.outlook.com (2603:10b6:303:20b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Thu, 23 Apr
 2026 09:39:07 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 09:39:06 +0000
Date: Thu, 23 Apr 2026 11:38:32 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
CC: "nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "justinstitt@google.com"
	<justinstitt@google.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"morbo@google.com" <morbo@google.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"xin@zytor.com" <xin@zytor.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "nathan@kernel.org" <nathan@kernel.org>,
	"oleg@redhat.com" <oleg@redhat.com>, "seanjc@google.com" <seanjc@google.com>,
	"hou, wenlong" <houwenlong.hwl@antgroup.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "m.wieczorretman@pm.me" <m.wieczorretman@pm.me>,
	"peterz@infradead.org" <peterz@infradead.org>, "tglx@kernel.org"
	<tglx@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "bp@alien8.de"
	<bp@alien8.de>, "ljs@kernel.org" <ljs@kernel.org>, "perry.yuan@amd.com"
	<perry.yuan@amd.com>, "jgross@suse.com" <jgross@suse.com>, "Mehta, Sohil"
	<sohil.mehta@intel.com>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v6 1/3] x86/process: Shorten the LAM tag width
Message-ID: <aenijHu4NSBmpayW@wieczorr-mobl1.localdomain>
References: <cover.1775813245.git.m.wieczorretman@pm.me>
 <79720f2640839b15f22e3618136b084cb376456b.1775813245.git.m.wieczorretman@pm.me>
 <8bc4ff4b7491c6fea6e17583a6fa249961c08275.camel@intel.com>
 <aemzYE5td11cWydN@wieczorr-mobl1.localdomain>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aemzYE5td11cWydN@wieczorr-mobl1.localdomain>
X-ClientProxiedBy: DU2PR04CA0294.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::29) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|MW4PR11MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f13baef-8e87-4d56-f1c1-08dea11c29b0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: ckdjnsQVN4Kq4m4xFDdm6S/VSTkyvkeqXA5nG2TAHDr5KMSzuyzKb4hpV0UB8v4IK3sYvoukgBy7cAZhlAY4xR0BHvHkYKrK1i2bOb61AfpWuwssuK9+UFDoNh95Fw/8+EEEYGf72dO+cjFqYfMREw/0pXErMo5nhaWovSD5uhaPZnXcqYL+BipMiFW70j4MyGE0285d8R9pjNOZ6EkM9FCKSHvcl7Sh//02lA/jOipWauLWaWo6XqvTHxy9tOTeYW1kQtsI8bBsiZlLBz63lEUhVP+F/tw3hY1O6EMx0acgvpKklp23sBtkvIyJWSbGClU/YElXTJNPnA4S4RiTQ+Si6e1ir3+0onXW8AGi3K2uwddfBJcwq1Z5Lg5jaFJjPC/rgZlpwRVsO5bK70ZeppVHIbKxXlYxVQZ9ZCIJX7LJqJRavf3HxazFY0kck4GjUybRVOfuRBBFFmxvJjuzlKr3IuFCx9BlvB71HyCq1g0a/reF49HTsvYP2INhwrhzlejUK8P9NOXyVEDnXKFSn2cjlOu6KyLeVcFqujM4PnddB/XRcIkZ6tjZHl/Hu2xSgA2r4fAfj3v7ck0kvPFuJeq9aSsOunULTB0bvZ5sKlfKFNZHraxF9nQnGA9xc8t9+EcpUMt70KS0SXzWUMqnLycoeRIHiMzhYGiXfOdROxIUsyw5/79RJE0PYWVaMn5zjEWqEiTzXQrVvtuNeVha1+BBp05DOaUuysxadht3Iew=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gLqGEhLGmbTXyNNxhPzGguRECyma5IOhC9ZlQj0xeuFtzPaHcCnMhxw2oc?=
 =?iso-8859-1?Q?Yv1oPpKT4iCNJWr5GG7sqsrPqdLUovfR7UlNrhVGREArLhHrIJ/eKKxIso?=
 =?iso-8859-1?Q?rrt9N4Nmh2S7GOl0FA8bPb2/kz9RUaY3dyDlt0gn077qIXv9H7Z0LEOyKj?=
 =?iso-8859-1?Q?aXC23m2trQE828BOxe4CuUM0bqZuEU8ivp54PTWVGfB8Tyk+QhCF+KWdSk?=
 =?iso-8859-1?Q?LiVUEyN8+ZwO7b1BzT8NfPROeQEpeVtybYq2l7Zp+mKEu0fLqxek7TmZb4?=
 =?iso-8859-1?Q?XfveyUhZ7EJFYCpiirn+OrtWFsDDTCYwFSjIp7RwK4waducAaeOK6eaXnb?=
 =?iso-8859-1?Q?hcRFy8op1ZDH3Hv66smZjOWcOR1dXciNGREOuRkFsX3GX+6wC1vXXNBTkD?=
 =?iso-8859-1?Q?fH/07jmBpp194JphnBLPVpPyJJBZR12fmLPq/8jY9rRTiRdSkAx/U5dFIj?=
 =?iso-8859-1?Q?C6I8bOavv45cuSMm/ioR/Oc76An03EHQSg1QEsWfbYsrS/Gyb0095f3qpU?=
 =?iso-8859-1?Q?P1NG+FG+kJhnXoJXUFhhNByPpXgHhxxb0FjTqSd5SVhJ1VPinGw0ZLyhyN?=
 =?iso-8859-1?Q?E8bIUahDWiqTbv08q7GtU507nEQzQ+v8b7ddepUZ6l+jch1E6FUhVBHRxv?=
 =?iso-8859-1?Q?62SKRt+KaJhq/wr4p2HbLYkqd/pMW3843IQ/BZyS8QQpyfnug7/acovqHv?=
 =?iso-8859-1?Q?ULGVubCze5RaTwIQ85nYVLKtJ84NrlAgXNI3dQuZpwDcTYxTdeOKwvLDDj?=
 =?iso-8859-1?Q?XYfTa2K0E2htk/8qlnxiAHFxlZR0Ld+7/GbmbNFzDMxqNlDE6ZQICdF44g?=
 =?iso-8859-1?Q?OxTp57yHQU/eqL+MMXohsTPyNNlFmZCpUOQRQlnIoklvbPg08N/lCPAj/+?=
 =?iso-8859-1?Q?/HVhy9L3dJ6qwkUHbE4zDZs40WJJCzoeEiZ0ISfPVUaVJp8k1qIUmmbx4L?=
 =?iso-8859-1?Q?eoLFf/Vz0YLTAkcFidVT3Jq78cGag6QIy4QmEk7czB4afzxxyvX/4LRXcr?=
 =?iso-8859-1?Q?YXPSqc7s1+mFNf3RnMxwBYhB5ZMThKGlKTsWSiTkjlglAa3sFhGEHYxVjs?=
 =?iso-8859-1?Q?n2Ku+z3MWJT4jKyh+z8kOwe3meER0YhLMFLQhnm1goBccL2MY02btXpo93?=
 =?iso-8859-1?Q?6UaN1VFKwJASFjXaE27d3e6FSYhC4pqau+7I9bevrIKip4MJEOs5Umhvy3?=
 =?iso-8859-1?Q?oHQz/NhQ6wj6pZ7xgcqG9TGCStRH3QnOQ12bV3md0Gl+WGrWXlqpqcfBdU?=
 =?iso-8859-1?Q?oP2Pa22j6HLMyqDxylt5gOnx8bpyyAj0D5YzZisdGDzPbJtXeybdpqosoE?=
 =?iso-8859-1?Q?/IrvmpZWzBfCRszbulA673qreP1+EkNAf/bQF0eymNLY6QULDgha2a0kkN?=
 =?iso-8859-1?Q?exr15AZQqCK9Vi9WJ8ki7VrMZwACx60xbrGtOaVlFJqVsiyOChsdDf81/q?=
 =?iso-8859-1?Q?hfA04zOZZXbEh+LvKnhATv1yYIMlV9ppQfcT24Q1QMR2AXMKVBTLCN9ka0?=
 =?iso-8859-1?Q?/jfro76Igk2DAidgaEojsgdRErJrsw2x+ss/cDWPMmPYemcLqb2LJGPD1H?=
 =?iso-8859-1?Q?C90dXcQY7mBnZXqD1/yVEEFw5zdF9/sN9Bqqo6OxEV0qsIVatSXnS+eqDO?=
 =?iso-8859-1?Q?aHO9VKse5qFfPFRtM0cQEjjVSJBPk0mrILhCOPOpwwW3Qjyc7gkdgzUm4e?=
 =?iso-8859-1?Q?4UYAORJQKj1MK4hhFoM5VZGc/JCTDKpf8Ttzz/BMEWf8lHfuYEh7+AHeee?=
 =?iso-8859-1?Q?WXRRQlMmPLtGNdgah7aSLpcVWG1pczg/S9728U+59avn3eQxsEthK0AA2i?=
 =?iso-8859-1?Q?97+L5e6uM3S49gWsxxPJPNs5gydZo1K6dA468khDUow1sRgFIvFQ?=
X-Exchange-RoutingPolicyChecked: cPs5IH2+lyxmbgaKFy54vsGkoWxNFs8CQJnuZb5LLcqBH5L8DaN+CCtD7qgTJ4uFN6n9pYtSXTuxH/qrSI+HFvGx4evYNcZ2wlu1kimi46znCemYzOx2gaQdSjIt5QLkSE139yv3uB9cmf8CIrzYUq/W2OVloNKgWnnNJJP7HZT2YFnLRoIOGkLmYnHyDhB3FLVTQJmXzb6UoPSDFHU3DPuSy+aazstfNA53sDmdmiciPpPy6+t+kb0Eq1pfda920MAlwUb+KuTuUg5ZQuYMaguJxd1Eif+Q3ZX7p0UUG5pjU1WFiHS+aYcgSsWRoYH/6xhUJgSTL3V4DrUWRaLoHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f13baef-8e87-4d56-f1c1-08dea11c29b0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 09:39:06.8275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2cCsvqnqZrqa+GNSXbunMM32CFVyDA/Vp3UMD+zcQ0PFTFouWjgSyfdU+izZ8MUMDuJWx0Ef5GU2nnM9jqRFziSEjbKzrHFO4a/QEA2uCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6786
X-OriginatorOrg: intel.com

On 2026-04-23 at 10:09:03 +0200, Maciej Wieczor-Retman wrote:
>On 2026-04-22 at 18:07:29 +0000, Edgecombe, Rick P wrote:
>>On Fri, 2026-04-10 at 09:55 +0000, Maciej Wieczor-Retman wrote:
>>>  
>>>  #ifdef CONFIG_ADDRESS_MASKING
>>>  
>>> -#define LAM_U57_BITS 6
>>> +#define LAM_TAG_BITS	4
>>> +#define LAM_LS_BIT	57
>>> +#define LAM_MS_BIT	(LAM_LS_BIT + LAM_TAG_BITS - 1) /* 60 */
>>> +#define LAM_UNTAG_MASK	~GENMASK(LAM_MS_BIT, LAM_LS_BIT)
>>>  
>>>  static void enable_lam_func(void *__mm)
>>>  {
>>> @@ -814,7 +817,7 @@ static void enable_lam_func(void *__mm)
>>>  static void mm_enable_lam(struct mm_struct *mm)
>>>  {
>>>  	mm->context.lam_cr3_mask = X86_CR3_LAM_U57;
>>> -	mm->context.untag_mask =  ~GENMASK(62, 57);
>>> +	mm->context.untag_mask = LAM_UNTAG_MASK;
>>>  
>>
>>It's been a bit since I looked at LAM. The untag_mask is used to strip the
>>addresses passed by userspace, right? So this lies to userspace about the
>>tagging behavior of the CPU? Userspace still gets the LAM_U57 behavior, but is
>>told the untag mask is the 4 chcktag bits?
>
>Yes, the intention being that hardware might move from using the 6-bit tag width
>at some point in favor of the 4-bit one. So the user can safely expect the 4-bit
>tags to work.
>
>>If so, then there will be a difference between userspace accesses to a pointer
>>and the kernel's handling of a user pointer (mmap(), gup, etc). I don't know
>>that it is unsafe, but have you thought through the implications? Besides that
>>though it's a weird ABI.
>
>Do you think leaving the untag_mask as it was (bits 62:57) while advertising
>that 4 bits are available would be better? The untag_mask would be more inline
>with what the hardware is doing currently while ABI would promise to long term
>only stick by the 4-bit tags.

One other thing I was thinking we could do already is changing the LAM version
of USER_PTR_MAX (that's for now commented out) so it also takes into account 4
bits instead of 6:

if (cpu_feature_enabled(X86_FEATURE_LAM))
	USER_PTR_MAX = (-1UL >> 3) & PAGE_MASK;

I recall mmap and gup call access_ok() at some point in their operation which
uses USER_PTR_MAX. So that could take care of bits 62 and 61 if anyone tried
setting them against what the ABI specifies.

-- 
Kind regards
Maciej Wieczór-Retman
