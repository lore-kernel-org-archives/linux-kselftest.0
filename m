Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37842F7F13;
	Wed,  2 Sep 2026 19:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375863; cv=fail; b=lyMeLP90fHVMzj8hqgcB7cYIXSq7SruEnVfM3xPmazN+IoFjCZkhgxEwPb0QaS1pWwVLKAfQW3qgDAbtue6tAY/+rClVGkYk9fURQXn4IP+HsIxAfuVNXgQyBDZHOSA+ydMaRHzF2O3STFDzSQAHYxs/txB4Djcl0QvdGAMNukg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375863; c=relaxed/simple;
	bh=JwppJ5NenTd8qtTUn/jExzuyEFtYL/nY7rTWrP9mEgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IfB+D2pGPwsfw4h8dXr+QiVpbNTo5/hvksFaBM8L8S+LI19tK2BZsIjqRgRZm5WBmBO+fLvs5kf3paGbhABRTb/R/NPNWWIIARelnmchNZF20ioSxI2SwEx5faNYBetjab2NWASIDt9x1P2iaHZ9S8hWKooc+Z/eRF0JTbUT8LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W9o+Ewv9; arc=fail smtp.client-ip=52.101.53.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W9o+Ewv9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BB8SWdnqSnN6tCMt3CSgInFKeeML6yVi5qfWNG0Z8nYAc/dfIfsuI/Ea2Vp1Ore90DIh1RhdIz9Ioyl53x71IbqBULO7qKYlXnTddaWpmPJtNxwPWdLAz6lDWKAwk6X1qoUu52Oat43GocVYJglJHnU2WF12QVg3V4MD+0IK50zRDWp/atKDgVcW0CSFYo9qbrAMRZYCW5Cxo5M35GaY0jHegqQ05dijsDzqvRDeAKEl8isPHanJ8IcqDJln6sIbx5LOf0Q8J7KHX7A58TbCiml3XDpyOGkkE69BKcV2yRkXUGIcaVrtZ3/RfhVCevsmgDJ+4NWzfJQmHKxrIDwfHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lPlQpKQ8HhVXGIocktsstavhkyoM/4vJuVzIfz+5Ig=;
 b=OUnn4rRinMrgwGgY4g10EpUVCHwaTE7eWRRnfhXw6p8ruIeVo58u+lqm+DBk4cxMbHBy26+3yDQRxdcKlzma/eNfXuFSddZ17DM/5yhBIQpWxoKMYN6SXtlfQSMGOZY0FtUL9x/GfnsbX/QXTP6WNEn9nqAyrgS4PuQ6C9SkB7UtmB5PrvL4a4C043qnvHQ3c785qI2uvrO9auRTMPIppU7Y+hsDZTfBrNM8oMm0HB0JSqsIHWmYdJostCX9U8GsP1m2kctAt8IReg4FPG5eXWrAuvwEl3UwL6toxxMRAM8QnDQfr+fMfuqRT8zzhWH0s6HqtOw6YT4U3Aej24WiDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lPlQpKQ8HhVXGIocktsstavhkyoM/4vJuVzIfz+5Ig=;
 b=W9o+Ewv9l+9zaSQmt39AGauA25a73a8zGcszukkSkDbC2NEVPRwCxXOFFAOF2UYMjAcfhnGcfeyyVM4w1tkSWicdVYUWD6fO/2KmB/HYEPi47vUZGjIZUZm8RUFuStxL95Z+w3FVR/n6TIwdbRaYUiCReevmJrMRkiSjVGTRu5zNSF9xi0eREVrf9IsHxQP+0phWbatun8wJeOOtAS6ENahZ0qiAhxMPNHmlkTyIJPDds7Vg9zuNvoq/whZppVGOayGIzi+x0xfxTU3IXHEBbWzBP/FdH8VH5KUiqOqxJUhKlU4E3mTrsMZjhu5Ha2YjkP1YDDFLeEBpCJ8gKW13RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by LV3PR12MB9267.namprd12.prod.outlook.com (2603:10b6:408:211::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:04:16 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:04:16 +0000
Date: Wed, 2 Sep 2026 22:04:06 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Seungwon Bae <qotmddnjs@ajou.ac.kr>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, dsahern@kernel.org,
	shuah@kernel.org, horms@kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] vxlan: reject dynamic fdb entries that reference
 a nexthop id
