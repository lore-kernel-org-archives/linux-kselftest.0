Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A3B3890EE
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 20:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772568529; cv=none; b=ccnPSgMRMAexZCox8L04CBb6jcxLykI/J5xZE99QBp19pqIlXrcPA2caTBo+wtZmTA6oMACDnHCJ40ptk0nJH4LH6FCFSZKi3AtKQFnANsEPaQ61EydKzwWSVgRDNGd60HPisG35pQZeCJ+wqluX0vFtwV2l7o8+JXAIVsb3nbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772568529; c=relaxed/simple;
	bh=ISEtte2YRGcmWkrcUHpDS6PMfMZOWkZs5vlInnwzUbA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=csHtuJ/ORPvT5KgwQ/8n2Vw0F92X05PQTwT9IvndGvjDgmLIQdRWeXtnNtmnd69oBNZhv+WBnkyQYS1qBIb/Pk1cYBaSZYykLOFmc777aK6MCy1M+oUrkbKSQ2gCMFmBlGAPqkkQU9wMUE4VwZLKnhgkSnPqzHsAr7DeWZV9LOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJkcv25a; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJkcv25a"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1275910b930so3701433c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 12:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772568528; x=1773173328; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9yF/aUyo6FiFRr8w9SYSbT1Zd6hZOeTGHVjT13l1hoE=;
        b=HJkcv25afmCkUv3iLfkgKqnRrPxiIGQbc8eY35jXJy2JamiAwn6n+/2NrnoDWeeH+F
         Ip89KJrdxqwG/DdWvI8V+oGBpiPYQgGPHrcvJ4PZy7kVhgCUs83bPytcLGrLM9OWpT16
         BAutvlZgJ/+dH1cy6mMst6RE0mYgTyIZe/tSWqMgHN6xJ177tc0c2fD39iYPWN4kAPEm
         H0ZEpGSZI39jS1xfKxgKF7PTe6cKc1h0egdst2bOgB7VLoQ6MjFbNKX9x/hg7KuhPOVl
         qeOqm6/OtPMb0BO24N/AkfeJAClt91AgJjl5Rhi5zQDBsqApA++M+hql2kY9r9JvOPDE
         aNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772568528; x=1773173328;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9yF/aUyo6FiFRr8w9SYSbT1Zd6hZOeTGHVjT13l1hoE=;
        b=qKxA3HlQxmWTsOlXzA+zKOtNgTfO6NtwwSvpXmC26VxGQOX9Za8kl8dRXIdbvV4vtf
         Mo3KoXKBotqAI6zYRm68hD6rxTVDS/3X8+QQD5Wm2nKK8Q0d/eqY26juJt5QLHBHxok2
         bkmN66nPuN2VNGFteYh3M+sXBpBhRkcyy8gaIEqlLxsud057+nJqW69cPYIW28/HXgoX
         CaaRg0gU0RzhwZCQIQCPTpV5vjxi1qvQD0pA7ToEq4tDYcNl17NPjaglTU0rOQyvJd/N
         ASDCAHMjdUSIZAvAWUNqp5WQ8amCC+E3sKYUh0qlJnj7wI2gESBB3s9nKFezoL9or6D2
         8q/w==
X-Forwarded-Encrypted: i=1; AJvYcCVZM51/J15mgTHY9Z5rGzhwuxgcVHH0O4yqGPn6Z3nW4Be3TnQf/TkHGjnyzr/MAHppxbCNesymJhZjRPZ5oQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxscoKI4NoEMzMWcBN4HWeQMtjV25BEtZ0lhDq3MuzkvHK2UDC0
	ldXJiCdytsW7odkBQKoVuyYypr7W0rmNXy+feh071AIhTwHFjGgtq+bS
X-Gm-Gg: ATEYQzzNJwLESWpwlXQ1p4WiZhRrub4Fx2nZc8oDi3m9wgPBnJf3pHenHVwkxmbhtpc
	9c6PZIrUsVjbPc9JoydM75FYWL0u9lX5jFxbW/3CmVwsmBJmBdAkR31rcXpESRg7qh5BcVW2r9b
	6dbMr2iYXweizUbkt6HDao99YvKlznLPuzSftTpM5+lcBbI7uWjqw4KAf4XP4PFy+AE0B8yE/cu
	f3jPBMgoIsF4hdSmVAvGe8oL9MNafdV3R5rwZe+LcvjoOrwbKoPKLHMUp/XHqSrNwHo2tHNvjEb
	+Q2tmStxfpgK4dcxsRjAKNzgIj/hOWYAnPf8k6N7XT7y9jnBShQC6nU+96pd9WhW9GzGhMVtUNF
	ZQ2AaBmdzAkJWzi6EzeSBrYFV61tThZdtsphMv2AY0tmiMbTupVGDZOPAmaf8+APeAiAr4Wyrx4
	5ycQdEQ+LBbPJ2fEs1BK5sps7E8LxMqzt1RkeIBvZf2H9mFYb45g55zxqGMKftzPuLIHbgluRzT
	NDhJlL3
X-Received: by 2002:a05:7022:7a3:b0:127:9432:485f with SMTP id a92af1059eb24-128b0ce47b5mr1159115c88.5.1772568527731;
        Tue, 03 Mar 2026 12:08:47 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:bf8e:1331:ef2b:145d? ([2620:10d:c090:500::3:4473])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a32633sm20160083c88.9.2026.03.03.12.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 12:08:47 -0800 (PST)
Message-ID: <24dceff5bf15b6c3e204c69617ac249de497b034.camel@gmail.com>
Subject: Re: [PATCH bpf-next v4 2/2] selftests/bpf: Add trampolines single
 and multi-level pointer params test coverage
From: Eduard Zingerman <eddyz87@gmail.com>
To: Slava Imameev <slava.imameev@crowdstrike.com>, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, 	jolsa@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, 	pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, 	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 netdev@vger.kernel.org, 	linux-kselftest@vger.kernel.org,
 linux-open-source@crowdstrike.com
Date: Tue, 03 Mar 2026 12:08:44 -0800
In-Reply-To: <20260303095427.38981-3-slava.imameev@crowdstrike.com>
References: <20260303095427.38981-1-slava.imameev@crowdstrike.com>
	 <20260303095427.38981-3-slava.imameev@crowdstrike.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-03-03 at 20:54 +1100, Slava Imameev wrote:
> Single and multi-level pointer params and return value test coverage
> for BPF trampolines:
> - fentry/fexit programs covering struct and void double/triple
>   pointer parameters and return values
> - verifier context tests covering pointers as parameters, these
>   tests cover single and double pointers to int, enum 32 and 64,
>   void, function, and double pointers to struct, triple pointers
>   for void
> - verifier context tests covering single and double pointers to
>   float, to check proper error is returned as pointers to float
>   are not supported
> - verifier context tests covering pointers as return values
> - verifier context tests for lsm to check trusted parameters
>   handling
> - verifier context tests covering out-of-bound access after cast
> - verifier BPF helper tests to validate no change in verifier
>   behavior
>=20
> Signed-off-by: Slava Imameev <slava.imameev@crowdstrike.com>
> ---

Again, I probably miss a point, but with current implementation it
seems sufficient in verifier_ctx_ptr_param() to add one or two
tests accessing void** or similar and checking verification log
to validate that parameter has expected type scalar().
Why so many tests are necessary?

[...]
