Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8C83AB27B
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 11:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777894096; cv=none; b=eK+6DQltQRXW8LlYhtrmjXCcJEuGUSVLmlhtw+tKKAVWY+Kurbm28R/EqRkqsKZ3GE6L7bBsc3HmteBZ+nNJz3vRXIV4k5ZU4n5GBFv6PLLZhacLCNXCj31NN2Effa+x22WDftOAdKJs7kPLs6wlc4V1J8sxj9ZOsULSUeavnI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777894096; c=relaxed/simple;
	bh=xen+bOCe6UFoaxZ+0OOW8kLN3gkD8aaTiRWd6lEAF8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rZEZLPEelQJ5e4oLSw/HbVjSwD2H02YHWcgkx+mfo8vo4EECulKjuU/VXac8SZIHfM7+MwmeJyyIONtF31tlM1EAwEEImYbMxKf9o3PEIELsuZHBz5ijpX1FUJF08LF2SexyjZ/5B/4OXJBc5oycRvBM5LSLqV7/MKb8iqY1E3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hP69fPjj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QJ3DgZPo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hP69fPjj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QJ3DgZPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777894094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OP8QnCfRuvGQp9zBUZSNN4UYtyqUqhrepWYMqNLQrrw=;
	b=hP69fPjjW7wl/F9XoO8VBjGsH1DUU6KY/TPZzgYYKCbHftxSGsKKJq6iR4v63OaFL6DGn7
	ltta7flZRXjAaiAX9RxbgW7JmcPgD1hedAeWbJovDAksGxyO+eLnvcaY2GBXEqU/uoLtdz
	StM/Xr0oZHSoL/zYJEs2lSW4RokMFac=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-Y6As77wxO9GuyPtMcStRKw-1; Mon, 04 May 2026 07:28:12 -0400
X-MC-Unique: Y6As77wxO9GuyPtMcStRKw-1
X-Mimecast-MFC-AGG-ID: Y6As77wxO9GuyPtMcStRKw_1777894092
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-44a122a5128so2255496f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 04:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777894092; x=1778498892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OP8QnCfRuvGQp9zBUZSNN4UYtyqUqhrepWYMqNLQrrw=;
        b=QJ3DgZPowTstKl47BRKDdWJCYZ4bkLo9YbF5g//S7L7wl3HUlGUwA05hpzeGBAT3Ya
         3Vf/LRL7/pQ1V4qIHdTmiEVxCGuw5/exDwzCDJlZJBuXBXIRK5vDR+RerWl1kkm0kzt/
         VcSTYTS8KA6wG5sq+LOKE654Sc1M+HZYNhVxSn9NA6elbGbLYERpEH3dNBehRMUD4zDF
         mZRxI0a6wbBSLERxdEb9npJfuu0Twb2n+dRBeIRiDpx1P6pItZENwvsTIkH2ZGOFztEm
         /PlIRYwuF+p4pMH7wJxuMcOvZD3101fKzdOSlZ2CM0cQOuTRsWyQSvzqIiLzYBjwfAMf
         OEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777894092; x=1778498892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP8QnCfRuvGQp9zBUZSNN4UYtyqUqhrepWYMqNLQrrw=;
        b=akUhhOrAeRK5Bvgftyttup0ZlvympWysqYtAuR7JVgotjQL2qXo7yFR76TJuFXuTPs
         3hEopm0oNArBWtuK6Bku7iks+NmlX+ONA5Pw/1Ymn/r3JANZBVNrZ1IZ1jBLysN5CX4C
         rEf007hJ5BIaoUHZKpqLKUE5HiqngUlpLrEW6M2owIbQBgqgIfY2dgtnLikWug3Hih3l
         oOIO06lKgM3r2Yd7mUkXDzelyNArfiPVthbT3PAEoX8U1UhYtuSU+FcZfk8Nt+sAG/CS
         J+PYRyWtF/yCmQdDZWNqnTZkauOksbUqPL9ciuYetIgor2VGu3HEWpP9lUL4IMB0E/m/
         +/gg==