Message-ID: <20260902190406.GA4127474@shredder>
References: <20260902155956.296699-1-qotmddnjs@ajou.ac.kr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902155956.296699-1-qotmddnjs@ajou.ac.kr>
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|LV3PR12MB9267:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d79c26f-e74b-4974-74fb-08df0924fc33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|23010399003|1800799024|376014|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7QSa7dAiP6XCpgpEhZuzDgV0XrPsyLuQLbeMPl0XQCQTTHQxDq//52QJuBfPV/3cBoE9sVdUjqMmVSlMtxtZlIi+azb/l+LvXLcwSXYNaOLXRQ1U6EYsgci2ykedaMhA9ZeIbN5StwkXqXSNX1Mr7iS0wuq97N/DqiHixti5AmVQyeF5cmEJQpOYyAEvRjfzl/ixVY3BXKxqZHXkzj9BpcbpHSNulRs3jqmVGf/a0AHjA8KKhzUqHPlzk5A4Qmgo7LQ/A5HqC584ppJXigZrJQ+taiK9guwUXGSyTHrbaB1DBLvGbPnE2yUK6p+AEIdeyRuPfnvLgs7YtphG0w9BRHttbdDwhUX65GbG4/gaYGScr7c6kA7+bUeQZNSSvcoTJ3yFQoDrQb22JKmeYgT04PHcli37gnJioAkgCmPR/NJMFaDSwgzbu6hnUJmm1ld8GkC2kFGC2tDchW1i3Ze65iyjhPuh/ho+9dNS43cRRtdAEAfZ+rui9lPPGwFxLIYlz5+mXWqcIcDZYAxZEcF4hkwbqoMToKNvEtiVNEAF+8vb43wralnyNVygwovCIOpZWeOaOXZomDn2upg0pqVewrTMBiob3MNqKtQ9uRsCiBf44XoRqPxrRsHB39xFXqpMV+8u6uWY9/MGo9YRxa4d4/ip+PJmWTX3kua1APlOeRk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gznhPzIfPCYpBboPMKA4wwa6Aiiktw0kdsPAmaYk6T2lmzS+428Yy3NEzy21?=
 =?us-ascii?Q?gDlHwplrRMpUbR4THNIVjT2c/Bqh7VsHEYoFCEQu5/3C/i38ZBXo1UEA2bKV?=
 =?us-ascii?Q?62isQjeZzC+eRlcPzVSE4VE67TRUAR/19W6dTFoYxdubxy6CH6iTQuYzw3u1?=
 =?us-ascii?Q?GUj12ve/u4Y1b9MxhBPTIRYU85SXQ9osD+5ANRIpQqjAgp/DMDEZsPGwTc//?=
 =?us-ascii?Q?39OqrWkBDJMACMVPWPz9dWPijfL1Waod0u6XTtWAJzdPlCd9pPPpyNE+sVew?=
 =?us-ascii?Q?s7MM3gndp69xGrT+Ga7B9dajFQ2teEymHpzndsYolHXH7FzRMSube25iK1CX?=
 =?us-ascii?Q?qMOEs8MVaVG9e+05odPFglEDP8JEkzBQlsUjoDh84N8h0DxvpAAIXNYUQlU7?=
 =?us-ascii?Q?E2bLW5FDSS9uYRDMeOCA3zdL/ATdLjCmbZP3lpvwMmHfhJQrF1uw3FEKHmpz?=
 =?us-ascii?Q?4ylT3QqaJtkbPOyxXd4zCYyuf7T++PEEkNWb86Y3+CUN/npyFQF+YGcz5Kv/?=
 =?us-ascii?Q?DVWRYakwjSt8sGhO4FWDFe2fOsJoOuwyzm3NJL+xwLtnZothxJQy2hdPTkVX?=
 =?us-ascii?Q?vi843J5FN/CIPcQr7eES7soHAwtvKBmm/9njBB8/55bTpzgs4IIbyaINwwv7?=
 =?us-ascii?Q?gDBUJZEstYCyMYiFX80fNwrRo25jK20/IvZQuStmgSnfkoi27PdCfaWwWNDC?=
 =?us-ascii?Q?DunzAC9NG+GAAUWJYPBQWmi8TODM/jkECtK1C+7kSoiIaNuK8fXPKppglJQp?=
 =?us-ascii?Q?+szdQbzoV9hoi0OcxmAhqe0k7ZoIQaaLdPMm/YyiMWZ3+nTS03Ie8NaVoOjv?=
 =?us-ascii?Q?aTwvDy6P+xMddTFrMRxzJ9rEYgukQfqSb6FC3hkQH6J/gQzxEmlrpDkyGTOE?=
 =?us-ascii?Q?kKMYuuiNNS6LT1NL+uMhqQXbFFqgm5BYi0m19YoZsLroQmhNS3WPjMR21zk2?=
 =?us-ascii?Q?IjlgGvrnuTzu7sMJl7TZ1lqSl+JgRUNh3izUdm1OH80THnva19Uqx0oLa5VB?=
 =?us-ascii?Q?1VyzyVbha9jHHQmSod2LFXqfXBS7GMUl2YAG/eF0T0ROfSx+9d3xT99jPs2Z?=
 =?us-ascii?Q?q+PrIjLu0xH7yHzKeafpJEsHqHseVs1bL/aLOziBVraM6LGXSfxuI9jwaMXi?=
 =?us-ascii?Q?UPOEudRGS+BVzwA9R1Zx+4uRDkyGu3ExOyWDd0qGHgfMQOAdJeO/orubxdW5?=
 =?us-ascii?Q?sevXgzM9zdZWLnN2nugC1D1cqQ/c247JNri8uO9RN9cxIML62+Sm4d8Cq2YR?=
 =?us-ascii?Q?9cUT05o0ml2uztosGkq5R+YFNLkzlB8Br05eEDLC99WKMsSiMMOHw0pTHpw0?=
 =?us-ascii?Q?FlKKndJ6e9rDoevDCmS1ffT75i0QFkSYoJegYiEARRQB6wnLfXH2v7zgrWDV?=
 =?us-ascii?Q?cT4x5bkHilM5GBFZO3RIYLzCMAzY4MLJ51IhzDMkwDzbF4Rb7EVYBWBaH+8C?=
 =?us-ascii?Q?GLpXHOiyOptwwy8WG6rJjRGvO/SJh+JW8gZh2L+EfmCOCz8OHf5hwycC1Bx8?=
 =?us-ascii?Q?V1diXhR/F1l1cj70m5WITXtvpo30Nc0FQJC3hqm+RK+jzwkq6fDimw7nFPxU?=
 =?us-ascii?Q?YPwmYLCxiRFVbxO4elgqQFaDro3BkGqWVUSGiQ+vQ1fzYOgf+wEAlV1qdC0K?=
 =?us-ascii?Q?YrCvxw3SKC0TwFjxfYbv0rEGgQTTCLC/heurCNgaqXcnI3LgxSES+zR9Uocl?=
 =?us-ascii?Q?r6f688jKOJp9bSusXL27gWM/F2VehN0jn55ebm5YIAfFjLDT3p/E31hWCBfZ?=
 =?us-ascii?Q?PS8QGN/BHw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d79c26f-e74b-4974-74fb-08df0924fc33
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:04:16.5799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64OhikXavO0M6u2p6rAEUYd9wp8h5Fhgr0k44iLCWZcjrGqF9O+6qfu0lSTEjLJ4qp8pYxOWLt6ttErTOOlMaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9267

