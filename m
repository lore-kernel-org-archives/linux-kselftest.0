Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991094;
	b=pDjsm9XrBrVfTrMrv/hPg1FIHP8SmCEoNJLGdjcPiNKvsgvahlZ/6l/+blOfOIi+v874
	 uJTs8fUfTfTYfmY6njMbvQNV5Wpaye20v19U4GyG1uOqwnhOeIvnD0SeAa+FMngWl6PPZ
	 zRkIveDpfXnYiL70/1QDZW1kfByY7XS1FaGgiq2fk3RKH7M0E1XcfB0DwQtJUeLmU3xEp
	 S1RAIt5M+XQ3ressGFk51hwG7m2YiV6LzRW/whYzgUV2bQDpSvvi0s5ShNcQ8XtLY7w30
	 elsWQkBX/h8XwJBN5C4LYxdYJQGJdxTR5NmNTzI/GYLyZOYyFG+AR6TEKz3PXwRoJNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991094;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MdhPTYskaXErlluukZSJhn6+kPj5oAVom/0TywmgYgA=;
	b=rgWaUovp0yVg8cQwOQ+B4DJxXqo8gMvC3t8VGGmCmAJHgVA5lj81mh+wAStahXunhhOd
	 Obat+E420WyTSwBKPYvGdF5KNS/nso5Ay3TAxKaP71Pq8QxuvuyIg8IEAr0+bnf2DtC8p
	 u4axFbr/b2K8Zx0Jm92pSUaXSTQbnSBZg8ZGbSKL+CbO7Pkv3eEydh7GxABhm2g+fDbFr
	 vclcLiqpTyl05MHWekA+IBqjEP5B9cqbTayOc8DRebfTve0pGtXvGZOMk54JsM9fgmHrb
	 e0y3ZqBn7yJMtE8tokU8lMHNc5a2f+Geow0mLQdyXPbBCDg+hdrVaQgkzb+9rGJRVJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rHXDbgEp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.45
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013045.outbound.protection.outlook.com [40.107.201.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EB7606A32C;
	Wed, 18 Nov 2026 08:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40EB7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rHXDbgEp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHOlJI4F8XDpgF988qXuP3OmImyPRpJWxuFD6NqNkRa8Ll2c3YxeP7MkgJCgNUN177enpavxJ/EfANc8rVn8qlTFWdr3133lY72FhJQKBzJ2XDFglUUkxLTMh4Be+J02z/EnsN//WZEz2Ig2FRZiqfsce6HhBbSL38fybdBYc9eR25+/Dlj7s7Ln5kuQE8AxkU96z5Wyh5iYt1joFIGoPE7YeyAbP+FVzBFfayyD37TwG1iP0VJDZtRBkPttAaQsbePZDb5J+i1/FgYrsgmG340PIjPAsVOko7VDi0/7j/Xj5MqK+InA+v8KAeigjgZzvcpR3uRHzemamK85nPcAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdhPTYskaXErlluukZSJhn6+kPj5oAVom/0TywmgYgA=;
 b=qUlxE/xOG6j0xyGSRJT4E9uhjylb4YozxJ8AUJURBKb2noudvJNa3e4zvIKk8wIC0EjIU63rMX0G6Hn406wtDkj75sz1Xctk8TjY0qgVOKBEjP3DJSy9zYTDZSb7G20p/bqEmTToBWnORcsR5Ex/ukUC+n8ClxYXFuTfROpXuMcpnv/W6w6f/NfQJb8zRgFReuv/FDlRFJefZBA0SEWg5WhCVAjCH6jlvVrFd9z9v+s9v3FOQrx+Y22pQ7ax2OTg6rzj5MubVYZVIjjDa4wB07JSsDsJQ6lQasNp0yYh5gv3OPIwimdFA/HflQTZuU6zz+MY370iVPcQcsPslv4KbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdhPTYskaXErlluukZSJhn6+kPj5oAVom/0TywmgYgA=;
 b=rHXDbgEpwwf1CQM87+HaunoqfCs7WBbGziavWVDWs8pXHd2EgpHHGnB3Wd8zp+x7fDWftHBCjgdTGAfy1mdiIdCVKE13pxaNc8fco585YrmYK7NPxu6bniwy/UHHfaNiZtDkks1beFd61HBnk3mdyESemG81xW/761Am73J2p3jWxKtSxvGEPGo03FdJgZsCerKMNsCryjlLft8UYcAcqKrR8UHUEY47wMUgcBzjBIrOnzPVBACMInixohvwY+tDr/rspznqjRsUG9EmywxEGqt4Ww30LSwRF9KxFWTuk51GKhV2mquJ7Q2NVLlYlusQ+44iE/8IA7fLqYBX628uKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by PH8PR12MB999319.namprd12.prod.outlook.com (2603:10b6:510:40f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:36:09 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Wed, 18 Nov 2026
 08:36:09 +0000
From: Ido Schimmel <idosch@nvidia.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	jv@jvosburgh.net,
	andrew+netdev@lunn.ch,
	petrm@nvidia.com,
	sridhar.samudrala@intel.com,
	jiri@resnulli.us,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	razor@blackwall.org,
	Ido Schimmel <idosch@nvidia.com>
Subject: [PATCH net-next 0/6] bonding: 3ad: Support independent control with LAG offload
Date: Wed, 18 Nov 2026 10:34:36 +0200
Message-ID: <20261118083442.1061289-1-idosch@nvidia.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0018.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::17) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|PH8PR12MB999319:EE_
X-MS-Office365-Filtering-Correlation-Id: da8f0135-2191-4659-422d-08df454efe8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|18002099003|261009223027099003|56012099006|261026140227099003|11063799006|261102123227099003|261028144727099003|261022075727099003|261021123027099003|261026121527099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nlxWtQjffzkcuitK2oYC1jpbv6OU8mYvL3mT5XgVOXUcJjV+TOWWUo8IoV2T/pX9AWewKVC5LNgpe4wZnP8c1WuT1Y/WQlViLcexwTWcZtkC6M7ar0PmQVUOZixLmU1AI7axPZEDjO4KlBtRpp2tBJhvxAkfd3WWMrdwlAKJiLEMLmSdOw9nehDi+RrnDy+1Cn5JvYojQtW37eV/R5dw9hhhqWJYNRadjVz+H31q5Won9JezmBcvYIkDKImPgKcSC2n5iQ9659JNQfJawsuiQ9Cs/VASDpqszbTJFBuUwFGRcabIiNVCuxCpnDMSDoOprXFNy0hJtWlvi5B0A+4T5UaY9HFIOXK+FOF/AxsnO8dT9B1riyS+sgg4cUCErzKHwjHP6CG8H/2vFB8TZpOzKYuxz9FctPHZjkSZ85gIaaeZfNDbOEe6pHmpRtO49pZcxXJx0IZhzaBE84Mvb/9+IihTy0+hNvyKzgksZkhkeWdJ8UjsYoaIgWGln2M69b5a0tHAOU14abhjyISBiIXVUzWRBSQpRojpILriwMcIkKFklxVgLaoglqU1W7YYXKhy2QspptNh4snlvEft8Uz9s8MIqYjCaNjgSu2n6qv98NBLkb9ZHpFp4eP6amcrfzkIrDMwcL5n3eyMmDwl1buBKD6AXgcWEDHy2AzD76K8kak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(18002099003)(261009223027099003)(56012099006)(261026140227099003)(11063799006)(261102123227099003)(261028144727099003)(261022075727099003)(261021123027099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?49z1eavDRzWHY4SxOM1sw077FuQn0/Ryr2Zj1rHCbCR4STD7tDA5dNUpmUFR?=
 =?us-ascii?Q?kAGNmpoBcQzxN4eNbJldWPIomPRULOYWQeklrernpDgz/cmN3MXyhpcSwccP?=
 =?us-ascii?Q?HmQfkWkXOGoqX3Ksxr6/FPOrUXnekiX0EmQBhIJrHWJeLiZtZ5GXdfWVj2fN?=
 =?us-ascii?Q?/7Y4wALi0c2N18oFh//4dwSruN2X4zbV/3Q+WNrvcsDT5OdoDprCcQFj9WGE?=
 =?us-ascii?Q?2r4qf/9fs6hE+5YzrHWE5gk5XUstoeYegcuinF64P/MvAnm64/4Y77vsWtHd?=
 =?us-ascii?Q?Fahx73iX9DL5R445oToPGwVYbE8S0u2iQ3psbO7rvr6iCWMnX1dW/iL0Uyi0?=
 =?us-ascii?Q?EIOLO1dAyKgBu4J8A9CIU2NPGpIj1ihzFS+gnZb1vNJ3OJrRzqS64bLf4O3Z?=
 =?us-ascii?Q?WQ6mog3KHtTSvK48QFdwYfZAqsXbDviTSFDlRXVh3kKADOKYj0jc1yPmpD3u?=
 =?us-ascii?Q?oh9vs/RdfqY0u11C5nqsTYeiyxZgJk1t/3mpjaEvgDe5BHEODHxb0+ktKpqt?=
 =?us-ascii?Q?C+yyDp6ahbJntDYFroCLy71sYc1Qcb22YIjhMKdpTUJeJp94uGIpYhTkM+/G?=
 =?us-ascii?Q?luIbr9pFr6vAeqwXHhsCEkxzy8hM3tjJXOhlFyINKtCrUXsSkIJYIhh07FtN?=
 =?us-ascii?Q?oTefgKg9ZnsoWeBlIvSmEjLx1ORj13MPMU0R0sW9oojs44hJrxwRy38Vg3WC?=
 =?us-ascii?Q?Iaw2ltjSqYPJQTxwKGghy6aOv2K8Wcd50byquYOqWwc8uF2W7GvuSpIUm7x8?=
 =?us-ascii?Q?/EFWtn+UoiFMTzstbUkLEMofoYCG2s2SJgpTwHSSWeJ+6CmYS29RLSfIBBQw?=
 =?us-ascii?Q?aLm2EVB4FyernuNO1Yo83IQILyYJfKiNE+reCL9NXc+lsHxJgZvaC7OgiRz5?=
 =?us-ascii?Q?SLOHXnXh94LeuovR6laQQzOyB8704b6Heuf/GGWepsS9E2/CSMuHQzisH3yw?=
 =?us-ascii?Q?VkctMpsVPB94o2+i9MHYkD5nS+GmX1GC4p39ehlEqTPT6eZFr8YIYvlwnXjl?=
 =?us-ascii?Q?WrZIDNLSR9TUNZXrmBxMAhCyFAauXBNp/6o/H/2Q9bRmlnkCtk7XQrbxc65S?=
 =?us-ascii?Q?mO72ogXOacZ5DnURUgMcFurrMRgFZLgAEpJbfcyCP6zSdKv1pVB6xDSWQ052?=
 =?us-ascii?Q?BIxJNt5OHw1y7qWGGZR0vpHhGTvqRBjrUsRbxJOu1r3cjpJkrwVZDOlZJ32w?=
 =?us-ascii?Q?LzOmM0DqHa+zKXdm/mf+SulgQZW9iPJGO0aKVxxX+byyKt/PsEQWQfCj2X/w?=
 =?us-ascii?Q?o4Dtb8xvkR6vyOUVvRnKmelmmdfuuiGoETmZQ3wXFb4Dw9uISJdZMc/ooUQJ?=
 =?us-ascii?Q?WhWcBGb2wyFsA+h+qNQnIkmmOcwaXwQtSm3xjg2TOmoMig5BMDIPTJDWlspD?=
 =?us-ascii?Q?uOOalH7lqST1LHSt3cYy/OifigilQxgQFZ1LkCq1B1OiVRRf1R300qQInkRe?=
 =?us-ascii?Q?n57CvA4gmfVwI7jQo2y5lhkmjBNhN7eHstasyQUAvGzg1t6E/Aut9/hJxZ6q?=
 =?us-ascii?Q?5An0QykH+R2681FCv8KNiXUxC7uW7wb4fRyGjngj0s+axWSkj7dhPq4GcURY?=
 =?us-ascii?Q?efpxiwFY3b2d+fGHQe3XAiZPkUNK/KgLieZQwW5jFVwfJN35/BLqDJigJQyO?=
 =?us-ascii?Q?Cz9Lk3gmfNYK8I3qlASMCHkDfNsxdLMLLxCs/6X0JKd6sbAp8w7iUlUvYpbT?=
 =?us-ascii?Q?ALdZkIl848SJxA5CsPa+N1orhKP2PH5azF4Zx5kDnfUhnmIl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da8f0135-2191-4659-422d-08df454efe8d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:36:09.2120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Qs3hKTlk6SFo8vTOaggbvUXuRH8K/3gTa61Mvqml7A1b6xS3QnxiQiWSeafltiaMPGhsibjts1OvZqAnQIVxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999319

When coupled control is disabled (i.e., independent control is enabled),
an 802.3ad port can be in COLLECTING state where it is enabled for
collection, but not for distribution. This is useful in deployments that
want to avoid packet loss caused by a port starting to distribute before
its partner starts collecting.

Drivers that offload LAG are not aware of this Rx-only state since the
LAG lower state information only indicates whether the port is enabled
for transmission and the bond does not notify about Rx state changes.
Instead, these drivers enable or disable both collection and
distribution on the port according to its Tx state. As a result, packets
received by a port in COLLECTING state are dropped by the hardware.

In addition, a port that enters COLLECTING state advertises the
Collecting bit in its LACPDUs before offloading drivers are notified
about the Rx state change. The partner can therefore start distributing
packets to the port before collection is enabled, which defeats the
purpose of independent control.

Patch #1 adds an Rx enabled state to the LAG lower state information and
sets it according to the existing Tx enabled state.

Patch #2 sets this state in the bond driver according to the port's Rx
state and notifies about Rx state changes. The team driver keeps setting
it according to the Tx state.

Patch #3 changes mlxsw to enable collection independently of
distribution. Other drivers keep using the Tx enabled state, so their
behavior does not change.

Patch #4 adds a selftest for the Rx notifications (i.e., entering /
leaving COLLECTING state).

Patch #5 masks the Collecting bit in transmitted LACPDUs until the
notification about the Rx state change has been delivered.

Patch #6 adds a selftest for the previous patch.

Ido Schimmel (6):
  net: Add Rx enabled state to LAG lower state information
  bonding: 3ad: Notify Rx state changes
  mlxsw: Enable LAG collector independently of distributor
  selftests: bonding: Test notifications in COLLECTING state
  bonding: 3ad: Advertise Collecting only after collection is enabled
  selftests: bonding: Test that Collecting is advertised after
    notification

 drivers/net/bonding/bond_3ad.c                | 24 ++++-
 drivers/net/bonding/bond_main.c               |  4 +
 .../net/ethernet/mellanox/mlxsw/spectrum.c    | 15 +++
 drivers/net/net_failover.c                    |  1 +
 drivers/net/team/team_core.c                  |  1 +
 include/linux/netdevice.h                     |  3 +-
 include/net/bonding.h                         | 25 ++++-
 .../bonding/bond_lacp_independent_control.sh  | 94 ++++++++++++++++++-
 8 files changed, 159 insertions(+), 8 deletions(-)

-- 
2.56.0

