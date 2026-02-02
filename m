Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C1535B65F
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770032624; cv=none; b=FYRm4HI65BkgPdLD5pMfAxgstLouLkxl0pBxMMFeqQoO05zUMXz/9VgmGFv0lXuef92wmJO61MhCA0rPOahR17doW2zhoT8BWZX5Xh7Rw8Myu2OIinhQ32wKE6deV0PAWjvpQb+LrvGEgSGs9xN8NLde2M3uYH6PbXdZDyjyAD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770032624; c=relaxed/simple;
	bh=q6JRx6Z2sTvpO0DlYWA9FoGJtfrY1lI6o3Dg5NkqmHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYc8LQV52mI+M73RQ/qA+PwxgWFZ5/TGBhm3vGQ/7xVd42Xx/HgFdzn6oyu/KyG46tFGKDDMvqJK4Tf3Ln86X/g9t+kR3rI6k2Txt2C2RyYQDsyPi0Idzc+OKrQ7jS/rMN2LoI3g6wlE0d/8xZxCztUb3Y/LDvxto7hER6mQ+e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NhqlxN7Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NhqlxN7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770032622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpHLz0BLpLSn02lwpwBiCDnmIRcWV97F9fijXGtLVCQ=;
	b=NhqlxN7Ya9euKlruBdqg+oq655G+Kp4fawisYg0uAuVJTAGaz9hUpz+KLaoNDhq9DvI02j
	71L2TpFuYvkdCDjhRifmEOw2tgAUUI9QTk7oY87UOoZ78ZRPl295WUGyzsufHN6hNjZDDX
	zENalOlutFxFOSsRcBflKqL9LGPt7KI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-F8zhD0s3Po6CUuBIzfXlGg-1; Mon,
 02 Feb 2026 06:43:40 -0500
X-MC-Unique: F8zhD0s3Po6CUuBIzfXlGg-1
X-Mimecast-MFC-AGG-ID: F8zhD0s3Po6CUuBIzfXlGg_1770032618
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A51619560B3;
	Mon,  2 Feb 2026 11:43:38 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.224.250])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7B3BE1956053;
	Mon,  2 Feb 2026 11:43:35 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Richard Gobert <richardbgobert@gmail.com>,
	linux-kselftest@vger.kernel.org,
	aleksander.lobakin@intel.com
Subject: [PATCH v2 net 1/2] net: gro: fix outer network offset
Date: Mon,  2 Feb 2026 12:43:14 +0100
Message-ID: <562638dbebb3b15424220e26a180274b387e2a88.1770032084.git.pabeni@redhat.com>
In-Reply-To: <cover.1770032084.git.pabeni@redhat.com>
References: <cover.1770032084.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The udp GRO complete stage assumes that all the packets inserted the RX
have the `encapsulation` flag zeroed. Such assumption is not true, as a
few H/W NICs can set such flag when H/W offloading the checksum for
an UDP encapsulated traffic, the tun driver can inject GSO packets with
UDP encapsulation and the problematic layout can also be created via
a veth based setup.

Due to the above, in the problematic scenarios, udp4_gro_complete() uses
the wrong network offset (inner instead of outer) to compute the outer
UDP header pseudo checksum, leading to csum validation errors later on
in packet processing.

Address the issue always clearing the encapsulation flag at GRO completion
time. Such flag will be set again as needed for encapsulated packets by
udp_gro_complete().

Fixes: 5ef31ea5d053 ("net: gro: fix udp bad offset in socket lookup by adding {inner_}network_offset to napi_gro_cb")
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
 net/core/gro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/core/gro.c b/net/core/gro.c
index 76f9c3712422..482fa7d7f598 100644
--- a/net/core/gro.c
+++ b/net/core/gro.c
@@ -265,6 +265,8 @@ static void gro_complete(struct gro_node *gro, struct sk_buff *skb)
 		goto out;
 	}
 
+	/* NICs can feed encapsulated packets into GRO */
+	skb->encapsulation = 0;
 	rcu_read_lock();
 	list_for_each_entry_rcu(ptype, head, list) {
 		if (ptype->type != type || !ptype->callbacks.gro_complete)
-- 
2.52.0

