Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1CB3559DF
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 22:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777329789; cv=none; b=UzX9hmVqQc61Rvu77r97DTXuRSQHLD5CNE5TbERX+hzBZTF67cGPLnjvcDYfUtWiaAnrNtrdN0B4OoG+zQpZVha9c9rR1al8K9APJZS2iou9TNkV8OJqd9YrTpUWykMgW3hCor3V0XPXJetyLNfRUp9Su24dl1+4ee4H8TmVgXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777329789; c=relaxed/simple;
	bh=PbcoGJ83hfaOZ6laTOR0uL8GbaAzSabp+C4TwUKxS8w=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fdDRP2hhIVTdN/z54M6TOg6YBduwlCr1pfGvKHIm0D1/E531NA/WyLdH2Hf3Qxigyg6620raHXeiSoitcs1SMyUNkBd9Tt7+Tr+9/a19YTes14N4ZSdPw0g5Jii09ZpOXkdNYcyDInUB4WHrmMuoohCzHN5GLsKPP6hqTv5WUIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sharmasagarika.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MflZwKi/; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sharmasagarika.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MflZwKi/"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-7a45cf7ff24so173291497b3.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 15:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777329787; x=1777934587; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SpSbFarD004TIRxjjXURunEN1itNuJvj7VUYTMGDc0I=;
        b=MflZwKi/qGbCvI/KBaDsMCCcKSso2/gl8ZtaIbsC8RQx+z3ORi/YzQNU2Uh0PeQ7l7
         DBU37m7mbTO6+ec2+9hP56Old69tc5NsJWm44MzcKdz5Ir38xoEUXSYuqfW/a1POuBJz
         K3OCKMPFpMpfzX3hYEK2OAXaAzksN+HzXfCecAB2snxd2nQELL9H1vQztHdkYaULGMwa
         SidSNClx7mkfE6XHHB9MiuRn8x+9MOEB1iSFEZ/Q3Wdkh/vmaPQZ2giGHoIXM/KMDasy
         WrR8nQXGLWq9PupYdKWVX7Z+TEgl8D2ev4r6PovJ+PCaUyXakVdJKVo6a/OcXCEtFfQo
         xrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777329787; x=1777934587;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SpSbFarD004TIRxjjXURunEN1itNuJvj7VUYTMGDc0I=;
        b=QQoLI9kvXGeeph1lddWLc5dh41mze3WiplX01ab8vZ3WNipu3sHToLzC1pM6mGixpq
         rJDZCgQCSKbco4uNIE0JxjiBS+Ihz+nrS2vOEBbxD2pWmIxfERlFBh+OfIEwJC1tgG3m
         JtOpztmOLMYdM9W6TL8O5KNLXztoeFkYohOV2rVEhPu+5jqr6/yFVzlbt9+6Jq1Pg9je
         WNeTPZ0OMcK3eR8GslZ1eg+S9hWZ0OBoN0g+BFZFz5VV2ApFEueuvpRqihcb5mwwYXRw
         DYHtobi1rQd8ZSpt2Y6iGJ7iDP83Ni/qO1vXns4CKbJkt2IvVOWzqL+d8T/h8IWuY8uw
         kqTw==
X-Forwarded-Encrypted: i=1; AFNElJ83XLFp4vv4JJFyUSLRVqR1p1AHJq97QNTUfbPq/ksBRMlQBQwJJiMXyYw191vkPEjtTdq6aVxKW5gRwGV6vjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuBKBUpQ8x+Ug+zEy7xbPVtL3pWq8XJKSUvlMRoGCa7AKHV/v5
	4ZS8etvmgzB0HygA0sYU5tvMz0NauKWjrvye2EHGBq9FZpS1dhgGwyNNxwA5Z9hx5nHBCMViOCE
	nTfwf8flHG+AWadw+Ewj1hZhuEJ5C+sunGsl7vg==
X-Received: from yxaa9.prod.google.com ([2002:a05:690e:23c9:b0:654:1934:377f])
 (user=sharmasagarika job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:690e:130d:b0:657:a0f4:ac1d with SMTP id 956f58d0204a3-65beed1d82bmr470283d50.12.1777329787001;
 Mon, 27 Apr 2026 15:43:07 -0700 (PDT)
Date: Mon, 27 Apr 2026 22:42:21 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260427224243.3499162-1-sharmasagarika@google.com>
Subject: [PATCH net v1 0/2] ipv6: fix ECMP route failover on carrier loss
From: Sagarika Sharma <sharmasagarika@google.com>
To: "David S . Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Sagarika Sharma <sharmasagarika@google.com>
Content-Type: text/plain; charset="UTF-8"

This patchset resolves an issue where established IPv6 connections are
unable to transition to alternative ECMP nexthops upon carrier loss.

Unlike IPv4, the IPv6 routing subsystem does not actively invalidate
cached destinations during a NETDEV_CHANGE event. Sockets persist
with dead routes, leading to stalled traffic or connection drops.

This series introduces a fix to trigger route invalidation by
updating the route serial number on link carrier loss and provides
a corresponding selftest to validate the failover behavior for IPv4
and IPv6.

Kuniyuki Iwashima (1):
  selftest: net: Add test for TCP flow failover with ECMP routes.

Sagarika Sharma (1):
  ipv6: update route serial number on NETDEV_CHANGE

 net/ipv6/route.c                              |   1 +
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/tcp_ecmp_failover.sh        | 209 ++++++++++++++++++
 3 files changed, 211 insertions(+)
 create mode 100755 tools/testing/selftests/net/tcp_ecmp_failover.sh

-- 
2.54.0.545.g6539524ca2-goog

