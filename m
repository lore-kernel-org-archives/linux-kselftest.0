Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978214;
	b=sBFuPYz547PK9M6ELEmfSVVAAZPLhxNGbYw7ngzhzPJyqPEHsTTjQI1gT0q1UvfSc1jo
	 IiLUXBuyTfnfU9XafAz+Cgjwszs+4eDdWTDM1Ct+IpZiJc2+xLjnqwSGzLaz+sTc32oOh
	 IKm1OfdKRnlblse7oHAsUlj5QQxZg6t+JoVQ3cL+p7r2qHpyJipY0cDeOLXDtZF5FQ/Ao
	 4velPzVdZdXQzb5WTsSugCr6Xqti5VYdj3n2ot1q4r9Rm4Hy9EyVJNNT5kUr+7rU6ms9j
	 HPBWTOJ3xSIFqdTemhgpamMoF3hjFdZ8CJmDxgiQK9G6y8dr9OQE94sUaulanKM3Rww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:From:Date:Subject:To:Cc:Message-ID:
	 Content-Type:Content-Transfer-Encoding;
	bh=3XwoGg+mB8JTGKSf2elhh7MQy4y9CDrVr50JHH0II1k=;
	b=iWauyg3nKFjqaExX97YciANKoJuUBBP9btvWs/nWq9o3BNTrUr2gks0A/xFRsvTptUXm
	 jrHpirYL8LhMPm0BB2vBSGUHZ1IrrWHMzqVhJljZWId79+HEsMyffYrojZ5x31GP/UXJV
	 Z0FfiDwYs+g3skqf4ifA1y2KSRyRaNXbYFrfKwqntu9t19MYsPDazRsN666TJ0YqoNTP2
	 9+e0dq5oD7sn554eQ9cqRxgfYk7KUuLeFugiWhS9YCMGsjCFx/Tgq9PiBzrUfe2kTw5nq
	 xggsQuoasE7wuQfOLAZfzypSrmX1QvkGhMp2f37imtmqgN4W+4bwr8pPLN4/jcMHfTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bN4CDDSI;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C1D606A31F
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 01:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77C1D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bN4CDDSI
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53394bffe0fso40595631cf.1
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 18:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792978213; x=1793583013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3XwoGg+mB8JTGKSf2elhh7MQy4y9CDrVr50JHH0II1k=;
        b=bN4CDDSItCtt/QdxJizZA1Za1opqZMedq/YPSVbx9jVRAv+IQ7BFhAlMW/7NWv7ESx
         FOoNXzrrhQ70rmZRcW0No3Ylb+06pJxeoqOtFVFIorI404RFF6MVzF3J07lZ+JXWLnu0
         1OogcxTj5x5ZvERUql8WIiWWtEvKJpNIRWrukVprl/HOa0/eQaodZXXR4TIWJznoPfGz
         WavttMySLc0Eu8wWcw7mvnRfL0vkXcISSk+dgoaOGTsyaoI5HbC6Hj4RuSz3JG9/T1kI
         gg+c7bDGE/WyczdoMvnqKbAXOTkO88ZjMyMyz77+GcBMs/G4//5VjKd/6u7OZDW5awkn
         5SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792978213; x=1793583013;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:references:in-reply-to:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3XwoGg+mB8JTGKSf2elhh7MQy4y9CDrVr50JHH0II1k=;
        b=SdoBGkVONrqht8/oHnViXp2ZVC3lEW5nM2Cmo1kY8UINtA30OQDUUXBg/qvvhkG84P
         pxRdGxPfYljrjuHvTMLziEpwncWLbQNaLh6Ef2aLz8IzlCy+Jbp9SswH8U2irS5ymzuA
         4frcIF58+JL0L2faw+NOkxzBzOx2gYlAXOEZYJzLOnbOnuar1/ZdY39d168xQdRta6xu
         rela+WKqXmjyO1sm8HH0XmSJpj/o2nSXRoIX8p+Q7piLtHVWDOxdDGmsnwDQH8oakEHS
         RBFevyuRBdhEJtYvUNHKfZPjLc25/rwXm0mAPfEHqjSvzs2IBUi6wMwhdH1YmXPaezFH
         gVHg==
X-Forwarded-Encrypted: i=1; AKwUvBxIGfVgyXjMKmfUJGmKQumIZGXAxTHB+yNTbS+2nhQ1gMjngW7KbkSR/a38PByDSSi0L3CWY/mZ8IZ6MAaQNJE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdFbAFyH2VaF+Uq+/Fd9XApJDXOXTLQ/YMlslHU922PC+tkc/4
	1E1QEFyqMZxEPLrG7YvH0/rWasx1SEokJTiYTMGFUPNzvRpgESbjxko=
X-Gm-Gg: AYBFou28DJzAXa+oFeiWaFcMSM18LiEBoRDR2giCbunIfXNYWd7jOo+tZB/3bPmrr4Z
	pmXHWJSUjHwRfbkz7GAmLuB5aYFtjfNZzJtK9nZnWvThNqVVFyaAaB6Qa4AwvI8/EyLmTgjGwCn
	nMXskROltFYf2sZwcQZpqvxL/QkiuF/AlX7qt9q+z1B8MUZxoyWTbJqKhTOtHb+gx4choADsAmh
	cYrAGm3vkpOW+2a54V1ugv8rk+vLDeJHcHgBAkyy7NVHiSKas1EFlIVpaww3mr/BEyTGu6Kvn71
	W6xfF07NEkrv5clZwl1B+GpivMVIloQnOTLNgFoFgw3GrCfV57G2hGdOoi47NLPNAO9/ZGlbE8c
	69Yu/SZQaPZutdUGDwd3bZRPnQ0InNreNkK3ls9WVNBeqZB5gbtKRdy82Q1ner4znj3sZ85IZw+
	gYCg6276+Hhq8++Zzq48tw1Fd1/MyVKoGEdVg518wW0e43U0ITx3bITeGqRHVr+1aAkW+WVRRrR
	inGJv6uwhEnlKI6AGXhpaxc6j+eusLbfTY31ESR8MTEP6/kJXQ0BOr63pmP3smGTymPDo6qI72G
	iJX0mkW8jCZKfkydhk6744D7hOuRuwRV+lTr5gcwUv8eZ+hpFoP9a/BSdX0GDInoz1fY4c73Mce
	1VtYnGy31Yn7VtV4pcmPA
X-Received: by 2002:ac8:5d8d:0:b0:535:1d5b:a7fa with SMTP id d75a77b69052e-5383ba8566dmr80965731cf.14.1792978213302;
        Sun, 25 Oct 2026 18:30:13 -0700 (PDT)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970a2basm44270051cf.18.2026.10.25.18.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:30:10 -0700 (PDT)
In-Reply-To: 
 <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
References: <179250646543.2190262.8632957027583518623@gmail.com>
 <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Mon, 26 Oct 2026 01:30:03 -0000
Subject: [PATCH v2] Documentation: kunit: document --summary and --failed
 options
To: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <179297820302.2598507.5712076951623488183@gmail.com>
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

Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
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


