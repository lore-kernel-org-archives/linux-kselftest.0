Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9EE4BD79E
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 14:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605489; cv=fail; b=YcERCjn3Tmi4b885h38R1dCbFq4cyn6I74a9jDWy2x5M1fOcFqapJzaG/MVXQ+0KxKBcwsIE5+MGMm93EAOiTaqSSiq11nfkuuoX2zWJYAtkcIHLoWUIZ2AHWxvPRTybM2NhChMLaxDpEPkzR09xFBbdRbbF5XEgagd/1cOTKcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605489; c=relaxed/simple;
	bh=sw8gNZ4ctbtgBhTfeszBJmZhEwKcdSCrfrVNaGBALoY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uObbNjZdoDVa/eKFibR1SuJCwDzd9cPBAmyegbcyTqaq/VSsMr4hJ9PXCKItqFCikRRJcx+9C4QS7FXqU/pUelgIlZ3eoiYMsfENmYb8ZrCCTls6+3ZfdMIITRmKL9OsGIefF6FIJkL1AAPQgX7hbQ+79TCqXJM8o++yGSakdow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDjCKuWK; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDjCKuWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790605488; x=1822141488;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sw8gNZ4ctbtgBhTfeszBJmZhEwKcdSCrfrVNaGBALoY=;
  b=SDjCKuWKa5k57XreahR8ep3o1IYdzQlZ1X3DNEgHBl6qhTs9D+PpKUNS
   R0IO8vyfz/nqwa8u4p2BIYcavM4Bc27OhoO+gCl3fHIfRkqRhC/ixlibO
   v9BJSntp4OBPHUxhHqUUF05xD5tt9t9vjmlA7/wPSDqi57iwTez3QbGZt
   1qytv0cN66MoavKIXKjaoayCn2kQg8G/fXHlp1ryV8zWCBD0z9Y3i0d3R
   B3apeJ/cGxcO+LVbXJIF6g3IatXrXDXX+G7J7e3TFslCL43mjoaV5BQF9
   8gze2yfyQDt3rYuRtzdIX97+KXw38hTfYbjds5suNuZaCPOKS67Ips9BK
   Q==;
