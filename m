Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811560;
	b=TZ43onTqUGCiRtbzWLw4N74zTjzlM8BAfxomjn/Vu8GdTJKxHqjAXBXYWkHgqeEXHN7i
	 J3gp1f1ObwFWfuND3r1is50Vr30Y4cWxeiDDEZDOpQXzUI4yg60VyW7Z/7sUZQSGJdV/n
	 W2yd1wsHJ1/rAM6uhOWmExJZY6vXvIqXm6hoE3jh1N5+WudsQw9d7uDvoqnIHIf0ITrgJ
	 z6WUJvafXMxXnpjxwC67hiL/rWJYsChLVHVOk2HqlOoa24PfGaEmznuVcFfq74tfICGVZ
	 L4RcBQIfkONq/bagRo3PPkqEmH9XsY5i38lP4dZSGO+J0221wKZhnSIjZrx31jiUE+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ccVf83RTacEiSDDfp2h5xNH+o9FDf22bxraZEScVifs=;
	b=1wuOg6nNgNs3Q9k1iV6FH4zGXPMqxPqnTJm129M4OJFK8Tl25yI3uCj6fGcdCUjXp23f
	 ukFWBJtVlp4owHySer/vLOcfxxMtdGHk6Bz6nlEnd+GmEtV1Vx5lUshHr+LNgQLGPabY7
	 r45FEMr1W7oHdMUsAIWvXakUFHQZfFOUTh6hOlWjxtzuItn8ofxWKDJ3rndR0HDnbzmys
	 5awRFWtgWua2eucnXrfAoxUCrB4AVXIPywK8mH2OnczUmQiZQvl//8r5m2nJHQud7Nhe3
	 tmZtze+cES6QbgS4aww2f3cwCWwRrIJtZbfPlem5nFxgCCC9KOiNW/unKuvrqWmYGQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srwPcV0C;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2DF606D829
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B2DF606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srwPcV0C
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3514b90bb89so1750781eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811560; x=1794416360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccVf83RTacEiSDDfp2h5xNH+o9FDf22bxraZEScVifs=;
        b=srwPcV0CMrFf09RumsTb6kBXvwJSmyv7F6Ok6cQb4RLoNTiP6mDJJ41AONoG3IBegg
         379AGoSfjaRazt2ZxU+Y67WdxSbYjW8t6oX0gLgWERE6FMNjvMjXxcOd6Ktdnc/OnQhg
         7CkFVW/HO4lzzZI6IXqVLY7dzdszcT4WWgR0uw+rX31a1/YYlmIrQ8cwUbAIuGACbM6w
         vKAA4UG+0TPX7jAJmab/BP2MApuRxmhM4c5Sb5Z5knQDN6HhMTR9IWNkB1xVYiZxbAIe
         H2FBfin851fcltS4cy0iogqxcy8G6CzVVIxlrmHwDWg2Y/Rj6tiru7Gg2HoezRX+hjYr
         SwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811560; x=1794416360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ccVf83RTacEiSDDfp2h5xNH+o9FDf22bxraZEScVifs=;
        b=GOi1nzn6CWRrpSzeD7v8n7GbKn/WjAXCpfVpexVIiF70OuKrwik+6QTB+5gMwoxVTS
         TCfjt25EhInEotYOGfroY6oKuvKgEIaY7MIvyW4zoCSZnu4EGq2UTWAZRTW8+FeA6MW6
         fY2JV59G1QTSAsgTawFbs7PAu220cFnaj4qBQUy5Iq3EQX5LIJ//BSGHQZROViIsYLSC
         za+7pFhnwjfflx5PecM6dyZiR5V4tp6O2lj9yiyuqrTnSOMq4TvSRE7gkJA6yA3W1sHr
         idU8rMtk+g1QJx11wq3BEEhAJ4DkAWeadVSDbUKtKkE0Q62wYWIgyfiYAazyWXm069V/
         ofnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiutiF0PTafgCAsS48YnadIZpCFKyhUqdGZEB4SLJsIv6iP/yf6vkqiJhyikxPCyCy9DxJgA9dperyET67ofQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z97mhJNebncMDx2KPAUWyRkvepRND2SN6ELFh4Z4QsD921gmCTL
	pP5g1iwxRdrj0jydsKmxWfNmEd4Zs4QBRNwC6EK2H+Fi13v2sLkUaxHj
X-Gm-Gg: AYBFou2o/0MnlqUOBL6TwQFdorVRudnbrxDjhQ6oguXTgsgfaD42MzcKcaNNTwrncL3
	zhLjt/W1I7r26BRp/R4zhht3MtsFy3A6jnYqps0Wz5A70yW8U2KpTfountW0aUES9cmwY0cZPkh
	SqxjoWaVtSVjT2INEKb6/DQ4/fMTUmiqUqqwsee9eDMxYkcK37s3dfbUulH0cNOOLnzVj7J+jj4
	/Oa9pupdoEgkU8bv912lhWGInJl++tLYYlDIDfJr8caWKmh/dwQI7wbsSHTyiaHjaeyJq2BIXUs
	J5YqugIZNifTWvG1tGO1XGa0BKxbuVmKEpgVC9ScU6Jr8+qbsvUzOI98jZdD+F+3Wm/X03mEvND
	yfZ9kVq+3LgxDBDZAk8YtF+QdeyaPayn2ff8GdVSohtlRzBwtFsSA4XIdbWMk5znZZWFgpcV+iY
	wDP2nFDwDfmzYF9lz4gJOdCj/wSim13NatDRDL9zsDzfIdNeqd6FrxGAEGJVloBOeHes1y1Gjkn
	4yPWlg5YBnDky9Y67UbuSpAN0GK6QMjB1QIZ557cTA+up4Uu8s6Nlo+MSgoZFIDDueaevlpysOn
	l0ulsp1006fYOkETqfEthQxH+wfM/7BQdtrJUW8=
X-Received: by 2002:a05:7301:640b:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-36a42363ef8mr22540460eec.7.1793811559006;
        Wed, 04 Nov 2026 08:59:19 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:18 -0800 (PST)
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
Subject: [PATCH 26/28] hazptrtorture: Add torture_type=none clean skip for rcuscale coexistence
Date: Thu,  5 Nov 2026 00:54:44 +0800
Message-ID: <20261104165504.2430480-27-kunwu.chan@gmail.com>
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

When both HAZPTR_TORTURE_TEST and RCU_SCALE_TEST are built into
the same kernel, hazptrtorture calls torture_init_begin() first
and rcuscale fails with -EBUSY.  torture_type=none makes
hazptrtorture return early without registering, allowing the
rcuscale hazptr scale type to run in the same boot.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/configs/rcuscale/HAZPTR    | 13 +++++++++++++
 .../rcutorture/configs/rcuscale/HAZPTR.boot         |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot

diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
new file mode 100644
index 000000000000..c5e9cf0184ae
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
@@ -0,0 +1,13 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=128
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HOTPLUG_CPU=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_TORTURE_TEST=y
+CONFIG_HAZPTR_DEBUG=y
+CONFIG_HAZPTR_STALL_DETECTOR=y
+CONFIG_HAZPTR_STALL_TIMEOUT=1000
+CONFIG_HAZPTR_DRAIN_ASSIST=y
+CONFIG_RCU_SCALE_TEST=y
diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
new file mode 100644
index 000000000000..e9cca4cf453b
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=none
-- 
2.43.0

