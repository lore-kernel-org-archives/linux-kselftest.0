Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4D328DB56;
	Fri, 30 Jan 2026 00:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769733390; cv=fail; b=tZCrXpEueTO4OVkwT3BcD7iZUBgbh14yUsy2wDaooLYjdLqftxu/toBjNCGzG6pb8eejBCJ058SJ6oxfg/D2YVbfQjUQ00xTGCKhNQoPYBXdg0BYOAAyz3uNENho5t0fcxn+JbV2RaUC1EZN3Sg23OQRCv2mlmfM+rzYL0vtPAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769733390; c=relaxed/simple;
	bh=YfF8ib+g+wLi3ofUEnZDuuPOoqIEW6P5a4kVI6nhvsQ=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=kCW1FmS43tLnfvId4qKkH/afHQNkVnFGjdinPhl7vHfrRvKE9CIfV6u+FdFiwmj9i+j/TzHS8fDUeaewO38ezGjmGYjEUUpMCsg/6QmcLQeyLxcm9vyN7WXyrmj1VyTXAR7BNv4QNggxxWAezccqstxQgJJ5dhgbYvGcr9wpO58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOua+q/1; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOua+q/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769733389; x=1801269389;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=YfF8ib+g+wLi3ofUEnZDuuPOoqIEW6P5a4kVI6nhvsQ=;
  b=VOua+q/1wYZoSEaxJVPi6g36alpsYctCuLnIbl9tSoHCtNS5tOWfaBMV
   TVHG9RBmDPAHqqc3crDU6snR1cw2jkCl+1tpboZEIWKPPdpu2xKKFdAK7
   S/WSZiLVVeN/VCkD1UOXBhobbdBmlA5e4xbgVhwGPyDlSHm/YC4Zmfd+/
   tj6lP1cSiIbkqkgBvsAklArPk6AYeWMenGT6DUfSFzBB4RGrEaYWOppp6
   g7ZKkJC/wWwT0AYwI6ZLrMfolHljnGwQQcNx/4NdLm68KvCz+n9E6budE
   GNRIT48smNGfflmeNP5XVtfPFuJWMT7+/P68C1C7Ohd7HAIwVqZ31NdpE
   w==;
X-CSE-ConnectionGUID: /KZkVwT+T5u5LJCOAJ08MA==
X-CSE-MsgGUID: 0MazPXyLTeS7Slb1rZw8qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88398946"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="88398946"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 16:36:29 -0800
X-CSE-ConnectionGUID: eEUXMhgfTiijX1sOQU2RRg==
X-CSE-MsgGUID: W3CXajaVQZqem+NWaBVv9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="209140764"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 16:36:27 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 16:36:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 16:36:26 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 16:36:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzYGKB22HHPKiubreFNfz9BZoebgMJWv0SYi88KhCNOhPuF9lXDJXnwjzTiepaTXANiCgsOZOobVPl1S+y1B4t8N38m/ed9TukTC+tLU439IvKVIeRnLE98reKllu8srmcksIfH+wcLyqfnvIcEHO/3npE1+BsCUGeS5s9cyKbswOmvp2f982SAzicVfmLm1rF+jMTkshwS5KtdIbabyEZJxkP6UUI8ITy/iUkbPUwWHlRR5T/EONFuROy0BI1NSZtkqYn+RAKb1eGwcNLVS3zy39qMTIXAYUHxe2leIqzq345WvaFu+eMxrEbPbLjqhwOtgd9wOV/hPAal1InzfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/ROgtvS9EPMj8PDS9UmG75reJStBDTjts10jBcQLMY=;
 b=LwSWhRy5uslbmCEaI1CflQ9xIE27bl1U6AD4TH0czHx/FYXpKC0lhjJEn5FkhcGvg7hc8r/5OvPy/wBb2fortJ3vGZEWSxP5ir6014BIXkDd8+HoZXOL55z0RP8L2F+Qv7wcW8Qg0pZdH4qEdJBwR/R+Uq/odi9Ys/nkmRCuuP6UhieLX7vZhklhxJMaISl0maXb5QOTGNuYL62eU0fghWpl+Bx8BJN5DOY69jbKtA0nN310i0tW2d6Bqfn/7dgkpSqla03bWDyYx9IRGJhVT0MJZjcg3X5auQ2AM8v+0q6dhJ0PANd2Dqt+8rK1EObjg8ve/8u7iSrtgdoTYa3qVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 00:36:23 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%6]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 00:36:23 +0000
