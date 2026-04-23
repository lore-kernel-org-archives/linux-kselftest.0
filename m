Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA8429D275;
	Thu, 23 Apr 2026 08:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776931838; cv=fail; b=D6XIP3wY5UvB9IqmG2EoM/iX8QaaKKqgMtutmixoo56fuE/ZV6y5srji6HJmcuVifHQaRgLBUVW/qXUvXjHOw+SOD1Akfh6M9jSrmyMh5rgx7Rec3JnvQdEPH7Z2OCoXZK+lI5pqKP4VtnGvaEan4/6sJL0PXYBSuhU9v/ryiX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776931838; c=relaxed/simple;
	bh=K4RtPeAj+sjQVoMP/u/AA5b+vGGClAXzSibyxlUQOTA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=msyawabybd1zCQgsGqU2j1RlbUvVWLW+Rs4KclSvDvoMiCmkF+7tqaK5pz/zH/xY04KwsRAe75wVjL8kXh0LMXHJ7NjP7NooJj22ij/oVdINLvyZvfhKbkjwp2M4ViqSmQEbOZYH/nvPx9yzHisvqHiUsYuNdWoZ+RzDIe/vzHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzSyJ1F8; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzSyJ1F8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776931837; x=1808467837;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=K4RtPeAj+sjQVoMP/u/AA5b+vGGClAXzSibyxlUQOTA=;
  b=YzSyJ1F84ZgpLO7uJ6sZFBtd356GK+FFFtogb+Polqw4BrVNv5Ehm2Nn
   t0T1WaF62IAbYsjN27tgt71TuyGex1NntJTX4RQ+DEkJjH6FPeSDJmkot
   dxzAfyMzrRp4zmmIJhhCOuHoHGBW5XADqhDoMYxMmZ87Pi03eI4yKHUgk
   flmVBfoARkvfMjIAPnndfD/4ihX01jM/cywsg4+8CZr1QQe0J14AsPpFJ
   MWsu3HI+dJ2kfkAuT3ULsWLLEBZhOixmrK3huDMLP5Yle60uL/DuF2CKO
   G4wjErxzxOTgwtDN6ih6vWmxcsbfkm1UcjUhYM37r4lkYCqDj28PlQl3y
   g==;
