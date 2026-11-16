Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794860851;
	b=ggZPCqrggDGxXigGyQQg9/hS3X6eSkVrr2K4/EOkU0LoDs6OtO7ELLBxLpBpQtz29koa
	 GWYezeDazWfAg/gOMEXzY6pOgUSG1APuIAUdqCrLHjqf0y814/ePBhCTDUve4+y4Ms8yf
	 0haTyHrpO94KU6yylX3g7/ord8e76q502PfVyrNHGttPd47psIBYi7kyiKAMJ3Ze+7QT7
	 U1aJ+tcg5LMJBEgrYoKWlKuQWPLDLlxNMVNx6ljarCN8tuWs86FU/0xwqk6Mpdsx5mTKF
	 HOsTQBd/Aavoxzu6PLyTtiDVhbfqP/m4I+YTM+Xa6/VTWvRGkx6OYuO7bhwIxir3ikA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZkpeCXY/OBNvM74rLLOtFZSJQsZ8WTjSCiDSW/uXQt8=;
	b=ncP4G3IAyD/wzq7fcqJX9o1lsy+PEkvCyLz9Q4G/0FWuzgnffFWT4PS00EywTu1aNOhc
	 1RamfXsEGNqf7K8vk/zQvh8q8YF7Yu6yF8HDZxwSv9jS+JcLV/iW+96FFNxDWtRERCp4d
	 NQ5Wf23I1OnaR62MVnQ99Rx8GJBKu8Y5vPtCOJ4x5arDYIUey6VqHitzE9rRxK2+MWwJi
	 PyA93Tn7kBJOj/Hf9ibjU3tE/f98/u+vaTrOgVWLO5HVgRi5gP1ZjwijbKUQDL9oE4hI9
	 7HRNE18KswCkn/I+ob6ItO6L7UBPmEYA86TvFsgTyVzOP6Zf0epTfCqmNTIXesLaMtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XUHueja7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC3D606A33E
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 20:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABC3D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XUHueja7
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so14239285e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794860849; cv=none;
        d=google.com; s=arc-20260327;
        b=BRIo31ZSiz1d2r7Nym3rTBAo+SGgYfI9l/ITaQq3+uJEuSNjcbEtZMJ/ezxVHE2bm0
         TrFRTKfMRZd5V8blkmxJ0Qr5WDP0w3DKFANh0Iii4DBloxyXgjdkNW0hOv+VThvMcyWR
         8XfqImVYzI0jhZ0VMQcwtIL2SUStnTOv204RhMkhq68z4eYJj4BlBFrjJBUpPIqFyFpv
         raAckhuywc9PN/YRroa6h30NQpqLg6IoWyT3LQXjI57bd/yNkPPxqEN/2ZowBLsWdp1U
         x7iaS2nWBBNkUbmotKRJSaULGyXIIMOjgHL4BYQaq9temj4nfkzfVTCb+6H13l4N6w+7
         /dfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZkpeCXY/OBNvM74rLLOtFZSJQsZ8WTjSCiDSW/uXQt8=;
        fh=4N9kN4v6gm4q034dtHsY5uWEevBgoQPqKsPs/hU5dZA=;
        b=FVZRnYue2ZkdfMxxtGIb2vX1oDpTxAWKu4USk3YDVhYPbhbDFuRKXedFB4N7Af64L0
         DP1UVX0FYKm2Kwavo7dH6Y+/MEasCuM+HbWQA0xVSnH+SzDWeWMOSYbJAHVkwy/eStuH
         d9lE8IKelpvSBAc1ip52J3/RZyWv6YGwLJU6vfcKDJlTlBgMAETa2uftAjieJNN5tOrx
         Znzgm5s4gwIMxLQlq7ITxrMvNgO2Klz5tJUJ7jKcHvgII84/8mQCX1M494lzkUU6EaaH
         SRn9+Ym2iMNlUa/Po4U4aXDgDduiClk+E6zEFB8BdmDZZFcJC3s/1jx0izNhdteVDJgL
         SjmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794860849; x=1795465649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZkpeCXY/OBNvM74rLLOtFZSJQsZ8WTjSCiDSW/uXQt8=;
        b=XUHueja7fTCl518TBN0YXy5rWl6MSwG9BZzfBI9+bRtqQqE4X1OWC6+wNzqJlOdS9i
         m20VOISd+lrIRLqiFsQL9ae7chJ+J6kWrnCbMhPX998AJQ6B/Mqf7EuywNJkRRSQiV+t
         EOqMgik16devK+xORUpdTF+dfNtqJnpu/2ghA1CaF5g+WQaKMgDS1DzgDtRl6lNRuU7/
         LodM89W0AYyKhpmG2TSgV4ejrIqDjIna+DVaSrIr8g/ROCeAdIzSmCZvOIyEhVKkKmWL
         UTVpQDpa4mNYj89vMATjIwvJdR/A7NUhM2gLnkXMDGGAox3mV3WZRYRez89hITqZs8Sv
         AsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794860849; x=1795465649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkpeCXY/OBNvM74rLLOtFZSJQsZ8WTjSCiDSW/uXQt8=;
        b=A7/A8sxmZOkiqxu+Q1Wo/sIuSKXgnyLtqGcWug3t9R7su9fSUNeSMeyQN5jaY6RkXk
         axzxZwv2zFSEa1w5lHm3lZZzbh2Hjh/7T4SegctlQF8fZ0yYdMxz6YXkoKahyOuC9sK+
         hz3Ajvrsju7U+xlnVGQlWM3mE+mWe70n6aqBhY4woJpwo2kIOHpLKdSVvoiNtyb9IepW
         a8jy0kj7OKPKDY9/Q0g5YuAn0w+IKZdCJTbVredzVbbE8kK25MCiXL0qrzX4hIiexKo0
         0qgI1Gqdl7s19Dd9f66WBi6BizpQhpNdZifhEfeVUtSORk31sZSCFSiXMDyv5SWsaxcc
         knDA==
