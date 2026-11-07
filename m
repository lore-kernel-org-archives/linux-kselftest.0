Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794051269;
	b=4IuEJDim3hcqDrKQhfiIj4mjVHdIxvHu2/Y1a8+e+XG3s/5EoWCuZh5tQuIYWEicl450
	 da5a2YXhR+Bktd4QxwVOggA8jzeWTghUT6/M0zpnf2CmM3prb/HNKb/AVV6juvDhDrBC6
	 NDufUKIAWB4BNgufAzpHWQ0CEtw5HdywDBlsNUNQtSze8oE2khx6zYE9JkSF6kiGdJlQW
	 BYaiFyHSyic7vkRs5652pzqauhD5j29+D2zx4EGlzt5FPc1DMRW15SRH4U6HS9tRdFI5J
	 hrtWRbyCaq+ChRaRBDesigloUjSwWKHS3/dw7NmxZQaa8Paq/9yO4Lh1YtacDxRUBKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794051269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WrVSJWTebXtE+tU0LnNFvBWtkbGDoltWcoJtcFiPaXo=;
	b=2EbOKZUoj6RnBhh/fyg7csmdU+iNkQPv39DLaCnDRO2tDrBjgiPWGd024g+wCKuMis1h
	 qlqzjCBOK+DnhcPKhkMms+WG7WkTFGYiSIO1J8KW9+9fywagCSlGzBLPhgQoanIvocEi/
	 aOGyByHUkme4nmc2pyLtkehDiYFVSE8mkqm8Ku/Y1PR/9vPcR8bCcseRSQ7gX9idY3VbB
	 a4AlyUXT8UAASsdc+9AQ4QZ2+MXY2s/oOTKLWlq7qwJDLDA7CqfWFsjyhxsjtf1w85qj8
	 dIIx1srfc8aoP4lFRXVIlmHry4TQiWfNIPLSrfu5uj+KQwCtxJa/0d7XuDYkj8tIsIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTqVO+v+;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFD9606A326
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 11:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DFD9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTqVO+v+
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso18260427b3.2
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 03:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794051267; x=1794656067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WrVSJWTebXtE+tU0LnNFvBWtkbGDoltWcoJtcFiPaXo=;
        b=fTqVO+v+l9zGpDJE2j6M3+FmBdSTXfasWwU4SWxtS0hOuu08+Kms2MRpWzrhhRXSLS
         04b0IvOeMIHpOFMsaCsQy7wr0c0rOfpa8RwwVuC+QVT4FKxtrSJGLK0S4mI8j1qPLDK3
         A2DLgUX0zlzJT9Hc3vINcnc/uJk4tM7dD9knnQwcfAX1UbHqKyfRiSBo01jLnr14MMye
         WShn6o4cj+AHEvzZWk6asZtTmYHsyllhtDiKtn3nxRoKdx+5LhTwpV3upIldocSZtFtn
         ToYThxDLs/MJzC0RUK35jK3wiSDQ+A7z0JwH11C9GA13jcKGGvfgU4LkcGDh87If2s7i
         qBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794051267; x=1794656067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WrVSJWTebXtE+tU0LnNFvBWtkbGDoltWcoJtcFiPaXo=;
        b=rjz2ytG1YxcDxh/9VELzAR7rb6lEP4GOxEn1yjQpsObx6mYY+tsP3NjDd3XZtWBMdQ
         9RxtEW0FmagU8SK6R4Ote/pQOEZfhUzfATKVBr8UFn/mt3XLla4pUUHQtBH/XQ7EhO9u
         +LoKpqknBc3+FNgkvApem1fYYOrEzuvOTHFj77Ornh/a+NeLPJ99EHx3/0yjb6Wzm870
         626wnvyyMi/aURlnI6mDtlzXyYIz8lVc556bc+MJNFelO8QZ7VWh2SZAL6pCN1+MdHix
         xFKQhjIdAnJ/jHbyPPKwN/1+qE19gQwzFo5hZlh/khqbMwpiv8igIvMCIGesz7mXF+oe
         5Kaw==
X-Forwarded-Encrypted: i=1; AL+hErHZU6u/F+j6TEXJw5L9oOKmsuphidYCtzQbaxjVrjQehN+s0PoEX9UnmvsWQR/uRQDREO2iljdznAPk7X2FfmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FkMjfc2zynH9jub0AUeNz4v6oXgmDylgs/Cfux5SfE6iFVz2X
	Ka7D+vMHhL6cbnoAJozuAr4LHxZCPwEgAF8DYqFdwqOW7BohkjVvdUMG
