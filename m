Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032019;
	b=dnFiWbgdB0oH38oN0HvOpdiJWiQ2d/p8SOCGENrCyOPXeEQHO7dWD+7k4c3uGYTeBfKO
	 x4XDoUUI9HBlGO19hG6KTtCehZb0vEXGE2it2EsF0nLLGF4YIwgY1ew/WKlTicGrNDjPf
	 ZO6KYBP3jJPAT+Gf4sLjqDiP/941RrjEB+C2mBr+WmwK0O8hMA1ROC+/8i5sACWZzmAnu
	 AQUq2TVzTeVf4TQ9kWQH92BItH+kNgjyDwYHRow4qH/lGt36mrwzcvOPOiXwg+rAjqb27
	 YR6kDEtSW+Gy3/7Ijx4s6q6xuI761v2BqPl0CvXE3Xtug6huKe0vJEshoXnA7BtiFIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032019;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Received:Received:From:To:cc:Subject:In-reply-to:References:
	 Comments:X-Mailer:MIME-Version:Content-Type:Content-ID:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=uwQjVevS7ypUzAk+icCG/wDpPHxYCJM9s9guXw/jSqM=;
	b=srRT3Fucbe1LMD3D9U/mInrDnkm9KgNP0pu5sMsGkVKD8OAGVv+sGKpZiGLOScfBipgU
	 TQyG60QH0Vn4y+i7Jd8ahC27LnBgKWM0cYO7M8DrMvG6xiAnT375sLE9o9UuU4tf8hg7T
	 VipDBSplW74Hhn4+aIw1OFZ4Yo916mqbikh94EcFKs+38N5w82M4LOUhs+Jdyn5P/KjyW
	 lX8niIaD90G80u8H/m6ubk5rr7jjO0HxsvRKh2tXGQhfbwdGLA+YBkIv6uV4omVpDOSAh
	 SigMiHXqhGIiI+/gXV5reiKrG1zGVFic7nqMCXRjSIaxPTCtlqwg9pVjNHX6HhSE6BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jvosburgh.net;
	spf=pass smtp.mailfrom=jvosburgh.net;
	dkim=pass header.d=jvosburgh.net header.i=@jvosburgh.net header.a=rsa-sha256 header.s=fm1 header.b=VpfQTP4G;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jYld2ujA;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AE1606A325
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 20:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85AE1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jvosburgh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jvosburgh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jvosburgh.net header.i=@jvosburgh.net header.a=rsa-sha256 header.s=fm1 header.b=VpfQTP4G;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jYld2ujA
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id A8009EC061E
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 15:00:17 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 18 Nov 2026 15:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jvosburgh.net;
	 h=cc:cc:content-id:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1795032017; x=1795118417; bh=uwQjVevS7ypUzAk+icCG/
	wDpPHxYCJM9s9guXw/jSqM=; b=VpfQTP4GhDVUtUrWwlumlVCdJvqqp3/fkh5YV
	t2VDoEMzhB/XTKtuH1BTKD0qiU6yBV1F8qbgZRcRebprGOB1JrRXNsUzJzFHlpOo
	cri9JI2wUE0vLBzo8X5r/4t/Kr58fgInSYWKxBxWap8CJyN3DZjBkasYnLEjXiad
	ktYqjqrgd+J1yXZ0c6awyP24rodUxj+qpPk53lgEQgPJfoI45jv8U3gfoVLDY6x4
	VvsCBjGCUxxs/IHwbn/MvDDe86CWmJDzVwSWBX9jzWJmItfYHDmME7gN4gWbbCao
	34lO/FD2ee4KmPhY1qwpwNx8b4n5IRUbMqfssJTfg//TRREFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-id
	:content-transfer-encoding:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795032017; x=1795118417; bh=uwQjVevS7ypUzAk+icCG/wDpPHxYCJM9s9g
	uXw/jSqM=; b=jYld2ujAimYOOwXgXCWVr1LbohS+4uDLPVfnlzGsm2xwNtYgslk
	k5F0NUUq1plwU44k1irsfWy921VoRgYsxdfrINQqfSxBfB5UGkK9LO31rurEzBeT
	grWKIKZBbMBinuY2pHYqpr+rGSUY7UxSkdSKqhF3iQ7pnti0xwEusi47WbdwvucT
	57c22kaU2IYnu+oG6KE6VfoNAAPyD9B/B3FaVSTvdBvzNjKxg/U7aKkv6gRbq/dC
	KW2PceWX5Bzk9Y+VbcDVdLsoaSSlKUpAmJp4+5Su2vwGYz2n151Q2ECPnGRSq6XE
	4AmSMaXSYAPds13NMeOcv7WHhHIRX5Fis2g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jvosburgh.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795032017; d=jvosburgh.net;
	mf=PGp2QGp2b3NidXJnaC5uZXQ+;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:fY4Dq1VxY/9YxaYwaLxluK7jfX4w1Tx/nJ2dwpZsaajVewX
	O4BmDztPBWLKy5OqE5ZIkaBMle8+lFtFJ9mG5i0IornHH1vuJoLraUxMvf+xbl8j
	99ph3GPLfGCeEf/jX7mvCsQpKbFWHvXTXOY8DxSMWWsG0zWThWfleGq0g3h4Bvrt
	GqV6rSFF3OH3t7VWKGsKm9Zh93sWHTEksGb45KQLrT+pjpkVZiivwQR3b4GsI3SQ
	XNC/OqRhZ+OY4qhkLmOD0yBAq4lVkwYM8umS5HakBkkx+vHNgKI5LnTtLOj6z9vz
	9Yc2RusZP2IsuMJByIDLMYNWtu8NOaGoUKaZQjA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,comments,content-id,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:YhKRUebqjz3ktFKRA2uMUovVMc4asEx48MnkBoTg+SY=:wlZPZjocK2+Nq9JBWT8t1K9blKGREuup8JHhz9Z2QRQ=;
