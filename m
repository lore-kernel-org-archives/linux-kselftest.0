Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811487;
	b=YP3EGCDnP4TPM8naYn5rUWdZR/BneCjzy34q8p+FWh2Gzqz7E7SET3sz1lOSLRe5y3ZM
	 lq4UdNB8GaYesP27h1HEgjufLHfUzoZD0XhIPn7ioCwnEkWafRV89820Z55Vh+JM4Ru46
	 mxBZX9cnwqzmu/FlIBl/5h0jAY1jwy7W8YZnW1IId9OfC/WOKThaZ8mv09gc3Tvpr7lup
	 mYXpzIao3Mg/41PRjo4+2KwAN1auCi6XYPFxuGryk4GF4ecv3JD2E9dC5zUHHtmxuZ29a
	 ZrAwAen6AIlmEcwID4uIZh5k/sLwlgiABc4kALYsmHE+gR8CZi3RhQ9l2XCwisQi6fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MX5bYyRBv2xWDRuJgCQ6Y/+Akj3zDi4J3TbhhKtB2VQ=;
	b=xWfDFsha/NW5TRp6vKC6PjG9chiV+vf0TpdfYbV49gBnmsrljnmxVNI4z8jCNsG/Kje9
	 b8yAUQQnRHknBZmQ+iuJ/Rxo1WADpLkYmatgcawq45lsORtvCzrTSHd84S8AajqfllEUH
	 JJfwMDZGp5I4K24FIWGL6GkPZKBjuohQuRPOgB0RymJodPwvhxxQl3UnFXVYQYS2ePsFq
	 ZJsdd13omWfEbk11Hzg6j22kuP4T8E+F/cz8W4EqZbTj2N2zKOl5rOU+1djHn1LEWcpbc
	 IrrxEBJIGEbI1wnjT+LI+aNhIH0Co3g4tz+x4ZzCPz7tRrM0DbZpmbE1Bkwzl0WsHSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lotFQVZd;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C96A606A328
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C96A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lotFQVZd
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36c9a93a1abso856611eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811486; x=1794416286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MX5bYyRBv2xWDRuJgCQ6Y/+Akj3zDi4J3TbhhKtB2VQ=;
        b=lotFQVZdNFhgVBDY7gna/kQwMt63LK8lZz7tMqJUIb8zH+l9m73GQU6xHgD8P4ZvZr
         1OS5T920Lqtt5GrJdQI/O7A/6fmemqaErhCNIlByN/wbXf/1XFlPVuCPkBuVcHrspK7l
         h3axa2N4YUH/YCY5LW1xycCedkvGXaq+AfvA7G+sdphoY7zT9z147BkTQr5zcfQaGlLK
         txraV1kFET4Rk4EEZPaTRDD/LKciGdu0jFc1pqCztMxzKSExFygfUyHNWNADpSIHVKQA
         jg1Ytx+JWO03LhIPjRtRyt+v8z5i1u4FBwFF4KovX6GB812JLN5y62qTJhVW97+uhY6Y
         YAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811486; x=1794416286;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MX5bYyRBv2xWDRuJgCQ6Y/+Akj3zDi4J3TbhhKtB2VQ=;
        b=Y7CGmJq1eugMwCUvrgszCdzbzlQarvdG3zRB6+ABiR+OP/GpKphogYzHqNeututCq1
         fnyoIfDSY9SZiL2xt92/cMWshMZJUdDh/PvGJPTQ1GUiFu5HOvuNkHv7vkIC+n2cYbwk
         +TbL+dQFQr5D2V2vA8/8SvkWZj+OtAGlKs83whbJXi/P0pKfZOKj1yi6rF6/xH/eszUh
         JI1Cv6quh0TK9lF8KMwUWFj0EYzpLlHJj+E72D0x7w9g0uNERO2ZlCg/H6Fv1gM3Snim
         JahjskReJEVL4I430zyPJy3e8Q2lMVL867Q8bHPcmBsguItaIcFsKDo1CELIriJF0LN5
         PN3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJuKr8/QKrTE6l7Ud+NAhX5EP4ZWR3Oi4hZNfXrW3Jwz3/mVVtjhJWQJegckMg//2HIqnMdm0vVFfnYtjPnHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oTUdSt3a5Bxas7/CDp4qAOUh5UdoEGPX3qpcz7N9sY/i2EZzm
	OLQeiSEL4kbOD+iRlGKuSDh5cf5EvhAyKVMyz6jO5iqIwG3SSfWQa+QT
