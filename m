Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08933009E2;
	Tue, 24 Feb 2026 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919153; cv=fail; b=LjfwcLVSPBV7E6EV6TL+z5WJ2pnwdtNIiU1schsR1lI1nPbXiHaMWC6FqKOtNBJn9kvQFoNl5U5s6B3rLl6Xs36tjvzgyOwxHEVHB14hY0jSu8MKRN1NT4cxrMbEaVrl3E836HSjnktX94hlU5odhq2POcq0PHdMwfVMSaLEYnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919153; c=relaxed/simple;
	bh=qMiqedBZEScGhWGXDCZCuMSxs/YLYN+cBxtXK7fGXM0=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=cSky8b0zetVxv3QJ3p+FFq+bA5MZ+qlVMy9gH+CZTSACPSUfy53i2vygayd00qCE8V+j8TDcE1I+Qy7h/C1k+jcjMlyJ2hplfZszY9UfiWZXWQ4xPqAOlP2YvkXelw32hQ5JC5quhHS92JlVfCbthOhHamfL08e73DalE2bw344=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BhgZli7i; arc=fail smtp.client-ip=52.101.46.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BhgZli7i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpm7EiQ83Td9Oxa7VX32QvsrwvCQP/s0Vcbqts4wpTuZpRHojczg3bqxdYO4I1r664rMQW4zFgv5OfvwNVL4rDY4aBOE+yDOkWSaiOIHxIUpXPdtb9W/SXYv5OEhuj8hpzXSNEf+6eqysBO7qLkWh/KsNFN8DxXVJacpfypc2slaRWjg7Cuk7dsF8MLw05re5u4O2Z2Ll7Ej3WWI+8CA7H93OCzKSGWNYdV6/7mDsGaOAu2Fw56YnOuippIqjy7tAiUv9ReBFMRIbHXQY3QGjUnrj6/OkGOMNChOl88VQX70vzjpw9Ncfvv1D7DWIV98meLiEgb3JWXg/jwPcOqEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGt7cctcFKpTm50izzrS1wUam++3TAvySwBCeSwETto=;
 b=pzbC8e9qp2rNTQOZA8aHPwmNW3xZUON/vBlnvpqk5Qw7D9DyZWPBsptKjXIFOXCDSZ8LNHuhPe3ysjHK5kl1bQ4gBTuSjVPzDJhVEJ/ukd545Sy/YDR26xusSB4x+SUv9pKeSGTMhim8xmJazcQk9CsFPUv+UMGr9cWm6hrPTqybmsRUtoNw3M9tqNd8/tfqK4xrNvum/9XRQtmQVrdU5vTB8OhczQlQ4W20wSS4cWjh3YjhSYFiSaHN70hU6sjMU+Vq5iiknN8Q4tlL5A9QhK6wZ/ba/HjZIc5/eP9ysCXjgHJkSA8lxzhaAyetf8EISaK/YC1s1DMoIoJnbZw3lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGt7cctcFKpTm50izzrS1wUam++3TAvySwBCeSwETto=;
 b=BhgZli7ik7tJRVhQQhHKavA+HaHoUO5InFiIhDc3MEDUsfW+WZW8xfD1lyT3CWRQwbkmNkTnirnPgzGr5rluyi9bDYRRLc/jKCVBEeZ2DgVhA+ioYyvFVOWrs/w4i9JgPt1XxtGcfmpigR8CfrrdqQMqw3dtmB5UEFOgEGZOWoWbpTzFraAKTipVFpy7vdfU6KQ9L/zkbjG4ukQEY9Lr/TeR3vcIRSnKuTDDhRMwU/b4b6ryGucJ4tRIJ7fHRxu7oCY6mLaytWIDKDyBV+BFwixcBzYpYQRezf5PySh/vT3bcSdfl+O2QrYNa/m5rQqEN9aovd9QI22nXP8UbUu7iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6464.namprd12.prod.outlook.com (2603:10b6:8:c4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 07:45:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 07:45:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 24 Feb 2026 16:45:30 +0900
Subject: [PATCH] rust: kunit: fix warning when !CONFIG_PRINTK
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-unused_var_err-v1-1-c51d805eceb5@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0auUrC1o8EO9ikgpNtVsqiQognh3i
 8u3mHlASZgURvOA0MXKey5oKgPLFvJKlmMxYI19jdjaM59K0V9BPIlY5/o4pBRwWDoo0SGU+P6
 H0/y+H8nVfHVgAAAA
X-Change-ID: 20260224-unused_var_err-996d7ffa27c5
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0040.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7f42ac-d25a-4c38-2d9c-08de7378b8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dG1BemthekJvRGxaOXFvWFFXOElYN3A3UGZyN1EvVlJsU2ZrMnk3Um9NQmkz?=
 =?utf-8?B?UFVvQXZhaFVHNTdvVEJNZEtVZ0xkdEowd0xkNEpOSE11RUMrSG9GSGJFcUI0?=
 =?utf-8?B?TnhCem1pYVd0dEV2UU9QeTBWenFMZTNjY0pKRXJ4bjBUbFpCNlJvOElFdjFt?=
 =?utf-8?B?N2FQOWZzNWFrUmxNU2xjb2lsYjFtK0U5dTltdE1hTHM2cmpiSm15UmhETDhx?=
 =?utf-8?B?V3NGa2o4OXZQVXVsRWttaEYxUVQ0NEg0czQ5L2pBOXp3SWZ4L3ppa3JnenBC?=
 =?utf-8?B?VG56WllMdW1qMy9CTnJLOWcrKzlwTDRxa0loWWxGMUQ3bWhVWFk0TTBIdzdz?=
 =?utf-8?B?WWhpcjh1VW5qd2JUMzlDWTd1MGtvNkt5K2VNMjJZMk1ZVDA2NnZCZmt6QjJp?=
 =?utf-8?B?UmlRWVRDRi9QUjU2RjByUGU4cG4wNFBLR1V4VUJ0TW5MTGZiMXBPQmhHMUJC?=
 =?utf-8?B?eUlibkRjL2JqQXU1aWJ4akhsbXFSNkFZc293ZWcvcmREVE5HelI5cHNjWTly?=
 =?utf-8?B?WHpaU0pqR09BYy92bE5KVkxlcWdqdytINTMyREFGK2FMNWIzZEZ5RUl5TGY1?=
 =?utf-8?B?WWZIUit4VGVVVjZpYmFXczhyc0ttMkVJNzZsVmY3bDcrZ0t6cTJ2aHJ6VzZQ?=
 =?utf-8?B?SjJiTkgzMFFCUGttVmNXQWJmb2U1TTNGcFphdUpiSG1EY253MVpYbkRHT0ZG?=
 =?utf-8?B?WmRaK1BvNTFFaWxESXArNFpQN1NtK2RGdHB6WHphSS9NNkRQZElzZUpYWUYx?=
 =?utf-8?B?RmM0RkR6cVR5eXdUUnZNdmhZY2hIWFRHeHlsNjE0U0VqVHM1aXNQd3JDSk5u?=
 =?utf-8?B?cmhVVlY3ZVhpL2RyOUh5T1JVMmVRRm5YZzM3Um9rQVhKK0lNNVVkZlhaL01q?=
 =?utf-8?B?bGw2ZTZYSi9VeXcxcnZOM2IyUUFEaUtmWnJpdkFvRjlGR1h4dkJuYUpTdHFS?=
 =?utf-8?B?MHlIT3RXVGtPdE0wdnlTVk4xU2tBNzA2SnA1b2pQa0haQU10dlVsVHdiMzBI?=
 =?utf-8?B?VnNyMXlXcmxESXdVc1k5SG9hZWJtdGJsSThVajhab3BtTitzNXJFY0xwU0dq?=
 =?utf-8?B?MllVSWhuZmFSOXY2UUU0S2dWa2ZiV244Ym9idDBQcWtNdk9UaTlTQU9TYXVa?=
 =?utf-8?B?MzVqd0ZmazdJNC9WYmc1WjErSXhMM1IxaWtKMEJhZUFNMEIyTGRBSGRMUlZ1?=
 =?utf-8?B?Q3FXbDVKenBVdDdmYityZ2wwT2x2Rzd3Tk53SkJxcEZxb09meGVJazZSa1pY?=
 =?utf-8?B?bURjM1cxY0ppS2tVYmNEQldwcHNPdTN0bEtQYkdJUysySEg1a3U0VS85VDJi?=
 =?utf-8?B?S2ZlTnVlZEpKZmVVY0lQaWR6RmtJZGlNRldwZnRzbHhZNzdqK0lMTVQ5VFU2?=
 =?utf-8?B?bVdKZ1hmV3VtenlkNFlIaHBsa0h3OTlsQ0lMZWY2T1BJTXRJQXJGK0dqQVZ1?=
 =?utf-8?B?ZVprMkY4YlFsWFVOK1NqMWhFSUR5MjJJWERPUTFFY29DYW1yT1p0VXpnVUw1?=
 =?utf-8?B?SzZMM1AybkZHS3IvWTl6cWVPc2RmMTN6RytFTm5lSGJFeTdQYTA2aVJyUVZm?=
 =?utf-8?B?cG5HYmJ3TXlrUDlTUEd3eDRWLzB3dVJCVzdNWEVic21maklTUXZCSTB1THdL?=
 =?utf-8?B?djluOGloVWN6NGRyUGtucnVKalNMdEdkaC9oK1NTalhsWlJyT0lIeUVxdEdY?=
 =?utf-8?B?QzVyc1RvSnhOejk1VzlySVhXZUtrOHpCa0VFd0UwOTJXT29Udy9Fc0E5Y2p4?=
 =?utf-8?B?d05uY2FtQ2ZtSnNqOWhTR1ZnTW85VnUwTnFwTThGMXZjSGpZUFVQNExLUDhr?=
 =?utf-8?B?ZTFsMnFUeERBY1BBc2t6Q0V1dHNJYWgzNUxNQ0huZ0lEdDFCMG5uZThQMGs5?=
 =?utf-8?B?TTAwMHFBRkRMZkxiUytZeisvYTVkN0JybnA3R3BrTllzYmVWNWVLQ1g1UGNY?=
 =?utf-8?B?bzBhL3FYdlpXSFcyTTc4NFVXallJQ1kvZHgrUmw5ckUvcEdBR213V1AwUDlR?=
 =?utf-8?B?MmlJZThhd1N1cTA0YU4zNlNnMEVuc2hHWXhLNjlQZTFtNzhHL1hqTXp4T0NW?=
 =?utf-8?B?WktWZVNvbXM4S3ZsQjFxZWRNOW1vOGZ2T3V5RGJ6NFNCdUJqVDJHQ1lYSnND?=
 =?utf-8?B?NUpZU2Zhd1liVmM1WStlRmEzZktMLzNkTEJPOXhhekYzYkpKTEp6Vmc5dTMx?=
 =?utf-8?B?V3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anhuMU4vTnNxT2VXNFg5YWVkWjVHWkRrVjVzcUhkanZJUldoTzdwa3k3anhy?=
 =?utf-8?B?YXd5cXVPZGJLQ0c4clhjclRKYjNVR1FvRWc0ellKSEVaT1pNcnkwcHRkUmgy?=
 =?utf-8?B?ZHl1elN1ekRIRmhFZm1NMlZvY05ua3RINW45YlY3bGFEYlovZHMzOFFzVTNG?=
 =?utf-8?B?ajlMZ0NxcUhZdzZTdWFLM1NHTlZXclVMMnl2ZDlJa0pRUXdDbUR5TjNSRi9B?=
 =?utf-8?B?K3JtNEY4bHRISG9sbmlMUUVYUXJIZXlFRFAvbFNLTFg4NXJ4NGsrUzZVdytI?=
 =?utf-8?B?WDVBdUhrUi9zNDRYQmFIN1B0RVc0U09iOWUyRUF4UnMwTU5LeVpmb1pERzlB?=
 =?utf-8?B?aHZYZGhGdFRZTklmQ3NBdmU3SEVXaXlmQjNFTXZpZWM3U2FwQ1h6UXhaZ21p?=
 =?utf-8?B?REJZTHN4cHc2Mjl0YkVxZTZPbzQ2M0ltOU84SVdaTjN4ZE5OeFJKby9KV1dq?=
 =?utf-8?B?SlNIaTdCcnRmNTNKaG1haE81UjlZeTR0WERSd3ZZdTg2eEIrZ2RBOGJFUFRP?=
 =?utf-8?B?eXZ2dmFaVFFpTGIrbDhTa3I4N2lrY2tjY01OeXFoSlJhVmdUcWFNRlZnUGcy?=
 =?utf-8?B?OHpoVVdHNFFnQjhTcy9lSkh1SXFzNktSSFhFSk1Wbk96MlFzb05zcGNmRWRs?=
 =?utf-8?B?Y1MrSS85dnR6MzZXcmMweitCaDk5aGc2dUZhaHBuZnBiZ1dydERqd3BOc1Vz?=
 =?utf-8?B?dWxQcldQTGRLc2dsdGlTQmJiK2VObTFlaWt2UGZKbVBpRy80ZVBqRkl4dlo4?=
 =?utf-8?B?RmVPSWtpVDJ6V1g2alJndnZGL2NRck04SVN2V1UrSm1rbzM4T3cwbjJVUnYz?=
 =?utf-8?B?bVlwSzJTM3RyMzEzdkgySW8vSFErdDUvbzRVU1gxZDJGNDBiWWxJdnN6b1VM?=
 =?utf-8?B?NUptRTFsUmRYc3F1VEhZWFhrUWxTdzdqWHY4Vi95bjV3bk56OHY1T21ZU2hl?=
 =?utf-8?B?QkJ2bm9XdmoxK25PbWViY0RoRktYNXZrc29ldlVwY2FnS052NmNrWkhiOUxC?=
 =?utf-8?B?cXlJYWxkNmpyRmlsS1g3ZUJoZlR6YzVmR0FzcGI4Qk9xbGxOUUhRdHRWbTRY?=
 =?utf-8?B?VjlucHRBN2FlRFpOSmkyLzJiTTkxTUc4aWtBQVBndGYyL3RPWHVpdks5dStE?=
 =?utf-8?B?SG9pTDhUSjBWdFY2TVFNaWV1VkFGcENwanZSTENnM3crcG11d1dCeVo3bVc0?=
 =?utf-8?B?cjlTZ2NjeHFIQ29NdzJIT3hpSU1vLzlqaXZtSHpBU3lrN0U2aTRZeDlraVor?=
 =?utf-8?B?TXl2a3J3RDZUbWRzZTJ6WTYvb053VmRmRG9VUERseVdoMHBRRENRbFh3L2to?=
 =?utf-8?B?RGlnQjVFZXRDbWdwKzZ5VDZiQ3UvS3Zac2ZiMGdxK2kyWHpuZHJCRnlHNFpC?=
 =?utf-8?B?SW8rRTNUQjRXQUYwb1FKb05OVHdtNmt3NkZHSlp0c1hIUWhmdXkxVVlWTVhl?=
 =?utf-8?B?eGxQNHpKVHFvSS9HU0VkcnBheUlMWVlQRiswaXF0UllWNXVFcHluTW9udHBw?=
 =?utf-8?B?cXhKTXhoMzRuK3Y2RHhwbGxVNXlzTVNaWjlIK3dMUDNwY0M1OVlrTnp4bTNy?=
 =?utf-8?B?QW1vRllpcXowK2w1N2pQa1JGanhIRnJibGNlSDk2OFpFQy8vYmJFSkZMYThI?=
 =?utf-8?B?Q08xbjFuSERlUzZwK2QxZHB3blU3MDlkdFFSbFNKMTZLT2FVdG9XWkJ6MWlQ?=
 =?utf-8?B?UkV4Z0h6Wlpxb1Qwanp6REpmanNDMHVRY0FOdThjbG96eEZpaVB2UDc3bWVy?=
 =?utf-8?B?QWYzV05vZnhuMUZXU2g0eXNyL3FXczFDaGl6QVdEa0lRNm00NG82Y0wvNjQw?=
 =?utf-8?B?UzdCNVZGdHhUcEY4WkdnT2xmbE1oTmlDeTZ1N1hsT2NIUXBocEJtdzdMYlFD?=
 =?utf-8?B?UDRsSlhwWU9TTyt0TzV3dmpleWdFQmN5c0NZQUNNVk42dzA0THM4VldXZCt2?=
 =?utf-8?B?eFArdUJFUEdGcFJKSDlJK1JobWhiY1VWODhlRjlOK1RGL3hPYW5uRFJYc1Ry?=
 =?utf-8?B?SWRET20vVkN3OThnTWdtNndKdjVXMjhsOWxmSzBHQWpvNFBNRzlMQ2xYN2FS?=
 =?utf-8?B?RmowU3dTT2pVQ1JBQ1hTeFIzNjBYZkFkWVQrbmJpZkFna1dNUWNLRTVhaERR?=
 =?utf-8?B?d05DU1FSU1I2REgxOGJ2YWZhbjloZzJLVE84Q1gwVW1xd09EWnJZcnYvRHJp?=
 =?utf-8?B?L09oR1RONUM5TTVjbzZkOXhQdHJpZ2gzeXI5Z08zejdseHNkMlVWVHFHczJl?=
 =?utf-8?B?TDRVeWY2K0FJQjBrbkR4NXNBZ0lMK0kwRFRYYWpyazBSeUgxNDhsajVjRWJB?=
 =?utf-8?B?NlNkdVBzKzNZUGZKaXk3OTlmcW1uUHVxeG5qODFzN25Xa2FoeGV2NkFCTFpE?=
 =?utf-8?Q?nR5apVW1b6NAYz5YObeIju7nzs0fvrrj3uouEbazJFQl6?=
X-MS-Exchange-AntiSpam-MessageData-1: URsYdBkjL+Dsrg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7f42ac-d25a-4c38-2d9c-08de7378b8db
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 07:45:46.9200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lu8xLL8OJz7jslSEi28474/M0mBR73yRtse0QDPR84IM9vAtwifWNjobH98owC66ZQbf/6+QrfEg7lPTePenbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6464

If `CONFIG_PRINTK` is not set, then the following warnings are issued
during build:

  warning: unused variable: `args`
    --> ../rust/kernel/kunit.rs:16:12
    |
  16 | pub fn err(args: fmt::Arguments<'_>) {
    |            ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
    |
    = note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on by default

  warning: unused variable: `args`
    --> ../rust/kernel/kunit.rs:32:13
    |
  32 | pub fn info(args: fmt::Arguments<'_>) {
    |             ^^^^ help: if this is intentional, prefix it with an underscore: `_args`

Fix this by allowing unused variables on these methods for this
(arguably rare) case.

Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/kunit.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index f93f24a60bdd..5da342f5c84a 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -13,6 +13,8 @@
 ///
 /// Public but hidden since it should only be used from KUnit generated code.
 #[doc(hidden)]
+// `args` is unused if `CONFIG_PRINTK` is not set.
+#[allow(unused_variables)]
 pub fn err(args: fmt::Arguments<'_>) {
     // SAFETY: The format string is null-terminated and the `%pA` specifier matches the argument we
     // are passing.
@@ -29,6 +31,8 @@ pub fn err(args: fmt::Arguments<'_>) {
 ///
 /// Public but hidden since it should only be used from KUnit generated code.
 #[doc(hidden)]
+// `args` is unused if `CONFIG_PRINTK` is not set.
+#[allow(unused_variables)]
 pub fn info(args: fmt::Arguments<'_>) {
     // SAFETY: The format string is null-terminated and the `%pA` specifier matches the argument we
     // are passing.

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260224-unused_var_err-996d7ffa27c5

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