X-ME-Sender: <xms:0QP-ago_aqL-liuYTVcYEWsD5Ki8gkuZpKU6ZuPYvfk1VZY3nSpdOw>
    <xme:0QP-ar0amJXmVIDEquX6PW9bdhzI6GIM01Is_iXooGbGtXrE8TMshpfIPFe9-VaXw
    sS0e4RFFAyqa3zWzX1PGZkZLHYoH8Eh1SguvhxoSli7uEKu35UuHPQ>
X-ME-Received: <xmr:0QP-aom4bwWjSQIaf3mKfi1CkIpgwQVffTodwanlaeqFoW9Lzyd1reSfNA_WvfxomLGLiQ>
X-ME-Proxy-Cause: dmFkZTEqS41sTlVjtI3r6T04nwWyb3/DhMZwcnDmSzzdRfoJ+KnwpjwuMAP3OywXM3H0xP
    xLXX9YKjo34ES5tYkzU0Ii9z3/Mztr5svEBxoWsUTdhB+gFaq9i+QvHqSB5fMj2uC9Kb4i
    ugF+96B9u1TIT4nekvZT1j2yUAleCc1jGQkMs1l3IFvbB4F03tv4Z7EHbmkSOcvNRKM4Iq
    pj6sB7yAzeKrPM4sBbyd3j9PbwsEhsje64U41bGn5L9mYmbaLsYJOCi237U5Dtqsmd2X5z
    7KConoIUbZNwLTGrTTRNM1jtfw1kg+mxd++ZMhmx7AGPinid643Mxx8HC1T/YVsvQqPAOM
    kRqixHZ9wqQgpvgsnxheh+cdA7c8YJnrErEBhnGuC2tljChufDZFShzBIt2MeeZ9eCVvO1
    lLl5tyXr6G4fCymQGIC7egtkmYU7hJBwasNi3BEIM8P1psLRh5AEq+k/UfjyE48gh3msXA
    blXgcBo8nQYOJroyD8R/PNYL4sOD/NhmMNK4pdVthRt/WP80JjuFm1oazooR0n8ch3mIAk
    EeVBOC4YDuae7aPR5G5nKeP5kwhAOFoj1zWezQounMuX0EK17gD43L3P25HfoypSLYu9kn
    8zNKKcwvJDCuC+fwEteEx0hXSoXXwwjOM2W5itvZlRJBw6+Qg/q+UbU2J8Yw
