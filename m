Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C793C9438
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 21:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546038; cv=none; b=q3raihTWxYAsfx3MX4NNDLS6EeCWzLVd1oxMP+6ryhb76tEYy+5aqFqxnwOuvh8UsjFdYD+IRRJhJRk0frzN16W1RAtfkWj/rx/6U99G1223HwdrLyjHv+xsEbyI3abA+8DQ2lYdpED4FCwMfi0X/ebTfjqbgBJyD83885zSkwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546038; c=relaxed/simple;
	bh=kiSE91uhtXJqytwDLCjtMSjpIBRyYiuWgsgh1lAFjt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXphBkQvyacnIv0ulIjGa0D5Ebhnymre0wVz02MKJiB6ZqOeaYaxNTP+8//qjGAzHdxmbDYJXxOZfdeFET42cb9334ZZ/gKVXLE8Et5zsO8RPMcg7YEQxjC0xLK10apct8EvNlBjDl9G2Xu40SzDcINlaFB+BvutCVYUB5pfEDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNGEk02p; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNGEk02p"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so5075865e9.3
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 14:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546035; x=1791150835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LtrL9rdtZROWF13Kkg2INWOH/yaC5LA3LVjz0fScaZI=;
        b=TNGEk02pzJoxvrxV5sxZqKgLhAjeI4g3hBDYdI4qr2DUU56STGjFkC6zcmZPk+0+OH
         snpcGcK+9v1na0tO4z68YJXO2cJM3TMYNTjL0wbU+PtH+/AGpxeOqNvtL47dY2synTQS
         bHy09Vq3Jr8egQtIXsP0kWvJ4wzBrCDpftUR19emp7+nK9U5SG4R21Hh/WDu3g8j0X6Y
         a8epMol74K/skDg0pA8e96NdDunyZZ9yvlPEjCBj2jXQgQWuZq5hOLRTqeUj59VxXI13
         uYXSpLQZowuqkfYoDprQnl70P5Pu4ZjhdOnZzKeoUvn8M27ACIWMj6DGKWjWBnP1nk30
         SSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546035; x=1791150835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LtrL9rdtZROWF13Kkg2INWOH/yaC5LA3LVjz0fScaZI=;
        b=1tevDR23OT9iKdnJw4uBkL3k8ivFM3/CtDWrbpeyKbKVIEcM0ambq/pZrw4rFG+VFf
         2q0dtEE0k2soYfbyHOAdsjrpbyZwf8Sf7uKJ0ArnfYn0bK0tKDbBTnCJzKkXANFtYxLB
         SUinlo4Kp7poSpPlb+vImb6/SEJ2CWG67bYSvjVx1Ahnh3vhH0RWl2e+UkOAavx6gkyb
         fRz3lPuanxBh8PXUkGUNzz0zkyycDoMgOaGOc0b0fX12PJTTeq8UeRiFhpMyHdcdBBIi
         JU7pLL6sC+fAgL5lkku++vuiEIh7j9+ps1yLJX5cJ+hOyKfH1Ify8sLa4gaDXBUpTeRM
         nJSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHvxoI6ASp0LWAr3FFO4Q5bjlpk5zFAJP9BIRqcVPBF6pbiUjmwFMVXnRi+30HC7r0j9it+ao0lWfsFzsLvyk=@vger.kernel.org
X-Gm-Message-State: AFuF++kJy/QcyzUMs4wjs2frmAZIVYHab6JFz8CxUIuF+5KJ997wNLuP
	ZkC2f+cjrjG8/TUm/MsZhnaFf2p7allY4P2x4w/PIxVOYrCAG4H6K89l
X-Gm-Gg: AYBFou1ig4Yo/5VP1Uh8DTCNLC6+AN32DUOySzAkFC0X/vCl4vM7e+8m9P535ZjZAd1
	68QlRmzIkkXrb+DPTjdN+gv7k3CCLJWtO4V+szb7h1UgD7PlvupT6fe2z4iYjFXNrTAusPtOErJ
	AK4AMT4Pp02QLDMN7ORwOzlA6vkUYlnFw61ha1WkGSVnv8g20UlWlXY6fk2Q/nL5Ge72QFuqRI9
	eHlsx6RT+StCH0Aamm42HnOGUeq3YpppOVS+tYNJ9Mfjg4DclWFA15j578EiCzsIrvrY119E1nP
	ph/XrJ7hYA30NzVR3jBPUCB9jRMh7evN51lgn3Z2XpxfHN1ncH/xa4yAOBqPnqWqz9um9bp+8f2
	JZPKn15H58DmNU0JqpepuFEjY57kpT/5BmeyuUxeQxVzwn0gQjP63svzNqGJu/GK+TiZTMw1p1N
	7aVXb/W5RGkfl1FV5Idjo5zwdB7VHWNdq3GMtsiJML/lSUyUkLBn7j+haG+guFcSE=
X-Received: by 2002:a05:600c:1d0d:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49fe66f144fmr205252405e9.16.1790546034613;
        Sun, 27 Sep 2026 14:53:54 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm89556865e9.15.2026.09.27.14.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:53:54 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v3 1/6] vxlan: vnifilter: validate the VXLAN_VNIFILTER_ENTRY nest
Date: Mon, 28 Sep 2026 00:52:04 +0300
Message-ID: <20260927215209.2581830-2-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927215209.2581830-1-alishmery18@gmail.com>
References: <20260927215209.2581830-1-alishmery18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vxlan_vnifilter_process() parses the message with vni_filter_policy,
whose VXLAN_VNIFILTER_ENTRY is a bare NLA_NESTED with no nested policy
attached. The entry attributes are therefore validated only later, one
entry at a time, by the nla_parse_nested() inside
vxlan_process_vni_filter(). Entries are parsed as they are dispatched:
in a message whose first entry is valid and whose second is not, the
first entry is applied and its RTM_NEWTUNNEL notification sent before
the second is rejected.

Link the nest to vni_filter_entry_policy with NLA_POLICY_NESTED() so the
whole message is validated up front, before any entry is acted on. A
message carrying an invalid entry is now rejected as a unit and installs
nothing.

This reorders two faults. The nest is validated before the device is
looked up and before the vnifilter flag is checked, so a request
rejected by the entry policy, aimed at a missing or non-vnifilter
device, now returns that policy error where it previously returned
-ENODEV or -EOPNOTSUPP. The request was invalid either way; only the
errno an operator sees changes.

The nla_parse_nested() in vxlan_process_vni_filter() stays: it is what
fills the per-entry attribute table the handler reads. It can no longer
fail on a message that has reached it.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/netdev/20260921150904.65a704eb@kernel.org/
Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---

Notes:
    v3: new patch. Link the nest with NLA_POLICY_NESTED(), as Jakub asked.

 drivers/net/vxlan/vxlan_vnifilter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index dd94085e0886..d391ec579661 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -467,7 +467,7 @@ static const struct nla_policy vni_filter_entry_policy[VXLAN_VNIFILTER_ENTRY_MAX
 };
 
 static const struct nla_policy vni_filter_policy[VXLAN_VNIFILTER_MAX + 1] = {
-	[VXLAN_VNIFILTER_ENTRY] = { .type = NLA_NESTED },
+	[VXLAN_VNIFILTER_ENTRY] = NLA_POLICY_NESTED(vni_filter_entry_policy),
 };
 
 static int vxlan_update_default_fdb_entry(struct vxlan_dev *vxlan, __be32 vni,
-- 
2.53.0

