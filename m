Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012003.outbound.protection.outlook.com [40.107.200.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715DB35F170;
	Sun, 30 Aug 2026 08:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788077165; cv=fail; b=WbEcq/10UwdvYjr0UBuljO/zbxEHihSY/sCGIfhpC4D8Qxd5LbOQZOz87NLKxgr3WMBJG2KcFCpshzRcpvYShIOm2pkb35dA1XALLwm/HEB4doqhwflNVm6WdCRHnJldJRVoqZjzwvc0pUFjEwB2n3p4cBiYh+ycw6BIc4lxkFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788077165; c=relaxed/simple;
	bh=M+KezEQCokkArd9o7UHZDQHtFP/0XjPGIPHZdKUk+SU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Bmn6l1A7maXrxwhgZQuIko4LIHmLkLdZOVAajEnelZpupcf2vTglnxSK8WXgdUJby8B9euemhgRwlWUWC0EtDkh974LmLtqbyD4sHUct3zJx+AxU6aaPWQUSFyBTfpuDcg6jsnvJe/24VI/AC5ovYnPzulC9lgjVWxJbKwnhysI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i26P/GBF; arc=fail smtp.client-ip=40.107.200.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i26P/GBF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhpO3OhY7aJ0hYp+hvmK0dKWFNVK9vUl+M1VL+BAMHuKU0NUhbdWR16SafKBqaWpq7btM8dguAg88w52wMfp444bwweXzNXzYHgIkHPCVJ9lUWSZSFj2+h1VXLiwgBbFmfvHRFilfz2MUbhFPu+kcejK6wzv4KXoSBnVGMfrh5FLFfYIp/MhcoQPg7S6LtS1wR37T8+BR6w4jTKZ41ZpJFTltdX+9qRp5mfSazXeO2hgcKlahqqoZe87qKVx5cdtzJzO+jvO2Aain56EUQG43LlmfbxHpPf0iE0oEAESgQO4lIXA83wVvLJkIDPOlEw+Sev8ck7uf4zaKvLmtXLq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Npn3XNtxuYNWnlcn8BIamT2d7TswrdQeE4bYwQtm94w=;
 b=C163ovVs111mi4zab9Qofy7nx1umIV4GEpCV6+M0AuAXi+Gcu6ixvWtkryo6223+Q6Daoy5FCPjqe+R6vOYHhZxa6l/PU2fnwgu51ax0Tfio5aXd7rpa7e5afsHsUsbxH455f25kDL7oEQAOoqU2VOgY2VTQq1AY5QG9Rr7UiFeBp6F/gWSS+2q/fhqQcaIUtP0y7GrMGMEnISjFzfCR0XpgzFJqPfCK2OJhNOz+8W5Fn9ml5f9/MzxVt0v7OJ5vFBfXXdRPm2sg5wVz3LRAfAOV2YdEKgVQmo4oD2HHAFYGxaFDQ91ycXSrdbhigTZtGPCiUdrYvv8EwBBTYPK/gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Npn3XNtxuYNWnlcn8BIamT2d7TswrdQeE4bYwQtm94w=;
 b=i26P/GBFYqRa27YHpDT00q3GGBtCpmHP9WUsTtRUDo5e71avCUxas+6v67WkMRrp3HNPjjTe3OtPX/yDtY04J4Ze7XyIeDAC2a34WzdTFJ8bkx+HeDVFqorte7vA1TbnaVSRf5hjvOe9kapoAr/R+9BIQ7t5ePATdvfFisT+S8vzKlLJih7Vf5C1LlJt0A8/zeB6EKRfVxvxgyKf9W7F2eHBRn5JzoVu5UGZkkeq96yk+d3m5rns13og7fm8GCGcgTMbb81s6iqcPuxMvgR01Ypemfjf2ly6nXuPJMqWIy/ZgGbMexGSrNwjEe2BywhYwvbZUwsr3+yiYGXzLAUJeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6802.namprd12.prod.outlook.com (2603:10b6:303:20f::19)
 by DS5PPF78FC67EBA.namprd12.prod.outlook.com (2603:10b6:f:fc00::655) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 08:05:59 +0000
Received: from MW4PR12MB6802.namprd12.prod.outlook.com
 ([fe80::51f4:a3d9:b44e:9587]) by MW4PR12MB6802.namprd12.prod.outlook.com
 ([fe80::51f4:a3d9:b44e:9587%5]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 08:05:59 +0000
Message-ID: <114e426d-431a-445e-addd-dc30b2c70f0c@nvidia.com>
Date: Sun, 30 Aug 2026 11:05:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] selftests: drv-net: pp_alloc_fail: restore ring size
 after timeout
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yael Chemla <ychemla@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>
References: <20260825090758.308167-1-noren@nvidia.com>
 <20260827093109.5b26bac2@kernel.org>
Content-Language: en-US
From: Nimrod Oren <noren@nvidia.com>
In-Reply-To: <20260827093109.5b26bac2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0006.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::6)
 To MW4PR12MB6802.namprd12.prod.outlook.com (2603:10b6:303:20f::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6802:EE_|DS5PPF78FC67EBA:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a504eb3-a70b-4ca9-fcc1-08df066d86b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fo6HELHTcudyWA0Tp8mOMTKU807tHQjX2foeL+lf1OcoQRVt6pLbhXN0GjbSMOzyivJPlUFMgX35CKYrAKNA3z8+KSX9Net6lmbugymrNcqY4z4B+MLIaDKBeV9G8l5rz2cVZWbo0qjyQiCrgi5b5gfJd/VDS+H3sq+xMFCq/V9LsjZnYA2hA5+3dXyde+MPT3r3SY6yv8ONbJTnW1hZgdIETEK9xOzpWzigAXFRvhT6MhDBkkXGtVSgj6RAiHAmyItaO1SYzo9a4nJg7hu8C7IUjyqouwRWN+o1BMy3Zhz3Ci4/NlP1JBD2LLM6PxZBs4UpYah6HmF9kBP9W7KlQBRbTxSACiMshuD0v5uAoeuXTlCxJg10vjV5W7qIr/xJCQavCm9AAg4vA1+SAWyIu3anNVIacWBoSbLC7JLdZVt/NbL7+gaeA3z/m5Y2tasOFu5NWPNDuDeoWD6h17VMXrmGHKbQjYuH/WFBHK2cJccW9R36axuSrT3RF+JwKaHmJzfqjsVdGctvAH11KeddKlkKJpTHC8WEqL8xh9qJkxs4fCGbdV8DAuJEgvw3n17vf0VzjSaiLZE7vI79YQ37VrbVD4K84S1Bs6CTfNcVnsJ7pNgI91Cueos77frWXclodRxqh1L5AoT9dr/xK0sYuiiHM+b4f4YlbvzvRJw4KGo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6802.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3F4bTltOFZMRlpIRGo2UHBkYndGRWp5aXdxd3ozQVRaQVJDUDNGRFJkVld3?=
 =?utf-8?B?MjRNRzdNRWdMbFdqaUdCeno2TnBzNmJnRzl2VVgwZCtjWVl1YWRxN2RrVThS?=
 =?utf-8?B?NW0rVEZTMzViTXZxTm9nQ3d6azhkaW5vNEpOQVVCSWZHTW56amVOU2tacHd4?=
 =?utf-8?B?SEtnSkNwM3ovOVpKV1R0L3hyaWdkTll2eU9XRG53dHN3U2VFZ0NBOHo3aWt4?=
 =?utf-8?B?d1F2bjBnMi9xVlcya011N09MOS9Zc251MWszS1N3T0VKcFpqNU5aaDc1a1lU?=
 =?utf-8?B?S0VvYXNzVVV6eVpLS3p2dmRRUVpBdEtZRnFucnlmQUtxMG0rOG4wYTNHMDBC?=
 =?utf-8?B?WUpxdVZQMWh5S25NZ251d2ZhVXJiZGJzV0JCZXNLcGk4SDV2RGR5a3hhUHQ3?=
 =?utf-8?B?NGlodURiR1RpM0hIQk5NVlUwcXlaWkZFZ3pBSTVwMWwraUxXQ25PbTlpUW91?=
 =?utf-8?B?Z21ETnIySUNMa3RlcDFlZUFsR2NCY25rY3MzcmFhYmVHSHJsamlua05kenNi?=
 =?utf-8?B?VmhkbjVBU2VGSEhzWWk2Wlo1UVdJU0Fxc3VvZnpiNDRGMUtqWmZDYkVSOFd2?=
 =?utf-8?B?VWdrSE5iaGE2S3ozTWlGZm1RRXJYMWYrMitUKzlROFZjWGpzOWhMbXJzOWI1?=
 =?utf-8?B?eE94ZURFQndWOTZlU1M4ZWVPYkZzVkVUMW9BQXNBM054WnVZVU1ZZHV5aEJm?=
 =?utf-8?B?Ly9IMEFmMWd1OVZZL01pY0JtdXQvMFBWdmROZXI2SXFqbUtUa05LMjJLNnJq?=
 =?utf-8?B?TWM1WVVNcGZnNFkybW9zTnd6TXV0ZHdaOTBuU0hpWndBK1Fvb1dOM3BPTnZh?=
 =?utf-8?B?cWJ0Q1JMMWp0SUhHTi9LU0VDMFplanUxQ3RYMTBJQXlxbDBxcUZTRTBtSVNZ?=
 =?utf-8?B?cUtEMGJOSUxHWkRtSWorSExQQlBqOEJpZ1grQXplVFlhckxORlBkYlBIYSt2?=
 =?utf-8?B?YnBXMGpjckxpVFFDeDByQWZkdlh5V3BVZlRCOFZYL21jK2VxM0xJTXp3eGEr?=
 =?utf-8?B?d2cvY3p2aHE4dE9jMVhmc2hLeEZZUk1xQ0hjT0l0UllOQldUWDl2ejllbVJY?=
 =?utf-8?B?VzM2bjBxTXBQblRWZU1OZ25ObkR0VTZEZG54QloreDBuc1RFb0szbCt1eVla?=
 =?utf-8?B?WlY2eVNDNFVSdjE4bVRBU1ZhWGhtcFNqOUppd1FZRVFSV3d0RUowTEtTU09Y?=
 =?utf-8?B?cm5QMi9DSmU2OWMyUkw3OU9SbHRBQnduYTI3RlNTOURPY2tIdSt0VjRVUjlL?=
 =?utf-8?B?djJzOEU2YTVyOUpsZzhoZEdrRThWdUloM3NKdktsQVdZN2NPSXBjVURZQW83?=
 =?utf-8?B?c256Zi9PeUtXMC94VHI0bXZJN3d4ODkwMzJpcGRqRWpndWJVTTRYb3BuTFd4?=
 =?utf-8?B?UmRjMzVPcGVQVHg0dHNPMk9WTkl5NU4veTVpOUZEWGNQZm82Vk9rWklpbDFO?=
 =?utf-8?B?TjZSMW94RzZtL0tWSnZoV3hYRW1NL0h5KzZkUUF2a3Z3eDNkeVRrQXdUYVhr?=
 =?utf-8?B?RWtGRDhyY2o4K1hkQU1PQlFjRHo0WnJxRkJONVZJaTNYbjhUTzBXQ3NHaktO?=
 =?utf-8?B?Yjh2ZVlWVHJ0ZGVpdzZxbUx1cTYrN0NCNm5EL0xWWWl5VzdDWWk4YThmam1K?=
 =?utf-8?B?bCsySlY0TmNUSGhHZlFUcWFIeGZsKzNkdXhjMTRPWW9VQXkrNjlCSlZFZXNM?=
 =?utf-8?B?YXNKS0sxZFpZY1I2UEhCR2lXMVhvYXlUTGZUYkdNeWZZNGJhN055VHBScWJH?=
 =?utf-8?B?YUxiZnA1UzBjRWM0VnpnT3J4WlFWNkZxTFZhYUxoWWpWTzREWXdEaGY0Y2Ro?=
 =?utf-8?B?UnFNTlM2YzA1U1J3SjhRdmlJanZCaC9rVExtUEU0YVQ3eVpOOXhhRDdlRDhY?=
 =?utf-8?B?cWFRQ3AvNXV6ejN2a3ZSR1V2V21WUHZsc2RhdWhJUFhSSll4SW4zVGRpOUxG?=
 =?utf-8?B?NGtpY1Z5dlhFTmRTVFRRcldXeGFwdGFObDQ0R1dvQzM2UFJIWVpVNGF0OHU2?=
 =?utf-8?B?R0NzZWM2Y1lRUzBkdjU4ZjBaVzFnMCtSRy9IUlhKQ0czQ2UyUjBLc0JTWWFx?=
 =?utf-8?B?MWlQczI4TVpOVm5xN28wSGxwYU82UEo2dHBuNHZud3pROHZEc1lEQ2QrSUJP?=
 =?utf-8?B?emtiR2YzKzR0S3VjbmxUNCtSdWhGL0FYL2xKL1VMZE16N1N0QTVJNzZWZzVO?=
 =?utf-8?B?UlFJeitIbTJsWUo5b2tPSGVxRExPSTh4NFdDRjhMQ21pcTNiVGRQcXhkZTl4?=
 =?utf-8?B?TitqQ01uTzd1WWd6dEhkOXViNnlHUUxuanh5cjBtTkpkcTgzSXh4cXpYaEFF?=
 =?utf-8?Q?5InrTGl4h85SdzgQxN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a504eb3-a70b-4ca9-fcc1-08df066d86b3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 08:05:59.3420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQ2UrBRJCvtYAqlmdR55EPfDkzBnXOC2Qz7v7A4aeut9SkiqNN/hTgKvUs+SZIgElmu04xTq2Ivxw4F7kToq7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF78FC67EBA

On 27/08/2026 19:31, Jakub Kicinski wrote:
> On Tue, 25 Aug 2026 12:07:58 +0300 Nimrod Oren wrote:
>> Would it be preferable for cmd() to terminate and wait for
>> timed-out subprocesses?
> 
> Meaning send a kill signal and then wait? Does it help anything?

It can help isolate tests so unwanted behavior does not carry over, like
the timed-out ethtool command continuing to hold the RTNL lock.
Rebooting would address this too.

> Regarding the patch - I'm not sure we should be complicating
> tests for this. How about we make NIPA reboot the machine if
> it sees subprocess.TimeoutExpired ? Adding defer()s before
> seems like a bit of a whack-a-mole.

Sounds good to me. Rebooting will be cleaner.

