Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com [209.85.128.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E89346AC5
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 18:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771438276; cv=none; b=VeGmX9Dd85tcFnkduYrgwDqFV3+ngKT+9S8nt3bs+OQyaAad5uTydb2VMvq0l50Erha7FDPVeArR/cwVrV1CBq713yRB5ExWgk4Y4agqRAbH8KCIyJEQP9RPjzcXeubUwB3/8cVhlsbuOcwXogXvob4IQbgjGSQ+z1K6VaicukY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771438276; c=relaxed/simple;
	bh=uGK41uj6PP/iNYJl90nhzFCAJOq4jOu74IyB8IEiN9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HHNDApRDEvI6Azf7duVxkjyTMgqDnxx4Xt7Ye0APMs6PJwBkE/i6IjDs5B8cQjdAgxkfk8gTHan3F5SG+Q8RpTDKh0WUG75DfQXtoRDcP2ElUJBSk4//YvIOJzRuty8S6VmGuQVOImdhYB3SyaYLbV2iiEdl14UcRIYyanhkzyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sxjp1ngr; arc=none smtp.client-ip=209.85.128.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sxjp1ngr"
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-794911acb04so1754487b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 10:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771438273; x=1772043073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1wgGIa8//Y21Q1yl9IMhAVoEJrPKjw/0p7B3ammqNo=;
        b=Sxjp1ngrbm61KM1SssCgtg53oRQ57xddq335xU0Tr5P9gbgY3OvVgSzoHEjupl7Qiz
         qeShLNItOV+R3zhWkx+a49rTqh4sozGV9SvpO82vAtoBN+Rj7nV8rVpv8Lk92TbpqBcZ
         bfCZLNXGQubvFMGEUg5p7dAxzqmq5zAWL9tXQmhlx+F1w8Ka8X8lZdHUhRcCus/5dNPS
         sOYNDLYVwrz+8awLMJhb4QWtGUz1zXTFYwd5lR0zUkRgiPSYjJ/SsGcHqhck9Ihw//ac
         37aNH6AxotXpF3p2ChXd3VIXZJQMovwbHgWXD9xpsMQAaslXWg2P+pLSz/fzEZAiD8Kd
         RblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771438273; x=1772043073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l1wgGIa8//Y21Q1yl9IMhAVoEJrPKjw/0p7B3ammqNo=;
        b=ZEsxhLmldMk6et3VrRkkuWFMfKDlG/lPex+boF7Bdy4PlrURALOTmPLLMxi7Y2Bk+i
         BeAn5jXdCA+s6e9ITcNsWwAn1DrKtayR0YjuzDbR2cNR3Uaq0YoeqxYy7kOuK9rix7NL
         OzsThU+fQkrzdRc/oUz73GDJEiSKqj/szvvqRtFiAOzxufaY1Q9a4eQ85RKLg/WGg9oS
         sje49SQGi2kCqK6mIKXSkuni9tw10dLBDxYaapYSp+MrJrT5bVtIwT8q7P6FjtUksuVO
         QZr0S3fhiJuWjd/+7pqM8mUejr9Lrxff6CykvObiekXZxPhe72o3jYXpYNbQiHdRFYlo
         aPKg==
X-Forwarded-Encrypted: i=1; AJvYcCU/+ylWCwfZwgPtJk18C1sUmmlNywJ47f8CZxJ9EF+rsQFPTG4RmwxEicSkd+OwR5N4nGwFcOyai0+rw5uhV7U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8aGY/SHEIP2lNq4qoLl2/sKqpqekTXzJD45QTV3ldQFvCBVJ/
	p7pbp+uPM0CIFDPTI3RsTwFDJVayeS2OLbp2ArK02WHvxU9sNCGCi/b3
X-Gm-Gg: AZuq6aI+QwuVrMvMWInD8XHfrIWKl7e1ZNBRHnzISRiH5U0vDzjoOlrnb8CRkHXIw4i
	S55UIpfduh+6eXPeVi0EyKAOD5DWh8QVdtc92Igw7Xmi/FQnGj34LpegMO9yZV8vncxQmbqT5YC
	3GI/nUrciVe8xk9l05Fx6knoYeIhLaFzni/oMcSNWSBFEUWqKtjOCjCA+itQH41U1qQt9HHwf5a
	l78iM+SRQFZFNpXkoSY0Bn3cHb462D9aUIO//o4iy4xD2ePdzW6Xb1QoEw8DeYgLBb02EVXxgqU
	gyE3lZUoH5nUSqdKXKtGwz9awHiqPNCD1NFapGMpNd+QjCzXa+eSgYHT+SN0hNBEzImlIO+jEiy
	sKL/jss8FlUxrZmsmjNlyGY8G02jKgitZ3erzLhFS9Zy06aQ7QPUynjdGi93JhJ11cF0ZZYv89b
	5WNE7573nyAhsvoCpZw/ZnZQ==
X-Received: by 2002:a05:690c:dc6:b0:798:3a6:3f4 with SMTP id 00721157ae682-79803a60431mr1995927b3.43.1771438273356;
        Wed, 18 Feb 2026 10:11:13 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:54::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c257ed5sm124246567b3.45.2026.02.18.10.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:11:13 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 18 Feb 2026 10:10:38 -0800
Subject: [PATCH net v2 3/3] vsock: document write-once behavior of the
 child_ns_mode sysctl
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-vsock-ns-write-once-v2-3-19e4c50d509a@meta.com>
References: <20260218-vsock-ns-write-once-v2-0-19e4c50d509a@meta.com>
In-Reply-To: <20260218-vsock-ns-write-once-v2-0-19e4c50d509a@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Bobby Eshleman <bobbyeshleman@meta.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Update the vsock child_ns_mode documentation to include the new the
write-once semantics of setting child_ns_mode. The semantics are
implemented in a different patch in this series.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 Documentation/admin-guide/sysctl/net.rst | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
index c10530624f1e..976a176fb451 100644
--- a/Documentation/admin-guide/sysctl/net.rst
+++ b/Documentation/admin-guide/sysctl/net.rst
@@ -581,9 +581,9 @@ The init_net mode is always ``global``.
 child_ns_mode
 -------------
 
-Controls what mode newly created child namespaces will inherit. At namespace
-creation, ``ns_mode`` is inherited from the parent's ``child_ns_mode``. The
-initial value matches the namespace's own ``ns_mode``.
+Write-once. Controls what mode newly created child namespaces will inherit. At
+namespace creation, ``ns_mode`` is inherited from the parent's
+``child_ns_mode``. The initial value matches the namespace's own ``ns_mode``.
 
 Values:
 
@@ -594,6 +594,10 @@ Values:
 	  their sockets will only be able to connect within their own
 	  namespace.
 
+``child_ns_mode`` can only be written once per namespace. Writing the same
+value that is already set succeeds. Writing a different value after the first
+write returns ``-EBUSY``.
+
 Changing ``child_ns_mode`` only affects namespaces created after the change;
 it does not modify the current namespace or any existing children.
 

-- 
2.47.3

