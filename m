Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7883921CD;
	Wed, 22 Apr 2026 16:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873922; cv=fail; b=MdcG0Zh3pi2raIgH15SoHH6CXdv35LGT4VHVswp4feKbpKVCKBoUw7+yPUdrz4IsAeJDHa37bYWe5+IVqfcy6QcEZ55iLX3+CMPggPzxuzyRD5rGy2ZWz5nz9RDL9sTqsaLH9l7pdkY6FLe/c2OilXNljJFhAENTO5pc3UhG+Jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873922; c=relaxed/simple;
	bh=7UjZP0HPIkFkFCnp3gdULYGqvIDyz9kAbJQNRzml28k=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SPd13uOY7mp81jSoviLgnFwB5k15d1avKEX8bgT1sSjN/Zi5pM6ZNWjsUJQedLCkxJndQiTIsT1ELZiyTDkIk9TWRQIec24i6SC6YOUhygg6m9tc0xxQy9H+4X+ATABjLKa0d63WFJ464tez0G13r0dQrB8aeHQHqTLCbw2CjhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlUI63lo; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlUI63lo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776873920; x=1808409920;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7UjZP0HPIkFkFCnp3gdULYGqvIDyz9kAbJQNRzml28k=;
  b=RlUI63losVSntDIl78mQDhoPOlEl/BINpLGKaqYXvE6p1d9cyy4bQRhA
   /vL1YYA6RT8ikI7iOu8IuXEhkm+y/9oOOuE5wmNMCnS1LehVPzcpAKCc0
   ZmzUhtcTeX11XCkRd43/1Imdhtdyk94fMXgUtd2TgjsYLuLjRpFhOfep+
   SIuqJaye7on8tPKMAfuwuokf2tv43wIwiqgoCnoNzi/lO16a1G0u7oM/T
   POyVQCFqWqqK8AWWCetAJXSw5Mho2mmFIW9ESt/lHNkzsVII+1+EzXh+j
   RNe7/od4xD1P4AI9Db0JJ+eLP/7c/W+ZTzz/T27/fGW+QilY/JMdL3aOG
   A==;
