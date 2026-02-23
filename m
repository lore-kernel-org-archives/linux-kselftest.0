Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021115.outbound.protection.outlook.com [52.101.70.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AE237475A;
	Mon, 23 Feb 2026 20:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771876993; cv=fail; b=pJpFJnk5EhVYOoz8J/bevS1U6b4F0t/hrRiOSSPfN9Pw4K/CeL4pC9F42IMreWIygLGSrsqyYy+ze3RU4kWJG6pIhOUsiRM8m2V4U1xvlQaCTqIoKdxh8BXF5S30e3mn78DIsC/x/ElSnHRbcmpxQndDEdXn7OR6DHh4utuPpjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771876993; c=relaxed/simple;
	bh=CL93NxkQXYbQ89fNq5nZBf33GWmdXX+rtjtNEyrLTS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sLvop1gU38a4xreyvxUsqu+w0q5mSMFps0Lc16TCN7dtYAJha0AktFFx6XZx8xbK83GdunTDWl227L924Klp6/nmoPX+sJSE8ZHRK5LLoRMBPTmEe4uVgOJ+BRmtQ9s4cd6DTGC5PmfRY6TmX9klV4SP0muI97mf+b6wdHb1Fuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=XKyKZEBq; arc=fail smtp.client-ip=52.101.70.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="XKyKZEBq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPKFxfqw1+sOkos1ihg8vOXZuXeNTk3LVNiwJVqKpH8SdWFZWPIP7CWeG/nEVVCmfon8aAVrkM4JNJh5k+oNx4IGdtG74jAZZhE5OTRwiQ0RvFRXTTnUHM9U4gOLsgeMALJsL0E4Hs1pb4Hrz/x+3qtKdsQQYLs8DOCldHO/rENjKl7DLlYUsHG7r7ORtnwNoljA+vHu/1R8aaBJ9D70NcLeYqDI2qM2ZzmsQsg7dZCNYsGqqhGKWDgBwq+xBA/x+YiJkfjCXASaf5SCSeUN78UmhXNPDqDXkwdrxP9Ddz01qRSHA9wHae5By1WwKK0w5gWTBrzhCthXHe5cdI40Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFe8tooidMNwSRAhmjcgB6y0r6gLg6pCnS0chgH6qMM=;
 b=jQTYPvnjsi8GOAh6Lv+XwKj+d0VUbTbJbnAmljxKse0eOpPFJXlABJrTaUBrLlzxOjkptS6HxXDFwUPWdCZv7v1JwgpzQmd/cKZsnZSiViOlsp6Q7k9Rew5vUrRMsCYIppDUj5awlpoQl8b+w7T5FD7S6NGiU7qdTZg4WXyhcobISPCushBNcZwccJpQbdwkGiSqtTgB/S6+ufqlGFMmQPuhES4qq8CBLMk8oQM+oHmMmqPmk5yk7mC59ATbyoF6qLO+1UtufexPMsl8eTlXW8QzPwVvjwXUjjIUSa3zFJHHvr1J0g5Q02WAi22IzkfNzx44glD5ZjwuchORvbKvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFe8tooidMNwSRAhmjcgB6y0r6gLg6pCnS0chgH6qMM=;
 b=XKyKZEBq2FNZzUBx/eMjDD9D6x7VdZWojie1CDqaYyALfe4+lRM8PJ4Kvit/0KGqHKOSiompgPCIBGW3rYHPvd/b+Zy/qMSdomwxIZvDntCdTkV2QIbu0jNI7OPbjbDcPTbbCjNMN9ouQcwchx+ZJNOmT01W7anBMeR1anpgtVbuZSgghubLNjyyct/1ts3Jwv8E44ahOXqmuNHPT0r7jUmXfEAWMnxcjnuUbyCL3jeIRSint61gSiYa52G9zksQwwFAzrOU4wfWfocigkudfppskzgfGw4kJTNllXLcmZRYqcCH52r+vFSLYvnEC/vWGb8vUw2cdghlXWqUnBVtBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by AS8PR08MB8874.eurprd08.prod.outlook.com (2603:10a6:20b:5b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 20:03:04 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 20:03:04 +0000
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Jan Kara <jack@suse.cz>,
	Oleg Nesterov <oleg@redhat.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Andrei Vagin <avagin@google.com>,
	Kirill Tkhai <tkhai@ya.ru>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Adrian Reber <areber@redhat.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 1/2] pid_namespace: allow opening pid_for_children before init was created
Date: Mon, 23 Feb 2026 21:01:22 +0100
Message-ID: <20260223200254.4104651-2-ptikhomirov@virtuozzo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223200254.4104651-1-ptikhomirov@virtuozzo.com>
References: <20260223200254.4104651-1-ptikhomirov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::8) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|AS8PR08MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: 08dfc8eb-4303-4ef2-bb9a-08de73168e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|52116014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3hvSXExbXp1K2ptc0lBS3c3aVpiNzI3UTNjMmNLVmVvUHlSRW9IT0ZlVzlG?=
 =?utf-8?B?V2E5bDZybUVNMmxYRzJPSHpHMVREd0VEUTZBRFI4TEErY0xQR293R1pycDFB?=
 =?utf-8?B?NENYTGt0aUd0b1dBcDNFQjlFMzloRm9RMGIwd0s2b043OVNzQ0syNFljeTgr?=
 =?utf-8?B?Q2l6TVA3Wk8xZHNKWWxJUHozbmgvRTlyNFBNNjlTWU9icHBOUGlzTUNBek5O?=
 =?utf-8?B?ZGRoNUFZYm1CSWpwb2FzZDJJdTlSUVlHTXRGalZpbTQ5SjQrdyt0STJVNklx?=
 =?utf-8?B?akdjaXBmZDJBRmhWMVFQc2V2TEFZdlczdFFGamNhWi9RZDhES2o3czZxOWZo?=
 =?utf-8?B?ZjFVemVjZEZOaTVIR1ZMZ0RBZkpwbCtWeWpNcUwzdjVvVHIyWmc2QXA4MVNR?=
 =?utf-8?B?Y3NEMXZCNDRrb1dRRmppNkxCdk9rVDQzeVltMnoya0pTckE5RkxkM1BMMUQr?=
 =?utf-8?B?WU8zM3BGVXV5bDRpd2pVdlFCUVRlQklaS3oxd1N6cFZWNHE0aXFEK2xxcE4z?=
 =?utf-8?B?R3gwaFp0ZlNBVWYycUJwejBiTU12YVZ3dTROOTZTczZNMVFid1lJK1I5WjVl?=
 =?utf-8?B?YWVxQ3NwZXRIbkV6VHdmTG9Rb0h0aEp0clNlZVFUR0FoM1BjckRUcTlyVW52?=
 =?utf-8?B?VXgwYXpYSkpWTUQwaFhlZUV6ZzhoakRyVDJqd0s5djZNaHRRR3hXeWxST2Qw?=
 =?utf-8?B?bG9mSTRBaHJhSFk4cENCOFljMVhRNmdmMHYyUFdVZGZBSXA1RWcxT0VEekFa?=
 =?utf-8?B?bUNWcyttc29zT3R4eGJNTVpTeXpBcUlMU0lXcDBzbzRKSmczOWR4Zkp0Z2Rr?=
 =?utf-8?B?VmcrRzJES0JFTXF0OXNZY2MwbkdNZG1hR2NyN294eVprMFVXc1NLV3dBTWt1?=
 =?utf-8?B?NUtYM2xTQm5ad2xxU1JHeGJjbWtZV2ZyZ2h1RFVQR2EvL3gvdzhRbTVRYUdq?=
 =?utf-8?B?RDZuVnh0WUl2N2ljUG5SZGFEaCtkM3VFdk9FRkg5NFhvNnBzcVp2WVdzc2M5?=
 =?utf-8?B?WHFtWXBzeVU0NER0TlNITGluYVZDZ0Y0NWpkYlFRT0xtcnRlYlpmV3B5WTdh?=
 =?utf-8?B?ME8weko1RnhvWWF1T3BlMW1laHhUSmNBWWhYQzJBbkNtOVVhQXZLQk00eElk?=
 =?utf-8?B?N252RWtmVnVaNDg2UXp5T3BvdnJsYVhPWUZxMVFMNkFHMStseFFJL1dIUmJD?=
 =?utf-8?B?Vk0xRGZGVURac2RFenpLWnhIL3NTZ1c2aVJwd0JxWk9TelhxZnN1Tk02clRT?=
 =?utf-8?B?ZWdMYkxnUVkraUZuN3daSnE2MThZRndudE93WkU1TXZscUJrbi9ybVpzM0xJ?=
 =?utf-8?B?bERqMWx2VHhSbGxiMDV2N2I2MDJVb1dNWGt0Um5Vd1pIck1URnNBMFQvKzdC?=
 =?utf-8?B?S0h4YVpQcHFzTmU1SGtyQ1BXS0M2UVJ4YVJLWFFBYm4zUHpDM3A5TVJVbGU2?=
 =?utf-8?B?NFQwRkNqbG0wMjRQS01IRjA3QXFUSnczRVBJdFJLem5XcFRBM3l5TmRCTzJv?=
 =?utf-8?B?NFFFYUpPdkhLcUpwSk5ZTGxxZjFBa1NkSmMrd0p6dFpYREJRQ1RRS0RNV1J1?=
 =?utf-8?B?bFppU1NXbE5qRXZZWDl2bFoyajZ2QWdPa1l0REN6TmxkcHdDMTJZVW1RYTFF?=
 =?utf-8?B?UjRtdnhYMEZhVHhNVzNpT2I3aldRQkVJT3Q2VzczUEo5cnB1SVhDRFVhYzVW?=
 =?utf-8?B?QjE5WGh6RC9yR2lGcFpvRFBjSVFkQXA0OHphZzFjVVhsR0d5bEJEVXlLNXhP?=
 =?utf-8?B?RlI5WjlMS0l0d2RUV0lzdm1paEg4N0pFN3NHVDV3enNQbC9vb3JaR29GT1d4?=
 =?utf-8?B?N3h6R3lXTlZ6cFU4aUtGeVU2ZUF6cHNmMnl3OXpvblA3ZzBlU25QZVlZNzNB?=
 =?utf-8?B?Rk85OE9MMUhZdnN1UzR5V3Z6V2VlZ0VXd2ROZzA3cE55ZDlZK2xDYU9GcFRl?=
 =?utf-8?B?TFNPODZSeGowdVlOQjNxanhCYVd1S1g3UFZaRzM4bjhXMjJYUmdSeE5KazFa?=
 =?utf-8?B?QTBKcXRzdDY1MEVrTEh6TGdjMEkvN3owR3VJOElvTGtvcVZuOW1KQ3Vkait4?=
 =?utf-8?B?YUJhTEc1Q2RrQ1RFMjErOS9FbnBZSi9Tem1MeGpTWkloeW4yWWN2VEwrRHM5?=
 =?utf-8?Q?V4GI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(52116014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmVBdlk2dHZ4a0d4dytqVE1janBWb2JJMWxBTTZrNXV3RTZtQWUxNkRaMjMr?=
 =?utf-8?B?K0tmN3Fob1Y3ZmdXUjJyTkRqMU13M3diM2lYbDJpaXNsVVU2a1JjV3V2WXE0?=
 =?utf-8?B?WVc2d1hYZWI0dTBXWjBuaVRqbjlmUDM2S2tTaTIyR2pBYUd0cWhsZGJWMjN3?=
 =?utf-8?B?RUJaNUwrT2lsZEl6NDR0N2lncnUzYjR2eGdidmlPb1lBaUNDUjRjdk1sbUpz?=
 =?utf-8?B?RGJmQmZxc1VoZmJQQmpXWjhuOUFLSDZLYjN1N3BkbC95TWlUdmlSQXBJWWds?=
 =?utf-8?B?R2s3aVRXTmxVV1VmZkx1L1RTV1J2WjNBKzVTRVJaTkVQK051V2dWOXlsaXNU?=
 =?utf-8?B?aWV3bWVtdmJOZlUyY0F2UkxXUlBHMWd5ZFJGNElBQkUyaGJyUFVDY2IwdFVZ?=
 =?utf-8?B?d2c3TENvNjcxN3hjNzVtMFNwMHY3RDQxRmFSZ0Q5SnEyNGZHYUhaMjdKT0RH?=
 =?utf-8?B?Ri9zYlg0eE9wdWZtTVV1c1lqZllTQlh3VDZ0SmJjY0JCN1VtZzhZN3RUaWxh?=
 =?utf-8?B?M0xmT3RUdWVhaHhwUHN3Y3lob1pNalRCUEU5bTlMWjVLOFRhUWhYMjJJcFRV?=
 =?utf-8?B?NWJ1cFI2ZU1BeUs0TjVUaEVzZno5bklrZFNsYmhrSSswWTc5QVAzbzJpR29K?=
 =?utf-8?B?ZHNyL1pack9hTnJGRkJrUnlzWXB4Q2JaTTJOZW8wOS9iY1hKOVA0K2t3QkNI?=
 =?utf-8?B?TExSYThNdmgvcFpPcGtiZ3VkTXhuZU1DSDduaEdYeHV2cDNESFN5WWViSWUz?=
 =?utf-8?B?SW0yaWVEM0NqbUMxdXhOWlIwR0VhS2YvQzdUZ09PN2xOWEpRUzh0MTVvSmRZ?=
 =?utf-8?B?MmREN1o3SHNkSDYvYnliT29yZklRYjdQMGpiS2ZvSzlCQTFLSnd5NEd6VTRQ?=
 =?utf-8?B?djRUWjJlWjJtb3cwZTdTZE0wNFVyLzJFd0RKUEJ4aTY5M3VCYjhMckRaaDhW?=
 =?utf-8?B?Zk1UeE1YakcvOTNwSXBMR28rNm03QUxsRkJFRmg3OXBQYTRRM0dRUmR4VW9p?=
 =?utf-8?B?SG9PTkgrUWdHNGQ1bHAzb3NaNUdURDFLUS9McjR5L1I4TVZ4WnJucTFpeGdZ?=
 =?utf-8?B?N2F1bC94djJGQnBMc214YmlVYUNxb0VIM2JabWF2QXN1SHNpSnBTTFQ0dWNJ?=
 =?utf-8?B?RTJ5eHRWWW91M0VYNkxkcmhGTjFxeUhOZGhOWC9mL1M2U0JERkpXRk9YbCtK?=
 =?utf-8?B?RUM5OUZKK3pIYkJFcjFyQ0Q2c05oTEpXc3pOa3M1Z0MyT2NBdDJMQzV4cG5T?=
 =?utf-8?B?clRKVTBIVHZERXQ3OXdWdmlzeUdxd0p1cnJDQlhiNC8waklMWGxVb214T3Yy?=
 =?utf-8?B?Y1JQTGphWW8vM05OalpvbENnTi9VOXdxbkVHaU5zanBvaEF3SW5vRnNmMUhX?=
 =?utf-8?B?VkV5bDErQmhOQWU0Sndva25pNFpjZTcycHhaSzVEd3JVUzNudVFtK1RHM1o2?=
 =?utf-8?B?b0NNeVNVbFBsYWptak5SU0wrS3MyaDg4Mnp2Sk9paUNYU05Qd1pINDJpZ3F0?=
 =?utf-8?B?SE5WSXRvUmpvVys2M3R2K25QcG1zOGc5OENBL1hMMHluNldWWWxON3diclFF?=
 =?utf-8?B?WFNzZ3Vtbm1oWmFHbDlOOXNReFpUM2R6Y25icWFJbjhRSUpvRlJvN2llOFcv?=
 =?utf-8?B?WmVyV1NUODlwdDNLWWRuWmFrODkzL1lJNktDMENsVnVpZmYwbnJxaUhySnho?=
 =?utf-8?B?c3pmd1U2RHdtY2tiMmFLWTl4c0dkTnFCbW9YdDdYQy94Q0tCUytBUmc2dFJC?=
 =?utf-8?B?ckRNbGdBRUk1QUhLU2Q0ZDV6RGt4eE1sN0Nsa25PMDJ3Y0ZXdnJDaWpYNkhM?=
 =?utf-8?B?bE1NSjB4N1daWXJFMVVCYVptT3dGUmpTdURvV2F4UDJmRVNXeGR2NFYzRkdG?=
 =?utf-8?B?MDBiYTJDUzRKeFlpMkZuUUI0anh0UUVuakMrak5WTUoycksxMW1IY3lXdGpJ?=
 =?utf-8?B?bHBvaFZNQ09FMU9qa2cvVmVMZGJScXpWNHdvUkdzTkNFNHIydXFWN0pTRVZH?=
 =?utf-8?B?dEpFaFovR2JtU3F4eDJyQnppZnBHVlJEMElVaXlLWUhMdC8wb2p0MUQ1QjNv?=
 =?utf-8?B?Y3FnYW9QVlBOYmMwSXQ3azhQYU91UUJtQUp2dzN1ZUkwa0paZERTU0xreElq?=
 =?utf-8?B?eGEzK0c1amFCUzVtUFJpMVFJSm9ZNHBiSlVUeXN0MW16Z042WXMrcGp4dnpp?=
 =?utf-8?B?QXV5bHJrRno2RVZIUFU0eHFQQlpJQUlaa0pFNU1yRnRvaDJuSVc4TGRCZ3Vx?=
 =?utf-8?B?TDhtZHNBNk50WFVPZzMrbzJPTWZzcURMSk1xMkorSml4NHRDR2ZjaTBqcGxw?=
 =?utf-8?B?Z0x2NWJxdDlQRGhCMVhYcWtwNHlVOGZ1dmFIZ2NRT1BsTzR4NXVlVWtFYjly?=
 =?utf-8?Q?wmeVLNk9h9QENigH+Shn8UiXLDSDdKaTfxOlPniNO4FJq?=
X-MS-Exchange-AntiSpam-MessageData-1: X+CEIwX9mRjLGGZ7ASq3I7PxqTXszBKUCs8=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08dfc8eb-4303-4ef2-bb9a-08de73168e1b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 20:03:04.4934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGMYoezNxgXDzc/QQAbMZR93ZXaz+gS4F5M94VaU0N5hJ5j4FGL7KUNfqgwU2gmqEtMiODOtuSpaUBfeocZARM+BxkflXGMBHdhhgfPQJfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8874

This effectively gives us an ability to create the pid namespace init as
a child of the process (setns-ed to the pid namespace) different to the
process which created the pid namespace itself.

Original problem:

There is a cool set_tid feature in clone3() syscall, it allows you to
create process with desired pids on multiple pid namespace levels. Which
is useful to restore processes in CRIU for nested pid namespace case.

In nested container case we can potentially see this kind of pid/user
namespace tree:

                            Process
                          ┌─────────┐
    User NS0 ──▶ Pid NS0 ──▶ Pid p0 │
        │           │     │         │
        ▼           ▼     │         │
    User NS1 ──▶ Pid NS1 ──▶ Pid p1 │
        │           │     │         │
       ...         ...    │   ...   │
        │           │     │         │
        ▼           ▼     │         │
    User NSn ──▶ Pid NSn ──▶ Pid pn │
                          └─────────┘

So to create the "Process" and set pids {p0, p1, ... pn} for it on all
pid namespace levels we can use clone3() syscall set_tid feature, BUT
the syscall does not allow you to set pid on pid namespace levels you
don't have permission to. So basically you have to be in "User NS0" when
creating the "Process" to actually be able to set pids on all levels.

It is ok for almost any process, but with pid namespace init this does
not work, as currently we can only create pid namespace init and the pid
namespace itself simultaneously, so to make "Pid NSn" owned by "User
NSn" we have to be in the "User NSn".

We can't possibly be in "User NS0" and "User NSn" at the same time,
hence the problem.

Alternative solution:

Yes, for the case of pid namespace init we can use old and gold
/proc/sys/kernel/ns_last_pid interface on the levels lower than n. But
it is much more complicated and introduces tons of extra code to do. It
would be nice to make clone3() set_tid interface also aplicable to this
corner case.

Implementation:

Now when anyone can setns to the pid namespace before the creation of
init, and thus multiple processes can fork children to the pid
namespace, we enforce that the first process created is always the init,
and only allow other processes after the init sets
pid_namespace->child_reaper.

To avoid possible problems related to cpu/compiler optimizations around
->child_reaper, let's use WRITE_ONCE (additional to task_list lock)
everywhere we write it and use READ_ONCE everywhere we read it without
explicit lock. Note: we already had READ_ONCE in nsfs_fh_to_dentry().

Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

--
v2: Use *_ONCE for ->child_reaper accesses atomicity, and avoid taking
task_list lock for reading it. Rebase to master, and thus remove
now excess pidns_ready variable.

Note: I didn't find anything in copy_process() around setting the
->child_reaper which can influence the pid namespace, so it looks like
the pid namespace is fully setup at the point when init sets
->child_reaper to receive more processes. Thus tasklist lock looks
excess in pidns_for_children_get()'s ->child_reaper check and it should
be safe not to have it in the corresponding checks in alloc_pid().
---
 kernel/exit.c          | 2 +-
 kernel/fork.c          | 2 +-
 kernel/pid.c           | 5 +++--
 kernel/pid_namespace.c | 9 ---------
 4 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 8a87021211ae..567fc3b7b0f9 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -608,7 +608,7 @@ static struct task_struct *find_child_reaper(struct task_struct *father,
 
 	reaper = find_alive_thread(father);
 	if (reaper) {
-		pid_ns->child_reaper = reaper;
+		WRITE_ONCE(pid_ns->child_reaper, reaper);
 		return reaper;
 	}
 
diff --git a/kernel/fork.c b/kernel/fork.c
index e832da9d15a4..27d0cdbca67e 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2423,7 +2423,7 @@ __latent_entropy struct task_struct *copy_process(
 			init_task_pid(p, PIDTYPE_SID, task_session(current));
 
 			if (is_child_reaper(pid)) {
-				ns_of_pid(pid)->child_reaper = p;
+				WRITE_ONCE(ns_of_pid(pid)->child_reaper, p);
 				p->signal->flags |= SIGNAL_UNKILLABLE;
 			}
 			p->signal->shared_pending.signal = delayed.signal;
diff --git a/kernel/pid.c b/kernel/pid.c
index 3b96571d0fe6..e6116e131d8d 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -219,7 +219,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *arg_set_tid,
 			 * Also fail if a PID != 1 is requested and
 			 * no PID 1 exists.
 			 */
-			if (tid != 1 && !tmp->child_reaper)
+			if (tid != 1 && !READ_ONCE(tmp->child_reaper))
 				goto out_abort;
 			retval = -EPERM;
 			if (!checkpoint_restore_ns_capable(tmp->user_ns))
@@ -247,8 +247,9 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *arg_set_tid,
 			 * alreay in use. Return EEXIST in that case.
 			 */
 			if (nr == -ENOSPC)
-
 				nr = -EEXIST;
+		} else if (!READ_ONCE(tmp->child_reaper) && idr_get_cursor(&tmp->idr) != 0) {
+			nr = -EINVAL;
 		} else {
 			int pid_min = 1;
 			/*
diff --git a/kernel/pid_namespace.c b/kernel/pid_namespace.c
index e48f5de41361..d36afc58ee1d 100644
--- a/kernel/pid_namespace.c
+++ b/kernel/pid_namespace.c
@@ -369,15 +369,6 @@ static struct ns_common *pidns_for_children_get(struct task_struct *task)
 	}
 	task_unlock(task);
 
-	if (ns) {
-		read_lock(&tasklist_lock);
-		if (!ns->child_reaper) {
-			put_pid_ns(ns);
-			ns = NULL;
-		}
-		read_unlock(&tasklist_lock);
-	}
-
 	return ns ? &ns->ns : NULL;
 }
 
-- 
2.53.0

