Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220E63D34BC
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405640; cv=none; b=uccf63hHOFVyKgj8qN59cafYoeR9xtEV5qArMyMpX9YHfm1UdkILqHj2AQnEvymSG2lcZHzKQi/Kei4pUJMjwCgXy76hUKRPLwxyHsPY3KUCfuWe0YyrN8mtQO1SV1pK/Dny7rnUnSPyuiGz76DVdYX0b4YPZ489z4ozs+96Upk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405640; c=relaxed/simple;
	bh=v2otgkqcGoPAxtDs9BIv0BddY44N60tS9V3/kzf1rVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBFLS317Xqe3ucBGvSKQcw4bUYtYCuKPj73jY+Y4N36KdwQvIvzMz5YmYayshiBd/rfC06XGHa4rIZoDymzMG7vV4WB+6sOG3mXYP3XD5g/TzoKRZ0gnKgBhlvjU9y867zh15dk5Ktk8lAf0OPcLVVoKg0Vd1qoJJTERnA+qpdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sHyqn9ZF; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sHyqn9ZF"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1621566f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 03:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785405635; x=1786010435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPbuhEVbHecHzC1qayYU8wiK5gPmiPP8a157RrhfrjE=;
        b=sHyqn9ZFEY06m5SHFvzkLzgAr0InYknJQoZMQKQmpIEp/PPqDoncKpeiLPqfk+7YJ9
         oZgR832i35eIYbADjPN6XycyZV4i9RcxVUR9DNdTT3cakxcKSavXi0oOJc6iKItGOWgl
         L2jO7GaAnIgPTpe9rCD0NwyiaAA3W1YLTe3PDrksOiyr8fpVLuijL8MwXxD64899RFFT
         pNBm55xedsjE3uuosLxWAHgZHNmWHapRhZbn8+n4vsQYj5OKNtbv7jrWU0H395yYAV9C
         TMlRhWnfjs2zGZSbNBP2/5mtXdJklRBF8BrWeO2Ubaj/Pmt58g3NCSHL+PQUTwjdNh47
         mShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785405635; x=1786010435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gPbuhEVbHecHzC1qayYU8wiK5gPmiPP8a157RrhfrjE=;
        b=bPWyCd+k5b3ZeBmwSPUgXu9sCjCUJCmmu/bqf6xfXpzzLTutylrLA4bneMQcxnFGJE
         tZ3zylKpisYxxcEpe/4PQp6eDgHXGdcrIfZe/lAg3D3/L2jEXrZOtqKh62XcpZB2y8r7
         UZDpuAkCLYbZFEUeC+yKit4D6364HDZVFkewRRODoRAG4D9jksvPdPmCPcXQg+mlFA+E
         a9l6qGBk9ORUH7ZFL0DTsMJSE0bFZG5dGNRnbceRywzY4/sffOmwSV8yWjIthDqKkWJk
         cxN9BBnNhM/EUELIWw8S6cOeRE/ZzAjq9WbeUfwu7Hcs5JZVhZg7KdG3MD3Wf/nOPrMd
         kJ0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpEmq+/d8eSb8tDhBnAsbTVy3ZBhZ3hQp2fDnM5rBfueLnGkmDqpmNHe4IkleXOZQDqy9tvDorZ3wzBev2AsjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBiICU10ErpICZsXxytGKA9rII9ifFkAks91ZVQGfKcywkJdFd
	pY0K4hPknuxVgYnAxVOlVf2TGn2kmpZ5Jk6zQ3iCyA+aQZONIggoLxoe
X-Gm-Gg: AR+sD10mz4GHgzqNR1lofBovpNueu4Z1I71z4SI/LnciH2agFuhKi4jTiK+ynXA4UJv
	NK31+/nS6piL1KbTZ+j510j+Cbre9CfjDTBF/O1PbkUMzjoH9HTGFs87YxBCgAzYdTzZE2kNDSv
	9TVpbG7ut5KgtweIMNUJndHH/pTaJcYQfhuIMZJVCUAABVJk5uEctKnmHqY3X2SebEf/3C02+bp
	+wkM51pFUJSP9jCP+5Zg3LeqKFIoLVnEBNlD0pjXyth1MfEHYijPLmZGnut/7fR7jp8aGwmYvcD
	BLGO2uDHMCQcEsR1m8m+7biWyaecHODAjZORYCnEvc2lmb0F2mrxGzimoT+zwNdO3IkzaiDNRvF
	z6KsP9cuaun91pfvGoGC3Qz/YtHD4Jy92flnw2vcKw0xtbAuV8VQxpdf/xaO2jNPJq2cqZKB17v
	ms6PX0HuaGs3UVpvzcCiUYOpra99nJcdj4r138r4lZS+ChZhAJM/QRbLCI5XMrdcdyIP/4J5Xv2
	LV0dT4YbEi6