From: <dan.j.williams@intel.com>
Date: Thu, 29 Jan 2026 16:36:21 -0800
To: Danilo Krummrich <dakr@kernel.org>, <dan.j.williams@intel.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Bartosz Golaszewski
	<bartosz.golaszewski@oss.qualcomm.com>, Johan Hovold <johan@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<shuah@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>
Message-ID: <697bfd05bd47f_1d6f10078@dwillia2-mobl4.notmuch>
In-Reply-To: <DG0ZES9SRSKD.11UBH7B75WNSX@kernel.org>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
 <20260129010822.GA3310904@killaraus>
 <20260129012322.GC2223369@nvidia.com>
 <697ad713ea124_3095100ee@dwillia2-mobl4.notmuch>
 <DG0ZES9SRSKD.11UBH7B75WNSX@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::39) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c144187-de5d-48e3-8813-08de5f979836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18082099003|7142099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUVDQWRRTUYzWDRjc2ZIU00zcThIai9wc2pXQm9URlNRUzRoVlVRNGdIUkVP?=
 =?utf-8?B?U0QxQmtlOGpkbTc1T2ZSR1FYdFBva2g0dG1BNXhhbnEva0c3UEh4aUUzeHdr?=
 =?utf-8?B?UUJwOVdoOXRiRDFwZDd0a1lLUTZRMEtiOEhCTVdGMmhWNCtLV0VEVytveUxY?=
 =?utf-8?B?ZDBZQU1WWGxoUnNnOUlmdG9uZ0c4NkdkZ28rSlVzUStRNUkwT2RMOWhqajNx?=
 =?utf-8?B?cFlON1NQN3BnaDNaNnJkR2QyL2hjemFsUmJaVXpER0JXSUV2MU9LeUoybHNS?=
 =?utf-8?B?MmdvNm5rMFpUMHNMUWE0OXQ5RFVGc2dtSkNyNDdPWEs3dDB2ZFM5STYvVFJz?=
 =?utf-8?B?czkxN21LUURPRFJ1Q0IvaDVWVE5zaHR0STc4cnVHZDlmOEZxVmt2VmVGWDBN?=
 =?utf-8?B?RFZPVU9lcTMwRzJaUjZHaklQMTQ3UHNOTGdvV2hvczFHcVJMeG5IUms2Mjg1?=
 =?utf-8?B?RDRXVTdmSjcwUjFGNlFkOEFKdDNnc3NKbTU0N1huQ3diQXMxV0NvSG1CUnlS?=
 =?utf-8?B?bllYTnhnOXI3eVZxamcydWNsL1k0MUdDSkl1eUtvQU5ZK2NCLzJUNjZveWo3?=
 =?utf-8?B?c1NFQi9iWXh4SVdDY0VZbTh4eXN1SFljSnprMUFkdXNOcUh5VER1cU04QWFR?=
 =?utf-8?B?cGJaeDRweTNkNlBneXZyRlhPdk1yd0RYeVRYaHRxc1IwQnp3b3NaM0RHM1k0?=
 =?utf-8?B?MHQ2TW82YkYyQS9JQnBZOGhMRkt2UUlpcWwzRnc4Y3FEbkR0d3B5U096OFJQ?=
 =?utf-8?B?SGY4M0s3LzJZTVVGVW5Bcnc1YjVpSjVJR0NIN2JFM2dUaUZHVjdQaHN5c1k0?=
 =?utf-8?B?QytyM09xMVArc2FWZFFHQWZUdGQySlBYZE13M1ZNaUVGV2JVTEdNbEtrYnhM?=
 =?utf-8?B?b3Zqd3V3clZOOU9YeE9YWks5aWV1aU9NSnZWc1JxTnduVnNkNm1NN2lZaHdK?=
 =?utf-8?B?bktsQVZqdTA1cnV4YWFmZ3kveS9KMFZNSnM4dFdkbk54cWlFeThkckhGeGFC?=
 =?utf-8?B?OTdWWm80N0Q5Um1UeVBGWUc1OEd3cStZOGhDRWloU0pEb2FYTjN4eml5aFM3?=
 =?utf-8?B?MFg2WVNaZmF2NjdGZmtMMzdyUmUvcHFwcC95UnJueEYzU0NuWk9PTHBlRnZt?=
 =?utf-8?B?N2VyRWQyVTlnaHdVWEdHc2VFVGo0U3AwNTBQU1hJSEZYUkEzdzQveWFGcjlR?=
 =?utf-8?B?aDZPdi9Kd2s5ckcwOFpZZVcwZnBBV0FUbUdCbzhNaUpKeVhETmIwUTJWRHBG?=
 =?utf-8?B?YmVNU2lEMXIzOHlsMkdTamlCc1hlTkpndlZvZFdqb0xnTytqSzFJMDF6dkt2?=
 =?utf-8?B?eTZHSWZsQVFiT0swbHZqUFdlYWhPSlQ4OEhUdHFwN3QxczVkZlNLZkx6VVVV?=
 =?utf-8?B?VVgwZ2JYWlM1QU5ib3NtOVB1NjFGQnhEVksvQ3VoVWhJRkhFNk5ZL282dERM?=
 =?utf-8?B?dk03UmI0bnhGZk5RVFZtbXlaVnZ6aXFUNnQ4QUsySGJRSGpUeE80S0wvSDZQ?=
 =?utf-8?B?b1IvUUQ5SkZiaTFISlcrSENQcG9kK3VRbksyNmova3k4MVBubzJGZHN1dFAz?=
 =?utf-8?B?Z0x5d0xORWFKajIzcGRGTGtObEJqcGQ5T0liSW9oV0Y3dVg4T2NuSG9mWUxG?=
 =?utf-8?B?M1QweFhNaGVGenA1U3ozR0VUNjNraUtSbFRqMG1UNURqNDB5NktMTEVyc3hB?=
 =?utf-8?B?VG5SbFgyUUd6NDM1SUswM0lxS3pmNjdTSUZRZEFVRFFRK253ZmJXSm5aZE9i?=
 =?utf-8?B?U0ZrdXdGYTRNb1V5NFFMUGdGZlNHN28wNnBRU28xZW5kT1FiNHpDVldJVDlj?=
 =?utf-8?B?dEFnVG1HQm1RazBhazlXVzdKQ01FWlFGYnc4Smk0akRoQUtFYnpUUzJMU01h?=
 =?utf-8?B?Zk1rNFFIVjdnRFZKZDVsZHk1WWRGNlhmYVUya0JwVVF0U3N0RGFRUzdTdXBh?=
 =?utf-8?B?Q3RtWlVBK28rT0FNUm04UStjR0ZaUzY0M3Y1aTJ6b1lOd3gzNFpzTjgvSHF3?=
 =?utf-8?B?dUo3NHNhTzM5c3RMaldGYXU5dXVDNU90dVNzOUtlWU0wQVBVdFdMa3pxTEFG?=
 =?utf-8?B?bmZreXVZTXluODlYWXd3QjBMM1d3YjQ2OWJVdVlxaUFQMDUrdFB5K2ZYNXBk?=
 =?utf-8?Q?1GQ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18082099003)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFlZVHU5b0t1aHV0M2tqR3dwSlFFeGU4ejFicklXcWNuWEp2VkpqT2J0Nmh3?=
 =?utf-8?B?NTFqWnJmSFczcEdYZ0ZFdEFPY3BFWEF0UTR5dklJcnhka3VWbjF6MXBoSmsz?=
 =?utf-8?B?cTNiNXZuYzNtWUFnMDhTZEdaUzZaVktPVm9majBsSVBRUTZPclpqY2txekI4?=
 =?utf-8?B?N0ovYnI2ZEtaRFpvZVZKQzFQTWJRcjdaMmloZ0dqYTRRWUxwWDVDVXNmRmZi?=
 =?utf-8?B?YXFoa1BCY3FHWWo0N1ROK1dML01Xc0k4OVg3ckJoMXMveVhYNFlNWXhORnFD?=
 =?utf-8?B?bE9uOHY5TERSZnEzUUN5UEZEb21DU0RQbkM1Ylkrd2dZNkxJWkNlR0F5amxs?=
 =?utf-8?B?REFaWGRhL1U0b0J2NnVUR1FxOEhkTUZySktHSVhYcmpTcUM4WUVaOHRHczhP?=
 =?utf-8?B?RllEY25wR2p6YU5uclB3UklBRC9pWEZ5a3ZHdFlxbXdUWkpMRlQ0UnVDMm5C?=
 =?utf-8?B?VkdVamNjbmZ4OHAvWjJtNnM0aE5BV1hmUjlDUXIrSEFZbU9nUnRReFY0MWZ4?=
 =?utf-8?B?UTAveklibWIxeXNZN0xMa09mbWNUMHM3RHU3dStSYzBwYnBIN0JBUHdzYXU5?=
 =?utf-8?B?Uy9QWWpRdTdzZHJnbldXazcvcSt2NjZocXQxWGRjeklzM1FsWDd3RWZPRnc2?=
 =?utf-8?B?bEd4Qk1QNTZoVkg2TEhKU2VmRjUrVjMramloc3ZMWWI2S3pXcE40MUp2NjEy?=
 =?utf-8?B?ZEVVR013UE9Ed04vd1J4SzNGYnpRQUJXdHovMmZZaTRIM2hDdzZ6bmgzSzAx?=
 =?utf-8?B?SEY4a2FBWUd4K2EraVRxQ3FuQ051UllTWEllQ0NMOGxxWlROdDZxZm5Wa3F4?=
 =?utf-8?B?VDBkUUxuWWcwdzVuMkFpM1NuVEJiSWVJQnJ3NlgyL0RrR2hSUU1nTnlZSDJu?=
 =?utf-8?B?K3NzK3BBOE8rV2lYcmc4eWFKcVBnQVdHWWFYTk10WmNtdW9BeFNRVlZQc2tT?=
 =?utf-8?B?TTZXNXRWSk9PeHpOa1QxUmNUaFVaSEFoWGdlTG9IYjJwWWlXMms4dGVZUldF?=
 =?utf-8?B?Z21IRzQ5N2VUeDMyeXlKWUd0SDc5WjRNbGNSZTlBaGNjR0dmekhRWWRFbFhO?=
 =?utf-8?B?UU91VDlGcTh5WjlVV2pqTm1yWlI3TlNYd0tmQ1BkT0IyNktYUDJudFg4VUp6?=
 =?utf-8?B?NFdZenNiLzlxbnIxZnZtMVo1OC9nT1FFU3FxeUo4SlVIWDI0UHV1TEE5ekVr?=
 =?utf-8?B?WWVsV2FDQnlTbTBHKy9hNGxNQ1FSeDJFOUs4Y0RCTldOTXhLVlkxcDRnRTRT?=
 =?utf-8?B?Z1ZpMkFRQTBheFcrQmtEN2RBcDZCZ1QyVnVzdXpRMVRmY0pKN1IvbWwwTFZW?=
 =?utf-8?B?aVlseEowZzJuNEVCdTJ1UGF6cWZIVmR3a1BuaXlGNjJpbS9OWktLdG9kMm1j?=
 =?utf-8?B?RjI3YmJLb0ViMDJRUkdTalZ3Z3dLS2xqcEY4R3FyZ0o2N1gyV2lwTkJtdm5X?=
 =?utf-8?B?K2ZxWGhYU1hRTTgwdFFCay8xV1BSOFFZc0w2MTh1NUFRQVR1S3JCMUlsdlpH?=
 =?utf-8?B?K3hhOWorSk9veFR0bXhKWi9IZTk0ZlQ4K1pqd3dkNElicmZKaTc3bllXc3FB?=
 =?utf-8?B?alBUNnVFZVV5N1dRMzQzWGNTV2g5VHcwazJSY3BRWkNNWWdYVkFGODcrOUhu?=
 =?utf-8?B?aHFJMWZnVCtmb3Y5TjlHVEg3Qjh0MWFvOU82Q3RqSVFXbkxtMVd4QzRKVGJn?=
 =?utf-8?B?ck1ZZXhxU3RPZVZKeloyWExvTkJSa1NzVlpydUFNSU9RSzJING5IRDZ5U054?=
 =?utf-8?B?clNZcDFlY05zR1YwNDJ3U0x2MVppbTR4WlBXR1A4emhFbG9JY0N4eDl1QXBt?=
 =?utf-8?B?NEFMdTFyWkpmVWl4QmRCZGMxT0d2RExCUVUvUFlmS3N6VlFhYjVaSDR1VXdF?=
 =?utf-8?B?bkI3K1dzVk4vbFF3OVRxdDZmWlppNEVkdzRTSDlXaHR2aEdlUFhpWU90NUlW?=
 =?utf-8?B?SkJCOTZicWliOEpxSkt4YXZWTk9HcDNxaG9UbTh3T1ZZTS9JTmpxdmZQSGVx?=
 =?utf-8?B?akR3NEhobU1URnlPTE9SVmo2b2FPN0hFQ2pjVk1IRHZMa1hVTythTTB5YWtQ?=
 =?utf-8?B?bHRQOG83cytTQ0ZwdGZCbGxVK0tRaW8rbjNoNDRVd3ZUQlloZ0VLZlYrbjcw?=
 =?utf-8?B?ZmF5UjBJQ0ZyRTllZXJkK0hpb0lPbnl4WEJRbUVJOHZrckx3QVNYbXRFSVgz?=
 =?utf-8?B?dWpwVnQ2VFlUTFMwRHB6MnZMQlRrVmRPZXYxL3hXUzhpaVFWYURDMkpjUDM5?=
 =?utf-8?B?ejJyMjIxN3pkS0JUVmp6bVpLZ1Q4L0U1QTRsWnhKTDZRaGVzOEpkK2YrU0Jm?=
 =?utf-8?B?TDIwTC92OWdJL0ZDWURWbGVyUDhUSTNVNzhpS2pJQjdNRUVXam9yYlF6MzJ0?=
 =?utf-8?Q?b3v2C7kuPVKyoU8Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c144187-de5d-48e3-8813-08de5f979836
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 00:36:23.3661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fto0SlrysJff5s3zgm4tCBF15wRdC6bUc71LW9w50RsMvq4DLwJKgCBfW/PtaimdhabyiHU3if86Z/WIlDoQVaF5kBSV6y3eZydciLeSoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
X-OriginatorOrg: intel.com