X-CSE-ConnectionGUID: bJQTyHgPQ3657FNAgZhQnQ==
X-CSE-MsgGUID: IbqK+fCdSNmBIqlqtlp3Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77912209"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="77912209"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 01:10:36 -0700
X-CSE-ConnectionGUID: qAbuymfaS3W5+JK3bbNW4g==
X-CSE-MsgGUID: fCboZ7XhTb6VWAVU6InWRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="234380026"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 01:09:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 01:09:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 01:09:53 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.26)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 01:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIYwOi+hOAtj2O4LJO44R8etNBr6dZv6atZ3Tfr9KrIkTBCaj+tLyOuOW1Jqkua80Jyx9AU8kH6MPYkf7wA7rNDmQKRtwQt1D63Fo53gza6YLazR+mtcdXLCnAx9nwwL+KT8s/u99eT2T8QaFBXTxl0eP87vUYJWxl5piDiPPUggcW4epmh5HRGoxL0wKPEUYBhqMYDP3qNTalwdh8y0own3J1+cqH7zF6SN33JJG5vALR2yM4bBrz04iIL96jqvnwx7TbGad0RQWiljuynyKrQqOz3rK5mK+NwJkGCwLxqivA38gTKjaD2K4TY9WRNpGHsFDaDs2DPoNo00mGc7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Lh/ioE0xVUbcobJdiASPt2buwtZUptK5ePC1ksSaDc=;
 b=KRZPLbuUlKonrhnuFDLAT9UjNdADhCWd2Xkok0+wD+0h9WVtuu4D34O/85WC4odsXO7vO0SzSA67+JGiyy+zCwFujV/H47X0kVLhtvNAMIyyzfjPCHAT313nwosvuDU1G9hZJggAAfyZAG0WliNE8aaddEx04d5eMNG2/+HEBXMWwglzRc2x4heeZFBzqmJ57Ddn2bZE8CyV+CkgGfMwZpOigm8axrDLbJvPAbrpuMk3J6F0eYhCZIpFnY6prNtRpPdWpQHHCLBvl+QhOlXFt0jsY3yKAYBt0pRhx7GeaiuyASO0Kc39bFWXXxwG9WUBoLO52/5wVjhgJJkA+JujWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by IA1PR11MB6420.namprd11.prod.outlook.com (2603:10b6:208:3a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 08:09:38 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 08:09:38 +0000
Date: Thu, 23 Apr 2026 10:09:03 +0200
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
Message-ID: <aemzYE5td11cWydN@wieczorr-mobl1.localdomain>
References: <cover.1775813245.git.m.wieczorretman@pm.me>
 <79720f2640839b15f22e3618136b084cb376456b.1775813245.git.m.wieczorretman@pm.me>
 <8bc4ff4b7491c6fea6e17583a6fa249961c08275.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bc4ff4b7491c6fea6e17583a6fa249961c08275.camel@intel.com>
X-ClientProxiedBy: DUZPR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::17) To BYAPR11MB3288.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::33)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|IA1PR11MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd2acc0-5bf9-4846-0db4-08dea10fa8e3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: R/Cc4TFUnlxcGnH8iRbVbblrff9nFzuU/GddepeVKxWL22NXxdSEfYvmbkk1YxPHTlYMfzGXw/exaRkjcS5Ou2VEAPthglfKgFbe6z3LUcqHQmlGX5qnKCItPdMQi66ui9hCaMK3fEYw/h86YsLwHkYeH47Z7KCDV3HvZ2AQmcbnqE0fFUZoIAaJi6PRZ18xuDoTuqs54f2fBRdg+Fagd1Y5iHIPC6ukL40YjGGddQaZD/KvUq11IdYkSKIpVMhrE/3a7UCBOSqY0ztks/GPTugRai7qYeaRxTfOWHu0/MxzcKqOtzIXWani+92zu/lUph+zoHRmq7PnimGEEmWWLSXVJZ6DpQIC6tqmR+Ef+82J0ccQK13ZSKAPSfzBofSfcsZYGRDM6Sd+9RaFBdxIpMx0bfeiJBnLYq9JuNxHv3KCATBfQonbQXzcofXa6p/ZAF6KPixzuI5fLYywd3W6oxlJ3BjWPkEHL3nKfIKERp1U9MgHJbiy11R/mh5b6URARg64V9CU0I4pYya+rtzUoZKAB5A8mMUnOzuaZL/0IgMLppOJibMEdN6WM9Kk5NeIEL/W7HdMgqos6tgPMDSUuSPzWaVn++e9Vqb0uaxaja6EXRf8oJSFqSaULOxktcyc7epYtLsb38RmPgZSEZB9U4yWql4WvAOB/xMHrIIJhgxqgD+7SM8BuKv0V5KM4v5DQTkpzsAueekM+ePk1Kw08rWL7mOTqFYQ3j/mCTEZ6A0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?o3YlnoFVY0BPSEzrxzdy/kQVOWHPUDxMrbJGCUHl/eSHP8MgAiB6/D+k2Z?=
 =?iso-8859-1?Q?J/qz2ECV/fUG3B12QZjBBKFwdzo0jJM/wtTmD9Q9y4HpDun2NaH18HyOz2?=
 =?iso-8859-1?Q?YMACX4PMm+9axFg2XxwNuTMdc33vV+p4XvSgijA9Ysk0S7cJJpEFetMmzc?=
 =?iso-8859-1?Q?hzniR8X0tCGs1xQt5caYH2BZtcdxG2rnO9/ZKC6ZbvXRrMBNwL2Kw77fT2?=
 =?iso-8859-1?Q?jBni2dhyq+yAZQxrPIk0gVYlXm/erWVmNOrGDne+fLtlq0zXrUEKMeGR6R?=
 =?iso-8859-1?Q?yN1majPX3CKzF+cXOxMp0q4zIodKUY+uFmRLPeR1Wyau0TX+pVMdZKEejD?=
 =?iso-8859-1?Q?8aJRbERD+ZXDHFjrrkjoAcSqCoXQrETVZzdVLbbsFk7lf6J4uR0r1naiZ3?=
 =?iso-8859-1?Q?YgzvngC2KQF5hi6g3kLYWIyLoBN/O1EsHX7Kk7WwgXejM/JnQKTnYwtifp?=
 =?iso-8859-1?Q?F//3fegVBSL2GBJWolxKYWVXfs5g1mTpG0YDRwmsVQLZeMEWkONHukvzAu?=
 =?iso-8859-1?Q?2U1m+XDxeuWPHChqVrx1wlD0+qjagTdKmMtPm2MUUgPEg26e/VkjJeRERh?=
 =?iso-8859-1?Q?M2HjhsYSss25AP3iFeA6b/IaoQVPCjQJzRWHm13W1TbRWbG4WuAO7uPi7K?=
 =?iso-8859-1?Q?3g8KCn/ZYLKUEq1+ujijzhkpe5XIT+r2Evjm4Z/qJefW6RAou8uPnG8FGM?=
 =?iso-8859-1?Q?RdmJvEyvA1PZvQ/d0YUPvmqYhb+DIhY4p2A/ciQOBRsyjqcwCTfuovnt2P?=
 =?iso-8859-1?Q?QvkvksupYkpmV/smubQqrqr+HrsJTPFNPPSI73iLjRbnQUyVYGEeMIo8N4?=
 =?iso-8859-1?Q?ogBBYidy/Vh13Rup2VdxxXAc7mThO1jor37KKqdDS6aisHew77s/nCXYhR?=
 =?iso-8859-1?Q?qhHn0na2RYTEBufeToUh0sTGK2j3UPf1rlH4+6DpE+r86bCTWhxtBnZZzU?=
 =?iso-8859-1?Q?WTp5gaZxy5mRFgg8AuAENVCzrUQEHbpydQs/oM5e/ezIg4U+sOYAT/DNKZ?=
 =?iso-8859-1?Q?L+uklmRrm7AJwQGVF6FNTrY9kVCJZypZZNEQLvtDNpsbu9ltCsaDIEF8h/?=
 =?iso-8859-1?Q?f5dR8Wngf8Yl1Y5KwY1MhpUA3EKmPwlNldiyv4M02aIcOxQI98hxOly7hc?=
 =?iso-8859-1?Q?fEwBE/nY3wUyDO/YADbzqXvzSLwVsIAsJyPxETE8eDmZPSbeYimSoAvvj8?=
 =?iso-8859-1?Q?DT6G1g0Ph6+XQN3yX9BNw8lnFpkSoTqq6N+wwe6hoLfSDw6n0H2Q96WfXt?=
 =?iso-8859-1?Q?pzewUj24q5kKWErZd+6kEEDuXMTym2brLQpAjg8Z60vOB92pUIY1BvRKA8?=
 =?iso-8859-1?Q?72nCN14iHXSJqxtSsGIl0sU0RTdM8PjjzG5VEM2nci47AHNmg091Smfr18?=
 =?iso-8859-1?Q?1WKNJ2snkQ2ELoh1C0WMA/MgCUvpt1UrwuThSpA71yIZIwp2zeYP7OEDyr?=
 =?iso-8859-1?Q?AwcB6Tf9wAs7Nl3ZlEjuRkPUgW4rQNse/GXFkhmRxJfzpESYyRDccuykni?=
 =?iso-8859-1?Q?nn5vN4o12e7/vaBSfni3SYcwMy9PXZVEM0mFMzoql+bTx2qq/Y4EhO8cKj?=
 =?iso-8859-1?Q?0k0PwAqIzyoudKQiU9WpgQbPfdB+fgnfDCnXy2rmHv5mBFAFbeWQcwne+4?=
 =?iso-8859-1?Q?YQz9E/g2kZq7Pc8/F4eqB8p+NOpZpDPI3wVJuRrzlInWA+uSO1Y+c6EylD?=
 =?iso-8859-1?Q?P2RcpQ5OlKDUVfeYLn5nTJzxG4LhuI7DzufmSg3EVK7hh27yYIH17nnIEY?=
 =?iso-8859-1?Q?vstpYnKSp/XrxHmK8z0nDaGyfL1lv1+tIJggW/hlsOw9mbNl3YbAasiGRT?=
 =?iso-8859-1?Q?rAtu9ebvNX7WBQx+M9f3FUKqhrozkdfpvreWRZ5yYputTtKTSDOO?=