X-Received: by 2002:a05:6000:2010:b0:47f:4fa9:ae42 with SMTP id ffacd0b85a97d-47fc80c2fcbmr2863337f8f.11.1785405634990;
        Thu, 30 Jul 2026 03:00:34 -0700 (PDT)
Received: from pf-5j7x25.fkb.profitbricks.net ([2001:9e8:482:5000:a5d:311:98af:bd1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e4721sm3984728f8f.16.2026.07.30.03.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:00:34 -0700 (PDT)
From: Reshma Sreekumar <reshmaisat@gmail.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reshma Sreekumar <reshmaisat@gmail.com>
Subject: [PATCH net 1/2] net/sched: flag inconsistent qdisc dumps
Date: Thu, 30 Jul 2026 12:00:05 +0200
Message-ID: <20260730100006.3547944-2-reshmaisat@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730100006.3547944-1-reshmaisat@gmail.com>
References: <20260730100006.3547944-1-reshmaisat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tc_dump_qdisc() walks every netdev in the netns and can span many netlink
batches.  RTNL is only held while a single batch is filled, so devices can
be registered or unregistered in between.  Since 748bbef5fc6a ("net/sched:
switch tc_dump_qdisc() to for_each_netdev_dump()") the walk resumes on an
ifindex rather than a list position, but ifindexes are reused: a device
created between two batches can be given an ifindex the dump has already
walked past, and is then missed entirely.  Before that commit the resume
used a position in the device list, so any unregister shifted every later
device and silently dropped a run of qdiscs from the reply.

Unlike rtnl_dump_ifinfo(), which pairs for_each_netdev_dump() with
cb->seq = dev_base_seq and nl_dump_check_consistent(), nothing under
net/sched sets cb->seq at all -- and never has.  NLM_F_DUMP_INTR is
therefore never raised for a qdisc dump, an incomplete reply is
indistinguishable from a complete one, and userspace has no way to tell it
is reconciling against a partial listing.  Callers already handle the flag
by redoing the dump (iproute2 warns, netlink libraries retry), so raising
it is enough to make this self-correcting.

Use the same idiom as the link dump.  Both return paths are covered, as
the -EMSGSIZE path is the normal one for every batch but the last.

Tested by dumping the qdiscs of 400 dummy devices (mq + 16 fq + clsact
each) while unregistering devices ahead of the dump: NLM_F_DUMP_INTR is
raised on 482 of 972 dumps with this patch and on 0 of 1089 without it.

Signed-off-by: Reshma Sreekumar <reshmaisat@gmail.com>
---
 net/sched/sch_api.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/net/sched/sch_api.c b/net/sched/sch_api.c
index 668bcd60d..ab31a75fa 100644
--- a/net/sched/sch_api.c
+++ b/net/sched/sch_api.c
@@ -1949,12 +1949,26 @@ static int tc_dump_qdisc(struct sk_buff *skb, struct netlink_callback *cb)
 		netdev_unlock_ops(dev);
 		s_q_idx = 0;
 	}
-	return skb->len;
+	err = skb->len;
+	goto out;
 
 error_unlock:
 	netdev_unlock_ops(dev);
 	ctx->q_idx = q_idx;
 
+out:
+	/* RTNL is dropped between dump batches, so devices may have been
+	 * registered or unregistered while this dump was in flight.  Because
+	 * ifindexes get reused, a device created in that window can be given an
+	 * ifindex this dump has already walked past and be missed entirely.
+	 * Advertise that, as rtnl_dump_ifinfo() does for RTM_GETLINK, so that
+	 * userspace redoes the dump instead of acting on a listing that silently
+	 * omits entries.
+	 */
+	cb->seq = READ_ONCE(net->dev_base_seq);
+	if (skb->len)
+		nl_dump_check_consistent(cb, nlmsg_hdr(skb));
+
 	return err;
 }
 
-- 
2.43.0

