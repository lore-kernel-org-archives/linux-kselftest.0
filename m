Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911AD37BE93
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 22:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886338; cv=none; b=kZpiEeEfxQ9dYlmB8FAVz6WXytOuz8XhEWSQqBvptntr+Xhg+GFO3RD4wNNqRxZOMTS0+irBHN2JC4X0ae7Hzj2clIVHhjJlUUleBEtSlmNFodbJexuFpwSPQ0BRwrI1JN/Llbu3JfgXe7EmHYP9avA6h1GTA4bwX0WLl7WTS3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886338; c=relaxed/simple;
	bh=ZIS40BN/lVEtVVMEAyUeO8Q0LmXvqKfPsebwIKGBEeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nNVBkGosvsZTrX/oLyAhToA369CgH5HBwH0XNXkEMJNJBx7n06AtJbW3qv3iKuLm4FzaDbcGxRgU/5NngLeAIy7rSLAzAFYu7j6/5R/4FzCNcj8qJ+2g/wVSsZBVdMNqQ7/EyfK0xfua6V9NGkZtG+Y7ZGxI/TnapWWVL7iMm1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXwcJ5nH; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXwcJ5nH"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-7980ca83937so38367427b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 14:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771886336; x=1772491136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cemh6Unm8avZ318Zd18G/NSlRGlTIfX9gcE2w2y6Xk=;
        b=WXwcJ5nHT2Wm/PBC1YtI6EPOCYBowHp3Lk1cw+rFZMNUHtzbT9DCmAW/xRAREIgHIB
         CnIiKyBKNvtAZMG5pxeq1heJClkrSVPTvrFX6EzwNyNnnZ+2b1peTvJ3YNl+K/i3b9It
         3SG10I3GoZgiQeLqR+RkMFANZ1ahMjQJRrQhhLT7Q2slVUOgqdPcJ2IgQppjMTVsgohD
         qx4TerJTJdvZgXiiO3oK6UUFl6VWQsjKft6zZa2ffx8XMU1NmU62gK5aBFvPG5mpS5bW
         U/ek6YQgDPh+GqfXaffTgfXOdkrHi8+rzPfeSNMt4Ueqs4X+XVLJ6RmLkGSxbqs+Xeal
         wdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771886336; x=1772491136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0cemh6Unm8avZ318Zd18G/NSlRGlTIfX9gcE2w2y6Xk=;
        b=Wdu3KIw9Y8YG6FAokIhPbBTVZnLjbQveSEuiKCe48k2OraVsB3gfxcWgpavKmQgW6q
         6EMM2Pcir4eAzAQLgy8An2G0sz6AZqA6NLBfb7TrzyhFG2AX47fIQixQHGA9AsqoeR+X
         UCAyOf5BBmqlpKi/Q+2A49xppOZzp8C1hmPOqm10e7e+8k7CwZZVz9DTEeFysqIbMbBS
         lLxRua6J8S2JDizSFuUY7xKABDCNK6qwoU8zkh2f5GU28ra9WUkF3vu5x+4S2ysJp5+m
         DO+gQJn+6l7OUDf/LAYjXwo/kW4XbeaM3rK85nBK7SKCPCxmPpdSTLjHjiMScZnpG5ax
         v+xw==
X-Forwarded-Encrypted: i=1; AJvYcCXZDAoAfjkgxdJ9m2gGR4rtef4P0YVKKCLVpfiHGuubM1c5ZL1cpNQ1eUPvp9EEhG+q4/eyvjcad3sUn1d9xdU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx07t/uBSF633jHbxS1/KB/N+jhZYRoTciUDsrdSPjPmj3kUbgH
	dsMOoPfB444ScEu1IrNJYYs3DNI9e8tbwd4n5RQkt7F7E2FmGbpzFam5
X-Gm-Gg: ATEYQzyCNnIoUsN3a9NNcop6k5w75AlD+SGSaGmrkTGXW/OfRooaz/Cx+eNBwt3PyxA
	MWo+nu/2+bNBNRoV4Pc279w8ctxtRLhlBZLbIFdudcew0HhLlwrOAGFKISv3IozVzfhzv/kv4ss
	9YE99FLdx3Yf/XA6oKPQuPqw2o7xMPHQeZenrVtCdnlvmy4X/+cJUTBablkrNMEavqKRpHtdIYo
	toCYg7d9tWXyEppnyhMsuq7DDklvz1J6SMODAgNOlcyTvETPIwYPhHY1k+Chneq/A+XT4OjNQFi
	N4iDu8Gt8/NoigFAhhvBqpmJqM5y3Fumx7nEKBiDqlulpWrEiF0miMFNCCqxFN2h94bSriQyVR8
	Gh6AdY8jK2x7wPCxQlEK+iUq6sMr+j7Z+/2D847rjuMs09IxNYW5e1yDpS0029QBT0sMOk6UqZT
	Ysivq5U0pZSMpsu0vpiij/8A==
X-Received: by 2002:a05:690c:d89:b0:796:34f7:8ea2 with SMTP id 00721157ae682-79828fd308cmr92461117b3.31.1771886335647;
        Mon, 23 Feb 2026 14:38:55 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:58::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982dd87fa2sm37132007b3.28.2026.02.23.14.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:38:55 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Mon, 23 Feb 2026 14:38:34 -0800
Subject: [PATCH net v3 3/3] vsock: document write-once behavior of the
 child_ns_mode sysctl
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-vsock-ns-write-once-v3-3-c0cde6959923@meta.com>
References: <20260223-vsock-ns-write-once-v3-0-c0cde6959923@meta.com>
In-Reply-To: <20260223-vsock-ns-write-once-v3-0-c0cde6959923@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Bobby Eshleman <bobbyeshleman@meta.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 kuniyu@google.com, ncardwell@google.com
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Update the vsock child_ns_mode documentation to include the new
write-once semantics of setting child_ns_mode. The semantics are
implemented in a preceding patch in this series.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v3:
- update language to clarify language that first value is locked, but subsequent
  writes succeed.
---
 Documentation/admin-guide/sysctl/net.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
index c10530624f1e..3b2ad61995d4 100644
--- a/Documentation/admin-guide/sysctl/net.rst
+++ b/Documentation/admin-guide/sysctl/net.rst
@@ -594,6 +594,9 @@ Values:
 	  their sockets will only be able to connect within their own
 	  namespace.
 
+The first write to ``child_ns_mode`` locks its value. Subsequent writes of the
+same value succeed, but writing a different value returns ``-EBUSY``.
+
 Changing ``child_ns_mode`` only affects namespaces created after the change;
 it does not modify the current namespace or any existing children.
 

-- 
2.47.3

