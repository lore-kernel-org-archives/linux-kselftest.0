Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811367;
	b=nvhNaiq2l/TbaT+Qvji7v+27Mp/oJhTaTM3lEl0csGxH/hRM5CwV05lrwSuAlaSlgOGq
	 0Sk0mHN4nvVkoFZyt9/MQeTYF3MZi5ImOL7/VfR+OdzE3cG8VWMWwhchdNWgt93fasvQQ
	 zgDc4iRHkKWfcdIc5nHngpMJRoeZsPDoK/lMih4Oi7gRngiHpVy2uUD+barD9ZaI5XIDI
	 lCnHaB69d6PS3jbkQ4uvtOInQTsEEvSG7v0qWjBTdjRpRiGzc3V6dM2EKwq1BUNWuImwd
	 TW4wz1xOTaBtqmq1mwdFq8Zu0AHvEMcO8nDaymIORmeogn4ZYMaioXL/1aa0ZvWvJKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K4ahvqtjxwDZW1z/zIOwgCxGi6bAPzcPods0jeXHn0Q=;
	b=aoM7lRHn5T94Msc92qf5r74HI1GQNOXDVDjwHP/eX3JbkgZMqabFuSXqzW4Dk8NyNPlX
	 95MNF/vhxeS/Acuqfz5FubZw1dpdNOMHmDVpIs1vYSBAd1Jxu4Vj7Jm9AlN+CwsUh+2NA
	 E11ZAaRopA2owys85q+LzhyXPaOuLt27yXru0zW1jIesLg7LkxOQUBZu1S9Cqx+xDgCnF
	 dfyeIu+oeBW3cRCko1x6x4FrFTPTT/5oBFevpqAwPaq8hRfWrktexMRTDEn8MFMdWrMZ6
	 ZUJmHQ7YHHCvTLUPmT95dfw0gvGkt0M3JGUPyKX+DepJchFx8wdtWQuY4n+DDuR1VxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGUkONor;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426DA606A32F
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 426DA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGUkONor
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a18fc7a38so2023516eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811366; x=1794416166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4ahvqtjxwDZW1z/zIOwgCxGi6bAPzcPods0jeXHn0Q=;
        b=UGUkONorfwM+zbVj6eSQLZ/CtHpB5o6WUk5r6DRCTGw9BsZ3jYHEXXgAeUMXpdkKHw
         rOZh0cr3KpIP5HIpA47NNa2SvdgBzVZO9ouBTKR1uZ7I/v8x7qERHplfE42RZ9WkV9rA
         WhTMYE7yMWjkIdRnqeFALhk6GGbkABiCkQLU/LhORN/exgEintJBo2+52BvPekR5iiCg
         JaiaFNJVcOrSF5SWDQcIfnWQzeik44hR0n1dwFRYF1zMjcPvRGBJLcLTj5Qezw261wSm
         VRmyrgJiAM2eYvZ3x5IdrrkO1UP6/IpCBNjSbQFnbFoLKEC4WWZ2HEP12RSgYhlCsYXq
         akpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811366; x=1794416166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4ahvqtjxwDZW1z/zIOwgCxGi6bAPzcPods0jeXHn0Q=;
        b=UZjSR1K/hM9/jjHdQMQZQxV5EVqvLF1EcnsFgyKQOhMol6APnjRsEYNiF4iDlZn40E
         TXJYBa3B/HgZ9LSO6GYZZjSVwkvevW44ANW7BTGI4tAIE/TucJ5KxnV1morVd0NE+S3k
         c04DE3y0bFRuzfN4BUS9z30jHW5kwGZqP0ZrE1vc1n/cuTJorrmQu04cpNL46hMU9NiY
         x1d1OK0o1z3BYUkjwpV1aUfl9szKhhhhGyu3w8/wlMVZU4QfEKK4E7eu9WL+OuT09bIs
         t2p6KS2k/4KVCSoyTBwnEOJRgAu9UIaGLheOn72/YksZfSq66r2JP9qDtwfnEFpEGu6D
         MXLw==
