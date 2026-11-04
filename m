Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811478;
	b=JEGUY/8Ih3XFvDa2qOXrwK76kj1jwsKp1FAOodW2m5sm4KiBDFJWGUr6C4ZoIsGUG6++
	 szfsJ4PyfiZgBwYxR+xTO7kikQ6HrTGBSvWvh4rUpsUhjF+1ONpEjmzgxf/9KZVO/6who
	 bqg31wC3VtuAXfE9c0WFxFuQPm/3vnFEAh+67p22dE5m2d/SczgJU93LnVhXY450UDzEp
	 u5e0UYZV9ZnQ2MhoNFbeOX1wrYw8uXErQHH9EoWRdtJGgUfcPaTwbC3w6b9MEAucwHS5Y
	 TsbJOc/+8MKWhsCjeZWhX4+S09xTHq5TjrPiI7IL6t54UUhrcdB8K8V1jwiCGe5TRCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vZX2J2F6ScsUN9tYZ3R0cEhAjGjvMCPd+3MYzWgyxI0=;
	b=GJICV0hXOcnOg7Uc8rDbEEIeSE2B7smuVGMBCjq2Duq3qY7ITlIpUHkLItRYVlyKTmTc
	 mkU+G8YWLR/Exgaw6N0MiF8w9zSzoQgIhFT/TZemvHLejFH5V4IavFkM5MEIKQJQHPKv7
	 ZUF3yB7VC1fiTVYbZGeDTxowkgwhruNoJ+/HyHxKbIiKWDy0NyXlXzaNduKKXFQqVFqMR
	 5qzKLiRNG8ppqLMZzo+IO/4Yi7WOpuL1oQB4nkTGIlS30YV76fLcZUiOIMmFnoWFlRcVB
	 P4vExR9m0qLVe/6MMN2KDLiZQnjMyhwUl7BDr41ucGFDdVTCnKFBeU6y9XSePjUv3sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpDOW6AD;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3408606A335
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3408606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpDOW6AD
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535a54bed9so1230848eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811477; x=1794416277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZX2J2F6ScsUN9tYZ3R0cEhAjGjvMCPd+3MYzWgyxI0=;
        b=lpDOW6ADYu851lyuivuLo7QwlZhzKTNs3PLF10Rp8myOxE5BpOBWhjm7Q4MqLXHeCx
         J52PFqv0AaxfoECHtzUpZMoovnjGHZgtZkxUez8M9SYQzp1jWB3MSam8LxY2TDtwtYM4
         i3YsZK1YrUlfkTefb9OYyeuUQ2dajq19tol+OtKNoLQ+MTKFu1lkw68gpHISoAjLNrX5
         GeRbxOyi04N5JeHjXQ+yP+UlpAEd/NKnQVYCH+cBYLKUSrSb3q/aJt4+3rxkSRyjQBnC
         YQ/20uVwMzwVNPsexHWcF+BUwyqNK40THR9TTrc2B1//qZ3wuMYu1M/+MQKh2WT/05Xl
         Q+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811477; x=1794416277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZX2J2F6ScsUN9tYZ3R0cEhAjGjvMCPd+3MYzWgyxI0=;
        b=s5vDce/kX7suITkwS18tzupb+ZaaMTBIF75hJ1VPC+MKbK9w2ldAqObGo4mIsUf/5q
         eWisW1xUx+BvpyVK86NtMpKmmli7e3EvEFs5XiLK10GKRwBuZKo2x1WpPdid/XESzbb8
         u8sbVc7hYKx8akJvPp7PivdnUGubcH2s+vst7KF6Zy07QHfBIGu2FsX1w2jxdtiwXo+D
         6BaffHVWtsjfN1CGC2qTl4nQIDTnxsm2+ZUE62wyakQo7CptM5eC1didkFDouKdBUNpR
         zXSdRGys5gYagqZMp4NCcoiqyQ7f8ayW/H55JhfaY3p0tKl4SawjTA56MSSztyF/ZtTV
         L88w==
X-Forwarded-Encrypted: i=1; AKwUvBx15l4sRgKQnfIwP+wZU8QkJRAxux7cBOOu5ycE3BA3JRqJPiiJi3KD1oFNzhPDeRVMiVXPJwUUNhfls+GAFZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/17kuklwX9aWkWIaMNStPTJD/sTL/9vzdu56qt21lR7uAFFHmp
	wLaEgFC9i5YcUe3mUFkqSFH0z356ohWlfAhpeUZnOIGfW6VauauuOFxE
