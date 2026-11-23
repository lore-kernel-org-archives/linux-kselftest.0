Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394053;
	b=P+F+7xOQiLJOXmCsxssjvLFL8eTWzH++qaWnjAF1GcgPKGdtz/tomwQDS3vTpXkA/6Tw
	 feO933TftUdvMxITQhE3VSjc5rhBEQHJsA1eNjZeLFV9b0jyn1PoD/lRhqoejknBoXQpk
	 7+hFyAqOjWRHN791ddleEuv7/vkwPGK1+/4ifT6t/iDAaptugCPR8kdyCuv5mGFLDqP/1
	 2CNI3J3xIQu0mkwcikHbdp5KW0YzkxG3wLSYzKU058yhbQzQ5H1WadVj+lhkTSWGq1K+d
	 4CbuSB5UqD5/L8bCWz53OYYSjAORz6PncMaznwUfCZrjvDbUm9BNMgDcpCJd6JZq3RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y2zkbDuNdyLgS9VK0BRjp9YHIzBcoYoYpmcLinVfQTY=;
	b=JRE2pz165d2/cgK/v62YHhoKHQyGM/lC4P4mOrpDDoOPcWM25IsTqQJnO43A9dKK1ZMa
	 YoJGdMT/I5eGWcduplcaBU55sL2/fbvEubCcMoge1aX/0WaON94/6U2hUYuc5bHWoB1A0
	 JPgiCT+gLIWGfauez/5vubW/jQMsnWzIoApHnCoIaYXMWuBjKL7C/1ijKyhs22DQIHi3i
	 GpqKR+0tHLeux8mvqwfG+O/6PEn2YtevoknvLn2P9lLx9PUQntTn9XPVa4AivgtbDhp9L
	 OR3/EbYgpKkz/K4+UVDeyDeIFgG0KvhPlR6bp7z6ka39zNVhtSDXQSJMASiUyYryBzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iMotbwmo;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB08606A31E
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 00:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BB08606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iMotbwmo
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so20087345e9.2
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 16:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795394051; x=1795998851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2zkbDuNdyLgS9VK0BRjp9YHIzBcoYoYpmcLinVfQTY=;
        b=iMotbwmoucrMKCJdQ6/o309j1Jw40JxSU6aZshmDWO+iadVDisK6gU0bHp51Gmo4V8
         3fIC+ghxhZr4ydlcMGJmo2YvCUd+dA8b0a/qUh7RE4RDaaYnQryjPWxQAb1g7eIwZrCL
         g5FBbU3y+cwL7xNaBi2TYbs7gZ75bPGjhudjl1xkRVCbI5LEB4LkNP0Dnmgbc0Om3CeY
         3i8OvVNsd/LM184DAHMBGnigHUxucvHQ9mv8yZdNYmFV2n0fcEJUrJeqI7NesEpNS3Bw
         kpAI7wUcwRD/q42wlIKJqyPjQpQ1vlYVRXccU2fPGxfODMxzRaopYeA+BTnm/ZyuTGK/
         cYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795394051; x=1795998851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2zkbDuNdyLgS9VK0BRjp9YHIzBcoYoYpmcLinVfQTY=;
        b=13cXN7Y43jv1ELvBF0OP7rKI6NsFqw6O1DmB9fa2OVi3bmxistbpU+a3P6FYhqOqB6
         KoHVOugz23aSmQ2xjDAzzx54woZ3+VtZHGJlOSN1alMi8iJ1M6CMw9bDbS1eNXgvvsDc
         wcWADXqqeg9Pow9FERwUqfx8VjmcIO5JgtZ1vBUHOkXXJE1D1eiVmKYnEGzrUXDquJQk
         U5w6mekc10AoN7M/pMYyvMgf70AN081dr86rHPSfxJYbxgXWOBaUW1dR8Xu9/mCLbr6q
         iQaoxkdBGpF3OmYyQCyPeV51wjVfcIvcit9iyQj6SJiku/Cc9ClqXz9tHX71pZr/bVyI
         bSkw==
X-Forwarded-Encrypted: i=1; AL+hErHwRMikUDnMk8nIMmEl1cG/zP5SQsMXn3oCZzKIROPuGWNQvzvKATAbox9hlyrHItTl7r/IuvIEuWK40W8R7Q8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J5v5MAYV3hLMxrng45C5azlfZIveXbTvbWQphIPs/z2PSWJ7M
	7uaK6NkDgCUVTjqjUmmkabVEnbf2dLba7PkMMmsOFDhsq8bKwY/lavex
