Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795084131;
	b=V8SZVaN9ZL3AtyBaIXYoNBpQoYId1NBgs+AOOlvX5UsKNLZHCMTfCTTHCaUCkKHLFxGM
	 0nshkrp1HmK5Ro6KRTsURhsywPsrpXxERFAJMmt4da5b/oouKGQwBJOhf08mNHFAG2Bn9
	 xMMqfVtSUnVpeZ1CHKJ3BbM/xLCBjsE/gAQbkAd7bA/oN5cVCL8ShL6jyqXY3ZfzWnPmN
	 MTlSMavgLFPgUsIFJKMYYOcC/gy52odvpIlzfpFTU2B+pr7oL92jwuPWbGwR6LYL1z/88
	 qaCA/0DmOQCkxx7wNnBNSmDJBEUwr+SsUxfMS/HZKxaGbVC7kTew09yFU/f+vR7M30g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084131;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XOxEkEwoSt6BmWZj6miLDOb3oQm/+GIU8TpixuznoHA=;
	b=P+zxBOybOCBfZZjXDXDRhFLQXoqA/onyVgLuBkh2+ifvhZeptcvbMJ/41lRd7D4OdeF/
	 yPLwEvIt7ZASON1JXClyYEtldVNvwUGke+I3XrCyTZGWNY+bH0k5rHZTymGfHb6o4xLHo
	 lsIRu+ZJubyQ/esIxrNO8qkqzx+o8FIX158/z8KWulvEA3AloAjPlF9XWAHLJAnpyknaD
	 +FbHKBFr0pOzhPVRE+1lvuxgqX8NARlLFfjcC57T+MQAJaYbctQsJRI1HsCh73mZyF6e2
	 iasqIERJzuLYCyW9pW7l9Qtoq77gq6DoR+c/v5GrOE2UDS2OJFsf0G2vkejMuzjtXRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=k7Z4AkQe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.22
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E81C606A324;
	Thu, 19 Nov 2026 10:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E81C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=k7Z4AkQe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJvxSv205UywOv7AdHVejfatUazh8AvNJFiPeDUAGW3RwET0qpZuORNz5LhjU0MpH05QoHKP9ppkfvJuoDHxlHmS9NpBDbtIBtAgR3oH4BP0IrwibkfhyUFNRi4vyCMP/kGOuLQCPnHa/yYU2hIjs06uXrlrHCHX4SBaFOCbncO6dCEzs/lhthxlqyJrnvjDZIYH+vIlS3tFBe67t+i5+4nVpv+2AWduzEtIFBNsRJ7DwzMvZGdDX9EvXc2D5YSpad8VrUbW87T35jSnh2trneMyoAaWGl+P0IkHKkeYCwNXTshOLJG/vneAhVUf6SnTkLvT+Xuk/SSIiMt3pQRquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOxEkEwoSt6BmWZj6miLDOb3oQm/+GIU8TpixuznoHA=;
 b=FvBOfYCY1vlVpdm1nyWoj4nO1SeXbbrIifqwA8WsxihVYlyE92Mh6Par+qG7h12QjueX8lYFdkA+IxHQnPX9Wp5Nx9C7vZa70IJ8YhFtwOGLsW80YbXU2/OtTAvvZWzWAu6VweOdD+2hC1tACekH86rfrJjsEbaPsT4ah87dy//uSppI+yJMhn8iLD+S53tIUT7VIDK2B2veIdDgie5WNEXSr59iqe9Vk9sfsKJXGTT/gVqlEfC7T5DMLV+nQgqzmCZ/U8OOcNOcI4iAjzqIo2B9vbxzfEUKeHTjuWvss+M5L6hLUN1Zs4hFY/UXPNiqNqkmG3sOvSu47+LeFsuXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOxEkEwoSt6BmWZj6miLDOb3oQm/+GIU8TpixuznoHA=;
 b=k7Z4AkQeLOt42mlQ2+QbW7rmU3Ww+t+CwZVo/XlCdBlOqYumBiO22HIfTpm+xD1hcKVPW5OUPdE4ycG+nKDB54zWHHtjMQydukrdZXXzwrpyujEOB0Btrt8IiTWtzmBkEozwJx/IMb/Pq7ImWsDRQTSN0S42w8FlMpUE8iMTohd+vQYJIEwYpItroZSB6uTyBd4qMBkWY3rIYMMSERXDisP5xT1i6nGerlUohKL8S5iKGoOmuhc/pak0lcTUxaUHwULWGG30LM/1EF03bRB9BSdmKmthRAejXZ6xMkWsb/+vi8gMv8h70Tnl0l9OAyjne2CFI4WqcMzcH+W5br5dtw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by LY0PR12MB281605.namprd12.prod.outlook.com (2603:10b6:404:21d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 10:28:47 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 10:28:47 +0000
Date: Thu, 19 Nov 2026 12:28:37 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, edumazet@kernel.org, jv@jvosburgh.net,
	andrew+netdev@lunn.ch, petrm@nvidia.com,
	sridhar.samudrala@intel.com, jiri@resnulli.us, horms@kernel.org,
	shuah@kernel.org, linux-kselftest@vger.kernel.org,
	razor@blackwall.org
Subject: Re: [PATCH net-next 3/6] mlxsw: Enable LAG collector independently
 of distributor
Message-ID: <20261119102837.GA1787306@shredder>
References: <20261118083442.1061289-4-idosch@nvidia.com>
 <179507998105.3136.16224636454143398218@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179507998105.3136.16224636454143398218@kernel.org>
X-ClientProxiedBy: TL0P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::10) To LV8PR12MB9407.namprd12.prod.outlook.com
 (2603:10b6:408:1f9::13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|LY0PR12MB281605:EE_
X-MS-Office365-Filtering-Correlation-Id: 0201d216-4c28-4866-24b1-08df4627e52c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|56012099006|4143699003|11063799006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CoUDiMhD057/WrVgzvjpN+uzbdwNiY44SSUDqIC/GRUEuBRaxGk9M7isAdZbGsMWAobutXGKvthXDSjmj6elN/qHtjqhJAtSPYV7yoQyoFqjUZjFzMc5+sN0UpekRF6AcXg0IGh+FOAKz3oIfwdjbQPwLeqCxBgkIlG9oHFra28CtI2o8cCdOscIMSCf6wJKCXuvmQRL42DvR5FPulGnyoIChU3mOuzAwMr0iLKQrs2Cy2ZfB3sH/KnxrqD+mdHl6ziRz3OW7HKPyAj5pRJifLBbHPSfcNCPRfL48VQDYpnqMSVhpUy5ZBO2k5w1eQDvivKm6+bZaDnF86fCsre5lkkZOYoowOZYUXBY4mCcG/3e7tL2vHZ9W4nNrytJpL2bHFWFKTpkap9qQ2Tu/sDa1wFEpq5U/abl+ikVp3PGiAGKO/uutJSsFRh78SE4etayLIwERNJWABejIJE8RjpWCJL4UAYFJu7hPcI9F2c8cLGnjC5EJpty9/MuOM7wGqm9q6utte3jKarDjfugYU+O2Bdgqh+2dgcA5cN7+DJ2+ciED81tJwjfWhRPA0YOUC14MB6PgXKTP/hlFenp3w4KxRKHP2uluRmWezEUnDnxYPGVhil4eQnwNOa2wXHQP1N+cZ+T8OAqSbIEI0qzJvAKVZ8JVOdcgn9ZzeAD2yLVFcM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVNuOHVGT2dIenp4cUZRakRSSDh5U1NWS3M4QVRoNmgxQzFzRFRTMTNDdnBX?=
 =?utf-8?B?bDQwTkV4akI2VE0xdUVtdFpSWnRJQWJBYUxLWldTNDZCbzNDMDhHUjg2RTFB?=
 =?utf-8?B?ak9UVytwVVBQS3FMNXZ3ZkZLM0ZmZVc0eDROSis0NU1WZXdWU2xNSFJWam80?=
 =?utf-8?B?MURpRHI3SkpESXNoeWhLcDd0emttNXJ3bktETGxVem5kZjNNRTNydzdjUXpV?=
 =?utf-8?B?cFBMRFVoMngway9yUWVPclBJQjh3YXNsR0V4czV1QUhialg1L3U2ZkVkOU1F?=
 =?utf-8?B?TDNoakFZTHZyY1VSbVN4K2ZMK0VZR0twOHVBcUhLR2xVbzZPSmY2RnBocUJi?=
 =?utf-8?B?dEJhZFdhQW1UTDRHUjJEODZpV0U5RklNS0YvRXFkUFpKdmFpbDBJTTJLdE1Y?=
 =?utf-8?B?cllBcCtCK29PakJqbmViNDAwcS9zUS94ZWMyeDBxb2JaZnZJVzJKR1RXQ2VC?=
 =?utf-8?B?L0hzV0V0NzVteEczVFV5YzJuS2FpNlhnc1BOaytxS2Fpd281SU9obkhDK0Rr?=
 =?utf-8?B?REpKV1NKY01wV2MxUUd4TERMYWN3R2ZTQzhmN0lrQnlSd0xqMjZOUHhFcjhD?=
 =?utf-8?B?QVJjVHlGZW9wbDFGUmxXUGlST0V2Ri9sZHk0Qms2YVNHdVA2ekg4Q05yQ1NW?=
 =?utf-8?B?S2NSQTJWcDJkdk5YNGg0c0psVjRGcEI0OHZPdzhTR1FGNlFPWVFScVh5VVI2?=
 =?utf-8?B?anJXSy9hdStMR3B1RmtrTENPbWVPc2pnYkkrM1NMeVpOQ00xMXR6U1ZkVWRB?=
 =?utf-8?B?dUlYZUJQWlhqdC9wOC9ralFYbHVIdURPamtWQ09jNGlNZVlZTlI3OTFsenFD?=
 =?utf-8?B?L1lEV3dpbE5pcnhqWVgyVUxhQXUxT3FoR0xtMTErNi9QL21USmJFcUZHeUNP?=
 =?utf-8?B?TVltdUdEK2g4R3kwRWZ0MHh5OGE2QjV1WDJYY3g3NDhtUHRDTzhWckg5Nm1X?=
 =?utf-8?B?OCtIdEZ0RjZuVm03dkZWS2duZTJwNlhIWnpGRDdYeG9Ic3JzYUpxekRhN1Nw?=
 =?utf-8?B?bitnaTdFZ3k0WmxiZ1NRak1BbEFHRmtBZFp1Z2RwUXJybFU2OVU4V0FEbE1M?=
 =?utf-8?B?MDIzaGU5Skhtd2FNaW55RkhNZ1FMbkRDTXJQVHgwUm1hdDZVT2Q4RE1ESnhZ?=
 =?utf-8?B?VUZDaHIzWHR4dWxuTlZhV1hRZUdSazNxRlh1bERyeUwwajNtSWR0RFc0K3Zt?=
 =?utf-8?B?cHBWQ1hNeWRESXRydnBiUnlZeDZXV3BRVkN3SERJS3VIV25uNDJ1R0g0Nlo3?=
 =?utf-8?B?SzRpc2p1VkdSOXhidm1naW5XaU5SM0RQenVOTHBEZTY4Y1FHU2lIeW5abUxv?=
 =?utf-8?B?cngyQXY3SXVvblEyb3p6SGpNeHdsWWhWenpZaDZWMm1oWHdPdjhoRGRScHZZ?=
 =?utf-8?B?SG5VcDNoZ3U0N0VhNWY2VUxLYUsreTM4dm5hcDEyN2xmM0xpeUdkWVJuZ2Er?=
 =?utf-8?B?UHRLTDFCeFZBUTlCWnlncGtYSVJCUTJLY2d4d2VpUU1xN1NGTWswSjZ2MlB4?=
 =?utf-8?B?S3NQMFhTMC94ZDdqN2ZudDBJc1FuTE9Rck1UeXFhM1VFZ25sUFRlMGRyMWY2?=
 =?utf-8?B?d1BXanlvdnp6WHVzRHYyVWxjNVZrdzlDalRURmpsc3J0Vlk3SGxIYk1McmZC?=
 =?utf-8?B?cnJLWTV6SmRJdEU4ZG12OUJ4cFpwU01NTzRYTUlEQ1RRNzIrclJjNzlHd0o0?=
 =?utf-8?B?Z3U4djVxTW4yeDl5andpNFI1b0duMk5nODltS2hRVm01aEN3bUhLZjh6Tkgv?=
 =?utf-8?B?Q2ZwcEdNVzA5bTRxZGtNZ2tCYVIxa1daazFhZVFGSGJJN01MeTV1NmlyREk0?=
 =?utf-8?B?dGduM2pCaS9KNXEwWjZ2aDJsSmljbFg2MUJEMDBHYXgwU3g5YmVJMW5sNzNp?=
 =?utf-8?B?VGJ1c2lXMzU3WkY5WWtWd1FQemZWKzkrbTJwNHJQYnVkYkM3bDBJK0hOL3ZU?=
 =?utf-8?B?b2tYSFFuMzdMVjFTcWJEWElpZXB4SGdpSlBlWUlpU3gwODdQVnBsbDNsMDNu?=
 =?utf-8?B?Y0FBbEMzaElSc2NhcjhpZklWYjU5aHVuWlpUcTl1LzdYR0tQb1Q3anRyamV5?=
 =?utf-8?B?TFFQSW5xUkZZUG5GR1ZibURpOFlBYnJUeTVwVnUwNDA1TGNDK3dXY0cxampT?=
 =?utf-8?B?OGwyaTVIQkc1aGwra210NSt0SnJwYkkrbVA1VmNjTGkrejJPdnBPb2kxUG9U?=
 =?utf-8?B?U3BRdFlvL1piakdmdm83RmJ0VVV1WjBRS2pEZHkzZ3pNZzlEU1dGY3JySzcx?=
 =?utf-8?B?Z2QxZDBFaEt2aTdoQWlGQk5wRnFlVFlLUWpwQ1NSR0JTQ2NCT1M4dGpIK3FK?=
 =?utf-8?Q?Mh53Ewle9M1iikekZ2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0201d216-4c28-4866-24b1-08df4627e52c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 10:28:47.3932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZEXpJAeitqjnZly78Odj86TSlU1lidC2ABiVgUBOGbUZu77Cv9fy59qgcP+9ctSPQKO183XY76Q5CCjz1PadA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB281605

tl;dr - I believe the patch is fine as-is.

On Thu, Nov 19, 2026 at 09:19:41AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The new collection-only state (SLCOR collector on, port not in
>   the SLDR distributor list), reached through…
> 
> --
> 
> mlxsw: Enable LAG collector independently of distributor
> 
> This patch adds a collection-only state for LAG ports. When rx_enabled is
> set and tx_enabled is not, mlxsw_sp_port_lag_changed() now enables the
> SLCOR collector and removes the port from the SLDR distributor list.
> Without this, a port in COLLECTING state in an 802.3ad bond with coupled
> control disabled did not receive packets.
> 
> > diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
> > index 815e8d8e31856..5a6dc033084d8 100644
> > --- a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
> > +++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
> > @@ -4515,11 +4515,26 @@ mlxsw_sp_port_lag_col_dist_disable(struct mlxsw_sp_port *mlxsw_sp_port)
> >  	return err;
> >  }
> >  
> > +static int mlxsw_sp_port_lag_col_enable(struct mlxsw_sp_port *mlxsw_sp_port)
> > +{
> > +	int err;
> > +
> > +	err = mlxsw_sp_lag_dist_port_remove(mlxsw_sp_port,
> > +					    mlxsw_sp_port->lag_id);
> > +	if (err)
> > +		return err;
> > +
> > +	return mlxsw_sp_lag_col_port_enable(mlxsw_sp_port,
> > +					    mlxsw_sp_port->lag_id);
> > +}
> > +
> >  static int mlxsw_sp_port_lag_changed(struct mlxsw_sp_port *mlxsw_sp_port,
> >  				     struct netdev_lag_lower_state_info *info)
> >  {
> >  	if (info->tx_enabled)
> >  		return mlxsw_sp_port_lag_col_dist_enable(mlxsw_sp_port);
> > +	else if (info->rx_enabled)
> > +		return mlxsw_sp_port_lag_col_enable(mlxsw_sp_port);
> 
> [Severity: Low]
> With the new collection-only state (collector on, port not in the
> distributor list), do the error paths in the two existing helpers still
> do the right thing? Both cases need a register write to fail.
> 
> A move from COLLECTING to COLLECTING_DISTRIBUTING calls
> mlxsw_sp_port_lag_col_dist_enable(). If the SLDR add fails, the error path
> turns off a collector that was already correctly enabled:
> 
> mlxsw_sp_port_lag_col_dist_enable() {
>     ...
> err_dist_port_add:
> 	mlxsw_sp_lag_col_port_disable(mlxsw_sp_port, mlxsw_sp_port->lag_id);
> 	return err;
> }
> 
> Would this drop ingress on a link that both partners negotiated as
> COLLECTING?
> 
> A move from COLLECTING to ATTACHED or DETACHED calls
> mlxsw_sp_port_lag_col_dist_disable(). The SLDR remove succeeds even though
> the port was never in the list. If the SLCOR disable then fails, the error
> path adds the port to the distributor list:
> 
> mlxsw_sp_port_lag_col_dist_disable() {
>     ...
> err_col_port_disable:
> 	mlxsw_sp_lag_dist_port_add(mlxsw_sp_port, mlxsw_sp_port->lag_id);
> 	return err;
> }
> 
> Could the device then hash LAG egress onto a port that LACP never moved to
> DISTRIBUTING, while bonding has tx disabled for it? That state matches
> neither the old LAG state nor the new one.
> 
> mlxsw_sp_netdevice_port_lower_event() only logs "Failed to reflect link
> aggregation lower state change", so the hardware stays in that state until
> the next lower state event.
> 
> The patch notes say the hardware and the LAG driver are out of sync
> "regardless of what the rollback does". In the second case, though, the
> rollback turns on tx distribution that neither state wants. The notes are
> also not in the commit message or in a code comment.
> 
> Could the re-add be skipped when the port was in collection-only state, or
> could this limitation be documented in the commit message?

These registers don't allocate new resources, they don't have a reason
to fail and I've never seen them fail. If they failed, then the system
is in a very bad state where the state of a LAG is largely irrelevant.

I put this info under the '---' because I am trying to keep commit
messages readable for humans and not to overload them with irrelevant
info whose sole purpose is pleasing an LLM.
