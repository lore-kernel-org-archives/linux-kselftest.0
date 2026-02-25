Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023135.outbound.protection.outlook.com [40.107.159.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0E93B8D46;
	Wed, 25 Feb 2026 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026664; cv=fail; b=dT+WvDmboXYlrTcbKdbMITxK7KVGNkFfH5WscXnG8S6MwK0Bahk1h/FzgWOCNpVzc9venUJ52b1Nfnd4Nq0BK1hj/KXQT8KM5Eiz+vqvCcO5qWCqYCeyO/vmLD8q9Sc361AtiGc/4YiBKujfUFj2iqADdTswoWCXOhsE52OgrbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026664; c=relaxed/simple;
	bh=Dy5Uvi51edNVQDZV03tuyV52zOWqF2iiUQ18jHNv+7E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wqm2i5rg/2NwrDc5YIfiJvy5Xq0FS/eWeoOiRWBJZ8sq0cMWCo3Ys2/CDCUe8kSND82vkbyCWHnBb2ZZiR3gedGYbmAoQ/480LgTotzDF3PrwXSgHO4jdJR3nKDo5ka+J/q7zvTl6yC7xtOjJNpZuWb1iKYhyWrPPCgKCbJSVwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=SMlSZVDu; arc=fail smtp.client-ip=40.107.159.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="SMlSZVDu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7WdsvuKuKPUSrKvuOmwSMdLH+Pu/wq/6pNbCSu0NiATUxn9eJJwaWlru9zS/iTiNqRkjz1ko4ueKZfFpJhWMSFBxHg+9mhox6Kwo4DU5xlRyobBKyTBYbesx3obgaPhX7sF24XNzJ2lqOIISDbyTVU6qEbPVj2/0KZMchF4+O5jXfHhAq0BKYd36kVQFiG/a4OAHXMkDekLEsUFXnsg5R0KzuuebQ7gF+FmUpeQLFaWPykjBfTJ5NAaJ/EXZE3n50wR9ggO4xBsBesVV2N1GA0Wi4VnpKF5x3WLiEZEBjV++0Rl2/3apJPiOiPUkUK1g9JIHw7hVno32vGoz0dj2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CApziBMdOMz4ZCPrL33iePTQ77nuzdWU7NukTo+UE0=;
 b=cmzFvyH7B+vR7wvcDfLmlGeT4JiLztK48xs4T58TD1YW2xuDgJ01pFORKHRTQTbxbcTdCJ4vkB5xI+RE1m2jRSyquene+nhaBnV07durFT0xImMSQdAeQrEyBMCRLJUR2ePGlG/30ksZJkMThO5UQxwbjz8W8IhrzGC/erOMlvnPvin1PCPSHz3irExKFqjErfurcNb+pR+Tteb2bFj7lO/Rg4d6lQU7Jb0htZQCzbp85o1iH+tDOfjrMe1gXCiWFy2qsu+xJW8iVJw3pmR4DjGSe7VsySQwzfTD2fBXcvDB90tVqp1FSlLUqfQHSTx8hQP/3NiJJeYAYPakJ6K76A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CApziBMdOMz4ZCPrL33iePTQ77nuzdWU7NukTo+UE0=;
 b=SMlSZVDuAAmwmduRRyaAmR+x/1jw9bZ+Fl8dPblpCQKly14XeXxTmspNoy6LKqmQTwKYxIxlE7oGWt+12y4uowhSyizkEeReJ4HS4FMZIwjeTueR1hez2rV7AbEiIZ+nJSkjdoc6HqLmIQuybL2WmlvADJMuhiIumJ5h+Z93RwPgs7IxshKLVKiWjHHlEhXg0UsGFMpuLhEq684LuEQpTnn0MDS6Ug68NacN8dUyIbQdHUyIDCF8g0AN6L+iRG12v7GMn/qj2FmrXmjL6O1kQ8DEI442OfWOzD40oyIr8Xmq70BGK4wHzyYw+3a7e1wYPUTLcT8fyEw8c/bdeiYAkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by GVXPR08MB7680.eurprd08.prod.outlook.com (2603:10a6:150:6e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 13:37:38 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 13:37:38 +0000
Message-ID: <7fbc05dd-3bc2-4837-9140-a6b0ec9287d1@virtuozzo.com>
Date: Wed, 25 Feb 2026 14:37:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] pid: check init is created first after idr alloc
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrei Vagin <avagin@gmail.com>, Christian Brauner <brauner@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Jan Kara <jack@suse.cz>,
 Aleksa Sarai <cyphar@cyphar.com>, Andrei Vagin <avagin@google.com>,
 Kirill Tkhai <tkhai@ya.ru>, Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Adrian Reber <areber@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org
References: <20260224164852.306583-1-ptikhomirov@virtuozzo.com>
 <20260224164852.306583-3-ptikhomirov@virtuozzo.com>
 <CANaxB-znXjfh5s9ro127TGONsu6PieuaJ1vB3PMVFeV4Eo8pkQ@mail.gmail.com>
 <aZ67mwBEbRtdaWp2@redhat.com>
 <6269de34-203d-47b5-922b-342671573b7f@virtuozzo.com>
 <aZ7z5XPAtptQVoW0@redhat.com>
Content-Language: en-US
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
In-Reply-To: <aZ7z5XPAtptQVoW0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::18) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|GVXPR08MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: e56f87e4-38e3-4cbf-17cb-08de74730a91
X-LD-Processed: 0bc7f26d-0264-416e-a6fc-8352af79c58f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	EW+9fZBpAC5ECdjtLLv4kwhYBo6uLEqPLNDJo41Rz6GUlEES9S7aLlU+uZu6LF52n5pPiL6R4jHHqorcbOLfQ0S+FkQaY0/arw+AYzRCiugtnmVqDdYacZmrZ4m5RGu5nhdjL/TwDDbqAzPe1+whKdy5vkl6HqzoAK8PeBGGMiXiymlD3fCzkxalTybuqQZ1tr0Et47pacHmo+kAWt1uIMfR/wRa5Cc43EB5H4azis8svQ/n/R4XfEntdvQTGf5cswvFiBn0GvgRjxC4jgV6lyfwClmvWdkKMXPIgZcg/0OzX33pGnCFbSlxe/RIkEn8jzrBG16fY18UqMERjbwo2b/mKUWisNX3h8Fy+kqTq6zqMa+R4CjE9sCiKAkNX87n/5Fmu3n+P5xso/9bpZlTGh0yWmD8kWCxs77QohHb4PG5mKfSXF5Y3xED84GypwK99ZnpCR9zp28MlBSLRyS9Msd+rULCxT1cBIwjriWvdFBHQaivBC1n4vfZsAdyHREfr6M0hhUfFLKZOx/DeoIHPxgBPAWornFeqJHwh6AMvUh3IMGPF4CQlWvHAbTJTAzOs5d0RUB4JujD2CRdfILojz4w4ZMjTxMIB6kY0qz8HLvIvvj5YqJjxxCf8s4wfdUkZrqZt6IvfFb5faWpoZrxZcYB+Xzgi6YOfkLM8w6LRDiBzT8bN9sH/bmGvtF8ooJAKFDSGrguAzcmoCWd+DLzDmCBrQWvyTebJlibagoryn4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkZLZHNwakNXVjBYRjdtSjFGZ2JjdWtndEJSQUt4L25YZVZuNE9WWklQMHFQ?=
 =?utf-8?B?UkhuemEwRW9vaGxoYnpiVXZjeEFyTGZ4L3RmZEVYYWxtZmZoc3dBUUZyMXd5?=
 =?utf-8?B?QVd0dExkbGtOeVc0S21GWk84WjJBdkFZN3NWejljaHBjQnVaQjhPZnpDT3RW?=
 =?utf-8?B?VC9kL2ZkWW1OSzRCY0hlZ2k0akFBNzBuOXJaNG1ram9oeGlRQWVwYk1hWUtB?=
 =?utf-8?B?REJrZnBqeW1HeTN4OVRkTXlvOUM0cmI3T2pQMDgwVmpvVHdzQlFYS0Q5Znlx?=
 =?utf-8?B?SU1tdnFwVlhzbFZxbmRZZ09jU0o1WDlpY003Q1hRTVFnY21rTG1KbTZlRVlr?=
 =?utf-8?B?akhnZ2wrUk54UCsvbHNYcnZDTDU3RVFrRWd2WEVVNlVEYW4zNEZKUnpvOVNB?=
 =?utf-8?B?L1ZIL2gyVFkwRUg0OC9lSzVaZldPZUtKY0VMMGZVOVlzVVQ5ZDlNRUZtVmlr?=
 =?utf-8?B?WU5VbFpIRnRPbjlHTVAxREw5SW8wUXkwbXRTekxreWpLUmJuTkpOSU0vUU1C?=
 =?utf-8?B?cHhUMUVKV0Z3b2MyTElQTTgyVkd0THltZ0d5b054b1o4RFo1OEJlRWphNHdj?=
 =?utf-8?B?MWhsdGpGd1pidHB2cjVMSWVNcUN1aWRzbzlmUS83em8yeElETUgza2VzdHhp?=
 =?utf-8?B?R3ljOHZNdUh4cHhLa0NKZ2JPbDY1aDlyM0xIL1I0dTNJTnM4eXJ5Z3RXYmxS?=
 =?utf-8?B?OXlIMW9ITFoyYkxLeWVrL3FQYnQwVHVsc0NoR2M3OFVXNjIwR25kVlU4TnBp?=
 =?utf-8?B?WHh2Nlc2b2dWN1plcXF1dmhENHUvSTIyWEwyWDh4b0RHcmZPY2F2M1ZDUXUw?=
 =?utf-8?B?alJWUFAwWnpFQ1NTUWlsdnV6OEgzM0UvUnYyVFNHRHVHTkFiKzFkUEJRU2g2?=
 =?utf-8?B?cHJpTU14VlZLanN2RXh0cDR1K3ZucDFGbXY0dVZKeVRGM1puYlB3S0VpZFBw?=
 =?utf-8?B?cG1GUzFYV2t2bllnZ1U3VFJiLzYxUEJuRDZzSVYxd0JQTUErK1RMNkw3R2Qv?=
 =?utf-8?B?QVZuWTFLbGpaa2FOanZXRGhvbmlUYVBLQjZQSVZ3MG9PVDZYemhDb0FYYXZ5?=
 =?utf-8?B?YzNiK1dINlQ2QlZZOElDVXl3aksyYmNqMURtaW9FMThwR1gxUGd5UEsrQUlj?=
 =?utf-8?B?STI4WC8zZjVxaVlOSzZQRTRSY3k0TWpBTUZ2cFg2ZHhBcmRVVHA4YUZta1V5?=
 =?utf-8?B?b2NBRHQ1SUxSaFRtMG53VzlYem9SYWVXTmVXODdQYStINXpORWFUVmFWQ3F0?=
 =?utf-8?B?MUo4TnRBc2pQKzZtYXd1SXl4V3llNXVjTXdKdUN4MkJNZVBKWCsxd0tPdmRk?=
 =?utf-8?B?SC9wS2tPUGtXYlVvclRqSU5lVzJWakZSV1oxRUVnNkc0NjlvKzVSWXVVWE8x?=
 =?utf-8?B?SUl4Ym52OXQrQUt5QzFLUjAxRG1JNGxZTU5qTFlCOW9wUzdSSnVYQjdvQnlr?=
 =?utf-8?B?M09VQVoxMXQvKytNSG5GVnVhdE0vRDhDaWpvaDB6NEdzQSsrVE5yMWVMckZs?=
 =?utf-8?B?QWNtbDkyNVFXZjBqcHJWbnNKS2F2Skd4ZjlHOWNodG04QjZyQXpFOXVteFFi?=
 =?utf-8?B?bEVtcVc1akorQkd6M2FQejQ5bzZoZFVhSnRWaCtJaGJvdlNTWHdQQjhMV1Bq?=
 =?utf-8?B?TUhQbkxMeDBISGxCdFdmZHBuNTFHTVR2WG1ybnlUNnNiZTlnc3FWbUlCZVRP?=
 =?utf-8?B?ZkNjaUNDREFhbXNaVDhIZWErcmwwWCtBQWtyMjJHOGJ1MXY1M2xQd1NsL05u?=
 =?utf-8?B?dGswV2F0RDdKTTFFQVhsK2JMMm8vR2k5MURpTXdOcm5heWtRYStuMTNCeCt0?=
 =?utf-8?B?cEgvUWF5UjBiWHYzYXlMOVYwOVp0d1UwWmtHSzBSMk5EWWRSUDBhSXhhMVVK?=
 =?utf-8?B?QWM4WHZ2eU1ZQ3IwcC8xQ0kwdjl6cW83NlFwWjU4QVhZblUvZ09yUWJWdTBH?=
 =?utf-8?B?NkFKWmZlZ2xxOThZMHk5SGs0bVJaUFZrY3NxRnRoVG5ZbVF2OTNMZXEyUk8v?=
 =?utf-8?B?K3FnT1R1WWhMVW8vSTZOQVgxTHp3Yld6WlNFSDd0YW42aVNmSXhuZnFLcFp1?=
 =?utf-8?B?d3N6ZENQTVp1RmFRMXMxUEZxd25FRWFIWFdOb1ZYQ1Fpa1ZkTU1jVHRvbDZN?=
 =?utf-8?B?bncya2VadkhRRnYvNEtITWFuWHdXbjhxMUd5a2dnbkZBOVFzWVFMVUxGL3pD?=
 =?utf-8?B?c1FoTkIyblI1T0kzUEwzb1l5OGM1WEhLSDg2ZFB2M0tIaWJGL0lIeGpZdEhs?=
 =?utf-8?B?dFNEQ0tXUUE5SWYrQVFQSW1lRDUwcHlqRDdrZTNCZjl0NXBLNGxoNmZUNnEr?=
 =?utf-8?B?MU1sVzZqK2J3b2lDNVZmSnN6MzFoTnRtTjhHQWNyZjlsNWMyWER6SGhFVGNG?=
 =?utf-8?Q?wUwiQ79k1c0xRhmrOoo6HIX7Pyek2qoPoOrX1yOWuk7Na?=
