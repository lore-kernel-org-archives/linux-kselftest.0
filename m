Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60EB3FD159;
	Mon, 11 May 2026 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508914; cv=fail; b=CEhu9KCCBs7wnuplBj0oA7Eboj19/qBiMmIiCeMO7G7JCWGXS7SGcZRKI54yIGqHbC6gWK7KIpNqcfJ2b1E6s3YFmG8/szsiBcUwcWqKZCCe74tAZtscZ7AfObWFizsPaZcyBJcS5jPtoa5cFXt0Nrg0FlZbevKIaBK00No672U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508914; c=relaxed/simple;
	bh=/LHNfoApm1OCx28TxUx5lDSdjsSy3Dc5yTQACoWYKxg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZNfuW2dY+7ASQosPIxmdiwWdP6iHlsiaQLMdWnPEFUPHUkrcurfZbj9fXxEFyqqnIfYP/xea9YZu4nzsmto+JZDsBfwsRsGqJlWnbOSdTwtbO3lA4k9ZUTHUKHCJPvI8NfK7YizMoEWnCTnCYLN5MEAJMoQf+66ZcpjtNfHfaJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/3nW8Yd; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/3nW8Yd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778508912; x=1810044912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/LHNfoApm1OCx28TxUx5lDSdjsSy3Dc5yTQACoWYKxg=;
  b=K/3nW8Yd5TKxVkpDvbAQo0DbV/fc7fbrBE0ffORGslMuEdLS4sEBZhb4
   bx9M5ofXeDv8CsomwJfc8wl0NZyVQ4P7SL8QnvUAVLKKGL6BPSb99n5y3
   NGbgRJKS9riirC4r2Alb+BAvWvUcjCFu0MsKrkvmtrRT/9dHSkKrk82Ch
   1n3Rw1f97LwIMB7XgqPBeZE/xd7ZOEwXBu04B+Nq9isOMUYXBER3H6zkM
   11COZN6Sgf/bIuFGuqZtyuXlvtNbkHAEx6soNgdWmMFveYmh4c7zP8zrA
   Y/qYinkAcwdusWfIFToQ39GLci2dMqlAJ3pP5SuCSwrylFMtROjRys39O
   w==;