X-CSE-ConnectionGUID: PcECrA48RPmcb2b2Zs0I5g==
X-CSE-MsgGUID: QsXs/TTsQAa4MAlv3rM1Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77895596"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="77895596"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:05:20 -0700
X-CSE-ConnectionGUID: JADdHX4VR1qkXBx053H+eQ==
X-CSE-MsgGUID: PEIunmJhRDWEgPqb3MYeTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="234179501"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:05:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 09:05:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 09:05:19 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 09:05:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcnJmaA4tYb62ZYMXFNnlEvI/NVzeaDL9PgsUvAai8Dgae+KyMp4UaOkSkE4wBsXx6d2c5Go6jVGqVPpEHGn4vGI7tJ++D8AkTpNnO2ILFqdxYWH2whZ8OxlO/tQTrsudjqDDG3nxY5i3nWSIJLLxsK5iZnF1d533AUasHnid1lO1HDN2Xo/Y6oEjwDtvi2B9so26bZfAfeQpPiYeDGeIupGftVeUpIryb57S9RMBP7kNzsF0OqhnItHSVWCAWfRYOsQEag+z/7t6P6dMWtf9GnTScR2Eq1PoAcmsbM2cnDfMJdVWOXqS3XpwAn5rpl+fibnnFQiw02dp6DxaqGF4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8a19gg4GBOpQ5ESCbmw6gS5IaOSIhaqmMGGSZjkbW/U=;
 b=T/oZrGjwRxsR3KVwz6DLf3LChcwFc82BQES9ZiazeXPyGfwBy42hU2iFbMv4y6isRcr2u8KAQE580PEFu0pSndN8iTA8quP8pUPMYXdZQ2F5xOOzSJIEIO74oU19l5UDzyDaRL/C5uCHDY5git7AUbTpODy4i6WUKqxGYg2n2fLOJBYEfHD/9fYIHSd2pVp1sICFPEvESkVCcNRCshUU+G/edLv/aQpwtR8+2RULsDtIjlZCUhizTTAqsIngShyjipbuehK1c8kUJ3rGN31NSJfd6IhEXwJI+LgIwEps/LiJ0qkEMjGeH5YV+ezYQF5GYyviqxrM89I4jpjy+wgs2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by EAYPR11MB9564.namprd11.prod.outlook.com (2603:10b6:303:2c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 16:05:10 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9846.014; Wed, 22 Apr 2026
 16:05:10 +0000
Message-ID: <20f1d491-51b0-4772-b0e8-c8d5a0c4c123@intel.com>
Date: Wed, 22 Apr 2026 09:05:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] selftests/resctrl: Refactor the initialization of
 IMC's perf_event_attr using linked list
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>, <zengheng4@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260410093352.3988125-1-wuyifan50@huawei.com>
 <20260410093352.3988125-4-wuyifan50@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260410093352.3988125-4-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0335.namprd04.prod.outlook.com
 (2603:10b6:303:8a::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|EAYPR11MB9564:EE_
X-MS-Office365-Filtering-Correlation-Id: b49b81cc-2c6e-431d-17c9-08dea088ee4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: sHtrWBnv5XFN8C2ev84CkMn7G5DxPmAL6x+i5yjaAODwo7PWeEcuwXqRbu9Ic1C7ZT8jE2m8fSwIlLfZpt8mASjfx28CBX1G2Vf9vnACVqOjnyVb6n9O8eo82SUBy5eUV2+NzMv+4xpgS3/QGtZWJJYXVdD8d0lSDPliE2p52QZKAFtXdpFzE2gvkMvQnGkJdcyXjKC32YFGIiwqLtBEUqGdQHVDw3kJdA/ux0exrftOh7rcrCNa7Qa+kjPSak90WvEFkp1PMPUPOTx4BCkD/j8f+TDG+cZJw5OpLj/ryfKOt1s2tCNr9JeUofynB96DH0bTQYG7U7hP3wxiCPgCOnc0wRPkin4wJUXgA00JJLiUDXGjyDC1NnKNtOXFNma31yHu2bw1bV+cWmP9g3LR4aY0TTmk15H1leCV4iaGOIfxWq1XbmZdgpgX2vDRde9XF+46+Vgqf73CYpjBtb38fGSP9AV0KaOH4JgxZK49TPVJ5AaOklQKhSR5uYQxrJKWusDmAano1QFeH5sGWUT9CytLer3UrjlCc8/RafmfeFrvtw2rTBH5XobnEPcfu4C5+MRUhCrBdOzXYX+moqmXr6HLQWSizyhzID2NeE38hO1rc4Z4+UaJ4u+/2cvJqyngM5uhloHk8tNt+Uhr7SHPYIgjfS+fZ10laqofN816sCRuehCbTvL7zlJWpJPdx1F2A9C9dpj236UdZIIzP1KMWvW6sc14+I7sYz41lEK99r6VSOpaY1FuuGKs8+cwamKZOG1wDLUbfZ7/Is+WCj+6OA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkdBekJkbXNHTEFJL1MrdXRzMVNQR05DS1dQeWlodzR5cHFseDFqRDQxVHhZ?=
 =?utf-8?B?KzRXS2Fsb0wra2JrbXV0TDdLV3hIbVU3S1YvbG1xcWJoYjZudHJUT2VORDdJ?=
 =?utf-8?B?b1ZUYkcwcVhBUHJxZDNxNEY5a1NITkwwZXhxb21KUDl5MWZ2djFxaUZIOW9y?=
 =?utf-8?B?RzY0QThmNk1kR0VlY0c2RitqVDhDeTQvcnVoR2E4OE81Z1dLb01pSVhNN2tF?=
 =?utf-8?B?bnVCcGxsQTVxcTVtRG1vNWtYM2RrOUVybXlzc0hlaS81V1c4UWtIWnYwWUJX?=
 =?utf-8?B?ckRFWEFUR1JvZnp3OExsNU1GaXNIbHM3VXpKOVhhNzkyTkdSK0FLUkVLcWU1?=
 =?utf-8?B?K0hxeFczUXNDMUZhZW9Da0xDRWw4VHJLSUg3cXkwbTNXTm1hcHR4ejk1WTcw?=
 =?utf-8?B?TWthM2lVbnNIK1lRSy92WkZEd0FWK1U2TkpNRXpGQVlKd0JUdlRNUHowL2F2?=
 =?utf-8?B?eGZLSTg1WHlTVTdmbXZLdDViZjRJY1ZwOElyTVBkVjdxUXpmRkR5WnExcDJx?=
 =?utf-8?B?S1ZBd3JVYW02U1NDRXBhUDVjL3ptRzA0V1hFUGkrdDBzcU1vZ0JyREdrTzhY?=
 =?utf-8?B?V3FETzBhNmhjaGZsWmUvUVJoNTEzblp2eFpnanlVVUZjdTVFU0JtbXFBcWRn?=
 =?utf-8?B?cjJqbGduZzlkZks1bkNEM1BEZkRUNkhjc0hFSFdTM0pOZUZBVTkydk9sT2VW?=
 =?utf-8?B?cnhVRmVNcXpocHh5RUYvRk83aDRKaFBYZkk1djY5TGZwb0VpSFVlVEVXSTlm?=
 =?utf-8?B?L0t4S09ZdFA3NC9vQTU2bHpCZVdsczVNSWxuS3o1K2ovYnlldGdta2N1bEJh?=
 =?utf-8?B?Q1puU3NZT1BwVUd0dGd1M21jOWVwRHl5M3RpN3p0TFZoRkhYZTBxamU5anlG?=
 =?utf-8?B?UWNHZ2hNbE1kYmRqN3hlTUtNSktkZVdQakpjcXlnS1VWVTZBMnovOTJhcVhT?=
 =?utf-8?B?WS85Ym9Hb21OOXYycFBYRnY0WmFWQm9JRHRGcnpZY3hKdDZUeXNNWmlKU2lR?=
 =?utf-8?B?TnYrWlJWNjM0bEVqTm5GeEwrWUZ4Y2pmNkRCdkE0aWF0NlNzMWFHc0FPU1ph?=
 =?utf-8?B?UU01UVJWd09HZUtwUjhCQXJVbzZ4RkJ1US9KRFRJMTJlcjQ4ajVZdHFMTVM4?=
 =?utf-8?B?T1pWUitENXVYTHZCcy9MbFpqWjdabU1ZQTF1VGFIenRRWmlWTGl0THpXa3Rr?=
 =?utf-8?B?eER2TUdxT3RhdDVweHdGQ0VHcGc5SElqdkYyV0pCdG1VOE9NS0RHOWJGekpv?=
 =?utf-8?B?ODJPbWRmVlBQRlRFSlBqYmxDb3pzMnpYTUs4TEorVCtuSGd4UFBvUE9JQjNU?=
 =?utf-8?B?WmVHUi8yNS9QbWRMQWNVZzBZRDlJZ25yZk9JcFJaRFhxMHpPZDhVTWdYaDVV?=
 =?utf-8?B?TUFNbVRRQnNmb0NTQmp2YWl0OE43OUtQcVJYNVgxZmt1c25UbXZSVC9vUXlr?=
 =?utf-8?B?R1NLTFJzM212clNyKzZyeEthQlM1VXdoeG9zVWF1Kzg1NzQrZlcxTEpUbVRH?=
 =?utf-8?B?SlJ3QS9raHRjcjlFbjlWYk9hYWJLQWU4OGxpTnUyMjRvNWx3Q2RYUTBNdWho?=
 =?utf-8?B?NmNEeHE4c0dtLzFEWXJuUEFiU1lBM3NQbDY3NjNBUEhaNi9hbHp6bWlMU1Zv?=
 =?utf-8?B?S2d5SVVmZGlKeUtadHNNZ2Fudm4vYmVOcDczZFRpckR6MlJWdVZRTFNwYkor?=
 =?utf-8?B?YVNVeGlUWFA5clVWN0VjL01kTGh0UENJY3d3endqVzYxL2YxT0Jub0xFaGJi?=
 =?utf-8?B?dTA3TkgyTnMwcXU5TTZsNVFScnZCV1dwc0hhU1dGbDZUVk5oU2JHQk9ieUMx?=
 =?utf-8?B?T0NvWDRIKzF3VW9uR3ljOGdHTDEvU05BUDg5L0VlL2hoTW1jNHluQlk5N2xE?=
 =?utf-8?B?ZjhWT1g3ZmllR1BQVTRFR1l1V1RUeGthYVlsaEJlQW85ZEhqdE9Cc0J3ZG9o?=
 =?utf-8?B?YkJLVm9lZDR1dVlXSmZsLzY2WmxHS2VBVEhmTjErdTBpMndIM3dSQzg1Y1J2?=
 =?utf-8?B?NzdjWU9wbEhOWEZWc1didGRTMVlxQTBsWDBpQkVhbGgwcFRtaHlwb1JpaXFC?=
 =?utf-8?B?NjZaVGg2Q25rRVBtMXozeTJuRWxWRHlTQVhFSFlqaHNaTHVtWVc0Q1BPY1ZI?=
 =?utf-8?B?OHRvcklsbVdwR2ZzRUkxb29SWEhFWWpRMlBmN3dmdktYSE1JWFVBdk9pVlRG?=
 =?utf-8?B?bXIrZU52Z05yajJGTnM4WWI3TE1LTEtSZGJHY0FEOWxlOUVwUnV6QVRDZFgz?=
 =?utf-8?B?SnNmK2MvVHNmNXQ5NzVjNFZ1RzhwUElwWnVURlVkcDM4WTZkWjQ2QjlzV092?=
 =?utf-8?B?ZVZJa3lVaVZEZllMTmVMeC95VFZvTk52dS9lMnBIVVgvUWoxT2lScjc5d2RZ?=
 =?utf-8?Q?xSgve2DxCeXruNb0=3D?=
X-Exchange-RoutingPolicyChecked: P/H9VzWMJojmv9D9KXks5gbrT6utnIXJQfUMC3ERbFwPbgmAnoWR3kLAN/0iCsSK5nN6ikVffCE1qrpXfJo3fJBjXnPgcQGCLOGtzez8JbRX1MG6k4MXxgQ6/ptdMqbO+GpLcTkEJqp1rGrFoKJcGtuAFb0lnnM5k2JRBDVSy/MfW/VRAjF5P9R6WE/e1aeLYR5EYjl8C6SBkiRSq52tuX2L+kkwZCBiki3WA8ZStqd5cpR7kMpVEAGyJs12fjhTuYvPEBNDuB4YKHLPJfKskRllgOaePK7s+tjAjXSKAJ4Mn0K4N9WNG8hZSS0jV2LDnT2KhaMVhtdoWnZICqJfUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b49b81cc-2c6e-431d-17c9-08dea088ee4d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 16:05:10.8684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0w/+TTr0zXyRFKGjUE/xPCH8aYRYD5VFmqUSn5t+oL4okRHm6DiYa6w9cp3gXb9v49vX2zw3YODQdMOemZErXHk6O4lkaAraMU/Q6XH0eu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB9564
X-OriginatorOrg: intel.com

Hi Yifan,

On 4/10/26 2:33 AM, Yifan Wu wrote:
> @@ -292,15 +290,17 @@ static int num_of_imcs(void)
>  
>  int initialize_read_mem_bw_imc(void)
>  {
> -	int imc;
> +	struct imc_counter_config *imc_counter;
> +	int ret;
>  
> -	imcs = num_of_imcs();
> -	if (imcs <= 0)
> -		return imcs;
> +	ret = num_of_imcs();
> +	if (ret < 0)
> +		return ret;

I see this change from "imcs" to "ret" as a consequence of the semantic change
to num_of_imcs() done in previous patch. Please move this change to be
located with the semantic change that will make that switch easier to understand.

Reinette
