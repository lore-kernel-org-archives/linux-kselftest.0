Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991018;
	b=Ty54D386+CsIMV7yq31qT/S5KUaVcLUnds1srQ/HGpXmd9mSjzl8SZImRPBFC9Ym4Ie2
	 fqdvO20mjcoDzw0Q6kxI9qfKfa1GJg6cmiLAMQDXZGKW/grhOigI52reFPgeq/RfgLln5
	 X2GOlSiSFO8Mol0Eb+QzXdBtx8To+wCbBoAxrnY5mVC35FweycAmk3g3L+j9pXurXlPxP
	 8NxzWdgh/R8E2I+5JI2jBfPbqxGnUUL4RE5JafbgCjfr7yR47ED5TVGCliFw70joCDsu1
	 cYKU/UlKDmyPxynXMj/A9/BjTTJsUzpUfFQf585Gk64xuo8n0qhAqfKMb3wND3NSo9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991018;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
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
	bh=nCye3MR8GkO8uJ7h69XCoW0SdbvWlZK/fb8UOpy9tJM=;
	b=nWIpPquanAnTgzGnnBPxwrkS9JddPwV/oQjspqJGw3hq2Io6gxmxbXIVwUjXBCQ3aUZm
	 paYBbc6dgKBuihvSCVXziUWpXNCBmGAeMbt9k1QUOhHPddpn8HIbpgCV+ntk+Gn3ousgt
	 e27jRKLzagwQpHxcjpgU5k3nQZAk1Xac4NJzGRXTMiI+btiqoj9SwLxsEUTBFdJGrv6hD
	 dxchLyOZxQ9Cja5whSCQlfgn1oeKQABj5OspPiyDmpwWg1zo3mBePtgcvXctgx2fD151l
	 JGzWt+U8AbzLS1HZrZuj+RKSmTiYde/DTpXDP9FpZ7FzupidDCgQ94QGM6hClgSPieQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WjvIDFaU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B12606A89B;
	Wed, 18 Nov 2026 08:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0B12606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WjvIDFaU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gS3a1I4bSMNLZ1kC6PkMthrRlSJdhdmm1Z1YYg1BfvUyZbqAa3bHyxmX6Pfk8U6NNQwQHHVfr1UtW7ZsfOR5xdOnxhpm1P+Ey+hfGCdzYPmOwP2BeBKNbO8m6dFKXSqOqt52Ndg03I9OImXymg+sYW6DcxqQmoSPcMDyCd2KpJC/xkN9WpxkyI07lkrh4gz5ltARiABDPhtK6LT76+peOyYP55bv4k9BDM22HSjH3QJUMi6VFboRbG4kZA0j224AjYjXDz3f46Ng8HS+/2AYqTFhMuTTmlDtZujyyJeqd4xnqffalA/I/WdHL2UVsWmvqtSUcyklrqVrnsDlwnenwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCye3MR8GkO8uJ7h69XCoW0SdbvWlZK/fb8UOpy9tJM=;
 b=PvsFf6xXrdZEc8REDoJu/0IV7oN6KqKN9+XeULe9kmvpnlewd/STYH/PPZimNgcgolicSZXYNo9kRCOJI00Zi0/rYs3pc2lc+w0UPsEiAYnMvMDVtvnv9QKh+Ca/FYBnBlGGyxSgIO/Pl4cyQ+0ibn5AWupT/1AHueJau7el+iI+70MmSJGnATBMwY3F5UzDQKCSnsSaM8h6dynjIgfRGZ4qPD7XBvAdpGw+rD93iBv09Y1EA7U3c3lS3MZJVY3iHBuCic+5wtSdGTrAAjpNvPW5RGo4wyTNe22Z5gzC1Dyb75I8q4eyOmZc4a8bya1WbyK/rMMwUTRPy5YbFgjW6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCye3MR8GkO8uJ7h69XCoW0SdbvWlZK/fb8UOpy9tJM=;
 b=WjvIDFaUiwXaK0AAZppMXj69x0iGnaZr8lt2SD+8G+Eu1KtN2tTSftz8vN9XrYn8vQpoIsZkbFPchZDivdfwmQVxt1LEiRG3YwKLpgpclCH5TTFq7c/WYCECwaAQPOla4wW5VrrzJTAQoMyEr9heWfSWQbz8z/9ChoSGLLr7v7if3oGFfzEX2ZyRlCxf0nA7mvTN0DvbgrS77WJ3qG6qFnfWZ9s5e5Q9+Sd58PAYBVHxSduu73sxNTKC/KqeDhCzznRADzojpXRANamP4TUIKuaTTVVRozWV4V5bO8ZjDqweBxUBs+P1dvkB2ggYWPZsX1DkTcW8SsNay+b9trNRow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by PH8PR12MB999319.namprd12.prod.outlook.com (2603:10b6:510:40f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:36:45 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Wed, 18 Nov 2026
 08:36:44 +0000
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
Subject: [PATCH net-next 4/6] selftests: bonding: Test notifications in COLLECTING state
Date: Wed, 18 Nov 2026 10:34:40 +0200
Message-ID: <20261118083442.1061289-5-idosch@nvidia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118083442.1061289-1-idosch@nvidia.com>
References: <20261118083442.1061289-1-idosch@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::20) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 1a048b68-144e-472d-ede6-08df454f13cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|6133799003|22082099003|18002099003|3023799007|261009223027099003|56012099006|261026140227099003|11063799006|261102123227099003|261028144727099003|261021123027099003|261026121527099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	lauzShMHFcUVSP9HXVCRHhVaZUgNAqjaqr3aM+RqIKd+D0CHWDJtqcD//6sJke8QqSAQgiHB6pUUQH2Jd4mMWLineu92eNs0jBCAcuAQzx73Y4KMBxbS1R7yK4MdFxlfmwMKeDeb4d5Q6YiriVGixOdsVoOCDCAmc6uTMyl/ZYZg7K2s6XpQzUke2LYaJrwUBAIf0DZQPUAPXQ8BnfSF+G7ZhNqSeTnmPZr6xEvn0TXNnSI+kK2rVhOk0xhXQsxSL7hVKgyKoKUeXJKp5pdphClIKj01Sq56Lgjb9sIMm/bG8Wg0gwYh4SjWNs18OlyQBTHPUWFzzQLG1JOTm+BPWFiwZP8kRXIi7KLi5hC3cJQkVD+Zu6bdBZAiubTuXWBYeBswPmhjDVOraE9IJ60izSQG56bZJKSYJ7XErJVIxeoMI//dxl6SDpDWUajvVOFtxSiEewA7tKJbP2ZdQYNbrhhqYa+hkyW39C72mr4eXEieJ61l2pl966nLv6YWDKikOb6mbTZ1yaIyhuJ1ZocK8683r+zc1jJjpCS4m7lc6oVMhlVcWekU2++6G0/PX5JBS7gIawIoVoIRIG6HheFIPqAy+zwifGeuhGXQ3vqQqR9UoXUYstkBT1NzhWfdxBZFcTROhkG1+QTGC8ivvW/0wCieJmv2u/Ooa14RW5H5h7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(6133799003)(22082099003)(18002099003)(3023799007)(261009223027099003)(56012099006)(261026140227099003)(11063799006)(261102123227099003)(261028144727099003)(261021123027099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PxBScqASQx/7yifL8JbuWIGPf1q18R7halTCHiUxVU3ODEw2kJ6+x2mVe3pP?=
 =?us-ascii?Q?VwRaX77jDTJ2oqSZ1AW5EJ4uT/RtKzDDSYlo2bX7O55NkfWMJ2HnylCPsxXA?=
 =?us-ascii?Q?gfectG187DEaFMa05L0DVHUrXHBuS3NvEqmn7BY/hi9kp2eKQPjR1t36d5L9?=
 =?us-ascii?Q?QZT8tZXTiOnpUF6aCyLmGMap3RTYdXKpmuqXzFnbZgMplbRdu845RallYTha?=
 =?us-ascii?Q?IPoSVEZLuRFRcsbKCQbXzEwI6UKktLt1Aeo46TDYYoSXIbH/2UwVL9wtfPCn?=
 =?us-ascii?Q?usmLq8zZAia5RG8qWGF/HNR1hdr0Fdp76WRThcC8M/4Uz8JfAQuhqV6RWOdr?=
 =?us-ascii?Q?G32ST0orTCx9gqrEV6Y8ZUq1eHkmhZTZrfil8gzJccsz+7ckVjZJObrz1BhG?=
 =?us-ascii?Q?os8vQ43S+8orAkkXEP5An6pZbkaAppvQn1ZKXC9zOlKNdEXTViJHYP7+wPj+?=
 =?us-ascii?Q?ry8itvozxYcIcK8VBlEFSfrLWcBMnbMpLkMcpJrBF0/NBb9d1t1C+wCyVU3y?=
 =?us-ascii?Q?K5U+a7CxvgiEOwAdU8VDRlSnWOp/HbNfGh9Tjzdgts+eKnRWB4rU2PIIdcrB?=
 =?us-ascii?Q?LWeRhkwV74SSLTSlFvsLNpkhToM3r+j4er5dmUqwkzwbuxdhBGfnrdf3PuND?=
 =?us-ascii?Q?xcIoaiHotWkwo5hHyldi/Qd8Hq9qD0iaN+shj/n8vxLv1PmmAw84fJcP3xXA?=
 =?us-ascii?Q?W+0fuUPrAXcl6WcOlMhJcsMa3TRypr0lqb28D3GKvDIKTMXpjCa+szHJHCCG?=
 =?us-ascii?Q?R+eplVs+fTac75NlCPqUpn86/eQvfjEof8aJs6penOR5KChYI+GEX6B4QWKv?=
 =?us-ascii?Q?BONcsy3ROCd6FRrA8Ns5ZO5MM/Hvvg6ZlSw/8yZ1EUcq4e9al2YhSe0WUM5H?=
 =?us-ascii?Q?spm8eS3NY8JQ2S/uf93zhXqXvfkaJgZEFefmjd/sIVLYf/hon5KUH9FA/YU5?=
 =?us-ascii?Q?r3GVEY4hOTNfYxSPz6wdgcBLibuSUvJht5iIJKdkXf3/sDyyPfve6hxtAZvA?=
 =?us-ascii?Q?IG+3L3jLtpIsd1o359LC28X/A1iK12QaBW0weWpo9ChcUbo73ikEUpjjq9RH?=
 =?us-ascii?Q?X5QDT27/RxgGymXaZnb3YuaICvqLQ/Y1XmdtZDRyv4uTfJd5gg1wEMt/Q99+?=
 =?us-ascii?Q?OMen2iZtvlyBFAOEjStZXimOPVUOSqgCzh53B73/bu8fhNX7D0eRIPzrenDx?=
 =?us-ascii?Q?3Fkrqowp+JkozbyyTWRGNYwbpCJEdb0jEte1SvILx8uxJlma1S8LvUNWRZjF?=
 =?us-ascii?Q?Ko2luDNel7QpucVGQXDD3b3Oqr0pN70X8/0KKWA2B6XpVlEZgQBEjd6IW/nU?=
 =?us-ascii?Q?Rvp6tXKnSpjl5yxoIiKOWNld0MZukrcdedurJYqGhi0kYeqC0X7OQ8jwU+3a?=
 =?us-ascii?Q?WyxCw42KJZjsnTY9DD9VkrNNP3uUy92FZAYJOBFTt/iGj4QB2O8Nz30X7or/?=
 =?us-ascii?Q?/dLKrnVpOS1A3md+/JcaNcwphaZ0IM/LBFUYRGguCYB5EehhB8XaDaIfMMIk?=
 =?us-ascii?Q?ZUzyoKxjDbuan7hq5Ry7BEm4YjW0opvwmCURqbvbjmQRJ3THMnWM01c4RDao?=
 =?us-ascii?Q?5BOnMBqoym5hYyCXHWNCRNiqJuCXF2ZbX4wf5WBl/isIScidF8ZacqDw/Hq6?=
 =?us-ascii?Q?qgsWGf0z/aNYSIHLqdxK9HuQ6fYuajbjRnPJ7NhpZJxDtMjGEOoyXgav9iUs?=
 =?us-ascii?Q?QKJ0YK4CYZ07lAruKsJU8RkCWBr1Mj4osbpM5zkW32FurHQ/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a048b68-144e-472d-ede6-08df454f13cd
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:36:44.8657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WISql/NGyCLOY3qMFLud0exaq8FxaCyXnyh10WnJAtaENi42OV/Hw9mir0dU21mKK3evR20NFHP5PsAJE+DZLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999319

