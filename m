Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF22931FB
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 02:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784860405; cv=none; b=JP1H3dSoauRcCHB4AQlpbKyFKepR5nQMNO6rx/+JdytYSndBpdbh58orVCE8CqU2AEjTPinTNFXCOh+vuy8rPT8AhkVRS6V1JsjTWQ2DW4iUt/8q0qFPNdGKph3X8j+zxNIiC4VxgBYIT453Ya8BlMMJ62TBWa/TvoWvMdpa+VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784860405; c=relaxed/simple;
	bh=nuRw+6p67qaHazyhijHeIaFQfYRohH4J45oaItgPOiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K97517qwDIA96f8CNLLfzLxCaUV0Zo0srTZf9ChUau3fXqprwJo0n33UsL3sfvakjLzdkSxMdETVFFBhEG5/O7OMlPGYTA2/E/MSB6vIGJUuS3pdJXPqEBw4TGpG1/xNeucfdkGebJk+otm/P0StTKRauid3XMKG5fxGX5Q72Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8n8J0HM; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8n8J0HM"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cace91f112so15732475ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 19:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784860404; x=1785465204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRpZaMx5e+nGKMC8zc7uMAUN5qp/LA2gF83ppDblymU=;
        b=a8n8J0HM9Zy6oat7WvZ60201RtAjbz9f5A3n/9iz/qgVXZysY5xOiE8I1GaCYSqqHo
         LebkMdsUYP9/+dzDoLwCvE2LsjVpWsSqmpVzFXkfyW5/4voOoD6VgTmlNGJYnHZgwtox
         WC256pCSexpYAp9AdCGWxxijmSEZJ6M+n2mEPjptkUE/yOWeioSBul6Xgxhcj8PQqN2I
         l3RqHYKWcQwR1KOwbTIqBfT0BEhAfc5NCbp4albLBQaqKmDprXFFmf7DY9aEWHUPfaYJ
         LM0K/4O+2c5WYF+MP5YtAgQRNoD90ZFzRKsKIKeARfsl6njp+CXYf0OEf90qtQ+czcD3
         sDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784860404; x=1785465204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRpZaMx5e+nGKMC8zc7uMAUN5qp/LA2gF83ppDblymU=;
        b=XOawmM2y1L5gYB6LO9oqI4rO6wJS1U/Aqfi4p7TxlmaAlyiJFp9jy7w4vGzeH3pZRQ
         ctejGsPtMIS1FJvwbhBS+dRpbU5xGCfTWk7fZouZ7vIjbyWMbG1mi0zwBD+FXPdfP28/
         H9HnRTeFTNTFNghFhA4z8x4MsNqxis0w2foPgeylFX2t3EiQvZ5kvNrdyVPkeh+46ZVK
         psJDvq7usMEjFJnk2LQJhhR7XvOg1rPZPj9E9mbnterpycQfAgwmN3jyWr1ieQTadytt
         3XjNy0VfLOe9WfiP6Q2zEtv8Ht5QTf/w+sh0FYF1QC0OTTpMdpc9hQqR/zJHkXgXrASl
         rhrw==
X-Forwarded-Encrypted: i=1; AHgh+RqWu2K/aYVtf0Y2VIQ1GHatv0Y5N/3nugIbNj5PvfJ/Ef/B/FJHNSyFzl/JfNfRv1+bhc3ySbJRUssa0Lpw8y4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVv7WJMxyxdMZQtNjVH6oskknnYhyYFA3PFpTGqR7utIvJgYed
	nDtRphM7QpCNQ94wKWMl6MkeprV2MHmPO0Q8g5Rrkr+R2gXpRp6lL51O
X-Gm-Gg: AR+sD11nQjsYS4XbZ6cA1sXHmtV9NHG3aEFKm3k1CNXWfQ1ivxeTBQvNTfQymvP2u+6
	thpR4t+hT1N3RCr7VHekybM39MewOJXFlycZRgqnR56OrlZLmzlKFFFYu3D/yZcCE9zKXlHe+GU
	MuN7St0CmxcRTh2nyRsjHUB7QHPlenwW92yZ82iI/4Mt+uRGMlJ/7C0x3r/UoDCFAUUqWWPQFgl
	WhV/JXFXcp1JIkrDTYEVnfoBH0j9zD+AOAhH8S7UOtFdc7+fEQcRLDLlXalxq6TF8zwgiLFBU5h
	wNTWRl09ToOb2VbOI9txflqgPoqDd+VpE8Zwqe3PMrvR+jy5PO4aW37AgRaBqYsv3T1TYZArAma
	VXpSqgqC32YeyJkLjYJ8vTujTSDUmIVlapXQBsf/o8oN6ro0nWNPfq12d5DblrETxWp5ZpnvHT8
	yK2HOFu29d3JIKjA==
X-Received: by 2002:a17:903:2341:b0:2ca:d975:5bbd with SMTP id d9443c01a7336-2cfa6b995b6mr65133375ad.20.1784860403839;
        Thu, 23 Jul 2026 19:33:23 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f350560sm43044905ad.68.2026.07.23.19.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:33:23 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 4/5] tracing/probes: Extend max length of argument string
Date: Fri, 24 Jul 2026 10:33:17 +0800
Message-ID: <20260724023317.624074-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178399140457.27810.11387684872148824707.stgit@devnote2>
References: <178399140457.27810.11387684872148824707.stgit@devnote2>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Jul 14, 2026 at 10:10:04AM +0900, Masami Hiramatsu (Google) wrote:
> -	char buf[MAX_ARGSTR_LEN + 1];
> +	char buf[MAX_COMMON_HEAD_LEN + 1];
> ...
> +#define MAX_ARGSTR_LEN		255
> +#define MAX_COMMON_HEAD_LEN	63

Keeping the head buffer at 63 avoids growing it to 256, but it also
preserves a pre-existing truncation of the kprobe/fprobe head: both
trace_kprobe_match_command_head() and trace_fprobe_match_command_head()
snprintf() the symbol / function name into this buffer ("%s" or "%s+%u").
Kernel symbols can be far longer than 63 -- Rust-mangled names are
routinely 150-200+ chars (KSYM_NAME_LEN is 512); I see 199-char symbols
in /proc/kallsyms here.

This is the same delete-/match-by-command path you just fixed for the
args matcher in commit 15f197856d68 ("tracing/probes: Avoid temporary
buffer truncation in trace_probe_match_command_args()"):
dyn_event_release() passes the symbol as argv[0] to
*_match_command_head(), which then calls trace_probe_match_command_args().
The head runs first, so for a probe on a long symbol the head strcmp()
already fails and the probe cannot be matched/deleted by full command --
before the args fix is even reached.

Would it make sense to give the head matchers the same direct-comparison
treatment instead of a fixed buffer -- compare the symbol (and optional
"+offset") against argv[0] directly? uprobe already compares its filename
directly, so mainly kprobe and fprobe would need it, and
MAX_COMMON_HEAD_LEN could then be dropped.

Thanks,
Xusheng