X-Gm-Gg: AYBFou2VW+LJEYr0IkjrLkCw+Ihef1NG7HrVIBCrw9Nsjk6ow7OlqpEkcixv0JxhWzl
	P1hX5gkLaoqUTaN2fKbYbiyoPhCkmRHWjEfSF7FEsYbSWFNh4OzHmSP88KlYDrita0chZdJcFJY
	D6DjepZ0XCUsnLjpFPwrbS/Q26d6rzhwzEKgzXoZTBcmghfVBhkG2K69zb9Q3C5jh6WL+3+5yvk
	OJqylZYqnvvsDiGofpYyHJ7+YJThPJNPh6hhzAV0fZizjrh33FBAkjYRBvbcxalieMEuP4tr30z
	tmRkedCQx5/9XEmBA8dxPQkj+wFbupoAWKpn0y0r62ofMxoK7dpqzUosG/zf9jtPOVISj6OECJ7
	JNVawQZ4rdpDzZxjBqrvyOKgRfR08DmJp2AE/YH0OXEJcDcDqiAXJijRT08ib0MS/I2OXC6Z5jj
	X4Y38nLawK7GlnhXnLBHvCSAO3uqpyLw4NEeJP3JQXf5LVPUmTBUwUQjDMq43O3EuzimMq3xAbL
	bAANdur807ljSre7CIgRADA9ZN+yAo7xBQBOSMEkUps+xenTJXjqJkGjQwERcewKVR+awLX3HQ5
	HT5uYGLohGF2C5JdvIJtjTtp7PBTFDNi4sfv5pd6W3pfDo6GZKUsGNE1V6TV
X-Received: by 2002:a05:693c:42d3:b0:36a:1452:8dad with SMTP id 5a478bee46e88-36a4244dbfcmr24088619eec.20.1793811476479;
        Wed, 04 Nov 2026 08:57:56 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:55 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 17/28] Documentation/litmus-tests: Add hazptr drain resnapshot-slot-race test
Date: Thu,  5 Nov 2026 00:54:35 +0800
Message-ID: <20261104165504.2430480-18-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Model the marker consumption race between the resnapshot
recovery path and a reader release: only one path may consume
the drain_gen marker (the cmpxchg in the implementation).  The
Sometimes result confirms the race window exists
(herd7: Sometimes).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  4 +++
 .../hazptr-drain-resnapshot-slot-race.litmus  | 36 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index daab126e45a2..02c26d6bea50 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -115,3 +115,7 @@ hazptr-drain-engage-wildcard.litmus
     Test the drain engage's wildcard defer: an engage that reads a
     slot holding a wildcard (an in-flight slow-path acquire) must
     not complete for the target address.
+
+hazptr-drain-resnapshot-slot-race.litmus
+    Test the marker consumption race between the resnapshot recovery
+    path and a reader release: only one path may consume the marker.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus
new file mode 100644
index 000000000000..699cbf0e3d7a
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus
@@ -0,0 +1,36 @@
+C hazptr-drain-resnapshot-slot-race
+
+(*
+ * Result: Sometimes
+ *
+ * Models the marker consumption race between the resnapshot
+ * recovery path (P0) and a reader release (P1).  The shared
+ * slot_gen represents drain_gen; only one path may consume
+ * the marker (cmpxchg in the implementation).
+ *
+ * The Sometimes result confirms the race window exists; the
+ * cmpxchg ensures only one of the release hook, resnapshot,
+ * or unchain path decrements backup_outstanding.
+ *)
+
+{
+	slot_addr = 3;
+	slot_gen = 1;
+}
+
+P0(int *slot_addr, int *slot_gen)
+{
+	int r0;
+
+	r0 = READ_ONCE(*slot_addr);
+	if (r0 != 3)
+		WRITE_ONCE(*slot_gen, 0);
+}
+
+P1(int *slot_addr, int *slot_gen)
+{
+	WRITE_ONCE(*slot_addr, 0);
+	smp_store_release(slot_gen, 0);
+}
+
+exists (0:r0=3 /\ slot_gen=0)
-- 
2.43.0