X-Gm-Gg: AZFdTZeA8NPDmUdFjpP7lzFQ2POXeW/GxcGGSJu/Ki6LEA0D8ivuxo3bHEmjztSV5DW
	VuhYMUXwkcgVxgU7ItMpVVmd09meC1rGJvjv+K7NNNTlielcNPAZNuFR5rkP0e7H6NoIznFv8xM
	kHX9MQu/h1Frc+BTvUnUnP691PI5/YKBMCJPi4lvz3FMvuvSOxPokRh9OK0RTacSjX/xcOQMVHB
	ZYliRxKODVwBKKu/NpaLcB1DL9c9igOvmwYVj/gk689j6fl7NYstVPZNrbusf4bWkaOA9gzIs86
	xy2rHq5hN4xLyqrcpPfceUDbmYkXAZkzJQYpsRbcmujOUO51Gamu42XsaQzNTD3rJl3jxcgVdyq
	KoDw8gtRIw4L9b31wpwDUFw9CxbQZRfFIRXRLyiOfA0ILxwmzkQdzfJMKAWOXGhVDmuA8dcSwZC
	DYmyZbVxFgXH1EPgJhRfuxiyWB1i0glBOr9BMUkXGtKTpinSsQrErq/6kZtfGatnmXEcmd+7C4z
	jXnaeurLFfTIz4KzbtBiPbbPVMGxBoKG2nP0Kd0y2QtWEBxgyYz7pV45/Xmz4Ycg41Z2F/5bsfE
	pp268dJz9YO+gryRWqHCwEidOs6dBhHWmh7CYU8aSFSQcgoMVAFb/MZBl4oY8IjmG88UkkjK7Rt
	/ciAn2V2lLALh/Z0N40qUT2z/LE6+0MfAv1fIHhDuEC/xyvtZIptpRlRzdlg/0s/KsnQxyN5ZMC
	2klT210xFE
X-Received: by 2002:a05:600c:500c:b0:4bb:82f7:549f with SMTP id 5b1f17b1804b1-4bb8881409bmr227020335e9.19.1795394051194;
        Sun, 22 Nov 2026 16:34:11 -0800 (PST)
Received: from fre3dom.speedport.ip (p200300e37f1deb6597bc525ce8f19e94.dip0.t-ipconnect.de. [2003:e3:7f1d:eb65:97bc:525c:e8f1:9e94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm111751525e9.3.2026.11.22.16.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 16:34:10 -0800 (PST)
From: Javid Rzayev <javid.rzyv@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Javid Rzayev <javid.rzyv@gmail.com>
Subject: [PATCH] KVM: selftests: Use __vmread() for the optional HOST_IA32_PERF_GLOBAL_CTRL field
Date: Mon, 23 Nov 2026 01:33:50 +0100
Message-ID: <20261123003350.198278-1-javid.rzyv@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The HOST_IA32_PERF_GLOBAL_CTRL VMCS field exists only if the CPU supports
the "load IA32_PERF_GLOBAL_CTRL" VM-exit control, which is not always the
case.  E.g. when running on an Intel VM in Google Cloud with nested
virtualization enabled and no vPMU, VMREAD of this field fails.

init_vmcs_guest_state() copies the field into GUEST_IA32_PERF_GLOBAL_CTRL.
The write already uses __vmwrite() because the field is optional, but the
read uses vmread(), which asserts on failure since commit 4e824a04d4fa
("KVM: selftests: Always assert that vmreadz() succeeds").  As a result,
nested VMX tests (e.g. state_test, smm_test, nested_close_kvm_test) fail
with:

  vmread[0x2c04] hit VM-Fail

Read the field with __vmread() and copy it only if the read succeeds.

Fixes: 4e824a04d4fa ("KVM: selftests: Always assert that vmreadz() succeeds")
Signed-off-by: Javid Rzayev <javid.rzyv@gmail.com>
---
Tested on a Google Cloud n2-standard-128 VM (Intel, nested
virtualization enabled, no vPMU) running next-20261120:

  before: 15 nested VMX tests fail with "vmread[0x2c04] hit VM-Fail"
  after:  all of them pass

mmu_stress_test hits the 120s kselftest timeout both before and after
the patch; that is unrelated (the test scales with the host size).

 tools/testing/selftests/kvm/lib/x86/vmx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index 5a06746eb..4b3e439ee 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -348,6 +348,8 @@ static inline void init_vmcs_host_state(void)
  */
 static inline void init_vmcs_guest_state(void *rip, void *rsp)
 {
+	u64 val;
+
 	vmwrite(GUEST_ES_SELECTOR, vmread(HOST_ES_SELECTOR));
 	vmwrite(GUEST_CS_SELECTOR, vmread(HOST_CS_SELECTOR));
 	vmwrite(GUEST_SS_SELECTOR, vmread(HOST_SS_SELECTOR));
@@ -363,8 +365,8 @@ static inline void init_vmcs_guest_state(void *rip, void *rsp)
 	vmwrite(GUEST_IA32_DEBUGCTL, 0);
 	__vmwrite(GUEST_IA32_PAT, vmread(HOST_IA32_PAT));
 	__vmwrite(GUEST_IA32_EFER, vmread(HOST_IA32_EFER));
-	__vmwrite(GUEST_IA32_PERF_GLOBAL_CTRL,
-		  vmread(HOST_IA32_PERF_GLOBAL_CTRL));
+	if (!__vmread(HOST_IA32_PERF_GLOBAL_CTRL, &val))
+		__vmwrite(GUEST_IA32_PERF_GLOBAL_CTRL, val);
 
 	vmwrite(GUEST_ES_LIMIT, -1);
 	vmwrite(GUEST_CS_LIMIT, -1);
-- 
2.47.3

