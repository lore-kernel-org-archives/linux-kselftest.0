Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023118.outbound.protection.outlook.com [52.101.83.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E74D330D38;
	Mon, 23 Feb 2026 17:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771867469; cv=fail; b=O6UIxfpLmClLTAa/mtbb3AdYuoNpqrUATLHimzyVUUdV36oQrkMjR/QZu+GyDFTIcsl6osXwG34SdUyxTuwSTmWJsDMKTFq9Zrv5nkaSCGR9UFUkLaJ9Vu+75UIfWlQrO/CYDw3e1iJ338yt6s1ZoeP4xenYMg07EN549qVL17U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771867469; c=relaxed/simple;
	bh=qTPmGQDWzwRY9PYRxPdB7YXMQ8tc3vVHnwD8hlMkF4Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m96JaEh29651O1gjDYOXR5FAh2zETcpS1IYewnd8wdMEPAF2UyLLt3lQJzih3Az/HS2HovNB0FMaYHrPpKDKK9VMXgK/LAgmyl6Y5vaWcGLB0esCIIesw44Xo5ZmXDwSdGXp5xp+pDrwNzJIRuflXtkcsgAcO5M0fu206K3SUVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=dW2DO8/M; arc=fail smtp.client-ip=52.101.83.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="dW2DO8/M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtAdbBPsYYQYUrX3JFBtE/8hITMRPUTNlk5lt31LSfpQJ0f/amwn/a3sm9HBKCkqUYRDg42ll2GekesynQBKm9UQ4nuys/lvYoiSTm9iPEpVGfol+aP66XnLblZgHHuWT3AJN+3lY+OpGePONp7J4Sa+80ybeym2XNX2CshOHFj7zHIVzv++iU6wqeL/gUw9Ax6IDv6rDlsAhh1/H+o03wRI44SUPS/dlWdR7ocIN+Cq2H3/C+XCzk99TDfFpAqDNsksjPX261HHQkWvv1acnkCmujXVEd5znFGcYke+Ceca/7sSpY+zz/SfJ1KybWBi0W2FVupB0ZXpGL/3Nqz3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8TDlqcmtZV6ODcQ6GLejXcryBUUGKU8xR3P0VSNcJc=;
 b=Gl+XdxjNYLnkIo65kKbpaDZQXHdGp9npp2i7ctsftRRUCF6WhNA+Y3OwmNvQQQXetXtC27I4kw9Bezf+PmYG4eBHxGQdJ0o09jtOPkj2+Qo87Rd0w6kGMCX/Ap68PnJEEOHaXN8+bXJmKSOrejpRf4XtuEtstyl4u+94nZ1lMZCRn5ITp7xgrDK7V9XWx8QGW4gsXLS5dGY/of4FZqKvFFi2tJHh1pN0FSsfSOuZ/8b5ruh+x+9CIdq4O6XzXOj5BkLx/gsOAUP2L2ZSpXgUkGma2WvyMuc3pE9acjp2M0C3Qr3ho/RVDnYPlUlJJKVZ812hEhoMZ0jDBojLgsv1xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8TDlqcmtZV6ODcQ6GLejXcryBUUGKU8xR3P0VSNcJc=;
 b=dW2DO8/Mbwc2EtcXWuZIDV7BF/bzIzfW4z2Svae1j3VOmPpyQDjg/xKHzfSmvz0ZUWYAB8igWI8jxwzfcHU4crVapIC40zCD9zRkyXkyKV5J7yeCG8jMEphC8LcxYG6x+KNXtZFHh42Gnebhl0Wk6G1CESNptsK7OQxE9Tsn7cupHDBtBN50uJAgKT/y8wsxUtCRfsuyqHJn1xJq5Z5/gjJBuddM0QCB3pAFJ8RmUwkRmV/Cd5ptzYa888ssb/Sfqf3PL23mogHS3xOx30RlYSy98xIo4MxNmllyXhDWqYc7uXqCveeJTCCbnzqFe57K+rxj5qTL/NTn6MdD99223g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by PAXPR08MB6494.eurprd08.prod.outlook.com (2603:10a6:102:154::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 17:24:24 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 17:24:24 +0000
Message-ID: <597a60b0-5049-448b-b8cb-2bb194c904f3@virtuozzo.com>
Date: Mon, 23 Feb 2026 18:24:09 +0100
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
 <aZsi8Z4Y2qqpdZGH@redhat.com> <aZs06UgTFYg_ctlN@redhat.com>
Content-Language: en-US
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
In-Reply-To: <aZs06UgTFYg_ctlN@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0347.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::19) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|PAXPR08MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: f06e9b38-0575-4ac1-88d1-08de730063be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmNTUEt5dGh0eWhuY1VVSFdBbFUrbTY5MS9iUjg1bmFReXVoYWJpc01rWDNG?=
 =?utf-8?B?RW1UcTVtS040ZDIrRlltcStyODdhQ3c1SUlCczgyeUh6U0VyOEtGemQ4TW8v?=
 =?utf-8?B?MUo0V08rWkFnQlNqbW9VbG5Dd0FWa25JZUI3a3pCMVhvVFVhNlRhRDlSc3V3?=
 =?utf-8?B?WEl1dEUybWNUUVAybmk4V1F0SHg1NG5kRkttcVJTRkh2WnNlMHNSazl1Yzla?=
 =?utf-8?B?aTZOTUNCOUc0bTVRZk9wbHF2RnhhUXZKZFZ1YnhpNWJGa1BmKzlPTHJvUWlh?=
 =?utf-8?B?QkpSdDJDUDVYNkx6U3JvWEM3UnRrbTBlbXJFeVpiUEJtMTdMcGNVMURjRkgx?=
 =?utf-8?B?YzVNYW9SbXdZczFWc0E1V2UvZDc2OVRaOG5lbDVFMGh2V2J6VEloMFJZb1pz?=
 =?utf-8?B?cHFTYitPK2JyM0t6ZkI0Y1pya0ZTanVyQ1Y3VlZUQm93ekdNYkltekkvVDUw?=
 =?utf-8?B?dTkrcVYwT0Y0SXFHSUJEN296NmtSMmJVZHJiTG80T242dTFaaExoL0lMN1dx?=
 =?utf-8?B?a2pvL3F1bzBFblV0SllKSEladFY2amw5WWhSQUdLd3ExVFEvMFZkaUVxVmNX?=
 =?utf-8?B?cUZaekNlV1BKY2tnN0d4VU9hdmhqYjljTFJPbnNqaXVtZkErY2ZpMDBjMTV0?=
 =?utf-8?B?ZUJCejBXTGtKR084TE81WVRibzRPcUdmbnp0NFFqUTMyZjFISGpQZG02Qk5F?=
 =?utf-8?B?dnY3ckZvejRTaloxRXAxYWl6QkwvQnZDOEh1T0RvUG41NzZtSURGU25paUlo?=
 =?utf-8?B?NTFwU0FHdTJ1YlZ0bXgwS253NFRPWXY1dUZZSzBJcVBwVS9OcGlRdFZUVGlp?=
 =?utf-8?B?dG51ZkRxRHVtU3dMZmJMRHptUit4cFl4RkNtK1I0Z25ZeDk3TTJ4ZHRKNXA3?=
 =?utf-8?B?ODZYUlpLSWhYeFpXbnA1RlliUXIrZHNpRjZMRUl6c3FMcVJQbWhzNUkreTJI?=
 =?utf-8?B?M1ZrRmdkWXUwM1BJdWRQUXp1aVlSNHJKQ05zMUg5YTFOVGhMUWRsT1V1M1VD?=
 =?utf-8?B?SE00REpBdFhiMVIzU2ZLWXZ2RmFLSDd4T0NyQm42d1IyYlRNam0yZkEyMzhr?=
 =?utf-8?B?bFVDRnM3SXBBaVpqOEpzTEhTTEhkbkZMUlEzcTBUdDNkbjQzY0thTWVnUXkw?=
 =?utf-8?B?SzZFUXpRMmJ4WklpRTVBK1J6VDA4Rm9MN0Nyc29EL3VJRjUxVHkwU0svRjJY?=
 =?utf-8?B?Z3FEQm9aU2EvUUxsS3AvRFo1cTJpL0RUc0FXY3pQbWYwYTJBRkowZ090TVNY?=
 =?utf-8?B?Nmt6Wlprcm5IemZmVVhjWWp0bEhkc20wS1YxZ2FhTGJ2ckNrTk5sNGthVzBK?=
 =?utf-8?B?aFpkN3R4aHFEOTRrTDkySzI1UTlYamtkVTJxOHRtb3hPVFJ0R24rYTNRSjNP?=
 =?utf-8?B?bUlyelBDTVlwUnZNZ1F0bjRZNm9EeE8weWpTc3lvM00ySkttQTgvOElFSnJW?=
 =?utf-8?B?REt5cmJEWGJPekNKbmUxSVF4MWZuVDVMZjNnN2V5bGhkZVN1WjFHczg5NjJm?=
 =?utf-8?B?U1ptTisvbklRTk1uZEVRenp5ZTNGR2xheDFHL2dFUW9INXJpeHVaenpreE5N?=
 =?utf-8?B?MkFjK0hxc3owblprMGJGb2FKWWFRQlBHMmpsbFJmSTcvdXBBdWNzZ0l5b2k3?=
 =?utf-8?B?emFoOHR4VkZjdUlyUFJ4UjlQbHVBSWJsNHMyR3Y4TzA5akM4Q3BBZm1IWS9z?=
 =?utf-8?B?VUVqTzNhekphaWpxd08rMWtuMmx6T2VsMzF5TE1JZTVqMDRxRTkyendtZHFF?=
 =?utf-8?B?UWQ1c1ZDc3Z3Y05KQ3pwMjFPbVJtWjg4b08vUkI3QmZFR1hKVmtnTDlMZjNM?=
 =?utf-8?B?aFVLd2RReU9EUEZ1V2FYWnVKYzBoVXJvWE5yQ05Oakc5ZUZKSUwzZG5GckI3?=
 =?utf-8?B?M0Q3amx6Q3JQaWlaM3RQSGZoMkJhWUdXOVlwU3NpOE1iUEhhYUhjLzRDZm9i?=
 =?utf-8?B?NkNHYjNabjFFQ0lGMXJjYWRyOFlEUm9SbGhOMjcxTExYc21nZG5Qc2FIZlQ1?=
 =?utf-8?B?dU0rVmlGUWJuSFY4WURsc0c2Q0U3cGVnbUtBemM2dnNOVGhQakd5eThlYlZO?=
 =?utf-8?B?ZStOczdmcklSdkVHeXUzM2c0TU1GZHE5QjNTYlNyVDBYYzdxR1VBdnRrejY5?=
 =?utf-8?Q?zVGY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGY2ZjkvVzJDUzZUSTZ4enYybDBKbWM1MVdRL3g5SXMvZmwvb05HMU9OUDk1?=
 =?utf-8?B?ZlcxTmt0RW5IdHJRcDdHOUU3VTAwLy9CL3JtMVJtMHdMNG5hRGhNa3pSR0sv?=
 =?utf-8?B?SU5zaEVqVEMyTUl6SWdWSXc4ZFI1NWIyeUJBME12bWthRVhjZXR2emdPRTRS?=
 =?utf-8?B?OTRPWmk1VWlPUnd6eWlYcEVCcFNCbzZkRW10RGJxckhuNU5MRkRBL3owUzhj?=
 =?utf-8?B?UkFsWERSTHM5V0d6OVdqbFE3WVdwUlV1d3FZdVVDdklvQ1dQSFg3cmh4VjVP?=
 =?utf-8?B?NDh3blF3Y1VBWmpBa29VUUVXblRwOUV0L1BpcGxMRXduSjlIZ2dETUczSTRS?=
 =?utf-8?B?dWhoMmx2QmNENDlhMVhiSUZmSmtsRGtmTzcrT2Ezdm1kQzU4d2VTcEd0a0Fa?=
 =?utf-8?B?TVd4cnE5NkRpb09qTXZsT0dzNHBVbWhBV0UzS1JhZlhXY1o2d3I4bDhoVUVK?=
 =?utf-8?B?Nk14ZFNqUlhwM3RVeTdXZGR2Z1dISVlVSy96NUhhNTRCR3NESnA0eTg4emFq?=
 =?utf-8?B?OHRuWHBnbklzTEVzOEZjbW95ZzhLOW1Hc0lKdFhQajRsdjdETTBldkUxR2o1?=
 =?utf-8?B?a0VSNTdnNFQ5RVFYMWJzdUpFOGVRUVFkbEp1NkFYS1BsbDR3eVZiQ200MGlF?=
 =?utf-8?B?MmVaZEYrcFBOU3J4elNJVWRIZWZJUExWd3JMWjJkSzB5VEJ1Q0xhY3lSQVVE?=
 =?utf-8?B?OGs5dVlkd1pOZktZeVVZRzQ5cjhDR1I2QXpoZ0Z0M29vK1lGS1U2RC9MaStr?=
 =?utf-8?B?TkoyWWp2bFQxL045TDhpRTQ4a2JIbDZMcmFOczN3LzVIVEJoYjdWLzhqY3VW?=
 =?utf-8?B?ZHlGTEloZWwzdjRUTEJEeWd0bVdBR2VtZTVzZXJsNDB5MVg5V2g3ekVRSGZW?=
 =?utf-8?B?VG5EbTdVSHhBbll1Q1pjSHAvSG9saUxNYXpPbWFraE1tOVBsMWk4cnhRYkNB?=
 =?utf-8?B?SkJzUzczcmZ3dWUvWFlPR0RQN0FGTERJemc5d2pBamR3MEp1V01IR3ZyT1h1?=
 =?utf-8?B?VEZ0Q0o5YVRJdnVVZEREN3VibUxIYlluSnMzR1A1TFdzZnA3Zk9wdHEwWGxL?=
 =?utf-8?B?enREN0NuVDJwU2lFREtIS2krK05haUVMdytZaE1vQWc1ZUoxNnluT3JIQ2pz?=
 =?utf-8?B?ZEp6eUJVdnZkUllxeGNncWZiY09zUW1ORWJmckRUYlRrajVDSUthWXgvbml3?=
 =?utf-8?B?L1J2ZXdDSmF5dEFQUDZnWldlNE00VE5yVTRUc1BNN01TKzJ4Zkp5ZjNkSlUr?=
 =?utf-8?B?RmlaS2dua3NzdXk3VjBhd1VackNZYXYyN1hHcGVkajQrVnpvTFZNV2Z5NnRI?=
 =?utf-8?B?cGFVa200TTA4MTlxWmIyZ1FjbkVSclYyYzJVVUY5b0E5TTVQZlZMZnJ4YlFw?=
 =?utf-8?B?cWtud2FQT3daNTg5cklVTWI5SnY3Z00ycWxzd1g5aTV3RFlsK0hJd3cxUHJ6?=
 =?utf-8?B?SWU2bmljRmRCYnR2ZWlSdDVWdUI1S3IzajUxbEs4b2ZzS0N5OUFiYWVzWEtq?=
 =?utf-8?B?MVBuY0lhRjV6R255ODBrSWZNamp0cTJET21uME9DbFN4c29vcjJwaFNQUDlC?=
 =?utf-8?B?MVJsZmtNYVA1OXhHMzFvNW5kZlhUOTVCTkswMS95eVhsWU16bktjcUpZVis3?=
 =?utf-8?B?T1UwVmhoNUpzTEV6UG5Ya1psemVvUUhRZmZlT0V2eFZhM2RUMWpWczBjV3JV?=
 =?utf-8?B?UWtwQlZtRGpqb0RteXV4RWVhY1NVcTFKN2oxUDRERG5PSXJaNEJ0dENyUGNi?=
 =?utf-8?B?RUJTSWo4dzF4cmdsLzFJWmZ0TExuZHFNNEtTWmE1bkUwVjA0b1JKbHBCa3lJ?=
 =?utf-8?B?d3Z0SUt2bkRBZmtiUjkxZ1JQNGpVeHhCcTIxelVvMXd0VFlvVmtjc0RDVzJk?=
 =?utf-8?B?NUhiaElxQXRBWEp5R3BoVE04TW11a2w4QmxMSDc4ME1lcDg5OXYxZEU4QW56?=
 =?utf-8?B?UGpOaHkzWi9vUDNUT2NOS2QxL3Q5ZllsYWdIRTRaaDdkNmRlQ0l3OEx5RHpj?=
 =?utf-8?B?RlhvK2RaM3N2TkFzSDJyM1BRODF2ZFJ6R1dYdTNhbWJzNnpBTWN5OWdjUUta?=
 =?utf-8?B?cTZnVjhVblpNSjc0SElHaWtuNFlMaGVPL3VncEgrMjExWWMyR3paa3dtb3ZZ?=
 =?utf-8?B?SmhIWmhXV1RiQ09UdUhDMVdJcEpvSFZXNzZ6dm82Q0dSY05aMWJwZFcvaVA0?=
 =?utf-8?B?ODFlUmxzOGQ2RHMzYUFPa3V6dTBGWEhhL3ZuZTRkRmY1YWJURnZWSnpxUyt4?=
 =?utf-8?B?RE1ESm4wc0VnMUZrZHU4Tmp0eXduZUR6VURlT2JOMUREUVNZYjB3cG5QdlB3?=
 =?utf-8?B?RWFxdWRibXRCUS9Fc2twL3d4RVhLS2tTdk03alZNZmUzVGVCWkNJSml1Q1V1?=
 =?utf-8?Q?PAbRCcF3MP03hNBBMrYUOQvFZHx+OBcoblG3T7lbZRtug?=
X-MS-Exchange-AntiSpam-MessageData-1: C4+gZoEiIvZmhhKG2SztP6RhedWrBE4Ht6Q=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06e9b38-0575-4ac1-88d1-08de730063be
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 17:24:24.5378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUEH3OPDYQ4k74xyNRo7XQN2guRv5YGVz3iupF8Oojou9ADnsdKkZcluUqDQ009wRBxbS+XtTwDc32yFvk9a885oY1YyXebuxWAnRuedVd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6494



On 2/22/26 17:55, Oleg Nesterov wrote:
> On 02/22, Oleg Nesterov wrote:
>>
>> Pavel,
>>
>> Your patch doesn't apply to Linus's tree.
>>
>> and in any case... can you avoid read_lock(tasklist) in alloc_pid() ?
>> This is really not good.
> 
> I'm afraid I am totally confused, but it looks unnecessary.
> 
> Once ->child_reaper is set, it can be changed but not cleared.

Yes.

> This means that pidns_for_children_get() doesn't need tasklist too.

I originally thought that, maybe, something around first setting of
->child_reaper had to be observed together with child_reaper change.
But yes, I looked into the code around it and failed to identify
something like that.

> 
> However. With or without this patch, we probably need WRITE_ONCE()
> in find_child_reaper() and copy_process() + READ_ONCE() in alloc_pid()
> to avoid the possible warnings from KCSAN.

OK, I will add this, sounds like a good idea. Thanks!

> 
> No?
> 
> Oleg.
> 

-- 
Best regards, Pavel Tikhomirov
Senior Software Developer, Virtuozzo.

