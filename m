Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B12DA75B
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772110436; cv=none; b=S1J6slTbzRAWxAnYIfmtS2PPiJKlVcgMl+6ho91UvEmZyrjo7z5jO2bHeHyvWbupMoDKQPUUkS9iDVXCoy3Tt+fzbUDi9EM/hXFcx+9Q3qV/QyqMiTfcMeGMq//Iq28tM9yRgF0pF85iqLJiZc+cshxZrmhZ8VdcckUIemVIloM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772110436; c=relaxed/simple;
	bh=fFttaZMGeLdp3UAEasDbHujAJF5yaSFRST6gXJrpxk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SRWA+3GcCpVmFyLNA9RdCrpktXFQSUzSgHcU3jrAkAIHdwo97MlmVq2UQc2c4EIhdo/ZnKk0+7imT4XYVO/BOYkD4IgJU01xOsBOjW4W34MbdcmvauVi5R0f9JndGDIZW/H/Zp0OWhp4S5PKf7ksIxUX0TRFuU2BIdf9pyvS0nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8FryCGa; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8FryCGa"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c70f91776fcso329530a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 04:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772110433; x=1772715233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyD5MkH20QdTZJ8Vxn6Kuz/fsHPnaaXUSaeZ35cNF/E=;
        b=h8FryCGabceH9Uy/AtyN5Lz6GYCvlmmIf7UfGPYiuWu0iCZw2yIhli6nqTrYPByTXk
         n2jN/4pvIKrXTzq0bnXPhHgfW0Sfrg/op9I1LUkMuCjZ70rim2QeGZEvfGF/SYBQMSvc
         w+ZotR4ZQl5MRpI9hWpaAqHt4YIJhii9Vp5KS9/9oGYGBEVKxhFylDK/c9CSv+k5zTY8
         fVWoKcBzq30qkW+C+vUeG2LJs97YcPJ2qD3rkfnG4oxbu/KRLq6vMdYPwUVnpIVNyxnM
         c8Xak5sObzy/ZEZFahWvrCDkwJUbFcgwhCvJWq4uDkto89yzAZXnt1d5rCPCdhFu8GXE
         T21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772110433; x=1772715233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyD5MkH20QdTZJ8Vxn6Kuz/fsHPnaaXUSaeZ35cNF/E=;
        b=E6mK2oZwPgKTLdjisR85oPg/Wn8rtDaczPWTFxT95t9HI1PpGTUOjtO4+JDZVNLZuz
         +CndpFUlQtuk6vFxpWG/IRt1/lYgGITxgw3lYJv1evq5gsJHAh00pKGJeJJxlZ+TJbda
         PzkILqatSnM+wi2x91c/q02ngdBOC+i0x+pjlC7naSuHIVjK7/l9+t6sgvwFxP11FHfn
         CpXfgsUjuspLoVYbHxlnaKn214lPU78S7OCC8lA+fKAdmCFQOM/PAONP+rk9SXUeyPBV
         dMAgqBpAQd0pv8+DyJvRZ48Ptvi+iy7zkJrGxrW3aV9u2ajgsqbOQ95RkIWKj1TzKP+m
         8pmw==
X-Forwarded-Encrypted: i=1; AJvYcCXsiCcbP8Tqw3zHIioU7rezn3aa0q0EID/Jws2Lxbe3Mb/Sc1uKOhSagEgdY7T+keadk6uJWJSRvtkelI9o5pg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuqUGNUVvldb/T4TG2s5w8nLjX/6GG22LQi97Wk5JgXy9phA6+
	jMQsuv600ZZkaSdD9emq5mri+ybt1a1IkkERzUak95jKg3khFIqDwWt8
X-Gm-Gg: ATEYQzwpR2fdIgntY88mg0N8K9gPnt1Gu1yiDrxeUyUx4vXPEi7mp7ZPWh/HzW+fkyf
	GRC3ckNhzRRR7kzJqSTlFxCeeVGTKFw9WXALwc83/tSv1JSXrYk5MC2Jg7Gi1+nGsZEcBBLj2Nk
	BGnd3iu6G/bc/qUdzwdgxzwz+/p1sHHTUTZkvrA8mLh7YUfkFyj2igQWXxHGTge/TbQUKVHS+si
	8pb1zQmoLV3N2W935bXIaRy576fDkFLOpesuXhi0RiRX7Eiq28Tz5XavKtSOu9ZcRCkCobqSoHe
	3W4VhJlUWZxjDPJFHUayji/sVyfzWgqj0PPRMZZ/SpB4aMweWhQe1GsCqwXsw2Z5wPZmUUDp3Hk
	9xoDwYbLgHfRGs/oQYUd+KBd9AZIpKtzXWaxD0QngAbYxweij2Kw4rFuuERYC1aAuzJata3gQHr
	jtgeP9WV6IMsA0Y3UVbc24G1nQGgg=
X-Received: by 2002:a17:902:ec81:b0:2aa:d29f:1444 with SMTP id d9443c01a7336-2ae02969668mr21350065ad.10.1772110433295;
        Thu, 26 Feb 2026 04:53:53 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb705b53sm25276715ad.92.2026.02.26.04.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:53:52 -0800 (PST)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Mahesh Bandewar <maheshb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv3 net 1/3] bonding: set AD_RX_PORT_DISABLED when disabling a port
Date: Thu, 26 Feb 2026 12:53:28 +0000
Message-ID: <20260226125331.28147-2-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260226125331.28147-1-liuhangbin@gmail.com>
References: <20260226125331.28147-1-liuhangbin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When disabling a port’s collecting and distributing states, updating only
rx_disabled is not sufficient. We also need to set AD_RX_PORT_DISABLED
so that the rx_machine transitions into the AD_RX_EXPIRED state.

One example is in ad_agg_selection_logic(): when a new aggregator is
selected and old active aggregator is disabled, if AD_RX_PORT_DISABLED is
not set, the disabled port may remain stuck in AD_RX_CURRENT due to
continuing to receive partner LACP messages.

The __disable_port() called by ad_disable_collecting_distributing()
does not have this issue, since its caller also clears the
collecting/distributing bits.

The __disable_port() called by bond_3ad_bind_slave() should also be fine,
as the RX state machine is re-initialized to AD_RX_INITIALIZE.

Let's fix this only in ad_agg_selection_logic() to reduce the chances of
unintended side effects.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---
 drivers/net/bonding/bond_3ad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/bonding/bond_3ad.c b/drivers/net/bonding/bond_3ad.c
index af7f74cfdc08..c47f6a69fd2a 100644
--- a/drivers/net/bonding/bond_3ad.c
+++ b/drivers/net/bonding/bond_3ad.c
@@ -1932,6 +1932,7 @@ static void ad_agg_selection_logic(struct aggregator *agg,
 		if (active) {
 			for (port = active->lag_ports; port;
 			     port = port->next_port_in_aggregator) {
+				port->sm_rx_state = AD_RX_PORT_DISABLED;
 				__disable_port(port);
 			}
 		}
-- 
2.50.1