Test that with coupled control disabled, a notification is emitted when
a port enters or leaves COLLECTING state.

Output without "bonding: 3ad: Notify Rx state changes":

 # ./bond_lacp_independent_control.sh
 TEST: Receive in COLLECTING state                                   [ OK ]
 TEST: Notifications in COLLECTING state                             [FAIL]
         No notification upon entering COLLECTING state
 TEST: Ping in DISTRIBUTING state                                    [ OK ]

Output with the fix:

 # ./bond_lacp_independent_control.sh
 TEST: Receive in COLLECTING state                                   [ OK ]
 TEST: Notifications in COLLECTING state                             [ OK ]
 TEST: Ping in DISTRIBUTING state                                    [ OK ]

Reviewed-by: Petr Machata <petrm@nvidia.com>
Signed-off-by: Ido Schimmel <idosch@nvidia.com>
---
 .../bonding/bond_lacp_independent_control.sh  | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh b/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh
index c29712e01e49..a2b83b581e40 100755
--- a/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh
+++ b/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh
@@ -15,6 +15,7 @@
 # shellcheck disable=SC2034,SC2329
 ALL_TESTS="
 	collecting
+	collecting_notify
 	distributing
 "
 NUM_NETIFS=2
@@ -121,6 +122,46 @@ collecting()
 	log_test "Receive in COLLECTING state"
 }
 