X-CSE-ConnectionGUID: S1j5Yx1MTYqTdS1Kr/3B5A==
X-CSE-MsgGUID: f4/6Q7QARwuj7/WYK0XwMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79499902"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79499902"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:15:12 -0700
X-CSE-ConnectionGUID: uWw5jymYRkqYPE+zs8oGmQ==
X-CSE-MsgGUID: jrBeGaqVQGut69X6/AEoWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="233144986"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:15:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 07:15:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 07:15:11 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 07:15:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUxJxF+/qJdmO6lnAZallP2AdBPD1s0m/qnfcvzsOL0l/8qJbb2QcAY9Xb4w5ZCsM/DkV0io24/xvL1SORsGhVBOThJXSmDOjgTqgD3mrJy4Bwsi0EzR/oVopMKh+ee0LxL50vRFr8c//+Zu9muw7UUSiOhHLnFI7bUrkFUIaCElHpW26+9OJO+DbHtr++eQlcH0gp3z3NSeGtzr7DT2GvFvvdsg+D7RfZ+4Kd292UmEu8aLiiS/ibtGRa4tn6+ixVZjze5s4PGueHzVfzx8EBMpCBGH+xXMFxro6o/nh3Cy5NYNn9mNYaZwwjqD261mD5BBZkfBB8ze10EHldBX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lj6jH/kRoVvkgD6DaCNsE0cNhMc+VTPqNPvdakyEZSE=;
 b=Ip7JVouB5LLAToWjO8zKknBa8fkD7+bafo9u7nsQZ8LSNyILTNUmuPD/QkYvx1WF49lye2svVE+VyIUa1oKbedJqBqZ8VaD3vtnsw9Y50HFkIuguQpM1hHewmEzo30aWQbAh7HVUMjFfBQ56BnEFcZppcYKC2cOb0UNh8Wv9hkYOWcBLhM1egWvQP2Ure+3xoEgKBRMsZoqjxbbbNASwep2054Qh3w0KJUDqB6T6Nw10XkESKpDb/xFog8CQkSFFVybHCYQkWcGBYHzY076XbKSZWa99S9T3JvtfRJwwWg/n6pbs948N/ZygyVYxPpbASzUfKAspeQPRSQ7XzClUww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by IA3PR11MB9064.namprd11.prod.outlook.com (2603:10b6:208:57f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 14:15:08 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9891.019; Mon, 11 May 2026
 14:15:07 +0000
Date: Mon, 11 May 2026 22:15:00 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
	<linux-kselftest@vger.kernel.org>, <oliver.sang@intel.com>
Subject: [linus:master] [selftests]  465b05bae5:
 kernel-selftests.landlock.audit_test.audit.tsync_override_log_subdomains_off.fail
Message-ID: <202605111649.a8b30a62-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::17) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|IA3PR11MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 50373244-1233-4265-8017-08deaf67b45b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|3023799003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: Pp4GRy58t3RWRnKCSiHG2VLbssmCRGccCYYGhh4kkQzCdHoCHXrDrvRRWGTWKKi1lDDmFwJIAFzeWMvyCT4uTUK9xfYQvBIaBXYLFNTJPb9CvVN7WWrLqlzgH/JDovnCnyQMXz+aT8G567IQu141H5jgF9bBw8VAntEERujuUaTYsOp+S0nJ8uPAcwydEYv1yL51mTpdeTJqvKNOC1iCB+xSKPQq17cw1RvVk1xSZvlZ8fVagqTBiXdO5sxci0uc7KV5Wqj7U1jG/s68HrjFCi3iANPb2t/xDK9oMo4amX9sZuQLZdPueZFvH11qygqC5E6USbAeVurF5+H5r592YOSS0HReRodmHYzs//y5oFdkVNDpqwtIorsI/cYPHhZwzmCcOmhXnpW0uTrQm936Ue+IWqKKCaDbaLusaOVLmwu1rE8xzQpUAqZWR63klfP3Nr6ojNTy9U5HGSFDUyD8HTm2V+/JwWLDkXyG1kZiqxpEHsKnWmzGaJfu6XBKTUXXMHZRsx3E3CmAc6dZIj2IGobnyttvfb7o5ERfSetYcI17kI0hDd8gVgTwqpvgRa9B5+Qc8o/AoXIP4eeGFISwTr2BKiUuFANMjH5P39eO/k1Gnh9VptyVVeznVsNe7PGOJ6DA0+IZtyz3A4gC7VZ/jA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(3023799003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ghrnwp8hTFDcoh/1SCEFgRT/vBgE+sjC1mAojCmloa+eELMgI2sWr/FCMZJ7?=
 =?us-ascii?Q?Emp70keZFLZqDzQ9qlVyXCdQP03FmP7ygVmzoKBoyxx5uDZ+iZjJZOdQnptL?=
 =?us-ascii?Q?jvftwUet0qlhOo6xb2eURlUfL8MlDE+ZRfZkUBc/ROQlHo1p+hmX61cNBdko?=
 =?us-ascii?Q?88uRXaUNj7svCO+dFk2CvfzexFjuoopnTc2LVFhP+6i4sZUNbNzC1kRTMurO?=
 =?us-ascii?Q?/TwIITeD2tedNos00YmqiBefD6kRIYqlgRRNhHJndyt1vFh34c7gB3smD1dV?=
 =?us-ascii?Q?pKZbeV3XbgsNCwvOWUqCiRSU2/Olj/Q3plDMQiynrp4L7Sl5kOI8ay61u+Q+?=
 =?us-ascii?Q?1iVsvzB/sC6XZz9MeQRHlNdJbzGiTE2HxJn/OZyQlxiSI1tLgeMpzx8WFRYo?=
 =?us-ascii?Q?k1ODeXv1FnAb6hRwaPvYoFQ8Y6lgv6jIGUSzggt8N5cDKbSwGHlcHZuZNZ+Y?=
 =?us-ascii?Q?UeXjDonFNRZHLXwKU5Sf1Vaq0Ucm2epzHeequAH2PpqhAofjOpYxvmmIlrw9?=
 =?us-ascii?Q?SRpusJiaCbxSH0gXMLeSD5QPBJCrsFGBSyUePObrbJF34GMZoZ5Bvdr4dKyb?=
 =?us-ascii?Q?wj5lDM4yL+Yg2wWKXEg03+4VhG54a75Oxs0X9F5Ho92CbGWyXlejSX7PDkae?=
 =?us-ascii?Q?FCFcYYzEGFEE1ChsP7RkPb5OySxe3vat2GZAyN0JN/gfb8LsRlF076sLltt4?=
 =?us-ascii?Q?f9j3eeWbXGw3gAnn2XlPQsT0GLwnzZ5d6xg/zTPgTqEnIvGnXB8J+/9zs82y?=
 =?us-ascii?Q?5yVgxk4Nu2uAHg8+vqvN1od6a6RX9w91fNlPSj71j3XWOjUII6VXYP+FmI9K?=
 =?us-ascii?Q?REyiyFdcKwNSLyW75OR09klJj6lAQ8GGvTo26DAtEPoDNpTMTqxID7OnFg+i?=
 =?us-ascii?Q?NqqIMqptc7c5+VYr+ZCQ6o78wOxOPUVYyCe562BsbdgBvvZhJO8P1Um+MWuW?=
 =?us-ascii?Q?C6Ms3LQGpotXyirlgnkbYax6hlWiB5OHI0tW0oNT/bEi2ejHGJa6Wg54aJmS?=
 =?us-ascii?Q?EMIcDWflunWhINj7ZAUdgTgnGVPi5IgsELLDNlW1f7zv2CzSkZtIIKv5/N3+?=
 =?us-ascii?Q?WNVTF8yoecwSGFIYAWOCtAl/kBZZ+d7ka58uhyYRilWKbOMXYnOJD0o2OqF+?=
 =?us-ascii?Q?jXWbGot4rtF/ktYPBGsL+RZWXbKpes7Phzmt+SZ0LK0pH7SmJmT5F1+NC8Lj?=
 =?us-ascii?Q?vXx79FcJu0niMDXGuef/8xnWesayXPSyYqEZUeq0+Z1p3bBRTvSEA1v5seiI?=
 =?us-ascii?Q?p4EQxca73IgRFUInE0cFl4Sa0PwXxl1YO075B0L+0zrkg9N5hXe3jjTrbw2C?=
 =?us-ascii?Q?ysB7OLbVszuZ2sJ8QnvG5Uq/tkamvNdjC3IBa1pwsg9KbjAyQfaH7cje4EEb?=
 =?us-ascii?Q?cPg0g31ze2uaPzzDtDbMrNzz5ELBQ8lVYYqFkvTxUwvqzaMpvy9afyXNXXu1?=
 =?us-ascii?Q?R9qBdkxuHQ/NpywGC+FwRiRPaLKzAoK12QzaqdA9HKWnyh1DFJTwbxXjHlMc?=
 =?us-ascii?Q?72lYuJqNeaJvL9OENWQ1yGyvbzwe8kd+YpdcXPzSVH7Tn/Va13480fPA2yvd?=
 =?us-ascii?Q?Vch8lMQ1T/8IOaK+yw8MAnlUrEgMHhuGuRs4P6g/7Rq0a0uzAMsVweIfm+Ob?=
 =?us-ascii?Q?HpDMi08/7MVrpO+C+jrISagVy5mYDLLxCm0ypLeq0wu7/qciyJ0swGRlbjAt?=
 =?us-ascii?Q?7ADpHyF9viP3LSr2EOUouJmZRJPdwFSd49am7nAEN8VhEJLrBiVTWeUnFiWd?=
 =?us-ascii?Q?tjDl/mSkzg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Z/wOOGxtpP1GaGIKCTBaiDnFd2xqUVIIZKCaFNDWzhOhKWFn8WP8wKkOlJ5Saojgh5C7sbCiflO1hH/FdIDCfH2LVn2n/k0q+usAxdjhc401zZkPQzdFp1EiVM1B/2/Tu0AkDR/1i/bFyM7rFS4BbaVXlxB/x+LEbxalP8DVE2oCO4MqgAJvkgVO5FlvKEX4ndbdoJWj5G9UZnLZ/eZy9Y0Y/nnB9U4BLfR3Zb64wN+Nlz34OcyPEvgr/GCEiSQ7jgbtNY63q40nG3AzINAOh2INJvOzpQmS07HdQabYI9rVZDm38azoQl40Ya1EKCqDrDaWkzeNgH9C5W2k8TGwdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 50373244-1233-4265-8017-08deaf67b45b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:15:07.7843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Mqdz3n0WhVEBT4ubo5kC34j47cZmkW5hqi9yDXW4beEKqeG3a4yJdpcVY2k7c4t9PJ5l/iGSmFnnzUsBepvag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9064
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel-selftests.landlock.audit_test.audit.tsync_override_log_subdomains_off.fail" on:

commit: 465b05bae5ac553c13315681c1490dc565337771 ("selftests: harness: Restore order of test functions")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


in testcase: kernel-selftests
version: kernel-selftests-x86_64-9f2693489ef8-1_20260201
with following parameters:

	group: landlock



config: x86_64-rhel-9.4-kselftests
compiler: gcc-14
test machine: 16 threads Intel(R) Core(TM) i7-13620H (Raptor Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202605111649.a8b30a62-lkp@intel.com


# #  RUN           audit.tsync_override_log_subdomains_off ...
# # audit_test.c:591:tsync_override_log_subdomains_off:Expected 0 (0) == matches_log_signal(_metadata, self->audit_fd, child_data.parent_pid, NULL) (-11)
# # tsync_override_log_subdomains_off: Test failed
# #          FAIL  audit.tsync_override_log_subdomains_off
# not ok 5 audit.tsync_override_log_subdomains_off



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260511/202605111649.a8b30a62-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

