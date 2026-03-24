Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011057.outbound.protection.outlook.com [52.101.57.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224BC3DE44B;
	Tue, 24 Mar 2026 10:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774347090; cv=fail; b=XCjwpVWDLguTtlqAIi7XPnXTeMc8wbGv1AhWE+A2MgIpDxQ9HqFuddXZEaXBJIYB0QHGU1ecPPRBDu/8KfU04tC0Gw5e2/Z0wbwbnqQxuW6Au15DvD2cq929+Kb413UMdzgrJW/WROznJiR4R6WSAZmhSvO6O7rPzYB2MN2+f0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774347090; c=relaxed/simple;
	bh=hqjU5GLuNESAnUFmLmhdJndHFiXTaHibdhgPtwiKhHw=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ffwoIyx25KxjzeHtkk5/+/EDOyJo9/r5JcRlUhty5OxlImMKSQf5iJKIK52FoL5K1YUDyv0fdsJyssbXoc+RNRthwIlVxYN4wB8KbsrYtrmvtNEUp2xawylIuSNZ/yasHsWrNACRrh7/asOhMXR+7fXyaqQW1MSgq+JuflGvaus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=citrix.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=VKwvLc1U; arc=fail smtp.client-ip=52.101.57.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="VKwvLc1U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMyln2rVtDlC9Qf5wNN+5YcTezniNEVRunVuj5eYIvb3ZP3R4ME2cWbHq0SXR1uMZ7llKq6DLM+DrXnluN/nPNpnmTE31mYJgvaqLTk3shmvL6iEcHKurj00LmefXYLlaUQyDiITqVpEyJjuJ098tHa+hrskjT30k4x2k9WoTEMLzgW45LAj1MWdlZ9Lh21DHtZvwPV/axdNP+1S6/o3PDauIlscBBzmBu2FbpUCnIM5D3ooKmRbB68fJJWp6IyqrUNjxuz1NCnYdn1gjYxQ7d6Cerewuml/god6ge3fNTVMBQF61pSMlvwt0SfcRaVhrgappClzqki+S4zReiXi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqjU5GLuNESAnUFmLmhdJndHFiXTaHibdhgPtwiKhHw=;
 b=MhiuU3XzWxJ1TkYTzEePZRlsEAlOuWMN+DzHh5O6HNYAXFyQ4PHiAoFYcBBZxbndeY3X3enKv1V8J9YNSO6IEzsvFhjM+1k14RVZKj0qAfWUamCqZxeA+QpDhRs+CAqMuU4aU2LSsc0SlL0kFuIIJwKvlIjWk6YlGX2eGqU64+saipAmPpDEukAYSuj7e70QExNufAwX6Bv/p4Vy56NAVoX+2C5lPIjidjyP1uF/QcxJ5Z+vL4/8XlgX4uG/+smRP2w98WAgJJowKCRKF/K46KCIR2JAyu5+/a5lYyoXxx7bA5sZQj6g14CJL7EhOlcra6sWAwAJ0rb1lBlJoPL5TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqjU5GLuNESAnUFmLmhdJndHFiXTaHibdhgPtwiKhHw=;
 b=VKwvLc1UqCQNdu0YnY3tIUDnJZIDrjIy1+OtwYGQjIIiIM9LWBpTQdZw1yd42e9RuwkQnF2wXkoCIzOcorcqVq+Gk9/M3wiJQML9E3qOFisCm1zjr3/SdqHUJJ1yqBB8xUa2fZSVV9AgtmZSnRBOVBKaYB+7mdSg4B+Jk2WknEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 10:11:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 10:11:14 +0000
Message-ID: <dc56dd78-fd72-4d29-a355-8c4243dca2e0@citrix.com>
Date: Tue, 24 Mar 2026 10:11:20 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] selftests/x86: Fix sysret_rip assertion failure on
 FRED systems
To: Yi Lai <yi1.lai@intel.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Xin Li <xin@zytor.com>,
 x86@kernel.org, hpa@zytor.com, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 yi1.lai@linux.intel.com
