Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023089.outbound.protection.outlook.com [52.101.72.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA25168BD;
	Sun, 22 Feb 2026 16:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771778566; cv=fail; b=h6H1eLNaqisIQkjX+N8jUNeBoUO7UH4caI2tuwuRa+zhhwK5pKK3Fbei/+SaQfHHKt7uOMpCYib7ZzeS9/7tRF3RRnf0Jd+5m0nciq2Q8Pl4Q/L03mDcxJwPjyUJm/J0vb1butETb2CXYza6irEkV5gRAIsZP3mv9AVM1SrZ498=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771778566; c=relaxed/simple;
	bh=bt9mw0IP5bfEdskMLqVZJ429cfoHidVUZKkWERtUk0Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YqP++BRWwqIBhJ2bNuvvuO/5ORBAGMybMn3qNf0+XaSAIUvMjqmIclSa76+RTZi8Iz4h1D2hC5wAq8SgGmpDP7nQR4hXGy7DfRK6dHmCHs3/WejKKu3R7S635f8DDQWvyVW7AV0Llg8R6V0Kn2FXLiJWLqs1slqCeN2VM79nJ3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=fA1bCrOx; arc=fail smtp.client-ip=52.101.72.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="fA1bCrOx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjWYU1GfBinGs1DsPilWm8AurwTHTCI61Q4115z1FqVOuz4ItqhE38ki0UZzyLZDhi5mPN2wtAr5zAE4wTghcZoOGJQFjmqg2M66Gb9nn0gdWagk0iXDBZwRmDbQmKgAGrbINtoESx4mp4lg5sLvOfrLvntGDezHiE7wm8UNDT4zrDc8CV3qF6i8xUwJlUj9CaoQReNvuHzp5Ke6PuelSqBUC3KfNjxEJkj5+9CLlOMZ6T3Q/2G+og4KifvpMsienm3gAfEVNcTa5qx/EEIPbohQIQKSiLb0oH1umppvgOJyLnYNxRxcptREG9vqxVdW5sGzk5+AUSDUsqAWRIWG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBAlgOGTm5Hk+VCMBYR0gN+8WOlsyJ+Kk8TGbJXN68Y=;
 b=D9477LfO0rOl28sEIUBsHKIj74L4v6St5s1Uk3GzbPW8pa6b+OCV+EgqQYZd8+1TkC5jEnxX9NPgV2p646B6ILQC6URX14R4/QpGzdCtWE4R82C7Tk2fNlMTd6hwgtJcTxQm3hb0WnTn2sIg5PB2j/2pCiVWwjAaAQpEc5jxjd1+tvwlhM3eRN8YKul900yvjnTUa0wzLHAh+kPOT+COro8MuUHPikUBB0H+abkOXvM9h4u0sKGi+GwQ9ZgepfCPHRdkcBptkiYHUQzGAHr5Y2LoQ/eGqOlrR0StE3Mv7AbCNGvyASuD0+JqOXyOULoWc7g97yWSUvilqRtLVBpaJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBAlgOGTm5Hk+VCMBYR0gN+8WOlsyJ+Kk8TGbJXN68Y=;
 b=fA1bCrOx2xRiZibI/VujsB+UucuDyx+6opmT5ehIpW2Q5C6hviN8op03c2tZzEefv9tzzv9x3cAZNk4f4I2K6tVdPOX9I3CK71GNK7hqPHf6N2Sfm8Sz3asdNP9LMJCd5boWOPHbaPha73IhTDaaoWDIQgdDLZAgOgIL6ybFTBLUDUPwrGfWhvbClmAO0vkWHCYRVGiPV83ftiEC5JD4kx8q6upQd1WRaU2H7ss9EC0PRAmRof6zf2+N9ajqmLLr3R0bDKrk6E5BVVG1qBUE9FyQeMKFdz4nY1OVGUeCTFPiRD4mKn9l94NiXiQZVePO+RnF5FEHkVswg6Gcq/KNyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAWPR08MB9008.eurprd08.prod.outlook.com (2603:10a6:102:341::8)
 by AS2PR08MB9833.eurprd08.prod.outlook.com (2603:10a6:20b:606::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Sun, 22 Feb
 2026 16:42:42 +0000
Received: from PAWPR08MB9008.eurprd08.prod.outlook.com
 ([fe80::e9d0:437c:714c:396a]) by PAWPR08MB9008.eurprd08.prod.outlook.com
 ([fe80::e9d0:437c:714c:396a%5]) with mapi id 15.20.9632.017; Sun, 22 Feb 2026
 16:42:41 +0000
Message-ID: <f4c9a911-03c1-478c-a83e-cdcdb71511e5@virtuozzo.com>
Date: Sun, 22 Feb 2026 17:41:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pid_namespace: allow opening pid_for_children before
 init was created
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jan Kara <jack@suse.cz>, Aleksa Sarai <cyphar@cyphar.com>,
 Andrei Vagin <avagin@google.com>, Kirill Tkhai <tkhai@ya.ru>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Adrian Reber <areber@redhat.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260220164559.2465466-1-ptikhomirov@virtuozzo.com>
 <20260220164559.2465466-2-ptikhomirov@virtuozzo.com>
 <aZsi8Z4Y2qqpdZGH@redhat.com>
Content-Language: en-US
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
In-Reply-To: <aZsi8Z4Y2qqpdZGH@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0418.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::21) To PAWPR08MB9008.eurprd08.prod.outlook.com
 (2603:10a6:102:341::8)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWPR08MB9008:EE_|AS2PR08MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1a3213-5a20-49d0-1984-08de723165a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cS9ZemhHc0RPWXZFQ1ZrNTRSMkJmMG9VZ1ZyazJRdEQvZlNjTlMyS3F2UzJi?=
 =?utf-8?B?YXJZOTQwWWJ1Q0lGaTNoUDdNblhZUjlvRDd4cEtJSlV2TkFGQ0crYmFneVBP?=
 =?utf-8?B?SFdBbENjMGdBMXcyTnBwS2pUazB3bTV0V0NrM3c4c0hFZDNoaTRlOUdsa2dz?=
 =?utf-8?B?N2t1YUp6bmZja1R6YzAvcUdWWGdnTnFVOXFxeFFPMm1Ra2p6ZHd2WkgydW5q?=
 =?utf-8?B?M1JhNXBBRUtXQmIvRmJDU0tYQ01STktvK29EekMyM2djQmFOcjBsbHc4UVBM?=
 =?utf-8?B?YUtmanA3VW5ENTZSWHpRNGxRNktYbVBjSG50aFJ0Z2sybjBORHBwUU01QWJx?=
 =?utf-8?B?RVR1SVBsRE11NWtXZUFKcHZpKzBlMjQzM21jVTFBSk8rckI1WG1Sa25wYlhv?=
 =?utf-8?B?QzFlRUNQdndtcVQ2SEtLRE1GVHBwRW1IbFYrUC9vYUhROHpvckxHWEtvUkY4?=
 =?utf-8?B?TEhHSGY4UWxpcnhFL3R3UnlXRHNvT1dVMkM1L2d4YzQrck1EWW1mYUdtcTQ1?=
 =?utf-8?B?aWVpMzNVOHE2eStDOG9XZlNZTXQrVzVJY1BlMy9VWGR5bWZJQ1lwMWVubzc4?=
 =?utf-8?B?eTR1Q2ZaUDRZQ3hOamhMSExsV0lvTmh4R0thUGwrVHpaSkpmNnVBaVZCelV1?=
 =?utf-8?B?dDFETU1KRUlyUDJmVXlzMFVkWUxKckRwSng2cExnTnBodElLRzlWY1ZqdnEr?=
 =?utf-8?B?STl0LzVSa0JTdk1lWXNxMWgxSVVIbWxjdGY3aWNlUnF1UHAya1dHWTB2WDJV?=
 =?utf-8?B?UVBza1hCbDZETXorZHNoLy9VSnNUZ2p2OVBRY2FmSnVoNytNVFJPdXJWK2RU?=
 =?utf-8?B?N2hLTHNLWU1YOTZSM252ZW5RQnlSOXhIbFBXK2FJTFd2em9maGttR3JHRHhj?=
 =?utf-8?B?UGRCbXFQREFsbkFscU1QMmo5STllM2dZQldacEw5NjF6ZDBvcEY1UlpUYkFC?=
 =?utf-8?B?ZFlvUDZtdGRTQ3dZTENuaXJsVGR5MW1mQ29ZZm5Na3dDZjRyN0hYOHB6VGVh?=
 =?utf-8?B?YWJMa2lNS25oa25RWFBhRW9naHcyTnhEbWR1MG9KNDRvSlU0WUl2OHRUQmtK?=
 =?utf-8?B?RTV5SDFvQjF6aExJczQ5bTRQMy9Dc2Z4SGNyL3VCb056YkxTdVdDZXJRSEYv?=
 =?utf-8?B?ZWpUQWF0VlBDSXY2QzdmdDVZdkg2bWdobHFiejlVN3BFNzhBcmpwNExHZkll?=
 =?utf-8?B?U2Nhdy9wQkwrZkxvV3ZJc2NjVWY0Um15N2tzWkZjSVRIeE5JWXpUZkdHMEd1?=
 =?utf-8?B?YWh2NnJ5N0NMQ1FraDFXd3FjOFlUVnZZckxzVXFrMzhkcmlBY1hmZTdVNmFV?=
 =?utf-8?B?U25ieGhITE85cnJrU3BZUDRQMEs2VExSMk9HdHRhY1MxYU03RE14NFpNQlBU?=
 =?utf-8?B?S0d3dlYxZlpLMUJPVkx6eXdjSTl2endUbFZXRnoyQ3Q2MlU1eVVOdDh6LzBH?=
 =?utf-8?B?WWhaWE9BT1d6WDB5aWFkdjlQRmRyTTY1aXUyZDNRZGM0ZGJJRmNWWVpaTGFT?=
 =?utf-8?B?R2kzV0liQzMxWHE1cFZSREdUYVJFckV2NXljVW9PY0VFOXVKWHlzUXdIU0dR?=
 =?utf-8?B?L0MzeEtUd2ZSdWJSaFQ5ZFZKNU56NXdBR2g1bEFqS0c0TWtGTld0VDh0Q1hM?=
 =?utf-8?B?YkU4Q1AyT2tEWndlYlR6c0FZcnpqVDF1Yi82R1JVL2Q1UnRuQ2dyOVVHOUp2?=
 =?utf-8?B?NXFYZTI2ZjFTMU1VWUNSdkVKdFVzcFVxQytJei80NmpKMDdRQUFPb1I3akZT?=
 =?utf-8?B?VTBtTmJiS20xclRDZTgxd0JhaFZlMndJNEh5emtBWG1zUDN1Qm5XdzRJcW5p?=
 =?utf-8?B?ZGQzTHlmeGZSdjJXUkxJWmFLdk1sbGhRT3lmcFNZTVhBQnZqS1RCWmRiVGt1?=
 =?utf-8?B?UmxyenRldXBGRzBieGpSSnNGdUIvc3FNL3N5KzV2Z0k2cFpCZlBFN0U4c1Fa?=
 =?utf-8?B?VlNpNWJOclk2b3dRQVZjTksyQ25XNUJVWGFsaFJUU0NjSHQ4Z0RJZXllY2wy?=
 =?utf-8?B?SGx2TFVjQmIxVXdKZkNRaXFWd3lMTzhOWENuUFp4WlQrOHBTbEQyc3RZUjQ1?=
 =?utf-8?B?a1kwU3VBZGt0VnpxQ0tBdmRVUGR5OWkvNERRb0xBMU5BRXRRUUJ6RXdrUjdo?=
 =?utf-8?Q?oic8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9008.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVc1bXRnaHEwRE8xemhkU3BPQ0d3aUYvZytzN0hYYi9RaFVtWU5Od2kzdjRl?=
 =?utf-8?B?cFQ4eERBRTFvZDgwNTNMOHZ3YXFQYlhIeTFFaVptb1NHNExsa3lLZkVWbXB6?=
 =?utf-8?B?YUJ4ZzFDNGxpMnc2QVpkN2ROOCtZdHdMZ2ZUY2VUczNDSE5ZUkd1UUQyR0lM?=
 =?utf-8?B?clhSMFZxTVBLUmZjekpBTE9PUE9XSVFVSEljMDNKNllVWVgrL2J1TWVBQ214?=
 =?utf-8?B?YmFPa1NEcWNGNDUvbVBwNG8wdWZnbWlMMVAvalROampKS3oycnlXd2lNMTZ2?=
 =?utf-8?B?Y1JIREtXSkhHWU52R0h6cWJLeVF2bnA0VEp4dld6eUthc1ZPUEdRY09qWTl0?=
 =?utf-8?B?QTdOb3lnNjRrV29GYXdUSVVSRDErRTBZTmxUL3dnRnJPWmdob21XYTRmdURM?=
 =?utf-8?B?UDlVZ2llOVRsWGg2QmI0OUJUZXlYcytIMDRtMVhzeU0va3c5MjEwZG1mVXlN?=
 =?utf-8?B?VkVvejgwTHFsb3dPS29LUHNHU05PVkcvNGdZTFozb0JhRnRMdjVPaFl0RHlN?=
 =?utf-8?B?a3dhT2o2V3p5N3BEQ25MSWtXRkQzcjVGODh6R3lPZmtLaXJNQnRYR2lIQlZC?=
 =?utf-8?B?eUFSdERoR3M2Z3o4ZVZndzFUdE8rU0VXbnFvY2ZrZm1LakYzYmlsb0xXcURO?=
 =?utf-8?B?NDJ4akxZSmhQbkdMODVDVDI0TGRvYW5VZ2poNHBubDhoZFk1eitTeWRyMHdo?=
 =?utf-8?B?OE95MGsydXpJdkYyVEFWMitVWlczai9CQXN2YzkwaUZEZTVtWXN2dTB2MVY2?=
 =?utf-8?B?Yi9pWUlRVFRGVlFYSVc4YUZjYnVzOHZMWVZBTjRPN2RBOWhZRjFFM0U2UVJs?=
 =?utf-8?B?T1dFckcxUGk2UkFVTkVLNUpUYXhjaEViVjR2Mks4VWtmVXNaTzJoSStrSmph?=
 =?utf-8?B?bEgvUjBxNW5lbTlwYk93S2RIQUU0MjBRNlROdUdKR05HdTRSUUs3NDRqWmRw?=
 =?utf-8?B?Z2JsOUMrbm9saXZ6Y0JmS0VyNXdSTUVwT3VEMVNKMWpXQVNHcitpcjduY010?=
 =?utf-8?B?MXhwTFZQbkhpbDE2V2tIanIxdk1wY0ZNN21JZWloMDhVeWRoRDVkemNGVTlr?=
 =?utf-8?B?YnU0aThrR0FBVnhUYjVZSlpYWHpCb0pybmRlQXRRSFJoSnMrU0VBd0JjTFVV?=
 =?utf-8?B?VTZDWFVTSThEVHpBMFg2emR6TUdPVThpVFBHTm12cVNFbEtGeENPOGZHaTJZ?=
 =?utf-8?B?dVBIL0RPTWV2WTRSWXpZejdPNzhpdHZIY0ZxMGZzbFJVSXp1bnZuWUtZVHJx?=
 =?utf-8?B?ekZyMlhIYlJNdDI3QWZrb1o5WVJkQ2l3WlV1ME5Ub0FFVU8yYk0yTFdwY0FU?=
 =?utf-8?B?ay9HbGg0a2NOL25MaUlucmgrZWtkUjNBYjFhdWs4cjBpU25lelZMSWpsMjdG?=
 =?utf-8?B?VkxFRFFZRkdNL0t1SGo3VGJHZXNyRlpFczNzb2h6ZnpEKzNXUEhOOHNONG5F?=
 =?utf-8?B?bEdsSHhRSXYzdnlhdUM4QmlaV3ZnT0JCQlR2VGZtRlVGNGoxWFNqMER2OE9l?=
 =?utf-8?B?N2hvaDJaSnZUUVVVVE45YTVpVmdubXNEMHdyRWdYSWh0VlBkVCtKNWNDL2ZP?=
 =?utf-8?B?WkFLRW9KWDZFcE1jMjdrUUlSRlU2b3Fkd255MTNveUFGVVdzNVZFbll2YXZx?=
 =?utf-8?B?d1R2Q21sMXlPQ3ZqVmZNdFFpRXdTeUppbWJkdTFNU2lkVllqNG93UDhaclVn?=
 =?utf-8?B?MUZnNEhKdmtuMEEyNU51clFndUxjRG9nQ1hoUlUzY0VHUUl1Uk5mTGFpNVM1?=
 =?utf-8?B?NnRYWUY5UWsrVThPNXNiWVdrSUxOZjNtWDhwZjVzem1OTTladUFJSUpRUElt?=
 =?utf-8?B?WHUwYjVmQVpiOXdDLzZJRlVvUCtkWHZOQ3BtT2JHOEJlSjVDS1FCYVN4ZitZ?=
 =?utf-8?B?NHVhd2NxV0ljd2xWU3YzK0d0amdLMnU2SU0wNno2T1ZCQjVUWCtLdXR4TE1U?=
 =?utf-8?B?YnhlMjdCcVNXN1k4TnBZQld4eitjcW5yZytEaDJoaWhFdm9NQ2NvbzV2L0RV?=
 =?utf-8?B?N2FFZ1VHTWgwLy9TSzRhMjFHemVRckJsR1ZoMm1EMVY4WHozcldoNGVnRkQv?=
 =?utf-8?B?eXRHN3J5cGVQS0ZvSWdVOEczUjVaSTFGcnhpOFRnMm9LSmpqZFhMZG1hYjRM?=
 =?utf-8?B?VWJBTmFIa28yeHR0WkhYRG0wdWRYM2tUOWVoZXgwWGdZT1ZKYmFqVGx1dVBL?=
 =?utf-8?B?MmthK1gvc3pSbHhMU3Z4dGVkcTR1RVRTYU5vZHVuMmZCc3hDOVQ2WmkrSFVX?=
 =?utf-8?B?ejRjMlU3UUpVazNqUWlNTnFDVkpVWnFyTWhqWnFxdFhFV1pmNVZuYW9ZOHgx?=
 =?utf-8?B?bCtiSDR3aTMvY0toMUg1VDdZaTErejlCZnRDRkt1aDR6V2lSVHFJclJGK3dH?=
 =?utf-8?Q?AMyVoLq+wDWOGJbDBGA/B9XtgHgnKdaSrJmESpoAzVLJN?=
X-MS-Exchange-AntiSpam-MessageData-1: Vyv8FyeTQKKbQKJzvu1s+PuFrfYD4bmAdR8=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1a3213-5a20-49d0-1984-08de723165a0
X-MS-Exchange-CrossTenant-AuthSource: PAWPR08MB9008.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2026 16:42:41.8763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sg6EQoMRpCaoxwu96fTu32E3kNjDJ7tzUkntr2fammZHDpEkKIw2A4hRJa8nL+xNnKA4Gr1JK3yRwSWotanbWQa7pZPdWzFrqNr/2XEj97k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9833



On 2/22/26 16:38, Oleg Nesterov wrote:
> Pavel,
> 
> Your patch doesn't apply to Linus's tree.

Oh, sorry, for some reason I based it on top of v6.19. Will rebase, I 
guess, when I figure out the second (tasklist lock) part.

> 
> and in any case... can you avoid read_lock(tasklist) in alloc_pid() ?
> This is really not good.

I tried this logic with the tasklist lock to be on the safe side, it makes
sure that when a second process in the pid namespace is created, the pid
namespace is in exactly the same initialization stage as before. Moreover
the tasklist lock is already taken in the caller of alloc_pid a bit later,
so I thought it's not that bad.

I understand that taking the global lock is probably a bad idea if we can 
in reality do without it. I will try to dive into the code around setting
child_reaper under tasklist lock and see if there is something which will
be not initialized enough if we check child_reaper and see it set in the
second process without lock.

Thank you for review!

> 
> Oleg.

-- 
Best regards, Pavel Tikhomirov
Senior Software Developer, Virtuozzo.

