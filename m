Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506468;
	b=mqlQxK4gdvUI4HO9bcU2Kg8TMkX94Hg0dit97ZesrJX/KY+iAYQ8A0FLDLceR0r4IGMr
	 RcFlB28GxwIZAySIOkFtc0MB33/UtxsIBKyzVBe1xlKy4cf5jSZ/qYChm3tIh4F2Gz/cw
	 mZccsAkBz+AyV0Yq12GENS+seRE9Qu24/T1+PesDuIE+oGaSN+ZvQHLT3dtjY5yRFQ+Qz
	 AMTjQg9M8N7sikiKy6j8UXTkL9ZHz9MtvgBA/BzA2PKSbZ3j4fCaYi8YzHnZJbDS7K0QO
	 8Htii4gwxMENVM+6rKGxc5Z0rTBk0OaiClXD75YCtHnyEGq4zxlR0d9HQ+pLEj0TKSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:To:Cc:Message-ID:Content-Type:
	 Content-Transfer-Encoding;
	bh=YYdUJX6CxNd1qo/rBqP+LkzXmW73u3T67hGKBmDRpeQ=;
	b=PynZ6SQytt9Rw6jUnICZYTJTUNaJ5Zx8lrY/YtKXpjMGgb6OhD7ES3WtzUddABcwndhd
	 B5rQyHY3Az2k2VNx2qlZ5epHsvXs2QylTq1vJkH9njgwOA2vUcHmYAZrMJxWhKH+YMsJs
	 nX1AN9hrj4Kb6d7vQ3Q3Lyw9TA47RdtOuXujFzjxR/rBTxhhrzMOeQVnkODkcTyqGAo74
	 TJB0vhP2mF3jMPNNGsMqc/okRg5IE2HTYbeIqPrBHatQ5Jn4C7whpT5cuHP493EJcgNPb
	 zXcgDOSvtZ0KTd4JdRdtzTGv+C9rIzQysLc7luZz6n8bDCNgbfFb7m8BKCTd+usleMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X9eOmd0M;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56061606A32D
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56061606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X9eOmd0M
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-917a64f28d0so9543896d6.0
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506467; x=1793111267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYdUJX6CxNd1qo/rBqP+LkzXmW73u3T67hGKBmDRpeQ=;
        b=X9eOmd0MHVJiLpZa4cT4z4LcM6QV6Zh8LasqDEKQJryNFrsyTpXe8C2GA5JHRHRHUh
         f+ZY8STqPP2xvorDdgtZk0o66VY/FBMgPeWW7xqkvAdiUkMAoKSsb0pRX7tvB9CHyP13
         wnAdpSHEfxZywh9nfSmm5LX4HxOBN20HZHqqPGQlhRoWAymUi2qAXTag5wzaxZRG550I
         JrIgYHtIemPegeV/UT7fEuu5TwjnCcBKeLrx1XFirvxvM294rXTV3zP7Z3dteRiDJLzr
         GUj0jcgmXRd7LGzhej/7j4h9DLv64Gh0YdJp+yb4Sh8mS/43UoCNqxaFNqCTEXJ9u8xa
         Dcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506467; x=1793111267;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYdUJX6CxNd1qo/rBqP+LkzXmW73u3T67hGKBmDRpeQ=;
        b=hFJMVaAkGBufHqHR4McEAsRrBcC2dwga+QvTk3cljFu1cdcxZpfA6oar4E0FPEXwAh
         KrWshvs2GX+HjDTrh1pCKjV1YnV3PG5DW2uiYLLic1snOQ12NVzoVOA756XI1Fy5ngm2
         Sotlzu7avob+2/IFsM5BMQlX6x3OOvmzEHvPvSMNM4qa1je8/8ZWzsjkAwBqBECyIvKi
         3GTQAHvVizRjjlGueFmrUuudx6mAe6L/gqXMfdsu/5rbusT/mutYgfPeU20+/eKeT7ta
         ersfM5jidfuc/Rlhrim1iHvqn1pO4BRVZA/OK2B8PUF7dIIlzsn4T62n4LtbkJ7J7V/R
         j5lw==