X-Forwarded-Encrypted: i=1; AFNElJ+iU2/AukMAoKdW1Yh6FK7qkDo+Pg7k1xa98lREuwVXwldkfSMM1e4I2zZSeCsqTEN8Dzi0WXTmunyy0aNicfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOvpMKEcm+AJHEm2BJ1vMfGNt6neumW1BifYXbvmvOj7dxIrTY
	X9r8zSKnNgvK9cyPKzhTb4dkCtwa/W+e5kFHDQHzRMkEQUIuJnv1a2iDNGDzceMI0YhdoibdQ5V
	+BWKjz8tzITdajK5WqZJpu5mGKoMy/2aavbu1yyTGZhZI8aVCHdcHP4N4Y/duitb6FVPMMQ==
X-Gm-Gg: AeBDies6Dmi1aTSuVtucqG+W9XVbKSsxVZiy6cS5oV0ShsuD6dO2In3MAHVUdfasQSw
	4YdOAw6JHt/UtomYZgbxXwEWTrRrwqCHl7pvzQ4R5WeWcxhBpRh1XwLYehdlmju/WuVKOW65hzn
	o22FEZQGqcAzbOkql6gI/1mNOzFzMLgzYk7TiNfFy584TsUf6F13isWIAhhedjo2LacwsO9nM1C
	oBcGUh07vPzTjud79hSG3LLh7i4i83gZSnwcnF5t3jqs+tI0hV9JiXjVYLjwSScpuSmCWqbm6NW
	bwarQF7cQHDYPLbP0+KX6SkCiT9W67TJDXcVwY3KhuUKbZNe+DClzPFrc5VQ8CgLMiJT/AzShwB
	ipR6qLj6X1r25KI4e22rv6ndwB+G4X8HnD6XF4sEy8TtUVIChxDIgaCEZX1lpTpP5jul+U2cSdo
	AP6CRBQJD+HIrQAVa0oA8=
X-Received: by 2002:a05:6000:2410:b0:449:d189:e79f with SMTP id ffacd0b85a97d-44bb5e2daa2mr15074076f8f.32.1777894091594;
        Mon, 04 May 2026 04:28:11 -0700 (PDT)
X-Received: by 2002:a05:6000:2410:b0:449:d189:e79f with SMTP id ffacd0b85a97d-44bb5e2daa2mr15074011f8f.32.1777894091208;
        Mon, 04 May 2026 04:28:11 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1a9a00cfa84c903f391888.dip0.t-ipconnect.de. [2003:f6:af1a:9a00:cfa8:4c90:3f39:1888])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ea7d0besm25396208f8f.4.2026.05.04.04.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 04:28:10 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvmarm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Sebastian Ott <sebott@redhat.com>
Subject: [PATCH] KVM: selftests: fix steal_time for arm64
Date: Mon,  4 May 2026 13:28:08 +0200
Message-ID: <20260504112808.21276-1-sebott@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following failure to the steal_time test on arm64 by making
the timer address known to the guest.

==== Test Assertion Failure ====
  steal_time.c:229: !ret
  pid=18514 tid=18514 errno=22 - Invalid argument
     1  0x000000000040252f: check_steal_time_uapi at steal_time.c:229 (discriminator 20)
     2   (inlined by) main at steal_time.c:537 (discriminator 20)
     3  0x0000ffffa23d621b: ?? ??:0
     4  0x0000ffffa23d62fb: ?? ??:0
     5  0x0000000000402b6f: _start at ??:?
  KVM_SET_DEVICE_ATTR failed, rc: -1 errno: 22 (Invalid argument)

Fixes: 40351ed924dd ("KVM: selftests: Refactor UAPI tests into dedicated function")
Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 tools/testing/selftests/kvm/steal_time.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 7df2bc8eec02..76fcdd1fd3cb 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -220,6 +220,8 @@ static void check_steal_time_uapi(void)
 	};
 
 	vcpu_ioctl(vcpu, KVM_HAS_DEVICE_ATTR, &dev);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE, 1, 1, 0);
+	virt_map(vm, ST_GPA_BASE, ST_GPA_BASE, 1);
 
 	st_ipa = (ulong)ST_GPA_BASE | 1;
 	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);

base-commit: 6d35786de28116ecf78797a62b84e6bf3c45aa5a
-- 
2.52.0

