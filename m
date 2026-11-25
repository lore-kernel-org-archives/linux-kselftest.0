Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612350;
	b=HKjp44yEPoV9CVIpA4C675WH5gwEW1aErOYNx5HENhpSibaGOPcXbtARjVSVDjJH+Jcx
	 FSO2h9h2dWqEEzVGC8okh0VmnCf+070eXPi0zpP9zNdLdV/tFGxAowTHicCedvMiNZM9F
	 EuG8tyVxQ1OKYibcKMWZ7xbhIayrgvCJsEPI2RoVI9MgJaXl1KPL3Y8HmKuAPxtzkYiRW
	 jww1i/TPzP0fBP5H+r1aGJaDZ/AQWOIoVsg2b8Zo2Ta2T6JlXTrFx6/cUio2y5c9pJCR7
	 1N9q9zci8VxAHM19BnXFy/9afVGzrbvhXIbTN4I39+8cibws+lghDrPUU7tcRGnordg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:In-Reply-To:References:To:Cc:Message-ID:
	 Content-Type:Content-Transfer-Encoding;
	bh=UvrRlNwsml3xyPKp+kC1AP2uPPMG8CifNGrPGhS5eEI=;
	b=TvcGVO4vwgWyq4c1/SzZ9upIWNWD8CECsAbEwxjvns+kjIo/n7k8y6DXhR90gePkxYqD
	 NFjmnM2e1DDhBOSAvpORa4wl4aJqHP4j1CDKAT+kWo4x3S31hwkFR4/KKhSCq3/xhF8Ii
	 3GglS+nyGzpBClDfnHmcVJP9g3STRhrpFbXN6sbjk+iI6IWCsFFf0WHNOzxBnf7YJW15p
	 d16G3mWq8yobcavix4j9Vvr5Z83K0ph6wG3lohHpISDTQjH9yQmGqcpGt5akNCSx9uw7H
	 Zi+E8G4ImcJ80Q/ERkdGgT6lNtWM2GhxrfGCajpI9c8qmu6equ9dADRq9oXur9mNSCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNbG6lhM;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8393606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 13:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8393606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNbG6lhM
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5364042eecfso72070761cf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 05:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612349; x=1796217149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:references
         :in-reply-to:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UvrRlNwsml3xyPKp+kC1AP2uPPMG8CifNGrPGhS5eEI=;
        b=nNbG6lhMNlg9s3RxRiJNbZFCcJfSZu9DNa7mYpBntzBscZz1jH+GJVdRxODmIBn/XH
         9T3QeSZ0dBdrShV+5UTQlvRJDGWmaSFgwPG8xaK78m9+1IsZbQZh8uwdbPQRLpLbeQ4O
         xVf9SGqpPHCiDraZ/vP2iJjFbnzcI39gmq/x2WCzCnLx8mO2lMKqvHamXx7lbVYnXZLk
         hcuvxmVxfNp9NbLMuVJ3iDg3B8wRXBSTMgQwkQF6CqLuXOfDj+xbdovSj5yUEFllih75
         XhL6PeZGqPIxDJiSVo3a5v8EE/vrplOfFcWFgb30mkGU9pUBVGKlZqSfFrPBsPBaAqh7
         Z59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612349; x=1796217149;
        h=content-transfer-encoding:content-type:message-id:cc:to:references
         :in-reply-to:subject:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UvrRlNwsml3xyPKp+kC1AP2uPPMG8CifNGrPGhS5eEI=;
        b=y42E87WttFTrNHfdZ0dRbXiRgMq11HGBwA4UXmI2a5S+wdwfwf2zcZuR4Z0g/qJQQ1
         krnCYHUSoZmGWMFuehlvad32xivMoj56UY+oBAQcYmA2tUhk9nMSFsWCih6je18O9ZsL
         GlHavwQkWcoRgYDoypuaguBBL6W7d0MvDXL2hseiWFphzA/ILVZX87Pxh2cdMtFHHg5n
         03yTOFN/vluk4EEYnzBDqj/qOMaN33XP4KyuRBEeczX/3PNnuy80RZervmmycLMSbuFp
         q7qXytTyjbkzPNzwX2Q6nEezFK05NT0jtuYQ2KRF9pYA0IJRqLmB8w0PvU02hep0RFaS
         Mo/Q==