X-Forwarded-Encrypted: i=1; AKwUvByGi0lixpXWrR8RnTd6wULMPFGoQVIJH8qGkWCyUw8YJtFCmGtIAq0/ItUDMq2VlCiMdQoHdLpy/lDvY3i6K10=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OXcPuo0gJjVjyT0dGCFKOe9ZWHpo+x6l0Ym5fK+BXCc9/QC63
	br4FRZPfUlVYNNF+DlKyQ/IniU7OrLfzXXtnqILjjNkgMxiRTKv0OlV9
X-Gm-Gg: AYBFou2rWutdF2/8Bj7sR/dRBiXu4NSBvbAlCZo/Jf9BcWt9wWVj6m6/wgVM0q12WJ4
	lXQOqmACXkxEnPZM4Ta4HR6K063uKf7g+rbhPnt344yzjXntzR7oI9lu+ARz3wBkTvIAAdYO3m5
	ptaDfLz8xeDNArLboQRgOW7WGJUVEACYx0w4An9MwreMfaTSoqIltuffJK6XwWq+1O+c46BVpvw
	Wkm8WP0nTINVW8zJFOzyA/XLGIfj2hjxBd2xUtm1r6x5d12QrM6Ebh1il/i57I/i6l4OR4BV32V
	xIsbXyMwuCmRnYaMGOWPQH53XgSR5KM2ffaKmP2z2TtsajUtoayfjj8D8bRE28lIb16hz15qK1E
	5ZEzgSP56d8aAowV7nnFsyWFSEJ9QCi3oG/KMkT02dCYT0Pgf/dFPnu3jJ/X6b/a2117zeiHwYo
	mxgmxUthyUCsZaHyNLN4qUvi8tBCf6A1ZEaAT1hAwzOvlYrpV4b7wcTI+kf8JVnTO45XiFQ1zke
	CxdCovwdjN7ura5fQR8TGVdeMxrJNMNIUKFUpfyGx7Kp4ycjkFdfDg5wPi4FdzYQNDTyiKnCb/s
	36Hf0R/1JQYjSvmWw1+sQDbsi7pXgYD3ZWXGDSE=
X-Received: by 2002:a05:693c:895c:10b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a4240f66emr26391236eec.28.1793811366010;
        Wed, 04 Nov 2026 08:56:06 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:05 -0800 (PST)
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
Subject: [PATCH 05/28] Documentation/litmus-tests: Add hazptr wildcard-flip escape test
Date: Thu,  5 Nov 2026 00:54:23 +0800
Message-ID: <20261104165504.2430480-6-kunwu.chan@gmail.com>
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

Add a three-process litmus test for the in-flight wildcard window
of the single-pass scan: a straggling acquire which published the
old wildcard after the final walk cannot still load the
unpublished object.

Verified with herd7 (linux-kernel.cfg): Never 0 13.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 .../hazptr/hazptr-wildcard-flip-escape.litmus | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus

diff --git a/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus b/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus
new file mode 100644
index 000000000000..de467bb82d20
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus
@@ -0,0 +1,46 @@
+C hazptr-wildcard-flip-escape
+
+(*
+ * Result: Never
+ *
+ * Check that a straggling acquire which published the old
+ * wildcard after the final walk cannot still load the
+ * unpublished object.
+ *)
+
+{
+	int ptr = 3;
+	int hp = 0;
+	int wildcard = 1;
+	int enq = 0;
+}
+
+P0(int *ptr, int *enq)
+{
+	WRITE_ONCE(*ptr, 0);
+	smp_mb();
+	smp_store_release(enq, 1);
+}
+
+P1(int *enq, int *wildcard, int *hp)
+{
+	int r1;
+	int r2;
+
+	r1 = smp_load_acquire(enq);
+	WRITE_ONCE(*wildcard, 2);
+	r2 = READ_ONCE(*hp);
+}
+
+P2(int *wildcard, int *hp, int *ptr)
+{
+	int r0;
+	int r3;
+
+	r0 = READ_ONCE(*wildcard);
+	WRITE_ONCE(*hp, r0);
+	smp_mb();
+	r3 = READ_ONCE(*ptr);
+}
+
+exists (1:r1=1 /\ 1:r2=0 /\ 2:r3=3)
-- 
2.43.0

