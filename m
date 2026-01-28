Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012003.outbound.protection.outlook.com [52.101.53.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F0D302779;
	Wed, 28 Jan 2026 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616108; cv=fail; b=ejn54kHnlO9JXb+ycP9oWmGrBNSQmCKmrrlharDy8hEMiJKi+LlFy1WMfBy/XZ+pOgFS83Pon4n9qpSNQ1M7D295Q2J59j507Ga+yCDr9nbqy19JosW0d43lSEb/a5adWjCOoTk4Va7YMnyy1b9fglfqi/26dR5M7icpyjJ8HAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616108; c=relaxed/simple;
	bh=rkvpAiwUQgLHfF/TbJVgc/DHXdvPwsWZFpQ/ShcRrMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Cg2L3UVnXqK7B8E7rveEmqfIOQGwrVgkD4URKn5BcDjNbsROSOOkjdb9m8Jc/2nMS++aeP8bu3KrUk4nUp/mNOQZvXYJ1b91cwYHLLffNe3J+Ekytln6uGMvxhaGg3TlqTNtiIoTRwyMEtSDRi8pCbA6Otpdcubc38UOlfU/hZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rvdwPw4l; arc=fail smtp.client-ip=52.101.53.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rvdwPw4l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Afmj8zN5hYi6HLs/BVSu3yRdy7XH1EUTDuUM2+hck1TiYQJ8KBZMHZ0PujRKkD981PAO8y8aiJeC257B3sOJmgSHD9i+3TFL7R0UmrdxgkNC4N54bJE6sx6o5v9Z4lWlYgQvqMKuJ2mpEicG2GVTUudtoGNCboh68jj2YvlvBOZ9DZxsCxW7NmstXd4/p7JqU6+oEmHyijmPGjNPJHCO8JCnMR4c9XvTMMEtdxbRAEu4goD9Smtd5+7CzsqRBlnbm3QyMUZI41pkODRuyGGuL2L1Csl1JFN7W06ReVsQ2B5tMq81VmPLGztc4u87ha9hH6JO4i5xP1+1P8IPrOK63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHpE++3uwjDoPom2DCl7K/GiKGFiwyeHvbgb30Z8uzY=;
 b=GMyK9JH1WprUTukDWgqQNtfhaSREbbE6xkEMb5pgN2U+P1AlXd0Mg0BUYEvHHIl9vuTGfp/iPWNVZtWA1Lvvx7j/Q/sjCRuOiAU6GyvAHLUFNQBPSWPnvOpzw3g7uc8WRUL3R49zJN9Ehy1P/nXVYGC8rOK4Jp9AiU6gwUQAii99oa3MXt8PPqmqI/3+IxNUmKnA3fWf4hW8LosP9nLqxnyEJuP84iFL+SkZUo0RzEY82d/Jw5oJrnGnTW+IAyP26kcE5pMyTtt3rs0l9NlDm0nntx1JYrm+eAd/3225xdDYGL4ac0xjPBZ+EVMGFd5s1TvqMgp3Gb/wm2T5phkeZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHpE++3uwjDoPom2DCl7K/GiKGFiwyeHvbgb30Z8uzY=;
 b=rvdwPw4luiJrJ0IOtTbve6mrvDkjpWMTjIxQd4QuNkbw823W7r1xTBLxQ7Fc8a6P74PW5rLzoCjLBPIbJQla+rV5e20HyoSzm+KV3AxPev7xuWgtoyr0V9e9Q25wY59WMAPddSto0YkWT44LK4mjXl2cl1iKj8t4zkZIgrh8TOFC2atCbLzhdCCgUibmQbi03Tx4DWqOXCMhUqkgC4jqwlamfiim/j41/3HV1pM8oRWnB7yb9SGWl2NRsE5bbeSKDmplEPjX6YMlAeiRudE2pRQ+HLrzM6EW8OP+2CICPr5XrAJELwzJAau9r0i8FR90b6txgRts5nAE8LZejbjP/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH3PR12MB8073.namprd12.prod.outlook.com (2603:10b6:610:126::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 16:01:28 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.015; Wed, 28 Jan 2026
 16:01:28 +0000
Date: Wed, 28 Jan 2026 12:01:27 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260128160127.GC1134360@nvidia.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
 <CAMRc=MfP1_fH91AVjerbnwVfhA0oqBKV+CTX0_1n32g1t-Pvuw@mail.gmail.com>
 <aXneX-aZofvuk8gl@ninjato>
 <20260128150538.GA1134360@nvidia.com>
 <CAMRc=McE5yTQ2hcLiR6asQWEi=Y1rhHzqq7G6FR58LCFZi6BAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McE5yTQ2hcLiR6asQWEi=Y1rhHzqq7G6FR58LCFZi6BAA@mail.gmail.com>
X-ClientProxiedBy: BN9PR03CA0068.namprd03.prod.outlook.com
 (2603:10b6:408:fc::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH3PR12MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: d448a260-25b8-434c-3f29-08de5e867ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bS9JODRQbk5FY0orc2pBUDlkeVI5MzFSemJINXE3RFhjUFFRdEJLbGJJeEZk?=
 =?utf-8?B?Y09MbnNwbVh1cTIrLzhWektTUitkN3lKcWNiUGdIL2tZNk9PYkhQaG5sR3F6?=
 =?utf-8?B?VS9mL01uMXZQbEdxT3Mvc2FrNW56aC9QS1BBQWhXUjFOQXBKSVoxczBLdFRM?=
 =?utf-8?B?TlA2MFBtR0pCQjZwcm9nMzVCbU15RUVMSHlzd05pYmdLYk1vem5BallqMmhC?=
 =?utf-8?B?ekFwbEF2OWpsNnZsVFd1bDFKc21scStEdjlsZjBpeDU0aGlsSFl3MFE5S2tp?=
 =?utf-8?B?TC9GSHVUUllQRFVvaUNDemNHVUVuWkcrazhvdllrdEljZ1l3czhETmdRYWd6?=
 =?utf-8?B?OEtzZXBCVlJBdGN4KzFJL0JlM05XWnpmSzB3WXNLN3JscTZiZldDaFlwYWxy?=
 =?utf-8?B?WWF2LzB1bGg5RGZ0WHVsUXNKaENUY25YNFgvNjJMelk1cUlBTGJoeTk5SEdS?=
 =?utf-8?B?UVNzSWZrcUZyUWI3T1lOcHlBaDBiT3V4UVZzZXVFSCtxMVRkZ08xKzVrSzht?=
 =?utf-8?B?ejZhUW5zSW0yaWQvZGRYYndVcmhHNHpjU3g3czRwV3g1VEF3SHA2anpZMHly?=
 =?utf-8?B?N1A4b3NibitycFZxamNMSTdRMzBqQlkrbFd0UXZ1YkZtN1ZvUm5KWWxzeTFE?=
 =?utf-8?B?R1IzRE0xSlpsVjRzQkhCZlkzdFhEMCtTVHlYdkZmOVFCNHJGRlA5RlJlNUdB?=
 =?utf-8?B?NXE1NEFqVU1ZQkhxaVlzcWZ3WTc5a2hFUjF0MnhrNURFL3NWcnNkL3Y3T2pr?=
 =?utf-8?B?NGxYcm5MTmw0ZThrSXk0cHB2M3h4aFpOQVplV09qWmR1VlB1OE96Y3pOcHYr?=
 =?utf-8?B?Y2ZXRlBFd1AvV1l5dW9WV0ZDZk53bzNJSjRtOEpvaFpHeGUxREN4RUVFeXdM?=
 =?utf-8?B?dkd2WTBTKzMxME5SRlJ4dWY2TnhQS2xVSytJTytyNGk2NDFDb3Izeno3L2wr?=
 =?utf-8?B?NUZ4cGRuNE5sS3RrV0FCb25RSjVzUzhjekZhZnRrMVQvRkNwVXlWUnFOcm00?=
 =?utf-8?B?bEJSTDVscnhJZWZnQ0dpaGkvV3ZiaFZzNklXNDFUci9paGVaNkcraHR6Wm54?=
 =?utf-8?B?M2RvMHVxZmFyYm52K21LeHZySTVJeXNBa3diazhMMytRRmFNV21sV2F0U21E?=
 =?utf-8?B?KzRsWVkzVUtPWElZeXZCVUVLcGs2UEU2UlQ5SjQ5UWVlZE9Ea0FvM0d3QXVr?=
 =?utf-8?B?Yks4ZzZPeUdCNFplanRad0lkcWcyWHJpL2tESXFWVFJUbnhsVXNjSFpEYmNN?=
 =?utf-8?B?dWJtbVBBMVRvVWhOTDlNcEUwMXdJWUdFTndWM2hrVXdUeDZGZEpxanNja1Rl?=
 =?utf-8?B?eGxYbXJSQUZqSnh6c29TYTVrQzBHNXBRVW1zeFJVdTlDZDlMUzNyWTh1OXNN?=
 =?utf-8?B?U1B2djNIUEFjbmw2WGxjem1kZGVLYVVxRmh3T0xtb3VDWEh1d2dld0xDZGNO?=
 =?utf-8?B?Mng1SXhjSW11bEx2aUljMzczQUhFcXBGZFY1TTRWWUNvTWdPUWx3VnlxeW9K?=
 =?utf-8?B?SDhNQTJSQnVPTjFZZzNUb05GeWRRSUpyb0hTd1FObk52WU4xN1JQU29hcDhM?=
 =?utf-8?B?ZHlPcjRsQ2VhL2JiRjNEcjhkVGxHOWcyb3VjdDJkaXRuWkZQU0JaRE9QVXd5?=
 =?utf-8?B?c3hpTjFDc2lkd0t3WmlUenJWMklEOU1ZRjl0em8zVkZ5SUpYc2RtU0FsbG0w?=
 =?utf-8?B?Y1ZUU3NDaG9oNVFxTjBwTHRvSFE0dTJ1M09GdG9WU0cyWjNtWDNvQ29kMWV0?=
 =?utf-8?B?aDJ2VWI1dW50TzBMWTFKcDdrM2RtQkt3U245V21QdWlPdGttdEdqQ1kwUFBa?=
 =?utf-8?B?SWxUT1RmT1p4YW81clNSWUJnbFBRTTFLN3lES2JWdlBJa2hidUF6MTJiWUtv?=
 =?utf-8?B?QUlueElwcS85b2pPYVVCbkdpb2MwdExEYWhuRmh4YkxMV0NFSE9raWlTbGd4?=
 =?utf-8?B?aVllTVJWQUo0RnlhWEJXN0JUWlhnbHZGaFV5SUZHUllGYzhWT2NaZFg3aVRq?=
 =?utf-8?B?aUhzT3dwbVBraDI2dlNpOU9ncmNJUzErRlA4SDdFemJUR3A0MVlJYWlWN01v?=
 =?utf-8?B?L2NHdTR1TUo0VEdLeERKVkVCSGt5QVBOaUJMV3RPVkU1enpJdndJWmNKSVI1?=
 =?utf-8?Q?g2Og=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHpPL1JpUmpBTFJsaUM1eTUzTGFnQXVGSTdpQ3lnek1oNDl3Tm1oTnE0Nmkz?=
 =?utf-8?B?dG9QUzVoZDJVT2s0N3AzdmwvNkFhZnBWUUNZTk95bkpuM2VHeWptSDA2V2Q0?=
 =?utf-8?B?eUFndGoyamFQVXNVVWIxZ1I3K01PUHA0ZjlpWCtZU1FjSmF4NjNSN1FPU0ph?=
 =?utf-8?B?S2dNS2dVS0RuSkQ4Mkl0Z1M3WXZZZUI2WGl4TTdLUXFiYW9xNTREMlBaeWNj?=
 =?utf-8?B?QkxscTAyZk8xL1k2VFRJUlBXUzJWandYN1p2bTVmRGliN3lsRGVzQWNicW9z?=
 =?utf-8?B?cnZvTk0vOEQ2dmhpdW9uRlRjRTlpNHhLUzg4dmtyWkNDQ3lJMjVxd2lRWENl?=
 =?utf-8?B?S1Q3WGNpcm56TWp3eGcvNDU4QnRjYVFzL2hrZW1FVWFhWWdUN2FxWFJtSm5i?=
 =?utf-8?B?Zk5XUkVlUnRGWU8zeUZxQ3Nwd3p3NTNlN1ZPZWdtWWx5aUllL3REcWI5RHVV?=
 =?utf-8?B?QVlhbGJVS2I4dnZVcXBGVWxjRlZhdnF3ektBdW9pdmV5K3hYa1VZNENZKzcw?=
 =?utf-8?B?cjlaY1ZXUXRyc3pkWGxUcC9qUUtPelZ0SEpZa1Z4L0RTOTJULzRINHRmb2xk?=
 =?utf-8?B?ZjluSVdVczBXSTBLbmovd2RDMkRkd3Y2T3E4UGNadmRHUEdteDd5b2tqMEVK?=
 =?utf-8?B?MEpBK0gzSnV1YjV1LzREY3dWckdQcUdOVzhURk45ZG9yd2FRanMybkRMZnh6?=
 =?utf-8?B?S3ZwWXErUXVHZHZpK3d3cWRnYnlwVC9RYjlGdmI3UEdBZk8vQis5aFZYTmxs?=
 =?utf-8?B?dlliVnJ0ZTd2QTlYNDhvTzNuUHYyMUxGMkhpNEE0QlBZMHhhS2xGRlgxSTc2?=
 =?utf-8?B?eXRtT2dubjA3NzRvZHh0OGU2R1VpTVBSLzRCVnpsZXJxcURqTFdRaG4yRTJn?=
 =?utf-8?B?TjFaNHNrNHEvaTMzQngvZHdCYjR5OXlIY2lVdEpuTXIzaklWMW9UQUszaFZ2?=
 =?utf-8?B?YmovTjZOa1hHaXdiTm91UVFSVWpITkY4bThpV3h0TDQxMitiOEJFaVJTWmJ0?=
 =?utf-8?B?R1RXNk5Hei9SUDE0U0xyNEFlejhwQlVCN29wTTZlNGRXSG5zSXRoT2Vrb0Ns?=
 =?utf-8?B?Zk43YlpaMGNrS25QUFFnUlpZZmdXVWFnbjBKeGh3MzVWTVdscnp0dUdBeStV?=
 =?utf-8?B?dUd3aGJuYWt2am9VdVpXdmd0aG4vSUl3V1dNVXRIR2RLTTZhaHdva0RLbFVF?=
 =?utf-8?B?ZVlyc1p2MEhjcXJiNnB4VllGQytveThzUWsvV25yQWR2L1IrbldFMldpM3ZQ?=
 =?utf-8?B?NVpqOWdIMTVUK0VrNENGSVZxYWVkN05Md2lOOWJ2N1FTVklpMk8vS25KcEY4?=
 =?utf-8?B?WFVUM2FSazRYNnJ1SFFwaGxWTkFkZU9CZkZ0RzFOaXQ1RkF3dWcvWmtHVW9a?=
 =?utf-8?B?Q294QTdhMW5CcUI4RjdmTjNCRFZ2eWIzOXRUbTFzbXJPWTJFbUlMQ1BkRGNx?=
 =?utf-8?B?SFZTTGNIcjh5MEczbWVFWGhmZ25LSFFVNER6cmVpY2JINFFXamQwc2Y2a3BX?=
 =?utf-8?B?a0JqNG15MmdnQVRnTmQvOTl1L0J1NjNwZ2g2S0plcDA1YlRjSUJCOUI0MUto?=
 =?utf-8?B?Qm9LTCtjYVlpVFNObFZ3bUQ5OVhITmJBOElmNzRJaEI2dW5QWG9ockZOaU9K?=
 =?utf-8?B?dlZGeWNCNUNZVFhSRjBWVFp2TlA2UXV2cnNTRWlKeEpHbjdjWTFSWEhrdlZy?=
 =?utf-8?B?Q0sya0NCSGpMTU5KcWJDdHg1VFpQQW5aZnZBSWlwakRTbnF5S0UvcnJqTExw?=
 =?utf-8?B?dEt0OUZzaHNXcTNlWDRzampseUhOZm45YnM1RFVkcGV6N214NCtjYXRaTThW?=
 =?utf-8?B?dmVTd3dYRW5ocEZQb2VKQ3JZZ1NSYlJON3lhUm8rOWpnU2VHczF0bFk3T3lW?=
 =?utf-8?B?bCtRVE5YdnhRaCt4RXQ5NEpKWDVJNEhSVjFvVDU5S1NQd2VPVXphdG9WUUFZ?=
 =?utf-8?B?cGMvVjloYWR2QU15VnNja3RXbUhkMWNkZ1pya0FjdVViNWxFWkhYUFc2RUJU?=
 =?utf-8?B?bHZ2NTNURUdVMEUwdlFNdFZKUFNNMHAvcFkyZWx4SThZVDFnTDE0bmd2cU1Q?=
 =?utf-8?B?OS9PS2lTMG5XZ0JZNGdxcWNZL3h6Q3lNSHlxZFl3OUdKNXdiTTBidHYxWiti?=
 =?utf-8?B?bFBOaVJ6elJJWjd2Zm9SMTNFOVJKVzZKL3RyZGdSWWVSS09PeGFHUk96WXdT?=
 =?utf-8?B?WDk2QTdtYVR6OU5uYkFHN0JiazZlVmVPRDAxb0FJRUNCdk9kcU1sYytCem52?=
 =?utf-8?B?VXc0QS9GcUZOdldISXFETFpSZTJFT3Zxa0dZRUdDOVVNS1BLNHVhbm5XanJ3?=
 =?utf-8?B?dmhDaVpRZjFvTHNzdjYvdWxSMWRDeFRBSEdhN1lyQTBCa3ZNNlZZQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d448a260-25b8-434c-3f29-08de5e867ee3
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:01:28.2586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJCXZSk0Nu9ZzaGy19Aq2Y6sdL3GnMjCr2t8D5ffKRhdd+iK7b41dYaYvdnm0uzl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8073

On Wed, Jan 28, 2026 at 04:20:02PM +0100, Bartosz Golaszewski wrote:
> On Wed, Jan 28, 2026 at 4:05 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> >
> > On Wed, Jan 28, 2026 at 11:01:03AM +0100, Wolfram Sang wrote:
> > >
> > > > One exception is I2C where the logic is so broken we need to first
> > > > rework a lot of drivers.
> > >
> > > Let's say "bitrotten" instead of broken. People used what was available
> > > at that time and they prevented the kernel from crashing, at least. And
> > > up to now, nobody had the bandwidth to improve that part in I2C.
> > >
> > > > Wolfram is on board with that though.
> > >
> > > Ack. I want to emphasize here that for I2C the SRCU part goes into the
> > > subsystem, not into the drivers.
> >
> > I would just gently advise again that SRCU is not a pancea and should
> > only be used if the read side sections are super performance
> > critical. I'm not sure that describes I2C. rwsem is often a simpler
> > and better choice.
> >
> 
> Sure. We're not there yet so that's TBD. The reason for using SRCU in
> GPIO was the fact that we have consumers that may call into GPIOLIB
> from atomic context - so we must not sleep - but we also have sleeping
> controllers - so we must not take a spinlock before entering driver
> code. SRCU was about the only synchronization mechanism that worked in
> all cases as the locking at the subsystem level needs to be
> centralized.

Oh, I didn't know you could safely use SRCU within atomic
sections. That's a pretty good reason to use it in some places.

> struct subsys_data {
>   struct driver_data __rcu *priv;
>   struct device dev;
> }

IMHO this is not a good pattern.

The thing to RCU protect is the *driver ops* pointer, not the driver
data. It is what I was saying before, the goal is to not call ops if
the driver is revoked so that the ops can assume they are in a
Device<Bound> context.

It should not be normal for the core code to be touching priv at all,
it has no natural reason to ever load it. It does have to fetch ops!

Jason