References: <20260324085102.688490-1-yi1.lai@intel.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260324085102.688490-1-yi1.lai@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0463.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bbdebb6-e50c-4b92-5a89-08de898dae80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	QA0v8Lm240GKJUG0ilM24Ur1hM6WQw9ZYnctZvD8H8GxkZWwude0TsrcHJZ9axRK61JIaNuqmZd1pGENi5esN/C6LzPsqsPq9yRUxPVsyF6V/AHkrrIdwcLWkWgwRZr/8Au31Ab5FUYOHICA0uVFP018fZv1G0dNoWNWH6qVw34QQ4rGb2hUEMq4arwsWHMRQ1CJWfFs+vHrcAmcpfu0ILSsCeZPsHAsjWQiWntawOht0d86PvQg3Y4oV1yKR7Nu0tHgKerNyvfwTkcknZZ6RjHzCFRrPu/J74mYLgUNw7emh0Nj9wYM3lMwcvx0qh98qEg/8R5EPhKK8J6EdAr+w/iBvIIw7/fDDnLEyJpQslKLcgfz6ve02jIiq87rrcSZvGsSftRwSazjxAarcBSJ7yitU0Mp7ZxNG71A2qxdpfLLGnApz7IySpa9b37eonGqQgj2sZ0BZJmJ9FHvlSfeJmiMrcIae/hZyvAilpO1TR5WgaCBN/nc9p0YlleRP2QCGKALXj7qwhuW5zZJoSHAmyPdhjgtPfv50KRFPVU//95gO7f2fa0opX6ozcT7fVcE3rGpa1PyOjnhl//aFRQiUWTJuFqXfBCGlfqLmADAJlU3YZdeW+yQe5wZIsQnrIZnmNxjsZa0h7ioUIWI40upQPKnnWT/vknO/VMo1YGUwc4x7eAyVH7jTHXaNPla6BTw3EdhVLeUDZt/RHG8HdNxI7VvzASOZ8kbUOFARU1ETMrnaWM2droPnH6mtKo+164husxuv1XWoqDcTFhmLiZVNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0xiOXZKUThrT0FIbURCODBEZTNPMEJELzA2UG1HN0NEdndINmhYdVlwZ24y?=
 =?utf-8?B?c096YllSUTRDQmhydFFUOHhHSTFtQitWeGRNY2FhQ2lhdWNlR3pMeW1aU3dF?=
 =?utf-8?B?bUE1QlZrVTNsakpLU3RhZkU3ekU0R1JXVTFGck43YXh0YXR6YStMYlRYdldB?=
 =?utf-8?B?VjkrYjQ0dnJDYmpWakkvdUFvUmhub0tKMUo2ZUhIdFlYRVBURFN3K2lpcFFm?=
 =?utf-8?B?UktYblZxNGdOdjNvZ1RMZkNJenRGL3BrR056ZVg2QUZmSEFVUDE2Y2paQXcx?=
 =?utf-8?B?Z0VHeG80RXBJN3Y1WHRhVDN1bEx2WmtZNFVuL1hrUmhrUWR2enFtZGw1Y0dR?=
 =?utf-8?B?c2NPK1IwMzdQUW5Sb1FWc1Q5YUJGYVUzdnphS0QvTXZZNmdua3Y1c3NTSFJQ?=
 =?utf-8?B?WDlTc0ZuOExYWWlybS9hbjJYZEw2UlZleWVNaXd6NE04S082QWJ3ak5qclZy?=
 =?utf-8?B?eXhWdnJDcW03UHpHeGdmVVgzb1lMR0x6ZWFJbEt0UUhOWmFpSlJHc0VrU1hF?=
 =?utf-8?B?Z2s5Mks5bVJJdXhkYklBZFE0Q0RJVzcrNHY0YU5KNnBVYkdZZnAxNkkyaUZL?=
 =?utf-8?B?OFNUWEpkSXVuTUVTeHUxQ2dVbFRJRk5pQmZDMzFKWDQ3Q29lTXZ0bGM2eURz?=
 =?utf-8?B?M1h0UlU0cVVrNFlxWGR1cEtidzZyc20wSW16ekVyd0pYcnNjWDZoWTlIWGlK?=
 =?utf-8?B?aEV0NGlGQXN4Sm11eUZGaDZZY3dZd3BrNEd2aVV3Y3RoZUZ2Q3Q0S0haRzh4?=
 =?utf-8?B?aVFLU3V5dnJqK3FpOFJwOXk4bS9yalJlckdxd25qbVJwTEE1WUp4bmZxeUxI?=
 =?utf-8?B?SlRkQmhadDFPOE5iYUE2cW15MmhzaDh2TVN4WVAyVFFWQjFmNTFrbGRoRGUy?=
 =?utf-8?B?MHlpZEluTFppbWFZQUZQSGFtMlhmcWl0VldaVGFTNkxlR1hleEk1T1Rla1RX?=
 =?utf-8?B?YzNrUXNrbnFJbkN4S0ZZdXoyOHpZVG5qV0ZXZzl3cVZVN01uUlJtNjRuSmNz?=
 =?utf-8?B?emtsdUQzTThvQ3c5MjJNV1ZpR2lkUlp3MjZHQmhydHVaNDlLWjdMQVhLanNF?=
 =?utf-8?B?ZlIvckFxMlUxZUpQNk5lUmFaQXFjb3FNQ3NxN2wzWjlqUSsxTmdrQVVTMXNW?=
 =?utf-8?B?Rjg5RkRQdmRCU0VmZ0ZSeG10NWM5WGViYnhQdUM4T0lCVHJZbFFhNTZnaVlK?=
 =?utf-8?B?Z3prSXVGdFdPQjZOWm9uRzBoRVBMWXNRdlFHZUtqM3RWTTdoU3huV3FEUmtZ?=
 =?utf-8?B?WHQ0VVd2RG94R09aNDBrN2M3enJOaDZQSFpyakc5R3VCdis1U0F2K1JqUGdq?=
 =?utf-8?B?ajZwYTZITk4zU1NxQS9KczA3RktlWm8wanhJeHo5V2FOd1pnZHFpT2JhNmNz?=
 =?utf-8?B?M2lvTFFzNk9Rc2JJZ0Q1dkZsS2xZQm1sWWQyeG9TaHdnNkJmT1VQTkFoZnJO?=
 =?utf-8?B?Vlg3MzVPcGpaZ1ltRStDajhhVEsyT0hja2ZGM2p6RnF3VUkyQ21zdVFJSENa?=
 =?utf-8?B?b0toWWNoMENLS0owR0w1bEhicTVIaGlVdG9NMVZ2RVoyK3V4czBIRXkwWGg0?=
 =?utf-8?B?eTVVUjB3eFNlZDVQS2UvclNzT0hGN3VLVy94eHptOHd0bzdEbzNOZ3c3bnVz?=
 =?utf-8?B?KzhicUhrVFNUK2Uvc2U1Z0tlUldldXczTzhwNzJuVmlqV1hTYlFxM0tKUjU2?=
 =?utf-8?B?MjVtSytxUWswUE5RbnhrT0NFYVVGNlZRUytDS1BsUnREWTBnZGUxVndTWlN5?=
 =?utf-8?B?OC9NSU05dHhNcFEwWHdmcm5HVkwyZlVFdythSm5mb3p0R0F2SFp4RUw0SC9E?=
 =?utf-8?B?THRoL0h4S3RUNitSaVJjQTFPSDdpWXZad3p3MnY5S2tCZnN0KzZwZ3JMQ2d4?=
 =?utf-8?B?OXl1b3VqZlJ5VjVGVDVaaGF1eU9MN1NwM3E0V0hTaUloNHFvQjRyZmZMdjYv?=
 =?utf-8?B?ODk4aElqM2VQeEgvQWJYVlJzSGxTblFVbEVwUW11cEU4eHZiYXpxQ241NjdL?=
 =?utf-8?B?VkRmT0ZKd2VNMURrZi9RdUdhaDBHdVB1RFhzbk1MS3dwUmY4dlpCWTlzSzVO?=
 =?utf-8?B?TFFYMGtQTGtNU1QxaEJneWlqTDVuYm9KKzdBclRPSE42QUJWeC9ES1ltdTBO?=
 =?utf-8?B?cCs3WlZRdGlucjBkeCtGQ0QyUFlBaTcrVDZpRXBDKzNmMWhHQlZzM2JaUC85?=
 =?utf-8?B?UXFQMTZvOWE1dlNYeFhrRUZyNkx1U3krc2I5RzhRMDFkaDZ2alVrYlhHR2dv?=
 =?utf-8?B?ZGp4c3JzTUFYZ3l6RXlEZHVRUHZJUVozWVdJK0pSQXd1RnlnT1EyU2tHU2Rp?=
 =?utf-8?B?dnBRdHl1ejF0NFlFVjYzVlFlenlpREZqYVU2SzdvMm52RWovUlIrMmpvS0hI?=
 =?utf-8?Q?pLbHFGCBO/7wE2WU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbdebb6-e50c-4b92-5a89-08de898dae80
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 10:11:14.5954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 396gMjU/hG1SItpygrIY8+NOPEU2BltoWgtix9cl6KgRD79cwpA0FBRanrw6Uy3BqFXfm9ZQjllv74IIsYAuhFhZZEHx8cKzJTVs5RNyP7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8275

On 24/03/2026 8:51 am, Yi Lai wrote:
> The existing 'sysret_rip' selftest asserts that 'regs->r11 ==
> regs->flags'. This check relies on the behavior of the SYSCALL
> instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'.
>
> However, on systems with FRED (Flexible Return and Event Delivery)
> enabled, instead of using registers, all state is saved onto the stack.
> Consequently, 'R11' retains its userspace value, causing the assertion
> to fail.
>
> Fix this by detecting if FRED is enabled and skipping the register
> assertion in that case. The detection is done by checking if the RPL
> bits of the GS selector are preserved after a hardware exception.
> IDT (via IRET) clears the RPL bits of NULL selectors, while FRED (via
> ERETU) preserves them.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Yi Lai <yi1.lai@intel.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