X-CSE-ConnectionGUID: CxQ1snDKSqGcuQEky/pweg==
X-CSE-MsgGUID: 6b/gj8YbT0WCJbTWfXoFkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101964170"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="101964170"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 07:24:47 -0700
X-CSE-ConnectionGUID: 84pyM31CSrah8bGUwDGbug==
X-CSE-MsgGUID: l2XbhpK+QUmyRu5q4RmAWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="304577172"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 07:24:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 07:24:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 07:24:46 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 07:24:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDQpry50CziMUC9edf4eyDzAALB04VjjjdmxsAhDBRDEV6pE+PqdD2SIbJFbDUC32sf+3ogSWAkaBFTwm8mJQVSx1mq0RgKB+Hy+jgtiw91qGiWSYB+Yu1jLThNiNzRpiUNaZpmHl5r+251tnEaxlns1zFW0yrmidiSW3LneJZRxPyZslN6zjsI5CwYHzjajf5MfQEejkPw3lXItpPqK6gmWhpawXkYS9bpm8XUaOdvVs8GbHADeUKE+YGUKSlKbSrNWOvec1SbbqZ8BEJL3n+C6JwdlZIH+hiJIW1qy+t31EE8w6q4EMDXjg3I/GZE4cC+y9KbSjGYQlzxi/WQTbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVe+ZnzdL4wnzEdUgnjwFFJ7XF/JsgPcsT5lhS95qu4=;
 b=RM25Dxr9vn/Yf0MXUxE8gSWqei0m61dwAPvISJyqzwNiyCl28qE7mgUQWDnbnFHGB1f/dZELjh7lwyboSF2f0jcJLBlVUEGUQSkVA6t5XLD7viaueXGzI/QXWi71BdgDr2wuZqPnDeH9+xsE+4yPd8r6zLWwxlAaYTQxbRSZe2ALFNi05dyI5rJRmKc/siGWHhcz5Nk5M1fpNV/ryXOheJhAyxthgkC/gGR7FSQt6hmmSnTFF+a98ZFF3qoqy3iZzUkstQduJ9desLCBXydQqpRTQmXv4Mmp9C7t7NkYTCP3v4J3f8u86U5Qz0pjsF0iA/07Bi83GsSqtBX0JXdr0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA1PR11MB9851.namprd11.prod.outlook.com (2603:10b6:806:4d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:24:45 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:24:44 +0000
Message-ID: <95da4ff9-a5fa-4f1c-a2c7-0b19b736b901@intel.com>
Date: Mon, 28 Sep 2026 07:24:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: resctrl selftest patches ready for kselftest "next"
To: Shuah Khan <skhan@linuxfoundation.org>
CC: Shuah Khan <shuah@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK"
	<linux-kselftest@vger.kernel.org>
References: <92c35a79-1c8c-4543-8fa0-0ab78b05faae@intel.com>
 <CAKRRn-d+72is6hNnyTvxUWg0mRWm_BDBcqHZY0+ahdzoNJV=bA@mail.gmail.com>
 <78508c04-c9f9-403e-b13f-220a3d74e956@linuxfoundation.org>
 <3aeee5ab-8a58-4702-90e5-0e69171a5e1e@intel.com>
 <f70a489d-85ba-4b95-9bbb-42d4a37eaff5@linuxfoundation.org>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <f70a489d-85ba-4b95-9bbb-42d4a37eaff5@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0308.namprd04.prod.outlook.com
 (2603:10b6:303:82::13) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA1PR11MB9851:EE_
X-MS-Office365-Filtering-Correlation-Id: ee453d3e-0a1c-448d-a1f0-08df1d6c3dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|13003099007|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qM5zrlbUm0tJWTqy16EJBvT/KNeZ3XmLZhaPZrJCZMIOquEwp8a8LtQCDhCpLJ01+6PP27Cv5UlAFLwE3Tj00Buxe+tGFqxG0lvhRLzc9670HH3Ov2Du+OxsdFRxfdcrwCqXzwckqf0mZvMt+ImThGxirwM6BUrsN/Lu3FiqdnLAfS6SeJu9dsndcdMFeOI8bcMmV7uFU8QYKPR/DVVY56NJT6PyL7Bd57jjV5EK3XRLYX9BUqaJ4LEWDTGgYeVbslSN3edL8ul5iopAaTb8Iq4pqUSQ1/edYbeMtI7HTPDnaxhRDRSMKzA1BgqsFN0dKQ7Y/6zJ3ckaHPsoDLwSEU0CuowgEXMuqs16cCWbzlJumpMhjNko+PJxgIN2dkDHU4w6pSevqW6mOOEFvpup2eZAJuU4Y9XXV6RYPmbExwmsWNlzjGoxQ068Ki7C/6nLLM2xbdq9hAbPMNS/SwTxQrp90dIgguihmaSICOtW6+5zdzl8Iywu/jA8N8uezHsYO+AqXEx1JsyQcLXioIvlugyK3nBj0s+jRrl+JgJjIVusma/Rk8R/tBJO+JPFWNJy96H+lUKfoqmZmP0TP3/eOKyvW9jjy7zuYFo4qPQg5jzFbYhgzfzzeD2cq6DyWyIk9LRukRCc2weHP4+5ELo39paxWEQttmV5rE/8tgiYYsM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(13003099007)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3hUelBoa2ZNMjUzQWM2aHBxbnB3WlpvaDJvRlpxVlluRzJaZGVoWm51TUpn?=
 =?utf-8?B?MERwQjdGWWYvQ0tCem0wNTZPTUk4WXJJQjNDd0VLVTFEOUhBcmZKWWUxSmhP?=
 =?utf-8?B?Mng1VWZoYnV4Snl2QjBTcENWRGxLMVYvS2U2VnFaUTdXL3plVVRmY3dmb1Zh?=
 =?utf-8?B?Y1QyelQ4aHRwanRlaXRZbVQ4MUJsbDlJSFdPMVpQazlVTFlOVnloVkdPWjBX?=
 =?utf-8?B?Z3pCOG51dTc0aVlKV0hrMVd1QVZkcnQzYXNBUEpWckw3Z0RtcHA5Ry9iWjhR?=
 =?utf-8?B?bU5zK3R6elNnd0g5alQ2dmlpM1pka1ExU2UxdXNNVENJOWFUakR6L09WcGdV?=
 =?utf-8?B?ZjJyWDkzZlBzdnhMMTV3ZTdnY3FPbHV4VDVDa2tjcWVCWHhId053MlBxOG02?=
 =?utf-8?B?TWtwVHlPaUFjbTRXRHRJWWFtcXhoN3d2R2JIUXhHeDcvcGZnRnAwQ2FVMWdu?=
 =?utf-8?B?UCtyV00zaS81cUw5R01UdGovSTA5czMyOUlXTDA3ekVjbDljRDVxVGFLcTJr?=
 =?utf-8?B?UHduWlZvM2FPOUNVWGdMdW04cGMrV2dWWkU2VWhZdmk3WUZNa1Q4WGYvaU44?=
 =?utf-8?B?RTlUdXAreStOUXJGZExCUDgwYkZudWNsWVY4dnplZnRFZXg3WGJwY0dBeSty?=
 =?utf-8?B?SkhVN3IzdS9mSk9zTEVoUUxqb254SW5xYm5CS2E3S25CTlhFTitnV1dKWi9F?=
 =?utf-8?B?dzJCejBOWEh1Yy9SQnZOSFpDcm5GbkpBUlpMbnpBWjBIUzNqZGdUalE1Y0l0?=
 =?utf-8?B?eW5JYjB3T3VBZ3gyVDBnSlM0emZnSFJ5S1NpK3JKTnN6RGZGMW4rTUxOSzh2?=
 =?utf-8?B?aVlHSkNxTHlvaWVOYk1Cait5eUtZOE1BYmYxcWVWb2N4SVdDMkhOeU5oWnlL?=
 =?utf-8?B?UkQrNlUxRFQrdzI2ZEU1Tk5hNkMrcHZlZS9tVGZnYk5TcUtKNVJGb2dJVTQ4?=
 =?utf-8?B?eU91Y1FEMFpHbFF5bEUzNDEvTVUxc0xPZjNSMGtJdHFRRVVLQVlsVUtQdFRy?=
 =?utf-8?B?RUJLQTJEUzJGQXVrbmVPZ3BaK0h6RjZraUhmdEYvV1Y1Y0tjdk9oU05qakJm?=
 =?utf-8?B?VENKQlBzamxaTEFybU9SYjF6T2R0WEpPVXk1RjVTRWpyMEFFUjd4NEU0bGJr?=
 =?utf-8?B?b1JnbGFSUnlNaHdQczRpamxnRU8wMnFhSEcvUmNFeFNGTHY4Y3VPdkNBam1h?=
 =?utf-8?B?NndGdGpUTkJYemorWE9WYWpjTWxjQzhOQzd3QmxqV2lCdEI0d2hoM20wY0Fo?=
 =?utf-8?B?SzZYdndVQTFqU2hOUmN4cUdDbFBONnNpYnJyOForSUFXaVV3eE1IUkl4VU5E?=
 =?utf-8?B?UGRjU21VaXlnVnJ3YVgwbjM4YlZXNWtwMDlBSzZ1eU5WcVJYYXlHeWs4QWlW?=
 =?utf-8?B?R0JPQmtJcnBWWW91ZlB2LzFiNHk5TGJhbXhIWDdpU1ZzQkRFWUl5cXBmWlh1?=
 =?utf-8?B?UXk3UU9WQjN3TFh5YmNYbHkwNXlnOS84Ky9yNk9UT0NEZXZ0SzVORy9UbnNK?=
 =?utf-8?B?YWtNdGJ3QmI0RlBqeWk3YWpvWFdpZndhSFVKRFNySG1QVUFqaEwxSUd5aFlv?=
 =?utf-8?B?emFkSEJ2RzNWV1dLM29xZndDVWlGR0lRRXIyditZaGxpMWZGMGdLQnEyQVND?=
 =?utf-8?B?bTdva1cwaThjMk8xc0hMbGtxL0lyank5cWVIc2huMkpGKzVCT1pLelovSHFV?=
 =?utf-8?B?dlppSGpFL3p5TmJUWWQzNWVCZmZWREowVUF1MHgvcExsMWt1bmxHSGFPbFpZ?=
 =?utf-8?B?Z1pZSExnODhNb0NEMFo4WWlZMTczZGtldEtLSkNsRjhmQWRib1B2L1VLdFpM?=
 =?utf-8?B?dVNob01iSTdRMUg1cEtYQU5vRlVHdk0rYUZpRXJoM0MyZUZneFZVamlnMmJo?=
 =?utf-8?B?S1doRkErY1loU1dGWXRrelM2YXZab3YrYmVXUmhQN3ZmdVdyQy93Y0p1bDZj?=
 =?utf-8?B?Z3JnazdXM2tQb1gwb0R5L1IrSmFyUWJKN3ZLcFk5emVSTTdBNjNXOFliOTd6?=
 =?utf-8?B?U2R1b2tCenBNWm1kelNZbDFnYTl6QU9GbTBFWVlTZUZraU1JUDBLMy8rQlpa?=
 =?utf-8?B?eHlBQ1Jaek1pNlVxTkNRQ01PZFZFVFJSS2NJRmU3NjJVSFcxaWtZUHlLVGVZ?=
 =?utf-8?B?VVFhK0dPOUo5UGk5OEltN3BGRW5qdnJKYU1tdTd6d2tPV0c3cy9iQUdiWFJP?=
 =?utf-8?B?dTA1MnFPbjVlcU93UVZmSlFzZm53QTJwd1dJcExPbFdSSlc4REN1NW5hYnFM?=
 =?utf-8?B?RWpqRUxKNDZlclVST1pEeFQySnpET2t6SXV6dXh3eW9KNUo0NHpSQUpZRFhy?=
 =?utf-8?B?V0FHT0VkT0xJQ3FKU2c5UUJ6YUJyMU1JUFdTVFQvdzV1bDFyWUNBNXBnT1Rt?=
 =?utf-8?Q?pXFsCQFV1NpuIxOs=3D?=
X-Exchange-RoutingPolicyChecked: El4AN1WTFivUlSaQQ+9OJ4IRE7BHieEb3bX8KuDYDAWk7v655l71AUk+rXHGsK/Udv/hghLAAeT4lNNvlvs9zv/Fl1f+sYM6FWBIR8blElnsWvmUxB3UNYUv/oiOX55Mq9Z6sSvDdPndH3cUiRdQJkpVPz4zXmVesXmkN+eDjDUZ+gow8gNZ3X4f1LdEbTsiuU/GaslJyIK5AeICdP2CXi2cpQm5her03khrT+r2Ta0L+LBeIVALAqGGCQUnlEk8NxyvTiEdvalNR6x/644Q+sP8s9nZ4n4kDngB4GNp/eEEIFbDU96kBJjmLohku/2KOyuZc99MbP+CBEByyhhvnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee453d3e-0a1c-448d-a1f0-08df1d6c3dfe
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:24:44.7401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPSj/VFpCy6w7Mz6Vor20VhITsbdh/TCZuzVoaZqyaibAa7QNj6+a6fRl06Pgslx7+/66W0W9QegObTJ9+14hDkRrxCEZW9NHeEuG/ZBhkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9851
X-OriginatorOrg: intel.com



On 9/26/26 12:17 PM, Shuah Khan wrote:
> On 9/25/26 14:40, Reinette Chatre wrote:
>> On 9/25/26 1:07 PM, Shuah Khan wrote:
>>> On 9/25/26 01:56, Shuah Khan wrote:
>>>> On Thu, Sep 24, 2026, 11:54 PM Reinette Chatre <reinette.chatre@intel.com <mailto:reinette.chatre@intel.com>> wrote:

...

>>>>      "selftests/resctrl: Add dynamic linked list management for IMC counters"
>>>>      https://lore.kernel.org/lkml/20260801092429.533956-1-wuyifan50@huawei.com/ <https://lore.kernel.org/lkml/20260801092429.533956-1-wuyifan50@huawei.com/>
>>>
>>> This didn't apply. I am guessing picking this patch depends on others in this
>>> series?
>> Apologies for not being clear. I intended to request for the whole linked series to
>> be included. When I try to do so all three patches from this series, specifically
> 
> No worries. I thought that is the case and just wanted to confirm before applying.
> 
>>
>>     selftests/resctrl: Introduce linked list management for IMC counters
>>     selftests/resctrl: Replace counter index references with pointers
>>     selftests/resctrl: Enable dynamic management of IMC counters via linked list
>>
>> applies cleanly on top of kselftest "next" branch, currently at,
>>
> 
> All 3 patches in the series are now in kselftest next for the next merge window.
> 
Thank you very much Shuah.

Reinette