X-Forwarded-Encrypted: i=1; AKwUvBxhdJwdO+jcUYt8UyQwz8c6+05uzV34P8KX/tnMkvHQXu0sVwFfUbXKaSiJqm+JHWFp5LguTgMDD4PbiZ6jpCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5cvKVc+tIlbiLsmKoD9MGxRTUtJ0nHTLR9rIOTxxe9jSoowkt
	1x7lZrSCWlvbOtKer4+2P3ocZ8mZtuCFiXIK0MBgxyYAnp5xXcknzqk=
X-Gm-Gg: AYBFou3CZiRMcJJDtzwrgv4nyWCrfH5e30oxrCc1ZdCTdIGNNg6WwT798hdW/irHx3+
	yszksLd3XCX7ojZHSF1dhjC9Qc6KuJTIFnH57fVbchqLtpmZ9HAZhHQ1miGorgBDgjpyBrTvcLN
	To4tR7Blamiltgg9coDjwarJwViRO5PR9deuAXEsXpXRIdWgsxHoeQjpRJBij/4vr903daQxcX8
	1dPUoetMVGipd1rBaTS0xPXzN2CsoTfJeCPNO1wH5lLFEncnbIOCgNVdBK9ogjel8cuc8SzbcfQ
	Huv5utZZKGX8sXPAJFanuCuoto88gNT4lx86iASK242nyT2MM9d2t3M7Xj+CV6xsjb7mhJamE8v
	BEDAaZEEYD2s/FzA3/yYy0OU4Ek3kDVGLz8OC+/LDYGymG5Btbzxp2Jyp+YzvBzRHqP0ixAjL1c
	Gzh4VQ/iiJTlsao4rlkgrEJpvWzS8EZePNicLe7vIE37kWYnccY45mKancB6qZ/qqwWrrGm9CfO
	eojV9CWN4nBtl1AExI8qY4IeLY5PPwPwOGP6Hlyb6xbgZsyq6IalQVIL41gTYn/4556TFaFfT3Z
	x+hlCg7CKcNQIKPqnJB3F5s1yAZtMoRqSFG9q4E=
X-Received: by 2002:a05:620a:1a19:b0:93e:7156:f814 with SMTP id af79cd13be357-93f4c1c5518mr352969385a.11.1792506467179;
        Tue, 20 Oct 2026 07:27:47 -0700 (PDT)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b0d7c74sm234996985a.35.2026.10.20.07.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:27:46 -0700 (PDT)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Tue, 20 Oct 2026 12:10:33 +0000
Subject: [PATCH] Documentation: kunit: document --summary and --failed options
To: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net
Cc: raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <179250646543.2190262.8632957027583518623@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list

Commit 062a9dd9bad7 ("kunit: tool: Only print the summary") and commit
3c67a2c09b3c ("kunit: tool: print failed tests only") added the --summary
and --failed options to kunit.py, but the matching entries in the
run_wrapper documentation were never added.

Add descriptions for both options next to the other output options, so
the documentation lists the arguments the tool actually accepts.

Assisted-by: LLM
Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
 Documentation/dev-tools/kunit/run_wrapper.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110a..641ab50a 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -327,6 +327,14 @@ command line arguments:
 - ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
   saves to a file if a filename is specified.
 
+- ``--summary``: If set, prints only the summary line for parsed test
+  results, rather than the result of every individual test. Does nothing
+  if ``--raw_output`` is set.
+
+- ``--failed``: If set, prints only the tests that failed or crashed, along
+  with the summary line, once all tests have run. Does nothing if
+  ``--raw_output`` is set.
+
 - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
   Multiple filters can be used by wrapping input in quotes and separating filters
   by commas. Example: ``--filter "speed>slow, module=example"``.

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.34.1