X-Forwarded-Encrypted: i=1; AL+hErFxSPw2uHnpgjw8UznqSYRh0mWmizwNq9IGZBOBvJ5Rk5263fKXjgQxE23EJJWE6/n0zRVZhWCcloQMzPPwPik=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tVJV7iPUKnG5ieh1ynxvUh78urdH5OgqUGeN/87HU7fP5UVWN
	UJMYYAiSoMnoRscd31eFeHdVhXgohPQD4l2FVHeYVcby2N4voUcjfwrcjd5kbUTqXwNDYmZJcW9
	OIVWluh0LiW1SRt6lJarTkOjgC91R0dAktteMVjA=
X-Gm-Gg: AYBFou2YQYEk/niL8Z+Iw5VquhME+ypaqeifzzPogw+AeNbaEx+SNdWC+rac4OWhvVB
	BJwnwmJ1y+z5EachF7XqOulkhxdssi1UvRk9ebqeNVAwpOo7hTVZYU1uM4vznYUZnYLgJyQN3T1
	+5cQdil3xQwqOYgviwRmcF1MeRtYzcn69AALS8YO7rvoJsFLPUmsIdqEnh7789CDYJ6w3WgI1kh
	J+g3S3TqUuzlHyh2zYHkX0L2lUtjneCf0tG94TsLk0IgjenvUfcEaXoH/KK0zIjFiYI4YGpIyT1
	5vFffVJ3in1YQax+ZlyH5KAmo97l/Rhk3vl9bNXZJ7TlewMJznlNgIzYi8mVi1Z/leoNbs8IXtw
	u5FEtO9RHWwzd3pHC/chTA4DQgfjCWQtnIM11tzYWKRt926IAR3gnTXvJgdfv/Hm3f9/+GtPSMM
	lTtMm+VKh66z83GtmrNwWVm0JVuPiDqj7jYs0gwsXanlvGLbmKZRU4gRIFP+/fUkRXlN2qoPrXn
	tEl6tunQNbvv7XcXk/dkR222sQz+pzKFsyPp5ZkhMcPLZt4/OAmug==
X-Received: by 2002:a05:600c:46d5:b0:4a5:87b3:ddc1 with SMTP id
 5b1f17b1804b1-4bb55a8329amr246833655e9.13.1794860848685; Mon, 16 Nov 2026
 12:27:28 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 16 Nov 2026 12:27:16 -0800
X-Gm-Features: Aa3M54pXKunFamkiknQGUyYNbbElkQwhbPGbBu1ME19Fs6k0HydAJH4S3zC-RSY
Message-ID: <CANDhNCrsMh-7njT9HhiSf2nhPNCzyEOf6PmzfGw45m0wBTXVcg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] sched/proxy: fixes for proxy execution, with selftests
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	connoro@google.com, arighi@nvidia.com, akpm@linux-foundation.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:26=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> Hi John, Peter,
>
> This series fixes six problems of proxy execution, and adds a test
> module and a selftest for them. I found them while I looked at how
> SCHED_DEADLINE priority inheritance could move to proxy execution.

Hey Mathieu!
  Thanks so much for sending these out!  I've unfortunately been
completely underwater since LPC, so I've unfortunately not been able
to be very responsive on the list (and apologies also to everyone
who's sent patches or feedback to my last revision of the patch set).
But I have been collecting some fixes that have come up during this
time to include in my next submission. I think there is some overlap
in a few cases where we've both tried to fix the same problem, I'll
try to get some quick feedback on your patches and see what I can pull
into my pending set as well here.

I'm really excited for the additional test cases!

Thanks so much again!
-john
