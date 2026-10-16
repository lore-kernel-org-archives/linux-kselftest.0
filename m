Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946EB437846
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143166; cv=none; b=hwqKYXEWuq5zEgi8+3tOD6nL+JGucnow6vSXsg0deCiqTcCWXN1y2kl++AjXuIQJ2wsS2UqJwbVEZIOiUZqmK0IfNs6cOFBoff47BYWwZinDq//BG1nwblriJrafpo+Dug/gvGgOHDLAQJEdVHN40bfGZd+Q85D5iygdZvck3QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143166; c=relaxed/simple;
	bh=Z9Mwbxdb/e66pqI6wraTgavodNtN8iMAFiUVb6k+BFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BNQ+WcRmmUIKxQe/3cELpdk2rJNXqRroo8QpWYSFHJYtpj1jX4GmUppeiucDEGmkcUg9036LdtgtOp/JCA1LAckz0bZrrNQ479GL54p0mu/RRoB0vnPAdrikdLiTJSGJ0hcemr/G3heK31wFaozc5ONpQo6S++v3rLEes2hm49E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHERSdA9; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHERSdA9"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2288508eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 02:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143165; x=1792747965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHmkv6BikJoFrn087jxAAKsWlqagsvtugyCffrxtj2U=;
        b=bHERSdA9g4cxrnlEyUlZpv50EfUtdP2CgtywULH7Y86PJg1PkvgbAYKt/r5Akzd5tF
         xJ0u0rCEoKruYyh4Gjg84HFbYdmPD8VJ02AMCONA/B3DLbI3NrhXC5A2Bx/EKvVEi/ZC
         v08zwYv1oGveh7VXBAsSl7fBQroVMwetkP1LCx9RfI/r9AMxC0/g7qpIbKp2tSFLeghq
         tnLm0YTh+06dsOt+Nuru3F22cxusAGVZUqVV5xxX68n5CGpTnKpCIA173KoDijwo4SWr
         k/A8wq8PGZFlKwLzifwbCWX2FmyWDeKUwsCQNvd5MOaVuXFOGm7ufaJEUettfoYRGz4D
         watw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143165; x=1792747965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XHmkv6BikJoFrn087jxAAKsWlqagsvtugyCffrxtj2U=;
        b=ZXmTEiqAST5Z1bVHsbBAxQxhwLL4I05ChkR+NpT/IqrVtGpW540vuUbGgV2nz4LJu+
         k9rpjEf7YbGyxp4pwugeAFFcHn0mm5ogeX8FHkFVtYF6XEhyHQZXLeU/bjY+W0LSMK1l
         MbyFSYDAdMSDLHjpOYObZQp9ONgJ1LdjjEkLeAq6fxS4gUFJ4YgWqyKNKjgb/s35h0hH
         PlB4a+WPpwXK8qABAs/Ck7/CF3hHeSPsZ+YnODB+Up33mDGayUX5wglLCgdqyM58QJ7B
         d5bIYuPiMKO0roSw/epiG3Tp4Ang/ECRgW0isuyryfna1g86zkkP5MFtYYZKxm6B3C+4
         atlw==
X-Forwarded-Encrypted: i=1; AKwUvBx0VOComW80ps2der/rvRycg+zgDjMC1IB6fH6ZnxbDbOVEfvH3YFy/n82jAchRjz3RTGoIqt6zp2KbXbn4g4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS7pvQbdgnSP6PWi14ze82/KhLuT0Gej6/FlSBPFh5O+ygaDhB
	RyUoZqfn7DRDu3z8KKmy9Hr7VmvcKQz9ymDNMYG4l/2DMZruwSZcSLzs
X-Gm-Gg: AYBFou3HV06U/EVDwsvynUkuNGJm9zNiIKnKx5JnjunySdvariZkBs0XQFSJqPuJrby
	ZdIZnN7N3k0gvjvqUj1T6F962rnvG2IqEzu7zJ1I5h3PKwS8dy9P+lDym+u3yRMsE60UJQPon6F
	8UagJ1Tcerc9pVPcP0z2yuQVUmcThNuobYzvn4IBIgGn1C1QesNma1/h1jKVDq9pkKjC/uG20Vg
	6hVrarLv0qqJJRj42azu7YPWlJKeJl4HtyUPgctG0cnSIMI8CdbjeVDZqwAQfc5sv7VcwbV0Km+
	CjMz9VkSOsSvrD7GaiRN8nVUYZgzmgiO4+sEQDIJqUqEiyfHctIUi8cYzFtx4m/9dOaQvso3qd8
	i3iJ5MKO7eqXrmqmu5WbgLnnoplwWQSbHwKpzqmgC2ez15DGE4tFexvKclVc+Ua+eInI4fIhlmT
	5siNo5aHfdjpPzzQQ+Nrsi9KaCoxJLQhayzkh50pKbh8BEyp+jygEarWvIDQO5JI+WK5AbOEC3Q
	Bg6FzhTWx3Wg+7MXu5DJywN+DXdpoWDPGo82eYLCASwnSr2cFcWKqxqoWKVDooAf1BlHoA9EVS4
	oEzcdcDxChk/lWTkzm+5yE+Wx45TbJDhlV6vU7zZ6j0=
X-Received: by 2002:a05:693c:401c:b0:35f:2349:a574 with SMTP id 5a478bee46e88-35f2349e961mr6538038eec.40.1792143164540;
        Fri, 16 Oct 2026 02:32:44 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm5157172eec.18.2026.10.16.02.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:32:44 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v7 2/4] gtp: hold RCU for the device lookup when adding a PDP context
Date: Fri, 16 Oct 2026 09:32:23 +0000
Message-Id: <20261016093225.1036375-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261016093225.1036375-1-anilkaushikwireless@gmail.com>
References: <20261016093225.1036375-1-anilkaushikwireless@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gtp_genl_new_pdp() calls gtp_find_dev(), which looks the device up with
dev_get_by_index_rcu(). Since commit e2d1baca2b33 ("gtp: remove useless
rcu_read_lock()"), this only runs under the rtnl lock, and kernels with
CONFIG_PROVE_RCU_LIST warn:

  WARNING: suspicious RCU usage
  net/core/dev.c:1047 RCU-list traversed in non-reader section!!
  ...
   dev_get_by_index_rcu
   gtp_find_dev
   gtp_genl_new_pdp

Hold the RCU read lock around the lookup only: gtp_pdp_add() allocates
with GFP_KERNEL, and the rtnl lock keeps the device alive afterwards.

Found with the gtp selftest on a debug kernel.

Fixes: e2d1baca2b33 ("gtp: remove useless rcu_read_lock()")
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 drivers/net/gtp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
index 99836b773e5c..15b5d845fc3b 100644
--- a/drivers/net/gtp.c
+++ b/drivers/net/gtp.c
@@ -2050,7 +2050,10 @@ static int gtp_genl_new_pdp(struct sk_buff *skb, struct genl_info *info)
 
 	rtnl_lock();
 
+	/* the rtnl lock keeps the device alive once found */
+	rcu_read_lock();
 	gtp = gtp_find_dev(sock_net(skb->sk), info->attrs);
+	rcu_read_unlock();
 	if (!gtp) {
 		err = -ENODEV;
 		goto out_unlock;
-- 
2.25.1