X-ME-Proxy: <xmx:0QP-anbnxjq4Fe7Wlaiqe5YKaq7_kAxBJYmAQPppEhgVlROWoIoh4g>
    <xmx:0QP-aq8k6FHrXdZs5WdZWlDdMSa1Y2BtFTb4Ba1xLK7cl3MxRCOhbw>
    <xmx:0QP-anFYAUX3vKMGuhpFVNrQTI3x5S71SuDGlDa5lkr9gQRzogsW9g>
    <xmx:0QP-ake_718dmQAMZONR1zHkWkktZv4xg9PKWKZaGFwXL3U_xyiMWg>
    <xmx:0QP-au1_2680ZFon8-my_S4qWWD2M2Hnz6zCUC4CopE9HmSdVZjgTwne>
Feedback-ID: i53714940:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 15:00:16 -0500 (EST)
Received: by famine.localdomain (Postfix, from userid 1000)
	id B6C179FC91; Wed, 18 Nov 2026 12:00:15 -0800 (PST)
Received: from famine (localhost [127.0.0.1])
	by famine.localdomain (Postfix) with ESMTP id B55679FC4C;
	Wed, 18 Nov 2026 12:00:15 -0800 (PST)
From: Jay Vosburgh <jv@jvosburgh.net>
To: Ido Schimmel <idosch@nvidia.com>
cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
    pabeni@redhat.com, edumazet@kernel.org, andrew+netdev@lunn.ch,
    petrm@nvidia.com, sridhar.samudrala@intel.com, jiri@resnulli.us,
    horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
    razor@blackwall.org
Subject: Re: [PATCH net-next 2/6] bonding: 3ad: Notify Rx state changes
In-reply-to: <20261118083442.1061289-3-idosch@nvidia.com>
References: <20261118083442.1061289-1-idosch@nvidia.com>
 <20261118083442.1061289-3-idosch@nvidia.com>
Comments: In-reply-to Ido Schimmel <idosch@nvidia.com>
   message dated "Wed, 18 Nov 2026 10:34:38 +0200."
X-Mailer: MH-E 8.6+git; nmh 1.8+dev; Emacs 29.3
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <528756.1795032015.1@famine>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:00:15 -0800
Message-ID: <528757.1795032015@famine>

Ido Schimmel <idosch@nvidia.com> wrote:

>When coupled control is disabled, a port in COLLECTING state is enabled
>for collection, but not for distribution. However, drivers that offload
>LAG are not notified when a port enters or leaves this state since the
>bond only notifies them when the port's 'backup' flag changes.
>
>Fix by setting 'rx_enabled' in the LAG lower state information according
>to the slave's 'rx_disabled' flag in 802.3ad mode and by notifying when
>this flag changes. Track pending notifications using a separate bit
>since 'should_notify' is toggled when the 'backup' flag changes.
>
>Reviewed-by: Petr Machata <petrm@nvidia.com>
>Signed-off-by: Ido Schimmel <idosch@nvidia.com>
>---
>
>Notes:
>    Known issues that this patch does not address:
>    =

>    1. The new 'should_notify_rx' bit shares a bitfield with other slave
>       flags. The 802.3ad state machine writes them under the mode lock, =
while
>       a few other paths (e.g., the 'all_slaves_active' handler) write th=
em
>       under RTNL only. This is not new.
>    =

>    2. When a port is disabled with BOND_SLAVE_NOTIFY_NOW, two notificati=
ons
>       are sent: one after the Tx state change and one after the Rx state
>       change. This is harmless.

	How do we know this is harmless?  Isn't this a change of
behavior that's visible to user space?

	-J

> drivers/net/bonding/bond_3ad.c  |  2 +-
> drivers/net/bonding/bond_main.c |  5 ++++-
> include/net/bonding.h           | 25 +++++++++++++++++++++----
> 3 files changed, 26 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/net/bonding/bond_3ad.c b/drivers/net/bonding/bond_3a=
d.c
>index d91533b80996..d2a55f4d8979 100644
>--- a/drivers/net/bonding/bond_3ad.c
>+++ b/drivers/net/bonding/bond_3ad.c
>@@ -2608,7 +2608,7 @@ void bond_3ad_state_machine_handler(struct work_str=
uct *work)
> =

