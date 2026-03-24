Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012048.outbound.protection.outlook.com [52.101.53.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B313FBEC6;
	Tue, 24 Mar 2026 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774361307; cv=fail; b=esMp/Aat5du9lzGwQ1CuK9pVT6lfvCGFcmSGuF+wMrIcZBsIAVIR1sifq1HZ6HTaVKIRJtoGv4Ry+VnS5NZKjS52LaV9BZ1idTnx3l33jeGPb+hiyNPcA3u8zvKRsvxJyKj7qYsy1pqkljnRxVW1kPQBAPU2dvy+FmLDrvKYehg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774361307; c=relaxed/simple;
	bh=k77iWnYMtKgyuJpbzOeh/WM72L+ELHoQNdoSu7WEwzc=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oBSnoZIApj3Eo+YBnClRT9Uj8CJhGZw0F/wFoP7O4CcAfWC6/uznLUU2puesEVpjHnD9VC0yJQvzd2ll6iItFY/1kWObIKW/QUVzaHZqBwC9TtmTr3/tW1C2oNZe/KTYHGvGwvepBuzh6X0UmtBEj3oikTcIHBwydt18SXm1C7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=citrix.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=yhMhOC4e; arc=fail smtp.client-ip=52.101.53.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="yhMhOC4e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+nF3JKeUS0/LRmRXK+gI6sfhuwbcqgTQNQ3+NWuQQ7TCX6DZYaC8XzT6BySLvUaM8WqwkAT3zoPXX1tAiDGdTwomWk34v1xRlOguit8jLJyBn30Iz873MCo2XGMJ7xC3PRV/YSd9+PXIGbetsiBqKW+XW1cwZ+aijJBvSPM4T39XGbgi0/h2u1WRqe7/QhJSVNBEXcKajmTPm+m++o1RxpYsu/zuGdSk464fS6ktkLS94J0TrbQZXUpP94UzuZ0kCTk4AIneKd0mRyrx1hWiNohRP+3b7jpjR+Q0wEl5fbaywdRY058pqQZS5s6hMjBYAhpRSnPMG+NOnpgOyz3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k77iWnYMtKgyuJpbzOeh/WM72L+ELHoQNdoSu7WEwzc=;
 b=Ud+lmkztazpCMI+gbLCYue/YoimPxDeew0ljFM6o7S+POe63uivfpqrXehh7rD63tct7LtnsIoROegFLwGrSbxrYdPaG05AVYG3lgWkXw6a0WSCISNpQ9X4z2qaTQv5BigxiLJnkW2+4zCA2Tf8pbqaMBIV/OnIN7kyRAq7mObjnRIh7HV9Dv9TN8II2RG6qihjz3zuTXNknCRs+ZItlUd1VFGj2pftuG8T/CyhKTYJ2I2iA0rG/hGq7YXgdA5o+ms33WR0XqJQWDYfV/yJG4zxrF1ABEmDrY7jsbwDg0NyznDyKa22vLaovb5LBxga/TYwzZKcf+cz/qsPpGFR79A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k77iWnYMtKgyuJpbzOeh/WM72L+ELHoQNdoSu7WEwzc=;
 b=yhMhOC4exJJV3H+Wmlsf6Ah07KQIp3hRMxpCLF3jhLpK5noRHibWfk2P/xIhWd3Z1zd/jcQ6tXVh9+xVDusPF0Yd9XJ+nSrv/cqztWmRAib1m2y3LnPZQj62gIb/LReaYqy96YsjfNLINHknlmfatdgV9kr/CQyQptJs2Tyhawc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5720.namprd03.prod.outlook.com (2603:10b6:510:32::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 14:08:20 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 14:08:10 +0000
Message-ID: <f55dd646-c728-4b0e-ab3e-18da8ac9e6e2@citrix.com>
Date: Tue, 24 Mar 2026 14:08:14 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dave Hansen <dave.hansen@intel.com>, yi1.lai@intel.com, bp@alien8.de,
 dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
 shuah@kernel.org, tglx@kernel.org, x86@kernel.org
Subject: Re: [PATCH] selftests/x86: Fix sysret_rip assertion failure on FRED
 systems
To: "H. Peter Anvin" <hpa@zytor.com>, "Lai, Yi" <yi1.lai@linux.intel.com>,
 Xin Li <xin@zytor.com>
References: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com>
 <43f2c5c2-6327-4546-b204-5c66b704042e@citrix.com>
 <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>
 <91590BC4-A54E-40F4-A223-A07FBA386A9A@zytor.com>
 <acDYXtVgSKbbAuGs@ly-workstation>
 <ce764071-6670-41a2-923a-88f1cd04b238@zytor.com>
 <c2979413-62f4-4a35-ad64-be2b8f55ea04@citrix.com>
 <0200a8d8-6871-4ff2-8c6a-968c2cb39a4f@zytor.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <0200a8d8-6871-4ff2-8c6a-968c2cb39a4f@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0046.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34a::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: 8637e4ee-b259-46b7-8c02-08de89aec708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/M2lpx85wA9awCfvzGENGuqGuT4pQgkyp9l1dRfq8VcILahkAgvLWw8z4iVTgziZ2fWF+kRJ4iSGWfed8ea2JNweInpJYAPS7mylxeuMMUqrATeT4ujz0IwLAoZBl/AIU0r5pFdd28kemmcZMJw53rdH1ZVxhOuasZJxS60EPy8xXUEqAGYVgwbY4KLq0Biqy3WBV2DD/bxGYsAks2ZwSI5NP5KMnW940uKiRKgwYG9nqhtNBNE6r9da0+vC5PR6KbevK8QcwHE9RmV6UzbyIdSSuuwRvrRomeB1S91nDuIIrbhjafcNzbq65Gy070H8fot7lFQSwPEjDoLMiEBgt22VZ9VCEZBKPHkk/b6p0J6ARO5M83TS+rmWoSu2HxzQ045L5RkMYNLrrwKM5jOc4wRHkec1N9SP+QNnJzhhtQgr3iacADOcUaRpw/LiaLbif6esAeohDkxjdWNhzbsi0IFsKa4BOO+RFreV1oLiJR8wl7Syf546moajO9A37qblfb516GDngkPZbyC3wAVU85idLMnln2Lz5dqpAmo8qQXAngW2TF+vhkqWl5heYO5rLp2J6XFmFmYyyFna4LPy2yAtqymCza1RISVWVsA4GMS1LXZ1geNhhl0571DNzaCTuZhlbyyFsnVnZrMyTUrLD0AJVBgoYZFbvzEReoTscekCUFwkrPrxOX9KmbLojxagWppXHkxTKrMGTwrLv1fxf0+pMhnZZqUG9BH+43rgxJ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0lVblFRU2tiUlNyT1VyTHpSNXQ5NTZKaEJKSEJxNzdIc0N6K3hSNWgzS00v?=
 =?utf-8?B?cU1aMGhkNHd1UXJlUE8rd3hxWFp1dnFDeTF6T0tCTFdCdm1KYmoxNGowZVgr?=
 =?utf-8?B?Y2hDbU9XYnF1U1VYNHZEeFBqZGM5YnhyekRSWHkvczVBcFpIR2JrNlpNcmk1?=
 =?utf-8?B?ems3RG5WU3NYdU5QRUVJRGN6NEZnQnd2TVNOeEVPaldyOThVK3VSditsbHV1?=
 =?utf-8?B?ZVdweVN0TzhZdnVRbXlsU3hRM2JkWElzeFEvZ3JZaVh2K3o2My9BR0dqUUVL?=
 =?utf-8?B?NmRiU1FSRTQyclZlR1ZWSEhkQzBxUG1VN2V2MXFjSlNyM3F4bm9oS0o4bGhk?=
 =?utf-8?B?MUdyQjczM2dJcFI4RjMxSnIzMmFnOHdVMXl2MG9YUnphZFlTVUNxc2hWaEZu?=
 =?utf-8?B?a1lLemdrVkM3R3hXalNRNTc0akJDbUExVkdjOFU2eFFRWTJWNXRqYnRKRVpa?=
 =?utf-8?B?dUhxOG9PdGk3L3BpelNJOFczcHNWU0F5eGxJaWh2NlpZK0xCbmpZNEZkNW1P?=
 =?utf-8?B?eVVzWWhMQ1dla3F0NHhEUFdNSDFiUjNKNkNZQXFadytVQ2J3T1ZneHNyUmpl?=
 =?utf-8?B?R1hWWFdOSjg4WXRYYTZldUhHOWliY1RVMUlCcHdVaTBLUE1UWGdBTDhrSGRC?=
 =?utf-8?B?a2xKNFJDWDVzVkpFNFFhY1B3TG8rdzMvUkhTTjQvWDBaekJlK3Eya1k4Q044?=
 =?utf-8?B?VklEUm9PdWVHci8rRzc4YWdKQ1k4YlNxYnJkbWV0b2FlWmRDQmswREN4ck81?=
 =?utf-8?B?dWhtZUoyWHRxZ2x3ampjSmtMOTh6c1kyWHQvWnVUM0w4dXY1RGU2NnJJc0Qy?=
 =?utf-8?B?ZFAvWjJ6R1k2UEoxcnVlZHVKc3R2SzFUTlpmYThKb0htazdDeFluU3hHa3BZ?=
 =?utf-8?B?UUtZLzJuTko3eFJMR1hDSit5ZVZjZlQxYXJQWE1hVVVjTFVMdUx1VWhWdzIv?=
 =?utf-8?B?c0M5WlFzMStvMkxNU056T2NsR1gyb24raUorLzJSdHhEQ3J5bXpRNHpBbmln?=
 =?utf-8?B?cVJjQ0RlYXpqSU9ObHM3YmNRUTZDQklHdmhwcFVwdFpMWFJySUg0TExhbnA2?=
 =?utf-8?B?aUc0S2E1SVNvcndOZXl5cTBCTmRxd2d6dUxzUlRiVVRpTmQzTlI5aklzN3Zv?=
 =?utf-8?B?NkIyTFMwamZBMHRsVXhZbTZWSGtDYVM3dEhUbWttZm9mc2s2blFtUmdFbThx?=
 =?utf-8?B?dEVOb2x3cUw5anZyR3ZOOWNweVZvaUNhSk92R3NjNm9xZHhWM1NuSndYeEU5?=
 =?utf-8?B?Tkk2ditMRmJYRndaQVVoNjRZRjhHQmhIVnppSUpMVDlNY01BR29WS1ZyUHU0?=
 =?utf-8?B?S1h0TDNodW9xQ3QzOWRVa1dHKy9ralFwbEJZNVpjSHd0UU52NURUVEFRdmpR?=
 =?utf-8?B?WDNrY1lxTncwN0dWNllIN1UzR2tHMDdJRUMyTWZjdU9IOW9RVkY3T00xRTRI?=
 =?utf-8?B?WVB2SDBKeXZRTklSTVFDZ1JCVTlxcktKek9FK3lpTHQvN3UyTG01S3VCNmZx?=
 =?utf-8?B?ZmhYZDFNdktTWm1sK1g3UW8vTFJSTnFSeDN4Zlpkbkc1c0xUbDBZY2RYOFB4?=
 =?utf-8?B?SUFGb0RZblR0eEZyTjJWTWZsNEZLeGZSaVkzWEcyVzJBOVNycmRpTXhyaXU3?=
 =?utf-8?B?dDZOU2NobXlFdzUwaWJScDVCRWNrRFFYWVJOTS9pZGhhTEMvK3dMREQ1ZklD?=
 =?utf-8?B?RDlCYzN6WldVcGJBb2Q4WEhTVDl6OUdycGZubTRhZkFNbUZReHpzV3REdnky?=
 =?utf-8?B?TlFySkhJc0RUbGY5UHV3Y0lISGNSZkVmTGF2ODlsQitnQ3oyVC9HZHVSNmhQ?=
 =?utf-8?B?cm9zSzN1YVZGa0VJbU1zV2MrMDVEb2taT09PMW5qV2ZKL2lMYUFlYU9vRVJD?=
 =?utf-8?B?WGhLUmdjTnp4amh6WjZ4b3h2R1A2Ym5INExQOHhhU2cvVVoybkZmZkt0VE5x?=
 =?utf-8?B?eml2K21mSVJ0MTJJVTFyandTZVdmWmJrTW1KZFpYK3Nib0lXTnNkOStZUXlq?=
 =?utf-8?B?clh1UzdLRXBqNlZqaVNVb3VLcThzcUZPcXJ2NGpjRUpzUzJFL1h4QVMwYzlz?=
 =?utf-8?B?d2NkQ2VjUDM3L3NPZ2NZQ0o0SzhaRjAvbnVsNnZuZ05PUUs1SlExNVpyeEQ5?=
 =?utf-8?B?S3U1NGhsNC9VeDRiL1ovS3JkeE9FckdSL3V3WXIzNkliUjQ5dExDaFJWMGVU?=
 =?utf-8?B?eG96SERQN2NTUDhQVHpScGFrMDBWMitIZ3dqR0N4RTJ5Uitnc21pS1VZSTRK?=
 =?utf-8?B?NUllbmdJZFM0TncrRFJwTUtGV25HTlBncmF4emNBVEtOT1ZJcjg5T01RdnVn?=
 =?utf-8?B?SnN1Y1ErMWl4ajJDcHNNWlBqYlZQa1VVYkZub3grMjJrVzd1VjBFM0tyYTFK?=
 =?utf-8?Q?exj96hVTZNpYGC9A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8637e4ee-b259-46b7-8c02-08de89aec708
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:08:10.2201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pNhNp3VnciDVRbicelkeh//FcHWUAMwyiq+00hkvNmLK2v9Rg33nvjcysbNW+6qOc6gdr/Gn8vWDb1IWXFZwlb/iiEwIWGR+WM4MSt72l8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5720

On 23/03/2026 8:27 pm, H. Peter Anvin wrote:
> On 2026-03-23 12:17, Andrew Cooper wrote:
>> This doesn't really test whether FRED is active.  It tests whether the
>> OS is not providing strict backwards compatibility, and I think will
>> malfunction when there's a hypervisor above Linux providing strict
>> backwards compatibility.
>>
> But that applies equally to IRET, no? If the hypervisor clobbers the segment
> selector like IRET would in the interest of compatibility then you have the
> same issue.

I suppose.  I for one don't care to provide that level of compatibility.

But for SYSCALL, what are Linux's plans for CRIU or RR ?  I had to fix
SYSCALL legacy behaviour in Xen for the following case:

* PV guest issues SYSCALL on FRED system.  %rcx/%r11 not clobbered
* Migrate to a non-FRED system
* Xen uses a real SYSRET instruction to resume execution


Here, the guest continues executing at whichever dead variable is in %rcx.

CRIU/RR won't be exactly the same, but will suffer the same class of
problem when moving between FRED and non-FRED systems.

~Andrew
