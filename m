Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023114.outbound.protection.outlook.com [40.107.162.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5E83D34AE;
	Wed, 18 Mar 2026 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836538; cv=fail; b=EYg10U4UnlTGJow8NLz3BmPXe2AIm7MiFmpErrvdxGJKevfcqpKEUsgSvCEw6MrecMbGn88dbFG50/0aIdsdRtQrz3tr1bgCmDKYDU0U4zVWlq6sT1Y/TrSMIQFeF5w5t2etUDjYbMtmts3gi4qGWHYYJPi+ax+XtAbz8tl05BI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836538; c=relaxed/simple;
	bh=I4LzKJjJGM6QB3t/+r9Hrpfw+/miktV71rtx8crGOKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LZDrbYNbjLzkT+wJZyHKSAahDKoj3n/ChNknXExZTeXYMUysnED1QRF8CPMi45Igqxot26K2BCpTuD91YgzUicRok0kAVRT3znWmuXwgZKjLt1o7gHhGhzBwtUq09Fhc+YCwS8bo2nWDmEv8VqJJ5FbnD000NP1FxnucKYBWZQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=GKrRt0tG; arc=fail smtp.client-ip=40.107.162.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="GKrRt0tG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IE3qfqJQ8wCW/WvNFKM/D+j784L3t6sqomMp+cIyTv0CcNzGDwDUYLCZIwERoXXtvgW9Qgc6K4KKeGxC8lBzfszbadkG4fNmT1yais6FHPbBM1wrY7YJKAytaioG2qnOx0906erGBpJk5WPDXfTofXLejoABbhelLxoyUh/eEOKgZ27Lwlr/LIeVSTejYiHh9t131xtga7531opAvT2X1bZEDr8X0DJsfHuySJdVQYhNXBbcr1cuPT7Rm3LjNRK69E6EbQI7dVM+XKgoVhwpN/fSgTPdSWiD03YrKkZFq5+DJNRFJ0H6/95KOgQmcQu/Rcbi37/7i1jFlR2ShrvdeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKPu28Rcf7AjhOJB2C8rhjFC24Bo2XHiAAL87jZaCCc=;
 b=MZbskxu211p3KNuxofwaw5IN13WZGgLMiEFdi6zWn+P+0Kb0OSES8eyAGPJ3uTVfsGIxxRpX4WHBCbbDeLL7rWxMJuePWCgSHB5S2H8w57aO1DG1Rf8Z5LCcBVYAb/n0xNgNlC7OlCEmA617orjvBYGS+RdyfcwthQnwXiNihvmxVCOS2643PmigfJA6rgXPS62NTRo7lrAVCnknXWpvZ2kgQCL8UvscG/3VcG5WV78ACmnnVm2ow8zZJCTcBr1ocjy34/tsG7kXNf5Bfwk5eIDK59gKRbFa3b5vY6vuRszTrzn0RaLrDsBipdnK+fDXV35/CyoNBV59Gop/hEwTiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKPu28Rcf7AjhOJB2C8rhjFC24Bo2XHiAAL87jZaCCc=;
 b=GKrRt0tGDG+2G6hOBDwJiA0TYmf8yAwycSVun/IhsTKytDmwUeyvz19FF1H309V4od8ATxWF7+dKusAPUhS8RqHUed0sNL/kNB5qlGhdunsbajR+bNOSCqTssKgiHR+4mY4BqzxZfR4vHzuCVRhL8JBEXYx8PFDN9R7GgceYzjGTTajSmtZaFxjGrv6BFLHCO4NQ5OPVigheHvP7EgG9j2R4S9SUbpzH04WzQCcbW8kzFKXX4evdp5n9lzPwsrtowi0bzR/BCoGl56lUldrAqDXZYlTDuiL2NVVAg+MZZjd1o1uFT4jTvxbV0N5U4Z4mtSn8SRCtYeRa8m/hviYM5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by DBAPR08MB5830.eurprd08.prod.outlook.com (2603:10a6:10:1a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 12:22:12 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 12:22:12 +0000
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
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
	Mateusz Guzik <mjguzik@gmail.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v6 3/5] pid_namespace: allow opening pid_for_children before init was created
Date: Wed, 18 Mar 2026 13:21:51 +0100
Message-ID: <20260318122157.280595-4-ptikhomirov@virtuozzo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318122157.280595-1-ptikhomirov@virtuozzo.com>
References: <20260318122157.280595-1-ptikhomirov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::14) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|DBAPR08MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 6321cbf1-175c-4fc8-0f30-08de84e8fb67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OyAqhvjDf0oAO3Xb5IkwDqfF2V4opCx3gVPVhD//5ibNVPV+CfkL4bwPn/14Ls1wMEBB3T1Iv4NYP4btBguTPRx0o14mCZfG1+0Qh6lMiq+BWyuZffIA0OANxsEAjfwAkzKLFzf2ybs/vEFp1jOuPmPBGL8ZBIqtCmMbljhen/haFf90j4VEbdRJe2m7+MuV4TlnA1780AYY1PkfGyi26Kg81WT8GgLBW/S1+/1BWweuZzXyUyFvVPbLmt0wl1ktRGvJ5svaJa5/C8eoTBU76dX0cJ9f3VyppSdhpNQUSYr+URue2RrzeDSPx+sUZ6scg+Uih5jQSRKD+ZE0cM274lQDvFGL67oqAqveNx7JEpJm0PWGmMBQFto52v2BzOY4osthx4K5KFEYKfOe8y5s09kMOGnbNYWq7IwPKjijWcsUiDTwX2pXjeC5gKnhuMlWx/sYgxYhx7sHLCL9zaHhlmQ22EsaQTPijiFRWy+DyghiEBdkuZikgjJ9JizTJl8+CEfsjRFl3eIxXkRFRJF3Dy79p81yaKCePIuTiGzS3CjsB+epkZ3zz7EUndMbmd++iwS7T4drDCU385puIWRkOhIIXSiKWx8LuTmQ4ZQ8zD0WIpOm5ZOEmA8SRRRksRE97IdXSRgsDXIbXhQFoSTBgJplKdKKZdXJSp+3AW6mc8kKav/VLVzhYjyo29VKWGq5CWW1r04DKaxaVxZjRtt2pGaBZ0fLqDeXb6m14pWwRE0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXR5UzdCTkt3RGhvQldRQThRUXl2NTJSSjFNMXNwMmsrblpCd1V6Rm1OYXFI?=
 =?utf-8?B?NHZjeHlEODFtcXpSanM2WTBrMkpRWkFLcFlCYWNlTHhUREJEbThOd1h3a2Q1?=
 =?utf-8?B?NkJYYUJFeHpEZE4rN0lmWUwzTXZyYjNWeDVwaXNoWVNDOTdTNHYzUHVoRGdz?=
 =?utf-8?B?ckg0Rks3OXNzaHJPRXh3L2xUTkZoL29FU3JIdnY2WUtMa2N6RThFdUp1VHZE?=
 =?utf-8?B?dmRvTVRQNGJLVjc1d1d3Z0E0ZUxDaERwazlHbmh4eWF4dHJjeW0zajczaVRG?=
 =?utf-8?B?anlGbHdtUWlabHNNU3o0UGI0NDZyc3lGelFoVkZCN1dmZmdWVTRKZmdjRzBC?=
 =?utf-8?B?b0UrOGhNTGREbUwrRi9icXRIOURJSWEraTRoblVaT1dMQUNOcDJDYVNESzBM?=
 =?utf-8?B?WFRUZzhiZTdSaG1GWGxBQW1YbUovdk9qVkVXc21BUDRWRTZQaDZ3c1EzekYv?=
 =?utf-8?B?OGJNS3RYVG5UdDIxRUxCVVhIeEJYQ25oQk1LK1lPbEVOUHdkWTFjSkFlOUE1?=
 =?utf-8?B?WXQ3SHFodGFFZzU3Z1crUnRXU2kzRDQxaFlZNEVvUE9FNlpTMlZMTGJNTU5i?=
 =?utf-8?B?VzdObXpsY2RJczQrSUxqQi84SzlPcVZFSFduZmdYdjdZdVNCOFltanRDN0xp?=
 =?utf-8?B?OG9nd2JxWWtybHpXZmxyUk1xVkR6QURGbUJ6eXpidTZiaExyOEhlM1R4ekdV?=
 =?utf-8?B?bVZ1R3FOYTdsMVQxNW9HYlkvWXVaTEhnVmh0ZW5xK3N3SXFWMTZnd1FBdVRZ?=
 =?utf-8?B?dVJMU3BRdldTY0d4TloxMDErL29QRFhKZjd5aVNVUmhXUVg3SlpndTJiaGV3?=
 =?utf-8?B?QVNUOVFnYU1ZcnplcE9XQXoyZWhaWlhod0lGdEpUWmxEK3Ezb21EMEZZenQ3?=
 =?utf-8?B?NFFqckJZYWJibk8yb0xhY2xYeFp5S3lyR2ZFR0s3MS84aHR3eVc3V2pGTjZs?=
 =?utf-8?B?c0dtbWV1cmdCb0ZON0JFS2FtamxydXYrQXk2V05UUktmQ0pEWWlzN3BwME92?=
 =?utf-8?B?b08rVDJRZGFRK3VlaWVWcm5jSzc1dG5TOXVRSWNDRlVNSkcyOUtHMTBWUnRw?=
 =?utf-8?B?T3FFNlg0cTFJNFMxOHBoUUc0MGZ5eHdyMGRERUM0aklPQXU1V2lJR3RxeDVP?=
 =?utf-8?B?UWpoa2hUSS9iMEYyUXZUUnltL09iK283MGNRYzI4b3ZURFp2RFkzeVhCcmJT?=
 =?utf-8?B?UFRNdy9NWDNuQ3cwZHArSUJxQ3VlT3FhQWZnaUpyOXFNTWdta2c5dFFUdWgr?=
 =?utf-8?B?U1FNRk5obHJ4cTYyMUhZVW55eWNIVWJqUlNXTTZkMkU2R0lNNjlBN2tNZ3do?=
 =?utf-8?B?Tk5vVUFleDFJTCtjRXZWNE8wQ2J1MC9GTzNxOSt4Z0g3Q3VFN2VKZWJsQ3I5?=
 =?utf-8?B?QVZOcmpYYVNHUmlOQnpSa1BIZTJxNVhsZW9Nb0VFMUI2R1hGSHkvSnkrNDN0?=
 =?utf-8?B?SUQxNi9OY1hFUVNYL3lUcUV0VmcyT0RJSEk3ZFdBZjI3bDMrcGc0RTFnNXNh?=
 =?utf-8?B?T2NUQ01od1lGZTcrYzdFNHZGRXA5RWtQMkxBK2RZUlNxRjQ0SkZDd1g5dldx?=
 =?utf-8?B?NzRRTFp5VFdwTWVub0NGcDJ2aVZHbkh6eEZoR0U5WWMrWk1EYVpkNGtEZ2tP?=
 =?utf-8?B?TG5Xb1hRWVU3VkRURHB4YjNneTJJNC9kT1A3dDB4WWJpWURCaDhCZlhEaHlt?=
 =?utf-8?B?Tm1ZazJENGN5TXYwSlhtNk9OSG0xcyt2ZmFrS2FQalhVWVRjTkxPNlhLRWJE?=
 =?utf-8?B?c1pXekZKcE5idGtRY2Z6K25RVTYzWDc1NVVqc3NvUjVpZXN0MTdqeWtzNytT?=
 =?utf-8?B?ekk4UFdIdHhOQWpoeHNZVVdmb3cyOERQck12S0tvV0t2b3lIczNidCtJeXpj?=
 =?utf-8?B?Vk5OUFJHcFVlbUFDNDYxSmh2d0IzaEp3SThOYmp6OEQ5WUN4RjFVTnBCaEpQ?=
 =?utf-8?B?NXJUb0s3UFJHVm82QWlBRld3TmFzc3NBTkpnVXJQL1NObFo4VkRGVlFqdVlP?=
 =?utf-8?B?ckRFalVFVDlzS0lYRU1IUUZ2VGxGOVRZY3ltcjhFaEZ4cnd6NC80UG05MkRv?=
 =?utf-8?B?WDhGMVlXQ3hjSXZEdHNmZFVkSk1jTnpXMXFITHd6ejlYMEJqc21zM1ROY2lp?=
 =?utf-8?B?UFRwcnB5clpUSXBBMTFqUXN2dnNSa2ViRXlpWnR4S3h6TVUyVGxTWmx6cmpM?=
 =?utf-8?B?V2QvZi9ud1JjT2ZQZEx4NmRxYjgyZXd5S3hFZGZzKytlWXhwTEdEOEJPQTlk?=
 =?utf-8?B?ZjZBNDFQbEw3WktKaGZGbTBjWDZtNWFpeS91TkNhTlJBVUNreWFqek1LWFNU?=
 =?utf-8?B?RG01OUhidVE1UmxRdGI0dHhqN2kxY2lvMVpDV0dBMHdRQkhMWFFKK05MZElK?=
 =?utf-8?Q?RsuRVh56pFLqi7XavetbBzAYgJ8K5ji6j6TOSREwxRC2X?=