On Thu, Sep 03, 2026 at 12:59:56AM +0900, Seungwon Bae wrote:
> The commit cited in the Fixes tag allowed VXLAN FDB entries to point to
> FDB nexthops so that overlay traffic could be load balanced across
> multiple VTEPs. Such entries can only be configured from user space,
> cannot be learned and cannot roam. They only make sense with a user space
> control plane such as E-VPN where data plane learning is disabled.
> 
> Despite that, the VXLAN driver does not currently prevent such entries
> from being configured with the "dynamic" flag. The per-nexthop FDB list
> is only protected by the per-device hash lock, which is not sufficient
> when two VXLAN devices point to the same FDB nexthop and therefore share
> the list. Aging runs in softirq context without RTNL, so an entry deleted
> by one device can race with an addition or deletion from the other,
> leading to list corruption:
> 
>   list_del corruption. next->prev should be ffff8881069d9548, but was
>   dead000000000122. (next=ffff8881069d9448)
>   WARNING: CPU: 0 PID: 90 at lib/list_debug.c:65
>   __list_del_entry_valid_or_report+0x1aa/0x210
>   ...
>    vxlan_fdb_destroy+0x5b8/0xad0
>    vxlan_cleanup+0x328/0x450
>    call_timer_fn+0x2a/0x1c0
>    run_timer_softirq+0x18c/0x210
>   BUG: KASAN: slab-use-after-free in vxlan_fdb_destroy
> 
> Fix this by rejecting the bogus configuration of dynamic FDB entries that
> point to FDB nexthops, both when created and when an existing entry is
> updated. As such, the per-nexthop FDB list is only ever mutated under the
> RTNL lock. Add test cases to make sure that this does not regress in the
> future.
> 
> Fixes: 1274e1cc4226 ("vxlan: ecmp support for mac fdb entries")
> Suggested-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Seungwon Bae <qotmddnjs@ajou.ac.kr>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
