Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D1F44AB92
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 17:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520327; cv=none; b=UlmyGz7+Y74MMEhTSLiW0QmmVgf+Z5EBc+1W4khhNDOXPBpwXwrJ24SBWooTeul6ewDL9I1MFmM0ZPSoCrNGEnctAz9tK/ikD0IIRfibbpamOPrDpzoSmaVZAPC4Soe8l7pIFl+NEQf/bMH2Bo+bChLbpFVpMsrfPnfDw3F0kqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520327; c=relaxed/simple;
	bh=0EHZSXZWmDohLu6impw6EoIqHr8a2I0Rb8/ORbbncZE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A8HKmpP7mjvarO+tW71CHXUpH1ykMTOlgPPe2Lb1l5bRwJ7aeR3ihphSAFL6RgYGpT73y/QJLEtKH+XtKsovdxuXpAa4rNltJwmFpieJ4TcbEMcB0L1AgipPankXgIqKw28c37JpM5e+ihTpMVsu5/YkoxYXfMi+0aiFJZjKWrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--shivajikant.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y+I6FlVi; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--shivajikant.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y+I6FlVi"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso779033a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 10:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785520322; x=1786125122; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzxzaArWF5mA4vQFBpkZwR8ND0B5r/Z01WR537lxUSI=;
        b=Y+I6FlViMQiocp2PZ4LNdNmHhxPRy655v7x4QBqB1QMqvaXCRzoQLPThshKXfjKRFx
         8S+yEt3dkGPujntYb/Y3rZQbGeeOcmECwqzuBy3jrayQXPq2SXNiTsBXAtYrxqUX09L1
         YbpGKCPxyEclG521K1+HEPMrxpiwiMqYnJI/ch/fN2nVQAo3fJ2lrDIGdU02RQrtC9/B
         vI7uUFB5XAcayeNzJI7PxVlA5/FHOj9aGlXBF4zl9eRarwkb+gmmEFhSnYL/By3TCylz
         4mTUuJd8Aq4b2mlZxuFWMXoEnmagShGpvRQfDvLo97JlqvFZtnTmt//3tAH7NnZ/lOfD
         w5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520322; x=1786125122;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mzxzaArWF5mA4vQFBpkZwR8ND0B5r/Z01WR537lxUSI=;
        b=LF8ijeXkOje4v5aWgaIiCHWWP8NBxmhugdIx3R8atb4OjUVRO9jUPwbCsUdqvjI70p
         L4T7ck0MQvRUL//BD8QXoYB21mnnH74DX2Mkrm1KkqoAUcOy0V9XK3+uX92BEIRgWh/M
         461jVDr2As7QA8hfkiYYvH74fUdHrpsor3GuCeLmW4H5lMcPZ2h37ZXoqQbZq2rcPRSj
         Pazev+ZwmZGBWUjwIZ1gylZxLZar2Myxw0KtWzPGTA63MPGrHENPoItPzhKvSQXUw4HK
         ibvu7NDTStiNkELP9kBztGHurMB4h0fxGgL7i+FnuexVk9d3QEw5W9dqBakt+UtcU31I
         ODPg==
X-Forwarded-Encrypted: i=1; AHgh+Rqixz0HTzBBTygX1IByEUoCGKfXxm3YyXp/ESH58xMc7Fq2Hs74uWvfUzk7FM6dzRLsgmJsGa/M7CNamgitryQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVzJvdl2dWvZzMvW2DXkDGRQUreo9Yc70NBW95Zg+Aq+xGhNcy
	Ohpbhdshbtfs13JE4DULf/Dey91ipao7fCp1cS53Ema/aWMdgY03axm0iu3sLCUpMy00LHQpzUg
	lS4H3IhgSzKr4dclXopAgp4HtRg==
X-Received: from pggr14.prod.google.com ([2002:a63:d90e:0:b0:c8f:f76a:4b22])
 (user=shivajikant job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6e03:b0:3c0:9c19:b275 with SMTP id adf61e73a8af0-3c92ab2ab0bmr629681637.67.1785520322263;
 Fri, 31 Jul 2026 10:52:02 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:51:34 +0000
In-Reply-To: <20260731175141.284757-1-shivajikant@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260731175141.284757-1-shivajikant@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731175141.284757-2-shivajikant@google.com>
Subject: [PATCH net-next 2/2] selftests/bpf: Add IP_TRANSPARENT and
 IPV6_TRANSPARENT to setget_sockopt
From: Shivaji Kant <shivajikant@google.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org, kuniyu@google.com, anubhavsinggh@google.com, 
	Shivaji Kant <shivajikant@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
	Amery Hung <ameryhung@gmail.com>, Hoyeon Lee <hoyeon.lee@suse.com>, 
	Leon Hwang <leon.hwang@linux.dev>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Add test coverage for IP_TRANSPARENT and IPV6_TRANSPARENT socket options
in the setget_sockopt BPF selftest to verify bpf_setsockopt() and
bpf_getsockopt() helpers.

Tested-by: Anubhav Singh <anubhavsinggh@google.com>
Signed-off-by: Shivaji Kant <shivajikant@google.com>
---
 tools/testing/selftests/bpf/progs/bpf_tracing_net.h | 2 ++
 tools/testing/selftests/bpf/progs/setget_sockopt.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/bpf_tracing_net.h b/tools/testing/selftests/bpf/progs/bpf_tracing_net.h
index d8dacef37c16..58b791e03a2d 100644
--- a/tools/testing/selftests/bpf/progs/bpf_tracing_net.h
+++ b/tools/testing/selftests/bpf/progs/bpf_tracing_net.h
@@ -28,10 +28,12 @@
 #define __SO_ACCEPTCON		(1 << 16)
 
 #define IP_TOS			1
+#define IP_TRANSPARENT		19
 
 #define SOL_IPV6		41
 #define IPV6_TCLASS		67
 #define IPV6_AUTOFLOWLABEL	70
+#define IPV6_TRANSPARENT	75
 
 #define TC_ACT_UNSPEC		(-1)
 #define TC_ACT_OK		0
diff --git a/tools/testing/selftests/bpf/progs/setget_sockopt.c b/tools/testing/selftests/bpf/progs/setget_sockopt.c
index 636a7cd8e2fa..d96e99b67aeb 100644
--- a/tools/testing/selftests/bpf/progs/setget_sockopt.c
+++ b/tools/testing/selftests/bpf/progs/setget_sockopt.c
@@ -69,12 +69,14 @@ static const struct sockopt_test sol_tcp_tests[] = {
 
 static const struct sockopt_test sol_ip_tests[] = {
 	{ .opt = IP_TOS, .new = 0xe1, .expected = 0xe1, .tcp_expected = 0xe0, },
+	{ .opt = IP_TRANSPARENT, .flip = 1, },
 	{ .opt = 0, },
 };
 
 static const struct sockopt_test sol_ipv6_tests[] = {
 	{ .opt = IPV6_TCLASS, .new = 0xe1, .expected = 0xe1, .tcp_expected = 0xe0, },
 	{ .opt = IPV6_AUTOFLOWLABEL, .flip = 1, },
+	{ .opt = IPV6_TRANSPARENT, .flip = 1, },
 	{ .opt = 0, },
 };
 
-- 
2.55.0.508.g3f0d502094-goog

