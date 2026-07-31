Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EE035AC11
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 23:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785540990; cv=none; b=IH5/r6eohDAMk1kH71IHO3r4H0JTAxnPKRh62aWqBLSBzafqpkpesEPojoLaIc5GJiB7b/3j0uVca7b58eW5N++WxZLIrfqmxCJeZnJ49rZ3fQdwslkGmRPmaAu/bxV6lAKg0DXkhCvPbcs9SSekYETVbqfojaHxRBeRHWucvKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785540990; c=relaxed/simple;
	bh=QYK8WLkDehn0NGcwyXwvNHYq73sWHci4bNTcehdMdWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZhR+1QeEeksUILeQs4mGknfrrNaR3ld0mnxnwckeNwPVRzWLL8xNXZTd4+ALzQNWtgBFkse/LVpjtL5+eE4BG7HKJaz2qRUDTxB9ga5KV9VeOh0RAa/+bUwNcYpvpA+T9QpG1nerDrdqinuuqNpOX/NQghZGP9Bb0mtBhfwVb3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/ZfGRJy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/ZfGRJy"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cea3004256so17876845ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 16:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785540989; x=1786145789; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0SaMYRu6wc8EGbj4CgxV89pDWL6LLqMsE1gsbynFtMc=;
        b=k/ZfGRJyUZSsbA5z3z3wPDVHIlRl/kBaonJQP7y2I5m6cmLXvmz47a3h1IWj/sH771
         RHdXUhyptyZ63A/d6ftaHdvR+IfWeQIkPGs5/viRHnqrf10YbwSI66KvKLlmzMtie6un
         LRDJLQ+wcQcKijclP3Fm8GmWAnSYxe1Ihr8HHmfVrNY3lfqKAfC4blnZDpLvO5Bwm59+
         kriMG7w+TxZNSLmcifqSi2tYuKTZhISZ7HGvvKCZxDhugmIK7zU60BD6103iJZin2A/m
         xzEQYaLrzEa+vBSIdXJJHR0FxFsZcI+TLLiw01UeK0pR4dl75znSCDQeOOaAtTlrwAfy
         WOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785540989; x=1786145789;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0SaMYRu6wc8EGbj4CgxV89pDWL6LLqMsE1gsbynFtMc=;
        b=NhmI5vgV3mYtkCbLecy5OMSbVl4Y8NDhk3trPmFOunX9UKKfa7XS9FQErh91R5OFim
         5vib5JKjVRNiqjOrU6P+U2GjSM/eNf/2720i95+4PjEwEskc1adQQiOO4qroi3jy26vy
         mdiKHhDNUT2FBCyggsHmCa2xOf+POQTWJqAySFHMFIJA+y3CzBoWYpGK7IsqY5ym4YWu
         Mnt4OezXkMgGRfs9C1GyozmXUvN/nAdMaySx8/GiXfDnqPwvE599+CVkSVfMCKC5I1Wf
         twafuVCsXrDsAIatq0qCBEXaVpbnBvXpEz94tcZc7FAQyH4254qSk0VL1fJRlKh8K8Xv
         e6UQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAmKFKFFeThLxgBdunGXdvHkHs9YMnmfe8zuwJYXEazGIoW4BU5tDe/+XSV0ILNQFIxp71u3ESOTZoSXZvZRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzubyVcipCz2HEL0pjj4/hlFUluyo3HFD2lbdQZATyWty+ujRgZ
	rRGcdQ2h6scYOGcKJMJBuajGGravnIYg6CIl1ExfM+EHb1EMST+LmNaE
X-Gm-Gg: AR+sD11afFVbj33eVmhTyukYVfPJLWptKRWMs5wq32rZ59ThaTQUoBgEpHKKcg0PbTo
	MJMudbwchjxvRMaOmYu66s5jXTYV93isMJ5/cpEcuiXIee1h+tji1ApB5GCHTG15O+TbKFwdioR
	syElgMHVY9T59mWmTGfkuD5KUbBTNMUTI86gMojNVT+J/IzC/PI3EuLBD/qagkQZioYdwI22X6k
	/y47qCxjWboU8pBzMUaymxvBRHHyiIOsvbBoOmQ0gnrrjlDJMlSlSr2hQspEduwuBFSmbQeIEAb
	3IH1BDjVqzbVCFjnXVkjQ5beJnuAf16Z8ZXViXBoKWKmwzylUtHdTicyPqYFP0Ashx8yvR7Lm+A
	MsPbUOT4HFA5wU9Orh01rWO82KN1NpuParaKquBTUZO23V5fbypx10AC+S4a0MIHQnpIEKkufmG
	UpE3TBQZs57/qdV/m4g4Rx9PYIF7gDm/oNYIhyHpk7OL9xd/8DZL9PaGM/eoM+qcEtRF0Fprfk2
	h+hDl0=
X-Received: by 2002:a17:903:fa6:b0:2cc:85a7:36ee with SMTP id d9443c01a7336-2d052462dc8mr17339815ad.32.1785540988695;
        Fri, 31 Jul 2026 16:36:28 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:41::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b120d98sm11355105ad.59.2026.07.31.16.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 16:36:28 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Fri, 31 Jul 2026 16:36:23 -0700
Subject: [PATCH net-next] selftests: drv-net: enable devmem TCP in the test
 config
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-selftests-devmem-config-v1-1-098014348d9d@meta.com>
X-B4-Tracking: v=1; b=H4sIAHYxbWoC/x3MWwqDMBAF0K2E++1AfNCWbKX0Q/SOHaixZIII4
 t4LPQs4J5zF6EjhROFubltGCm0TML3HvFBsRgroYneL974V50crvbrM3FeuMm1ZbREd9DH0GjW
 OM5qAb6Ha8Z+fyKySeVS8rusHlaTij3MAAAA=
X-Change-ID: 20260731-selftests-devmem-config-f4f843f0f0ad
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

The config fragment already sets CONFIG_UDMABUF=y, but kconfig silently
drops it. UDMABUF/NET_DEVMEM both depend on DMA_SHARED_BUFFER, which we
can't enable directly, so we need to enable a config that selects it. We
use SYNC_FILE for that purpose here.

Additionally, we flip on CONFIG_NET_DEVMEM as well.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/drivers/net/hw/config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/config b/tools/testing/selftests/drivers/net/hw/config
index ed8642b68094..d89a9ba17655 100644
--- a/tools/testing/selftests/drivers/net/hw/config
+++ b/tools/testing/selftests/drivers/net/hw/config
@@ -15,11 +15,13 @@ CONFIG_IPV6_SIT=y
 CONFIG_IPV6_TUNNEL=y
 CONFIG_NET_CLS_ACT=y
 CONFIG_NET_CLS_BPF=y
+CONFIG_NET_DEVMEM=y
 CONFIG_NET_IPGRE=y
 CONFIG_NET_IPGRE_DEMUX=y
 CONFIG_NET_IPIP=y
 CONFIG_NETKIT=y
 CONFIG_NET_SCH_INGRESS=y
+CONFIG_SYNC_FILE=y
 CONFIG_UDMABUF=y
 CONFIG_USER_NS=y
 CONFIG_VXLAN=y

---
base-commit: 2fbade66245059c78daeaccfce13ecf499fffb51
change-id: 20260731-selftests-devmem-config-f4f843f0f0ad

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