X-Gm-Gg: AYBFou3hH3kbyrpMMeMJG1+VZFN5OdWYVrlsbnn9ZdS+q84enbbhny5h9QgL/ukas3E
	zA0TMip4dEx18ca23izRE/IL/IJxsa/mfSjs2Qm5zedFXwanqYI6XaK/9hqlapeY20MaycZzmcR
	qGAP9fyhIOAsh8GvfNrmMFOO2Xa5EmKjSPaObT5rqYc/KvoiJ9k0fW1w9lf/uqMfyI59s/EU57I
	y36xAl79kc4IxescWeILjbETLDurFIyOht7u6GrBWbGOm0AA76sM1eElH2K/55kv5Es/9rP8IL+
	fmbA7yxnnrQpOmRUa6bUUnpw425beYFjLpqfV+Z8ndnH3d+AHpp7oV6mt/3VWUFH4RXopVQgLqv
	yFRihqoIuWheLNHnNtw0I2mpfge+bDKVrsZy6GsUTRGbLjJ78ya/wgy6/O7nxAwCD2g7Pq+kZ9e
	SdY0aIyKeJwzC5xm7m1Lk7DGDb39wFmaH1eF55f08jg/y/h6Fu860gPmbejAZ+Y5XHtqVwQfRcl
	+eSTCKTm1zeVDzy04BhCjdbBRvAzxg2yJxWwN118YooKg3W6JsjeLqtdMTDJ+mn+TKyf1UVwbxB
	gveQIVW2xaW55yNsFsPH3Xh0
X-Received: by 2002:a05:690c:d94:b0:8b3:2d51:a839 with SMTP id 00721157ae682-8b34199590dmr32831887b3.40.1794051267434;
        Sat, 07 Nov 2026 03:34:27 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f2d5dsm40084597b3.2.2026.11.07.03.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:34:26 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Paul Blakey <paulb@nvidia.com>,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v1 1/2] net: openvswitch: do not record user features when the change fails
Date: Sat,  7 Nov 2026 06:34:02 -0500
Message-ID: <20261107113403.797779-2-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107113403.797779-1-houminxi@gmail.com>
References: <20261107113403.797779-1-houminxi@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ovs_dp_change() stores the new features in dp->user_features before it
updates the per-cpu upcall port IDs, and that update fails when the
per-cpu-pids attribute is empty or its length is not a multiple of four.
The request returns -EINVAL with the new features already recorded.

The features decide whether the tc skb extension static key is enabled,
but the code that enables or disables the key runs after the failing
call, so it does not run for the failed request. dp->user_features then
claims TC_RECIRC_SHARING is set while tc_skb_ext_tc_enable() was not
called, and a later request that clears the bit calls
tc_skb_ext_tc_disable() for an enable that never happened. That key is a
reference count shared with cls_flower, so the count ends up one short
and reaches zero while other users still hold a reference. Recirc
sharing in every datapath goes off with it, as does the skb extension
allocation in tc, in the flow dissector and in the bridge. The opposite
ordering is possible as well: a failing request that drops the bit
leaves the key enabled for good.

Keep the new features in the local variable until the request has gone
through, and use that variable for the enable and disable decisions. A
failed request then leaves both the features and the key alone.

Two other paths touch the bit without keeping the key in step:
ovs_dp_reset_user_features() clears it without disabling the key, and a
new datapath that fails after ovs_dp_change() succeeded is freed
without disabling it. Both predate this change and are left alone here.

The selftest in the next patch sends a set request that fails on an
empty per-cpu-pids and reads the features back; it fails without this
change and passes with it. The openvswitch selftest suite passes with
the change applied.

Fixes: 35d39fecbc24 ("net/sched: Enable tc skb ext allocation on chain miss only when needed")
Cc: stable@vger.kernel.org
Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 net/openvswitch/datapath.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index b2a0b09fd4a5..00043aef2d03 100644
--- a/net/openvswitch/datapath.c
+++ b/net/openvswitch/datapath.c
@@ -1801,9 +1801,7 @@ static int ovs_dp_change(struct datapath *dp, struct nlattr *a[])
 			return err;
 	}
 
-	dp->user_features = user_features;
-
-	if (dp->user_features & OVS_DP_F_DISPATCH_UPCALL_PER_CPU &&
+	if (user_features & OVS_DP_F_DISPATCH_UPCALL_PER_CPU &&
 	    a[OVS_DP_ATTR_PER_CPU_PIDS]) {
 		/* Upcall Netlink Port IDs have been updated */
 		err = ovs_dp_set_upcall_portids(dp,
@@ -1812,10 +1810,12 @@ static int ovs_dp_change(struct datapath *dp, struct nlattr *a[])
 			return err;
 	}
 
-	if ((dp->user_features & OVS_DP_F_TC_RECIRC_SHARING) &&
+	dp->user_features = user_features;
+
+	if ((user_features & OVS_DP_F_TC_RECIRC_SHARING) &&
 	    !(old_features & OVS_DP_F_TC_RECIRC_SHARING))
 		tc_skb_ext_tc_enable();
-	else if (!(dp->user_features & OVS_DP_F_TC_RECIRC_SHARING) &&
+	else if (!(user_features & OVS_DP_F_TC_RECIRC_SHARING) &&
 		 (old_features & OVS_DP_F_TC_RECIRC_SHARING))
 		tc_skb_ext_tc_disable();
 
-- 
2.56.0

