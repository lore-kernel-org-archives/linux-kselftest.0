Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023109.outbound.protection.outlook.com [52.101.83.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037AB370D51;
	Fri, 13 Mar 2026 11:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400241; cv=fail; b=bSEhaIzg+DFeAgyT6obWbKEdgrEUL6qaLXtO8J+Q4cxg5zc19Ht70qivtVMAr7idV1Us8esRDA/+GI4HHjOwG16kIkhILPJgA4OkRi5u/UzuIksfs2qRm5VW/Wg/F33oX3MFw1UQ9IA/kvz+CgGiFtywRQ+RV87K5gxM2q3b2Fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400241; c=relaxed/simple;
	bh=I4LzKJjJGM6QB3t/+r9Hrpfw+/miktV71rtx8crGOKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=idpcb/yRIjlykkMiUMA7P61jdzBDf/R9BFERqkmmtxcyK/RKEw2z2kio3b7ot+2Ihk6NeUWjzsP1CEgtdY7u19oRb9S/jxFf+mDhYH1ej64P9xdIzuAiXFcSEaPniyZZw2syYCINr1jMKXO7mIo9k4AeZUbByt5uG2Vp63oi0x4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=f3cyagMR; arc=fail smtp.client-ip=52.101.83.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="f3cyagMR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIiBeiuCcyTZmwdHxzAAeyMeaWOqWc54suzAL+A95wgsB9EMLVaoXcnmbffYIDoTcMykEdSHbwIW4ib0t/MK5UZh1tOwI8EYHY8ZFrdfeGiyXAuqj313xMzkBetfAUocx996+gE+k6qztcqh3TgG7BgPeqeExq/ce1gM60+JHFF20G6DyB8Km1AKoVcV/0ti24HaU54o37xJSM+8hhcsHW/GChRbzt8Mss9iDVaCze8gqm67ngmslnJ+VGN6Vwu7yMrL9xM70onlQIhNsCACZLQUIo18fRvyp3BBXzlRQkkJv0jADme488kQ2R8qA4pPuo3cd8YBvRIbqn8roj8yVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKPu28Rcf7AjhOJB2C8rhjFC24Bo2XHiAAL87jZaCCc=;
 b=E9bJAAQVHMTDwFwcbfI1ubhfSRLERzbbZ5Un+lcEEui6V7BxCrTCyZiGYHioX9UHKFEoPxVSXU4OUfAl5iNaL99L8XN/1Gwtz72TAqxQoB10Tk4jKN4oXma6XBz1s5ImcZudsj4ZmIZDmO8lSu+ugSd0TAGql+C49X90L4pR907MzbUeAvUz9MZLxbBqSRgYV04W8hr4A8bVRMT88S5Sstm+y8JhTZn6rBCj9OEoaeZe9vj6HL94vnF3ycwH9PSqckPTOSDarHuya4Pzma693XIRmL9c6ddhWxBRStYeXcL67u8W6SKoLEjDJDsdqDBVhEaZAwYJJKx9CTDbAlGYAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKPu28Rcf7AjhOJB2C8rhjFC24Bo2XHiAAL87jZaCCc=;
 b=f3cyagMRJeX0f6o3OiePAe1yRSMtGkYetrKdMlDCebvPVZX68t5LRdNPFjesh5WeRsrrap/iDNx6wL2riFM5rMALaIu2UjMw7BlX/TDEH6TuBVj+cLatX8VH0uIUVfloNWDujGtGcpMPbfiNjiGsfWo+AjKF3yYPpd5WgjJAPsOZEMD0b2RHb6VubLTPjJ4xXwBa2Pfe/ntkGxIv611hsdYz/wRlST0t0c68aZiF7uUj9KLhv4ZF02EuQs3r8lmjFJBO6vC12x9Kx5RnuSXbujxcAfIViPHR0aOvidK+6h7c/HILab+sRTVxQZrCpcuNIvc1PJmNVW6YFaoSw9DjJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAWPR08MB9008.eurprd08.prod.outlook.com (2603:10a6:102:341::8)
 by DB9PR08MB11361.eurprd08.prod.outlook.com (2603:10a6:10:60e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 11:10:34 +0000
Received: from PAWPR08MB9008.eurprd08.prod.outlook.com
 ([fe80::e9d0:437c:714c:396a]) by PAWPR08MB9008.eurprd08.prod.outlook.com
 ([fe80::e9d0:437c:714c:396a%5]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 11:10:33 +0000
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
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
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 3/4] pid_namespace: allow opening pid_for_children before init was created
Date: Fri, 13 Mar 2026 12:09:41 +0100
Message-ID: <20260313111014.2068913-4-ptikhomirov@virtuozzo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313111014.2068913-1-ptikhomirov@virtuozzo.com>
References: <20260313111014.2068913-1-ptikhomirov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::15) To PAWPR08MB9008.eurprd08.prod.outlook.com
 (2603:10a6:102:341::8)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWPR08MB9008:EE_|DB9PR08MB11361:EE_
X-MS-Office365-Filtering-Correlation-Id: 6154326e-ca1e-49ec-0aa0-08de80f1257e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|10070799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	DrvKeC9JoeAAXsG4sDxhdZEmCiR0TvoiU43Ra/D+2tEpQ5L/CNpneP0vviOODqpyXVyZnPOez81/yRLEbGs8cG+qF3CuH+jEDeoRIdBaGVlSL6bQHq6nScPcgXKgk5xtxF+/u0NACPSYQbMMHXI6AVdlbMw4jICNoJ66QfHr+J/QfWMLGMDCaZC1mZbjviE9ooeD2afPmiCuDUWlXQ0m86fMJVReTSsXdLmV9pboPqDBbVuVD8T7LIN4Tf3eyxhyUskpo9+Iw+1Pi6u7G0NQCp8qoqlwkLNo++p4j7fOhZrYSMeTOeheer7tFinjf4DMr+lDL+vmAzGCOqGg4pwo149Bo5scSGLHrwqIrA6vsfDkGaoxojspMu2FmRSsM4YciSlfn8EmOE7gj2pgyx+QmOvkFvlcZL+wGhVR4YbrncWai3GzR5+dNaxI8SEZbcEdHL33/lAAJWCbC+VrxxkW1B3dBKDtz7Sh3h5MzzGjpzxCVOlPLKINfgPPs6kr/HU7WJKt2P4/0qkgBy6bKT8kGyREoGiQMcKIrvYAM1Mn+CtyT6+1qbrwV6TL2z9xBdSdoUBlKZHpOX9bUd1GLPtyLJwrEwt5KGU65CWvLFmxx3BuXMi6yYYJNx78vOA5XpPybx1nmwhnzhl5N/bcNex+RUBgdkOuAI40Rj9esfTQuULqpuMAor/nNA10sZTUyQiUvGoju1qsoKERe9zWiQEQ6+HlDfX0/Y91gXh6FAxXRak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9008.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(10070799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0QrY0tqZjNmLzZqU25qMFc5bUk5L1pYNG1QVHlVOVhlcld4RHY5Zkh3SXZ0?=
 =?utf-8?B?eWJVYS9vOVMva09rRk8ybjRlbTZqbVFsTEwrQW8xa3dxbTVjbjFHUnRTNFNj?=
 =?utf-8?B?eWRkbjh5WWZEMjVld3M5WS9yOXBVSzBnVVg1S1M2b1JCMHBPQ2NRbTAvUHp2?=
 =?utf-8?B?czFaWHlLY2pkRFg2OEVuM0pObkhwS2c4S0dXaVpQdDgvbDcvaUxLRjNqYmo4?=
 =?utf-8?B?MElKOHcxcE5IVHJ0YUhtRy8rUXlYb0V3R1BTc1EwVXdVVlREckVlcEFoOHZU?=
 =?utf-8?B?UmVGbGdwYk1aREt5S2Q4ZzlCdTFMU0J6dVRua2R1Q25OY2pETVNQazZwRUhJ?=
 =?utf-8?B?UE5sQUpLZ0tPNVgrc1NwZ1dMZmVuZVlLNDFhakNsMy9CemZkeDZrYXdBK1Ru?=
 =?utf-8?B?U29sM3U1SkpCNDRDdEJJSUdxZjJOUXUwSzhJcHVXZzcyTUdCK3A4N3VPeXY5?=
 =?utf-8?B?eDlTVzdTOUw0UjVwcWo0RXc0VHR3bVQxaWY4ZXZYVzVqSVhuUVRJMExlVVRv?=
 =?utf-8?B?ZnBRd2tiajllVkJmWTc3Vmd1N3JGSWh6RkFYR1JTZ0dvYUdwZ3haYzd6QjlF?=
 =?utf-8?B?UE9PTjBsL2NLMXVHeGEvNkxpY2J6UjN6cE9BRlBtcm4zbWRaV3B6eGlJdUdM?=
 =?utf-8?B?TzRKNzFpMEZta3FoWVhiUWFqVjN0UlRCQ1FlNy8zdzNEWFIyVmptL3ZrczRX?=
 =?utf-8?B?R1djbVV1dW4wVmdqQlB1SHo5S09wcUxnNmMyTjlMQzZmd25tL0QyUWZXK0NP?=
 =?utf-8?B?OG1VcTRYcDN3ZEJmeEZEQUViQWQwcFF2MW5HWk1UcGxBVSt6QjhmSi8xWEtD?=
 =?utf-8?B?M2tPNkVVMGVrcUJBZ2xZeFRPeGM1TDl4MEJDeG9PUlVtZVRnRHlrL3lHc3Qx?=
 =?utf-8?B?d2R3cDFNdXdhVXhtVlRnWXQya0N6YUsrcmZ1MmNnc2lFTFZrZmMrZWFEMlJE?=
 =?utf-8?B?V3gzTzM2enpSMGJiamdNY2tLbmExelhERjdwemlNdmpOZWRmQ3JyS3pRdW9w?=
 =?utf-8?B?VlA2ZHJJbmxFdUhXT044eXNtaU5sL0JMd2VyREpSM3dnYVF3OStmK2hSbnVX?=
 =?utf-8?B?UThDcDQwb0Q5Y0RVUDM5bXhjM2puVi91Y0FudzQ5WFRLVHRxWUZpVXBqNTln?=
 =?utf-8?B?OUpEaXpoVHI3blNuQi83dzQxb0FvYTNxS3ZTQktyK3VoZi9mYTh3SUlCTFdl?=
 =?utf-8?B?MFFsYStVang0WWI0dHc3K0l4bW9TN1J2SEFxa2hEcm0zWEI5alpud05hYlor?=
 =?utf-8?B?bEJLNGYwalJTdVJGVTNDN1hwQ2dxaFNORi9ERktLNTZmUzhLMzZMcWtsemoz?=
 =?utf-8?B?dkdWckVoclJVdFFnWXFXT2lQRlFZYXN3YUlWeSt2Y3pROFpMY0RUdTB4bm92?=
 =?utf-8?B?a3lpNGp3Nk4rR1cxdUNiTjN0eGxzaCt3VjAxYW1SVUgxRmVSTmdwZ0s1ajFo?=
 =?utf-8?B?MlBndTRoTkFxb0xhWVFRVEF2N0pKeVRFNVF2T2M0RG9HblAvcS84bWlMZEJK?=
 =?utf-8?B?Z1RTSkhzSTg1TzBaUEFYK2xlYlRJZG53aENLdE93Z29ZdEhuMUZzZkxUdDBH?=
 =?utf-8?B?dVFrb2x1OFFJWW9iMnUybjVtbDBsMld1dnorZVRRQW5NQm04aHI1bHE1Rmkz?=
 =?utf-8?B?NjVCamdST04zNlF0aGR5WkptUXlVRkZOcmU1T0VNNXo4Y3hpeFBaR09Kd090?=
 =?utf-8?B?TUtySE1QZExkMEhSdGgvSzNJTy9tVmlYSm1vZjZvckpUU0lnNFJZN1ZNNHFa?=
 =?utf-8?B?NVlhTTNnQnFrNTZ2aHA0Z1ZNOXJXTkFZd29HQjRqVW5QbExSb0lOTkl5UFQr?=
 =?utf-8?B?UVVDYkZKTmkvTllXU0VqSGs5NU1tNVJCTk1CenJXYUV5VDRGMzI3MnlUWnNN?=
 =?utf-8?B?Lzd2Zmh2aUlWUFFlNWF0L2ZGVUsvcFcxYUtNQ2EwKzBMRkFnRlJhRDJZbUJU?=
 =?utf-8?B?QzJ2alVmRmdZZ005b2I0OXZWM2I2NWY2Q2VnN1pXMGZoU2lTdzgzNjgwNFhw?=
 =?utf-8?B?SXRCMXJzWWp0OGVBZlV4cy9Nb0FWZWcvWnpuN3dZS1hxSWdnRnlwbXZrb2R4?=
 =?utf-8?B?SFZlSS9Uc2Q5SXUwanJzOElDWml3QWJ3bS9HVW9YaHR6NmFJd3hPc3hsVGR0?=
 =?utf-8?B?eVNRSFlYempRbmJvNW9RdHhrTHdEcElkcEsxZ0cvZmR2MStkbHJ1UzNzaU1O?=
 =?utf-8?B?ZmxwOWkxOWRBNWxMdVpnZWs3eFUwbDNKUlNsaTUzSDFkeG8xeHFYaGpEMjRY?=
 =?utf-8?B?MHMyT0lDYy9RN0tHVUFRMmVkZS9EckdhbWNyTWVEL1JaSS9IQU85dHkrVG9V?=
 =?utf-8?B?U2pvWkh5MEx0QlRGdkxKekVUNGNHb3dacUVIejR3UGU3MFhhVlhidmZSemtI?=
 =?utf-8?Q?fXjI0/KyEKfW3RzXaWMH+tMSeFwALVKtMWETp5CYLmn2w?=
X-MS-Exchange-AntiSpam-MessageData-1: G3DK10d5AQL5F6PO171+G2WeBDtoPZiN90Q=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6154326e-ca1e-49ec-0aa0-08de80f1257e
X-MS-Exchange-CrossTenant-AuthSource: PAWPR08MB9008.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:10:33.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxXQidNByWeK5C7SOlIlXTTGAcJ8yvki0NM1ZpvTgxXQtQz2+RZArT9h6iRBVBlxsoZuyAl2CnH9hWVGvDyTdk4t1Pjp3EyWSWIg3wvNc/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11361

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