X-MS-Exchange-AntiSpam-MessageData-1: Pvo12alNY9jR/uSJx3iUhgshyuWLkjXPNtY=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e56f87e4-38e3-4cbf-17cb-08de74730a91
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:37:38.1577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSnv/nB0FD6Nxhh8/Osp2Y5CwhF1lFNrReT+fJ8UEGiMR2Rh0yUfjTg6slndzmFIoTWuZJGlbJ18XS5hMpZdDJckvQlY6LPtV40+SKltnWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7680



On 2/25/26 14:06, Oleg Nesterov wrote:
> On 02/25, Pavel Tikhomirov wrote:
>>
>> On 2/25/26 10:06, Oleg Nesterov wrote:
>>> On 02/24, Andrei Vagin wrote:
>>>>
>>>> I don't think this is an issue right now, as we only allow one attempt
>>>> to create the init. If that first attempt fails, free_pid will disable
>>>> further PID allocations in the target namespace.
>>>
>>> Thanks, you are right!
>>
>> I guess it means that we should change the commit message a bit, e.g.: replace
>> "Effectively leading ..." to "Though thanks to PIDNS_ADDING logic, free_pid()
>> disables further pid allocation in this case and it does not lead to any real
>> problem.".
> 
> Agreed,
> 
>> Please advise if I should resend the whole series (v4) for that?
> 
> This is a question for Andrew ;)
> 
> I guess you can just send a single [PATCH v4 2/4] in reply to v3, but it won't
> hurt if you resend the whole series.

Ok, I did the v4 series resend. And also included your review tags inline.

> 
> Oleg.
> 

-- 
Best regards, Pavel Tikhomirov
Senior Software Developer, Virtuozzo.

