Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA6332D0D8
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 11:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769771918; cv=none; b=cF0y14sSx0N6Hz8edkbrXyfCWCTfxezFU9OAeZtzO89dr6KQ7ZEg+lhyoOin8c7AwHxk9X3aF8gUtmA439ePjKkYONukNCBWALlK+MHhb2cSX618zp8tKr4tzKftUg1sp5cjf5Js44DryjsI/R6ufu2EEnTpteUwrP7hmwKVV3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769771918; c=relaxed/simple;
	bh=ENP8qHCNQZu8Y+O2T1cH2mIGUtxrsgwQHqvq3c6RfDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uI/uy1FuRn4UvPS1kG52tzTjiWwkUyKZgt8XdOeMMyNkRAnHtTtPobPHn9Coduum4ZsFu6qSI5/ywUyS6XQeHWG37J7N1XgtieGSmOt/7etnMqMTSxkr9lxCQfCtx+qqH8EGwOXK7SrJi/poIf/M6KtFL8DNoN6EObSGGW7JYNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K1/UTJND; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K1/UTJND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769771915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dE+/kbXuDQXK28h8hpQJHij9yq5GmYRi9xdxMQcUWVY=;
	b=K1/UTJNDTxrG2YN6XlwQU7g7BPTWoytbdaI69CwJLaqShdcTBPxNVlZQNjQhZZno4lhQpp
	m6Lu1Rlz4cLFkftEF6F+hNwaiP35K6YAscdy7Dpa7iWc6q/Jcuk50mbgnWcsJXz0cy6+2F
	NaEXRRHCAYINQaCFBOaV+oI4U+UuhyU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-WHvZ3Q31N4K0cv6FgIuX7g-1; Fri,
 30 Jan 2026 06:18:34 -0500
X-MC-Unique: WHvZ3Q31N4K0cv6FgIuX7g-1
X-Mimecast-MFC-AGG-ID: WHvZ3Q31N4K0cv6FgIuX7g_1769771912
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B3178180035D;
	Fri, 30 Jan 2026 11:18:32 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.224.204])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C2C62180009E;
	Fri, 30 Jan 2026 11:18:29 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Richard Gobert <richardbgobert@gmail.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 1/2] net: gro: fix outer network offset
Date: Fri, 30 Jan 2026 12:17:46 +0100
Message-ID: <5a0fd9f22844611b806d1cc8bdfbe1504bb33b47.1769771825.git.pabeni@redhat.com>
In-Reply-To: <cover.1769771825.git.pabeni@redhat.com>
References: <cover.1769771825.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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

