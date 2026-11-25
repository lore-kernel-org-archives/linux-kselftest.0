Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581074;
	b=whPC00aB2KejeSD0tfSTQv3b+gz46VXA6xFHrAppjtZ4SE2uUGCODr6zzioS3876OZtN
	 1WRouEkWZ+ez1JbnaoQ4d/jwGfi42uTRFvV5doNzb3/wjoIoq1E/iLw1xkP5DJ7UmQsFy
	 zxHqL4x6TYAw8LjvVSbCXnBJqZYOTh5OLQUWdnrl1fQPxEgQ3e48cWPgFHwyc+Egci8PA
	 V3EOwMeBoPHFY8xPVnfSD+qR86VUPJV5iWgFz/8rPB6plvuenkfCIn6nP2jCnie+WFQs8
	 ISqk9TzPfuiYJVNxu5wK6zRGu4wXT+oRgN6D4dc6U8zji4HOGYtVSPt2M80QKYFgmvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:To:Cc:Message-ID:Content-Type:
	 Content-Transfer-Encoding;
	bh=LqCAbsFv75X8FpT2kuDVemXn9DMtQ2UrANDaKURHbUU=;
	b=Q5R74eW7agwvZwNerPq8dVNizv9RY0UcIgU7mrxIYIuIdUiW7BDnsumgxIauEBNiAeva
	 5xmP2tW/G5kJYJIjLwbxG+Ukt4rsLfNTleXU6HHAvRj3OhjyUcUNPUflhGPt4zRLVPAQM
	 zJ0i7SXGUbkTU5dPebJyiY6CZbb3abda4aFDG+3Itl17PpN5VfWURgsi2QHpU3r/QXm42
	 dBU/KbLAKOlMy6UDhsRs6rnOi4uXorEH5ZYaKczcgNgPKLVBD00W2JMhsCzYzIXZ52NCy
	 llK+VOlBGc1vCqt7SU7eLt8HV2bmxmWmOEGcPo2uwYEUrIgDZCcvKIuvNy19KDGvDDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9xaBilI;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C747606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 04:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C747606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9xaBilI
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55d2b4a99d4so48884261cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 20:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581073; x=1796185873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LqCAbsFv75X8FpT2kuDVemXn9DMtQ2UrANDaKURHbUU=;
        b=t9xaBilIOSfrKNfdyYoYv0fqw8MH2K4V/ls2xdv/XMF2Y7q+0FeBKT08Y8d356eHZx
         ZZrO0XeB7oddmjUFHDeCZuq09o6W4o3F5l679+WsVsjdpvVjrBPpYqTziW7ImtZ350k8
         p1iBOcySHX2sS+BpiR9BlFHzYvx1Xf5ON00IpOEVWKdWm1jVnlRFvOGGzkWOZ7Fji893
         S8y5w1WZGalKSlup2KqBhICVzJi2gliF55C2HldJQMjAtm7KkLZy2sC67sVDx8rhKCws
         c1q3Kwib5FBhJNmqRxDoxocCrWBe2NOGQ4Hdek/jYKrlEBbApxyLcDVCiAAO6dN3AfZl
         nEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581073; x=1796185873;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqCAbsFv75X8FpT2kuDVemXn9DMtQ2UrANDaKURHbUU=;
        b=IX1JScLMgCbXewODnRK9QayrkHONF0hjV2nl+qMZVFOKpfIRVBZXMRorR/O+5p12EV
         7vA6IhlRYmBXMe7gUGtFFwJXE6ObXnbevnrqlE0S43qdzFjQuZcawSGSZkZock9TR9LF
         NIiaafq0U1OTRL6oIQufgFhY0yh4PwLpq/LWLg5Jy/Ql52bmm6DdCxn1IaA5jEiaASNf
         ymPeRR+kit3EIDNNushsvt6mYB4EPLdkz2qiLo0S0EFKAwMa/l3nKNn7KYt+gU1HDWgI
         OivZ1085gPVI6fpjgfAyzqcA4JQic73XEw0PJKi8M6lw84cdQV3TBucPMAfCVDgqTHPF
         faog==
X-Forwarded-Encrypted: i=1; AL+hErG2w27QMCcke6eAlTCRVwGwVpw0MQ+L7hvMOYEthm6XmJdTcVRayDGn6YXiIytlLR+9NocqJtHeAzL3vgv6UzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oPIikeXNtciI1Sd8TPPHKwIb3/REDW7ErluFKYI1SfLKYHqtG
	+VTS9EF2a6tcyKgsyyRzFfTTjW19Mp5sRBUeX6vqv+y3XlpHhvXZGOo=
X-Gm-Gg: AZFdTZdyVxPUy16kxcE8kaRIPKSwIkudpMnhJ9PB+ZYhM1McRayeVnVqUGUUCtfK5Ic
	lFhXiLsl8YmRT5YjICS+UYBrsQchRmDQkTH1sujTAbHaU3wS82FEaTX/YinXJbQMV+HXCWeeQEG
	2TTCeOiNnfc4EVv8pSmM2d8VFXePP4qK3UFopgXc92bNwGPKOZLq1KF6YkO1PJNaWwfPmzJ2vpg
	bh3Ia5eGBBduYka1sGXzUCTixq728T/N7Ld+R9ZqUyKsmGa1mM/J4yOVpJJmQmuYisJU2lQvIac
	Fzs8GZ8SWWb5jyuJl5h+gY4CEMaw9ADai2QZ6NOzp0AK2+Y4LR76/0pCtj33FYEqrbkkJ3vrRtG
	v8oHp3sscj2NysFzwYsficnULuUywa1xQeY3Oxq/+BeSrUvidfMsFdoDwyyUamXMG2P3G1FkJvA
	FHWaXBszaShHKZrZR9P1tlbnf1taYD9/XqBCCJ+sVm1aQDuMhrkdE4YTbktQ4fcDAHL7WP9gu7O
	Z0tgOfk87HAUugkXeFSZl/Fk2/V3ga2p0nE3Q9NuKv5k1+u28IRGRF6K3+u0hRX4jAQZ8QMaCZo
	oMQb09upFyxkFPFMDLrsZqYhhbsLkKXlneVc4iqvfTMcZEgnvklk8lRnbp4a3gVbLo0JwQC3xBf
	IE57jvhADxk4VZNpUxmysFFxkcOs+TeHKH7cyrydia6zmV2IcBhjL0RFxOf/2IoL7NIT49F7y01
	5SQ2SWhiI+97Q9wQY=
X-Received: by 2002:ac8:6545:0:b0:55c:f5a5:3900 with SMTP id d75a77b69052e-55d76aa8574mr311966681cf.62.1795581072923;
        Tue, 24 Nov 2026 20:31:12 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8absm143087821cf.27.2026.11.24.20.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:31:12 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Wed, 25 Nov 2026 04:31:11 -0000
Subject: [PATCH RESEND v2] Documentation: kunit: document --summary and
 --failed
 options
To: david@davidgow.net, brendan.higgins@linux.dev, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <179558107134.36587.13120861622026385297@gmail.com>
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

An LLM-based coding assistant helped draft these entries; I checked them
against kunit.py and kunit_parser.py.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
Resending: no changes since v2 (26 Oct), only Daniel's Reviewed-by added.

Changes in v2:
- Moved the tool disclosure into the changelog text; the Assisted-by
  trailer is no longer described in Documentation/process.

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