Danilo Krummrich wrote:
> On Thu Jan 29, 2026 at 4:42 AM CET, dan.j.williams wrote:
> > Jason Gunthorpe wrote:
> >> On Thu, Jan 29, 2026 at 03:08:22AM +0200, Laurent Pinchart wrote:
> >> > > The latter already have robust schemes to help the driver shutdown and
> >> > > end the concurrent operations. ie cancel_work_sync(),
> >> > > del_timer_sync(), free_irq(), and *notifier_unregister().
> >> > 
> >> > One a side note, devm_request_irq() is another of the devm_* helpers
> >> > that cause race conditions, as interrupt handlers can run right after
> >> > .remove() returns, which drivers will most likely not handle correctly.
> >> 
> >> Yes! You *cannot* intermix devm and non-devm approaches without
> >> creating very subtle bugs exactly like this. If your subsystem does
> >> not provide a "devm register" helper its drivers shouldn't use devm.
> >
> > I wonder if we should have a proactive debug mode that checks for
> > idiomatic devres usage and flags:
> >
> > - registering devres actions while the driver is detached
> 
> In Rust we already enforce this through the type system, i.e. we even fail to
> compile the code when this is violated. (I.e. for all scopes that guarantee that
> a device is bound (and will remain throughout) we give out a &Device<Bound>,
> which serves as a cookie.)
> 
> In C I don't really see how that would be possible without additional locking,
> as the only thing we could check is dev->driver, which obviously is racy.
> 
> > - registering devres actions for a device with a driver that has a
> >   .remove() method
> 
> This is perfectly valid, drivers might still be performing teardown operations
> on the device (if it did not get hot unplugged).

