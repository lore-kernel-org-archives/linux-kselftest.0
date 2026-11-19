Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795088252;
	b=oX4r193cdTV9H8jwRAPlC6c08DiPNbtDR5SmIhy5t7nzbyYXZtuCVLeyJTiR9yZInCEW
	 NRNhXdCqmS+seXhdp6S3MUnv9g59j0i9+W3vHbZz5T5tc3AEzqJNWJruIxLlNsyUy7y/4
	 kr1eaNwTpsZqXmVfFoDNKldzJTGhSp1FA26OfvccfTx4qkvwTqFoPEo4pige2Uu79zH4b
	 6AtIQTwvoGYUELz0kbo13ngl62UM5gJ4G0Cbg1fQYpvp6JY9igj6X8DHGaPDuiYGKxCip
	 DaP91+QZGSH/4ULPfI5zCqLd/MeeR8hcxd5YrZxBciGPUMFf0l/NvHAGW2JgH55h6Ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088252;
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
	bh=fg/fQXM0eRUfFqfapBCTYhYdQsDC9WSgql+nx0A9nMs=;
	b=pacT4KrxOEuOLvi+fjsdMbDvmvNygb2CFgvXqAwKfy1gjYlvMpUePrnMTqiWlZN+o5VR
	 hFPzrrTatrNbdhMziMWD0SFrAIZPm3LWZNkp6zusuTAZnRr6BTJZngb4uHyz8uEi8zNbM
	 xukhi14342uFHkP0GOW0ZK5cjh8N4wHufudMUnYhqbhfCNikReTphyNExP5HCaRcRU9I4
	 LNC79OIDGwHr7G1g6jud9WPOP3f8vVr0OZwaLq2FHU0gFQpesspcZnPTJfbwHx27Cu0VU
	 pFX0ZmXzMLUXEF/VnuLs8C4ftjnzhSilL7MUhDvaedzVE7j9IWhyb+EqAi65VOlg9ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="mSZOD/L5";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.64
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F72B606A324;
	Thu, 19 Nov 2026 11:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F72B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mSZOD/L5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjmDqs4nGv2viBUQR2XDIulGqHz3m0FWTH5o1gGBnw2uTX+7QJbIWixWtmTvZILFIz/yiKm7AZPFieWmdZwKOrC/QlvTFd90tqJDEpA3wD+ahBRdByAzpa/8PTXcCfgHe9XVcmJb5pZwZgzxUsLfYYfXlYhAGBe40TFAM/XoIaxSbcEnfB/EWEtccZxmQXaAvIxZkL65+jiNZeus7o8bV0ethBDQl5mX56C7YTtskgCh9g9i+fKKd0HHKtAz2uEyk5L6W2Q2TR9ax8CAgaRyTkTB4a11fyVYbJCz+/VjGaU75R9Zw8flua9mfeejesym6AXknuRpViIeHjpDwV8luA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fg/fQXM0eRUfFqfapBCTYhYdQsDC9WSgql+nx0A9nMs=;
 b=OiLPE8K8mvV/TcVm/sZ4o9s38niSwm8HShQZqCdcgFJQ0EuWlEko8PDlYukYLLoNYO0rBjg4ypkpn9myuWlWdqyHUEIFiD/+CoHPnXU7R3s9mvwDCZDeaKISJcwg2iGwQhMCgGmlXxvskjG4IByrKW3pNK47aeZcuAYwwarcfleaBH7MyF++njGbpD8AkMgCbP5tiaVMKxExwdfVuQc14ppeoJft6hUxZgukxtjTXdNiOBaL1aTRWDDtIIjILXr8U6d9lWJXNtj+2xKR+lk4sRipTLbfb4WSEw7z6YjsMufFao9pWGeW78yxL9HzCuhKPyflWcAUG/ljzsVbczLptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fg/fQXM0eRUfFqfapBCTYhYdQsDC9WSgql+nx0A9nMs=;
 b=mSZOD/L527cKLpmVviYksEgsrUBTEV9ceV2dFwBVc+NvoIs4azQ82eZtrlBKOsl9vYbNewlkY4POJx2p2TjtKc3Cz3TicFDEg4qJLHAIeXYhC+XYyd9XXlv9dWueHe9g/izUvYl9QHVSDZJW7L3/iQKzRJQrQ5E0HgyUrG59OzLp+X9ROIsqcYYBFLVHHIQ8eSsoYIc//KJGo+V2Oiv7NhTuwX5WGJjyrAmtq1OV97Ev1ECA48atfNICP8FGdrvgIGdqQ6I3ZWI8bREpfvb63n7yWXYteUIkiR5gwX0rVN3iV/B09wCWj77vJzid6fetEmBKNV7vxuDvzSPa4nN+zQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by BY5PR12MB4049.namprd12.prod.outlook.com (2603:10b6:a03:201::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 11:37:24 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 11:37:23 +0000
