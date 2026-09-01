Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010067.outbound.protection.outlook.com [52.101.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C16D40EB9C;
	Tue,  1 Sep 2026 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274572; cv=fail; b=bllKbY0uTyDtFHB/4URO6JtdpefkimzhtAWGEiVrXp8u/HylXY7W38hTGiLwAOFVHfpj5YDJvM2/wYEzEnDYbbvkjsbxnBNmueFgpKgZX1uCatNTuTnalZi8dZ8dVaIpAGrWKZVHYZGlDJFv6BTy1EeVhNJExTdoYgSSOUW2Pk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274572; c=relaxed/simple;
	bh=LKBq36/+PDCWvMe6IT0BzdnMsK3Hw0gCaDr+Fjqvrmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f3MJJ7PaPl2IVBhmmqbuVfFxhlx0Z5B4qg1+Sbzmvz/iU6ahwjqSlXTHaunML7I6HUa7J1Is2AhnXDLGD3A7SNSqbttpY8zOP7dA09aALgEeQNOGWUIVGUe8e6bZiUeLcsQ5BcV2z283zKUmPoFT3p0cMnCRYumkZ9BMeomELdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OeqSg6IA; arc=fail smtp.client-ip=52.101.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OeqSg6IA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cztlE7uIoqwib8ltO8tr8ukeCKnlDEc9NFbJiyABINDsIs+UxbBTBIUh6pVYkF2eP7kTyvcvFV6c1Rmc32FP12p+94E9lHU2hE0/3cnVNXqEn3WWqmS2iDmC6r42lYMdWGt1MnIwiSBw/u4T2jcbJjx8HAPIIDCoOuHamPhBdwno0tZjakOV/0VhpWAi5o28+4ZNNVO0JQRsmSdLQLUQkmxNgBi26NkvH5BGMuQQ5KraQ0hbBRVHDsEjmByp4eOEKo24VtWIeULISIzFMb4oVuy8mKZQuSqL3woWigBCgYKm0NQgnf3SaiLR4Fii91cCaDZWWaCKyPkAY9FX5pU0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WLiL3L/uAHwPeceLyatZkiCozgXr4TnmOu0zgR0uE4=;
 b=E297rl8obO+EYd8gZ/4E7Y2ILZS6YiKxVsWgrbU7+EUFi31b96ErS78WY5UfVvNpcbUCtHOOSi6tzNsPCU5d9Z1JNSEaPbvVgrlph+ai9ZHJY3RKQFcElqIsH+67oIjG9pnlA4T8D4zuMKcFjgnAZ5MQoKt3xoruGxfabn4VPeT5UpvWYJIh/xt4q9lR52JPoorVH39sOAAfb9l+mrCTMxoVEpYc6YMlyScaIGFZULALTu6DxBWFSJSxzJyIacN9wJTAKU9OwXP2t/hPpkNcILSZBKKHjfqyx5H6CNcrIxnPXlYAyKe1AzoNx2WqZinufdBFRvAfDOo08M5TpRmFgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WLiL3L/uAHwPeceLyatZkiCozgXr4TnmOu0zgR0uE4=;
 b=OeqSg6IAJsccbULYFdxUqazEAIAVTPyQj2QlqjhJRLGvx/1ASJP10I39V5lMMyv33lTd7UvYf/uBkwZFTxOLbM9QErDtzop46m3vx9h/h6/Bc8ldMeNGK7TjHiM9zGZ4Ad/v2DZbb1p/Kswtt6tw3+YULzocN6radWOZJtyjHMGLGy2vwlOLl+hFYgFFNZrSszmg/7bwDYcKFIadXi0csFNotx/X9xaF9t5B0LXQSlCsQ7+0o952ZU3+nv8CBXdFPwSEnJdLqyljyUvO5avvA+Emaix9kp6JdFlnYGO0eV2cZo3H7ytLJuQIEy+Ehoc5i0O4xzHAzCtW3QehmWd5Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by DM4PR12MB6400.namprd12.prod.outlook.com (2603:10b6:8:b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Tue, 1 Sep 2026 14:56:06 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 14:56:06 +0000
Date: Tue, 1 Sep 2026 17:55:55 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: qotmddnjs <qotmddnjs@ajou.ac.kr>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, dsahern@kernel.org,
	shuah@kernel.org, horms@kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] vxlan: reject dynamic fdb entries that reference
 a nexthop id
Message-ID: <20260901145555.GA3547795@shredder>
References: <20260901120740.105374-1-qotmddnjs@ajou.ac.kr>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260901120740.105374-1-qotmddnjs@ajou.ac.kr>
X-ClientProxiedBy: FR2P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::10) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|DM4PR12MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: c0503b0c-3816-42d8-22be-08df08392660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|10067099003|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QzIdTkYyaj5K4qN8/5+pLNo51Sh3kSCStitkDTYhrftB6nHM5CB9/1sPNOGX6EvFuG56VX6wf3190BNjNThUq5bHfQZc4fOKgEbzkzXhGDIVrS23bFQshwM76tNh/bOTM+u0iFfkzSTsoOpcAHJuHKFztPhAxBk84dOg47vA/iyXi8Ob3eEShwiv+jxKIoD9BRpMHXbN1YIwMH7JOBTcIdkEP2HXwimPoiRas81Dhd3IWZXlPnNRTJAdSJ4ZFAaYh3/MQKuB4lJiL8EfkRezeiHBRLJ0+QEplSqzPeNH7+aY1Hz3u0rIGzLKVR8V05tQMByScr4cgqOQQKA9UiKGVwiaZLMkE3wlA/TUEWMtYQbQTdtnIsO+PqAN8wgHiSbBpNn7XKu6b63LK8vpH2bQot5XTuzqqF28fJiDbN8vbf99VmLyaV1EA7Vtfrd2ZYp+oMh4NKhUtHOIe+UlbPIpqMGmTQ4khFHkd6px84+L35a7ZWyjcvSZ7kGhGywi9yrGhnZeDgQrlWLqYVfNLNNjco91/M3FyCIMYrI8SwBCkWRXcLPe3sjjHQqrRhbHEn6SwcdmWpTU8oW7+3CkC40sGMGiTByGDIgGIw6VHpMkYPNEgAe2rRePP3hMzLRCBc30rVvjtQKRyG+rB/10Ckumc4D+9Tn0cn08PZ/Je+Tggzc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(10067099003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjYvYXNRK1JwWjRZckhlczNweVFJem9IT211NUZ4KzRKL3pNRThIQ2xUOGV6?=
 =?utf-8?B?SlF3YnpxYlhtbng4VkRhcXo3Q3VPeDBzenI3N3BlMkk2TWluMW96Wm5iak9U?=
 =?utf-8?B?eklkUlI4aUtiaE9scjhHUWp4Q0hOZ085NXhxZ25sMGkxU2E5U1o4alZmaDJF?=
 =?utf-8?B?WHVtbUVIeFpMNlpMQWd0QkR1aUVVUzFNRkg2M2JmU1ZxZTdwOWhaMHNRTnhQ?=
 =?utf-8?B?cUU4aFp1ZUZnUk1DdnF1ODNYWDVkVVFJR3pid0R0aXVuSHJsZXBob0hqK2Fz?=
 =?utf-8?B?bjRMZjJPTHRVQlN3TUIveVhSMUkvckRVQ3JDM1J1Q1V3RjdZUjJBQnBTQ0RG?=
 =?utf-8?B?eWRWRnJ4MUNZS2h6ZkNJaUFaSmV2Q2lIcTJ5dGNFbEs1YVBxMDdnZG1OVEtS?=
 =?utf-8?B?eXN2WXkzWXRvdWo5SEtlelNUQ2hvRmxwaEdMVXBPYnp2R0JZOWlhM3JGNmo3?=
 =?utf-8?B?emVibnZxVzBKOWZXQ09YMElsU2ZhYzFuL2ROVjJuN0o4YkRyTWhIbTNzS0d5?=
 =?utf-8?B?OFltT3l2ZjFOVVBHUUZWdmQ4WXpkSkVnQXdhWmlLZG83WE8rUDhNSGJQM2lM?=
 =?utf-8?B?dkVhZVJvMzVWQ0F0TGVNaXg5OTBHVVFRK2hXYXZlaktJSUJlTXpPa2hYZjYw?=
 =?utf-8?B?MzZqVnI3SzVKdDI0ZWQ1cTJsYVhHNUJ1RGRjdDdDUlhsVmNzcnZTMnNLZXRQ?=
 =?utf-8?B?a0hDY29tVnVYblN2c3lmWHMrY2VqSXpvcWszWjl3SUpEK3AwSU12SWdaMHhQ?=
 =?utf-8?B?eTJ2bTh1K2IwaVplWmRheHFDcnFmdittUlMvRXJtZ0tpeWNDWTFvckkzSjJl?=
 =?utf-8?B?M0dpWXVNemlmTUhHamhJNytHejgxVjNzK3lmN0t0STkwQUJQRmVZa25SVERu?=
 =?utf-8?B?WVRmcVc0TTdqeUJ1WS96bVF0TGFBRzhiYkI1NGdJNGlmTisybEMycWxqZmZu?=
 =?utf-8?B?bjdVNzcvZjd0UExVSDlsS2w3TEtCSXByNElzNDhRenQyOW1FRWh4VTlqbWJZ?=
 =?utf-8?B?d3ZmZzFZeVFDZWFFMFdNanFWRGlnOXRNbkRvT3lXbmd0ZHlTWVN1Z1BiR0gv?=
 =?utf-8?B?OTFwTXFKYkorRzdEV3FCNnFqQ3JRTHJnUmNLWms2SHpxYjJuaXQxY2xuTzJB?=
 =?utf-8?B?NmNEaE4zaUF3cVVDZ0QwU3hpb2hpeWM5a2Q3d1dIWm1WbW1HVG9NY01iN0xa?=
 =?utf-8?B?eWJXdVZIN2lTdExOREc4M3dIZERwSUF1RlczYUpkNEY0UmErVW1hOEx6SGNY?=
 =?utf-8?B?R1FKNUF0aHFMTkd2MmhJVWhaRURoN3FSYkljaXFYRTdhcDBZVG85R2VpYUtt?=
 =?utf-8?B?MStrVDBjNStGT1o5c0srcjFKK3NucDIyUG1lS1NXdHZ3c0Z3S3djOWs4a0E1?=
 =?utf-8?B?YVR1Z3lwV0phNnpoSkNLZDRld0hTd1ZKQ0JtcU02eWJMR2JTMklPd2tKR3Nz?=
 =?utf-8?B?SG1ROE8vYWJMOWhrVnlvYnAveGdqYXQzaFFibFgvOGk1cFloTFZKVmtmaWtv?=
 =?utf-8?B?ZXVPcGJ1Um1wcHdYWGxBeGc2MDRLSzlRMDFQY2ZGVE5tYjRTWjRpYklvc0tE?=
 =?utf-8?B?T0YyVE9NOURZN2ZpVUZ1bXlPOTFzZjcyL1F0V3RQQURJRmk3UHpneHhEb1U1?=
 =?utf-8?B?MHVpMFc1NEtvcVZ2SDdGdStvTXNaamw4OXFTbW9CU211WThzQzNhcFJlMGdE?=
 =?utf-8?B?ZUFCNEd3TlI4L1BtUTA3cDFYV1N6QUJHdXkrZnVhMDk0aktqaE9zR09IY2FJ?=
 =?utf-8?B?eXEyTUFDSTNoaHhsMk9TNEdwUGI3dkFrdGpuWWgzcEs3K0JKMStnL0tzOFZo?=
 =?utf-8?B?dTdZY0taQ3JPLzdQbUdvdm9WclB0diszeDBVOW1qMzhxTjdydVlXMmdKNU5T?=
 =?utf-8?B?dUVKdmJTaW4rTTJybksrenh0Tnh3Vi81dFluM05icFBvcUhnTnpnTGVOSXBk?=
 =?utf-8?B?TDkweFhLQzRjNnJ5Sm5tTzZ3dmtaYTBOVXZrTWNSU0ZGc1RNYjRwbkhyZzJW?=
 =?utf-8?B?ZmNPMlQyVFB2RzVMOTJnTlRNMmFGSW1RNUVoYjc0YWhNWkFNcHJYZDBiWnh5?=
 =?utf-8?B?blVjczJ3M0wwZVlnbHFTMlJIUjN3T05lTmQyd2trdENtZGlzbzlzVDR4MHZl?=
 =?utf-8?B?eWlSTWhSRlVaUS92R1FucGMxWWtBZUZUdFVYQytsK3dxUnJiQzhSZjc4QW5P?=
 =?utf-8?B?VmhFenBFU0h5VDdiakdEYzRWUEhBbTFtNCtkYlhGa0FqQ0d5aStDOW45VkRu?=
 =?utf-8?B?RHdZR3hoYTJBbHgxc0VvV01vUk1Ha1hmOFNCTWF1bWVGVlNVa1BJbDZXQnZh?=
 =?utf-8?B?Um1tNVBzaXF3cFdQVFhTTUZYbnc2MHNkeU9lWU1XRkk5bCtDOXY5dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0503b0c-3816-42d8-22be-08df08392660
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 14:56:06.1991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSbDz8z5DmWJIUAkusgneyY0S0neMSKYWfanaXKAhErGKBG/ETs+14ZJrMNc31l8r+cXa97JCw1yM2c5ePvjXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6400

I don't understand.

v1 was submitted at 5:02 UTC. I replied at 11:36 UTC asking:

"Please read [2] and run [3] and [4] on v2 and future submissions"

Where the fourth line in [2] is "don’t repost your patches within one
24h period".

31 minutes after my reply you posted v2. So, did you ignore everything I
wrote and just took the diff?

[2] https://docs.kernel.org/next/process/maintainer-netdev.html

On Tue, Sep 01, 2026 at 09:07:40PM +0900, qotmddnjs wrote:
> From: Seungwon Bae <qotmddnjs@ajou.ac.kr>
> 
> An fdb entry that references a nexthop id cannot roam and therefore has no
> reason to be aged out, even though vxlan_snoop() keeps refreshing its
> timestamp.  Nevertheless, such an entry can currently be created (or an
> existing nexthop entry updated) with a dynamic state, which places it on
> the aging list.
> 
> struct nexthop.fdb_list is a per-nexthop global list of the vxlan fdb
> entries that reference an fdb-nexthop.  It is manipulated by vxlan under
> the per-device vxlan->hash_lock only.  When two vxlan devices reference the
> same fdb-nexthop, their entries share one nh->fdb_list, but each device
> takes only its own hash_lock.  vxlan_cleanup() - the aging timer - then
> runs in softirq with only its device's hash_lock and calls
> vxlan_fdb_destroy() -> list_del_rcu(&f->nh_list), racing a concurrent
> list_add_tail_rcu()/list_del_rcu() driven from the other device.  The
> shared list is corrupted and a freed struct vxlan_fdb is left linked on
> nh->fdb_list, a use-after-free later consumed by vxlan_fdb_nh_flush().
> 
> On CONFIG_DEBUG_LIST/KASAN this reproduces as:
> 
>   list_del corruption. next->prev should be ..., but was dead000000000122.
>   __list_del_entry_valid_or_report <- vxlan_fdb_destroy <- vxlan_cleanup
>   <- run_timer_softirq
>   BUG: KASAN: slab-use-after-free in vxlan_fdb_destroy
> 
> Since a nexthop fdb entry must not be aged out in the first place, reject
> making it dynamic, both when it is created and when an existing entry is
> updated.  vxlan_cleanup() skips NUD_PERMANENT/NUD_NOARP entries, so this
> guarantees nexthop fdb entries are never touched by the softirq aging
> path, and nh->fdb_list ends up manipulated under RTNL only, removing the
> race entirely.
> 
> Extend the vxlan fdb-nexthop selftests to cover the rejection on add,
> replace and append.
> 
> Verified with a KASAN + CONFIG_DEBUG_LIST kernel and an unprivileged
> (userns+netns) reproducer that previously ran two vxlan devices churning
> dynamic add + aging-delete on a shared fdb-nexthop: before the change the
> dynamic nexthop adds succeed and produce hundreds of list_del corruptions
> plus a slab-use-after-free; after the change the adds are rejected with
> -EINVAL and the run is clean (0 corruptions, 0 KASAN reports).

The commit message needs to better explain why it's safe to prevent
dynamic FDB entries from pointing to FDB nexthops. Something like:

"Cited commit in the Fixes tag allowed VXLAN FDB entries to point to FDB
nexthops so that overlay traffic could be load balanced across multiple
VTEPs. Such entries can only be configured from user space, cannot be
learned and cannot roam. They only make sense with a user space control
plane such as E-VPN where data plane learning is disabled.

Despite that, the VXLAN driver does not currently prevent such entries
from being configured with the "dynamic" flag. The per-nexthop FDB list
is only protected by the per-device hash lock, which is not sufficient
when two VXLAN devices point to the same FDB nexthop and therefore share
the list. Aging runs in softirq context without RTNL, so an entry
deleted by one device can race with an addition or deletion from the
other, leading to list corruption:

<put the trace here>

Fix this by rejecting the bogus configuration of dynamic FDB entries
that point to FDB nexthops. As such, the per-nexthop FDB list is only
ever mutated under the RTNL lock. Add test cases to make sure that this
does not regress in the future."