Yes, this one is a soft warning. It is perfectly valid, but the first
thing I look for in a device that uses devm in ->probe() and also has a
->remove() method is dependencies of the devm object on the ->remove()
managed object. That case is potentially mitigated if all resources are
devm acquired and no ->remove() is needed.

> > - passing a devres allocation to a kobject API
> 
> Well, this is an ownership violation. Technically, devres owns this allocation
> and devres releases the allocation when the device is unbound. Which makes this
> allocation only ever valid to access from a scope that is guaranteed that the
> device is (and remains) bound.

To be clear I am talking about:

dev2 = devm_kzalloc(dev1...)
init(dev2)
device_register(dev2)

...where it must be valid past unbind of dev1.

> > - invoking devres release actions from a kobject release API
> 
> This is similar to "registering devres actions while the driver is detached" and
> falls into the boarder problem class of "messing with devres objects outside of
> a Device<Bound> scope".
> 
> Again, I think in C we can't properly protect against this. While we could also
> give out a "Device<Bound>" token for scopes where we can guarantee that the
> device is actually bound to a driver in C, we can't control the lifetime of the
> token as we can in Rust, which makes it pointless.

This is why Rust remains on my, learn when I have time, pile. The goal
would not be to "properly protect", but "sufficiently warn" the
unsuspecting. If anything is going to get me to convert a subsystem to
Rust it is to get help from the compiler for the review burden of the
above abuses.

> So, the best thing we can probably do is document that "This must only be called
> from a scope that guarantees that the device remains bound throughout." for all
> the devres accessors.

Agree.

> There may be one thing that comes to my mind that we could do though. While we
> can't catch those at compile time, we might be able to catch those on runtime.
> 
> For instance, we could "abuse" lockdep and register a fake lock for a
> Device<Bound> scope and put a lockdep assert into all the devres accessors.
> 
> However, fixing up all the violations that come up when introducing this sounds
> like a huge pain. :)

Right, and as you said there are many valid uses that are not typically
recommended that would make the warning not useful.