> re_arm:
> 	bond_for_each_slave_rcu(bond, slave, iter) {
>-		if (slave->should_notify) {
>+		if (slave->should_notify || slave->should_notify_rx) {
> 			should_notify_rtnl =3D BOND_SLAVE_NOTIFY_NOW;
> 			break;
> 		}
>diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_m=
ain.c
>index 7eb3ff82ec96..4ba1f5c33251 100644
>--- a/drivers/net/bonding/bond_main.c
>+++ b/drivers/net/bonding/bond_main.c
>@@ -1831,7 +1831,10 @@ void bond_lower_state_changed(struct slave *slave)
> 	info.link_up =3D slave->link =3D=3D BOND_LINK_UP ||
> 		       slave->link =3D=3D BOND_LINK_FAIL;
> 	info.tx_enabled =3D bond_is_active_slave(slave);
>-	info.rx_enabled =3D info.tx_enabled;
>+	if (BOND_MODE(slave->bond) =3D=3D BOND_MODE_8023AD)
>+		info.rx_enabled =3D !bond_is_slave_rx_disabled(slave);
>+	else
>+		info.rx_enabled =3D info.tx_enabled;
> 	netdev_lower_state_changed(slave->dev, &info);
> }
> =

>diff --git a/include/net/bonding.h b/include/net/bonding.h
>index cb89aff437f4..5980df71a358 100644
>--- a/include/net/bonding.h
>+++ b/include/net/bonding.h
>@@ -170,6 +170,7 @@ struct slave {
> 	       inactive:1, /* indicates inactive slave */
> 	       rx_disabled:1, /* indicates whether slave's Rx is disabled */
> 	       should_notify:1, /* indicates whether the state changed */
>+	       should_notify_rx:1, /* indicates whether the Rx state changed */
> 	       should_notify_link:1; /* indicates whether the link changed */
> 	u8     duplex;
> 	u32    original_mtu;
>@@ -399,6 +400,21 @@ static inline void bond_set_slave_state(struct slave=
 *slave,
> 	}
> }
> =

>+static inline void bond_set_slave_rx_disabled(struct slave *slave,
>+					      bool rx_disabled, bool notify)
>+{
>+	if (slave->rx_disabled =3D=3D rx_disabled)
>+		return;
>+
>+	slave->rx_disabled =3D rx_disabled;
>+	if (notify) {
>+		bond_lower_state_changed(slave);
>+		slave->should_notify_rx =3D 0;
>+	} else {
>+		slave->should_notify_rx =3D 1;
>+	}
>+}
>+
> static inline void bond_slave_state_change(struct bonding *bond)
> {
> 	struct list_head *iter;
>@@ -418,9 +434,10 @@ static inline void bond_slave_state_notify(struct bo=
nding *bond)
> 	struct slave *tmp;
> =

> 	bond_for_each_slave(bond, tmp, iter) {
>-		if (tmp->should_notify) {
>+		if (tmp->should_notify || tmp->should_notify_rx) {
> 			bond_lower_state_changed(tmp);
> 			tmp->should_notify =3D 0;
>+			tmp->should_notify_rx =3D 0;
> 		}
> 	}
> }
>@@ -573,7 +590,7 @@ static inline void bond_set_slave_inactive_flags(stru=
ct slave *slave,
> 	if (!slave->bond->params.all_slaves_active)
> 		slave->inactive =3D 1;
> 	if (BOND_MODE(slave->bond) =3D=3D BOND_MODE_8023AD)
>-		slave->rx_disabled =3D 1;
>+		bond_set_slave_rx_disabled(slave, true, notify);
> }
> =

> static inline void bond_set_slave_tx_disabled_flags(struct slave *slave,
>@@ -588,14 +605,14 @@ static inline void bond_set_slave_active_flags(stru=
ct slave *slave,
> 	bond_set_slave_state(slave, BOND_STATE_ACTIVE, notify);
> 	slave->inactive =3D 0;
> 	if (BOND_MODE(slave->bond) =3D=3D BOND_MODE_8023AD)
>-		slave->rx_disabled =3D 0;
>+		bond_set_slave_rx_disabled(slave, false, notify);
> }
> =

> static inline void bond_set_slave_rx_enabled_flags(struct slave *slave,
> 					       bool notify)
> {
> 	slave->inactive =3D 0;
>-	slave->rx_disabled =3D 0;
>+	bond_set_slave_rx_disabled(slave, false, notify);
> }
> =

> static inline bool bond_is_slave_inactive(struct slave *slave)
>-- =

>2.56.0
>

---
	-Jay Vosburgh, jv@jvosburgh.net