Date: Thu, 19 Nov 2026 13:36:55 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, edumazet@kernel.org, jv@jvosburgh.net,
	andrew+netdev@lunn.ch, petrm@nvidia.com,
	sridhar.samudrala@intel.com, jiri@resnulli.us, horms@kernel.org,
	shuah@kernel.org, linux-kselftest@vger.kernel.org,
	razor@blackwall.org
Subject: Re: [PATCH net-next 5/6] bonding: 3ad: Advertise Collecting only
 after collection is enabled
Message-ID: <20261119113655.GA1797240@shredder>
References: <20261118083442.1061289-6-idosch@nvidia.com>
 <179507998243.3136.12068101065568780220@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179507998243.3136.12068101065568780220@kernel.org>
X-ClientProxiedBy: TL0P290CA0010.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::14) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|BY5PR12MB4049:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ce42a5-fadd-4860-362c-08df46317acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|261022075727099003|261021123027099003|10067099003|11063799006|56012099006|4143699003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	GuDv7qUySGgjCN0nWwlMjEn0/W97D4nDIojjE5eYDyZ4nBJ5wMPs0hqaDe8EfzeAPKQIaF51HbBf85Exo9RdNbBz5qFDdTUvsfMkfwFkDspad/FTs8t6fG1sP0owAaQl18jhynyotyuAfEB9wf1h45QAzRi5tfHF23bitXZSxAirNiTllOaeDI3K5IDW6s/Up8vObzAlYfZlR8fR12jWo9W2/wYIPZkIg/mwH+IUsNmSuZ4eWcl2fHUu8bbvpzHI8DMpzsjJINAV391ti757ZsnhpIxvjtWphATQGtPo4O6umgQmi9ftFnS7z3jg4L/YoJGHVvDDTHyuoLK0R8qyVoDOEY3lAhxSXJt1rNweP8Y9XAloJdttao201+3uKzk41M8h1V6sGv0Ij9Xdrk1pU+X5A7ICIrgw+nTtFZRWZqEmLskPr9nAnovsLTqn0iOhofkaLoUDbCrxaWP+KREQBRbgL6SJR4Orx0PKYU3zyIcqmnyNK9ocewnO0LMvEDaDnFnpQ9b9Gedu83p7R965B8sAWgrXexfecuqMM54NZ/3lEz2vv60KUweQO+iUkSRzjrVa2XAnh+9FxpVM08QpqbTpYOXe9Q9IH3ejV1RiFpi3CJ5wDaROHX1NTJtDgH7FcX1OcPz9HL2FV0RKUWsfzD7fCl2rojQ69B41re+T4G8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(261022075727099003)(261021123027099003)(10067099003)(11063799006)(56012099006)(4143699003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk0vVG9ndTd3RlYyaXNQUi9hL2w4Q3dDQ1JTZ1RXRzZBUEt6bWltWkNoK1NF?=
 =?utf-8?B?R2pzeVVTL0hxMmMvR2l3dkI5VmZQYllNZ3phdjc4NlJhTnpjVmsycFBqbVUr?=
 =?utf-8?B?bG1XRzN6Qk9WYVhSTDY1MWVYTXIxVnhBMUhUMHY3SHFkeEJpSk1ob296RTFl?=
 =?utf-8?B?ZUtodlUxOFl4RUNiMm8yM0diMTJwTTFrOWdvcWRVbkE2ZmtIRFBkSzNFbHJD?=
 =?utf-8?B?VkVTSnV0ejZ5U05BMDBBQXNtNTJENFgyNU1hQVQzMHQvWFkxRUZxTlV1d1lj?=
 =?utf-8?B?ZlE3SmJjRDdNSUVqbmpxdWZ0cFp1VlBzQ2Rwd1RMS3d0ek9qSGprMWRkT1hX?=
 =?utf-8?B?Q0d6OUFRdHJPajFkTFRpblhtTEVMYUZHdlZjeVpIOW5wUkNabkp3ZC92c0tX?=
 =?utf-8?B?NytDV1BXYjlndW1reVFieWpneU9kWklrb3NVNmlLT245dk1waVRHbDlrSVNU?=
 =?utf-8?B?S3p0TlFRRXNLM09zUUNHcUxZUVRaN0FacUQxZXFyZDhmT05CMmFGcG54dkls?=
 =?utf-8?B?SjhxWjNBd2tFM2dxS2M2TnpJSHdPcnFzK3ZTVHl2Mk1YczgvV2ZtMDVZU240?=
 =?utf-8?B?UWZaYUtVRjBWaTduZ1FwZG1YYStsOVJ4cXhMdEJzdXJRTkp3OEtPOE1xMmlV?=
 =?utf-8?B?UitwbmhHRkRqd3N2djEwamtjVFlZOFh2ZW0xV3VncUlhYVlIdEZQcEs5U0N0?=
 =?utf-8?B?RnMwakVHZU9xVXgwS1FFajhRWUUzMis2NDFiRjUxMkUvWlgyaUJMdFh2dW9a?=
 =?utf-8?B?ZzhvWWI3Q1NsZ3M0dTFyeU9xZ05nRXg5K3FYVnFZSEIraG9QVkk2TWdpaFFX?=
 =?utf-8?B?ZlIxZmFHbTVDcUU0M1U4VkVtUmpKQlBlTlBVYVpBd2wzdnlLdjZhSFAzYWh2?=
 =?utf-8?B?MEkzbWRuNHE4TU8zUVRFN01JZkczZ25iWHFlMjR1aTJ6WWJFUEF1Q1d1L3M0?=
 =?utf-8?B?V2c1eGJvSkVCdWtqb1hlYlNrckpvSEtzMWtqSWI2aUh5R3FwTXM4N3gvUlVk?=
 =?utf-8?B?eW4xdWJrekFISVNQVEZxNlRPS3pjNVRCZkpxdWFXLzhQaWxxU2Uwd0J2cVVF?=
 =?utf-8?B?NFFjcEo1L0JxYW9ESjd1dFdTWW1WbXBpMEhUSVBnczlBYWQ0Z2ZGdWpqaUtI?=
 =?utf-8?B?ZnlTYUhSTzhPVnNsT1FpcWcvcnV0QnZ4NVFVcG1Fa2dPVEMxSzJRam9YVTEy?=
 =?utf-8?B?SDdCYmU2eDM1QUVyNnF0amZSTHdJKzI3S1dIWTMwYWozY3BPMkFIdU1ZODJN?=
 =?utf-8?B?V0JVaHhrVWxXZkJ5b1V4VVdqakVQN0tldUdYcTBSVFV2WlovYVNPekZ3eXAz?=
 =?utf-8?B?L2tsNHgwaXNyOEJxSUNjMGF5b0hTWXcrcjlGS0swQnovNkF3RFdESlEyYlJZ?=
 =?utf-8?B?WldwekFFZzJBb2V3UXRCd2lVbFNoNElqQ01WQmJsV2kvRVh6dms1L1lKWVk3?=
 =?utf-8?B?TFBCNnVSTXFhVmJudUFHRUVMTEZzdDZYejJBOW5IRkJFZEN1SDdFelZVWXdQ?=
 =?utf-8?B?RlBFVUVvVnFMM2RuSkpNdFZ3R0Vsc0NodWZhc0NzRkRSR0V0YUp2ZTFGSnRs?=
 =?utf-8?B?UzhnNWNiaUhTMDVEcFU0bXlYclpmejJCaTdGRmF4RXZOSWg4WmtYbU1GdllK?=
 =?utf-8?B?R2diSGllUU5EdnNxeE9wUlVsaUZJOUQrdHN0REU5SlpCQVo3U0toZGUzYTEw?=
 =?utf-8?B?L09wQ3lsTlQ3VllNUHZuQlRReDgrSlFZb0JYTllaWi9zWnhpUDZLM0orY3Jx?=
 =?utf-8?B?TTRuYVA1RXk0K2l6WEIrT1JWZUZ6VEFTajRZN21jVFR2aUp4Qnl1YWI4Smow?=
 =?utf-8?B?S292WnNaSlZaNGltL0J2ZUttaFU4NHVqV2dpOW11eGRjSmpISzBRS2lRVW5v?=
 =?utf-8?B?THY5VHJ2d2dMZzBKdUdYZWVMVUlmL1JWcm1YSXFXdytPN3FMb3pnUXJIajZN?=
 =?utf-8?B?N2hSUGduKzlwWnN1MXo3bGFENmFVdyswZUlrbUZ3eE5LSEhGSTRhQmJQRkIw?=
 =?utf-8?B?TlhPVmZZVk9pRDJ0eXNIbDVsSEg0eForaDBvcmpnZnZwbkxKMjJZcFJUOWlK?=
 =?utf-8?B?SExLYk9OSHU0MUx3U1VudTdBTWhTQkhOT0V4czZEcHdRSEN1R281cjk5R1JR?=
 =?utf-8?B?bTlVelM3Yis0SGp3RytSZld5Rk1FR05lei9jQU90c3FRbzFMTHM4emRyU096?=
 =?utf-8?B?V3B6YUZrcE9wUkZQeldoL1BtS0RQcWNzNE9iQkQ2b2tqamZob2xaRzJVUWNW?=
 =?utf-8?B?c2lualMrbGFLODE3OUpUMW93bFFlVDR3VkhWNy9OYnV4TDg4Z2MrTG5GYVZu?=
 =?utf-8?Q?tPMMBJdUmdxZeGO/Nm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ce42a5-fadd-4860-362c-08df46317acb
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 11:37:23.8790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UC2e+eca5rcTsOyXYTy/EoXSt6jjAoQcE19CS0bmYzEMgESdxN7Izx2c1A71ps6lf5lG9+DtzzGjhimGY5GCoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4049

tl;dr - I believe the patch is fine as-is.

On Thu, Nov 19, 2026 at 09:19:42AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] In __update_lacpdu_from_port() (drivers/net/bonding/bond_3ad.c),
>   the patch clears LACP_STATE_COLLECTING in lacpdu->actor_state when…
> - [Low] While the Rx notification is pending, procfs ("details actor lacp
>   pdu: port state"), sysfs ad_actor_oper_port_state and netlink…
> - [Low] __update_lacpdu_from_port() masks only LACP_STATE_COLLECTING
>   while the Rx notification is pending.
> 
> --
> 
> bonding: 3ad: Advertise Collecting only after collection is enabled
> 
> When coupled control is disabled, this commit clears the Collecting bit in
> transmitted LACPDUs while the port's Rx state change notification is still
> pending. Once the notification is delivered, ad_tx_machine() sets ntt so
> that a new LACPDU advertising Collecting goes out.
> 
> > diff --git a/drivers/net/bonding/bond_3ad.c b/drivers/net/bonding/bond_3ad.c
> > index d2a55f4d89791..61f6de803b667 100644
> > --- a/drivers/net/bonding/bond_3ad.c
> > +++ b/drivers/net/bonding/bond_3ad.c
> 
> [ ... ]
> 
> > @@ -903,6 +916,9 @@ static inline void __update_lacpdu_from_port(struct port *port)
> >  	lacpdu->actor_port_priority = htons(port->actor_port_priority);
> >  	lacpdu->actor_port = htons(port->actor_port_number);
> >  	lacpdu->actor_state = port->actor_oper_port_state;
> > +	/* Collection is only enabled once the Rx state change is notified */
> > +	if (__port_rx_notify_pending(port))
> > +		lacpdu->actor_state &= ~LACP_STATE_COLLECTING;
> 
> [Severity: Low]
> This masks only Collecting. Can the transmitted actor_state have
> Distributing set while Collecting is cleared?
> 
> Suppose rtnl_trylock() fails in bond_3ad_state_machine_handler() at the end
> of the run that entered AD_MUX_COLLECTING. Then should_notify_rx stays set.
> On the next tick, ad_mux_machine() can move to AD_MUX_DISTRIBUTING based
> only on the partner's state:
> 
> 	case AD_MUX_COLLECTING:
> 		if (!__port_move_to_attached_state(port)) {
> 			if ((port->sm_vars & AD_PORT_SELECTED) &&
> 			    (port->partner_oper.port_state & LACP_STATE_SYNCHRONIZATION) &&
> 			    (port->partner_oper.port_state & LACP_STATE_COLLECTING)) {
> 				port->sm_mux_state = AD_MUX_DISTRIBUTING;
> 
> Entering that state then does:
> 
> 	case AD_MUX_DISTRIBUTING:
> 		port->actor_oper_port_state |= LACP_STATE_DISTRIBUTING;
> 		port->actor_oper_port_state |= LACP_STATE_SYNCHRONIZATION;
> 		ad_enable_collecting_distributing(port,
> 						  update_slave_arr);
> 
> As far as I can tell, the __enable_port() path does not clear
> should_notify_rx, because the slave's Rx state is already enabled.
> 
> Any LACPDU sent before RTNL is obtained, such as the periodic one, would
> then carry Distributing=1 and Collecting=0. The 802.1AX mux machine never
> produces that combination.
> 
> Would it make sense to also mask LACP_STATE_DISTRIBUTING while the
> notification is pending?

Looking at 802.1AX, I can't find where it says that transmitting
"Distributing=1 and Collecting=0" is invalid and it also shouldn't
matter for our partner because the partner never looks at our
Distributing bit. It's only looking at our Synchronization and
Collecting bits and the latter is correctly turned off until collection
is enabled in both software and hardware, which is what matters here.

And I don't think that it makes sense to mask LACP_STATE_DISTRIBUTING in
our LACPDUs when in practice the port is already transmitting (from the
software data path, not the hardware data path).

If anything, it makes more sense to keep the mux machine at
AD_MUX_COLLECTING when the Rx notification is still pending, but I don't
understand what it buys us and I would rather follow up on this than
send the entire series again.

> 
> [Severity: Low]
> Only the transmitted copy is masked here. While the notification is
> pending, procfs, sysfs and netlink still report port->actor_oper_port_state
> with Collecting set. For example, bond_info_show_slave() in bond_procfs.c
> does:
> 
> 	seq_puts(seq, "details actor lacp pdu:\n");
> 	...
> 	seq_printf(seq, "    port state: %d\n",
> 		   port->actor_oper_port_state);
> 
> The sysfs ad_actor_oper_port_state file and the netlink
> IFLA_BOND_SLAVE_AD_ACTOR_OPER_PORT_STATE attribute are named after
> actor_oper_port_state, so they report what their names say. The procfs
> block, however, is labelled as the actor LACP PDU, and for a short time it
> now shows a different value from the one on the wire.

This could happen even before the patch. LACPDUs are sent at a rate of
at most three per second. First the actor state changes and only later
it's visible on the wire.

> 
> Is this difference intended? If so, should the procfs label be adjusted or
> the difference documented?

No, it shouldn't be adjusted. It always reported the actor state rather
than what was encoded in the State byte of the last LACPDU.

> 
> Later in this series, "selftests: bonding: Test that Collecting is
> advertised after notification" adds test coverage for the transmitted
> LACPDU. Its collecting_advertise() captures LACPDUs and checks that
> Collecting is only advertised after the 0x1f notification. That test also
> suggests the notification is meant to carry the unmasked state.
> 
> >  	slave_dbg(port->slave->bond->dev, port->slave->dev,
> >  		  "update lacpdu: actor port state %x\n",
> >  		  port->actor_oper_port_state);
> 
> [Severity: Low]
> Should this debug message print lacpdu->actor_state now?
> 
> While the Rx notification is pending, the message prints
> port->actor_oper_port_state with Collecting set (for example 0x1f). The
> LACPDU on the wire carries 0x0f. Before this patch the two values were
> always the same.
> 
> Printing lacpdu->actor_state, or both values, would keep the message in
> line with what is sent.

The message prints the port's state, as it did before this patch. The
difference is transient and only happens when coupled control is
disabled, so I don't think it's worth changing.