+collecting_notify()
+{
+	local tmp_file
+
+	RET=0
+
+	partner_state_clear 0x18
+	defer tc filter del dev "$h1" ingress pref 1 handle 101 flower
+	lacp_state_wait "$h1" 0x0f
+	check_err $? "Port did not reach ATTACHED state"
+
+	tmp_file=$(mktemp)
+	defer rm "$tmp_file"
+	ip -d monitor link dev "$h1" >> "$tmp_file" &
+	defer kill_process $!
+	sleep 1
+
+	partner_state_clear 0x10
+	lacp_state_wait "$h1" 0x1f
+	check_err $? "Port did not reach COLLECTING state"
+
+	slowwait "$WAIT_TIMEOUT" grep -qw \
+		"ad_actor_oper_port_state $((0x1f))" "$tmp_file"
+	check_err $? "No notification upon entering COLLECTING state"
+
+	# Discard previous notifications so that only a notification upon
+	# leaving COLLECTING state can match below. The monitor appends to
+	# the file, so truncating it is safe.
+	: > "$tmp_file"
+	partner_state_clear 0x18
+	lacp_state_wait "$h1" 0x0f
+	check_err $? "Port did not reach ATTACHED state"
+
+	slowwait "$WAIT_TIMEOUT" grep -qw \
+		"ad_actor_oper_port_state $((0x0f))" "$tmp_file"
+	check_err $? "No notification upon leaving COLLECTING state"
+
+	log_test "Notifications in COLLECTING state"
+}
+
 distributing()
 {
 	RET=0
-- 
2.56.0

