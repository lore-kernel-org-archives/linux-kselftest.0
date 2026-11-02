Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646886;
	b=W6Xljj0uQyXHE8B6JoS24LlogEP+aQw3FsLa91aj/ozLVmTPaSAZKE/Z9dJoduywfslK
	 5TEOdWrshTk21sUUGcSIhp2iWPPzymcuisLktbZ/atzUKvwdLVwN7nCdG0T1UcKaBPXPk
	 cYGeBxt9CREU287QcoxcrMakpo8Vh1ILis59y9PEH5Sn2/c2NDK3MWm3pybYZ7nvw/+PT
	 0OFow+U4Qo6t9K48PZmAo1pcLC94nshFZXN6Dfajs+TmjUrnPUBBatPh+p/OMVCFY2J//
	 p5hRfs5rgEvPjA4W2tzRkZFoy+ISjbW7/SX8imG5cQxdcujO4jrcJMvjtwLJAneCrZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0fkWwqUr24UUjvWom7HkAX5hPBH7703K8eWke+dsLR0=;
	b=pG24B8CC+IXiBUjsyM7kKl1k84ojsAwITeFxTGTNrueo9f73MWWV+5cx6wcAiyLp6ges
	 GcOdsXbwHfYylFx9M9u00C+GuZA9Sq2M89SYui2NhXw8ofJN/TCkE6EoAQ6dJ+h5yDKkd
	 o+1p94k+hBc3BSNGikVr7eFj6XwGXLuD+/b1apR5IRaUOkuziv3+q/W/W/smMZ3xX5Neu
	 C7honyJWX5pJ6fFukEd/mNBVdNk9qqsXTlNvYgfzCIHRKTdqAhQSpRHzjz71FGHKSqq6g
	 FLJz5YMQ9KypNRw0NGfA4AFhNOWrJ6ZxzRDSxu/sjn2KwoyB9qpNsUDJniYaQ7N9ZRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJiTy+hC;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF594606EE85
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 19:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF594606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJiTy+hC
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35fad13ca97so89775eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 11:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646885; x=1794251685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fkWwqUr24UUjvWom7HkAX5hPBH7703K8eWke+dsLR0=;
        b=dJiTy+hC3H4kxCI3qHT9mx61g9/FmwOVPDgGu39Cm4eH7Ev2O92eDCqDrjXnnZbJi/
         oujjVOK5sfXJe7NCV+utNUtQZsvpLoLRlAVWvoYT31nth3GhXBZS3K0QEA7oIV137aXq
         hP2k5rcV2T5SHMxqH/fM7zp9bqiaAsMShtqOf998cSW4FtQfH9P6O+ji2LngoVodiqol
         wQ0mWoBgcsEp3CPOF/oXJyw2jKx5DmyqIIGzzSnKz/85KXSup4xnII6+MqwyFxZw/MXd
         S+PQvDKBuKQuPypOEOgka8V2i//wBD4gA6AuMj1diGXpDTtez1u9pqnXuA/6dJ2tUR5J
         VjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646885; x=1794251685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0fkWwqUr24UUjvWom7HkAX5hPBH7703K8eWke+dsLR0=;
        b=Wcvrn66NqEIlJIQM1WoltN5org03U7qoI8x5UEuga+hNMYzgJ1kd9rVFOPt9sC+913
         zi7d3yW5RH/FOUivnb7ENlY6Eg8AhL7mRMAzfupTvfAx1xhY6iGEySNAaEo7R/i1dsiI
         7uw8Ys2lSeINKBEB2oU7PNwMuNXWqcFeKH4sYQ9wpMVAvdVqYtunZ15Dufxv7g5pWVOO
         NRDL1SWqj5tY5gAVUsz40sMsspVHxBOipSHvCEZerMVZmQlmJ5P8LJIJrI21LkYl0Cd5
         npWyfbBgF3E3mYafdlTd1Y3Wc3pqDP2OjKhiH0XryWOZAAydx+AG60+WSjWSdyflRJJi
         PO8A==