X-MS-Exchange-AntiSpam-MessageData-1: ftTFZRXBFHpPKApTClwgVBdPT7oNHnSWfHc=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6321cbf1-175c-4fc8-0f30-08de84e8fb67
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 12:22:11.9905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/HGrdB2Y6tgAq+j+Z2zQqo01waGGYtRmUC7YxqKMNjbh+G6F8hdhvIXbw/Lqz0ZyiuTIqnV+6254dQbJhHcvVMop2MIZWDbyGSMsuu8big=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5830

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
namespace, it is important that we enforce the first process created is
always pid namespace init. (Note that this was done by the previous
preparational patch as a standalon useful change.) We only allow other
processes after the init sets pid_namespace->child_reaper.

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Acked-by: Andrei Vagin <avagin@google.com>
Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

--
v2: Use *_ONCE for ->child_reaper accesses atomicity, and avoid taking
task_list lock for reading it. Rebase to master, and thus remove
now excess pidns_ready variable.
v3: Separate *_ONCE change and "init is first" checks into separate
commits.
v5: Add Andrei's review tag.

Note: I didn't find anything in copy_process() around setting the
->child_reaper which can influence the pid namespace, so it looks like
the pid namespace is fully setup at the point when init sets
->child_reaper to receive more processes. Thus tasklist lock looks
excess in pidns_for_children_get()'s ->child_reaper check and it should
be safe not to have it in the corresponding check in alloc_pid()
(introduced earlier in this series).
---
 kernel/pid_namespace.c | 9 ---------
 1 file changed, 9 deletions(-)

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

