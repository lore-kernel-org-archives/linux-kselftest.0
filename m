Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A7740B6DE
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 17:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781543982; cv=none; b=SX6P1jymVXaZc/o0L5Qi8Pw0Vy45E1ou+g03x3GBx6R4oxhZ1xHR6cPGPHV73zoJjH6zR+asMw1AopTPz9Y6qd86dKMcMERiFRSJ9bRSbzG1eO48dB2urajpWYMvLOICQoIv+bJ4c7Jr8vL1WnOIaX/WohZ+CyO/0k7chjgENH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781543982; c=relaxed/simple;
	bh=pc+4G2GsAw6cjwEmMrzoIc5kPC5M4vvHq6buvisX8qI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CTZenBzXdJupTZGmOPwU9HexrvefMUNYhSfhfHGy0ckuyCjTXIZVUfJ4q7rW8H/DO0NQhj/+SGUOk9O0iA3cCqasw15Qsf16jU7xW+VHZshH95b5Cpr07IcsmXCe1+fN+b0qXUn0NkpQLKB6mm3pqNwHhdyPQZ6gKxocYUdUQ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YE/aFE9Y; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE/aFE9Y"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30b6dad2382so2683226eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 10:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781543981; x=1782148781; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pc+4G2GsAw6cjwEmMrzoIc5kPC5M4vvHq6buvisX8qI=;
        b=YE/aFE9YM7Tcm/AOvEyWwt9hS8yQ0bb3Mc6FWS8QDhyJp5fmZcFZkZWOlnrSMAGWCx
         PIGlIkcQuzlfsqJLU3aJ4lnROjpfK81GiPSlWWbCWPbdbP0Vw9sN86GGvmj4Vy3X3dJB
         qz3ECpdpUoa3l9nsqhuEoOQFKWo0cXho1NEInwgGwclVSJPzJ70bIG1zKP8FKDF2uHJR
         CtpiZeeQjXuZMT4lQJg4ZIyDG/W6oxS4CDB7p6sVaLt/MPoEqYmiEoS2K20rUVZ+Tofo
         m/DZv0L4Yqxxr4zPe3pl7rOg9tZ67h1T8NfzvKx1gL6kUgaVlQx3Nq40GTmjSTsk1dO2
         23LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781543981; x=1782148781;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pc+4G2GsAw6cjwEmMrzoIc5kPC5M4vvHq6buvisX8qI=;
        b=CdKwsbzFND+j0B7PV7l5GaEn0DnEea6d8X9Yhrys2RP37FuemFosOybO+7KvlpYvVH
         kHMTzJPumot4fD9Z/suks98/qVrZfEewPirBdkEviKYQ97/SdJXKs/LiIdUL5HDAZLk/
         KIPUygoTy57X1mcZ6CQQFqGEtJbKYzsd1n5AP4vttqz4DcPTDVfAu0PjgiynnjHxel3U
         ycnAJTTF4RQ1lvo1KYVDgMQRRkJ8CgwuHHnAGqzHrv35IgTkdIjdKv9i7Y6qWBbGYxiA
         DiFxNkq8eMkVg+Z//uAKnD7bek1AdVbxyjhUGRZlOxtE5HL47ocORrot5DB37RArri1x
         8+tQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sUR3j9tjlNbOFYl0L1lsKbomRotCJE6DH5t/6eAckWWL/wbM2wJU/NBDjjPGCPwHoYCk6O7ezPSmGSeLhryo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9PhOWoFZEWPQGVaUJGVX+lJU/iak6XfaLXtsW2CSS3a7hfOjA
	UK3qxY7uW6/Fck09aDLc0uSakF9iMs8iv/b2EDpLQs1zcnuY5QIIBUsy
X-Gm-Gg: Acq92OGN2O7HwnNOKueBzG/z1ewE1J4AI4CbGRxKur22Ea0bhhSbCH1hjSTcomaD01e
	Y3FwxTxGKdvzraNvmOA994u4yeDz+MUagHzsxv5DS2t74PB3GrRKNrOXJq6rF3Z6vJRL3Wuz7fp
	YT/49rvziFnSeXY7QUPdn9NSQCyP8Tzdh5NTJYrP75SJfH0zVN0eERA2Y850pciCcRs5lo9fcHJ
	hwL0IeCQPg9Zc7CPo3PWliBW7rN8RZHAXI52mzVbfIaiGy4w7acb851v1y82Om2E/3YhX3HIn5G
	JdKDGjfIXaFhR9vyab+OfMkm4yRFPyen1TnHhvZPCfgJk3EJXJR3EJGoWvHkKI30yuGy6goiy7j
	cB+DNMTeVpsIQm3cCyXOHcmArVyQik1hYKqsnS9VH0C6kJAl3VkwHP+Z8c1/gWycdrcOXLD3Zj5
	1QPzDXvveHH8FxPnceYxqD7wjDnvI1tz17h2F/uppHMt4OZMkwgClWXe5x0LU5pBQGRRAQ0hk99
	srt6/DmfJeZPN1bnA==
X-Received: by 2002:a05:7300:3212:b0:2ea:b85c:153d with SMTP id 5a478bee46e88-308200b5d75mr8177066eec.27.1781543980562;
        Mon, 15 Jun 2026 10:19:40 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:755:4880:8bc0:de02? ([2620:10d:c090:500::3:317a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e4898c0sm16011974eec.3.2026.06.15.10.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:19:40 -0700 (PDT)
Message-ID: <703aeb9e7f93fa35f992fde04f6999974475312e.camel@gmail.com>
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Cover half-slot cleanup of
 pointer spills
From: Eduard Zingerman <eddyz87@gmail.com>
To: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>, Martin
 KaFai Lau <martin.lau@linux.dev>, Song Liu	 <song@kernel.org>, Yonghong
 Song <yonghong.song@linux.dev>, Jiri Olsa	 <jolsa@kernel.org>, Emil
 Tsalapatis <emil@etsalapatis.com>, Shuah Khan	 <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Date: Mon, 15 Jun 2026 10:19:38 -0700
In-Reply-To: <20260615-f01-06-half-slot-pointer-spill-v1-2-47f1c18a8965@mails.tsinghua.edu.cn>
References: 
	<20260615-f01-06-half-slot-pointer-spill-v1-0-47f1c18a8965@mails.tsinghua.edu.cn>
	 <20260615-f01-06-half-slot-pointer-spill-v1-2-47f1c18a8965@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-06-15 at 16:09 +0800, Nuoqi Gui wrote:
> Add a verifier regression test for a pointer spill whose high half is
> cleaned dead while the low half remains live. Force checkpoint creation
> with BPF_F_TEST_STATE_FREQ and assert the verifier log reaches the
> checkpoint and the subsequent 32-bit fill before rejecting the partial fi=
ll
> from a non-scalar spill.
>=20
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]