X-Forwarded-Encrypted: i=1; AL+hErFS2JRFs1aP6v97QvG34mWGz9Uah7akujFbcv/TkAya4S5hx3uQoRqZ97nNXkXM599s4H5rryztIgEauJ3Jv40=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UoxCdwy1pd4QWwoCA/ZSMfA+n1JXz5oJFrF2nOimFbyhcyWY1
	xky/BwVrF2N3iL2tnjcvIPFi2tPrTOLR+gt5fry+fvVk2AXrrEljLaY=
X-Gm-Gg: AZFdTZf7s1Exryj/SAXof76HxdB1xpfi5+QMjPrAHTqE/DGsXR2CwM402BJxsCEdPCp
	NNuuI1DR9NTo4TJ1wOE5AbQeOCQlUFCsHoCfx1Iiq92owHfKUw/JzEtPCyCGyOflY8b9hRY5Yc1
	Za5XXQnYTJ8v7sIrCcp1HP5oKZIxYmhNtg3RBLRWMt4i2X0PvxNvjbYl66eEgqAFAqkNaMmaGG9
	8CkeBfcdFTQFLRIzjOh3/8jpJxaBBnOKKdYo6gma0l9JEhsR6ohdiAWYA+K8rLlRtErYpDHLg7/
	fn9LUDc76aw6wf/aUcHMBdR3MGB5Ca7Ru7snbgtxSNnckHzQR9IcqAyk5iWZ+JUCXHUN767VH5X
	i+3HMUSDKlNPBVk+0eUY6PEamKrh5IkH69nGXcERlIsgg2Jq+27vOQ3X+x1UZ089HmmJFtHY3rZ
	1alalp4YxbPhRXYrMAjrfLd7gYE4KLBZBQrtWh9l+OYTnNjWL92dtKtz4lPdiqYxKQgWkgU8wJr
	zlnP03cVlfXPrjFxCvCaJaqYAk7TF3ndoTal8Qi0ZvekuM102JMwzKd59P4EJFLKQJp/+hm2ok9
	JkWmU5/rgYzXIUwyA91Mld+i0yWogiYYTUr7raoxo9BuNcLky6px/pD+xHEzHNF+rqzqVa3CBj7
	Ytv0kfC9vB1B7cMwKNLrvewdO2upVj+jIGrEv4emxn94FsN3P0Navg+oXzKm7a2CsxdW1bto=
X-Received: by 2002:a05:622a:34f:b0:55d:3695:c1b8 with SMTP id d75a77b69052e-55d768a24f3mr359297361cf.11.1795612348580;
        Wed, 25 Nov 2026 05:12:28 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm155981971cf.28.2026.11.25.05.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:12:27 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Wed, 25 Nov 2026 13:12:21 -0000
Subject: [PATCH v3] Documentation: kunit: document --summary and --failed
 options
In-Reply-To: <179561234149.225312.4673144866194884043@gmail.com>
References: <179558107134.36587.13120861622026385297@gmail.com>
 <179561234149.225312.4673144866194884043@gmail.com>
To: david@davidgow.net, brendan.higgins@linux.dev, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <179561234149.225312.11200387441465771003@gmail.com>
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
Reviewed-by: David Gow <david@davidgow.net>
Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
Changes in v3:
- Reworded both entries per David's suggestions: say what the summary
  contains, and that --failed hides passed and skipped tests.

Changes in v2:
- Moved the tool disclosure into the changelog text; the Assisted-by
  trailer is no longer described in Documentation/process.

 Documentation/dev-tools/kunit/run_wrapper.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110..9e0d83d 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -327,6 +327,15 @@ command line arguments:
 - ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
   saves to a file if a filename is specified.
 
+- ``--summary``: If set, prints only the summary of the test results,
+  including the number of tests run and how many failed, rather than the
+  result of every individual test. Does nothing if ``--raw_output`` is set.
+
+- ``--failed``: If set, prints only the tests that failed or crashed,
+  along with the summary line, once all tests have run. Passed and skipped
+  tests are not printed, which makes failures easier to spot in a large
+  run. Does nothing if ``--raw_output`` is set.
+
 - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
   Multiple filters can be used by wrapping input in quotes and separating filters
   by commas. Example: ``--filter "speed>slow, module=example"``.

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.34.1


