Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020106.outbound.protection.outlook.com [52.101.69.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9735207A38;
	Fri, 20 Feb 2026 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771605972; cv=fail; b=IwnoYTcgv1zOJbDfdT6FN4g8VboZR91DRYmFN91jCcIiNgOYn+P1+Z++1gOx6DHYWka1nbkXK3q6bYoWrtZfMzmG1kqXOpxY16vN+s7wnlJK9lEM5N8hClmtOgP8X4gTb0AdXKdtIaV1Nh8SwpX0UJ9g1H/UyCa8HxIvkWyKhaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771605972; c=relaxed/simple;
	bh=E7UMegGk74SdL+D2vAYeRQ/FVYAXWfFmVoVWQP6xAQg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=baGifG2YGDMHUHiWn+1qJvloaqcFma7WRbM08XG1XU9jsFHVGmewxPI7rdaVI+8RddnlvMIOl5Ng4ZQFGjurnMlqj2mpeTxeKdCwO9iYNlfbWsF2izOv5fAs9yAWUfoQ38dDV5GqpPE2FwOxdPbXQfSdDPPtPAxirFpXlcT+qIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=cKyh1pYQ; arc=fail smtp.client-ip=52.101.69.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="cKyh1pYQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPyA5ZdPJSoR1lm9jJ6g1vXSPmvnXet9m9zMKm74YuqB3Unqoy5AkVJJEwxukd5HWmD/moz4OJ//voJ9hulcUXG6h+Vrnh58xaAk/Qtla/nqn2TxYwBzNv4JtL+CkxTFXObVL472wfgegQriQvaAdwtxPpTUq5TYCT+VrFCypjA8eiwO0QHXYu5qFcZWr9Hoifl6hWilLE63CQtRUYJPFmB6IfUc7kZMrbzSvDfVZEP+TUZZ7uFGB2q3pywWeHJDDi5tu45WS4oLE19zvBqLi2xbbQKMdwLbQOcItue/krgJ8WlaiMoIvGekX5dnl6gqbZ/VLCTu9iK5svF6kMaf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dac4qF9K+m8wHV+erEPJLYkdtHV+8QX5dqd9M1IqKJ4=;
 b=TSggUN4O1rYap2s4zXgaFAlFdOCxVchKtRbOLb832H6e3k9Z5GbjoIVYcmrJeZBIGQ10TlgrOV3VUdrZuA2VkNopFt3gplt2UwSILk9iRTqRQYv1of+1JC9TrauZnyMtSB2UQfpSmG779AZvc4IH3CGqI+8cJaAQBTZ6AJJDWB1J8lyqH1hEm4ucO/Mdz89ywBLQt2kVzwq9xdsNetv0nZP4gMrhZjiD9kHUTTB7OJGhjHltXP4vDIzMTgnV7OEwx63bxOjL5TW4MHcAQSRoTFvFOIc1qcNn+5crRsXMn+li8WKt7RY8mQNWQRdD64A2jFHR1NeRRHvdtKRRrp504Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dac4qF9K+m8wHV+erEPJLYkdtHV+8QX5dqd9M1IqKJ4=;
 b=cKyh1pYQIDL75M/tcWUWkDr2NbvO6kZan+NimrHdOrlc0Gxh42E3wHcIvu+xd5iV7Fo7EO3XHfq2ms+0Ejcdo3FlAE7wDop0g28Fi6ft1+7vJu6WqvtYZyXSuyg58BRskQVUlRgytxP0p+zvJ0zsCnUtUELMWHm0EgrSMTDRd/cN4Q1nRK/SbQop4Flnnzx6OoBQUYl7q6enw6sXgM2kIrSVceI1teKUDkd9AaZYVYyMpsCnFywbQmAtSt/aCwRz9MT8J7kCikb/KG++jpr7so1FaF9C7BQbRpQmHNeTsf0u8bIWkDYkjncqHlkVLpAufqC7+De9+ZXmGM37Wfd0Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com (2603:10a6:10:471::13)
 by GVXPR08MB11132.eurprd08.prod.outlook.com (2603:10a6:150:1fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 16:46:07 +0000
Received: from DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2]) by DU0PR08MB9003.eurprd08.prod.outlook.com
 ([fe80::3470:51d7:36e4:36d2%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 16:46:07 +0000
From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Oleg Nesterov <oleg@redhat.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Andrei Vagin <avagin@google.com>,
	Kirill Tkhai <tkhai@ya.ru>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Adrian Reber <areber@redhat.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/2] pid_namespace: make init creation more flexible
Date: Fri, 20 Feb 2026 17:42:26 +0100
Message-ID: <20260220164559.2465466-1-ptikhomirov@virtuozzo.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0456.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::15) To DU0PR08MB9003.eurprd08.prod.outlook.com
 (2603:10a6:10:471::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9003:EE_|GVXPR08MB11132:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae15881-d06f-411e-c577-08de709f8b72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1RiWG5NS25UdVBacWV6SW5PUWVBbk9OVmZPU2dzMCtHUzlIVEpmVzhmSGVk?=
 =?utf-8?B?RmxEeUcvaDd0SVNGUHdjaFgrTE90Z0wwd3M1UG1hd294RVVJU1NuL01sdDVU?=
 =?utf-8?B?QXZ6Rm5qVlpjQ1E1Y21CaExYYkpBcG9ycDM5TGxPWjVnQ2thWFdabmZUQnVv?=
 =?utf-8?B?WkZra3FnUElRMnRoK2R5R1lHa3FNN1VmSVBZdzBpNGZ5QVV3NmpoQ3I1MnNj?=
 =?utf-8?B?Y1F1U0FBdzltL2lQWEdVcDBuT3F4Qm1BZ1ZiUmRPS0VsNjFBMlVvTmc2bml6?=
 =?utf-8?B?cGFUcEV3Q0ozWkpRZ2JBWlgvNlNOYmljODB0bEZNU1Z1MlIrbEFScXFxZkE1?=
 =?utf-8?B?UWFNMVYyM2VML0hiTkhTZ2xJTndFTmkvZkxiYmptVHNlajF0blhHL2c2MU91?=
 =?utf-8?B?VnRaSHJEQVMvd1JJYysyZHRzNWpGbXRCUFlIQWtOdFg4a0pJejBRNkt1eDNo?=
 =?utf-8?B?Qk5DUFdqMk5UNHVUZHRKYy9tM1BvMlMxTjlTTk1XaUVjM29oR3VLdjEwaDl2?=
 =?utf-8?B?NGZqRjVPS0gvbDMzaGtYQTVRdEVZeFkwZDRiajcrVVJDY29NV2xJOGtJVzho?=
 =?utf-8?B?R2ZzdjdDN1l5NStIdHFPaTlzcGlBNk1TS1RoRjJNVjVKbEYvTGFHUytzazJ6?=
 =?utf-8?B?NDA5SkVQYzZzMWJNOEE2YlplMlNtVHk3ekd1OFR5TWs3WjRZdlovdUsydmhI?=
 =?utf-8?B?N3lvYzk3OTNnSUVoMG5nNE9LY2haZGVHeXFFaEZHaDFGREhkcVVlZCtWNTdt?=
 =?utf-8?B?N1B4dER6UHMwMG40dUVQOXZjaHJFMnFFSlF6ZDNoQk9NdStZdTJQbHF5NXdw?=
 =?utf-8?B?N2RSeC9xT2VnVHViY0pOa0VURGt5SHRNclpEL2F5UXRjU0Q4VUZ0R1dBZFF2?=
 =?utf-8?B?S0Q1NnpnZTVDeWxwNm0yamxYQ3hsOXJOTitQSmkvSEZ2bEtVRWFkN1g5Q3dC?=
 =?utf-8?B?WVA1UjFTUW12bmlhRVNMK2tlWURDUkJmRENwekpnOXFwaEk5MHByemZsblRP?=
 =?utf-8?B?aVVNVlNmcWJlL0t2NFd2VElRN29tVXVSZkFpbVZNeDhjS1JUblNQNGpTWFZW?=
 =?utf-8?B?OUhCRy9OWndORTZSeWxJVmpzQWhSZUxPTEg0M20za0RyNGMwVUJicDJNd0Jh?=
 =?utf-8?B?WS8zQ3ZWdWNYRm94WFBxc0poRjN4eThiQzE5cnRZYzIzbGJMQzRQV0V4cHlD?=
 =?utf-8?B?dS82Z3JURHpmeHhEbmZzS1dwdEdlUEM5cmFXQ3RmQ0VuTzNJQnU3WVFEd25D?=
 =?utf-8?B?cFNwRWJEWnhZOGl2M2trV2l1S01KYUhxVDRlNTJ1bHV6S3ZYSSt3Nlh1cUg4?=
 =?utf-8?B?aFNHWWtrYW9tYzVEL1NZUzhWS09EZ3VKRUdmTE4zMGcyNXRjK1ZKS2xEU3Rl?=
 =?utf-8?B?NXl2ZFFBM2FkUlBrbi9ta2NFd2JBTG5XNXlZMHRHbEhBZEZpMEY4MERad1B3?=
 =?utf-8?B?Mkt6dkhXRUs2T3QvVXFIWGZsYURoWUdERDNBckc2K0c0R0ozZjNvemFqYU85?=
 =?utf-8?B?R3FwR1pRWjVyOVh1U0VOcHlCa3pJTE9FM1E2M0E5V0JIY1Y5T2xoTTdnQ2lL?=
 =?utf-8?B?SCtVREs4aHhjWkRJYkpSaUtiMzM4YXlNVTByRnRZRjYvVitUSlZVZmoyakRQ?=
 =?utf-8?B?WWN0d1lwTnp0RHdaR2IwVy9UdndLNXlPcWtxbnFRTEhiSEZRQWRGV053eHRO?=
 =?utf-8?B?V3gxSi9JYnhGNXp6K3p4NFZUdTQrdXlNRGgrUHo1WXFVSVA0ZlkvSmZNKzc2?=
 =?utf-8?B?WDE5b2JkeVF6YUtzeHdxdDBFb21qVFVzRjVTT21FT0VhblVQZXloTUJQM1VC?=
 =?utf-8?B?eXl1U0loU0ZacVRRb1FFRGtJRXJMcTJnbjhoSUlwS0llcW4zclJpMGpRWFBH?=
 =?utf-8?B?R2sxTjBBWDlJVVFiMlBwbDJWcENvWW1QSE9ETFFZeWxMVUo2STBiSEFIZVor?=
 =?utf-8?B?dGlMUmRXdlR5NmpMMlJIeWNvWmoxeWhGSjhUWHBvekg5eFVyY2k1ekcwV1po?=
 =?utf-8?B?RTl2Vk82czFTbHUwd0NGamFpdUhpQnJZODZWY3prSFF1ZU5OMWJiY1E0VXZ6?=
 =?utf-8?B?bStWbWtKVUs2cWZBMjdsaDVqUFV4bGJKM1ZpT29kT2N2ZWhqVjQycGY0Q01v?=
 =?utf-8?Q?8VcU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9003.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azBxU0hRZllCaDdicjFRWVVoRDdua2VIVHZIcEpoV2hDc096cUhNS0QrZDBZ?=
 =?utf-8?B?dkxySHE2RWhBbUM2S1Q0TitOUnNIVTFmREQ3VEdublNBeEs4aEp5bUpJOFQ0?=
 =?utf-8?B?L2RuM0RmM1Z2enlJbGJ2Tm9YTjltU1l0VVNvc3NENm92QUdLQytaamRLVmlm?=
 =?utf-8?B?RU1uaTBOZ3RVSnJ5SVpkWEV2Rm96K2hxWkx4WldidXYvVXpWai9YNVRaZDM1?=
 =?utf-8?B?cUdmWkNSNllXd2d6by9RT05CazRPVEovUFZyK2V4akpwY3g4V0MweXhoL3Zm?=
 =?utf-8?B?enRnYnJyMUkzenJEU1ZUZ0NrRVdDejB0cFhEdmNGZHpLS0o1ZjkyRG1WRGdm?=
 =?utf-8?B?L2x4cWlwVnZNZGg5RFNiaEJkcDk3Q0JTMGd0N1p1WlJzdnZIR3pzR0pxQTQ5?=
 =?utf-8?B?QmtKZGtiY1NCdHd3dkpBTXgvK2ZoK3Y0Z2M0UTcyNjNKejlsTDFCanVwazRw?=
 =?utf-8?B?M1hGRGFDWTN1bnRhKzNGdlRFSG1qemlyd2F1TEhhTUQ2Uldxd2RQUGxNaHpJ?=
 =?utf-8?B?Z1NiMzV1aVZSUUJ4WW9Lc3BOTlJBemZ2OU9WN1pNdUlyeUJmQzl1MGJHbkVo?=
 =?utf-8?B?MndQZVlDZHc2SmdiZnR3UXhuUzFuSHZFKzduOFBZS3BSSHJvRm1CZ2ZadDFj?=
 =?utf-8?B?SXk0TGd4d25BdnhDVmlrZ1BWSVRnNXpzSlg0akNkNFFvZDlEbGg3cDlxWnda?=
 =?utf-8?B?MzlEcGpQdk1xdkZhWCtEUXBXbkhadEJmZHJNbndWRi9POEJjNFRkU2pyeUht?=
 =?utf-8?B?OXEraFZ0eXh6Q2pBR3plZURXMnRoKzZ4cXowUlZHQ0JDK2l3OGQ1SERCWUl1?=
 =?utf-8?B?ckN4SU1tOC9reWdPSUNVU3Vsa1FqTTBmRGJrOXB5dENyak15K1M0OE45YThD?=
 =?utf-8?B?OWRkR1N0MFU3cnFZWklwSEdFOFBrZlVqUjlaZ0NVS296YmxJN3RwUlhab2Fh?=
 =?utf-8?B?UDlhVVFmMGlQdThBV2ZreUhqK29ROTcvajJlaGxIMTd2czF4VkpiQVdyWlVw?=
 =?utf-8?B?ODZGUUlYOUoweUh6OUloQzlIR1pRUVJLekd1akJ6aWZodk8yd0x3eENmOVBa?=
 =?utf-8?B?V05XUk12M2diaCtZU0QrOUFaZzRtL3lQL1BvZzUyZmZXZW5NaXoxalhSTEs4?=
 =?utf-8?B?a3Vza1Rjb0loSSt0TnpBSVFsQUJZckNxSENFcXRIN0gzN1hsQnV4ZlUxcFV4?=
 =?utf-8?B?OHJadEJ4YzdXN0lGc0V4NGplRmVIVWVxQjN3blVBMFl0Y1RtdTFaUGZzWjJS?=
 =?utf-8?B?MGdtSnd0TWlhNjB5NS9jUC94Umc0cDBEckwvOXRGZjQ2bDRGWXQwQ1lqOExq?=
 =?utf-8?B?OTRldU1meVVWaDlSZ2tDUE42aTJWZFgzNGJtSmdQRVhMNTJ4dGhTN0FhWXFn?=
 =?utf-8?B?ZWdDMGo0UllSU3hpUDhiem9HWW1vWEFRQ0xLUGhkbUZKSGp0TTROVFF5ZkZq?=
 =?utf-8?B?NHRLT1FIT0MzOVFKUTFMQjl1M2tKWVUrNlNzZ2JtWEQyMzhoeDZIQ0lRM0JZ?=
 =?utf-8?B?Y1h2c0EvK29CeFZSZC9GNHhGcnNUeTRRMGlBLzlNS0RIQk40bEJ1ZHRCZUNH?=
 =?utf-8?B?OEJMWjFnZkZkb3BuV3hySExoYnFLcU5MSWJnaWtiTHBvQnc2eFBhN0t1UW9D?=
 =?utf-8?B?aFZncjdiWEJEd0tsVXNENkMvbHVqdCtlYlF1SDBBR1dIUkR2aUhkNDdOcVFu?=
 =?utf-8?B?STZqeUlPdS82SEVQUk5zREVuOWlkRDg3M3h5UEJOQmdwWVBzR25mQzhxeXVH?=
 =?utf-8?B?Y2djc05uTE9ETGlDc2c1VFJLdVMvbisxTTlsYU05anByYVVxOTVvRmc4Z2tD?=
 =?utf-8?B?dGYrQ2s3anNOZkZ0RnYzQXVPV2xoQzBVaUFwSWhheUYvUlc1V3lrNmFIWWgz?=
 =?utf-8?B?RnpQTm5Sc05XZFJNaWNWWE13MUxTUmxTSTkxT1BGejNzc2tmQlJzYmR1aHIy?=
 =?utf-8?B?bWRvUWo2d0NlQnpPemk0bnorWTR5NG1NSEUxdnpMcFZLd3RJaFBGTW11WFJj?=
 =?utf-8?B?aEhsbURlRHJFOE1ZZDRKVVBBRHVLd1V1eFhDUmNXQ1NQTC9QczhZdU9WaWcz?=
 =?utf-8?B?Ri90YjRzN2NSM0VOOXpMVHdaOXNLRHYreGlCSkRtQTVDS1JMaklTdHNzZHJB?=
 =?utf-8?B?b0EvclZhRXdOeWEvS2ZLL2xGeUVHbHg1a2JhVW55aWJWMVJHOVI3WEhRcEFI?=
 =?utf-8?B?MXN5Wmc3QnZ2R0x2S0dvMFVndTlySTY1cXVkUFJwSmZGMzBBazZwbklxNDZs?=
 =?utf-8?B?NnNLSTFDUDlqSTJSdUZvTGp2d2QwUDFxank0cWl5NHZsVTNrQUk5UlNaOFBx?=
 =?utf-8?B?ZjF0dVFHL0FGTEJlYWtBRml5S3lwbEJkTDAzVys1Vi85T3lGR1I3NjFlazdK?=
 =?utf-8?Q?HbtUt8DkKNrpbgEHb6L7JajZI0MRu2/DCmVHibOUc0hOM?=
X-MS-Exchange-AntiSpam-MessageData-1: L3Nc9V6Iht87qsFiSAthmT9aEaRzf/LFGeg=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae15881-d06f-411e-c577-08de709f8b72
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9003.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 16:46:07.6730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGwlmddCCz6d6fDKQrMJ1QFQtX+DiMpYh7vRCI9otdyyk/cBQanHL64h7qo621J9PHHtudGpuBOM9t/+OEESVnj8sNklrczF6aR3VsawrqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11132

The first patch allows to join pid namespace before pid namespace init
is created, that allows to create pid namespace by one process and then
create pid namespace init from another process after setns(). Please see
the detailed description in the patch commit message.

The second patch is a comprehansive test, which tests both basic usecase
of creating pid namespace and init separately, and a more specific
usecase which shows how we can improve clone3(set_tid) usability after
this change.

This is generally useful as it makes clone3(set_tid) more universal, and
work in all the cases evenly. Also is highly useful to CRIU to handle
nested containers.

This series is also available here:
https://github.com/Snorch/linux/commits/allow-creating-pid-namespace-init-after-setns/

Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

Pavel Tikhomirov (2):
  pid_namespace: allow opening pid_for_children before init was created
  selftests: Add tests for creating pidns init via setns

 kernel/pid.c                                  |  10 +-
 kernel/pid_namespace.c                        |   9 -
 .../selftests/pid_namespace/.gitignore        |   1 +
 .../testing/selftests/pid_namespace/Makefile  |   2 +-
 .../pid_namespace/pidns_init_via_setns.c      | 238 ++++++++++++++++++
 5 files changed, 249 insertions(+), 11 deletions(-)
 create mode 100644 tools/testing/selftests/pid_namespace/pidns_init_via_setns.c

-- 
2.53.0