X-Gm-Gg: AYBFou39UgNgRT+El2MzEUD2mpBQD7wBNXhlwA1hcRBBotACpFqHaU4m8x5yF/MNffr
	lRSAOL0N9dJAhcodeytAGOcXoQANNXYDCTwHa4k/XsypFQPpYoUHzZPk/czQG196F9CkpYyxUl4
	Bi6iKh19HOSPZOj7obktfn8OfgkAESbc4lJQ7GmNYMDMY9CpYg2PsJqf93O/i+vDTj1zON0hPTd
	NYkeuNeyGuHIS94oUkJCWGubmEqOuumB6rJSnB2NoWJquSamWTJGO54QNnasbuE8G/jBv57d619
	Uki5ztZN+yv+aPp11vbXneAX6TECkEZV95K7gnTzu2Als90o+V4DryFyNBIxAzD7HYRxM4gAu/I
	yaWav3Q2ck1F6FEjRgESATx57S88mO68JLMgP9SoHWx0qBavrtBbW8hxv5SLgUQ8DSBXIPoYhB8
	f9nHj/4klgShz6mvBt+RViXATTcnbUSj5i0L76hBYFdMqPPVakqJ/lc7dMxHRfkAQHYxAPv8Ldt
	3fVPhSlRzM0lOhBON6u6rlqNmSKtyFEbaS+NWVQ4hIFFudav+EW0sLjAlISlDCscGaPzvnAbijK
	Ak4+Sd2Iy/lweLbSjR0jAyLMYgde/DivaU7JewDMRyG9jLgeD7WqY6dAAYDq
X-Received: by 2002:a05:7300:f78c:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-36de479614fmr127613eec.7.1793811485795;
        Wed, 04 Nov 2026 08:58:05 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:05 -0800 (PST)
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
Subject: [PATCH 18/28] Documentation/litmus-tests: Add hazptr drain safety test
Date: Thu,  5 Nov 2026 00:54:36 +0800
Message-ID: <20261104165504.2430480-19-kunwu.chan@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Model the drain engage snapshot race: the engage may read a
slot as empty or wildcard while an in-flight slow-path acquire
still sees the pre-unpublish head.  The Sometimes result
confirms the window exists; the engage's wildcard check (see
the engage-wildcard test) closes the gap by deferring
(herd7: Sometimes).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  4 ++
 .../hazptr/hazptr-drain-safety.litmus         | 43 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 02c26d6bea50..604c2c0025d9 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -119,3 +119,7 @@ hazptr-drain-engage-wildcard.litmus
 hazptr-drain-resnapshot-slot-race.litmus
     Test the marker consumption race between the resnapshot recovery
     path and a reader release: only one path may consume the marker.
+
+hazptr-drain-safety.litmus
+    Test the engage snapshot race: the engage can miss an in-flight
+    slow-path acquire, so completion must defer on wildcards.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus
new file mode 100644
index 000000000000..a0ec1a063642
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus
@@ -0,0 +1,43 @@
+C hazptr-drain-safety
+
+(*
+ * Result: Sometimes
+ *
+ * Models the drain engage snapshot race: the engage (P0)
+ * unpublishes the object (head=0) and reads the slot, while
+ * a slow-path reader (P1) publishes a wildcard (1), then
+ * replaces it with the target address (2).
+ *
+ * The engage may read 0 (empty), 1 (wildcard), or 2 (target).
+ * Reading 0 or 1 while the reader sees head=1 means the
+ * snapshot missed an in-flight acquire — the Sometimes result
+ * confirms this window exists.  The engage's wildcard check
+ * (hazptr-drain-engage-wildcard) closes the gap by deferring
+ * when it reads the wildcard value.
+ *)
+
+{
+	head = 1;
+	slot = 0;
+}
+
+P0(int *head, int *slot)
+{
+	int r0;
+
+	WRITE_ONCE(*head, 0);
+	smp_mb();
+	r0 = READ_ONCE(*slot);
+}
+
+P1(int *slot, int *head)
+{
+	int r1;
+
+	WRITE_ONCE(*slot, 1);
+	smp_mb();
+	WRITE_ONCE(*slot, 2);
+	r1 = READ_ONCE(*head);
+}
+
+exists ((0:r0=0 \/ 0:r0=1) /\ 1:r1=1)
-- 
2.43.0

