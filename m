Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902704AF141
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 13:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441756; cv=none; b=ME1zMFx1rTc6hoU7DrKepxQAUUsoNE1z2uA7VO5fbQ/dqzS+LQ+l8dQfU4mq+3lBvPkGe5MP3Q5u7YcGcCovCsO8F7ZrTUhMizz6spjV29uJcabMxuebFwLAIKotJXREnk6j/PR0ijjmP61Dou+xyg3jGjTeGk1xIVbszTCvJVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441756; c=relaxed/simple;
	bh=fBeMkFaC1Cs7R3UZ2FEIJChYmhbI/KTvKfsZ3VllDtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=srJS6957uPmgWDVJz8SfUEg1fuLKDDT5mijtSz3xqmsQMyRsNi6U/NkYD7eI9muqQMuyQ1rM9VK3fSmhAXNArXk5I+JsF+1aLX3WB4U/5Ki/CSd+7bjwOMGhkOIBdXkdycLwQ74zL8yM8YrXI08KSOcfFwpQPfkfolOgN0ar058=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqZFWulg; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqZFWulg"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3530962a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788441733; x=1789046533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fBeMkFaC1Cs7R3UZ2FEIJChYmhbI/KTvKfsZ3VllDtQ=;
        b=SqZFWulg7KvcXlqEnA4Lw6rZd480mwzZMQ5bt05xAUmms0+5HvMJwskTIzh377Em2R
         2cdJgjV/FAUdd0FhH3G7v4uJcWoo3R8fJjPKrJ6U121eVEBGDyhkkK/bwG5B6DdO3yXx
         mCuX59Nb+IW0esKBCg1ccJ/Kq4B6YLt5dpbxahhWG876Q/biKids7bDiP39jU0xzz5L5
         q35LThB18mcFz1TcyQTjq0TQOZHTRZDgqkKxJDnSlbJmC/naWFxpBGLzv/fWr7WW+LFk
         BWZ/omuQQ/Vmypxl4mkYfLb5Swg0VGDFEAz7PSFsRbpPp6S24JD0seJBrsvl9iDqy/mf
         ++jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441733; x=1789046533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBeMkFaC1Cs7R3UZ2FEIJChYmhbI/KTvKfsZ3VllDtQ=;
        b=ZinOm9H0UVB4f0xC1KlfA7y/HJxallZMsjg8WYPUJXtAXiSu5n+U5uE8Jod0oWDwN2
         kBQryHUk7QSyhNFc4gSpU08yhHP9canvaoxBKGqfZqHL6a3/fQZJs0yMaEmANEd5Iq2/
         UV1WIwYLQB9XzSnicHq6llIM2QqTvvdnYqAXQiyZbVW3zfov2I61qjQUl7GqDnJT4TGV
         9j4eVP2XA3+faF425QJfJPulcyMmljt7ZXVUDzyUZAbjs/qOjePX9MD9TW6dgyTOQOhV
         BO95MLQQDx74rRHmT+/TIC+5xe/RrMuXblS+cVuw9myPxsIshVEmrHl7g9SwVN7S0J55
         elew==
X-Forwarded-Encrypted: i=1; AKwUvBxt56HD+QYTh68E4tyIkjCRtria3qf8ICfBjzYDNpEgo7cg09W0tQv0Uyp66d8oznXip2dXPAuhCvrxXRtWP7w=@vger.kernel.org
X-Gm-Message-State: AFuF++lBZ8pKCot/bWznCfReDEdi0+C4dOsgBgpO1nxPFxiHvtUxH9Vf
	Kf0OqzLW/uJUQwaeCsYocobdXSCtoyVz+qcxsORKZKG+Xt3fKdxqJZ3b
X-Gm-Gg: AYBFou25bjvFzosGIGNNya59XZHJguDk6Lva1RBKsiOKcDvm5h8EXU8cvDFf7cdHzoe
	YCGWWTtpJFlZmosluhXEdJ0mUcXw93pgKwwxoZnDJFiYFsrpEESz/K/m/lSUlQuepqybhXGETX4
	w7/Y+q1RNVx+j/DEQwGcLe6eUz0x6eFOtjg8FjZOvOHoqknOHUFgCOAxhMy9PE6KuGmMyC3zD/j
	TrlVQ8xtqyQlNLGdKldX0wpPPbAfgCohs2bBRsJlHnKJeKVchYuDVuWU4GMhwYPbj3isfK1LgFu
	oAMXINeaaDMWfBqBygkDdVjdb7Mb3+kmurBP8vHs0Dh+NxqZj2+0fqHh0V5wVqDWQTzKAOQvC41
	KaWL2VWZxI6DNDVHV3eVyYEk6RAF8A4BdyRMKsF4+CkT0JiqYHhYJgKTywEaxzZndCSpsEh0FHD
	BVU0AJLaC8hZ19TjuSRxbOGUX/hDKUNtiHjeCFOAKXzB6BVPXwXFatECuBcFd6JkyCvtJJpY9MM
	Vo=
X-Received: by 2002:a17:90b:2808:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39aee1c63b1mr20007782a91.18.1788441732646;
        Thu, 03 Sep 2026 06:22:12 -0700 (PDT)
Received: from localhost.localdomain ([2408:8607:1b00:8:d43b:6dcd:a4e9:1d79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07b197a9sm5407729a91.0.2026.09.03.06.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:22:11 -0700 (PDT)
From: Pengfei Li <ljdlns1987@gmail.com>
X-Google-Original-From: Pengfei Li <lipengfei28@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v5 2/3] trace: integrate stackmap into ftrace stack recording path
Date: Thu,  3 Sep 2026 21:21:50 +0800
Message-Id: <20260903132150.253372-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902065433.2D6361F000E9@smtp.kernel.org>
References: <20260902064242.28606-1-lipengfei28@xiaomi.com> <20260902064242.28606-3-lipengfei28@xiaomi.com> <20260902065433.2D6361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 06:54:32 +0000 sashiko-bot@kernel.org wrote:
> Could the commit message be updated to reflect that the buffers are not
> cleared?

> Does this code unnecessarily export tracing_reset_all_cpus() outside of
> trace.c?

Both are real. Fixed in v6.

The commit message was left over from the stricter reset design that
was dropped in favour of map-only reset. It no longer claims the
trace_array buffers are cleared. ftrace_stackmap_create() still takes
the owning trace_array, but for a different reason: the text and
binary exports run stack addresses through trace_adjust_address().

The export was indeed dead. With the ring-buffer clear gone,
tracing_reset_all_cpus() has no caller outside trace.c, so v6 restores
it to a private static helper and removes the declaration from
trace.h.

Pengfei
