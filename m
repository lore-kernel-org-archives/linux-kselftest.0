Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023125.outbound.protection.outlook.com [40.107.162.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CE936402C;
	Tue, 24 Feb 2026 16:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771951749; cv=fail; b=d8HSWpwpyj4E2JtHKRJE3NJZdiAwWTXKcLsQkmzz1idIZSrkQ4D8/t/l8DURU8O+teIe+N1M7yamnQH01jZpAp83D8HOqNGzDg++/H0jVX/qcQhcs246t5aeB8mV9AWIkC18++QBld6vFStin9JqsJpfZKo5g5hqwTR4EOQwrLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771951749; c=relaxed/simple;
	bh=a4z/PiMJIs2HAw9kdZ6MyHQxPRKMQF1GKQx9l69Vklc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gFcLvUbywVtEaynvQIb2XO5V9RGYcGrwxOI8/XGzEDnXE9Fwh7+llCuH07kHQjoEswWbqPREoABGGmAN1uXFXZ8+QGUfULoVL46Tf2H22lwm50jHjFzORL3V6CgnEKJqddU9AlVDbtvYkjcA9TdJ7hZh/2LAb3/dYGYyeMpNQNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=HtG1yb1X; arc=fail smtp.client-ip=40.107.162.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="HtG1yb1X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0VXeIcllf0fEtHoWacC2fm+lxrM1BOBH58hvKm2ctCDReJbBjJ2jTaKybYDU++s4xcOicis8/fG4rwrD2JeGoCM+FsuDQU86Fr4yykTwyZvwgL1No/a/ocCUqrpe229vccNwv1J0Rf2NzWzil8ux1LPWEvV0bOxhSyGv797jEIUVGmFS9iFW4M5ZPV/gnbQHymqhMbw616qGFUZ/aT2Qfqq0A2UbKrpCnWjz2yuil3avS4jrR0H+fRRUHr2LRLuJu5V6XDGEiLltMy9RSD0RYdDXkFkCleQ1eEfEDXHlZvAmVoT6F9oUjqxki4ZKsE8NKeUe3ujIB1PNrfuIY4SWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCTDKirRAjnP979z3LpvCaQ4RBPeVtvfjOJibfv2lKY=;
 b=EnEddtIKdzHl5Pqi2Q8GKhLn0bfFsx34WGwKq5I/dx6ugN4ak3sY8q3w5B1EzVj7laeMMxDrrRpWWwqX6QfYo9HSl4p1qj5C7yTlPRtcyKgv1AE6fWjWI/k1nLrqHdF+jhUchU8EMZipaPbOufhCWCI0GwsEn69fHJVkPzuWRd7xg+qoigmEan8nGuBiGvuNsolRJqTp8FMB7rVsJCRR0GDXdU3Oiod6af89pBwNT6wrtL4HKLH1iOIOVj5hhAaUFVuaO0YeOiWAY+z/wpY7juM6j7XUh1a418JOVvki2pK9yd+tXR2TS18Dg8GdCi7YqCkL+w86ZeRY9W5slN5y5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCTDKirRAjnP979z3LpvCaQ4RBPeVtvfjOJibfv2lKY=;
 b=HtG1yb1XgKMOBnEfOiCi2Ko7LVYwHL0BT99klIP6dDb1ALkZVzivBVtVpZG3O8dyRqjH36Q64MNybAy2ZTTRqZwJFP6n1eC57Qi2PdZuRNkZXi+kOkXUexZkPgE1LYYZX+Ll9rqg9AqXf1ZlwwtJHl9DMQSdYbf0FRd9rFUaX+VDnVqg1OtcYrRdzAk/dvkN+bqXena+bkn5Ft47BG1s6CsN6fsEhoQGe2if2MvQApWyis99yPxVy7ZJ/dsdtT9xM3jymzBcZF+YqGG1LBiaIsmtPKF8+l83VcI9LsUHRgXN3UKi8fuGkqaICevqZPVMKNlJGYWCudcre/L6VRZ4eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by DU0PR08MB9154.eurprd08.prod.outlook.com (2603:10a6:10:415::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 16:49:05 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:49:05 +0000
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
Subject: [PATCH v3 0/4] pid_namespace: make init creation more flexible
Date: Tue, 24 Feb 2026 17:47:51 +0100
Message-ID: <20260224164852.306583-1-ptikhomirov@virtuozzo.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::14) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|DU0PR08MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: fb512b65-8e8b-460a-7818-08de73c49edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHI1UHBVTzdldEYxdCtOMlEyOWI0OXlQNERhVWMxaHZPSExHNTExZjJaOENE?=
 =?utf-8?B?OWZYbmYraXpyMnlsTXI3NmRIdUl4UGtqSnR4cVRBT0RlSGl5b2tTVWpMeGYv?=
 =?utf-8?B?WW01dzFjaTJibFRwYmRnV3ZGcC9GMktxa0lvRkI4RkVkbEZxL29OMWFVZUM3?=
 =?utf-8?B?TGJTdFF5M2FlenN3OXpwem00TnBLVTZUWG13YjJUVC9SdEZMQXBxUWpaWk9p?=
 =?utf-8?B?NlNFWkxhekE1amd4TDZ6aktZWlBYb25UNWp0WXViU0VTeXV3d2VYdWJhbk5r?=
 =?utf-8?B?R3AzdlF2a09uenY3Y0RWYnRJU3VOK0NXUktrb2FYYmU3OS82N0QyL3UraitO?=
 =?utf-8?B?enlrYklVRXpRMVUzK3RqOWkxR3hTOTFjelVPRUlmVktsRE1NZytQVGJxaGpr?=
 =?utf-8?B?MzMyM3hSODVQZVlZNndpY2VMeERKZVhJN2lSckdLZnZ6aVFwSHZJM3k1QVI4?=
 =?utf-8?B?eGpqUHhxdHNISXd3Z21BNUJEZFlja2U2eEh2OHMzTlBXQ3U3RVJpSU1abDI1?=
 =?utf-8?B?ZVh5MC85MFpERWJRTE9wUWtjMlZIQzVwMTZxQ1FWczNmY0x0b1RIRVNYbHBM?=
 =?utf-8?B?am9ZVU1BRDR1WjU4R1c3SnRFeGlyVmFYNnVid3o5dzNYaXh5WWppVFY5QlNl?=
 =?utf-8?B?aFdqK3dDQjQ3MENrVC8xUFA4akQyL0V5TTlBZ2FuNUxLeUMrVzZPZktFcEJ4?=
 =?utf-8?B?dC9nZ2RVdnJ5Y04rTTRYQytxZ1VaV2xEcWE1cUcvYzVTa0ZYNkZpMWNqMWRJ?=
 =?utf-8?B?aVpZMHY3c1d3MzBaMWR0SUVCSCtkWlRxdFN5cWhlcmN0Nk5KS2kzc1FWYkVW?=
 =?utf-8?B?YjhRSkZMREZOaXFyOHAzVFhZM3BqUmRGYmNjOHVIWUJtN0d3Z1JuZGhET0x1?=
 =?utf-8?B?S2NiTU90bXVGWVZYeWhhKzVFL0s2SCsvTEsycHlrQmtWMXdZaUt4ZFBUM3hI?=
 =?utf-8?B?Vm9aSDhDTFBqSkJsVDFQMHlBakxLS2FzSzZGS0JuUms2bmtnbUZSQWUxeDVj?=
 =?utf-8?B?SyttQkpJcnk1STB3NFV4UkIwZG5JdWd6cG8xTGJOaC9iVlF0UVczVHl3SzBL?=
 =?utf-8?B?SnNjZzNyb0tLazRHUkRRMGhnK3djeVFrdm1adms3WGxJWnZHQWV5WFllRFdC?=
 =?utf-8?B?OVE3eTRzMGo3djRPNkNhUy9FV3ZqL29RcFRKYjJQanF5K1VaOXpqUkpZTk1n?=
 =?utf-8?B?RSt2dmtkMGU3Ryt4b0xzZEtmNktwQjR0bEh6dzU4aEJsa1NKWGFXazd0MDVn?=
 =?utf-8?B?UjcydGV2QzFuNldvWm41WktFU1gxRUFrVkZmNzdxM0EzbS9ySmtLRGxjWXpy?=
 =?utf-8?B?MzlUMk5kbXZDZGN5ZW1kUnlsMDVKU2h0R2dtVzJjZTlxamRNUFRYYXFiTjB6?=
 =?utf-8?B?c1QrTjVwa25mcHNGdEdKTjI3UG5PZ0NjWXpFRmZlb2NMc05lWkRvYkl0Vjdo?=
 =?utf-8?B?SXdUczNnSDNma00vVHRJbzBZSEdSTmRMTTRqd1o4RU4rQXFHbFdISHpaYWFj?=
 =?utf-8?B?ZXhNWmd4WnhNeGNhNUFIT3JCWENRQVM5U3MyQzdJd05ZY2F5NlRXaVVWUnNY?=
 =?utf-8?B?RCtEamxkd2xaUENPUUZDM0Rnam5oM1dsVndhTmdYZHpCREtmYktuRklad3pM?=
 =?utf-8?B?dFBPdUNFSndndkM5TS96S2I5ck0wMXBUc3hGejAzTDk2V3JiT1pGbGx6RXo1?=
 =?utf-8?B?UEVzUCs3Q0JZK2NacUQ4Q0JQWDdHYzNTdEM3OFdrcUR5UGE1RVhVMmxsOVRF?=
 =?utf-8?B?TUtMN0JNVzNXVDQ4c2hwRlRBQzkvd2U2ajBmc3hnSVdiS1g1ZXRmRmRpWHVP?=
 =?utf-8?B?WGZjc2dyQXVrUkhIYTFIbDVIYm9OSllJS1RUcWVnU2lHRzhUTGNHMml6U2Vo?=
 =?utf-8?B?RFJXdiswU3pHR3pRMlJORGVGclhOY296K3J1TEpDQWhuYXdDNUZRUHdnRG01?=
 =?utf-8?B?ZmY3UVNScTc3M1Rydi9UNDJnc2lCWU5UTEhzZ3N6bGRCSDdIdEtMSnhIZTdY?=
 =?utf-8?B?Um5xaDVPM2ZGbWJxNmE3TDBMSGZtN1pGZ1lxL1pRTEVYVE4xNHkvZWxLdXln?=
 =?utf-8?B?TWN1RFpaZUZpOVJMVnRVeFF4Uk13dW52Q1BTekFxdXYxVVZqcEp0MnlTM0wy?=
 =?utf-8?Q?WUDI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q01MVmJKcXArZ1lEbGpPNkg1V1BGV2hnb1k4RXczbVZzc2V2dy91amh6UTNz?=
 =?utf-8?B?ZmUrNjJYVnJrSVI1QlNLY2hidzJlRXUwWEZ5Y0QrYUhDYytTNVRXUFJiN1d4?=
 =?utf-8?B?SUo3S3RaVkkrcDFpSE1uc21HLzFKTU0wWmxKSlMrTXFzeGtwN09CQkF3ajNt?=
 =?utf-8?B?aXQyR2ZFd0lSZitJTmF4RVVDVXNiZ1BrdzBQMk9OMGlBWUY4ME5wTi9ZcUF5?=
 =?utf-8?B?R05pUEFDMVhOOXFOYUhXc3dxLzZ0d0w3Q0hJcEpwS2x5RHdUMjVjMm9ibkts?=
 =?utf-8?B?ZTJXeENpeEJjT0ZFSmRkTEYrcVQ0OVJJekhkNktRRnZvQmxhYVVmeWtlUDRt?=
 =?utf-8?B?c2k0TFJNbm04TEhXc2NDa3Y4bldpUWgxdXNFaEpTWEs1bzg0bE5mcEhMRW42?=
 =?utf-8?B?RGJ0YmdoZ1hhYm51MUFTaXRrNVB3cnFwV3hva2Y2by8wcVI5NlI1Z0w5dUlV?=
 =?utf-8?B?a3hJTnV2YktYZkh2M25DVGZjR2NZUHVuSmVMZmZHUi9adi9EN3hjNXZhNjUv?=
 =?utf-8?B?elNGNWkrZlJ4dmRZdFVkM2lQQ1A1VnZJQTE1T1Ztcm93OXRsUDZiUGFBUW0v?=
 =?utf-8?B?YVVZMlNRUGtxOU5UMHRreGRjVnM4WlVJajlLbTF4bk1LbklSbzA1RUl5RTh2?=
 =?utf-8?B?TWhkbFprS3QvdVJlRnN1QVp4WXl5aHlHVTlNNm5mVndXYWkwMFR3MFNoa1lt?=
 =?utf-8?B?blBnaFBBNk12dmVCUjRUOHVlWVV3OHRoajlsaFhaTjJtRk9FYXJncXdneFNY?=
 =?utf-8?B?UTdScVorbWxMbW9uQTJ1d1NGUnZ0WHJRNmRrUGlCZDFyVzZhaDlQejFnczN1?=
 =?utf-8?B?c2hIOEJ4L0NjdUl1R2tuSkt0blc0Wi8xWitRRjlxa3hEQkRqMkFTNEViZkJZ?=
 =?utf-8?B?RlBDSENkZkFGTDh0dHl6NUIvU0hOVTIvaDRlMnc0RnNWV2p6RlQxZXU1QUkx?=
 =?utf-8?B?MlpFWVVxMWc0bG9ZcU54cFJ0MUdDL0g4ZjVpUUp6NkZKU1pBN0ZmNnNKamZa?=
 =?utf-8?B?aGRSM043SzNMVllva3k1aFQ2ZEx0eVN2K2IrSUkwSW9tVVJ1UHJ4d0xYNXlR?=
 =?utf-8?B?U2RibVNlaFZHdEUvSENnRGtUeWttNXVNdU9RWkVjbGl1UXJIQ2x4UnFMcjU2?=
 =?utf-8?B?RnZwYy83SDRqMWxyUTlrdlhCbitlUFhFbEtpb2ZQQlhyOGZnM3dpZ0IvVi9F?=
 =?utf-8?B?UFA3QklkazA3UlFNOVp3UUtXSHFyQmF0V2NBNWJ4QWpmQjBVbHBOczJNdklU?=
 =?utf-8?B?WEg0Sjd3MHVPOHc5Zy9nWUFkM1Q3Z2dEMm8zb2VxTzRSazd6cXZPcTk4czZo?=
 =?utf-8?B?ZWNkNDA3SUhsSm80dllWWnZ4SlhjSnpMOTluRFVXNmNpdDJ1L2dET09KaVk4?=
 =?utf-8?B?MmpmY3VpbUEyZ0JueWVjdWJCblNkOUFsbTRNSkxzb3d6TUJGd0tmZlphYzVq?=
 =?utf-8?B?Z1ovRFc0RzBXM2xMRk9KYmxsZE12clgxRnBnaG8yOE43Zk1uRjR6VjA1cTJP?=
 =?utf-8?B?NzhLT3AzcVFCSjlyaWpjYmYzbURRN0RRK3g1RkVtM1hEREIrQ0Vhd2FHdVFU?=
 =?utf-8?B?aEdjZFFTWXFoeVFneExkaUZCdFc4RTh4SFR0V2VqZUV4RGtFbGpqUXlxRGlu?=
 =?utf-8?B?am9ESGxXY0VHS0dsMG9nQW5PUnF6NUV6dkJDYTVUbFgxN201Q1FZNHlRbmp0?=
 =?utf-8?B?Z3M4dWJVOWZYcG1oOTlJRlp5ZVZYWXN2bGtBZ0pCUEhRN01vZFphMHZaUVQ0?=
 =?utf-8?B?T0ZhZTBOdm1EdkJ5dFZMTGUvQ2UrY2FtdVZyaTB1QU5zT0pLcXBTUDZuVURi?=
 =?utf-8?B?TlBVSE4waGtCZlorVjM1a2trY0hGNXZSamR0NFpBOTY5ZlcrRTNNK0VxSUJR?=
 =?utf-8?B?SnErdW13TVJRUjVDWmx1d29MYmxJYVBIUklCeHJDUVlBVTBPZVlCYWlHVkpU?=
 =?utf-8?B?cE12cVN0dEwzdkR1MnVTajcyK1d2VTRVcjZWa01nVzdpaHhCMjkxYk9MSVAv?=
 =?utf-8?B?cWFpdG0veFg3WHlKQldsaGFkblFHNlpNVWhISmw3WmFJYXNONStmNys5eFRy?=
 =?utf-8?B?R1VNcEhwT0ZocU90allXYTUyQ2p1bVFTN01ZK1pMOWNjOW0zRWpkbEJVQ1VN?=
 =?utf-8?B?RmZseFVsOTBMR2VORUk4OU5CSFFMWW5ZM0E1c3g4TUNQd3VBTXFRZGUrZjJn?=
 =?utf-8?B?WXZnOEtWSGZJMWhzckE2ajJJN1dJQ3NoZG9RbWo1c3RLRFoxTUlVUEd0ekFK?=
 =?utf-8?B?ZjEzaWwzMEFQbUl6LzhWbnBjdzQzOTM4RXBPbHB6aXBXaHpNMC9hOTF2TnUz?=
 =?utf-8?B?cFg2MFJxK2VBRUpMb1ZIMVI5cDVGd2tlT0krNmpwc2FCSHZxaVdhclFhWmth?=
 =?utf-8?Q?LDgmsToEoX6cKQ5pXTLmjuqoNWL7qr8kHpzO4vmb73WN3?=
X-MS-Exchange-AntiSpam-MessageData-1: Zd5OjMPc5ozYDpR1MYxokORmgEpyta06obs=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb512b65-8e8b-460a-7818-08de73c49edc
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:49:05.0273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nccVbnyUJBGaXLobYJ1aaa+ZazDYOKYJ83s8F6gQiX/sK1ep+An+/Cmj92v9/6t7dbFsvoZ3jiMgsX7j5qh4M7Lh4u6Wo94DgWfRZjkZeoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9154

The first patch properly annotates accesses to ->child_reaper with
_ONCE macroses, to protect unlocked accesses from possible cpu/compiler
optimization problems.

The second patch makes sure that the init is always a first process in
the pid namespace, previously this was only checked for set_tid case,
and could lead to potential bugs.

The third patch allows to join pid namespace before pid namespace init
is created, that allows to create pid namespace by one process and then
create pid namespace init from another process after setns(). Please see
the detailed description in the patch commit message. It depends on the
second patch.

The forth and the final patch is a comprehansive test, that tests both
basic usecase of creating pid namespace and init separately, and a more
specific usecase which shows how we can improve clone3(set_tid)
usability after this change.

This change is generally useful as it makes clone3(set_tid) more
universal, and let's it work in all the cases evenly. Also it is highly
useful to CRIU to handle nested containers.

v2: Use *_ONCE for ->child_reaper accesses atomicity, and avoid taking
task_list lock for reading it. Rebase to master.
v3: Separate *_ONCE change and "init is first" checks into separate
commits.

This series is also available here:
https://github.com/Snorch/linux/commits/allow-creating-pid-namespace-init-after-setns-v3/

Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

Pavel Tikhomirov (4):
  pid_namespace: avoid optimization of accesses to ->child_reaper
  pid: check init is created first after idr alloc
  pid_namespace: allow opening pid_for_children before init was created
  selftests: Add tests for creating pidns init via setns

 kernel/exit.c                                 |   3 +-
 kernel/fork.c                                 |   5 +-
 kernel/pid.c                                  |  17 +-
 kernel/pid_namespace.c                        |   9 -
 .../selftests/pid_namespace/.gitignore        |   1 +
 .../testing/selftests/pid_namespace/Makefile  |   2 +-
 .../pid_namespace/pidns_init_via_setns.c      | 238 ++++++++++++++++++
 7 files changed, 256 insertions(+), 19 deletions(-)
 create mode 100644 tools/testing/selftests/pid_namespace/pidns_init_via_setns.c

-- 
2.53.0

