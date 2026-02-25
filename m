Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020141.outbound.protection.outlook.com [52.101.69.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC703B9609;
	Wed, 25 Feb 2026 13:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026389; cv=fail; b=noQF5laCdClrS7zk72/oDHPJGGB+F84sJQxyYUMYEabdWNkU3oIt441PYdJY7KbJFxO83t/pMEmV2TcW1JQjMxH2idMBr+Y9xMewEOlca/M3a1YuMQ2reqxgVzON64XJo2dUpc63dbeZn4wwQAUXvUyp9BVFbEY4kug85nVpHxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026389; c=relaxed/simple;
	bh=eWDbkBMSZe0NiaUeCviTuvtGZjTrLlGR79XHiuJp5R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qc5wwoPgiZVQjemuQ0rvFQAglolg0BMtJ/FekKVPlCnem/hMnOPSglBrL2HRAm1tvBKnNNMRBnbn4ZgQduZvZ8M17gZZezHJx1t/cc/RXeb8mm4oyxEhC4MxQj8BvQi1yfyBWDkh9oSbyPkGcLyVI3QJYqFYwns+gzj/Chw/pJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=GsxECrUj; arc=fail smtp.client-ip=52.101.69.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="GsxECrUj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kv8M9PP+tyB7W91h2hLE8qYXyZ8YVjieay+UWO6TO8SckjdFmCv+xT8elwkpHTQkoJzScNKnRYtL5C5T+HbNo9Oirfod0RT3q5tYrF7QoOU3Yc2lUvAYq4GorbiLfLuh1+WlZZ1b/RjCrwPi6jpjHyhKHAAgZaxFQTGewCo/ddIr74JHVbZ5X/1CRjInwG3JU1qBG5B2/ECF231Jeq1harCoRvrrH2nXbPX+s/jfKLHKmcBCbbW1M5zZqZvAxNK/dpZN+Kzd0lanFzNvhVZ9LDdVKf1SCUTif27E1cgvKhdtzcEARbs0gah2BWizuJphHL5X+IQIYMBax0xSzzTivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POLExnsUEalhbItmj5YvWdue5B/3ZYsqn8G8E9M9K1U=;
 b=VsGsT+fSB2Wp9RGk5rqMVPs23HwkUbhFln1G4DG4suW8HDpVr1oRra/m9XQmbCYE0VIpHa24B6X90HMwshV5T+rPPudDBZi8EGuWcTNDGaiLVjKS5pbF59nr0puQpq5l/yQsu3Vx+qWF3v4cUYqBCxgb4a2KUpLnpB9jlc0BbUwomibuOJG4XSBA8zuzNoo65v22hH/bnVtsMLRqrnRXd5x/8Pap2XcvmnYWOXbrcr9H7CCJR7pWWTDpJeC6+8v4buLhkx90LorCWQJla6nUNYi6gFP1iUyPAV1ivbf3/fOiaf0AIiIwTDopfsRpQzwRQBpf2RQCQLEE4zbCU6tVyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POLExnsUEalhbItmj5YvWdue5B/3ZYsqn8G8E9M9K1U=;
 b=GsxECrUjRYhkxUHCxFDJqxcXClGys6L2/nDTNQpHMP5ysRQLAil4ll6e51/iIMtANpZWBLtP++5yBw9hhnLKM55aZrQtdCmfL2jXSb8/ODwi+Pa5IghOJDXBwRjUh2I5eAUNjB6KEpM/0qugUtoSntKsodVtKKhbAVoOgTG2yU4dkynb0d2rP9rhFnTviwKQOUBG+sQGrD5jtQm596Sh11qtrykozKJETUp614qcwuep2sddo5VCtK3A+JvshpCmZKcfmC5wx/MOeHOe3zNzTxXMKPd+Dan8vguzJucWeART0mU7OuF8kJyG92TQfhqeaFdm3coECdWBq9qo3wQ6eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by GVXPR08MB11715.eurprd08.prod.outlook.com (2603:10a6:150:317::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 13:32:56 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 13:32:56 +0000
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
Subject: [PATCH v4 3/4] pid_namespace: allow opening pid_for_children before init was created
Date: Wed, 25 Feb 2026 14:32:25 +0100
Message-ID: <20260225133229.550302-4-ptikhomirov@virtuozzo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225133229.550302-1-ptikhomirov@virtuozzo.com>
References: <20260225133229.550302-1-ptikhomirov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0277.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::18) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|GVXPR08MB11715:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d54bffd-35fe-48fa-bace-08de747262c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	gmPiahBZDo+hcgriz0jJK8c6R4ZcHFpgaCjeh5+YIpChbdVGvqQM558PExP2pKBWW5V+Qkpo3aDb3W3GhmB1QWYbOXYjlEYc1vUKI7WGVEdnZ4Ne/6UqRkz67As4/7pSUJ4HVl6jlQpdvvE0B1y8kO0PfTfUmsvDtTvCxSNVk541KSzqrTOYaL3eL83Hr8jLL0XVqgNfnEuKgcn40IWDElzK5HDwRUqpoy3+UdfoJsQvZ9RDvQMK1hmyVmrG7KWNmLZgCzJv8XjYcFocIpaw9ZleFpl/Q7bBqLktlKCRxg19Gn1nhFSdoTKj/I5PL4fcw2DxHhsQr64dvQL06ODSJfeMV1yLG3BVzInOtcWJeNi5QoBIcZdl0yiQUtSR2KpS9s5lbzSSo/YuqAvtnOI/LOalg7s/04at6rdLFL3cTKSgRAuBLaygD/uTy7p/m4m66Z3os1YInfLoEJGFPbFaLUdbFCaL3o2UjxBWVX3FDHuDDzJMFyIkPmi6htoUn4pg5t2TdaC9hKHVcAJM8+XUHoFeVbQOZCyD5xLxV/R6kw1g038K6oGqKwaat2fBd1Mr/kTlpG7w8npvH5zjLoIb9tSQHWWMt2Bju+wRZwZ4CLNyiZkbJPjkNgXBEydQgwGEWxSOKAfalurzMwmjDLIBC1QuLsIKaLiSRPhrdzilYAndapcsoavrE2aTDcRN9rdpVDITnek3RvowU4fmqPXI/vJtIoiE2IcOqDpY+Pf0gYA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUlUck50UENUR3lzc0JnWkFENFQxVFpCSnJKWXFURUU2Qk8xOGRmV25RdkFo?=
 =?utf-8?B?L1JzbkhBQ0hIb3dpT1h4L2JDUVBaVklQTE1sUnY5VUQ3NVM2ejBsZStyMHdj?=
 =?utf-8?B?bnp4T096YVBVWkJzWkxtTXFTVXl2ellwRXdJL2NGVU1pcWgvVVZtOStjemt3?=
 =?utf-8?B?eDYxeFJ0Q2MwUk85K0dWd0JxNFRTMGNIclRPR0txUlhnQnlDazR1TzdWekhF?=
 =?utf-8?B?Y0JKT0xvVkkzNXRWU3cweVc2WTJHdzR4NHRzSFdsSCtCUDE2aE5kMW1VT05Y?=
 =?utf-8?B?TzRNeGhLSkJOWWFVSlQ4OWFZeVFGd2VXOXhGRkIyQzNPVUd1VElHUU1iRFJT?=
 =?utf-8?B?TVRiY01jSjNqVWRVRitxWDVjdnFPUUVUY29rWmJBNFlubTlXb2hjQUZGRk9R?=
 =?utf-8?B?bGVlSjdFa2tMVW9TVklUaUhuUll3K1ZqSFl0MmYxOTRkT3JIbFBCaitRQ05Z?=
 =?utf-8?B?ZWpCN1diaU1GRU5PTmtuUzYrYjk1R014VE5oaFY0MHkvbGlFc3dVV1VadDA0?=
 =?utf-8?B?a0F5L0FhWGF5dG04bjZhTUlma292dDZ0U0FxaW94a1BCbTBGUEpQR0drb3hN?=
 =?utf-8?B?VUpTL2NvbnBpNzlITm1zcTVJZ3hFTFJWN0RrT3ZCd2lLZU9yaHkvZ3ZOaXFq?=
 =?utf-8?B?TTB5N3lwMFRxektzRldaR2szV3dMYjU4R3h1Vk1HK1lZQTRtZURBS3E4b203?=
 =?utf-8?B?YldvLzRXY1B1N3lmN0NJcjRSb2M5bUdkY1JXT1VrQ3JVWDVhSWZveUVpU2J0?=
 =?utf-8?B?WGwzWmFqK01uZ3VHb0ZNOTg1aXM0OVlsdEFHY2N2b1JpOFk5T2Z5T3Flc2NL?=
 =?utf-8?B?STIrajF2cnQ2Und4RnRwVTZseS8wQ2tHQmwzclFNSzltOHpldHVDeHpJQlYw?=
 =?utf-8?B?RVZZWFo2N3ZYRVZJYXRGVXBTTE9WK0swVnpjQ0dCUzd6dktpaDRpR2tIdlp0?=
 =?utf-8?B?Q1VhK3REMEZScXBYUDl6ZmhiK3F3dFZwOWRMUnBpSmYzcjZDK3lUdTVzMmFl?=
 =?utf-8?B?enRHcFpqWmRYY21Ia1I2RDFDWUJMSEVDWUNwMS8xdnlOcjVSKzdPNkZTSVpn?=
 =?utf-8?B?YjErRVN4RFViS0lXeUhQRVYyN2JWUWFSTWNPN1BNbVl5YUFyemtTanEyVWlL?=
 =?utf-8?B?UEF0dVk4Q3ZSb3JQUkFlWkZ3VExmc1FrR29aYVhkaEFFUFRmVGx2RExJNkpT?=
 =?utf-8?B?WVpibE1RclhFWXYyNnZQWlBNcmtrQnF1SVR6ODRua1MxTy9oS1VBRUJvdlJq?=
 =?utf-8?B?WVdTK0hiOHdrK0dqdnBmcENxZTJyZEhFeXRNTFc3eTgzSnZKWEp0eVVNMk9s?=
 =?utf-8?B?UzVvanJoTHB3V2hTeWlPWGxnT01rTkdUd0I1OVJpbEpQSjg2dk5FWEhvOUti?=
 =?utf-8?B?NE9GWEJaQjNyTnlVaEdYbWxwSVhaSEk1VWk4aVJRdHRGN3BpaEZFYkVnVWFs?=
 =?utf-8?B?R1ZXUGkxU1dKTkxMUUFYZ3ZJakhrbHBiRVdESzJIT3d3d2VBeUtDVHBLTytM?=
 =?utf-8?B?RVROa1hXYlpyOU1WaUIzSzRzMmwyK2YwNDZvbXlyN1Y2NXNoN2xEeWFLVjMr?=
 =?utf-8?B?eW1ubERsWnVJUVpyZHJ0WXdXS1RxcGYyWE9sa015NU1ybTlOQVJCRGpvT28r?=
 =?utf-8?B?Ty9MSy9pOGlqUXZoTHd3Q0gveFc0TDNPYVZ5Um5FbWtkcEZmUnZVc1ZQYlNR?=
 =?utf-8?B?MWxmV2dwc2V5U0xEMTI0dGJLbVp2UEJ5ZTVLNHNSUzYwTllzYy94eVk4N05m?=
 =?utf-8?B?MHllSW1acXFRaERZNGQ3Z0hUOEhaNk9VZW9EamZ3TnUxSHBuSjU3MUZRMlcx?=
 =?utf-8?B?TWt4YzExckN3aDNpYjcvVDB2eU5JRUIvQ3RvemF1WVhKUnFnVmVXdU53U3Rk?=
 =?utf-8?B?SXdCMVgzMWN4WVBJZ05zMUNieXVWd2xDRE11NnRGTUlqcHRQQ0tRUWoyNzBN?=
 =?utf-8?B?eTRBamNINjBMV0dWQll6TDVyN3R4SFVDTHc0OWVDRjFNckllT1BkWmtvK2Vl?=
 =?utf-8?B?dDF2czdwREp1ZGNGK0Y4M3ZtOEVWVkdlRi9ydWpvL2c3bTFPcnpsUXZUT3Qw?=
 =?utf-8?B?eFNIQUdOa1BlemxsVU9xSGF3WVFLeVFRUzdvWjc4M3RIRm5sZDZmRmhXT3FH?=
 =?utf-8?B?OFVTSCswdG40aTJTNmlHb2plS013TjBKK0FEb3U1SmVqcHBzaThRSG1VZnY5?=
 =?utf-8?B?cnBOYUhwU05heHZLT1Jvcmx2azlRWVV6d1JqeTJ1Q1BEM2kwdHlHQ0lVRW54?=
 =?utf-8?B?bDRGempaS3hSVWU4eERwc25tM2N1U2pwcGNJRFB2aEpIK3lFb3AzUVZXL0RN?=
 =?utf-8?B?UlVBdkMzaUpPQjdUcWI5eVc2YzgrNFZNQmZjTk1CUUdMeVNUVHduV25TWVFF?=
 =?utf-8?Q?gXMIKrjUDLT4afw4+CqSL7o14O1KV6t/cC1gA8xA7qALE?=
X-MS-Exchange-AntiSpam-MessageData-1: BdRDZ6Bnicohzz01vUlU4erd6Mqr19TvYaE=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d54bffd-35fe-48fa-bace-08de747262c9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:32:56.7123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EF2CtdowGzJgYyiscZfzrdS25IOr22v796Zd06C7C5mnfMLHMnUdkJzCWAlfjQ7bA8xQfH/VFnl1uD6V+waaXS+hWuc4Mli0+6LJaxC7Wo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11715

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
Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

--
v2: Use *_ONCE for ->child_reaper accesses atomicity, and avoid taking
task_list lock for reading it. Rebase to master, and thus remove
now excess pidns_ready variable.
v3: Separate *_ONCE change and "init is first" checks into separate
commits.

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

