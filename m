Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2B43DC4C2
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 18:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338693; cv=none; b=WS7zhQWcmByMdPW377UqFiK05UZqI5zoFTBFjj/c0RKOC1QD9MEZpAETMIkYHCHQL9HJqC1dsbgI2CgaQHVZtGN/nCNDTi+EDSwwYMSgN7QYQ7+Gq8p2x1+NQDVdnOngLiom3+rLCxMviwROUOpv7xxUACxemA9LmrmqzTIJejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338693; c=relaxed/simple;
	bh=nUrrX6fvJ8xXWDGBUO+9oVkzQeBBL3WL+YrpDDcGXjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pi0/4a0RKW9WqFAVLCXoU07VVK+ms0cAjJYJMkC+JfCUvAXk2bHhj/H6sAbYJGC+Wl1BXrxBKIQ8sSP7Jp+cjtVyz5p7J4wXhYQMNONxBsUPrwu3qW8oJaUd73vhV6Lg5rMl3WNdbLhWgeyPh/40IR7MqhK3BvyVSOsArDwrPWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WzEWO/Tw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RqbbnNPr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WzEWO/Tw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RqbbnNPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787338689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/jSTYPb5+iqfnKrVpM0EYbQbnYNP4KDzbEmhzVmVac=;
	b=WzEWO/Tw76GRudJ95zTyQrd5kr+1XokUgMqRsJlk40AYhmkn3m1rkrRya1XUYEp82bNY5g
	QnD8WXlTppQtgOuLp2oqfKIOU+4Ls3pWV2kssfImTwqGqLQpSMAUhXi67XUBlPbS2E0ZWv
	ceV+MW7qSPv1R/aGsCmvyzTnv0urRMQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-ewllLz0uOraR1Qv4w-xVkQ-1; Fri, 21 Aug 2026 14:58:07 -0400
X-MC-Unique: ewllLz0uOraR1Qv4w-xVkQ-1
X-Mimecast-MFC-AGG-ID: ewllLz0uOraR1Qv4w-xVkQ_1787338687
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso16301381cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 11:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787338687; x=1787943487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/jSTYPb5+iqfnKrVpM0EYbQbnYNP4KDzbEmhzVmVac=;
        b=RqbbnNPrQpdUFOXnIcCmfqjz78gnIKTFTulla98SVS9yyqQxUD+SM6fPZaUyyNcEt2
         iqN12iiMW+l70aZPA+NRYVdTAQvajKeLjy+k7J7HcgxgmTiYjVLY8FAC4TOQsdaGYDZ1
         0fH1HA4vLr16P5bAqXeV8qgN3NGcEywgi7MTJ3IF15bj4Eck+ZBTgMkE8ds2AZ1fL2A5
         VhxfseF5rsEksM7BC9+W2OZAypaf3axoW5Sa4L+Zz9bUkqOJyBTGywWfYvVGnOPkhY48
         cJvq/SxzlwPXAZxHxU7aJJZnSlU83/8tRUfGVjBQD6YyvpfzMQlfmlIKq+ixBawMPVCe
         /z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338687; x=1787943487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/jSTYPb5+iqfnKrVpM0EYbQbnYNP4KDzbEmhzVmVac=;
        b=EovJDa4j+LugYGI/g2lh7lSKhy9wAs0WWuZ66MsJ1KwqEoMxKTUjtVshVim15bbmpO
         rPXkO7HS/HSSTZjxzsufeMnylrb+eWAa0bZ5hvpAolTEZyZZTcRgHyqOQ5xoxI+L2/A+
         NsRCr4aFegRfAL5Se83TecYDeJQb4xXqztqO7ZCbgvLvDI8jjMGMIIhZ/ZaXoqm7upEu
         Z/06HW2qbGRUV7AGzOb90KkmbpgCM6Mjj+Fgpvp/OBWM+7sTOE+1edyNeNUUVOvVxhnY
         /oCg/WYhR5e5+PeIRETdrRCRDF7k4t/H4p5XPIYenV/kDovD3x/6knqlx0xIIRbgTlN3
         9mxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpT71ndz86lR+TpIZzGdgTvEmS5zoG7WjjyGE7DcdZi3I2mvhARFJ/ajpxkKDFj2QRz4S/yMCNJu6GWyzLoDqo=@vger.kernel.org
X-Gm-Message-State: AFuF++mjqJXXYv+EVW51ENehZyXC7JauGS3gpgYNQr5QcJ/5keUX29/V
	SFBLIqUhbUq5U1QcNPFSUZT3r/hu/hEuS056REoSKUVeN3FU+Wz1VnvjMBbrRDKBdqM46zJfIZE
	+ieOuLGFZu4zpU95A/kTLZQNjvrLkQG6F4PTO/cLgHOYgqzADHRyOmIhIqzWxp3ApAP/mPw==
X-Gm-Gg: AR+sD1184u7+L9GlepMEppXQTa8ob1hdY13YcaP/0e/IpWmXBhR6lRwnMKCRHXvbqJc
	l71NPQtIE4KeELPpCLRnmlwczvAvbRDSj2UULHjhMljALlThe5a7DhD4nPQMgOVxmlmU+y3xCvz
	Ns/OhvoYauW4ROODN4AFzLqP/qyJvjR7JDBNSs72vGtVQhwioryvno9RU42z3YiKdaroLuLu04v
	k3QWmVIU8ZNinZV0TOmn2I0NTzy14peSEGxW4tyftXdh9DfGdNdA+ANQTaJRsr2NGRilWBEZST3
	P3ynYQKPoSYLQN0q5zjjp6Fln7efaAgaq+eNk8sqgYNRxvADdNy4veHil2JOVU/4z5ZJSYOZLId
	5+8PAfojL99ZGHHWrnuEP6ZVeYIUcINK136t9iHpvX//i
X-Received: by 2002:a05:622a:1353:b0:52d:74ac:6ff1 with SMTP id d75a77b69052e-52df5a08383mr81012171cf.25.1787338687115;
        Fri, 21 Aug 2026 11:58:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:52d:74ac:6ff1 with SMTP id d75a77b69052e-52df5a08383mr81011751cf.25.1787338686645;
        Fri, 21 Aug 2026 11:58:06 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e099a8331sm1163531cf.9.2026.08.21.11.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:58:05 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 21 Aug 2026 14:56:59 -0400
Subject: [PATCH 07/11] selftests: cgroup: add cma configs for cgroup
 selftest suite
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-cma-memcg-regions-v1-7-d21b165b8440@redhat.com>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
In-Reply-To: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.3

Enable CMA and the dma-buf CMA heap. The CMA memcg tests will use the
dma-buf heap to allocate in the CMA and exercise the charge/uncharge
accounting.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 tools/testing/selftests/cgroup/config | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/cgroup/config b/tools/testing/selftests/cgroup/config
index 39f979690dd3..c4f7df4f1b24 100644
--- a/tools/testing/selftests/cgroup/config
+++ b/tools/testing/selftests/cgroup/config
@@ -4,3 +4,7 @@ CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_MEMCG=y
 CONFIG_PAGE_COUNTER=y
+CONFIG_CMA=y
+CONFIG_DMA_CMA=y
+CONFIG_DMABUF_HEAPS=y
+CONFIG_DMABUF_HEAPS_CMA=y

-- 
2.53.0

