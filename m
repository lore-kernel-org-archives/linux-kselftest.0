Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D98233EB01
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 11:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769771918; cv=none; b=OjNNNZLa7bQKOyBjMIOkW8ClFEu3rLDMe/KzhfmHHTUY0TRfaks5JLjE7LKA4IPNbEIYJ1TUz7w+R21mMAgoYUv2DsE40kqNjONT0k+/GoE53QnnEa3paprJwbkvp/CTqqgC1VpdMWTHGt8FYI0KBKzB2Y2FyBEnZN/xQX2LY1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769771918; c=relaxed/simple;
	bh=vNx8nb+oVCRtHhU7VK+zKr7FcdtttqBanbffG81q9Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gL6vzCo/2YrstV878ISd6biVywP8wiDkeGe8ZUr9Dwz7n4jlxa40ulkd64K5tlA9qMOenIVeYTEvsflTv8UNyXMhLVsD2vzvgO5+rIabfVUAeGZf/wheRFBG89N6hr5c4c5DnIRBgpNu1mTM0GD2zYj2xAjTkNrW7FuM7I8nUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d/JCM7b/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d/JCM7b/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769771916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4tg8ulq7nPHZ4usQOb+sYA13ZR+J9T9Pn2vliZqr8Nc=;
	b=d/JCM7b/5ytWy2gf9doCpgE9EP3skIO/DkbNpLc1+AkzBrnmBUJ0zh4EPH0q7Zl6vNlhEF
	WpUN3rWMZyD/JEVx+zXex1Q9K44VZQrhaMA9i1jUrJjqpeNh7ioLNtNB5fsfL/INL5LZ7x
	IDoodNw1qiKpNmMHMiW3IoQsZO4p5X0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-178-ZoYpVqGqO0O7DomLUODz8g-1; Fri,
 30 Jan 2026 06:18:31 -0500
X-MC-Unique: ZoYpVqGqO0O7DomLUODz8g-1
X-Mimecast-MFC-AGG-ID: ZoYpVqGqO0O7DomLUODz8g_1769771909
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D3491954B0C;
	Fri, 30 Jan 2026 11:18:29 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.224.204])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 35AC418007D2;
	Fri, 30 Jan 2026 11:18:25 +0000 (UTC)
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
Subject: [PATCH net 0/2] net: gro: fix outer network offset
Date: Fri, 30 Jan 2026 12:17:45 +0100
Message-ID: <cover.1769771825.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The GRO stage has still problems in some edge scenarios when dealing
with encapsulated traffic: the first patch address an issue there
leading to bad checksums.

The second patch introduces a test case covering the relevant scenario:
S/W segmentation after GRO for encapsulated traffic.

Paolo Abeni (2):
  net: gro: fix outer network offset
  selftest: net: add a test-case for encap segmentation after GRO

 net/core/gro.c                            |  2 +
 tools/testing/selftests/net/udpgro_fwd.sh | 65 +++++++++++++++++++++++
 2 files changed, 67 insertions(+)

-- 
2.52.0

