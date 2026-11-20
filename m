Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217035;
	b=vMKpEEmOwKp5q45Au68aBnt5RMiFI0HBD+RnC+hr0+DD6xufCc9QBHOBOQe8m55+siIx
	 EWuwIRd4MITYpgOXUTse/A3yKXtzxJ3suETft5mb2lsk9V7Lbnes57MVgZsxftABpFfQy
	 6zjnJEgEM2doKi8mfz7R4ZD0D8VXoiF/80r1pRPsDho6CZzMOVRIpxN73uA75qYsPb9DM
	 RNRjrKT8R49V0UVYGm2CTJQx8yBQ2pDXis5TZhAe1AAd45JS//bFse06/j8uaW8J7ewv2
	 eqLw4g3/TTYSiIKCLMpejmDTLq91DbKt+iuG4ZQ2RRxoyHdYrLn8pL1at1Dnk6yk0jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217035;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=QsMsrSVzccV/M4rLUJzb8bjMzW9z/0kzllqgzjAO/iM=;
	b=oOtTtmu7ed2hky4wq+vfxOI4PxNUcZiZ+Oqm1kyaX77+64kxWnwpF5jjT4DwTobiB5mi
	 GHtWUbHNmYaaOtNSRnOnpBR2xG8hx/DlsBWuVnnnLFMytIRw9agMCd6iJT6vsS7TOv+0M
	 ymg76qy44ld6EIVEOSlmkUzR/IXKBYxgzkOMIkPYaA/ixDJpN2JzeigGvIwQYBhguvsAn
	 fN/xFeMCyvJkYL5ZQjAiAtkPxDGoR44wlpKZMvkByqamnLJ3Eq+DCDi5nvoprktEjBToJ
	 iPLaEqqES2ebjJRt/uo0sP1vU7GS9dX4EZiSXp0Wd/pQKsIJOD9BKlV3szJtosoeN+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283C960A260D
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 23:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 283C960A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c1f548f87so20546716d6.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 15:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217034; x=1795821834;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsMsrSVzccV/M4rLUJzb8bjMzW9z/0kzllqgzjAO/iM=;
        b=zzxKhaXM4Gsm7c2OCFKe3ZaxUqrMpVWuDtgNL4fnP8yrBYWX6dX0+/C9GHwJK7tzok
         aBm/hTbA77pvcmCcKfKAklHwp8BVlSBPQlD3ghgrxDEV8UZhB8s1zWXcHgKmgjw5zAhp
         YU5GV72SDKCAPaN4RMOMqPu5epMO98YGTmmrHZmtt542rDhCfyNju1S8BdRmS6tC6xuk
         P0gDg83eBitc+qBdsHnXaOymM/revXZ/OfEtHt+JtWeRass7PVzM4GGL/7VukZe+WKid
         FXCx6J+oRdIOKEsDcL1jzKvc0ExriDDPbmofUZK/m0NOcjaZUUJYezl/DaqDgIfTGtb4
         qtFQ==
X-Forwarded-Encrypted: i=1; AL+hErGXnqow0QSZqPRUw3Yt40MmQ/aaExoFeMjdxV4iFdpNeRHK36rW3MW0MPuQX0BCo0qeEqnT4CQErt8/g+IgB2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kGTERsMMFNi92ha/E0TRkudJ603JV//iMEZwPv+17/tsz25Xu
	GxIqdtAw+4V6hSqBy7Jb8qGFl8j7YxTU5Ay/wLxOaual3SmsGnaUs4cH
X-Gm-Gg: AZFdTZfZNccxxA1mhosVq2jcByVY5R2pB3xh+wL7ik/yZ425SoQWrhNaWrMabzd0ZpS
	6X0xV0kKDy6OPhye6r7Sx/Og5VaR8F/F4Q5sz37TRkIPeqA/c5hufDWw4LjIVRRUDp6+Ft8AmaE
	F0tQ5RmwX4zmIRfye1Qc7Scw2RrTK5oCCsOQ7OioVcWeFiZH5VYlG6Gql/mk2ZT3MnOU6WQYcaQ
	LkxTA4ME5xU/N2yEoMGyNMvRiSDVhDdg3oecop5j1ICzZ68+MmQpc6nID5Jm48x8r9b6M0bv4KT
	WtF7sZlQz6u9X72cxhqMvWIRVi4vsw3BI/RO4oRef+rIeYtLkT/m6ucOzKGc5i51gr1wSq82cey
	8bnuu7fgT5fQOsokAGwOMK+BUoeup2DCxPSNkYmwre91jughe3SFuwvQucEDohOn1k5X5vFMYlT
	hd9MecUa3PZCEpKG6f2d4kH+0ywAlHQsZ7tg4VJEysfD1DWg8OgE4f5gMJol8deW9t+pJrucvsW
	3vPliPsThht/dNci9arqYikW63K8PD3hT34y3RmBM4TH0BVnBEberfdsPp1ATm1LqNlu6iYj1XD
	n6TJiAF0KQCzTxscGmoJjzP5IB3PGk885/uRy4hDkPkJ1z50buCaBMH7etzXEByX8qRkXV4UANT
	0JFnXaEiJdDpc1CMyVPqkKS3c7kOLgIaSbe7RLBn39bCqiK6sY0SpaeOupbZYyaaxF4P0WmrHHl
	o=
X-Received: by 2002:a05:6214:498c:b0:921:3f58:a52a with SMTP id 6a1803df08f44-9213f58a5e2mr40412176d6.10.1795217033088;
        Fri, 20 Nov 2026 15:23:53 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a2806dsm37455776d6.45.2026.11.20.15.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:23:52 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, shuah@kernel.org, arighi@nvidia.com, xukuohai@huawei.com, billy@starlabs.sg, void@manifault.com, ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, awerner32@gmail.com, andriin@fb.com, martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH bpf-next v3 6/8] selftests/bpf: Refactor lifetimes and test wakeups
Date: Fri, 20 Nov 2026 17:38:22 -0500
Message-ID: <179521430209.33161.791368362708058227@kernel.org>
In-Reply-To: <7d0a57117d3a4bac7aab7808335393ef3328333d04b7f67d1aa2f492959e3ff0@mail.kernel.org>
References: <20261120-bpf-ringbuf-fixes-v3-6-ff7ca15d6c37@kernel.org> <7d0a57117d3a4bac7aab7808335393ef3328333d04b7f67d1aa2f492959e3ff0@mail.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

> Could it say what problem the lifetime rework addresses,

Split in v4. The lifetime fix explains how an early return
could free the ring buffer while its polling thread was still running.

> [...]

> so the state is updated in one place?

Added try_join_thread() to update ownership after a successful try-join.