X-Forwarded-Encrypted: i=1; AKwUvBxDE7MNeX9zXywLzo/NgeL1HtlK+NnpodVaWlvFU/whftv5YF7oAccnEwoNHVFdqByShV4jsIdcrNsMdSkL4Y4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qIAM8DMrBv5GorU0dbGsbP2FbfLm49ztTewJPC7beIEGMCD2M
	QftwXBJ/19W3oBfJXc5gteCByPIDUpy8p8y3uIzPpG/GOp0RT3qM8wet
X-Gm-Gg: AYBFou0tDbLBQcbyO5eDL0lF4GFtWJBn7msQKbnh3IRukVhoUYO0GOOvqJjbXanpgxh
	VcLc8E6CvsYawcQDjrE1K8HTjLepy6KdrYRXHJVgGbPwLSZwJm+Shrck7nGtSAAi8rVKWhOJMgV
	V9ti6FjJjQDfOjt4RWOXZKq5eFcVnRtDs4eNvmE0KZgl6ponSzOyYpHUmTLPq8uolCj9UJc3xBb
	X0CI9/Opd5alkTcihxw1B0gYZRa5UcXMBzp9C3wwZ02yp8a+3w08XXC0uHQB14MZBzSLydHL1f9
	kCQr3lj5b0p0JSVlQdBvLs2/S+HBoXNY1smCIOq2Vz7dwMPTV/FjUrr52aSyhoKAro3xQPnb9sM
	Ok4GPW1EZsTk2i7FvBvcjRcz2WNtrkbUisZtdycnL7lgEbLXJG7CWubj5Bb6/6p06d+zQjeu3Ez
	Kmzc4JCIl3bc73zTaMzN/zj3r0ZqQkVSkXyxUJGiS6fvWADaD+emm508vC7BgipsPjBRl882Ful
	gMiI8NlUgGBnbXyf9JerO6Cp5VzTutLNPkEhv1YZgK6A2CUk7lK6V43yEbVhkSi1G1WOoumdLQU
	VlRAnKnT4+I75E4rgb/7G48=
X-Received: by 2002:a05:693c:69cf:b0:369:daea:812a with SMTP id 5a478bee46e88-36a423fae73mr15064264eec.30.1793646884909;
        Mon, 02 Nov 2026 11:14:44 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6f::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm40129419eec.24.2026.11.02.11.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:14:44 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 5/7] bnxt_en: limit netmem TX frags to 32KB
Date: Mon,  2 Nov 2026 11:14:36 -0800
Message-ID: <20261102191438.1059771-6-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
References: <20261102191438.1059771-1-sdf@fomichev.me>
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

The TX BD length field is 16 bits wide. Limit netmem TX frags to the
largest power of 2 which fits, which keeps 4K aligned frags 4K aligned.

With 64K pages this already applies to PAGE_SIZE net_iovs, whose 64KB
frags would otherwise wrap the BD length to 0 with BIG TCP.

Tested on a 50Gb/s NIC: devmem TX from a 2MB hugepage-backed udmabuf
runs at line rate with 2-3 frags per 64KB skb, none above 32KB.

kperf output (sender side, 1 flow):

  client: == Source <sender>
  client:   Tx 46.358 Gbps (174483046400 bytes in 30110590 usec)
  client:   Rx  0.000 Gbps (0 bytes in 30110590 usec)
  client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
  client:           729   153 599     48    0 13893632 3147
  client:   net CPU 71: usr: 0.03% sys: 0.06% idle:67.62% iow: 0.00% irq: 1.12% sirq:31.14%
  client:   app CPU 72: usr: 0.16% sys: 6.01% idle:90.66% iow: 0.00% irq: 0.83% sirq: 2.32%

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index e7a4190a8c78..c8a887facc20 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -17439,6 +17439,7 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (BNXT_SUPPORTS_QUEUE_API(bp))
 		dev->queue_mgmt_ops = &bnxt_queue_mgmt_ops;
 	dev->netmem_tx = NETMEM_TX_DMA;
+	dev->netmem_tx_max_frag_size = SZ_32K;
 
 	rc = register_netdev(dev);
 	if (rc)
-- 
2.53.0-Meta

