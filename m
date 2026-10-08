Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013009.outbound.protection.outlook.com [52.101.72.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2218F34C98C;
	Thu,  8 Oct 2026 06:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442016; cv=fail; b=FJJESNvkvXVa8siaDKNee9xmAGEBv+a4DmFj2kyloGF35SzzLWsPY7Csu1rRt43atih6OCTL2G8PZCo7ixB/Go1yIMhxkOf1g8F7whY5eLdxxDIY25H6lNgQBlARF/m8d+qJYofXwAMTS3Jm4nxAdOMcVBnvWEjRhKjpNG7rZeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442016; c=relaxed/simple;
	bh=BXMP0WUq7LxOmPMvcOZxu/Dj1Y3WHptipxAyv7U8zxQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D/NPL+xu+tU0WKciwHhMZoaLefl9obqBKkVmmCER6sBvrbYib6hnaA4ACdqlXvRpHxKCCD5bWrYJdFtT98wZztAEi4YOH1CG5jv8zxcNasslkS//uG5dKM9/bnn5HqUHWxEVRbMqTOBlS7zGcVDtIh3tWv16CV9aQSrY8xtoTAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=Iyg1bkgi; arc=fail smtp.client-ip=52.101.72.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="Iyg1bkgi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJ+RJ+Ncr5dFK1AHThdHgr7nvEk8hNvj7M4jO+ISGm3sVY87T4xKXErmrL74e/LLktO3Wl4vQ8fe4gk+732KcMGkepw8N2iZYzVc131zTiPxfzp4XvpIPiBTcXW5Swpc8kJX1s2S0t7CpxMEIXym2l118Wfg+XchjXMAs/OyyhKcaUi/Ahb82ArRV+lL5MIraw/A6tlcPMJnTWcdf7gisjgLhQl1hL2KgsYUOVm9PDi509E3RWhNZJSAJwI8n7qZo6RtlunQ4YtaKS7ddtDNHE7RvvJkgXfZMK8/6eKYkj2PIaEkN0+3g/Kvrf6d9j8yZpFRckMsC49GcLqewwxETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hujqgP+H3gEbki7DC9SrgJ2FzmUoOXJ8zzxFipCKmgA=;
 b=ssompbw2K+3oLfbp/oy1lydjZxOBCMPCkoWbR1R3y9/dprJZg8Ned25uFpmXGHqlxZaGScZSlu+wGSK4em54j0QhOThYP4P1w9+yRoVXq9PKgUHz+ps3NkTDtt7N2bsUy/Y+EIopJWGSB+1QL58x4CNRz9xc/n4rz+g2dOGR/fi+L6w//fNgKb8+wjLDG+y9TIT7Arpppo1+LjuH7BAfcDhqU1x44oUJ5nRHB5rxUZ/N53U7G4Lm/qXx+tuY0ZqxGkBMNTUSjj6K5XnkKpT5po5RqlZwRQCHk9se7k1R2wDg82Bt9xeB3iQ1C8O43d79W42baoHFUyQWDzlwbR7lEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hujqgP+H3gEbki7DC9SrgJ2FzmUoOXJ8zzxFipCKmgA=;
 b=Iyg1bkgiAWtQDIrxUMhDi7FdGLj3FEDGY+eXnRt0Oglnsx9LHATk022vjaS8Q4ZO7v1l9DDR0fXwhRgdl/BQFp678ov4NPe2Cy/ipmuHR4d7kZscqH2Ac4X+2ryZivCuOIEmXcZM5Wxn9KvN7xJUq/u5ZEoKAa73btfOu5dWWZfWAeRLI7cpP9GaJCNKjVi3EEyK4TLANnflsibs+xeBilBS3Rxyoa7IiRwgNvy7x8EqTXJtX3umUiAr2Ofe3+Zb7zkhP1Vf5hia6OiQ8qRvs6QnyzsfHMjDnQF+HRhjfuue4AA8DVFL6PryI23iA48aJRW2SKvgLStvTYwEYpDGuQ==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by PA3P189MB3366.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4b7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 06:46:50 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 06:46:50 +0000
From: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
To: liushike <liushike123@gmail.com>
CC: "jmaloy@redhat.com" <jmaloy@redhat.com>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: RE: [RFC net-next 1/2] tipc: abort pending connects when the peer
 node is lost
Thread-Topic: [RFC net-next 1/2] tipc: abort pending connects when the peer
 node is lost
Thread-Index: AQHdT96DnkPftA1FAU2pW0pohXPOybbzPzzQ
Date: Thu, 8 Oct 2026 06:46:49 +0000
Message-ID:
 <AM7P189MB113766407E77EB2982690B06C6932@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <20260929064742.576651-1-liushike123@gmail.com>
 <20260929064742.576651-2-liushike123@gmail.com>
In-Reply-To: <20260929064742.576651-2-liushike123@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|PA3P189MB3366:EE_
x-ms-office365-filtering-correlation-id: 18c437ef-c60c-4828-26ab-08df2507ee1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|7416014|376014|4022899009|1800799024|38070700021|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 naN/MdAvcL8ST3aC/BISrE46t5Jj3MeA+ScgybFa+oxDd8+UHe3Dgs/0pEfFHyzsAr7f61gza93ufCD8V6zuFVLqO9+F1WDq241/O2vejEPpTC2uIt86xLoFTv05t0O9Bw3bi+lyhNHFIH7TV7JW1BigsPG3OqyEbR/2fOYwnpWYT1ZbfF+1iO5cjmDmfa61GVLIQ9y/ZRd+O8T+XclnbjKXL9XEOT+H5RhSOxlA9JHzMJBE6vOkp8ARALypsegK2cSHFmN/5l2iEXT25KW8NIwfCUrFIRSUlsiJrFxjCB1oZ/QwgRCNBQqnI7Szm+m9sqTHNF+P6+YNuGHfImOkixi66xZjW4zRRqc4y+1iTdM1DJg6F0ykImW+G8xR8XjY+YCFCREupLsweUvetuzbH1khBO2yQCJm0nHd9lIENurydxgT96Pk9Imr4Ou0diAGJf4nWHNeJOUT7Bq0rXbyfPhgHg3Lh/F1xGkQD2j1nkNBFaXBfpK2hY1uMHiXAlzGLu/AO/sUsHYybATu3Zex+pb184FSE4eCZNLZ3jxC3HP588L/uumOFgeMm88O+BcGWlMTP1bFffvZWtP1APbY+aXJjfZqVLDOhRNAMzFpstTPkcQplzbuiNTON0zlXmcIiv7drjd1xqoGDmqd+eu5XbSt6nSM4gEPAEZqr4uEI6DvtcnuLw/oafSCJ6nuduzC6C6ZmZzZ3lCLSk66PHq51qdHCKRtwftDWpwI6cJ9StM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(4022899009)(1800799024)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0PPkFcjnD0hp6iFlmElFNnWkR6HrGls7FtrdUzF5nXoNzRVqpg89fhJWybb8?=
 =?us-ascii?Q?G5EN1Q8oL+0X5UTV0bPt+j7fOC1Wmq82P6TBnzDmh39MDsbWGE8XW3/XV4PL?=
 =?us-ascii?Q?5wFrhcu115ZEssOJddfCciDmdz7ezQcvqea747I/1HNiLtNnPLq2NdDc1Vqv?=
 =?us-ascii?Q?VlKuhyX56/miLQrGXJh+emUhTtNjqFQdpClE0lwghL4jo0hVSQiriU/Gb3H5?=
 =?us-ascii?Q?Atgv/+qC1SNK+9La85PFfFPsaHsxhMMWtAEv1PZEaGiKjjrLmjoedmJ6X9BC?=
 =?us-ascii?Q?go0WdBJtCR3dcBfnD+6NW0o/tMOPtsFn80qw9FGH2oVeQaCPDtl8ujy4LFPO?=
 =?us-ascii?Q?Q/kBTS4Y9KUxu/WuRUzN58girABkkqT4rrif4WJx9qkFFUR4+CHP8LsbDwIi?=
 =?us-ascii?Q?OAkxbzL65Uh+xTMAEQiMZFRhXp/Iq57dk/rHnyWxud3x2QhlIWOK24D4HlD0?=
 =?us-ascii?Q?GjnWzCVpkBqBdEbt2rp0BQtI64xicvQHlrLEHXVp+PQ68QHS/+5Sg08ckpFj?=
 =?us-ascii?Q?urt7TVVsIzZHGIZQTXyEKsIfMd9XtcKkplMPfUmsMWWGH6koAAzESv5iJue/?=
 =?us-ascii?Q?T+GbLcX09Rij3uplMB/6DLDyfmnNXErlGSB6Bi05COqg7BuJ3LNGacTuRQIG?=
 =?us-ascii?Q?MSd8C4rhwSAq59y7NMNbTh+V0D1Lzd2VG5/5P/GxXdtwFGFYNn7SQ2sSU4/9?=
 =?us-ascii?Q?5T+FLJSxafa1nfup/WR9exg7Bm2sK6s6uEsbzx8Do+87SxJ6UTPXzWeN193C?=
 =?us-ascii?Q?FXxpX5/kmyx05L7lqFjopXDRtrFgxhni7ZG7rICL6TL5PUWS1CNfxeyotbCl?=
 =?us-ascii?Q?Po6BXKE0tHGcstBONcROax44WiAXZ1zvtPOztHmjIo66VYvrwYT7IZGzJXmU?=
 =?us-ascii?Q?vUAJ/UddwkJczoPPHnrdElAsRfI3Ala/ze9PPH35PkQ/RGCnnBoyvyDRDDMH?=
 =?us-ascii?Q?vb+mR9mS1iSk2oLsrqDzglE0GaZRmAe1tEH1GGxVNoCbexQQg8UC/YueqFun?=
 =?us-ascii?Q?TaKyifg4t2b6jqMMZ2e3Z+2ICXDZgamZ9lM4cKFvtMwT1f132JLELTJ6peO6?=
 =?us-ascii?Q?4hZAUTHad11vysrjGbuniXMWBfkI3FGuCBKuozp5fzCywA/RzM5f/FkGV24q?=
 =?us-ascii?Q?SDKSxOSowKOgYePtPeb6vIegsnakdVgO6GS/uFZNQJb1UAk3OP1ItZiO9BV6?=
 =?us-ascii?Q?+CaE0KbjAf5bcwsPsoNZPLZIs/TkwmjoRkc1cqynkVd+t+FfR88OHSRpbKlh?=
 =?us-ascii?Q?5AwJFbz4Bu1tUG7JHkg0BD2BEBtHpboK5V1hURq2kbztyWQW7VZIggY2CPp+?=
 =?us-ascii?Q?a84BzIbnfpFnTyueVHnsC7zV7sZ2QBOVJ+BhtN+2M51byl3Nll9qcfCrjwH6?=
 =?us-ascii?Q?IX8PN7/Q1Rs9HPY399JU7nXOjSClbzwsoZfxZnlrU0amVUGm/kcfUh8qpj1M?=
 =?us-ascii?Q?6jsCdTylTfYB7k0buIKrItwAMH59OA2W4uVasNc9mvIj111uhwtO/+M0yHVH?=
 =?us-ascii?Q?YQ+xGTFYUsoYHO0DDaQsgHiux+qPWdQfa0zuw9561tflCc428Mhjwns3YIol?=
 =?us-ascii?Q?8na2CFPY7pz2SoNXL3aqHvaxYOi758ql+O4qAZYbgtAVzgFcW3sgnXpzB5zW?=
 =?us-ascii?Q?7YTPQkKX7NSDDF6AX42DNPb50RYf/ZeNKzn7H7vUl1nM6wuH0h8i1cxlxE7R?=
 =?us-ascii?Q?F42kBXG9gO3WLdOFVakYNGyW70H+GO3G+tmjcE3FftL1GPrP+tYA+bbmXXM7?=
 =?us-ascii?Q?FzvZp/cFIA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c437ef-c60c-4828-26ab-08df2507ee1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 06:46:49.9674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DOBpRKIJn5rKiiPDUL6JpxupA31B+VMnnF2guA/hZaRU/B8CZOAXPaCSQlkWOhMNOi7tvsyiF0Ln6KTlj3Bso0TmK/Bc4IdeOM25fCw8jbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3366

>Subject: [RFC net-next 1/2] tipc: abort pending connects when the peer nod=
e is
>lost
>
>From: liushike <liushike@ruijie.com.cn>
>
>A client can send a SYN and block in connect() while the listening server =
has
>not yet called accept(). If the last usable link to that server is lost, t=
he client may
>remain asleep until its connection timeout expires.
>Only established connections are in the peer node's conn_sks list, so
>node_lost_contact() cannot notify the pending connection.

Do retrying calling connect() and setting connection timeout to link tolera=
nce (default: 1500 ms) help your use case ?

>
>Register an active open before sending SYN and check node availability und=
er
>the node write lock. Let the existing node-loss notification abort the pen=
ding
>handshake with EHOSTUNREACH and wake the connect waiter.
>Losing one link does not abort the connect while another link survives.
>
>Update the listening port to the accepted port in place on receipt of ACK,
>preserving the node-loss registration. Reject a late ACK if node loss alre=
ady
>removed the registration, even if the node has recovered.
>Transfer the registration when a named SYN is rerouted to another node.
>Avoid registering active opens twice; remove registrations on transmit fai=
lure
>and terminal rejection, but retain them across overload retries and
>connection-wait timeouts, which do not cancel the handshake.
>
>Signed-off-by: liushike <liushike@ruijie.com.cn>
>---
> net/tipc/node.c   | 37 ++++++++++++++++++++++++++++++++++++-
> net/tipc/node.h   |  1 +
> net/tipc/socket.c | 38 +++++++++++++++++++++++++++++++++++---
> 3 files changed, 72 insertions(+), 4 deletions(-)
>
>diff --git a/net/tipc/node.c b/net/tipc/node.c index
>bd91378b7540..31f2ef44ad37 100644
>--- a/net/tipc/node.c
>+++ b/net/tipc/node.c
>@@ -713,13 +713,48 @@ int tipc_node_add_conn(struct net *net, u32 dnode,
>u32 port, u32 peer_port)
> 	conn->peer_port =3D peer_port;
>
> 	tipc_node_write_lock(node);
>-	list_add_tail(&conn->list, &node->conn_sks);
>+	if (node_is_up(node)) {
>+		list_add_tail(&conn->list, &node->conn_sks);
>+	} else {
>+		err =3D -EHOSTUNREACH;
>+		kfree(conn);
>+	}
> 	tipc_node_write_unlock(node);
> exit:
> 	tipc_node_put(node);
> 	return err;
> }
>
>+/* Replace the listening port with the accepted port without losing the
>+ * node loss subscription. A missing entry means node_lost_contact()
>+has
>+ * already aborted this connection attempt, even if the node is up again.
>+ */
>+int tipc_node_update_conn(struct net *net, u32 dnode, u32 port, u32
>+peer_port) {
>+	struct tipc_sock_conn *conn;
>+	struct tipc_node *node;
>+	int err =3D -EHOSTUNREACH;
>+
>+	if (in_own_node(net, dnode))
>+		return 0;
>+
>+	node =3D tipc_node_find(net, dnode);
>+	if (!node)
>+		return err;
>+
>+	tipc_node_write_lock(node);
>+	list_for_each_entry(conn, &node->conn_sks, list) {

Traversing the list of thousands of connections look bad.
Have you tried to measure performance regression when one socket of this no=
de is sending/receiving messages and 4000 thousand other connections are in=
itiated simultaneously ?

>+		if (conn->port !=3D port)
>+			continue;
>+		conn->peer_port =3D peer_port;
>+		err =3D 0;
>+		break;
>+	}
>+	tipc_node_write_unlock(node);
>+	tipc_node_put(node);
>+	return err;
>+}
>+
> void tipc_node_remove_conn(struct net *net, u32 dnode, u32 port)  {
> 	struct tipc_node *node;
>diff --git a/net/tipc/node.h b/net/tipc/node.h index
>154a5bbb0d29..48693a050aa8 100644
>--- a/net/tipc/node.h
>+++ b/net/tipc/node.h
>@@ -107,6 +107,7 @@ void tipc_node_subscribe(struct net *net, struct
>list_head *subscr, u32 addr);  void tipc_node_unsubscribe(struct net *net,
>struct list_head *subscr, u32 addr);  void tipc_node_broadcast(struct net =
*net,
>struct sk_buff *skb, int rc_dests);  int tipc_node_add_conn(struct net *ne=
t, u32
>dnode, u32 port, u32 peer_port);
>+int tipc_node_update_conn(struct net *net, u32 dnode, u32 port, u32
>+peer_port);
> void tipc_node_remove_conn(struct net *net, u32 dnode, u32 port);  int
>tipc_node_get_mtu(struct net *net, u32 addr, u32 sel, bool connected);  bo=
ol
>tipc_node_is_up(struct net *net, u32 addr); diff --git a/net/tipc/socket.c
>b/net/tipc/socket.c index d5d70eb230b5..191579636351 100644
>--- a/net/tipc/socket.c
>+++ b/net/tipc/socket.c
>@@ -1511,6 +1511,16 @@ static int __tipc_sendmsg(struct socket *sock, stru=
ct
>msghdr *m, size_t dlen)
> 		return -ENOMEM;
> 	}
>
>+	/* Subscribe before sending SYN so node loss also aborts pending
>connects. */
>+	if (syn) {
>+		rc =3D tipc_node_add_conn(net, skaddr.node, tsk->portid,
>skaddr.ref);
>+		if (rc) {
>+			__skb_queue_purge(&pkts);
>+			__skb_queue_purge(&sk->sk_write_queue);
>+			return rc;
>+		}
>+	}
>+
> 	/* Send message */
> 	trace_tipc_sk_sendmsg(sk, skb_peek(&pkts), TIPC_DUMP_SK_SNDQ, "
>");
> 	rc =3D tipc_node_xmit(net, &pkts, skaddr.node, tsk->portid); @@ -1520,6
>+1530,11 @@ static int __tipc_sendmsg(struct socket *sock, struct msghdr *=
m,
>size_t dlen)
> 		rc =3D 0;
> 	}
>
>+	if (unlikely(syn && rc)) {
>+		tipc_node_remove_conn(net, skaddr.node, tsk->portid);
>+		__skb_queue_purge(&sk->sk_write_queue);
>+	}
>+
> 	if (unlikely(syn && !rc)) {
> 		tipc_set_sk_state(sk, TIPC_CONNECTING);
> 		if (dlen && timeout) {
>@@ -1674,8 +1689,10 @@ static void tipc_sk_finish_conn(struct tipc_sock
>*tsk, u32 peer_port,
> 	msg_set_hdr_sz(msg, SHORT_H_SIZE);
>
> 	sk_reset_timer(sk, &sk->sk_timer, jiffies + CONN_PROBING_INTV);
>+	/* Active opens already subscribed before sending SYN. */
>+	if (sk->sk_state !=3D TIPC_CONNECTING)
>+		tipc_node_add_conn(net, peer_node, tsk->portid, peer_port);
> 	tipc_set_sk_state(sk, TIPC_ESTABLISHED);
>-	tipc_node_add_conn(net, peer_node, tsk->portid, peer_port);
> 	tsk->max_pkt =3D tipc_node_get_mtu(net, peer_node, tsk->portid, true);
> 	tsk->peer_caps =3D tipc_node_get_capabilities(net, peer_node);
> 	tsk_set_nagle(tsk);
>@@ -2199,12 +2216,14 @@ static bool tipc_sk_filter_connect(struct tipc_soc=
k
>*tsk, struct sk_buff *skb,
> 	struct net *net =3D sock_net(sk);
> 	struct tipc_msg *hdr =3D buf_msg(skb);
> 	bool con_msg =3D msg_connected(hdr);
>+	bool reject_ack =3D false;
> 	u32 pport =3D tsk_peer_port(tsk);
> 	u32 pnode =3D tsk_peer_node(tsk);
> 	u32 oport =3D msg_origport(hdr);
> 	u32 onode =3D msg_orignode(hdr);
> 	int err =3D msg_errcode(hdr);
> 	unsigned long delay;
>+	int rc;
>
> 	if (unlikely(msg_mcast(hdr)))
> 		return false;
>@@ -2216,6 +2235,18 @@ static bool tipc_sk_filter_connect(struct tipc_sock
>*tsk, struct sk_buff *skb,
> 		if (likely(con_msg)) {
> 			if (err)
> 				break;
>+			rc =3D tipc_node_update_conn(net, pnode, tsk->portid,
>oport);
>+			/* A named SYN may have been rerouted to another
>node. */
>+			if (!rc && onode !=3D pnode) {
>+				tipc_node_remove_conn(net, pnode, tsk-
>>portid);
>+				rc =3D tipc_node_add_conn(net, onode, tsk-
>>portid, oport);
>+			}
>+			if (rc) {
>+				err =3D TIPC_ERR_NO_NODE;
>+				/* Return a late ACK to its sender, including any
>data. */
>+				reject_ack =3D true;
>+				break;
>+			}
> 			tipc_sk_finish_conn(tsk, oport, onode);
> 			msg_set_importance(&tsk->phdr,
>msg_importance(hdr));
> 			/* ACK+ message with data is added to receive queue
>*/ @@ -2285,9 +2316,10 @@ static bool tipc_sk_filter_connect(struct
>tipc_sock *tsk, struct sk_buff *skb,
> 	}
> 	/* Abort connection setup attempt */
> 	tipc_set_sk_state(sk, TIPC_DISCONNECTING);
>-	sk->sk_err =3D ECONNREFUSED;
>+	tipc_node_remove_conn(net, pnode, tsk->portid);
>+	sk->sk_err =3D err =3D=3D TIPC_ERR_NO_NODE ? EHOSTUNREACH :
>ECONNREFUSED;
> 	sk->sk_state_change(sk);
>-	return true;
>+	return !reject_ack;
> }
>
> /**
>--
>2.34.1