X-Exchange-RoutingPolicyChecked: OgLHwRSvjjGDIBYYggh11hhKfemuzvP0D2EJRzejOWAweq9q9bBNzncIyWyGHDBbHvgAWqIu8qSgqN9CCf66THtkiF3VPZ3dbHNw7glLllI27uvtg7xfu1THMziW+R76ByBaOd4MKnSZxnbOkNpdhqpO+klzSJ/ucp0J1Q26XVNKKC2u/b+BExCHvnmEY+VMbqSynxZg9AC19LX0TGFsy6vEGRKGiWBPvWsSInYYQcM6/4DiXx0oalr4Pambazhv9cj81G6WqoWdLAVlfHi4zJzq/1/G4d2YRFXz40/QW5B2JcHPAH/5Bf0hYpkx/BcqOIIdDoW/3uvGZumPG6pMnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd2acc0-5bf9-4846-0db4-08dea10fa8e3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3288.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:09:38.1837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /u9ikGaXOtTa681Hcet+uMPPPFSKgSB6i5HO7Q+mHjkhJkGFPUEPe4+75fddU3NdZQ7+iLR5EuoLqwDDYgQ/eF+GQlChiJMR30xCj+Yx98s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6420
X-OriginatorOrg: intel.com

On 2026-04-22 at 18:07:29 +0000, Edgecombe, Rick P wrote:
>On Fri, 2026-04-10 at 09:55 +0000, Maciej Wieczor-Retman wrote:
>>  
>>  #ifdef CONFIG_ADDRESS_MASKING
>>  
>> -#define LAM_U57_BITS 6
>> +#define LAM_TAG_BITS	4
>> +#define LAM_LS_BIT	57
>> +#define LAM_MS_BIT	(LAM_LS_BIT + LAM_TAG_BITS - 1) /* 60 */
>> +#define LAM_UNTAG_MASK	~GENMASK(LAM_MS_BIT, LAM_LS_BIT)
>>  
>>  static void enable_lam_func(void *__mm)
>>  {
>> @@ -814,7 +817,7 @@ static void enable_lam_func(void *__mm)
>>  static void mm_enable_lam(struct mm_struct *mm)
>>  {
>>  	mm->context.lam_cr3_mask = X86_CR3_LAM_U57;
>> -	mm->context.untag_mask =  ~GENMASK(62, 57);
>> +	mm->context.untag_mask = LAM_UNTAG_MASK;
>>  
>
>It's been a bit since I looked at LAM. The untag_mask is used to strip the
>addresses passed by userspace, right? So this lies to userspace about the
>tagging behavior of the CPU? Userspace still gets the LAM_U57 behavior, but is
>told the untag mask is the 4 chcktag bits?

Yes, the intention being that hardware might move from using the 6-bit tag width
at some point in favor of the 4-bit one. So the user can safely expect the 4-bit
tags to work.

>If so, then there will be a difference between userspace accesses to a pointer
>and the kernel's handling of a user pointer (mmap(), gup, etc). I don't know
>that it is unsafe, but have you thought through the implications? Besides that
>though it's a weird ABI.

Do you think leaving the untag_mask as it was (bits 62:57) while advertising
that 4 bits are available would be better? The untag_mask would be more inline
with what the hardware is doing currently while ABI would promise to long term
only stick by the 4-bit tags.

>What is the chktag behavior for bits 61 and 62? Are they ignored or trigger a
>#GP?

In ChkTag? I don't think the full specification is out yet so I'm not sure. In
current LAM they are ignored.

>>  	/*
>>  	 * Even though the process must still be single-threaded at this
>> @@ -850,7 +853,7 @@ static int prctl_enable_tagged_addr(struct mm_struct *mm, unsigned long nr_bits)
>>  		return -EBUSY;
>>  	}
>>  
>> -	if (!nr_bits || nr_bits > LAM_U57_BITS) {
>> +	if (!nr_bits || nr_bits > LAM_TAG_BITS) {
>>  		mmap_write_unlock(mm);
>

-- 
Kind regards
Maciej Wieczór-Retman
